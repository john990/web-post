package com.psy.base.security;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

/**
 * Created by kai on 11/24/13.<br/>
 * Function : 加密类
 */
public class Encipher {

	private static final String MD5 = "md5";
	private static final String SHA = "sha-1";
	private static final String MIX_STR = "HEI";

	/**
	 * 加密字符串（MD5 + BASE64）
	 *
	 * @param text 加密前字符串
	 * @return 加密后字符串
	 */
	public static String encrypt(String text) {
		text = text + MIX_STR;
		BASE64Encoder base64en = new BASE64Encoder();
		return base64en.encode(md5(text));
	}

	/**
	 * md5加密
	 *
	 * @param inputText 加密前字符串
	 * @return 加密后字符串
	 */
	private static byte[] md5(String inputText) {
		return encrypt(inputText, MD5);
	}

	/**
	 * sha-1加密
	 *
	 * @param inputText 加密前字符串
	 * @return 加密后字符串
	 */
	private static byte[] sha(String inputText) {
		return encrypt(inputText, SHA);
	}

	private static byte[] encrypt(String inputText, String algorithmName) {
		if (inputText == null || "".equals(inputText.trim())) {
			throw new IllegalArgumentException("请输入要加密的内容");
		}
		byte[] encryptText = null;
		try {
			MessageDigest m = MessageDigest.getInstance(algorithmName);
			m.update(inputText.getBytes("UTF-8"));
			encryptText = m.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encryptText;
	}
}
