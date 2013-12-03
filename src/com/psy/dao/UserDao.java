package com.psy.dao;

import com.psy.base.db.DBManager;
import com.psy.base.db.QueryHelper;
import com.psy.base.security.Encipher;
import com.psy.bean.User;
import com.psy.common.Msg;
import com.psy.common.SQL;
import com.psy.controller.user.LoginUser;
import com.psy.controller.user.RegUser;

import org.apache.commons.dbutils.QueryRunner;

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
	 * 是否存在相应的用户名
	 * @param username
	 * @return
	 */
	public static boolean hasUsername(String username){
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		if (QueryHelper.queryCount(runner, SQL.HAVE_USER_NAME, username) != 0) {
			return true;
		}
		return false;
	}

	/**
	 * 检查邮箱是否存在
	 * @param email
	 * @return
	 */
	public static boolean hasEmail(String email){
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		if (QueryHelper.queryCount(runner, SQL.HAVE_USER_EMAIL, email) != 0) {
			return true;
		}
		return false;
	}

	public static int addUser(RegUser user){
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		return QueryHelper.update(runner, null,SQL.ADD_USER,new String[]{user.getName(), Encipher.encrypt(user.getPassword()),user.getEmail(), User.TYPE_NORMAL});
	}

	/**
	 * 用户登录验证
	 * @return
	 */
	public static boolean validateUser(LoginUser user){
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		if (QueryHelper.queryCount(runner, SQL.VALIDATE_USER, new String[]{user.getName(),user.getName(), Encipher.encrypt(user.getPassword())}) != 0) {
			return true;
		}
		return false;
	}

}
