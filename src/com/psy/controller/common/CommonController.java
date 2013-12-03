package com.psy.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Created by kai.wang on 12/3/13.
 */
@Controller
@RequestMapping("")
public class CommonController {

	@RequestMapping(value = "success",method = RequestMethod.GET)
	public String success(ModelMap model) {
		return "success";
	}
}
