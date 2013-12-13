package com.psy.dao;

import com.psy.base.db.DBManager;
import com.psy.base.db.QueryHelper;
import com.psy.base.security.Encipher;
import com.psy.base.utils.StringUtils;
import com.psy.bean.Post;
import com.psy.bean.User;
import com.psy.common.Const;
import com.psy.common.SQL;
import com.psy.controller.post.FormPost;
import com.psy.controller.user.RegUser;

import org.apache.commons.dbutils.QueryRunner;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by kai.wang on 12/13/13.
 */
public class PostDao {

	/**
	 * 添加新文章
	 * @param post
	 * @return
	 */
	public static int addPost(FormPost post) {
		Connection connection = null;
		try {
			connection = DBManager.getDataSource().getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		QueryRunner runner = new QueryRunner();

		// 添加媒體信息
		int count = 0;
		if(!StringUtils.isEmpty(post.getCoverUrl())){
			count = QueryHelper.update(runner, connection, SQL.ADD_META, new String[]{Const.SITE_PREFIX + post.getCoverUrl()});
			int cover = (int)QueryHelper.queryNumber(runner,connection,SQL.LAST_INSERT_ID,new String[]{});
			post.setCover(cover);
		}

		// USER_ID,TITLE,COVER,CONTENT,STATUS
		count += QueryHelper.update(runner,connection,SQL.ADD_POST,
				new Object[]{post.getUserId(),post.getTitle(),post.getCover(),post.getContent(), Post.STATUS_NOT_AUDIT});
		return count;
	}
}
