package com.aaa.dao;

import java.util.List;
/**
 * 用户信息DAO接口
 */
import com.aaa.entity.UserInfo;

/**
 * 
 * @author 范博源
 * 
 */
public interface UserInfoDAO {

	/**
	 * 查看指定类型的用户
	 * 
	 * @param utid
	 * @return
	 */
	public List<UserInfo> queryAll(int utid);

	/**
	 * 用户登录
	 * 
	 * @param uname
	 *            用户名
	 * @param upwd
	 *            密码
	 * @return
	 */
	public List<UserInfo> Userlogin(String uname, String upwd);

	/**
	 * 其他渠道登录 支付宝，QQ，微信
	 * 
	 * @param account
	 *            对应的账户
	 * @return
	 */
	public List<UserInfo> restsUserlogin(String account);

	/**
	 * 验证手机号是否已经存在
	 * 
	 * @param phone
	 * @return
	 */
	public List<UserInfo> CheckPhone(String phone);
	
	/**
	 * 验证用户名是否已经存在
	 * 
	 * @param phone
	 * @return
	 */
	public List<UserInfo> CheckUname(String uname);

	/**
	 * 修改用户信息
	 * 
	 * @param u
	 * @return
	 */
	public boolean updateUserInfo(UserInfo u);

	/**
	 * 根据用户id禁用用户
	 * 
	 * @param userid
	 * @return
	 */
	public boolean bannedUserInfo(Integer userid);

	/**
	 * 添加用户信息
	 * 
	 * @param u
	 * @return
	 */
	public boolean addUserInfo(UserInfo u);

}
