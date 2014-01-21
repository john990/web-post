package com.psy.common;

/**
 * Created by kai.wang on 12/18/13.
 */
public class Utils {

    /**
     * 转换page参数
     */
    public static int parsePage(int page) {
        if (page < 1) {
            page = 1;
        }
        return page;
    }
}
