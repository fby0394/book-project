package com.aaa.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 类型转换
 * 
 */
public class ConversionType {
	/**
	 * 字符串转换为Integer类型
	 * 
	 * @param param
	 * @return
	 */
	public static Integer ConversionInt(String param) {
		if (null == param || "" == param || "undefined" == param) {
			return 0;
		} else {
			return Integer.parseInt(param.trim());
		}
	}

	/**
	 * 字符串转换为double类型
	 * 
	 * @param param
	 * @return
	 */
	public static double ConversionDouble(String param) {
		if (null == param || "" == param || "undefined" == param) {
			return 0;
		} else {
			return Double.parseDouble(param.trim());
		}
	}

	/**
	 * 其他数据类型转换为字符串
	 * 
	 * @param param
	 * @return
	 */
	public static String ConversionString(Object param) {
		if (null == param || "undefined" == param) {
			return "";
		} else {
			return param.toString().trim();
		}
	}

	/**
	 * 多个字符替换为同一个新的字符
	 * 
	 * @param str
	 *            要替换的字符串
	 * @param newChar
	 *            新的字符
	 * @param params
	 *            要替换的字符
	 * @return
	 */
	public static String ConversionReplaceAll(String str, String newChar,
			String... params) {
		if (null != params) {
			for (int i = 0; i < params.length; i++) {
				str = str.replaceAll(params[i], newChar);
			}
		}
		return str;
	}

	/**
	 * 获取当前时间的字符串类型格式为（yyyymmddhhmmss）
	 * 
	 * @return
	 */
	public static String getTimeString() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddhhmmss");
		return sdf.format(new Date());
	}

}
