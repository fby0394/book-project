package com.aaa.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 图书类型实体类
 * 
 * @author 范博源
 * 
 */
@Entity
@Table(name = "booktypeinfo")
//设置缓存为只读
@Cache(usage=CacheConcurrencyStrategy.READ_ONLY)
public class BookTypeInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer btid;// number(2) primary key,-- 书籍类型编号
	private String btname;// varchar2(20)-- 书籍类型

	
	public BookTypeInfo() {
		super();
	}

	@Id
	@Column(name="btid")
	public Integer getBtid() {
		return btid;
	}

	public void setBtid(Integer btid) {
		this.btid = btid;
	}

	@Column(name="btname")
	public String getBtname() {
		return btname;
	}

	public void setBtname(String btname) {
		this.btname = btname;
	}
}
