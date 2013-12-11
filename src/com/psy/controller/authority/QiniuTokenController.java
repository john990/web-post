package com.psy.controller.authority;

import com.psy.common.Const;
import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.rs.PutPolicy;

import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by kai.wang on 12/10/13.
 */
@Controller
@RequestMapping()
public class QiniuTokenController {
	@RequestMapping(value = "upload-token", method = RequestMethod.POST)
	@ResponseBody
	public String getQiniuUptoken(ModelMap model) throws AuthException, JSONException {
		Mac mac = new Mac(Const.ACCESS_KEY, Const.SECRET_KEY);
		// 请确保该bucket已经存在
		String bucketName = Const.BUCKET_NAME;
		PutPolicy putPolicy = new PutPolicy(bucketName);
		// 从业务服务端得到上传凭证
		String token = putPolicy.token(mac);
		return token;
	}
}
