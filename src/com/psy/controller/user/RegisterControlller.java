package com.psy.controller.user;

import com.psy.base.utils.AjaxUtils;
import com.psy.bean.User;
import com.psy.common.Msg;
import com.psy.common.SessionAttribute;
import com.psy.dao.UserDao;

import org.json.JSONArray;
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
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("/reg")
public class RegisterControlller {

    @RequestMapping(method = RequestMethod.GET)
    public void reg(ModelMap model) {
    }

    @ModelAttribute(SessionAttribute.USER)
    public RegUser createFormBean() {
        return new RegUser();
    }

    @ModelAttribute
    public void ajaxAttribute(WebRequest request, Model model) {
        model.addAttribute("ajaxRequest", AjaxUtils.isAjaxRequest(request));
    }

    // 检查用户名是否注册
    @RequestMapping(value = "/has_user_name", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public
    @ResponseBody
    JSONObject hasUsername(RegUser user) throws JSONException {
        JSONObject json = new JSONObject();
        if (UserDao.hasUsername(user.getName())) {
            json.put("code", "error");
            json.put("message", Msg.USERNAME_ALREADY_REG);
            return json;
        }
        json.put("code", "ok");
        return json;
    }

    // 检查邮箱是否注册
    @RequestMapping(value = "/has_user_email", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public
    @ResponseBody
    JSONObject hasEmail(RegUser user) throws JSONException {
        JSONObject json = new JSONObject();
        if (UserDao.hasEmail(user.getEmail())) {
            json.put("code", "error");
            json.put("message", Msg.EMAIL_ALREADY_REG);
            return json;
        }
        json.put("code", "ok");
        return json;
    }

    // 注册验证及添加数据库
    @RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public String processSubmit(HttpSession session,
                                @Valid
                                RegUser user, BindingResult result, RedirectAttributes redirectAttrs) throws JSONException {
        if (result.hasErrors()) {
            List<FieldError> filedErrors = result.getFieldErrors();
            JSONArray jsonArray = new JSONArray();
            for (FieldError error : filedErrors) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put(error.getField(), error.getDefaultMessage());
                jsonArray.put(jsonObject);
            }
            redirectAttrs.addFlashAttribute("error", jsonArray);
            redirectAttrs.addFlashAttribute("user", user);
            return "redirect:/reg";
        }

        // 检查用户名/邮箱是否存在
        JSONArray errors = new JSONArray();
//		if (UserDao.hasUsername(user.getName())) {
//			JSONObject jsonObject = new JSONObject();
//			jsonObject.put("username", Msg.USERNAME_ALREADY_REG);
//			errors.put(jsonObject);
//		}
        if (UserDao.hasEmail(user.getEmail())) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("email", Msg.EMAIL_ALREADY_REG);
            errors.put(jsonObject);
        }
        if (errors.length() > 0) {
            redirectAttrs.addFlashAttribute("error", errors);
            return "redirect:/reg";
        }

        int userId = UserDao.addUser(user);
        if (userId > 0) {
            User sessionUser = new User();
            sessionUser.setId(userId);
            sessionUser.setName(user.getName());
            sessionUser.setEmail(user.getEmail());
            session.setAttribute(SessionAttribute.USER, sessionUser);
            redirectAttrs.addFlashAttribute("success", "注册成功");
            return "redirect:/success";
        }

        return "redirect:/reg";
    }
}
