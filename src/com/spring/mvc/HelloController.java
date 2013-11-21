package com.spring.mvc;

import com.spring.bean.JavaBean;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping()
public class HelloController {
	@RequestMapping(value="hello", method=RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		System.out.println("println:hello");
		return "hello";
	}

	@RequestMapping(value="bean", method=RequestMethod.GET, produces= MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody JavaBean[] printJson() {
		System.out.println("println:qqqq");
		JavaBean[] beans = new JavaBean[10];
		for(int i=0;i<5;i++){
			beans[i] = new JavaBean();
		}
		return beans;
	}
}