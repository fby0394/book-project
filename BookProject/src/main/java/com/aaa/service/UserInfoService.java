package com.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.entity.UserInfo;
import com.aaa.impldao.UserInfoImplDAO;
import com.aaa.util.PwdEncryption;

/**
 * 用户信息service
 * 
 * @author 范博源
 * 
 */
@Service
@Transactional
public class UserInfoService {

	@Autowired
	private UserInfoImplDAO userimp;

	/**
	 * 查看指定类型的用户
	 * 
	 * @param utid
	 * @return
	 */
	public List<UserInfo> queryAll(int utid) {
		return userimp.queryAll(utid);
	}

	/**
	 * 修改用户信息
	 * 
	 * @param u
	 * @return
	 */
	public boolean updateUserInfo(UserInfo u) {
		return userimp.updateUserInfo(u);
	}

	/**
	 * 根据用户id禁用用户
	 * 
	 * @param userid
	 * @return
	 */
	public boolean bannedUserInfo(Integer userid) {
		return userimp.bannedUserInfo(userid);
	}

	/**
	 * 添加用户信息
	 * 
	 * @param u
	 * @return
	 */
	public boolean addUserInfo(UserInfo u) {
		return userimp.addUserInfo(u);
	}
	/**
	 * 用户登录
	 * @param uname
	 * @param upwd
	 * @return
	 */
	public List<UserInfo> Login(String uname,String upwd){
		return userimp.Userlogin(uname, PwdEncryption.PwdEncry(upwd));
	}
	
	/**
	 * 验证手机号是否已经存在
	 * 
	 * @param phone
	 * @return
	 */
	public List<UserInfo> CheckPhone(String phone){
		return userimp.CheckPhone(phone);
	}
	
	/**
	 * 验证用户名是否已经存在
	 * 
	 * @param phone
	 * @return
	 */
	public List<UserInfo> CheckUname(String uname){
		return userimp.CheckUname(uname);
	}
}
