package com.psy.controller.post;

import com.psy.controller.authority.Login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by kai.wang on 12/4/13.
 */
@Controller
@RequestMapping("/new")
public class CreatePostController {

	@Login
	@RequestMapping("post")
	public String createPost(ModelMap model) {
		return "new_post";
	}

}
