package com.psy.dao;

import com.psy.base.db.DBManager;
import com.psy.base.db.QueryHelper;
import com.psy.base.security.Encipher;
import com.psy.base.utils.StringUtils;
import com.psy.bean.Post;
import com.psy.bean.User;
import com.psy.bean.view.ViewPost;
import com.psy.common.Const;
import com.psy.common.SQL;
import com.psy.controller.post.FormPost;
import com.psy.controller.user.RegUser;

import org.apache.commons.dbutils.QueryRunner;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

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
			count = QueryHelper.update(runner, connection, SQL.ADD_META, Const.SITE_PREFIX + post.getCoverUrl());
			int cover = (int)QueryHelper.queryNumber(runner,connection,SQL.LAST_INSERT_ID,new String[]{});
			post.setCover(cover);
		}

		int subLength = post.getContent().length() > 40 ? 40 : post.getContent().length();
		post.setIntro(post.getContent().substring(0,subLength));
		// USER_ID,TITLE,COVER,INTRO,CONTENT,STATUS
		count += QueryHelper.update(
				runner,connection,SQL.ADD_POST,
				post.getUserId(),post.getTitle(),post.getCover(),post.getIntro(),post.getContent(), Post.STATUS_NOT_AUDIT);
		return count;
	}

	/**
	 * 根据状态查找文章
	 * @param status
	 * @param page 大于1
	 * @param perPage
	 * @return
	 */
	public static List<ViewPost> findPostByStatus(int status,int page,int perPage){
		List<ViewPost> list = null;
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		int limitStart = (page-1)*perPage;
		list = QueryHelper.queryBeanList(runner,ViewPost.class,SQL.FIND_POST_BY_STATUS,status,limitStart,perPage);
		return list;
	}

	/**
	 * 根据状态计算文章数
	 * @param status
	 * @return
	 */
	public static long countPostByStatus(int status){
		List<ViewPost> list = null;
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		return QueryHelper.queryCount(runner,SQL.COUNT_POST_BY_STATUS,status);
	}

	/**
	 * 批量修改文章状态
	 * @param status
	 * @return
	 */
	public static int changePostStatusByIds(Integer[] ids,int status){
		if(ids == null || ids.length == 0){
			return 0;
		}
		String strId = "";
		for(int i=0;i<ids.length;i++){
			if(i!=ids.length-1){
				strId += ids[i] + ",";
			}else{
				strId += ids[i];
			}
		}
		QueryRunner runner = new QueryRunner(DBManager.getDataSource());
		return QueryHelper.update(runner,null,SQL.CHANGE_POST_STATUS_BY_IDS,status,strId);
	}
}
