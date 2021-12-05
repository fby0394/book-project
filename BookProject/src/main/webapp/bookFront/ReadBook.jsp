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

<title>My JSP 'ReadBook.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@ include file="menu.jsp"%>
<style>
body {
	font-size: 18px;
	background-color: #e3efe3;
	margin: 0px;
}

#HomeContent {
	height: auto;
	margin: auto;
	background-color: #d0e2d0;
	margin-top: 20px;
	padding: 25px 0px;
	width: 66%;
	border: 1px solid #d9caca;
	font-family: "雅黑";
}
#TopDiv{
	 height: auto;
	 margin-top: 10px;
	 width:100%;
}
#TopDiv span{
	margin-left: 17%;
	font-size: 16px;
	letter-spacing: 0.1em;
	color: #968d8d;
}
#TopDiv span a{
	color: #968d8d;
}
#pageTurning {
	height: auto;
	margin: auto;
	background-color: #d0e2d0;
	margin-top: 20px;
	width: 66%;
	border: 1px solid #d9caca;
}

#HomeContent .bookInfo span {
	color: #968d8d;
	font-size: 14px;
	margin-left: 20px;
}

.content a ,#TopDiv span a{
	text-decoration: none;
}

ul.nav-tabs {
	width: 80px;
	margin-top: 20px;
	border-radius: 4px;
	border: 1px solid #d9caca;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
	border-radius: 4px;
}

ul.nav-tabs li {
	margin: 0;
	background-color: #d0e2d0;
	border-top: 1px solid #d9caca;
}

ul.nav-tabs li:first-child {
	border-top: none;
}

ul.nav-tabs li a {
	color: #000;
	margin: 0;
	padding: 8px 16px;
	border-radius: 0;
}

ul.nav-tabs li:first-child a {
	border-radius: 4px 4px 0 0;
}

ul.nav-tabs li:last-child a {
	border-radius: 0 0 4px 4px;
}

.tabDiv {
	position: absolute;
	width: 700%;
	left: 115%;
	top: -1px;
	display: none;
	border: 1px solid #d9caca;
	left: 115%;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, .5);
}

.tabDiv .Title {
	padding: 2% 20px;
	font-size: 20px;
	background-color: #e3efe3;
}

.tabDiv .content {
	height: 300px;
	overflow: auto;
	background-color: #f1f9f1;
}

.tabDiv .content .BookCatalogDiv {
	width: 50%;
	text-align: center;
	padding: 10px 0px;
}

.tabDiv .content .resize-action {
	padding: 20px;
}

.tabDiv .content .resize-action dd {
	margin-bottom: 3%;
}

.tabDiv .content .resize-action .lable {
	height: 40px;
	line-height: 40px;
}

.tabDiv .content .resize-action .bgSpan {
	border: 1px solid #d9caca;
	width: 40px;
	height: 40px;
	color: #fb6b84;
	font-size: 16px;
	text-align: center;
	line-height: 40px;
	border-radius: 50%;
	line-height: 40px;
	border-radius: 50%;
	margin-right: 10px;
}

.tabDiv .content .resize-action .fontFamilySpan {
	border: 1px solid #d9caca;
	width: 60px;
	height: 40px;
	font-size: 16px;
	text-align: center;
	line-height: 40px;
	margin-right: 10px;
	color: #000;
	background-color: #FAFAFA;
}

.tabDiv .content .resize-action .fontSpan {
	border: 1px solid #d9caca;
	width: 270px;
	height: 40px;
	padding: 5px 0;
	font-size: 16px;
	text-align: center;
	color: #000;
	background-color: #FAFAFA;
}

.tabDiv .content .resize-action .fontSpan span {
	display: block;
	float: left;
	width: 33%;
	height: 30px;
	line-height: 30px;
}

.bgSpan:hover,.dropDiv:hover,.fontFamilySpan:hover,.fontSpan span:hover
	{
	cursor: hand;
}

.tabDiv .dropDiv {
	padding-left: 5px;
	color: #d9caca;
}

.pageTurning,.pageTurning1 {
	width: 49.9%;
	text-align: center;
}

.pageTurning span,.pageTurning1 span {
	display: inline-block;
	padding: 20px;
}

.pageTurning span em,.pageTurning1 span em {
	display: block;
	font-style: normal;
	color: #000;
	font-size: 18px;
}

