package com.aaa.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * 短信验证
 * 
 * @author 范博源
 * 
 */
public class SmsVerification {

	// url前半部分
	public static final String BASE_URL = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	// 注册后系统自动生成的账号ACCOUNT SID
	public static final String ACCOUNT_SID = "06c6d0720ae6450cbda2ca0b15558dab";
	// 注册后系统自动生成的TOKEN
	public static final String AUTH_TOKEN = "40170b85a630499bb359df738c4492dc";
	// 响应数据类型, JSON或XML
	public static final String RESP_DATA_TYPE = "json";
	
	private static int verificationCode = (int) ((Math.random() * 9 + 1) * 100000); // 随机验证码
	
	private static String LoginsmsContent = "【一帆商贸】登录验证码：" + verificationCode
			+ "，如非本人操作，请忽略此短信。";// 短信签名+内容（用模板不能自定义必须和模板一致）
	private static String PwdsmsContent = "【一帆商贸】验证码为" + verificationCode
			+ "，您正在修改登录密码，请确认是本人操作。。";// 短信签名+内容（用模板不能自定义必须和模板一致）
	private static String SignContent = "【遇见书城】注册验证码：" + verificationCode
			+ "，您正在注册“遇见书城“用户，如非本人操作，请忽略此短信。";

	/**
	 * 登录短信验证
	 * 
	 * @param phone
	 * @return
	 */
	public static int getLoginCheck(String phone) {
		String tmpSmsContent = null;
		try {
			tmpSmsContent = URLEncoder.encode(LoginsmsContent, "UTF-8");
		} catch (Exception e) {

		}
		String url = BASE_URL;
		String body = "accountSid=" + ACCOUNT_SID + "&to=" + phone
				+ "&smsContent=" + tmpSmsContent + createCommonParam();

		// 提交请求
		String result = post(url, body);
		// 输出信息状态信息
		System.out.println("result:" + System.lineSeparator() + result);
		return verificationCode;
	}

	/**
	 * 注册短信验证
	 * 
	 * @param phone
	 * @return
	 */
	public static int getSignCheck(String phone) {
		String tmpSmsContent = null;
		try {
			tmpSmsContent = URLEncoder.encode(SignContent, "UTF-8");
		} catch (Exception e) {

		}
		String url = BASE_URL;
		String body = "accountSid=" + ACCOUNT_SID + "&to=" + phone
				+ "&smsContent=" + tmpSmsContent + createCommonParam();

		// 提交请求
		String result = post(url, body);
		// 输出信息状态信息
		System.out.println("result:" + System.lineSeparator() + result);
		return verificationCode;
	}

	/**
	 * 密码找回短信验证
	 * 
	 * @param phone
	 * @return
	 */
	public static int getLoginPwd(String phone) {
		String tmpSmsContent = null;
		try {
			tmpSmsContent = URLEncoder.encode(PwdsmsContent, "UTF-8");
		} catch (Exception e) {

		}
		String url = BASE_URL;
		String body = "accountSid=" + ACCOUNT_SID + "&to=" + phone
				+ "&smsContent=" + tmpSmsContent + createCommonParam();

		// 提交请求
		String result = post(url, body);
		// 输出信息状态信息
		System.out.println("result:" + System.lineSeparator() + result);
		return verificationCode;
	}

	/**
	 * 构造通用参数timestamp、sig和respDataType
	 * 
	 * @return
	 */
	public static String createCommonParam() {
		// 时间戳
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String timestamp = sdf.format(new Date());

		// 签名
		String sig = DigestUtils.md5Hex(ACCOUNT_SID + AUTH_TOKEN + timestamp);

		return "&timestamp=" + timestamp + "&sig=" + sig + "&respDataType="
				+ RESP_DATA_TYPE;
	}

	/**
	 * post请求
	 * 
	 * @param url
	 *            功能和操作
	 * @param body
	 *            要post的数据
	 * @return
	 * @throws IOException
	 */
	public static String post(String url, String body) {
		String result = "";
		try {
			OutputStreamWriter out = null;
			BufferedReader in = null;
			URL realUrl = new URL(url);
			URLConnection conn = realUrl.openConnection();

			// 设置连接参数
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(20000);
			conn.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			// 提交数据
			out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			out.write(body);
			out.flush();

			// 读取返回数据
			in = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "UTF-8"));
			String line = "";
			boolean firstLine = true; // 读第一行不加换行符
			while ((line = in.readLine()) != null) {
				if (firstLine) {
					firstLine = false;
				} else {
					result += System.lineSeparator();
				}
				result += line;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 回调测试工具方法
	 * 
	 * @param url
	 * @param reqStr
	 * @return
	 */
	public static String postHuiDiao(String url, String body) {
		String result = "https://api.miaodiyun.com";
		try {
			OutputStreamWriter out = null;
			BufferedReader in = null;
			URL realUrl = new URL(url);
			URLConnection conn = realUrl.openConnection();

			// 设置连接参数
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(20000);

			// 提交数据
			out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			out.write(body);
			out.flush();

			// 读取返回数据
			in = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "UTF-8"));
			String line = "";
			boolean firstLine = true; // 读第一行不加换行符
			while ((line = in.readLine()) != null) {
				if (firstLine) {
					firstLine = false;
				} else {
					result += System.lineSeparator();
				}
				result += line;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
