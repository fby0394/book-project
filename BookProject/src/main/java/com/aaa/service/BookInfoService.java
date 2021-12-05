package com.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.entity.BookInfo;
import com.aaa.impldao.BookInfoImplDAO;
import com.aaa.util.Paging;

/**
 * 图书信息service
 * 
 * @author 范博源
 * 
 */
@Service
@Transactional
public class BookInfoService {

	@Autowired
	private BookInfoImplDAO biimp;

	/**
	 * 查看全部图书
	 * 
	 * @return
	 */
	public List<BookInfo> queryAll() {
		return biimp.queryAll();
	}

	/**
	 * 查询指定图书
	 * 
	 * @param bookid
	 * @return
	 */
	public BookInfo queryBook(String bookid) {
		return biimp.queryBook(bookid);
	}

	/**
	 * 前台查看全部图书
	 * 
	 * @return
	 */
	public List<BookInfo> frontQueryAll() {
		return biimp.frontQueryAll();
	}

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
			Integer collectnum) {
		return biimp.queryAll(bookname, booknamesx, btid, authorid, bsid,
				readnum, collectnum);
	}

	/**
	 * 添加图书信息
	 * 
	 * @param bi
	 * @return
	 */
	public boolean addBookInfo(BookInfo bi) {
		return biimp.addBookInfo(bi);
	}

	/**
	 * 修改图书信息
	 * 
	 * @param bi
	 * @return
	 */
	public boolean updateBookInfo(BookInfo bi) {
		return biimp.updateBookInfo(bi);
	}

	/**
	 * 查询最近上架的十本图书
	 * 
	 * @return
	 */
	public List<BookInfo> queryUpTime() {
		return biimp.queryUpTime();
	}

	/**
	 * 根据条件查看图书信息(显示前台排行信息)
	 * 
	 * @param order
	 * @param bsid
	 * @return
	 */
	public List<BookInfo> queryIf(String order, String bsid) {
		return biimp.queryIf(order, bsid);
	}

	/**
	 * 根据条件搜索图书
	 * 
	 * @param param
	 * @return
	 */
	public List<BookInfo> queryBookInfo(String param) {
		return biimp.queryBookInfo(param);
	}

	/**
	 * 根据条件搜索图书 然后分页显示
	 * 
	 * @param param
	 *            参数
	 * @param pageSize
	 *            每页显示的个数
	 * @param currentPage
	 *            当前页
	 * @return
	 */
	public List<BookInfo> queryBookInfo(String param, int pageSize,
			int currentPage) {
		return biimp.queryBookInfo(param);
	}

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
	public Paging pagingQueryBookInfo(String param, int pageSize, int page) {
		return biimp.pagingQueryBookInfo(param, pageSize, page);
	}

	/**
	 * 根据作者编号查看此作者的全部作品
	 * 
	 * @param authorid
	 * @return
	 */
	public List<BookInfo> queryAuthorBookInfo(Integer authorid) {
		return biimp.queryAuthorBookInfo(authorid);
	}

	public BookInfo checkBookName(String bookName) {
		List<BookInfo> list = biimp.checkBookName(bookName);
		if (null != list && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}
}
