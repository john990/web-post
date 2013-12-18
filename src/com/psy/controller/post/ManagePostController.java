package com.psy.controller.post;

import com.psy.base.utils.BaseUtils;
import com.psy.bean.Post;
import com.psy.bean.view.ViewPost;
import com.psy.dao.PostDao;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "posts", method = RequestMethod.GET)
	public String manage(ModelMap model) {
		return "manage_post";
	}


	//	@Login
	@RequestMapping(value = "posts/{page_param}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ViewPost> getPosts(@PathVariable Object page_param, ModelMap model) {
		int page = BaseUtils.toInt(page_param);
		if (page == 0) page = 1;
		List<ViewPost> list = PostDao.findPostByStatus(Post.STATUS_NOT_AUDIT, page, PER_PAGE_SHOW);
		if(list!= null && list.size()>0){
			list.get(0).setCount(PostDao.countPostByStatus(Post.STATUS_NOT_AUDIT));
		}
		return list;
	}

	@RequestMapping(value = "posts/count/{status}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public long getPostCountByStatus(@PathVariable Object status, ModelMap model) {
		return PostDao.countPostByStatus(BaseUtils.toInt(status));
	}

	// 批量修改文章状态
	@RequestMapping(value = "posts/edit/status/", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int changePostStatus(@RequestParam(value="status") Integer status,@RequestParam(value = "ids[]", defaultValue = "") Integer[] ids){
		return PostDao.changePostStatusByIds(ids,status);
	}

}
