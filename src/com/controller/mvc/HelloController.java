package com.controller.mvc;

import com.base.bean.User;
import com.base.db.DBManager;
import com.base.db.QueryHelper;
import com.controller.bean.JavaBean;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping()
public class HelloController {
	@RequestMapping(value = "hello", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		System.out.println("action:hello");
		String sql = "select * from user where id > ?";
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		List<User> users = QueryHelper.queryBeanList(runner, User.class, sql, "0;delete from user where id=1;");
		for (User user : users) {
			System.out.println(user.getName());
		}
		return "hello";
	}

	@RequestMapping(value = "bean", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public
	@ResponseBody
	JavaBean[] printJson() {
		System.out.println("println:qqqq");
		JavaBean[] beans = new JavaBean[10];
		for (int i = 0; i < 5; i++) {
			beans[i] = new JavaBean();
		}
		return beans;
	}
}