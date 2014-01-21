package com.psy.controller.post;

import com.psy.bean.view.ViewPost;
import com.psy.dao.PostDao;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by kai on 1/12/14.<br/>
 * Function : 文章页面
 */
@Controller
@RequestMapping()
public class PostController {

    @RequestMapping(value = "post/{id}", method = RequestMethod.GET)
    public String home(@PathVariable int id, ModelMap model) {
        long start = System.currentTimeMillis();
        ViewPost post = PostDao.findPostById(id);
        if (post == null) {
            return "404";
        }
        post.setCreateAt(post.getCreateAt().replace(".0", ""));
        model.addAttribute("post", post);
        System.out.println("time:" + (System.currentTimeMillis() - start));
        return "post";
    }
}
