package com.psy.controller.common;

import com.psy.common.SessionAttribute;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by kai.wang on 12/3/13.
 */
@Controller
@RequestMapping("")
public class CommonController {

	@RequestMapping(value = "success",method = RequestMethod.GET)
	public String success() {
		return "success";
	}
}
