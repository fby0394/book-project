package com.aaa.util;

import java.util.List;

/**
 * 分页显示
 * 
 * @author 范博源
 * 
 */
public class Paging {
	public Paging() {
		super();
	}

	// 页数
	private int currentPage;
	// 每页显示的个数
	private int pageSize;
	// 总页数
	private int totalPages;
	// 保存的实体类集合
	private List<?> pagingList;

	/**
	 * 
	 * @param currentPage
	 *            当前页数
	 * @param pageSize
	 *            每页显示的个数
	 * @param pagingList
	 *            存储的数据
	 */
	public Paging(int currentPage, int pageSize, List<?> pagingList) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.pagingList = pagingList;
	}

	/**
	 * 获取当前页数
	 * 
	 * @return
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * 获取每页显示的个数
	 * 
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 获取总页数
	 * 
	 * @return
	 */
	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<?> getPagingList() {
		return pagingList;
	}

	public void setPagingList(List<?> pagingList) {
		this.pagingList = pagingList;
	}

	public int getTotalPage(int count, int pageSize) {
		int totalPages = 0;
		if (count % pageSize == 0) {
			totalPages = (int) (count / pageSize);
		} else {
			totalPages = (int) (count / pageSize + 1);
		}
		return totalPages;
	}

	@Override
	public String toString() {
		return "Paging [currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", totalPages=" + totalPages + "]";
	}

}
