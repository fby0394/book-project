package com.aaa.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.aaa.entity.UserInfo;
import com.aaa.entity.UserType;
import com.aaa.service.UserInfoService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户登录Action
 * 
 * @author 范博源
 * 
 */
@ParentPackage("default")
@Namespace("/user")
@Results(value = { @Result(name = "success", type = "json", params = { "root",
		"check" }) })
public class UserLoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserInfoService service;

	private UserInfo user;

	private List<UserInfo> userList;

	private boolean check;

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@Action(value = "/Login")
	public String Login() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		userList = service.Login(user.getUname(), user.getUpwd());
		if (null != userList && userList.size() > 0) {
			session.put("user", userList.get(0));
			check = true;
		} else {
			check = false;
		}
		return "success";
	}

	/**
	 * 退出登录
	 * 
	 * @return
	 */
	@Action(value = "/exitLogin")
	public String exitLogin() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("user");
		check = true;
		return "success";
	}

	@Action(value="/userControlCenter",results={@Result(name="success",type="dispatcher",location="/bookFront/userControlCenter.jsp")})
	public String userControlCenter(){
		return "success";
	}
	/**
	 * 验证手机号是否存在
	 * 
	 * @return
	 */
	@Action(value = "/CheckPhone")
	public String CheckPhone() {
		userList = service.CheckPhone(user.getPhone());
		if (null != userList && userList.size() > 0) {
			check = true;
		} else {
			check = false;
		}
		return "success";
	}

	/**
	 * 验证用户名是否存在
	 * 
	 * @return
	 */
	@Action(value = "/CheckUname")
	public String CheckUname() {
		userList = service.CheckUname(user.getUname());
		if (null != userList && userList.size() > 0) {
			check = true;
		} else {
			check = false;
		}
		return "success";
	}

	/**
	 * 前台用户注册
	 * 
	 * @return
	 */
	@Action(value = "/userSign")
	public String userSign() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		// 设置用户的账户类型
		user.setUtype(new UserType(3));
		if (service.addUserInfo(user)) {
			session.put("user", user);
			check = true;
		} else {
			check = false;
		}
		return "success";
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}
}
