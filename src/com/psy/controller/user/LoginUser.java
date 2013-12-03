package com.psy.controller.user;

import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Size;

/**
 * Created by kai.wang on 11/21/13.
 */
public class LoginUser {

	@Size(min = 3, max = 15, message = "用户名长度不正确")
	private String name;

	@Size(min = 6, max = 20, message = "密码长度不正确")
	private String password;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
