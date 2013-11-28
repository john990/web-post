package com.psy.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by kai on 11/28/13.<br/>
 * Function :
 */
@Controller
@RequestMapping()
public class UserController {
	/**
	 * 登陆页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public static String login(ModelMap model){
		return "login";
	}
}
