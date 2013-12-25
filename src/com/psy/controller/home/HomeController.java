package com.psy.controller.home;

import com.psy.bean.User;
import com.psy.bean.view.HomePost;
import com.psy.common.BeanUtils;
import com.psy.common.SessionAttribute;
import com.psy.controller.authority.Login;
import com.psy.controller.authority.ResultTypeEnum;
import com.psy.dao.PostDao;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * Created by kai on 12/4/13.<br/>
 * Function :
 */
@Controller
@RequestMapping()
public class HomeController {

	@RequestMapping(value = "home",method = RequestMethod.GET)
	public String home(HttpSession session,ModelMap model) {
		model.addAttribute("message","首页，HomeController.home");
		Object sessionUser = session.getAttribute(SessionAttribute.USER);
		if(sessionUser != null && sessionUser instanceof User){
			User user = (User)sessionUser;
			if(!BeanUtils.isEmptyUser(user)){
				model.addAttribute("user",user);
			}
		}
		// TODO delete this
		model.addAttribute("posts", PostDao.findAllPostList(1,20));
//		model.addAttribute("posts", PostDao.findHomePostList(1,20));
		return "home";
	}
}
