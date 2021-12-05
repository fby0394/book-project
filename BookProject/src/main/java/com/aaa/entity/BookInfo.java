package com.aaa.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


/**
 * 图书信息实体类
 * 
 * @author 范博源
 * 
 */
@Entity
@Table(name = "bookinfo")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class BookInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String bookid;// 图书编号
	private String bookname;// 图书名称
	private String booknamesx;// 图书名称缩写
	private Integer btid;// 图书类型(外键)
	private Integer authorid;// 图书作者(外键，关联用户表)
	private Integer bsid;// 图书状态(外键)
	private Integer readnum = 0;// 阅读数量
	private Integer collectnum = 0;// 收藏数量
	private Integer booksize = 0;// 图书总字数
	private String bookpicurl;// 图书对应的图片路径
	private Date addtime = new Date();// 图书上架时间
	private Date updatetime = new Date();// 最后更新时间
	private String bookintrod;// 图书简介

	// 对应的图书类型
	private BookTypeInfo bti;

	// 对应的图书作者信息
	private UserInfo author;

	// 对应的图书状态
	private BookState bst;

	// 对应的图书风格
	private List<BookStyle> bstys;

	// 对应的目录信息
	private List<BookCatalogInfo> bci;

	public BookInfo() {
		super();
	}

	@Id
	@Column(name = "bookid")
	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	@Column(name = "bookname")
	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	@Column(name = "booknamesx")
	public String getBooknamesx() {
		return booknamesx;
	}

	public void setBooknamesx(String booknamesx) {
		this.booknamesx = booknamesx;
	}

	@Column(name = "btid", updatable = false, insertable = false)
	public Integer getBtid() {
		return btid;
	}

	public void setBtid(Integer btid) {
		this.btid = btid;
	}

	@Column(name = "authorid", updatable = false, insertable = false)
	public Integer getAuthorid() {
		return authorid;
	}

	public void setAuthorid(Integer authorid) {
		this.authorid = authorid;
	}

	@Column(name = "bsid", updatable = false, insertable = false)
	public Integer getBsid() {
		return bsid;
	}

	public void setBsid(Integer bsid) {
		this.bsid = bsid;
	}

	@Column(name = "readnum")
	public Integer getReadnum() {
		return readnum;
	}

	public void setReadnum(Integer readnum) {
		this.readnum = readnum;
	}

	@Column(name = "collectnum")
	public Integer getCollectnum() {
		return collectnum;
	}

	public void setCollectnum(Integer collectnum) {
		this.collectnum = collectnum;
	}

	@Column(name = "booksize")
	public Integer getBooksize() {
		return booksize;
	}

	public void setBooksize(Integer booksize) {
		this.booksize = booksize;
	}

	@Column(name = "bookpicurl")
	public String getBookpicurl() {
		return bookpicurl;
	}

	public void setBookpicurl(String bookpicurl) {
		this.bookpicurl = bookpicurl;
	}

	@Column(name = "addtime")
	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	@Column(name = "updatetime")
	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	@Column(name = "bookintrod")
	public String getBookintrod() {
		return bookintrod;
	}

	public void setBookintrod(String bookintrod) {
		this.bookintrod = bookintrod;
	}

	@Override
	public String toString() {
		return "BookInfo [bookid=" + bookid + ", bookname=" + bookname
				+ ", btid=" + btid + ", authorid=" + authorid + ", bsid="
				+ bsid + ", readnum=" + readnum + ", collectnum=" + collectnum
				+ ", booksize=" + booksize + ", bookpicurl=" + bookpicurl
				+ ", updatetime=" + updatetime + ", bookintrod=" + bookintrod
				+ "]";
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "btid")
	public BookTypeInfo getBti() {
		return bti;
	}

	public void setBti(BookTypeInfo bti) {
		this.bti = bti;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "authorid")
	public UserInfo getAuthor() {
		return author;
	}

	public void setAuthor(UserInfo author) {
		this.author = author;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bsid")
	public BookState getBst() {
		return bst;
	}

	public void setBst(BookState bst) {
		this.bst = bst;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "bi")
	@OrderBy("catalognum Asc")
	public List<BookCatalogInfo> getBci() {
		return bci;
	}

	public void setBci(List<BookCatalogInfo> bci) {
		this.bci = bci;
	}

	@Fetch(FetchMode.SUBSELECT)
	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE,
			CascadeType.PERSIST })
	@JoinTable(name = "bijoinbst", joinColumns = { @JoinColumn(name = "bookid", updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "bstid", updatable = false) })
	public List<BookStyle> getBstys() {
		return bstys;
	}

	public void setBstys(List<BookStyle> bstys) {
		this.bstys = bstys;
	}

}
