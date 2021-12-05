package com.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.entity.BookTypeInfo;
import com.aaa.impldao.BookTypeInfoImplDAO;

/**
 * 图书类型service
 * 
 * @author 范博源
 * 
 */
@Service
@Transactional
public class BookTypeInfoService {

	@Autowired
	private BookTypeInfoImplDAO btiimp;

	/**
	 * 查看全部图书类型
	 * 
	 * @return
	 */
	public List<BookTypeInfo> queryAll() {
		return btiimp.queryAll();
	}

	/**
	 * 添加图书类型
	 * 
	 * @param bti
	 * @return
	 */
	public boolean addBookTypeInfo(BookTypeInfo bti) {
		return btiimp.addBookTypeInfo(bti);
	}

	/**
	 * 修改图书类型
	 * 
	 * @param bti
	 * @return
	 */
	public boolean updateBookTypeInfo(BookTypeInfo bti) {
		return btiimp.updateBookTypeInfo(bti);
	}
}
