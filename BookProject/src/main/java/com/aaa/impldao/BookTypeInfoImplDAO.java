package com.aaa.impldao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aaa.dao.BookTypeInfoDAO;
import com.aaa.entity.BookTypeInfo;
import com.aaa.util.hibernateDB;

/**
 * 图书类型实现类
 * 
 * @author 范博源
 * 
 */
@Repository
public class BookTypeInfoImplDAO extends hibernateDB implements BookTypeInfoDAO {

	@Override
	public List<BookTypeInfo> queryAll() {
		String hql = "from BookTypeInfo";
		return super.HqlQueryAll(hql, null);
	}

	@Override
	public boolean addBookTypeInfo(BookTypeInfo bti) {
		return super.saveObj(bti);
	}

	@Override
	public boolean updateBookTypeInfo(BookTypeInfo bti) {
		return super.updateObj(bti);
	}

}
