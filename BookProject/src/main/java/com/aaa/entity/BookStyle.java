package com.aaa.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.apache.struts2.json.annotations.JSON;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;


/**
 * 图书风格
 * @author 范博源
 *
 */
@Entity
@Table(name="bookstyle")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class BookStyle implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer bstid;
	private String bstname;
	
	private List<BookInfo> biList;

	public BookStyle() {
		super();
	}

	@Id
	@Column(name="bstid")
	public Integer getBstid() {
		return bstid;
	}

	public void setBstid(Integer bstid) {
		this.bstid = bstid;
	}

	@Column(name="bstname")
	public String getBstname() {
		return bstname;
	}

	public void setBstname(String bstname) {
		this.bstname = bstname;
	}

	//关闭此get方法系列化
	@JSON(serialize=false)
	@ManyToMany(mappedBy="bstys",fetch=FetchType.LAZY)
	public List<BookInfo> getBiList() {
		return biList;
	}

	public void setBiList(List<BookInfo> biList) {
		this.biList = biList;
	}

	
	
}
