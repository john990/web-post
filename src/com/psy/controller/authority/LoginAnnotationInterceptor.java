package com.psy.controller.authority;

import com.psy.bean.User;

import org.json.JSONObject;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javafx.concurrent.Worker;

/**
 * Created by kai.wang on 12/4/13.
 */
public class LoginAnnotationInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Login login = ((HandlerMethod) handler).getMethodAnnotation(Login.class);
		if (null == login) {
			// 没有声明权限,放行
			return true;
		}

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		if (null == user) {
			// 需要登录
			if (login.value() == ResultTypeEnum.page) {
				response.sendRedirect("/login");
			} else if (login.value() == ResultTypeEnum.json) {
				//ajax页面的登录
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=UTF-8");
				OutputStream out = response.getOutputStream();
				PrintWriter pw = new PrintWriter(new OutputStreamWriter(out,"utf-8"));
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("result","false");
				jsonObject.put("msg","需要登录才能继续操作");
				pw.println(jsonObject.toString());
				pw.flush();
				pw.close();
			}
			return false;
		}
		return true;
	}
}
