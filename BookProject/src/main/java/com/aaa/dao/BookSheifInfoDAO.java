package com.aaa.dao;

import java.util.List;

import com.aaa.entity.BookSheifInfo;
import com.aaa.util.Paging;

/**
 * 书架信息DAO
 * 
 * @author 范博源
 * 
 */
public interface BookSheifInfoDAO {
	/**
	 * 根据用户id查看用户的书架信息
	 * 
	 * @param userid
	 * @param order
	 *            排序的参数
	 * @return
	 */
	public List<BookSheifInfo> queryBookSheifInfoAll(Integer userid,
			String order);

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
			int page);

	/**
	 * 查看图书是否已经在书架中
	 * 
	 * @param userid
	 * @param bookid
	 * @return
	 */
	public List<BookSheifInfo> queryBookSheifInfo(Integer userid, String bookid);

	/**
	 * 添加图书至书架
	 * 
	 * @param bs
	 * @return
	 */
	public boolean savaBookSheifInfo(BookSheifInfo bs);

	/**
	 * 修改图书在书架中的信息
	 * 
	 * @param bs
	 * @return
	 */
	public boolean updateBookSheifInfo(BookSheifInfo bs);

	/**
	 * 删除书架中的指定图书
	 * 
	 * @param bs
	 * @return
	 */
	public boolean deleteBookSheifInfo(BookSheifInfo bs);
}
