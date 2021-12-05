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
 * 推荐的图书信息
 * 
 * @author 范博源
 * 
 */
@Entity
@Table(name = "recommendbookinfo")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
public class RecommendBookInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer recommendid;// 推荐的图书编号
	private String bookid;// 图书编号外键

	private BookInfo bi;

	public RecommendBookInfo() {
		super();
	}

	@Id
	@Column(name = "recommendid")
	public Integer getRecommendid() {
		return recommendid;
	}

	public void setRecommendid(Integer recommendid) {
		this.recommendid = recommendid;
	}

	@Column(name = "bookid", insertable = false, updatable = false)
	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bookid", unique = true)
	public BookInfo getBi() {
		return bi;
	}

	public void setBi(BookInfo bi) {
		this.bi = bi;
	}
}
