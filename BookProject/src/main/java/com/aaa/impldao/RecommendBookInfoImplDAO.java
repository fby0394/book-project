package com.aaa.impldao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aaa.dao.RecommendBookInfoDAO;
import com.aaa.entity.RecommendBookInfo;
import com.aaa.util.hibernateDB;

/**
 * 推荐图书ImplDAO
 * 
 * @author 范博源
 * 
 */
@Repository
public class RecommendBookInfoImplDAO extends hibernateDB implements
		RecommendBookInfoDAO {

	@Override
	public List<RecommendBookInfo> queryWeekRecommend() {
		String hql = "from RecommendBookInfo r where r.recommendid<16 order by recommendid";
		return super.HqlQueryAll(hql, null);
	}

	@Override
	public List<RecommendBookInfo> queryDayRecommend() {
		String hql = "from RecommendBookInfo r where r.recommendid between 21 and 35 order by recommendid";
		return super.HqlQueryAll(hql, null);
	}

	@Override
	public boolean updateRecommend(RecommendBookInfo rebi) {
		return super.updateObj(rebi);
	}

}
