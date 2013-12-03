package com.psy.common;

import com.psy.base.io.Read;

/**
 * Created by kai on 11/28/13.<br/>
 * Function : SQL语句
 */
public class SQL {
	public static String HAVE_USER_NAME = Read.readSql("have_user_name.sql");
	public static String HAVE_USER_EMAIL = Read.readSql("have_user_email.sql");
	public static String ADD_USER = Read.readSql("add_user.sql");
	public static String VALIDATE_USER = Read.readSql("validate_user.sql");
}
