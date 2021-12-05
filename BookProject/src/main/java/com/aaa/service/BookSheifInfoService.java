package com.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.entity.BookSheifInfo;
import com.aaa.impldao.BookSheifInfoImplDAO;
import com.aaa.util.Paging;

/**
 * 书架信息Service
 * 
 * @author 范博源
 * 
 */
@Service
@Transactional
public class BookSheifInfoService {
	@Autowired
	private BookSheifInfoImplDAO bsImpl;

	/**
	 * 根据用户id查看用户的书架信息
	 * 
	 * @param userid
	 * @return
	 */
	public List<BookSheifInfo> queryBookSheifInfoAll(Integer userid,
			String order) {
		return bsImpl.queryBookSheifInfoAll(userid, order);
	}

	/**
	 * 分页查看用户的书架信息
	 * 
	 * @param userid
	 *            用户id
	 * @param order
	 *            排序的参数
	 * @param pageSize
	 *            每页显示的个数
	 * @param page
	 *            当前页数
	 * @return
	 */
	public Paging queryBsiAll(Integer userid, String order, int pageSize,
			int page) {
		return bsImpl.queryBsiAll(userid, order, pageSize, page);
	}

	/**
	 * 查看图书是否已经在书架中
	 * 
	 * @param userid
	 * @param bookid
	 * @return
	 */
	public boolean queryBookSheifInfo(Integer userid, String bookid) {
		List<BookSheifInfo> list = bsImpl.queryBookSheifInfo(userid, bookid);
		if (list != null && list.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 添加图书至书架
	 * 
	 * @param bs
	 * @return
	 */
	public boolean savaBookSheifInfo(BookSheifInfo bs) {
		return bsImpl.savaBookSheifInfo(bs);
	}

	/**
	 * 修改图书在书架中的信息
	 * 
	 * @param bs
	 * @return
	 */
	public boolean updateBookSheifInfo(BookSheifInfo bs) {
		return bsImpl.updateBookSheifInfo(bs);
	}

	/**
	 * 删除书架中的指定图书
	 * 
	 * @param bs
	 * @return
	 */
	public boolean deleteBookSheifInfo(BookSheifInfo bs) {
		return bsImpl.deleteBookSheifInfo(bs);
	}
}
