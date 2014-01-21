package com.psy.controller.user;

import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Size;

/**
 * Created by kai.wang on 11/21/13.
 */
public class LoginUser {

    private String name;

    @Size(min = 3, max = 30, message = "邮箱长度不正确")
    @Email(regexp = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$", message = "邮箱格式不正确")
    private String email;

    @Size(min = 6, max = 20, message = "密码长度不正确")
    private String password;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
