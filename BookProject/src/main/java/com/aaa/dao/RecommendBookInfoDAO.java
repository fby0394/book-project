package com.aaa.dao;

import java.util.List;

import com.aaa.entity.RecommendBookInfo;

/**
 * 推荐的图书信息DAO
 * 
 * @author 范博源
 * 
 */
public interface RecommendBookInfoDAO {

	/**
	 * 查看每周推荐的图书信息
	 * 
	 * @return
	 */
	public List<RecommendBookInfo> queryWeekRecommend();

	/**
	 * 查看每日推荐的图书信息
	 * 
	 * @return
	 */
	public List<RecommendBookInfo> queryDayRecommend();

	/**
	 * 修改推荐的图书信息
	 * 
	 * @return
	 */
	public boolean updateRecommend(RecommendBookInfo rebi);
}
