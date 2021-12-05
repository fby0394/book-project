package com.aaa.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 轮播的图书
 * 
 * @author 范博源
 * 
 */
@Entity
@Table(name = "carouselbookinfo")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
public class CarouselBookInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer carbookid;// 轮播编号
	private String bookid;// 图书编号外键
	private String picurl;// 对应的图片路径

	private BookInfo bi;

	public CarouselBookInfo() {
		super();
	}

	@Id
	@Column(name = "carbookid")
	public Integer getCarbookid() {
		return carbookid;
	}

	public void setCarbookid(Integer carbookid) {
		this.carbookid = carbookid;
	}

	@Column(name = "bookid", insertable = false, updatable = false)
	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	@Column(name = "picurl")
	public String getPicurl() {
		return picurl;
	}

	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bookid", unique = true)
	public BookInfo getBi() {
		return bi;
	}

	public void setBi(BookInfo bi) {
		this.bi = bi;
	}

	@Override
	public String toString() {
		return "CarouselBookInfo [bookid=" + bookid + ", picurl=" + picurl
				+ ", bi=" + bi + "]";
	}

}
