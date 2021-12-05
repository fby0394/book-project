package com.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.entity.CarouselBookInfo;
import com.aaa.impldao.CarouselBookInfoImplDAO;

/**
 * 图书轮播信息service
 * 
 * @author 范博源
 * 
 */
@Service
@Transactional
public class CarouselBookInfoService {

	@Autowired
	private CarouselBookInfoImplDAO carbiimp;

	/**
	 * 修改轮播的图书信息
	 * 
	 * @param carbi
	 * @return
	 */
	public boolean updateCarouselBookInfo(CarouselBookInfo carbi) {
		return carbiimp.updateCarouselBookInfo(carbi);
	}

	/**
	 * 查看轮播的图书信息
	 * 
	 * @return
	 */
	public List<CarouselBookInfo> queryAllCar() {
		return carbiimp.queryAllCar();
	}
}
