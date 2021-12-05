package com.aaa.impldao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aaa.dao.BookStyleDAO;
import com.aaa.entity.BookStyle;
import com.aaa.util.hibernateDB;

/**
 * 图书风格实现类
 * 
 * @author 范博源
 * 
 */
@Repository
public class BookStyleImplDAO extends hibernateDB implements BookStyleDAO {

	@Override
	public List<BookStyle> queryAll() {
		String hql = "from BookStyle";
		return super.HqlQueryAll(hql, null);
	}

	@Override
	public boolean savaBookStyle(BookStyle bst) {
		return super.saveObj(bst);
	}

	@Override
	public boolean updateBookStyle(BookStyle bst) {
		return super.updateObj(bst);
	}

}
