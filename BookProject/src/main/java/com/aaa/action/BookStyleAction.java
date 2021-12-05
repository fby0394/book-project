package com.aaa.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.aaa.entity.BookStyle;
import com.aaa.service.BookStyleService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 图书风格Action
 * 
 * @author 范博源
 * 
 */
@ParentPackage("default")
@Namespace(value = "/BookStyle")
@Results({ @Result(name = "queryList", type = "json", params = { "root",
		"bstList" }) })
public class BookStyleAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private BookStyleService service;

	private BookStyle bst;

	private List<BookStyle> bstList;

	@Action(value = "/queryAll")
	public String queryAll() {
		bstList = service.queryAll();
		return "queryList";
	}

	public BookStyle getBst() {
		return bst;
	}

	public void setBst(BookStyle bst) {
		this.bst = bst;
	}

	public List<BookStyle> getBstList() {
		return bstList;
	}

	public void setBstList(List<BookStyle> bstList) {
		this.bstList = bstList;
	}
}
