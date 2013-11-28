package com.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by kai on 11/28/13.<br/>
 * Function :
 */
@Controller
@RequestMapping()
public class UserController {


	@RequestMapping(value = "login", method = RequestMethod.GET)
	public static String login(){
		return "login";
	}
}
