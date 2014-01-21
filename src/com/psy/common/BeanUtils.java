package com.psy.common;

import com.psy.bean.User;

/**
 * Created by kai.wang on 12/5/13.
 */
public class BeanUtils {

    /**
     * 判断是否是无效的USER
     *
     * @param user
     * @return
     */
    public static final boolean isEmptyUser(User user) {
        if (user == null || user.getId() <= 0) {
            return true;
        }
        return false;
    }
}
