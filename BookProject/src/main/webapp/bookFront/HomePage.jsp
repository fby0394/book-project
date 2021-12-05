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

<title>小说阅读</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	font-size: 18px;
	background-color: #FAFAFA;
	margin: 0px;
}

#HomeContent .navul,#HomeContent .navul li {
	padding: 4px 0px;
	margin: 0px;
	list-style: none;
}

.typeli {
	color: #AAAAAA;
	font-size: 14px;
}

.typeli a,.rankingBookInfoDiv a{
	color: black;
	font-size: 16px;
}

.typeli a:HOVER,.rankingBookInfoDiv a:hover {
	color: #EE2C2C;
}

#HomeContent {
	height: auto;
	margin: auto;
	margin-top: -2.5px;
	padding-bottom:25px;
	width: 80%;
	border-top: 2px solid #FF4500;
	border-bottom: 2px solid #FF4500;
	padding-top: 10px;
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
	display:inline-block;
	padding: 0 35px;
	line-height: 40px;
	color: #000;
}
#HomeContent a,#TopDiv span a{
	text-decoration: none;
}

#HomeContent a:hover ,#TopDiv span a:hover{
	cursor: hand;
}
.BookInfoSPAN{
	border-bottom: 1.2px solid #FF4500;
	font-size: 22px;
	padding: 2px 15px 0px 5px;
}
.BookInfoDIV{
	font-size: 18px;
	padding-left: 5px;
	border-top:1px solid #AAAAAA;
	margin-top: -3px;
}
.DayReommendDiv{
	font-size: 16px;
	width: 33%;
	margin: 10px 0px;
	padding-left: 15px;
}
.rankingBookInfoDiv{
	font-size:16px;
	padding: 10px 0px;
	border-bottom: 1px dashed #AAAAAA;
}
.rankingNumSpan{
	color: white;
	text-align:center;
	background-color: #AAAAAE;
	display:inline-block;
	width:25px;
	height:22px;
	margin-right: 4px;
	font-weight: bold;
}
.orderNum1{
	color: white;
	background-color: #FF6347;
	padding: 4px 3px;
	margin-bottom: 5px;
	width: 45px;
	font-weight: bold;
}
.bookname,.bookAuthor,.bookType{
	height: 25px;
	padding-left: 5px;
}
.bookAuthor,.bookType{
	color: #AAAAAA;
}
</style>
<script type="text/javascript">
	$(function() {
		//使图片轮播从左往右开始轮播
		$("#CarouselBookInfo").carousel('cycle');

		//读取最新上架的图书
		$.ajax({
			url : "BookInfo/queryUpTime",
			type : "post",
			dataType : "json",
			async : false,
			success : function(data) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<li class='typeli'>[" + data[i].bti.btname
							+ "]<a href='BookInfo/showBookInfo?bookif.bookid="
							+ data[i].bookid+"' target='_blank'> " + data[i].bookname
							+ "</a></li>";
					}
				$("#upTimeUL").html(html);
			},
			error : function() {}
		});
		//读取每周推荐的图书
		$.ajax({
			url : "recommend/queryWeek",
			type : "post",
			dataType : "json",
			async : false,
			success : function(data) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<li class='typeli'>[" + data[i].bi.bti.btname
							+ "]<a href='BookInfo/showBookInfo?bookif.bookid="
							+ data[i].bi.bookid+"' target='_blank'> " + data[i].bi.bookname
							+ "</a></li>";
				}
				$("#WeekReommendUL").html(html);
			},
			error : function() {

			}
		});
		//读取每日推荐的图书
		$.ajax({
			url : "recommend/queryDay",
			type : "post",
			dataType : "json",
			async : false,
			success : function(data) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<li class='typeli'>[" + data[i].bi.bti.btname
					+ "]<a href='BookInfo/showBookInfo?bookif.bookid="
					+ data[i].bi.bookid+"' style='font-size:14px;' target='_blank'> " + data[i].bi.bookname
					+ "</a></li>";
					if(i==4){
						$("#DayReommend1").html(html);
						html="";
					}else if(i==9){
						$("#DayReommend2").html(html);
						html="";
					}else if(i==14){
						$("#DayReommend3").html(html);
					}
				}
			},
			error : function() {}
		});
		addOrderBookInfo($("#collectnumOrderAll"),"BookInfo/queryCollectnumAll");
		addOrderBookInfo($("#collectnumOrder"),"BookInfo/queryCollectnum");
		addOrderBookInfo($("#readnumOrderAll"),"BookInfo/queryReadnumAll");
		addOrderBookInfo($("#readnumOrder"),"BookInfo/queryReadnum");
	});
	
