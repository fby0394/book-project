package com.aaa.impldao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aaa.dao.BookInfoDAO;
import com.aaa.entity.BookInfo;
import com.aaa.entity.BookState;
import com.aaa.entity.BookTypeInfo;
import com.aaa.util.Paging;
import com.aaa.util.hibernateDB;
import com.aaa.util.jpinyin.PinyinException;
import com.aaa.util.jpinyin.PinyinHelper;

/**
 * 图书信息实现类
 * 
 * @author 范博源
 * 
 */
@Repository
public class BookInfoImplDAO extends hibernateDB implements BookInfoDAO {

	@Override
	public List<BookInfo> queryAll() {
		String hql = "select b from BookInfo b inner join b.bstys bs where bs.bstid=2";
		return super.HqlQueryAll(hql, null);
	}

	@Override
	public List<BookInfo> frontQueryAll() {
		String hql = "from BookInfo b where b.bsid in(2,3,4)";
		return super.HqlQueryAll(hql, null);
	}

	@Override
	public List<BookInfo> queryAll(String bookname, String booknamesx,
			int[] btid, Integer authorid, int[] bsid, Integer readnum,
			Integer collectnum) {
		return null;
	}

	@Override
	public boolean addBookInfo(BookInfo bi) {
		try {
			bi.setBooknamesx(PinyinHelper.getShortPinyin(bi.getBookname()));
		} catch (PinyinException e) {
			e.printStackTrace();
		}
		return super.saveObj(bi);
	}

	@Override
	public boolean updateBookInfo(BookInfo bi) {
		bi.setBti(super.getObject(BookTypeInfo.class, bi.getBtid()));
		bi.setBst(super.getObject(BookState.class, bi.getBsid()));
		return super.updateObj(bi);
	}

	@Override
	public List<BookInfo> queryUpTime() {
		String hql = "from BookInfo b where b.bsid=2 order by b.addtime desc";
		return super.HqlQueryAll(hql, 15, 1, null);
	}

	@Override
	public List<BookInfo> queryIf(String order, String bsid) {
		String hql = "from BookInfo b ";
		hql += bsid;
		hql += order;
		return super.HqlQueryAll(hql, 10, 1, null);
	}

	@Override
	public List<BookInfo> queryBookInfo(String param) {
		String[] params = param.split(",");
		String hql = "select b from BookInfo b inner join b.bstys bs where b.bti."
				+ params[0]
				+ " and b.bst."
				+ params[2]
				+ " and bs."
				+ params[1];
		return super.HqlQueryAll(hql, null);
	}

	@Override
	public List<BookInfo> queryBookInfo(String param, int pageSize, int page) {
		String[] params = param.split(",");
		String hql = "select b from BookInfo b inner join b.bstys bs where b.bti."
				+ params[0]
				+ " and b.bst."
				+ params[2]
				+ " and bs."
				+ params[1];
		return super.HqlQueryAll(hql, pageSize, page, null);
	}

	@Override
	public Paging pagingQueryBookInfo(String param, int pageSize, int page) {
		String[] params = param.split(",");
		String hql = "select distinct b from BookInfo b inner join b.bstys bs where b.bti."
				+ params[0]
				+ " and b.bst."
				+ params[2]
				+ " and bs."
				+ params[1];
		return super.HqlPagingQuery(hql, pageSize, page, null);
	}

	@Override
	public BookInfo queryBook(String bookid) {
		String hql = "from BookInfo b where b.bookid=?0";
		return (BookInfo) super.HqlQueryAll(hql, null, bookid).get(0);
	}

	@Override
	public List<BookInfo> queryAuthorBookInfo(Integer authorid) {
		String hql = "from BookInfo b where b.authorid=?0 order by b.bsid,b.updatetime desc";
		return super.HqlQueryAll(hql, null, authorid);
	}

	@Override
	public List<BookInfo> checkBookName(String bookName) {
		String hql = "from BookInfo b where b.bookname=?0";
		return super.HqlQueryAll(hql, null, bookName);
	}

}
