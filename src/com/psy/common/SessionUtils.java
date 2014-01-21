package com.psy.common;

import javax.servlet.http.HttpSession;

/**
 * Created by kai.wang on 12/13/13.
 */
public class SessionUtils {
    /**
     * 需要登錄提示
     *
     * @param session
     */
    public static void addNeedLoginTip(HttpSession session) {
        session.setAttribute(SessionAttribute.NEED_LOGIN, "need");
    }
}
