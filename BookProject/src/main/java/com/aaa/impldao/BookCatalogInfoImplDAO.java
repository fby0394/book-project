package com.aaa.impldao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aaa.dao.BookCatalogInfoDAO;
import com.aaa.entity.BookCatalogInfo;
import com.aaa.util.hibernateDB;

/**
 * 图书目录信息实现类
 * 
 * @author 范博源
 * 
 */
@Repository
public class BookCatalogInfoImplDAO extends hibernateDB implements
		BookCatalogInfoDAO {

	@Override
	public List<BookCatalogInfo> queryAll(String bookId) {
		String hql = "from BookCatalogInfo where bookId=?0 order by catalognum,updateTime desc";
		return super.HqlQueryAll(hql, null, bookId);
	}

	@Override
	public boolean addBookCatalog(BookCatalogInfo bci) {
		return super.saveObj(bci);
	}

	@Override
	public BookCatalogInfo queryBci(String catalogId, String bookId) {
		String hql = "from BookCatalogInfo where bookId=?0 and catalogId=?1";
		return (BookCatalogInfo) super
				.HqlQueryAll(hql, null, bookId, catalogId).get(0);
	}

	@Override
	public List<BookCatalogInfo> pageTurning(String bookId, int catalognum,
			int num) {
		String hql = "from BookCatalogInfo where bookId=?0 and catalognum=?1";
		catalognum = num + catalognum;
		return super.HqlQueryAll(hql, 1, 1, null, bookId, catalognum);
	}

}
