package com.psy.controller.home;

import com.psy.bean.User;
import com.psy.controller.authority.Login;
import com.psy.controller.authority.ResultTypeEnum;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by kai on 12/4/13.<br/>
 * Function :
 */
@Controller
@RequestMapping("/")
public class HomeController {

	@RequestMapping(method = RequestMethod.GET)
	public String home(HttpSession session,ModelMap model) {
		model.addAttribute("message","首页，HomeController.home");
		User user = (User) session.getAttribute("user");
		model.addAttribute("user",user);
		return "home";
	}
}
