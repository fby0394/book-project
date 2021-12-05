package com.aaa.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.aaa.entity.CarouselBookInfo;
import com.aaa.service.CarouselBookInfoService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 图书轮播信息action
 * 
 * @author 范博源
 * 
 */
@ParentPackage("default")
@Namespace(value = "/carbi")
public class CarouselBookInfoAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private CarouselBookInfoService service;

	private List<CarouselBookInfo> carbiList;

	private CarouselBookInfo carbi;

	private boolean check;

	/**
	 * 查看轮播的图书信息
	 * 
	 * @return
	 */
	@Action(value = "/queryCarbi", results = { @Result(name = "success", type = "json", params = {
			"root", "carbiList" }) })
	public String queryCarbi() {
		carbiList = service.queryAllCar();
		return "success";
	}

	/**
	 * 修改轮播的图书信息
	 * 
	 * @return
	 */
	@Action(value = "/updateCarbi", results = { @Result(name = "success", type = "json", params = {
			"root", "check" }) })
	public String updateCarbi() {
		check = (service.updateCarouselBookInfo(carbi));
		return "success";
	}

	public List<CarouselBookInfo> getCarbiList() {
		return carbiList;
	}

	public void setCarbiList(List<CarouselBookInfo> carbiList) {
		this.carbiList = carbiList;
	}

	public CarouselBookInfo getCarbi() {
		return carbi;
	}

	public void setCarbi(CarouselBookInfo carbi) {
		this.carbi = carbi;
	}

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}
}
