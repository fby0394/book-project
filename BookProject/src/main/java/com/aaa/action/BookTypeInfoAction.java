package com.aaa.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.aaa.entity.BookTypeInfo;
import com.aaa.service.BookTypeInfoService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 图书分类action
 * @author 范博源
 *
 */
@ParentPackage("default")
@Namespace(value="/BookTypeInfo")
public class BookTypeInfoAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private BookTypeInfoService service;

	private BookTypeInfo bti;
	private List<BookTypeInfo> btiList;

	@Action(value = "/queryBookTypeInfo", results = { @Result(name = "success", type = "json", params={"root","btiList"}) })
	public String queryBookTypeInfo(){
		btiList=service.queryAll();
		return "success";
	}
	public List<BookTypeInfo> getBtiList() {
		return btiList;
	}

	public void setBtiList(List<BookTypeInfo> btiList) {
		this.btiList = btiList;
	}

	public BookTypeInfo getBti() {
		return bti;
	}

	public void setBti(BookTypeInfo bti) {
		this.bti = bti;
	}
}
