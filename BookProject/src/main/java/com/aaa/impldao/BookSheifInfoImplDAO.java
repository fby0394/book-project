package com.aaa.impldao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aaa.dao.BookSheifInfoDAO;
import com.aaa.entity.BookCatalogInfo;
import com.aaa.entity.BookInfo;
import com.aaa.entity.BookSheifInfo;
import com.aaa.util.Paging;
import com.aaa.util.hibernateDB;

/**
 * 
 * @author 范博源
 * 
 */
@Repository
public class BookSheifInfoImplDAO extends hibernateDB implements
		BookSheifInfoDAO {

	@Override
	public List<BookSheifInfo> queryBookSheifInfoAll(Integer userid,
			String order) {
		String hql = "from BookSheifInfo bs where bs.userid=?0 order by ";
		hql += order;
		return super.HqlQueryAll(hql, null, userid);
	}

	@Override
	public List<BookSheifInfo> queryBookSheifInfo(Integer userid, String bookid) {
		String hql = "from BookSheifInfo where userid=?0 and bookid=?1";
		return super.HqlQueryAll(hql, null, userid, bookid);
	}

	@Override
	public boolean savaBookSheifInfo(BookSheifInfo bs) {
		return super.saveObj(bs);
	}

	@Override
	public boolean updateBookSheifInfo(BookSheifInfo bs) {
		String hql = "update BookSheifInfo set catalogid=?0 where userid=?1 and bookid=?2";
		return super.HqlExecQuery(hql, null, bs.getCatalogid(), bs.getUserid(),
				bs.getBookid());
	}

	@Override
	public boolean deleteBookSheifInfo(BookSheifInfo bs) {
		String hql = "delete BookSheifInfo where userid=?0 and bookid in ("
				+ bs.getBookid() + ")";
		return super.HqlExecQuery(hql, null, bs.getUserid());
	}

	@Override
	public Paging queryBsiAll(Integer userid, String order, int pageSize,
			int page) {
		String hql = "from BookSheifInfo bs where bs.userid=?0 order by ";
		hql += order;
		return super.HqlPagingQuery(hql, pageSize, page, null, userid);
	}

}
