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
 * 图书目录信息
 * 
 * @author 范博源
 * 
 */
@Entity
@Table(name = "bookcataloginfo")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
public class BookCatalogInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String catalogId;// 章节编号
	private String bookId;// 图书编号外键
	private String catalogTitle;// 章节标题
	private Integer catalognum;// 章节顺序

	private String catalogUrl;// 章节对应的url地址
	private Integer catalogSize;// 章节字数
	private Date updateTime;// 更新时间
	private Integer readNum;// 阅读人数
	private Integer catalogPrice;// 章节价格(0为免费)

	private BookInfo bi;

	public BookCatalogInfo() {
		super();
	}

	@Id
	@Column(name = "catalogid")
	public String getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(String catalogId) {
		this.catalogId = catalogId;
	}

	@Column(name = "bookid", insertable = false, updatable = false)
	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	@Column(name = "catalogtitle")
	public String getCatalogTitle() {
		return catalogTitle;
	}

	public void setCatalogTitle(String catalogTitle) {
		this.catalogTitle = catalogTitle;
	}

	@Column(name = "catalognum")
	public Integer getCatalognum() {
		return catalognum;
	}

	public void setCatalognum(Integer catalognum) {
		this.catalognum = catalognum;
	}

	@Column(name = "catalogurl")
	public String getCatalogUrl() {
		return catalogUrl;
	}

	public void setCatalogUrl(String catalogUrl) {
		this.catalogUrl = catalogUrl;
	}

	@Column(name = "catalogsize")
	public Integer getCatalogSize() {
		return catalogSize;
	}

	public void setCatalogSize(Integer catalogSize) {
		this.catalogSize = catalogSize;
	}

	@Column(name = "updatetime")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "readnum")
	public Integer getReadNum() {
		return readNum;
	}

	public void setReadNum(Integer readNum) {
		this.readNum = readNum;
	}

	@Column(name = "catalogprice")
	public Integer getCatalogPrice() {
		return catalogPrice;
	}

	public void setCatalogPrice(Integer catalogPrice) {
		this.catalogPrice = catalogPrice;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bookid")
	public BookInfo getBi() {
		return bi;
	}

	public void setBi(BookInfo bi) {
		this.bi = bi;
	}

	@Override
	public String toString() {
		return "BookCatalogInfo [catalogId=" + catalogId + ", bookId=" + bookId
				+ ", catalogTitle=" + catalogTitle + ", catalognum="
				+ catalognum + ", catalogUrl=" + catalogUrl + ", catalogSize="
				+ catalogSize + ", updateTime=" + updateTime + ", readNum="
				+ readNum + ", catalogPrice=" + catalogPrice + "]";
	}
}
