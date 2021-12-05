<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@include file="/bookFront/implEasyui.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>图书详细信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@ include file="menu.jsp"%>
<style type="text/css">
body {
	font-size: 18px;
	background-color: #FAFAFA;
	margin: 0px;
}
#TopDiv{
	 height: auto;
	 margin-top: 10px;
	 width:100%;
	 border-bottom: 2px solid black;
	 padding-bottom: 10px;
}

#TopDiv span{
	margin-left: 10%;
	font-size: 16px;
	letter-spacing: 0.1em;
	color: #968d8d;
}

#TopDiv span a{
	color: #968d8d;
}
#HomeContent {
	height: auto;
	margin: auto;
	margin-top: -2.5px;
	padding-bottom: 25px;
	width: 80%;
	border-top: 2px solid #FF4500;
	border-bottom: 2px solid #FF4500;
	padding-top: 20px;
}

.BookInfoSPAN:hoser{
	color: #fb6b84 !important;
	cursor: hand;
	transition: color .2s, background-color .2s;
}
.BookInfoSPAN {
	border-bottom: 1.2px solid #FF4500;
	font-size: 20px;
	color: #FF4500;
	padding: 2px 15px 0px 5px;
}

.BookInfoDIV {
	font-size: 18px;
	padding-left: 5px;
	border-top: 1px solid #AAAAAA;
	margin-top: -2.2px;
}

#HomeContent .navul,#HomeContent .navul li {
	padding: 4px 0px;
	margin: 0px;
	list-style: none;
}

a:hover {
	color: #fb6b84 !important;
}

.typeli {
	color: #AAAAAA;
	font-size: 14px;
	padding: 0px;
	border-bottom: 1px dashed #AAAAAA;
}

.typeli a,.rankingBookInfoDiv a,.SelctTypeSpan a {
	color: black;
	font-size: 16px;
}

.rankingBookInfoDiv {
	font-size: 16px;
	padding: 10px 0px;
	border-bottom: 1px dashed #AAAAAA;
}

.rankingNumSpan {
	color: white;
	text-align: center;
	background-color: #AAAAAE;
	display: inline-block;
	width: 25px;
	height: 22px;
	margin-right: 4px;
	font-weight: bold;
}

.orderNum1 {
	color: white;
	background-color: #FF6347;
	padding: 4px 3px;
	margin-bottom: 5px;
	width: 45px;
	font-weight: bold;
}

.bookname,.bookAuthor,.bookType {
	height: 25px;
	padding-left: 5px;
}

