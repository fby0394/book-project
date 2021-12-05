package com.aaa.dao;

import java.util.List;

import com.aaa.entity.BookCatalogInfo;

/**
 * 图书目录DAO
 * 
 * @author 范博源
 * 
 */
public interface BookCatalogInfoDAO {

	/**
	 * 根据图书id查看目录信息
	 * 
	 * @param bookiId
	 * @return
	 */
	public List<BookCatalogInfo> queryAll(String bookId);

	/**
	 * 添加目录信息
	 * 
	 * @param bci
	 * @return
	 */
	public boolean addBookCatalog(BookCatalogInfo bci);

	/**
	 * 查看指定的目录信息
	 * 
	 * @param catalogId
	 *            目录编号
	 * @param bookId
	 *            图书编号
	 * @return
	 */
	public BookCatalogInfo queryBci(String catalogId, String bookId);

	/**
	 * 根据当前页获取上一页或下一页
	 * 
	 * @param bookId
	 *            图书编号
	 * @param catalognum
	 *            对应的目录顺序
	 * @param num
	 *            上一页或下一页
	 * @return
	 */
	public List<BookCatalogInfo> pageTurning(String bookId, int catalognum,
			int num);

}
