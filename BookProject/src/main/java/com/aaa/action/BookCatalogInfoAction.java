package com.aaa.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.aaa.entity.BookCatalogInfo;
import com.aaa.service.BookCatalogInfoService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 图书目录信息
 * 
 * @author 范博源
 * 
 */
@ParentPackage("default")
@Namespace(value = "/Bci")
@Results({ @Result(name = "queryList", type = "json", params = { "root",
		"bciList" }) })
public class BookCatalogInfoAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private BookCatalogInfoService service;

	private List<BookCatalogInfo> bciList;

	private BookCatalogInfo bci;

	/**
	 * 显示章节信息
	 * 
	 * @return
	 */
	@Action(value = "/showBci", results = { @Result(name = "success", type = "dispatcher", location = "/bookFront/ReadBook.jsp") })
	public String showBookCatalogInfo() {
		bciList = service.queryAll(bci.getBookId());
		bci = service.queryBci(bci.getCatalogId(), bci.getBookId());
		return "success";
	}

	/**
	 * 下一章节或上一章节
	 * 
	 * @return
	 */
	@Action(value = "/pageTurning", results = { @Result(name = "pageBci", type = "json", params = {
			"root", "bci", "excludeProperties", "bi" }) })
	public String pageTurning() {
		bci = service.pageTurning(bci.getBookId(), bci.getCatalognum(),
				bci.getCatalogSize());
		return "pageBci";
	}

	public List<BookCatalogInfo> getBciList() {
		return bciList;
	}

	public void setBciList(List<BookCatalogInfo> bciList) {
		this.bciList = bciList;
	}

	public BookCatalogInfo getBci() {
		return bci;
	}

	public void setBci(BookCatalogInfo bci) {
		this.bci = bci;
	}

}
