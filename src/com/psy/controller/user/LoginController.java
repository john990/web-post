package com.psy.controller.user;

import com.psy.base.utils.AjaxUtils;
import com.psy.bean.User;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

import javax.validation.Valid;

/**
 * Created by kai on 11/29/13.<br/>
 * Function : 注册
 */
@Controller
@RequestMapping("/login")
@SessionAttributes("user")
public class LoginController {

	@RequestMapping(method = RequestMethod.GET)
	public void login(ModelMap model) {
	}

	@ModelAttribute("user")
	public User createFormBean() {
		return new User();
	}

	@ModelAttribute
	public void ajaxAttribute(WebRequest request, Model model) {
		model.addAttribute("ajaxRequest", AjaxUtils.isAjaxRequest(request));
	}

	@RequestMapping(method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	public String processSubmit(@Valid LoginUser user, BindingResult result,
	                            @ModelAttribute("ajaxRequest") boolean ajaxRequest,
	                            Model model, RedirectAttributes redirectAttrs) throws JSONException {
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
			return "redirect:/login";
		}
		if(UserDao.validateUser(user)){
			redirectAttrs.addFlashAttribute("success", "登陆成功");
			return "redirect:/success";
		}else{
			redirectAttrs.addFlashAttribute("error", "用户名或密码错误");
			return "redirect:/login";
		}
	}
}
