package com.psy.dao;

import com.psy.base.db.DBManager;
import com.psy.base.db.QueryHelper;
import com.psy.base.security.Encipher;
import com.psy.base.utils.StringUtils;
import com.psy.bean.User;
import com.psy.common.Msg;
import com.psy.common.SQL;
import com.psy.controller.user.LoginUser;
import com.psy.controller.user.RegUser;

import org.apache.commons.dbutils.QueryRunner;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by kai.wang on 12/3/13.
 */
public class UserDao {
	/**
	 * 检查用户名或邮箱是否已经注册
	 *
	 * @param username
	 * @param email
	 * @return
	 */
	public static String hasNameOrEmail(String username, String email) {
		String errorMsg = null;
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		if (QueryHelper.queryCount(runner, SQL.HAVE_USER_NAME, username) != 0) {
			errorMsg = Msg.USERNAME_ALREADY_REG;
		}
		if (QueryHelper.queryCount(runner, SQL.HAVE_USER_EMAIL, email) != 0) {
			if (errorMsg != null) {
				errorMsg = " <br/> " + Msg.EMAIL_ALREADY_REG;
			} else {
				errorMsg = Msg.EMAIL_ALREADY_REG;
			}
		}
		return errorMsg;
	}

	/**
	 * 是否存在相同的用户名
	 *
	 * @param username
	 * @return
	 */
	public static boolean hasUsername(String username) {
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		if (QueryHelper.queryCount(runner, SQL.HAVE_USER_NAME, username) != 0) {
			return true;
		}
		return false;
	}

	/**
	 * 检查邮箱是否存在
	 *
	 * @param email
	 * @return
	 */
	public static boolean hasEmail(String email) {
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		if (QueryHelper.queryCount(runner, SQL.HAVE_USER_EMAIL, email) != 0) {
			return true;
		}
		return false;
	}

	/**
	 * 添加新用户
	 *
	 * @param user
	 * @return user id
	 */
	public static int addUser(RegUser user) {
		Connection connection = null;
		try {
			connection = DBManager.getDataSource().getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		QueryRunner runner = new QueryRunner();
		QueryHelper.update(runner, connection, SQL.ADD_USER, new String[]{user.getName(), Encipher
				.encrypt(user.getPassword()), user.getEmail(), User.TYPE_NORMAL});
		return (int)QueryHelper.queryNumber(runner,connection,SQL.LAST_INSERT_ID,new String[]{});
	}

	/**
	 * 用户登录验证
	 *
	 * @return
	 */
	public static User validateUser(LoginUser loginUser) {
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());

		User user = QueryHelper.queryBean(runner, User.class, null, SQL.VALIDATE_USER, new String[]{loginUser
				.getEmail(), Encipher.encrypt(loginUser.getPassword())});
		return user;
	}

	/**
	 *
	 * @param username
	 * @return
	 */
	public static int findUserIdByName(String username) {
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		User user = QueryHelper
				.queryBean(runner, User.class, null, SQL.FIND_USERID_BY_USERNAME, username);
		if (user != null ) {
			return user.getId();
		}
		return 0;
	}

}
