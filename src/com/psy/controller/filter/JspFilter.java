package com.psy.controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by kai on 11/22/13.<br/>
 * Function : 拦截URL禁止访问JSP页面
 */
public class JspFilter implements Filter {
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterch) throws IOException, ServletException {
		System.out.println("JspFilter");
		HttpServletRequest httpreq = (HttpServletRequest) request;
		StringBuffer url = httpreq.getRequestURL();
		//判断地址中是否包含"JSP"
		if (url.indexOf(".jsp") > 0 && url.indexOf("404.jsp") == -1) {
			System.out.println("JspFilter,exception");
			HttpServletResponse httpres = (HttpServletResponse) response;
			//跳转到网站根目录，也可以根据自己的需要重定位到自己的Action
			httpres.sendRedirect("404.jsp");
			return;
		} else {
			//不包含JSP，则继续执行
			filterch.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}
}