package com.psy.controller.user;

import com.psy.base.utils.AjaxUtils;
import com.psy.bean.User;
import com.psy.common.BeanUtils;
import com.psy.common.Msg;
import com.psy.common.SessionAttribute;
import com.psy.dao.UserDao;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * Created by kai on 11/29/13.<br/>
 * Function : 注册
 */
@Controller
@RequestMapping("/login")
@SessionAttributes(SessionAttribute.USER)
public class LoginController {

    @RequestMapping(method = RequestMethod.GET)
    public String login(HttpSession session, ModelMap model) {
        // 已经登录
        Object sessionUser = session.getAttribute(SessionAttribute.USER);
        if (sessionUser != null && sessionUser instanceof User) {
            User user = (User) sessionUser;
            if (!BeanUtils.isEmptyUser(user)) {
                return "redirect:/home";
            }
        }

        // 需要登录的页面跳转
        Object needLogin = session.getAttribute(SessionAttribute.NEED_LOGIN);
        if (needLogin != null) {
            model.addAttribute("message", Msg.NEED_LOGIN_AUTHORITY);
            return "login";
        }
        return "login";
    }

    @ModelAttribute(SessionAttribute.USER)
    public User createFormBean() {
        return new User();
    }

    @ModelAttribute
    public void ajaxAttribute(WebRequest request, Model model) {
        model.addAttribute("ajaxRequest", AjaxUtils.isAjaxRequest(request));
    }

    @RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String processSubmit(HttpSession session,
                                @Valid LoginUser user, BindingResult result,
                                @ModelAttribute("ajaxRequest")
                                boolean ajaxRequest, Model model, RedirectAttributes redirectAttrs) throws JSONException {
        if (result.hasErrors()) {
            List<FieldError> filedErrors = result.getFieldErrors();
            JSONObject jsonObject = new JSONObject();
            for (FieldError error : filedErrors) {
                jsonObject.put(error.getField(), error.getDefaultMessage());
            }
            redirectAttrs.addFlashAttribute("user", user);
            redirectAttrs.addFlashAttribute("message", jsonObject);
            return "redirect:/login";
        }

        User sessionUser = UserDao.validateUser(user);
        if (sessionUser != null && sessionUser.getId() != 0) {
            session.setAttribute(SessionAttribute.USER, sessionUser);
            redirectAttrs.addFlashAttribute("message", "登陆成功");
            session.removeAttribute(SessionAttribute.NEED_LOGIN);
            return "redirect:/success";
        } else {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("validate", "邮箱或密码错误");
            redirectAttrs.addFlashAttribute("message", jsonObject);
            redirectAttrs.addFlashAttribute("user", user);
            return "redirect:/login";
        }
    }
}
