package com.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.entity.BookCatalogInfo;
import com.aaa.impldao.BookCatalogInfoImplDAO;

/**
 * 图书目录Service
 * 
 * @author 范博源
 * 
 */
@Service
@Transactional
public class BookCatalogInfoService {

	@Autowired
	private BookCatalogInfoImplDAO bciImp;

	/**
	 * 根据图书id查看目录信息
	 * 
	 * @param bookiId
	 * @return
	 */
	public List<BookCatalogInfo> queryAll(String bookId) {
		return bciImp.queryAll(bookId);
	}

	/**
	 * 添加目录信息
	 * 
	 * @param bci
	 * @return
	 */
	public boolean addBookCatalog(BookCatalogInfo bci) {
		return bciImp.addBookCatalog(bci);
	}

	/**
	 * 查看指定目录信息
	 * 
	 * @param catalogId
	 *            目录编号
	 * @param bookId
	 *            图书编号
	 * @return
	 */
	public BookCatalogInfo queryBci(String catalogId, String bookId) {
		return bciImp.queryBci(catalogId, bookId);
	}

	/**
	 * 根据现有章节返回下一章节或上一章节
	 * 
	 * @param bookId
	 * @param catalognum
	 * @param num
	 * @return
	 */
	public BookCatalogInfo pageTurning(String bookId, int catalognum, int num) {
		List<BookCatalogInfo> list = bciImp
				.pageTurning(bookId, catalognum, num);
		if (null != list && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
