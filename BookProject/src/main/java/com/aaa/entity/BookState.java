package com.aaa.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 图书状态实体类
 * 
 * @author 范博源
 * 
 */
@Entity
@Table(name = "bookstate")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class BookState implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer bsid;// number(1) primary key,-- 书籍状态编号
	private String bsname;// varchar2(20)-- 书籍状态

	public BookState() {
		super();
	}

	@Id
	@Column(name = "bsid")
	public Integer getBsid() {
		return bsid;
	}

	public void setBsid(Integer bsid) {
		this.bsid = bsid;
	}

	@Column(name = "bsname")
	public String getBsname() {
		return bsname;
	}

	public void setBsname(String bsname) {
		this.bsname = bsname;
	}
}
