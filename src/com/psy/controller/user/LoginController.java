package com.psy.controller.user;

import com.psy.base.utils.AjaxUtils;
import com.psy.bean.User;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
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
 * Function : 登陆
 */
@Controller
@RequestMapping("/login")
@SessionAttributes("user")
public class LoginController {

	@RequestMapping(method = RequestMethod.GET)
	public void login(ModelMap model){
//		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
//		List<User> users = QueryHelper.queryBeanList(runner, User.class, SQL.USER, "0");
//		for (User user : users) {
//			System.out.println(user.getName());
//		}
	}

	@ModelAttribute("user")
	public User createFormBean() {
		return new User();
	}

	/**
	 * 登陆验证
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login-check", method = RequestMethod.POST)
	public String loginCheck(ModelMap model){
		return "login";
	}

	@ModelAttribute
	public void ajaxAttribute(WebRequest request, Model model) {
		model.addAttribute("ajaxRequest", AjaxUtils.isAjaxRequest(request));
	}

	@RequestMapping(method=RequestMethod.POST)
	public String processSubmit(@Valid FormUser user, BindingResult result,
	                            @ModelAttribute("ajaxRequest") boolean ajaxRequest,
	                            Model model, RedirectAttributes redirectAttrs) throws JSONException {
		if (result.hasErrors()) {
			List<FieldError> filedErrors = result.getFieldErrors();
			JSONArray jsonArray = new JSONArray();
			for(FieldError error : filedErrors){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put(error.getField(),error.getDefaultMessage());
				jsonArray.put(jsonObject);
			}
			model.addAttribute("error",jsonArray);
			model.addAttribute("user",user);
			return null;
		}
		// Typically you would save to a db and clear the "form" attribute from the session
		// via SessionStatus.setCompleted(). For the demo we leave it in the session.
		String message = "Form submitted successfully.  Bound " + user;
		// Success response handling
		if (ajaxRequest) {
			// prepare model for rendering success message in this request
			model.addAttribute("message", message);
			return null;
		} else {
			// store a success message for rendering on the next request after redirect
			// redirect back to the form to render the success message along with newly bound values
			redirectAttrs.addFlashAttribute("message", message);
			return "redirect:/login";
		}
	}
}
