package com.aaa.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.aaa.entity.RecommendBookInfo;
import com.aaa.service.RecommendBookInfoService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 推荐的图书信息Action
 * 
 * @author 范博源
 * 
 */
@ParentPackage("default")
@Namespace("/recommend")
@Results({ @Result(name = "queryReommend", type = "json", params = { "root",
		"rebiList" }) })
public class RecommendBookInfoAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private RecommendBookInfoService service;
	private List<RecommendBookInfo> rebiList;
	private RecommendBookInfo rebi;
	private boolean check;

	// 查看每周推荐的图书
	@Action(value = "/queryWeek")
	public String queryWeekReommend() {
		rebiList = service.queryWeekRecommend();
		return "queryReommend";
	}

	// 查看每日推荐的图书
	@Action(value = "/queryDay")
	public String queryDayReommend() {
		rebiList = service.queryDayRecommend();
		return "queryReommend";
	}

	// 修改推荐的图书信息
	@Action(value = "/updateReommend", results = { @Result(name = "success", type = "json", params = {
			"root", "check" }) })
	public String updateReommend() {
		check = service.updateRecommend(rebi);
		return "success";
	}

	public List<RecommendBookInfo> getRebiList() {
		return rebiList;
	}

	public void setRebiList(List<RecommendBookInfo> rebiList) {
		this.rebiList = rebiList;
	}

	public RecommendBookInfo getRebi() {
		return rebi;
	}

	public void setRebi(RecommendBookInfo rebi) {
		this.rebi = rebi;
	}

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}
}
