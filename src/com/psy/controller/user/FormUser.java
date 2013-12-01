package com.psy.controller.user;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by kai.wang on 11/21/13.
 */
public class FormUser {

	private int id;

	@NotBlank(message = "用户名不能为空")
	@Size(min = 2, max = 15, message = "用户名长度不正确")
	private String name;

	@NotBlank(message = "密码不能为空")
	@Size(min = 6, max = 20, message = "密码长度不正确")
	private String password;

	@NotBlank(message = "邮箱不能为空")
	@Email
	@Size(max = 30, message = "密码长度不能大于30位")
	private String email;

	private String avatar;

	private String type;

	private String createAt;
	private String updateAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCreateAt() {
		return createAt;
	}

	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}

	public String getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(String updateAt) {
		this.updateAt = updateAt;
	}
}
