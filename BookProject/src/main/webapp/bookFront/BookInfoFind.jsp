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

<title>搜索小说</title>

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

.typeli {
	color: #AAAAAA;
	font-size: 14px;
	padding: 0px;
	border-bottom: 1px dashed #AAAAAA;
}

.typeli a,.rankingBookInfoDiv a,.SelctTypeSpan a{
	color: black;
	font-size: 16px;
}
.bookInformation a{
	color: black;
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
.SelectTypeSpan{
	float:left;
	margin:5px 1% 5px 0px;
	padding:3px 10px;
}
.SelectTypeSpan2{
	float:left;
	margin:5px 1% 5px 0px;
	padding:3px 10px;
	color:#FFFFFF;
	background-color:#EE2C2C;
}
.SelectTypeSpan:hover,.dropDiv:hover{
	color: #fb6b84;
	cursor: hand;
}
#bookTypeInfoDiv,#bookStyleDiv,#bookStateDiv{
	float:left;
	margin:5px 1% 5px 0px;
	padding:3px 10px;
	border:1px solid #C67171;
	color:#AAAAAA;
	position: relative;
	display: none;
}
.dropDiv{
	padding-left: 5px;
	color: #C67171;
}
.bookInformation{
	height:180px;
	border-bottom:1px solid #AAAAAA;
	margin-bottom: 20px;
}
.bookInformation .bookName{
	margin-right:1.5%;
	font-size: 20px;
}
.bookInformation .bookInfo{
	height:25%;
	padding-top: 2px;
	overflow: hidden;
}
.bookInformation .bookInfo .bookInfo1{
	font-size: 14px;
	margin-right:1%;
	padding: 4px;
	
}
.bookInformation .bookInfo .bookInfo1 a{
	color:#6C7B8B;
}
.bookInformation .bookInfo .bookInfo1 a .iconfont {
    font-size: 14px;
    color: #fba0a0;
    margin: 0 5px 0 0;
}
.bookInformation .bookInfo .bookInfo2{
	font-size:14px;
	padding:4px 16px;
	border-radius:10px;
	margin-right:1%;
	background-color: #C7C7C7;
}
</style>
<script type="text/javascript">
	$(function() {
		//分页信息
		$('#Pagin').jqPaginator({
		    totalPages: 5,
		    visiblePages: 5,
		    currentPage: 1,
		    page: '<li class="page"><a href="javascript:showBookInfo({{page}});">{{page}}</a></li>'
		});
		showOrderBookInfo($("#WeekReommendUL"), "recommend/queryWeek");
		$("#DayReommendUL").hide();
		showOrderBookInfo($("#DayReommendUL"), "recommend/queryDay");
		$("#WeekReommendSpan").mouseenter(
				function() {
					$("#DayReommendSpan").css({"border-bottom-color":"rgba(250,0,255,0)","color":"black"});
					$(this).css({"border-bottom-color" : "#FF4500","color":"#FF4500"});
					$("#DayReommendUL").hide();
					$("#WeekReommendUL").show();
				});
		$("#DayReommendSpan").mouseenter(
				function() {
					$("#WeekReommendSpan").css({"border-bottom-color":"rgba(250,0,255,0)","color":"black"});
					$(this).css({"border-bottom-color" : "#FF4500","color":"#FF4500"});
					$("#WeekReommendUL").hide();
					$("#DayReommendUL").show();
				});
		
		addOrderBookInfo($("#collectnumOrderAllDiv"),"BookInfo/queryCollectnumAll");
		$("#readnumOrderAllDiv").hide();
		addOrderBookInfo($("#readnumOrderAllDiv"),"BookInfo/queryReadnumAll");
		$("#collectnumOrderAllSpan").mouseenter(
				function() {
					$("#readnumOrderAllSpan").css({"border-bottom-color":"rgba(250,0,255,0)","color":"black"});
					$(this).css({"border-bottom-color" : "#FF4500","color":"#FF4500"});
					$("#readnumOrderAllDiv").hide();
					$("#collectnumOrderAllDiv").show();
				});
		$("#readnumOrderAllSpan").mouseenter(
				function() {
					$("#collectnumOrderAllSpan").css({"border-bottom-color":"rgba(250,0,255,0)","color":"black"});
					$(this).css({"border-bottom-color" : "#FF4500","color":"#FF4500"});
					$("#collectnumOrderAllDiv").hide();
					$("#readnumOrderAllDiv").show();
				});
		//读取小说分类信息
		$.ajax({
			url : 'BookTypeInfo/queryBookTypeInfo',
			type : 'post',
			dataType : 'json',
			async : false,
			success : function(data) {
				var menu = "<div onclick='dropSelect(this)' param='btid!=0' class='SelectTypeSpan2'>全部</div>";
				for (var i = 0; i < data.length; i++) {
					menu += "<div onclick='addBookType(this)' param='btid="
							+ data[i].btid + "' class='SelectTypeSpan'>"
							+ data[i].btname + "</div>";
					}
				$("#bookInfoType").html($("#bookInfoType").html()+menu);
			}
		});
		//读取小说风格信息
		$.ajax({
			url : 'BookStyle/queryAll',
			type : 'post',
			dataType : 'json',
			async : false,
			success : function(data) {
				var menu = "<div onclick='dropSelect(this)' param='bstid!=0' class='SelectTypeSpan2'>全部</div>";
				for (var i = 0; i < data.length; i++) {
					menu += "<div onclick='addBookStyle(this)' param='bstid="
							+ data[i].bstid + "' class='SelectTypeSpan'>"
							+ data[i].bstname + "</div>";
					}
				$("#bookInfoStyle").html($("#bookInfoStyle").html()+menu);
			}
		});
		//页面加载时传入的搜索条件
		findType();
	});
	//页面加载时传入的搜索条件
	function findType(){
		var param="";
		var btid="${bookif.btid }";
		var bsid="${bookif.bsid }";
		if(btid!=""){
			if(btid==0){
				param+="btid!=0";
			}else{
				param+="btid="+btid;
			}
			$("#bookInfoType [param='"+param+"']").eq(0).click();
		}
		if(bsid!=""){
			if(bsid==0){
				param+="bsid!=1";
			}else{
				param+="bsid="+bsid;
			}
			$("#bookInfoState [param='"+param+"']").eq(0).click();
		}
	}
	//读取排行图书信息
	function showOrderBookInfo(obj, url) {
		$.ajax({
			url : url,
			type : "post",
			dataType : "json",
			async : false,
			success : function(data) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<li class='typeli'>[" + data[i].bi.bti.btname
							+ "]<a href='BookInfo/showBookInfo?bookif.bookid="
							+ data[i].bi.bookid+"' target='_blank'> " + data[i].bi.bookname
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
						"<a href='BookInfo/showBookInfo?bookif.bookid=" + data[0].bookid + "' target='_blank'>" + data[0].bookname + "</a>");
				divs.eq(0).find(".bookAuthor").html(
						"作者：" + data[0].author.uname);
				divs.eq(0).find(".bookType").html("类型：" + data[0].bti.btname);
				divs.eq(0).find("img").attr("src", "image/bookPic/" + data[0].bookpicurl);
				for (var i = 1; i < data.length; i++) {
					divs.eq(i).find(".bookname").html(
							divs.eq(i).find(".bookname").html() + "<a href='BookInfo/showBookInfo?bookif.bookid="
									+ data[i].bookid + "' target='_blank'>"
									+ data[i].bookname + "</a>");
					divs.eq(i).find(".pull-right").html(data[i].author.uname);
				}

			},
			error : function() {
			}
		});
	}
	
	//删除选择的条件
	function dropSelect(obj){
		if($(obj).attr("class")!="SelectTypeSpan2"){
			$("div[param='"+$(obj).attr("param")+"']").eq(0).parent().hide().attr("param",$(obj).attr("param")).find("span").html("");
			updateStyle($("div[param='"+$(obj).attr("param")+"']").eq(2));
			if($("#bookTypeInfoDiv span").html()==""&&$("#bookStyleDiv span").html()==""&&$("#bookStateDiv span").html()==""){
				$("#selectDiv").hide();
			}
		}else{
			showBookInfo(1);
		}
	}
	//添加图书类型
	function addBookType(obj){
		$("#bookTypeInfoDiv").attr("param",$(obj).attr("param")).show();
		$("#bookTypeInfoDiv span").html($(obj).html());
		$("#selectDiv").show();
		updateStyle(obj);
	}
	function addBookTypeS(btid){
		$("#bookInfoType [param='btid="+btid+"']").eq(0).click();
	}
	//添加图书风格
	function addBookStyle(obj){
		$("#bookStyleDiv").attr("param",$(obj).attr("param")).show();
		$("#bookStyleDiv span").html($(obj).html());
		$("#selectDiv").show();
		updateStyle(obj);
	}
	function addBookStyleS(bstid){
		$("#bookInfoStyle [param='bstid="+bstid+"']").eq(0).click();
	}
	//添加图书状态
	function addBookState(obj){
		$("#bookStateDiv").attr("param",$(obj).attr("param")).show();
		$("#bookStateDiv span").html($(obj).html());
		$("#selectDiv").show();
		updateStyle(obj);
	}
	function addBookStateS(bsid){
		$("#bookInfoState [param='bsid="+bsid+"']").eq(0).click();
	}
	//添加搜索条件后修改样式
	function updateStyle(obj){
		$(obj).parent().find(".SelectTypeSpan2").removeClass("SelectTypeSpan2").addClass("SelectTypeSpan");
		$(obj).removeClass("SelectTypeSpan").addClass("SelectTypeSpan2");
		showBookInfo(1);
	}
	//显示查找到的图书信息
	function showBookInfo(page){
		var param=$("#bookTypeInfoDiv").attr("param")+","+$("#bookStyleDiv").attr("param")+","+$("#bookStateDiv").attr("param");
		 $.ajax({
			url : "BookInfo/queryBookInfo",
			type : "post",
			data : {
				"paging.pageSize" : 8,
				"paging.currentPage": page,
				"param" : param
			},
			dataType : "json",
			async : false,
			success : function(data) {
				var html="";
				if(data.pagingList.length==0){
					html="没有找到书籍，请重新选择条件！";
				}else{
					for( var i = 0 ; i < data.pagingList.length ; i++){
						html+="<div class='bookInformation'>"
							+ "<a href='BookInfo/showBookInfo?bookif.bookid=" + data.pagingList[i].bookid + "' target='_blank'>"
							+ "<img alt='' src='image/bookPic/" + data.pagingList[i].bookpicurl + "' width='15%' /></a>"
							+ "<div class='pull-right' style='width: 83%;'>"
							+ "<div class='bookInfo'>"
							+ "<div class='pull-left bookName'><a href='BookInfo/showBookInfo?bookif.bookid="+data.pagingList[i].bookid+"' target='_blank'>" + data.pagingList[i].bookname + "</a></div>"
							+ "<div class='pull-left bookInfo1'><a href=''><i class='iconfont'></i>" + data.pagingList[i].author.uname + "</a></div>"
							+ "<div class='pull-left bookInfo1'><a href='javascript:addBookTypeS(" + data.pagingList[i].bti.btid + ")'>" + data.pagingList[i].bti.btname + "</a></div>"
							+ "<div class='pull-left bookInfo1'><a href='javascript:addBookStateS(" + data.pagingList[i].bst.bsid + ")'>" + data.pagingList[i].bst.bsname + "</a></div>";
							for(var j=0;j<data.pagingList[i].bstys.length;j++){
								html+="<div class='pull-left bookInfo2'><a href='javascript:addBookStyleS(" + data.pagingList[i].bstys[j].bstid + ")'>" + data.pagingList[i].bstys[j].bstname + "</a></div>";
							}
						html+= "<div class='clearfix'></div></div>"
							+ "<div style='height:55%;'>" + data.pagingList[i].bookintrod + "</div>"
							+ "<div style='height:20%;'>"
							+ "<div class='pull-left' style='margin-right:5%;'>阅读：" + data.pagingList[i].readnum + "</div>"
							+ "<div class='pull-left' style='margin-right:5%;'>收藏：" + data.pagingList[i].collectnum + "</div>"
							+ "<div class='pull-left' style='margin-right:5%;'>更新：" + data.pagingList[i].updatetime.replace("T"," ") + "</div>"
							+ "<div class='pull-left' style='margin-right:5%;'>字数：" + data.pagingList[i].booksize + "</div>"
							+ "<div class='pull-right' style='margin-bottom:5px;'><button type='button' class='btn btn-danger'>加入收藏</button></div>"
							+ "<div class='clearfix'></div></div></div><div class='clearfix'></div></div>";
					}
				}
				$("#bookInfo").html(html);
				$('html,body').animate({scrollTop: '0px'}, 0);
				var prev="showBookInfo(" + (data.currentPage-1) + ")";
				var first="showBookInfo(1)";
				var next="showBookInfo(" + (data.currentPage+1) + ")";
				var last="showBookInfo(" + (data.totalPages) + ")";
				if(data.currentPage==data.totalPages){
					next="void(0)";
					last="void(0)";
				}
				if(data.currentPage==1){
					prev="void(0)";
					first="void(0)";
				}
				$('#Pagin').jqPaginator('option',{
				    totalPages: data.totalPages,
				    currentPage: data.currentPage,
				    first: '<li class="first"><a href="javascript:'+first+'">首页</a></li>',
				    last: '<li class="last"><a href="javascript:'+last+'">尾页</a></li>',
				    prev: '<li class="prev"><a href="javascript:'+prev+'">&laquo;</a></li>',
				    next: '<li class="next"><a href="javascript:'+next+'">&raquo;</a></li>'
				});
			},
			error : function() {}
		});
	}
