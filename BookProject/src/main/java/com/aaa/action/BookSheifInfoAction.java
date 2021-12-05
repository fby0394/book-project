package com.aaa.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.aaa.entity.BookSheifInfo;
import com.aaa.service.BookSheifInfoService;
import com.aaa.util.Paging;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 书架信息action
 * 
 * @author 范博源
 * 
 */
@ParentPackage("default")
@Namespace(value = "/BookSheifInfo")
@Results({
		@Result(name = "queryList", type = "json", params = { "root",
				"bsiList", "excludeProperties", "bi.bci,bci.bi" }),
		@Result(name = "queryPaging", type = "json", params = { "root",
				"paging", "excludeProperties", "bci.bi" }) })
public class BookSheifInfoAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private BookSheifInfoService service;

	private List<BookSheifInfo> bsiList;

	private BookSheifInfo bsi;

	private Paging paging;

	/**
	 * 根据加入时间查询指定用户的书架信息
	 * 
	 * @return
	 */
	@Action(value = "/queryBsi")
	public String queryBsi() {
		bsiList = service.queryBookSheifInfoAll(bsi.getUserid(),
				"bs.bstime desc");
		return "queryList";
	}

	/**
	 * 根据更新时间查询分页指定用户的书架信息
	 * 
	 * @return
	 */
	@Action(value = "/queryAddTimeBsi")
	public String queryAddTimeBsi() {
		paging = service.queryBsiAll(bsi.getUserid(), "bs.bstime desc",
				8, paging.getCurrentPage());
		return "queryPaging";
	}
	
	/**
	 * 根据更新时间查询分页指定用户的书架信息
	 * 
	 * @return
	 */
	@Action(value = "/queryUpdateTimeBsi")
	public String queryUpdateTimeBsi() {
		paging = service.queryBsiAll(bsi.getUserid(), "bs.bi.updatetime desc",
				8, paging.getCurrentPage());
		return "queryPaging";
	}

	/**
	 * 删除指定书架中指定的图书信息
	 * 
	 * @return
	 */
	@Action(value = "/deleteBsi")
	public String deleteBsi() {
		if (service.deleteBookSheifInfo(bsi)) {
			bsiList = service.queryBookSheifInfoAll(bsi.getUserid(),
					"bstime desc");
		} else {
			bsiList = null;
		}
		return "queryList";
	}

	/**
	 * 添加指定图书至书架中
	 * 
	 * @return
	 */
	@Action(value = "/addBsi")
	public String addBsi() {
		if (service.queryBookSheifInfo(bsi.getUserid(), bsi.getBi().getBookid())) {
			bsiList = null;
		} else {
			bsi.setBsiid(bsi.getUserid() + bsi.getBi().getBookid());
			bsi.setBstime(new Date());
			if(service.savaBookSheifInfo(bsi)){
				bsiList = service.queryBookSheifInfoAll(bsi.getUserid(),
						"bstime desc");
			}else{
				bsiList = null;
			}
		}
		return "queryList";
	}

	public List<BookSheifInfo> getBsiList() {
		return bsiList;
	}

	public void setBsiList(List<BookSheifInfo> bsiList) {
		this.bsiList = bsiList;
	}

	public BookSheifInfo getBsi() {
		return bsi;
	}

	public void setBsi(BookSheifInfo bsi) {
		this.bsi = bsi;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

}
