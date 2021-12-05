package com.aaa.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 密码加密
 * 
 * @author 范博源
 * 
 */
public class PwdEncryption {
	/**
	 * 判断字符串中是否包含中文
	 * 
	 * @param str
	 *            待校验字符串
	 * @return 是否为中文
	 * @warn 不能校验是否为中文标点符号
	 */
	public static boolean isContainChinese(String str) {
		Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
		Matcher m = p.matcher(str);
		if (m.find()) {
			return true;
		}
		return false;
	}

	private static String[] strs = { "a", "b", "c", "9", "d", "e", "f", "1",
			"g", "h", "i", "j", "8", "k", "l", "m", "n", "0", "3", "6", "7",
			"o", "p", "q", "r", "s", "t", "u", "v", "4", "w", "x", "2", "y",
			"z", "5" };

	/**
	 * 简单密码加密
	 * 
	 * @param str
	 *            要加密的字符串
	 * @return 返回加密后的字符串
	 */
	public static String PwdEncry(String str) {
		String str1 = "";
		for (int i = 0; i < str.length(); i++) {
			int ch = (int) str.charAt(i);
			String s4 = Integer.toHexString(ch) + strs[ch / 36] + strs[ch % 36];
			str1 = str1 + s4;
		}
		return str1;
	}
}
