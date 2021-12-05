package com.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.entity.BookStyle;
import com.aaa.impldao.BookStyleImplDAO;

/**
 * 图书风格service
 * 
 * @author 范博源
 * 
 */
@Service
@Transactional
public class BookStyleService {

	@Autowired
	private BookStyleImplDAO bstImpl;

	/**
	 * 查看图书风格
	 * 
	 * @return
	 */
	public List<BookStyle> queryAll() {
		return bstImpl.queryAll();
	}

	/**
	 * 添加图书风格
	 * 
	 * @return
	 */
	public boolean savaBookStyle(BookStyle bst) {
		return bstImpl.savaBookStyle(bst);
	}

	/**
	 * 修改图书风格
	 * 
	 * @return
	 */
	public boolean updateBookStyle(BookStyle bst) {
		return bstImpl.updateBookStyle(bst);
	}
}
