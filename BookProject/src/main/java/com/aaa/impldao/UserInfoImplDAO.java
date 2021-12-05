package com.aaa.impldao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aaa.dao.UserInfoDAO;
import com.aaa.entity.UserInfo;
import com.aaa.entity.UserType;
import com.aaa.util.hibernateDB;

/**
 * 用户信息实现类
 * 
 * @author 范博源
 * 
 */
@Repository
public class UserInfoImplDAO extends hibernateDB implements UserInfoDAO {

	@Override
	public List<UserInfo> queryAll(int utid) {
		String hql = "from  UserInfo u where u.utid=?0";
		return super.HqlQueryAll(hql, null, utid);
	}

	@Override
	public boolean updateUserInfo(UserInfo u) {
		u.setUtype(super.getObject(UserType.class, u.getUtid()));
		return super.updateObj(u);
	}

	@Override
	public boolean bannedUserInfo(Integer userid) {
		String hql = "update UserInfo set ustate=1 where userid=?0";
		return super.HqlExecQuery(hql, null, userid);
	}

	@Override
	public List<UserInfo> Userlogin(String uname, String upwd) {
		String hql = "from UserInfo u where (u.uname=?0 or u.phone=?1) and upwd=?2 and u.ustate=0";
		return super.HqlQueryAll(hql, null, uname, uname, upwd);
	}

	@Override
	public List<UserInfo> restsUserlogin(String account) {
		return null;
	}

	@Override
	public boolean addUserInfo(UserInfo u) {
		u.setUtype(super.getObject(UserType.class, u.getUtid()));
		return super.saveObj(u);
	}

	@Override
	public List<UserInfo> CheckPhone(String phone) {
		String hql = "from  UserInfo u where u.phone=?0";
		return super.HqlQueryAll(hql, null, phone);
	}

	@Override
	public List<UserInfo> CheckUname(String uname) {
		String hql = "from  UserInfo u where u.uname=?0";
		return super.HqlQueryAll(hql, null, uname);
	}

}
