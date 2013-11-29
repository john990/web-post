package com.psy.controller.user;

import com.psy.base.utils.AjaxUtils;
import com.psy.bean.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
		System.out.println("login");
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
	public String processSubmit(@Valid User user, BindingResult result,
	                            @ModelAttribute("ajaxRequest") boolean ajaxRequest,
	                            Model model, RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error : errors){
				System.out.println(error);
			}
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
			return "redirect:/form";
		}
	}
}
