package com.psy.common;

import com.psy.base.io.Read;

/**
 * Created by kai on 11/28/13.<br/>
 * Function : SQL语句
 */
public class SQL {
	/** 查看用户名是否已经存在 */
	public static final String HAVE_USER_NAME = Read.readSql("have_user_name.sql");
	/** 查看邮箱是否存在 */
	public static final String HAVE_USER_EMAIL = Read.readSql("have_user_email.sql");
	/** 添加用户 */
	public static final String ADD_USER = Read.readSql("add_user.sql");
	/** 用户登录验证 */
	public static final String VALIDATE_USER = Read.readSql("validate_user.sql");
	/** 根据username查找userid */
	public static final String FIND_USERID_BY_USERNAME = Read.readSql("find_userid_by_name.sql");
	/** 获取刚刚insert数据的ID */
	public static final String LAST_INSERT_ID = Read.readSql("last_insert_id.sql");
	/** 添加文章 */
	public static final String ADD_POST = Read.readSql("add_post.sql");
	/** 添加添加媒体文件 */
	public static final String ADD_META = Read.readSql("add_meta.sql");
	/** 根据状态查找文章 */
	public static final String FIND_POST_BY_STATUS = Read.readSql("find_post_by_status.sql");
	/** 根据状态计算文章数 */
	public static final String COUNT_POST_BY_STATUS = Read.readSql("count_post_by_status.sql");
	/** 批量修改文章状态 */
	public static final String CHANGE_POST_STATUS_BY_IDS = Read.readSql("change_post_status_by_ids.sql");
	/** 查找首页文章列表 */
	public static final String FIND_HOME_POST_LIST = Read.readSql("find_home_post_list.sql");
	/** 查找所有文章列表 */
	public static final String FIND_ALL_POST_LIST = Read.readSql("find_all_post_list.sql");
	/** 根据ID查找文章内容 */
	public static final String FIND_POST_BY_ID = Read.readSql("find_post_by_id.sql");
}