</script>
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
		<div class="pull-left" style="width: 72%;">
			<div class="well well-lg" style="font-size: 16px;">
				<div>
					<div id="selectDiv" style="display: block;float: left;padding:10px 0px;display: none;">以选：</div>
					<div id="bookTypeInfoDiv" param="btid!=0"><span></span><div class="pull-right dropDiv" onclick="dropSelect(this)" param="btid!=0">X</div></div>
					<div id="bookStyleDiv" param="bstid!=0"><span></span><div class="pull-right dropDiv" onclick="dropSelect(this)" param="bstid!=0">X</div></div>
					<div id="bookStateDiv" param="bsid!=1"><span></span><div class="pull-right dropDiv" onclick="dropSelect(this)" param="bsid!=1">X</div></div>
				</div>
				<div class="clearfix"></div>
				<div id="bookInfoType"><div style="display: block;float: left;padding:10px 0px;font-weight: bold;">类别：</div></div>
				<div class="clearfix"></div>
				<div id="bookInfoStyle"><div style="display: block;float: left;padding:10px 0px;font-weight: bold;">风格：</div></div>
				<div class="clearfix"></div>
				<div id="bookInfoState">
					<div style="display: block;float: left;padding:10px 0px;font-weight: bold;">风格：</div>
					<div class='SelectTypeSpan2' param="bsid!=1" onclick="dropSelect(this)">全部</div>
					<div class="SelectTypeSpan" param="bsid=2" onclick="addBookState(this)">新书</div>
					<div class="SelectTypeSpan" param="bsid=3" onclick="addBookState(this)">连载</div>
					<div class="SelectTypeSpan" param="bsid=4" onclick="addBookState(this)">完结</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div id="bookInfo">
				
			</div>
			<div style="text-align: center">
				<ul id="Pagin" class="pagination">
				</ul>
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
				<span class="BookInfoSPAN" id="collectnumOrderAllSpan">阅读榜</span> 
				<span class="BookInfoSPAN" id="readnumOrderAllSpan" style="border-bottom: 1.2px solid rgba(250,0,255,0);color:black;">收藏榜</span>
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