.bookAuthor,.bookType {
	color: #AAAAAA;
}
.bookInfoStyle{
	font-size:14px;
	padding:4px 16px;
	border-radius:10px;
	margin-right:1%;
	background-color: #C7C7C7;
}
#BookCatalogInfoDiv .pull-left{
	width: 25%;
	border-bottom:1px solid #e5e5e5;
	font-size:14px;
	padding: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$(document).attr('title','${bookif.bookname }');
		showOrderBookInfo($("#WeekReommendUL"), "recommend/queryWeek");
		$("#DayReommendUL").hide();
		showOrderBookInfo($("#DayReommendUL"), "recommend/queryDay");
		$("#WeekReommendSpan").mouseenter(function() {
			$("#DayReommendSpan").css({
				"border-bottom-color" : "rgba(250,0,255,0)",
				"color" : "black"
			});
			$(this).css({
				"border-bottom-color" : "#FF4500",
				"color" : "#FF4500"
			});
			$("#DayReommendUL").hide();
			$("#WeekReommendUL").show();
		});
		$("#DayReommendSpan").mouseenter(function() {
			$("#WeekReommendSpan").css({
				"border-bottom-color" : "rgba(250,0,255,0)",
				"color" : "black"
			});
			$(this).css({
				"border-bottom-color" : "#FF4500",
				"color" : "#FF4500"
			});
			$("#WeekReommendUL").hide();
			$("#DayReommendUL").show();
		});

		addOrderBookInfo($("#collectnumOrderAllDiv"),
				"BookInfo/queryCollectnumAll");
		$("#readnumOrderAllDiv").hide();
		addOrderBookInfo($("#readnumOrderAllDiv"), "BookInfo/queryReadnumAll");
		$("#collectnumOrderAllSpan").mouseenter(function() {
			$("#readnumOrderAllSpan").css({
				"border-bottom-color" : "rgba(250,0,255,0)",
				"color" : "black"
			});
			$(this).css({
				"border-bottom-color" : "#FF4500",
				"color" : "#FF4500"
			});
			$("#readnumOrderAllDiv").hide();
			$("#collectnumOrderAllDiv").show();
		});
		$("#readnumOrderAllSpan").mouseenter(function() {
			$("#collectnumOrderAllSpan").css({
				"border-bottom-color" : "rgba(250,0,255,0)",
				"color" : "black"
			});
			$(this).css({
				"border-bottom-color" : "#FF4500",
				"color" : "#FF4500"
			});
			$("#collectnumOrderAllDiv").hide();
			$("#readnumOrderAllDiv").show();
		});
		$("#bookInfoDiv").height($("#bookInfoPic").height());
		
		$("#BookIntrodSpan").click(function() {
			$("#BookMessageSpan,#BookCatalogInfoSpan").css({
				"border-bottom-color" : "rgba(250,0,255,0)",
				"color" : "black"
			});
			$(this).css({
				"border-bottom-color" : "#FF4500",
				"color" : "#FF4500"
			});
			$("#BookMessageDiv,#BookCatalogInfoDiv").hide();
			$("#BookIntrodDiv").show();
		});
		$("#BookMessageSpan").click(function() {
			$("#BookIntrodSpan,#BookCatalogInfoSpan").css({
				"border-bottom-color" : "rgba(250,0,255,0)",
				"color" : "black"
			});
			$(this).css({
				"border-bottom-color" : "#FF4500",
				"color" : "#FF4500"
			});
			$("#BookIntrodDiv,#BookCatalogInfoDiv").hide();
			$("#BookMessageDiv").show();
		});
		$("#BookCatalogInfoSpan").click(function() {
			$("#BookMessageSpan,#BookIntrodSpan").css({
				"border-bottom-color" : "rgba(250,0,255,0)",
				"color" : "black"
			});
			$(this).css({
				"border-bottom-color" : "#FF4500",
				"color" : "#FF4500"
			});
			$("#BookMessageDiv,#BookIntrodDiv").hide();
			$("#BookCatalogInfoDiv").show();
		});
	});
	//读取排行图书信息
	function showOrderBookInfo(obj, url) {
		$.ajax({
			url : url,
			type : "post",
			dataType : "json",
			success : function(data) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<li class='typeli'>[" + data[i].bi.bti.btname
							+ "]<a href='BookInfo/showBookInfo?bookif.bookid="
							+ data[i].bi.bookid + "'> " + data[i].bi.bookname
							+ "</a><div class='pull-right'>"
							+ data[i].bi.author.uname + "</div</li>";
				}
				$(obj).html(html);
			}
		});
	}
	//添加排行榜的图书信息
	function addOrderBookInfo(obj, url) {
		obj = $(obj);
		$.ajax({
			url : url,
			type : "post",
			dataType : "json",
			async : false,
			success : function(data) {
				var divs = obj.find(".rankingBookInfoDiv");
				divs.eq(0).find(".bookname").html(
						"<a href='BookInfo/showBookInfo?bookif.bookid=" + data[0].bookid + "'>" + data[0].bookname + "</a>");
				divs.eq(0).find(".bookAuthor").html(
						"作者：" + data[0].author.uname);
				divs.eq(0).find(".bookType").html("类型：" + data[0].bti.btname);
				divs.eq(0).find("img").attr("src", "image/bookPic/"+ data[0].bookpicurl);
				for (var i = 1; i < data.length; i++) {
					divs.eq(i).find(".bookname").html(
							divs.eq(i).find(".bookname").html() + "<a href='BookInfo/showBookInfo?bookif.bookid="
									+ data[i].bookid + "'>"
									+ data[i].bookname + "</a>");
					divs.eq(i).find(".pull-right").html(data[i].author.uname);
				}

			},
			error : function() {
			}
		});
	}
	//判断用户是否阅读过此本书籍，如果阅读就跳转到此用户阅读记录，否则从第一章开始
	function openReadBook(){
		var catalogId="";
		if(user=="" && $("#bookSheifInfoDiv table tbody a[bookid='${bookif.bookid}']").size()==0){
			catalogId='${bookif.bci[0].catalogId }';
		}else{
			catalogId=$("#bookSheifInfoDiv table tbody a[bookid='${bookif.bookid}']").eq(0).attr("catalogId");
		}
		window.location.href="Bci/showBci?bci.bookId=${bookif.bookid }&bci.catalogId="+catalogId;
	}
</script>
</head>

