package com.aaa.dao;

import java.util.List;

import com.aaa.entity.BookStyle;

/**
 * 图书风格DAO
 * 
 * @author 范博源
 * 
 */
public interface BookStyleDAO {

	/**
	 * 查看图书风格
	 * 
	 * @return
	 */
	public List<BookStyle> queryAll();

	/**
	 * 添加图书风格
	 * 
	 * @return
	 */
	public boolean savaBookStyle(BookStyle bst);

	/**
	 * 修改图书风格
	 * 
	 * @return
	 */
	public boolean updateBookStyle(BookStyle bst);
}
