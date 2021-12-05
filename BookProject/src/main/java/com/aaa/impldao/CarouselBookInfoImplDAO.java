package com.aaa.impldao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aaa.dao.CarouselBookInfoDAO;
import com.aaa.entity.CarouselBookInfo;
import com.aaa.util.hibernateDB;
/**
 * 图书轮播信息impl
 * @author 范博源
 *
 */
@Repository
public class CarouselBookInfoImplDAO extends hibernateDB implements
		CarouselBookInfoDAO {

	@Override
	public boolean updateCarouselBookInfo(CarouselBookInfo carbi) {
		return super.saveObj(carbi);
	}

	@Override
	public List<CarouselBookInfo> queryAllCar() {
		String hql = "from CarouselBookInfo";
		return super.HqlQueryAll(hql, null);
	}

}
