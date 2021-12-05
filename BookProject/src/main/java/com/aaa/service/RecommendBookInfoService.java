package com.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.entity.RecommendBookInfo;
import com.aaa.impldao.RecommendBookInfoImplDAO;

/**
 * 推荐图书service
 * 
 * @author 范博源
 * 
 */
@Service
@Transactional
public class RecommendBookInfoService {

	@Autowired
	private RecommendBookInfoImplDAO rebiimp;

	/**
	 * 查看每周推荐的图书信息
	 * 
	 * @return
	 */
	public List<RecommendBookInfo> queryWeekRecommend() {
		return rebiimp.queryWeekRecommend();
	}

	/**
	 * 查看每日推荐的图书信息
	 * 
	 * @return
	 */
	public List<RecommendBookInfo> queryDayRecommend() {
		return rebiimp.queryDayRecommend();
	}

	/**
	 * 修改推荐的图书信息
	 * 
	 * @return
	 */
	public boolean updateRecommend(RecommendBookInfo rebi) {
		return rebiimp.updateObj(rebi);
	}
}
