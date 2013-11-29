package com.psy.bean;

import com.sun.istack.internal.NotNull;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

/**
 * Created by kai.wang on 11/21/13.
 */
public class User {

	private int id;

	@Max(30)
	@Min(2)
	private String name;

	@Max(20)
	@Min(6)
	private String password;

	@NotNull
	@Max(30)
	@Min(2)
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
