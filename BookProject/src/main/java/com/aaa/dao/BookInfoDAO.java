package com.aaa.dao;

import java.util.List;

import com.aaa.entity.BookInfo;
import com.aaa.util.Paging;

/**
 * 图书信息DAO接口
 * 
 * @author 范博源
 * 
 */
public interface BookInfoDAO {

	/**
	 * 查看全部图书
	 * 
	 * @return
	 */
	public List<BookInfo> queryAll();

	/**
	 * 前台查看全部图书(不查询未审核和已经封禁的)
	 * 
	 * @return
	 */
	public List<BookInfo> frontQueryAll();

	/**
	 * 查询最近上架的十本图书
	 * 
	 * @return
	 */
	public List<BookInfo> queryUpTime();

	/**
	 * 查询指定图书
	 * 
	 * @param bookid
	 * @return
	 */
	public BookInfo queryBook(String bookid);

	/**
	 * 根据不同条件查询图书信息
	 * 
	 * @param bookname
	 *            图书名称（模糊查询）
	 * @param booknamesx
	 *            图书名称缩写（模糊查询）
	 * @param btid
	 *            图书类型（可以选择多个）
	 * @param authorid
	 *            图书作者
	 * @param bsid
	 *            图书状态 （可以选择多个）
	 * @param readnum
	 *            图书阅读量（用于排序）
	 * @param collectnum
	 *            图书点击量（用于排序）
	 * @return
	 */
	public List<BookInfo> queryAll(String bookname, String booknamesx,
			int[] btid, Integer authorid, int[] bsid, Integer readnum,
			Integer collectnum);

	/**
	 * 根据条件查看图书信息
	 * 
	 * @param order
	 *            排序的列
	 * @param bsid
	 *            图书的状态
	 * @return
	 */
	public List<BookInfo> queryIf(String order, String bsid);

	/**
	 * 添加图书信息
	 * 
	 * @param bi
	 * @return
	 */
	public boolean addBookInfo(BookInfo bi);

	/**
	 * 修改图书信息
	 * 
	 * @param bi
	 * @return
	 */
	public boolean updateBookInfo(BookInfo bi);

	/**
	 * 根据不同条件查询图书
	 * 
	 * @param param
	 * @return
	 */
	public List<BookInfo> queryBookInfo(String param);

	/**
	 * 根据不同条件查询图书(分页)
	 * 
	 * @param param
	 *            条件
	 * @param pageSize
	 *            每页显示的个数
	 * @param page
	 *            当前页
	 * @return
	 */
	public List<BookInfo> queryBookInfo(String param, int pageSize, int page);

	/**
	 * 根据不同条件查询图书(分页),并保存全部页数
	 * 
	 * @param param
	 *            条件
	 * @param pageSize
	 *            每页显示的个数
	 * @param page
	 *            当前页
	 * @return
	 */
	public Paging pagingQueryBookInfo(String param, int pageSize, int page);

	/**
	 * 根据作者编号查看此作者的全部作品
	 * 
	 * @param userid
	 *            作者编号
	 * @return
	 */
	public List<BookInfo> queryAuthorBookInfo(Integer authorid);

	/**
	 * 验证图书名是否已经存在
	 * 
	 * @param bookName
	 * @return
	 */
	public List<BookInfo> checkBookName(String bookName);

}
