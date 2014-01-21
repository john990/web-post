package com.psy.bean;

/**
 * Created by kai.wang on 12/9/13.
 */
public class Post {
    /**
     * 未审核
     */
    public static final int STATUS_NOT_AUDIT = 0;
    /**
     * 正常
     */
    public static final int STATUS_NORMAL = 1;
    /**
     * 已删除
     */
    public static final int STATUS_DELETE = 9;

    private int Id;
    private int userId;
    private String title;
    private int cover;
    private String content;
    private int commentCount;
    private int status;
    private String createAt;
    private String updateAt;
    private String reference;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int user_id) {
        this.userId = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCover() {
        return cover;
    }

    public void setCover(int cover) {
        this.cover = cover;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }
}
