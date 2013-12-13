package com.psy.controller.user;

import com.psy.common.SessionAttribute;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by kai.wang on 12/13/13.
 */
@Controller
@RequestMapping("/logout")
public class LogoutController {

	@RequestMapping(method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.removeAttribute(SessionAttribute.USER);
		return "success";
	}
}
