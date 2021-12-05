package com.aaa.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.aaa.entity.BookInfo;
import com.aaa.service.BookInfoService;
import com.aaa.util.ConversionType;
import com.aaa.util.FileUplocad;
import com.aaa.util.Paging;
import com.aaa.util.jpinyin.PinyinException;
import com.aaa.util.jpinyin.PinyinHelper;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 图书信息action
 * 
 * @author 范博源
 * 
 */
@ParentPackage("default")
@Namespace(value = "/BookInfo")
@Results({ @Result(name = "queryList", type = "json", params = { "root",
		"biList", "excludeProperties", "bci" }) })
public class BookInfoAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private BookInfoService biService;

	private List<BookInfo> biList;

	private File bookpic;
	private String bookpicFileName;

	// 图书信息
	private BookInfo bookif;

	// 图书分页的信息
	private Paging paging;
	// 查找图书的参数
	private String param;

	@Action(value = "/query")
	public String query() {
		return "queryList";
	}

	/**
	 * 添加图书信息
	 * 
	 * @return
	 */
	@Action(value = "/addBookInfo", results = { @Result(name = "success", type = "json", params = {
			"root", "biList" }) })
	public String addBookInfo() {
		String bookid = getBookId(bookif.getBookname(), bookif.getBti()
				.getBtid());
		bookif.setBookid(bookid);
		String picUrl = FileUplocad.Uplocad(bookpic, bookpicFileName,
				"image/bookPic", bookid);
		bookif.setBookpicurl(picUrl);
		if (biService.addBookInfo(bookif)) {
			biList = biService.queryAuthorBookInfo(bookif.getAuthor()
					.getUserid());
		} else {
			biList = null;
		}
		return "success";
	}

	/**
	 * 验证图书名是否已经存在
	 * 
	 * @return
	 */
	@Action(value = "/checkBookName", results = { @Result(name = "success", type = "json", params = {
			"root", "bookif" }) })
	public String checkBookName() {
		bookif = biService.checkBookName(bookif.getBookname());
		return "success";
	}

	/**
	 * 查找指定图书，并显示图书信息到页面
	 * 
	 * @return
	 */
	@Action(value = "/showBookInfo", results = { @Result(name = "success", type = "dispatcher", location = "/bookFront/BookInfo.jsp") })
	public String showBookInfo() {
		bookif = biService.queryBook(bookif.getBookid());
		return "success";
	}

	/**
	 * 打开小说搜索页面
	 * 
	 * @return
	 */
	@Action(value = "/showQueryBookInfo", results = { @Result(name = "success", type = "dispatcher", location = "/bookFront/BookInfoFind.jsp") })
	public String showQueryBookInfo() {
		return "success";
	}

	/**
	 * 查询图书信息
	 * 
	 * @return
	 */
	@Action(value = "/queryBookInfo", results = { @Result(name = "pagingQuery", type = "json", params = {
			"root", "paging" }) })
	public String queryBookInfo() {
		paging = biService.pagingQueryBookInfo(param, paging.getPageSize(),
				paging.getCurrentPage());
		return "pagingQuery";
	}

	/**
	 * 根据作者编号查看此作者的全部作品
	 * 
	 * @return
	 */
	@Action(value = "/queryAuthorBookInfo", results = { @Result(name = "queryList", type = "json", params = {
			"root", "biList" }) })
	public String queryAuthorBookInfo() {
		biList = biService.queryAuthorBookInfo(bookif.getAuthorid());
		return "queryList";
	}

	/**
	 * 查看最近上架的十本图书
	 * 
	 * @return
	 */
	@Action(value = "/queryUpTime")
	public String queryUpTime() {
		biList = biService.queryUpTime();
		return "queryList";
	}

	/**
	 * 查看全部小说的阅读排行榜
	 * 
	 * @return
	 */
	@Action(value = "/queryReadnumAll")
	public String queryReadnumAll() {
		biList = biService.queryIf(" order by b.readnum desc",
				"where b.bsid in(2,3,4)");
		return "queryList";
	}

	/**
	 * 查看完本小说的阅读排行榜
	 * 
	 * @return
	 */
	@Action(value = "/queryReadnum")
	public String queryReadnum() {
		biList = biService
				.queryIf(" order by b.readnum desc", "where b.bsid=4");
		return "queryList";
	}

	/**
	 * 查看全部小说收藏排行榜
	 * 
	 * @return
	 */
	@Action(value = "/queryCollectnumAll")
	public String queryCollectnumAll() {
		biList = biService.queryIf(" order by b.collectnum desc",
				"where b.bsid in(2,3,4)");
		return "queryList";
	}

	/**
	 * 查看新书收藏排行榜
	 * 
	 * @return
	 */
	@Action(value = "/queryCollectnum")
	public String queryCollectnum() {
		biList = biService.queryIf(" order by b.collectnum desc",
				"where b.bsid=4 ");
		return "queryList";
	}

	/**
	 * 添加图书时设置图书id
	 * 
	 * @param BookName
	 * @param btid
	 * @return
	 */
	private String getBookId(String BookName, int btid) {
		String bookid = "";
		try {
			bookid = btid
					+ PinyinHelper.getShortPinyin(BookName.substring(0, 2));
			bookid += ConversionType.getTimeString();
		} catch (PinyinException e) {
			e.printStackTrace();
		}
		return bookid;
	}

	public List<BookInfo> getBiList() {
		return biList;
	}

	public void setBiList(List<BookInfo> biList) {
		this.biList = biList;
	}

	public BookInfo getBookif() {
		return bookif;
	}

	public void setBookif(BookInfo bookif) {
		this.bookif = bookif;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public File getBookpic() {
		return bookpic;
	}

	public void setBookpic(File bookpic) {
		this.bookpic = bookpic;
	}

	public String getBookpicFileName() {
		return bookpicFileName;
	}

	public void setBookpicFileName(String bookpicFileName) {
		this.bookpicFileName = bookpicFileName;
	}

}
