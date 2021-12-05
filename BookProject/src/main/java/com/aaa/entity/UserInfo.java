package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

/**
 * 用户信息实体类
 * 
 * @author 范博源
 * 
 */
@Entity
@Table(name = "userinfo")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
public class UserInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer userid;// number 10 用户id（从10000开始）,主键
	private String uname;// varchar2 20 用户名（非空）
	private String upwd;// varchar2 100 用户密码（非空）
	private Integer ustate;// number 1 账户状态（0可用，1禁用）
	private Integer utid;// number 2 账户类型（外键）
	private String usercard;// varchar 18 身份证号（约束必须15或18位）
	private String phone;// number 11 手机号（唯一，可以为空）
	private String qqnumber;// number 11 绑定的qq号（唯一，可以为空）
	private String wxnumber;// varchar2 30 绑定的微信号（唯一，可为空）
	private String zfbnumber;// varchar2 30 绑定的支付宝号（唯一，可为空）
	private Integer balance;// number 11 账户余额（一元对应100点，默认值为0）

	private Date addtime;
	
	private UserType utype;

	public UserInfo() {
		super();
	}

	@Id
	// 有Hibernat自动以递增的方式生成标识符，每次增量1
	@GenericGenerator(name = "useridincrement", strategy = "increment")
	@GeneratedValue(generator = "useridincrement")
	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Column(name = "uname")
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Column(name = "upwd")
	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	@Column(name = "ustate")
	public Integer getUstate() {
		return ustate;
	}

	public void setUstate(Integer ustate) {
		this.ustate = ustate;
	}

	@Column(name = "utid", updatable = false, insertable = false)
	public Integer getUtid() {
		return utid;
	}

	public void setUtid(Integer utid) {
		this.utid = utid;
	}

	@Column(name = "usercard")
	public String getUsercard() {
		return usercard;
	}

	public void setUsercard(String usercard) {
		this.usercard = usercard;
	}

	@Column(name = "phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "qqnumber")
	public String getQqnumber() {
		return qqnumber;
	}

	public void setQqnumber(String qqnumber) {
		this.qqnumber = qqnumber;
	}

	@Column(name = "wxnumber")
	public String getWxnumber() {
		return wxnumber;
	}

	public void setWxnumber(String wxnumber) {
		this.wxnumber = wxnumber;
	}

	@Column(name = "zfbnumber")
	public String getZfbnumber() {
		return zfbnumber;
	}

	public void setZfbnumber(String zfbnumber) {
		this.zfbnumber = zfbnumber;
	}

	@Column(name = "balance")
	public Integer getBalance() {
		return balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	@Column(name = "addtime")
	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "utid")
	public UserType getUtype() {
		return utype;
	}

	public void setUtype(UserType utype) {
		this.utype = utype;
	}

	@Override
	public String toString() {
		return "UserInfo [userid=" + userid + ", uname=" + uname + ", upwd="
				+ upwd + ", ustate=" + ustate + ", utid=" + utid
				+ ", usercard=" + usercard + ", phone=" + phone + ", qqnumber="
				+ qqnumber + ", wxnumber=" + wxnumber + ", zfbnumber="
				+ zfbnumber + ", balance=" + balance + "]";
	}

}