.pageTurning span i,.pageTurning1 span i {
	display: block;
	font-style: normal;
	color: #999;
}

.pageTurning1 span em {
	color: #999;
}

.pageTurning:hover {
	background: rgba(255, 255, 255, .3);
	cursor: hand;
}
</style>
<script type="text/javascript">
	$(function() {
		$(document).attr('title', '${bci.catalogTitle}');
		$("#HomeTop").hide();
		readBookInfo('BookInfo/${bci.catalogUrl}');
		//设置导航栏的位置
		$(".nav-tabs").eq(0).css({
					"left":$("#HomeContent").offset().left - 80 * 1.15,
					"top":$("#HomeContent").offset().top-20,
				});
		$(document).scroll(function(){
			if($(document).scrollTop()>$("#HomeContent").offset().top-20){
				$(".nav-tabs").eq(0).css({
					"top":$("nav").height()*0.755,
				});
			}else{
				$(".nav-tabs").eq(0).css({
					"top":$("#HomeContent").offset().top-20-$(document).scrollTop(),
				});
			}
		});

		$("#myScrollspy ul li").blur(function(){
			alert("1");
		});
		pageTurningState(${bci.catalognum});
		
	});
	//读取小说内容
	function readBookInfo(url) {
		$.ajax({
			url : url,
			type : 'post',
			dataType : 'text',
			async : false,
			success : function(data) {
				$("#bookContentDiv").html(data);
			},
		});
	}
	//导航栏
	function showNav(index) {
		if ($(".tabDiv").eq(index).css("display") == "none") {
			$(".tabDiv").hide();
			$(".tabDiv").eq(index).show();
		} else {
			$(".tabDiv").hide();
		}
	}
	//改变主题颜色
	function updatBg(obj) {
		$("body,.bottomDiv").css({
			"background-color" : $(obj).attr("bodyBg"),
			"color" : $(obj).attr("bodyCo")
		});
		$("#HomeContent,#pageTurning,ul.nav-tabs li,.tabDiv .Title").css({
			"background-color" : $(obj).attr("contentBg")
		});
		$("#bookContentDiv,ul.nav-tabs li a,#pageTurning .pageTurning em,.bottomDiv a").css(
				"color", $(obj).attr("contentCo"));
		$(".tabDiv .content").css("background-color", $(obj).attr("navDivBg"));
		$(".bgSpan").html("").css("border-color", "#d9caca");
		$(obj).html("✔").css("border-color", "#fb6b84");
	}
	//改变正文字体
	function updatFamily(obj) {
		$("#HomeContent").css({
			"font-family" : $(obj).html()
		});
		$(".fontFamilySpan").css({
			"border-color" : "#d9caca",
			"color" : "#000"
		});
		$(obj).css({
			"border-color" : "#fb6b84",
			"color" : "#fb6b84"
		});
	}
	//正文字体大小和字体间距
	function updateFont(params, size, obj) {
		var sizes = parseInt($(obj).parent().find("span").eq(1).html());
		if (params == 'font-size') {
			if ((sizes == 8 && size < 0) || (sizes == 48 && size > 0)) {
				size = sizes;
			} else {
				size += sizes;
			}
			$("#bookContentDiv").css({
				"font-size" : size + "px"
			});
		} else if (params == 'letter-spacing') {
			if ((sizes == 5 && size < 0) || (sizes == 80 && size > 0)) {
				size = sizes;
			} else {
				size += sizes;
			}
			$("#bookContentDiv").css({
				"letter-spacing" : size / 50 + "em"
			});
		}
		$(obj).parent().find("span").eq(1).html(size);
	}
	//翻页
	function pageTurning(obj, num) {
		$.ajax({
			url : 'Bci/pageTurning',
			type : 'post',
			data : {
				'bci.bookId' : '${bci.bookId }',
				'bci.catalogSize' : num,
				'bci.catalognum' : $(obj).attr("param")
			},
			dataType : 'json',
			sync : false,
			success : function(data) {
				readBookInfo('BookInfo/' + data.catalogUrl);
				$("#HomeContent h2").html(data.catalogTitle);
				$("#HomeContent bookInfo span").eq(3).html(data.updateTime);
				$("#HomeContent bookInfo span").eq(4).html(data.catalogSize);
				pageTurningState(data.catalognum);
				$('html,body').animate({scrollTop: '0px'}, 0);
			},
		});
	}
	//翻页按钮的状态
	function pageTurningState(catalognum){
		var maxNum = parseInt($("#HomeContent").attr("catalognum"));
		if (catalognum == 1) {
			$("#pageTurning div").eq(0).removeClass("pageTurning")
					.addClass("pageTurning1").find("span").attr(
							"onclick", "");
		} else {
			$("#pageTurning div").eq(0).removeClass("pageTurning1")
					.addClass("pageTurning").find("span").attr({
						"onclick" : "pageTurning(this,-1)",
						"param" : catalognum
					});
		}
		if(catalognum==maxNum){
			$("#pageTurning div").eq(1).removeClass("pageTurning")
			.addClass("pageTurning1").find("span").attr(
					"onclick", "");
		} else {
			$("#pageTurning div").eq(1).removeClass("pageTurning1")
					.addClass("pageTurning").find("span").attr({
						"onclick" : "pageTurning(this,1)",
						"param" : catalognum
					});
		}
	}
	
	function addBookSheifInfo1(){
		if(user == "") {
			$("#loginA").click();
		}else{
			$(".tabDiv .content table tbody").eq(0).html($("#bookSheifInfoDiv table tbody").eq(0).html());
			showNav(2);
		}
	}
