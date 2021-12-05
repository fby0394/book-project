package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 书架信息
 * 
 * @author 范博源
 * 
 */
@Entity
@Table(name = "booksheifinfo")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class BookSheifInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String bsiid;//图书书架主键 用户id+图书编号
	private String bookid;// 图书编号外键
	private Integer userid;// 用户id外键
	private String catalogid;// 章节编号外键,当前图书阅读进度
	private Date bstime;// 加入书架时间


	private BookInfo bi;

	private BookCatalogInfo bci;


	@Id
	@Column(name="bsiid")
	public String getBsiid() {
		return bsiid;
	}

	public void setBsiid(String bsiid) {
		this.bsiid = bsiid;
	}
	
	@Column(name = "bookid", insertable = false, updatable = false)
	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	@Column(name = "userid")
	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Column(name = "catalogid", insertable = false, updatable = false)
	public String getCatalogid() {
		return catalogid;
	}

	public void setCatalogid(String catalogid) {
		this.catalogid = catalogid;
	}

	@Column(name = "bstime")
	public Date getBstime() {
		return bstime;
	}

	public void setBstime(Date bstime) {
		this.bstime = bstime;
	}

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = BookInfo.class)
	@JoinColumn(name = "bookid")
	public BookInfo getBi() {
		return bi;
	}

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = BookCatalogInfo.class)
	@JoinColumn(name = "catalogid")
	public BookCatalogInfo getBci() {
		return bci;
	}

	public void setBci(BookCatalogInfo bci) {
		this.bci = bci;
	}

	public void setBi(BookInfo bi) {
		this.bi = bi;
	}

	public BookSheifInfo() {
		super();
	}

	@Override
	public String toString() {
		return "BookSheifInfo [bsiid=" + bsiid + ", bookid=" + bookid
				+ ", userid=" + userid + ", catalogid=" + catalogid
				+ ", bstime=" + bstime + "]";
	}

	

}