//添加排行榜的图书信息
function addOrderBookInfo(obj,url){
	obj=$(obj);
	$.ajax({
		url : url,
		type : "post",
		dataType : "json",
		async : false,
		success : function(data) {
			var divs=obj.find(".rankingBookInfoDiv");
			divs.eq(0).find(".bookname").html("<a href='BookInfo/showBookInfo?bookif.bookid="
					+ data[0].bookid+"' target='_blank'>"+data[0].bookname+"</a>");
			divs.eq(0).find(".bookAuthor").html("作者："+data[0].author.uname);
			divs.eq(0).find(".bookType").html("类型："+data[0].bti.btname);
			divs.eq(0).find("img").attr("src","image/bookPic/"+ data[0].bookpicurl);
			for(var i = 1; i < data.length; i++){
				divs.eq(i).find(".bookname").html(divs.eq(i).find(".bookname").html()+"<a href='BookInfo/showBookInfo?bookif.bookid="
						+ data[i].bookid+"' target='_blank'>"+data[i].bookname+"</a>");
				divs.eq(i).find(".pull-right").html(data[i].author.uname);
			}
			
		},
		error : function() {}
	});
}
</script>
<%@ include file="menu.jsp"%>
</head>

<body>
	<div id="TopDiv">
		<span>
		<a href="BookInfo/showQueryBookInfo?bookif.bsid=0">全部作品</a>
		<a href="BookInfo/showQueryBookInfo?bookif.bsid=2">新书</a>
		<a href="BookInfo/showQueryBookInfo?bookif.bsid=3">连载</a>
		<a href="BookInfo/showQueryBookInfo?bookif.bsid=4">完结</a>
		</span>
	</div>
	<div id="HomeContent">
		<div class="pull-left" style="width:19%;">
			<span class="BookInfoSPAN">本周推荐</span>
			<div class="BookInfoDIV">
				<ul class="navul" id="WeekReommendUL">

				</ul>
			</div>
		</div>
		<div class="pull-left" style="width:58%;margin: 0 2%;">
			<div id="CarouselBookInfo" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#CarouselBookInfo" data-slide-to="0"
						class="active"></li>
					<li data-target="#CarouselBookInfo" data-slide-to="1"></li>
					<li data-target="#CarouselBookInfo" data-slide-to="2"></li>
					<li data-target="#CarouselBookInfo" data-slide-to="3"></li>
					<li data-target="#CarouselBookInfo" data-slide-to="4"></li>
				</ol>

				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="image/carouselPic/1.jpg" width="100%" height="100%" alt="图片1">
					</div>
					<div class="item">
						<img src="image/carouselPic/2.jpg" width="100%" height="100%" alt="图片2">
					</div>
					<div class="item">
						<img src="image/carouselPic/3.jpg" width="100%" height="100%" alt="图片3">
					</div>
					<div class="item">
						<img src="image/carouselPic/4.jpg" width="100%" height="100%" alt="图片4">
					</div>
					<div class="item">
						<img src="image/carouselPic/5.jpg" width="100%" height="100%" alt="图片5">
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#CarouselBookInfo"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#CarouselBookInfo"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<div style="border:1px solid #AAAAAA;margin-top: 2px;">
				<div style="border-bottom: 1px solid red;font-size: 22px;padding:5px;">今日推荐</div>
				<div class="pull-left DayReommendDiv">
					<ul class="navul" id="DayReommend1">
					</ul>
				</div>
				<div class="pull-left DayReommendDiv" style="border-left: 1px dashed #AAAAAA;border-right: 1px dashed #AAAAAA;">
					<ul class="navul" id="DayReommend2">
					</ul>
				</div>
				<div class="pull-left DayReommendDiv">
					<ul class="navul" id="DayReommend3">
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="pull-left" style="width:19%;">
			<span class="BookInfoSPAN">最新上架</span>
			<div class="BookInfoDiv">
				<ul class="navul" id="upTimeUL">
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="pull-left" style="width: 49.5%;"><img alt="" width="100%" src="image/carouselPic/middle1.jpg">
			<div class="pull-left" style="width: 49%;margin-top: 5px;">
			<span class="BookInfoSPAN">原创收藏榜</span>
			<div class="BookInfoDIV" id="collectnumOrderAll">
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="orderNum1"> NO 1 </div>
						<div class="bookName"></div>
						<div class="bookAuthor">作者:</div>
						<div class="bookType">类型:</div>
					</div>
					<div class="pull-right"><a href=""><img src="" height="100px;"/></a></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" style="background-color: #EE7600;">2</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" style="background-color: #EEDC82;">3</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >4</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >5</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >6</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >7</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >8</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >9</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >10</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
			</div>
			</div>
			<div class="pull-right" style="width: 49%;margin-top: 5px;">
			<span class="BookInfoSPAN">新书收藏榜</span>
			<div class="BookInfoDIV" id="collectnumOrder">
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="orderNum1"> NO 1 </div>
						<div class="bookName"></div>
						<div class="bookAuthor">作者:</div>
						<div class="bookType">类型:</div>
					</div>
					<div class="pull-right"><a href=""><img src="image/bookPic/book1.jpg" height="100px;"/></a></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" style="background-color: #EE7600;">2</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" style="background-color: #EEDC82;">3</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >4</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >5</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >6</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >7</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >8</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >9</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >10</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
			</div>
			</div>
		</div>
		<div class="pull-right" style="width: 49.5%;"><img alt="" width="100%" src="image/carouselPic/middle2.jpg">
			<div class="pull-left" style="width: 49%;margin-top: 5px;">
			<span class="BookInfoSPAN">原创阅读榜</span>
			<div class="BookInfoDIV" id="readnumOrderAll">
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="orderNum1"> NO 1 </div>
						<div class="bookName"></div>
						<div class="bookAuthor">作者:</div>
						<div class="bookType">类型:</div>
					</div>
					<div class="pull-right"><a href=""><img src="image/bookPic/book1.jpg" height="100px;"/></a></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" style="background-color: #EE7600;">2</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" style="background-color: #EEDC82;">3</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >4</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >5</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >6</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >7</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >8</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >9</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >10</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
			</div>
			</div>
			<div class="pull-right" style="width: 49%;margin-top: 5px;">
			<span class="BookInfoSPAN">完本阅读榜</span>
			<div class="BookInfoDIV" id="readnumOrder">
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="orderNum1"> NO 1 </div>
						<div class="bookName"></div>
						<div class="bookAuthor">作者:</div>
						<div class="bookType">类型:</div>
					</div>
					<div class="pull-right"><a href=""><img src="image/bookPic/book1.jpg" height="100px;"/></a></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" style="background-color: #EE7600;">2</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" style="background-color: #EEDC82;">3</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >4</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >5</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >6</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >7</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >8</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >9</span></div>
					</div>
					<div class="pull-right" style="color: #AAAAAA"></div>
					<div class="clearfix"></div>
				</div>
				<div class="rankingBookInfoDiv">
					<div class="pull-left">
						<div class="bookName"><span class="rankingNumSpan" >10</span></div>
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