</script>
</head>

<body>
	<div id="TopDiv">
		<span>当前位置：
		<a href="bookfront/HomePage.jsp">首页</a> &raquo;
		<a href="BookInfo/showQueryBookInfo?bookif.btid=${bci.bi.bti.btid }">${bci.bi.bti.btname }</a> &raquo; 
		<a href="BookInfo/showBookInfo?bookif.bookid=${bci.bi.bookid }">${bci.bi.bookname }</a> &raquo;
		${bci.catalogTitle}
		</span>
	</div>
	<div id="HomeContent" catalognum="${bciList[bciList.size()-1].catalognum }">
		<h2 style="text-align: center;">${bci.catalogTitle}</h2>
		<div class="bookInfo" style="text-align: center;">
			<span>书名：${bci.bi.bookname }</span> <span>作者：${bci.bi.author.uname }</span>
			<span>类型：${bci.bi.bti.btname }</span> <span>更新时间：${bci.updateTime }</span>
			<span>字数：${bci.catalogSize }</span>
		</div>
		<div id="bookContentDiv" style="padding:2% 10%;letter-spacing: 0.4em;"></div>

	</div>
	
	
	<div id="pageTurning">
		<div class="pull-left pageTurning1">
			<span onclick="pageTurning(this,-1)" param="${bci.catalognum }"><em>上
					一 章</em> <i>(快捷键：←)</i></span>
		</div>
		<div class="pull-left pageTurning"
			style="border-left: 1px solid #d9caca;margin-left: 1px;">
			<span onclick="pageTurning(this,1)" param="${bci.catalognum }"><em>下
					一 章</em> <i>(快捷键：→)</i></span>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="bottomDiv" style="border-top: 1px solid #d9caca;margin-top: 20px;background-color: #e3efe3">
		<div class="bottomMenu">
			<a>关于本站</a>
			<a>联系我们</a>
			<a>作者帮助</a>
			<a>会员帮助</a>
			<p>
			版权所有：AAA软件学院A309。<a href="http://www.miibeian.gov.cn/" target="_blank">豫ICP备400000010001号</a>
			</p>
		</div>
	</div>
		<div class="col-xs-1" id="myScrollspy">
		<ul class="nav nav-tabs nav-stacked" data-spy="affix">
			<li><a href="javascript:showNav(0)">目录</a>
				<div class="tabDiv">
					<div class="Title">
						目录
						<div class="pull-right dropDiv" onclick="showNav(this)">X</div>
					</div>
					<div class="content">
						<c:forEach items="${bciList }" var="bci" varStatus="thisBci">
							<div class="pull-left BookCatalogDiv">
								<a href="Bci/showBci?bci.bookId=${bci.bookId }&bci.catalogId=${bci.catalogId }">${bci.catalogTitle }</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="tabDiv">
					<div class="Title">
						设置你喜欢的阅读风格
						<div class="pull-right dropDiv" onclick="showNav(this)">X</div>
					</div>
					<div class="content">
						<dl class="resize-action">
							<dd>
								<span class="pull-left lable">阅读主题：</span> <span
									class="pull-left bgSpan" bodyBg="#e3efe3" bodyCo="#000"
									contentBg="#d0e2d0" contentCo="#333" navDivBg="#f1f9f1"
									onclick="updatBg(this)"
									style="background-color: #d0e2d0;border-color: #fb6b84;">✔</span>
								<span class="pull-left bgSpan" bodyBg="#f8f3e9" bodyCo="#000"
									contentBg="#ebe5d8" contentCo="#333" navDivBg="#fefdf7"
									onclick="updatBg(this)" style="background-color: #ebe5d8;"></span>
								<span class="pull-left bgSpan" bodyBg="#f2e8c8" bodyCo="#000"
									contentBg="#ddcda1" contentCo="#333" navDivBg="#f8f0d7"
									onclick="updatBg(this)" style="background-color: #ddcda1;"></span>
								<span class="pull-left bgSpan" bodyBg="#dfecf0" bodyCo="#000"
									contentBg="#cedce0" contentCo="#333" navDivBg="#e6f4f5"
									onclick="updatBg(this)" style="background-color: #cedce0;"></span>
								<span class="pull-left bgSpan" bodyBg="#fff5f8" bodyCo="#000"
									contentBg="#f5e4e4" contentCo="#333" navDivBg="#fff4f4"
									onclick="updatBg(this)" style="background-color: #f5e4e4;"></span>
								<span class="pull-left bgSpan" bodyBg="#e0e0e0" bodyCo="#000"
									contentBg="#cfcfcf" contentCo="#333" navDivBg="#e9e9e9"
									onclick="updatBg(this)" style="background-color: #cfcfcf;"></span>
								<span class="pull-left bgSpan" bodyBg="#161819" bodyCo="#666"
									contentBg="#121416" contentCo="#968d8d" navDivBg="#161819"
									onclick="updatBg(this)" style="background-color: #161819;"></span>
								<div class="clearfix"></div>
							</dd>
							<dd>
								<span class="pull-left lable">正文字体：</span> <span
									class="pull-left fontFamilySpan" onclick="updatFamily(this)"
									style="border-color: #fb6b84;color:#fb6b84;">雅黑</span> <span
									class="pull-left fontFamilySpan" onclick="updatFamily(this)">宋体</span>
								<span class="pull-left fontFamilySpan"
									onclick="updatFamily(this)">楷体</span> <span
									class="pull-left fontFamilySpan" onclick="updatFamily(this)">黑体</span>
								<div class="clearfix"></div>
							</dd>
							<dd>
								<span class="pull-left lable">字体大小：</span> <span
									class="pull-left fontSpan"> <span
									onclick="updateFont('font-size',-2,this)">A-</span> <span
									style="border-left: 1px solid #d9caca;border-right: 1px solid #d9caca;color:#d9caca;">18</span>
									<span onclick="updateFont('font-size',2,this)">A+</span>
								</span>
								<div class="clearfix"></div>
							</dd>
							<dd>
								<span class="pull-left lable">文字间距：</span> <span
									class="pull-left fontSpan"> <span
									onclick="updateFont('letter-spacing',-5,this)">-</span> <span
									style="border-left: 1px solid #d9caca;border-right: 1px solid #d9caca;color:#d9caca;">20</span>
									<span onclick="updateFont('letter-spacing',5,this)">+</span>
								</span>
								<div class="clearfix"></div>
							</dd>
						</dl>
					</div>
				</div>
				<div class="tabDiv">
					<div class="Title">
						书架
						<div class="pull-right dropDiv" onclick="showNav(this)">X</div>
					</div>
					<div class="content" style="padding: 10px;">
						<table class="table"  style="text-align: center;font-size: 12px;">
					  <thead>
					  	<tr>
					      <th style="text-align: center;">书名</th>
					      <th style="text-align: center;">章节</th>
					      <th style="text-align: center;">作者</th>
					      <th style="text-align: center;">操作</th>
					  	</tr>
					  </thead>
					  <tbody>
					    
					  </tbody>
					</table>
					</div>
				</div></li>
			<li><a href="javascript:showNav(1)">设置</a></li>
			<li><a href="javascript:addBookSheifInfo1()">书架</a></li>
			<li><a href="javascript:void(0)" catalogid="${bci.catalogId }" bookid="${bci.bookId }" onclick="addBookSheifInfo(this)">收藏</a></li>
		</ul>
	</div>
</body>
</html>
