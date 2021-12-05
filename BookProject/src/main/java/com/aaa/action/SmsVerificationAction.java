package com.aaa.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.aaa.util.SmsVerification;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 短信验证action
 * 
 * @author 范博源
 * 
 */
@ParentPackage("default")
@Namespace(value = "/smsVer")
@Results(value = { @Result(name = "success", type = "json", params = { "root",
		"SmsCheckNum" }) })
public class SmsVerificationAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer SmsCheckNum;
	private String phone;

	/**
	 * 登录验证码
	 * 
	 * @return
	 */
	@Action(value = "/LoginCheck")
	public String LoginCheck() {
		SmsCheckNum = SmsVerification.getLoginCheck(phone);
		return "success";
	}

	/**
	 * 改密码验证码
	 * 
	 * @return
	 */
	@Action(value = "/PwdCheck")
	public String PwdCheck() {
		SmsCheckNum = SmsVerification.getLoginPwd(phone);
		return "success";
	}

	/**
	 * 注册验证码
	 * 
	 * @return
	 */
	@Action(value = "/SignCheck")
	public String SignCheck() {
		SmsCheckNum = SmsVerification.getSignCheck(phone);
		return "success";
	}

	public Integer getSmsCheckNum() {
		return SmsCheckNum;
	}

	public void setSmsCheckNum(Integer smsCheckNum) {
		SmsCheckNum = smsCheckNum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
