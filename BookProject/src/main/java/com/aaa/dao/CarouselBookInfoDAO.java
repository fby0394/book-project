package com.aaa.dao;

import java.util.List;

import com.aaa.entity.CarouselBookInfo;

/**
 * 轮播的图书信息DAO
 * 
 * @author 范博源
 * 
 */
public interface CarouselBookInfoDAO {

	/**
	 * 修改轮播的图书信息
	 * 
	 * @param carbi
	 * @return
	 */
	public boolean updateCarouselBookInfo(CarouselBookInfo carbi);

	/**
	 * 查看轮播的图书信息
	 * 
	 * @return
	 */
	public List<CarouselBookInfo> queryAllCar();
}
