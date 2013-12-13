package com.psy.controller.post;


import com.psy.bean.User;
import com.psy.common.BeanUtils;
import com.psy.common.SessionAttribute;
import com.psy.common.SessionUtils;
import com.psy.controller.authority.Login;
import com.psy.dao.PostDao;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * Created by kai.wang on 12/4/13.
 */
@Controller
@RequestMapping("/new/post")
public class CreatePostController {

	@Login
	@RequestMapping(method = RequestMethod.GET)
	public String createPost(ModelMap model) {
		return "new_post";
	}

	@ModelAttribute("post")
	public FormPost createFormBean() {
		return new FormPost();
	}

	@RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String processSubmit(HttpSession session,
	                            @Valid FormPost post, BindingResult result,
	                            RedirectAttributes redirectAttrs) throws JSONException {
		if (result.hasErrors()) {
			List<FieldError> filedErrors = result.getFieldErrors();
			JSONObject jsonObject = new JSONObject();
			for (FieldError error : filedErrors) {
				jsonObject.put(error.getField(), error.getDefaultMessage());
			}
			redirectAttrs.addFlashAttribute("post", post);
			redirectAttrs.addFlashAttribute("message", jsonObject);
			return "redirect:/new/post";
		}

		Object oriUser = session.getAttribute(SessionAttribute.USER);
		User user = null;
		if(oriUser != null && !BeanUtils.isEmptyUser( user=(User)oriUser )){
			post.setUserId(user.getId());
			PostDao.addPost(post);
			return "redirect:/home";
		}else{
			SessionUtils.addNeedLoginTip(session);
			return "redirect:/login";
		}
	}

}
