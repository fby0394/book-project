package com.aaa.dao;

import java.util.List;

import com.aaa.entity.BookTypeInfo;

/**
 * 图书类型接口
 * 
 * @author 范博源
 * 
 */
public interface BookTypeInfoDAO {

	/**
	 * 查看全部图书类型
	 * 
	 * @return
	 */
	public List<BookTypeInfo> queryAll();

	/**
	 * 添加图书类型
	 * 
	 * @param bti
	 * @return
	 */
	public boolean addBookTypeInfo(BookTypeInfo bti);

	/**
	 * 修改图书类型
	 * 
	 * @param bti
	 * @return
	 */
	public boolean updateBookTypeInfo(BookTypeInfo bti);
}
