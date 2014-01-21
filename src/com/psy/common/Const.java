package com.psy.common;

import com.qiniu.api.config.Config;

/**
 * Created by kai on 11/28/13.<br/>
 * Function : 常量
 */
public class Const {

    // 七牛
    public static final String BUCKET_NAME = "personal-demo";
    public static final String ACCESS_KEY = "MCtbRL1lR0K4hy7w7Nny3IpFAVvB0qHyXla8N9Na";
    public static final String SECRET_KEY = "O7A1Kyq5Gm5fHqQR77JWPPrRr26gMHsKH7ifZGfS";

    static {
        Config.ACCESS_KEY = ACCESS_KEY;
        Config.SECRET_KEY = SECRET_KEY;
    }

    /**
     * 媒体文件域名前缀
     */
    public static final String SITE_PREFIX = "http://personal-demo.u.qiniudn.com/";
}