<body>
	<div id="TopDiv">
		<span>当前位置：
		<a href="bookfront/HomePage.jsp">首页</a> &raquo; 
		<a href="BookInfo/showQueryBookInfo?bookif.btid=${bookif.bti.btid }">${bookif.bti.btname }</a> &raquo; 
		${bookif.bookname }
		</span>
	</div>
	<div id="HomeContent">
		<div class="pull-left" style="width: 72%;">
			<img class="img-rounded" id="bookInfoPic" alt='' src='image/bookPic/${bookif.bookpicurl }'
				width='30%' />
			<div id="bookInfoDiv" class="pull-right" style="width:68%;">
				<div style="height:15%;min-height: 30px;">
					<span style="font-size: 20px;font-weight: bold;margin-right: 2%;">${bookif.bookname }</span>
					<span style="font-size: 16px;color:#6C7B8B">文/ ${bookif.author.uname }</span>
				</div>
				<div style="height:15%;min-height: 30px;">
					<div class="pull-left" style="margin-right: 2%;">状态：${bookif.bst.bsname }</div> <div class="pull-left" style="margin-right: 2%;">类别：${bookif.bti.btname }</div>
					<c:forEach items="${bookif.bstys }" var="bsty">
					<div class="pull-left" class="bookInfoStyle">${bsty.bstname }</div>
					</c:forEach>
					<div class="clearfix"></div>
				</div>
				<div style="height:25%;min-height: 30px;">
					<span style="margin-right: 2%;">总字数：${bookif.booksize }</span>
					<span style="margin-right: 2%;">阅读量：${bookif.readnum }</span>
					<span style="margin-right: 2%;">收藏数：${bookif.collectnum }</span>
				</div>
				<div style="height:15%;min-height: 30px;">最新章节：
				<a href="Bci/showBci?bci.bookId=${bookif.bookid }&bci.catalogId=${bookif.bci[bookif.bci.size()-1].catalogId }" style="color:black;">${bookif.bci[0].catalogTitle }</a></div>
				<div style="height:30%;min-height: 30px;">
					<button type="button" class="btn btn-danger" onclick="openReadBook()">开始阅读</button>
					<button bookid="${bookif.bookid }" onclick="addBookSheifInfo(this)" catalogid="${bookif.bci[0].catalogId }" type="button" class="btn btn-danger">加入书架</button>
					<button type="button" class="btn btn-danger">收藏本书</button>
				</div>
			</div>
			<div class="clearfix"></div>
			<div style="margin-top: 15px;">
				<span class="BookInfoSPAN" id="BookIntrodSpan">作品介绍</span> <span
					class="BookInfoSPAN" id="BookMessageSpan"
					style="border-bottom: 1.2px solid rgba(250,0,255,0);color:black;">作品讨论</span>
				<span class="BookInfoSPAN" id="BookCatalogInfoSpan"
					style="border-bottom: 1.2px solid rgba(250,0,255,0);color:black;">作品目录</span>
				<div class="BookInfoDIV" style="padding-top: 10px;">
					<div id="BookIntrodDiv">图书简介</div>
					<div id="BookMessageDiv" style="display: none;">图书讨论</div>
					<div id="BookCatalogInfoDiv" style="display: none;">
						<c:forEach items="${bookif.bci }" var="bci" varStatus="thisBci">
							<div class="pull-left">
							<span><a href="Bci/showBci?bci.bookId=${bci.bookId }&bci.catalogId=${bci.catalogId }" style="color:black;">${bci.catalogTitle }</a></span>
							<span class="pull-right">${bci.catalogPrice }</span>
							</div>
						</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
		<div class="pull-right" style="width:25%;">
			<div>
				<span class="BookInfoSPAN" id="WeekReommendSpan">本周推荐</span> <span
					class="BookInfoSPAN" id="DayReommendSpan"
					style="border-bottom: 1.2px solid rgba(250,0,255,0);color:black;">今日推荐</span>
				<div class="BookInfoDIV">
					<ul class="navul" id="WeekReommendUL">
					</ul>
					<ul class="navul" id="DayReommendUL">
					</ul>
				</div>
			</div>
			<div style="margin-top: 10px;">
				<span class="BookInfoSPAN" id="collectnumOrderAllSpan">阅读榜</span> <span
					class="BookInfoSPAN" id="readnumOrderAllSpan"
					style="border-bottom: 1.2px solid rgba(250,0,255,0);color:black;">收藏榜</span>
				<div class="BookInfoDIV" id="collectnumOrderAllDiv">
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="orderNum1">NO 1</div>
							<div class="bookName"></div>
							<div class="bookAuthor">作者:</div>
							<div class="bookType">类型:</div>
						</div>
						<div class="pull-right">
							<a href=""><img src="" height="100px;" /></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan" style="background-color: #EE7600;">2</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan" style="background-color: #EEDC82;">3</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">4</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">5</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">6</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">7</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">8</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">9</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">10</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="BookInfoDIV" id="readnumOrderAllDiv">
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="orderNum1">NO 1</div>
							<div class="bookName"></div>
							<div class="bookAuthor">作者:</div>
							<div class="bookType">类型:</div>
						</div>
						<div class="pull-right">
							<a href=""><img src="" height="100px;" /></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan" style="background-color: #EE7600;">2</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan" style="background-color: #EEDC82;">3</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">4</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">5</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">6</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">7</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">8</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">9</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
					<div class="rankingBookInfoDiv">
						<div class="pull-left">
							<div class="bookName">
								<span class="rankingNumSpan">10</span>
							</div>
						</div>
						<div class="pull-right" style="color: #AAAAAA"></div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="bottomDiv">
		<div class="bottomMenu">
			<a>关于本站</a>
			<a>联系我们</a>
			<a>作者帮助</a>
			<a>会员帮助</a>
		</div>
		<p>
			版权所有：AAA软件学院A309。<a href="http://www.miibeian.gov.cn/" target="_blank">豫ICP备400000010001号</a>
		</p>
	</div>
</body>
</html>
