package com.psy.controller.post;

import com.psy.base.utils.Utils;
import com.psy.bean.Post;
import com.psy.bean.User;
import com.psy.bean.view.ViewPost;
import com.psy.common.SessionAttribute;
import com.psy.controller.authority.Login;
import com.psy.dao.PostDao;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kai.wang on 12/13/13.
 */
@Controller
@RequestMapping("/manage/")
public class ManagePostController {

	private static final int PER_PAGE_SHOW = 10;

//	@ModelAttribute("posts")
//	public List<Post> createFormBean() {
//		return new ArrayList<Post>();
//	}


//	@Login
	@RequestMapping(value = "posts/{page_param}", method = RequestMethod.GET)
	public String manage(@PathVariable Object page_param,ModelMap model) {
		System.out.println("page:" + page_param);
		int page = Utils.toInt(page_param);
		if (page == 0) page = 1;
		List<ViewPost> list = PostDao.findPostByStatus(Post.STATUS_NOT_AUDIT,page,PER_PAGE_SHOW);
		model.addAttribute("posts",list);
//		JSONArray array = new JSONArray(list);
//		System.out.println(array);
		return "manage_post";
	}

}
