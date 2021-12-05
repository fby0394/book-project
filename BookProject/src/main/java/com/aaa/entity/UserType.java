package com.aaa.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 用户类型实体类
 * 
 * @author 范博源
 * 
 */
@Entity
@Table(name = "usertype")
@Cache(usage=CacheConcurrencyStrategy.READ_ONLY)
public class UserType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer utid;
	private String utname;

	@Id
	@Column(name="utid")
	public Integer getUtid() {
		return utid;
	}

	public void setUtid(Integer utid) {
		this.utid = utid;
	}

	@Column(name = "utname", updatable = true)
	public String getUtname() {
		return utname;
	}

	public void setUtname(String utname) {
		this.utname = utname;
	}

	public UserType() {
		super();
	}

	/**
	 * 创建带id的账户类型
	 * @param utid
	 */
	public UserType(Integer utid) {
		super();
		this.utid = utid;
	}
	
}
