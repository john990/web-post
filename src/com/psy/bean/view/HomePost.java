package com.psy.bean.view;

/**
 * Created by kai.wang on 12/18/13.
 */
public class HomePost {
    //	P.ID AS ID,
//	U.AVATAR AS HEAD,
//	P.TITLE AS TITLE,
//	T.NAME AS TAG,
//	U.NAME AS USERNAME,
//	P.CREATE_AT AS TIME
    private String id;
    private String head;
    private String title;
    private String tag;
    private String username;
    private String time;
    private String count;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
}
