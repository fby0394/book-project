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

<title>我的控制面板</title>

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
	background-color: #fff6f6;
	margin: 0px;
}

#HomeContent {
	height: auto;
	margin: 20px auto;
	width: 1200px;
	border-bottom: 1px solid #e0e0e0;
	font-family: "雅黑";
}

#HomeContent a{
	color: #000;
}

#HomeContent .control {
	margin: 0 0 0 -11px;
	overflow: hidden;
}

#HomeContent a:hover {
	color: #fb6b84;
	cursor: hand;
	transition: color .3s, background-color .3s;
}
fieldset{
	border-radius: 5px;
}
.control-menu {
	width: 240.6px;
	border: 1px solid #e0e0e0;
	margin: 0 0 0 11px;
	display: inline;
	background: #f8f8f8;
	border-bottom: 0;
	margin: 0 0 0 11px;
	display: inline;
	background: #f8f8f8;
	padding-bottom: 999px;
	margin-bottom: -999px;
}

.control-title {
	position: relative;
	height: 78px;
	border-bottom: 1px solid #e0e0e0;
	font-size: 30px;
	line-height: 78px;
}

.control-title .ribbon {
	display: block;
	position: absolute;
	width: 45px;
	height: 80px;
	line-height: 80px;
	background: #fb6b84;
	left: -11px;
	top: -1px;
}

.control-title .iconfont {
	font-family: "iconfont" !important;
	font-style: normal;
	position: relative;
	color: #fdc4ce;
	font-size: 40px;
	margin: 0 40px 0 0;
	float: left;
	display: inline;
}

.control-title .ribbon:after {
	height: 0;
	width: 0;
	border-top: 40px solid transparent;
	border-bottom: 40px solid transparent;
	border-left: 28px solid #fb6b84;
	right: -28px;
}

.control-title .ribbon:before,.control-title .ribbon:after {
	content: "";
	position: absolute;
}

.control-title .ribbon:before {
	height: 0;
	width: 0;
	border-top: 11px solid #cc1d3b;
	border-left: 11px solid transparent;
	bottom: -11px;
	left: 0;
}

.control-menu .click-hd h3 {
	font-weight: normal;
	margin: 0;
	padding: 0;
	font-size: 100%
}

.control-menu .click-hd h3 a {
	display: block;
	height: 48px;
	line-height: 48px;
	border-bottom: 1px solid #e0e0e0;
	padding: 0 0 0 40px;
	outline: 0;
	text-decoration: none;
	color: #000;
}

.control-menu .click-hd .active a {
	background: #fff;
	margin: 0 -1px 0 0;
	color: #fb6b84
}

.control-menu .click-hd h3 .iconfont {
	margin: 0 15px 0 0;
}

.control-main {
	width: 958.8px;
	padding: 30px;
	border: 1px solid #e0e0e0;
	border-left: 0;
	background: #fff;
	border-bottom: 0;
	padding-bottom: 999px;
	margin-bottom: -999px;
}
.control-main .control-content{
	display: none;
}
.control-main .menuTab {
	border-bottom: 1px solid #000;
	height: 40px;
	line-height: 39px;
}

.control-main .menuTab span {
	float: left;
	display: inline-block;
	font-weight: normal;
	padding: 0 20px;
	cursor: pointer;
	font-size: 16px;
	margin: 0 0 -1px;
}

.control-main .menuTab .active {
	border-bottom: 2px solid #fb6b84;
	color: #fb6b84;
}

.control-main .menuContent table th ,.control-main .menuContent table .td{
	line-height: 24px;
	font-weight: normal;
	background: #fafafa;
	padding: 13px 0 13px 10px;
	border-bottom: 1px solid #ddd;
	text-align: left;
	margin: 0;
}
#editBookDiv .menuContent{
	min-height: 450px;
	max-height: 550px;
	overflow: auto;
}
.control-main .menuContent table td {
	line-height: 24px;
	font-size: 14px;
	padding: 6px 0 6px 10px;
	margin: 0;
}
#editBookDiv .menuContent span{
	display: inline-block;
	font-size: 16px;
	
}
#editBookDiv .menuContent .span1{
	width: 270px;
}
#editBookDiv .menuContent .span2{
	width: 90px;
}
#editBookDiv .menuContent .span3{
	width: 100px;
}
#editBookDiv .menuContent .panel-body span{
	margin-right: 10px;
}
#editBookDiv .menuContent .panel-body p{
	margin-top: 15px;
	font-size: 16px;
}
#editBookDiv .menuContent .panel-body .span4{
	margin: 1px;
	font-size: 26px;
}

.updateFile .fileDiv{
	margin-left:10px;
	width: 20%;
	height: 170px;
}
.updateFile button{
	font-size: 18px;
	margin-top: -25px;
}
.updateFile .fileDefaultDiv{
	border: 1px solid #fb6b84;
	text-align: center;
	font-size: 45px;
	height: 160px;
	line-height: 160px;
	color: #fb6b84;
	border-radius:4px;
}
</style>
<script type="text/javascript">
$(function () 
		{
		    //书架分页
		    $("#BsiPagingUL").jqPaginator(
		    {
		        totalPages : 1, 
		        visiblePages : 5, 
		        currentPage : 1, 
		        first : "", 
		        last : "", 
		        page : "<li class='page'><a href='javascript:showBsis({{page}});'>{{page}}</a></li>" 
		    });
		});
		//退出登录
		function exitLogin2() 
		{
		    $.ajax(
		    {
		        url : "user/exitLogin", 
		        type : "post", 
		        dataType : "json",
		        success : function (data) 
		        {
		            if (data) 
		            {
		                window.opener = null;
		                window.open('', '_self');
		                window.close();
		                window.open("bookfront/HomePage.jsp");
		            }
		        }
		    });
		}
		//读取用户书架信息
		function showBsis(currentPage)
		{
		    var userid = 1;
		    var url = $("#BookSheifControl .menuTab .active").eq(0).attr("url");
		    $.ajax(
		    {
		        url : url, 
		        type : "post", 
		        data : {
		            "bsi.userid" : userid, "paging.currentPage" : currentPage 
		        },
		        dataType : "json", 
		        async : false,
		        success : function (data)
		        {
		            showSwitchoverBookSheifInfo(data);
		        },
		        error : function () { }
		    });
		}
		//切换书架信息
		function switchoverBookSheifInfo(obj)
		{
		    switchMenu(obj);
		    showBsis(1);
		}
		//子目录的菜单切换
		function switchMenu(obj){
		    $(obj).parent().find(".active").removeClass("active");
		    $(obj).addClass("active");
		}
		//切换后显示书架信息
		function showSwitchoverBookSheifInfo(data)
		{
		    var html = "";
		    var count;
		    for (var i = 0 ; i < data.pagingList.length ; i++ )
		    {
		        count = data.pagingList[i].bi.bci.length - 1;
		        html += "<tr><td style='text-align: right;'><div class='icheck-re'>"
		        	 + "<input value='" + data.pagingList[i].bi.bookid
		        	 + "' class='selectBSIcheckbox' type='checkbox' id='selectBSIcheckbox"
		        	 + i + "' /> "
		        	 + "<label onclick='selectChecked(this)' for='selectBSIcheckbox"
		        	 + i + "'></label>"
		        	 + "</div></td><td><a href='BookInfo/showBookInfo?bookif.bookid="
		        	 + data.pagingList[i].bi.bookid + "' target='_blank'>"
		        	 + data.pagingList[i].bi.bookname + "</a></td>"
		        	 + "<td><a href='Bci/showBci?bci.bookId="
		        	 + data.pagingList[i].bi.bookid + "&bci.catalogId="
		        	 + data.pagingList[i].catalogid + "' target='_blank'>"
		        	 + data.pagingList[i].bci.catalogTitle + "</a></td>"
		        	 + "<td><a href='Bci/showBci?bci.bookId=" + data.pagingList[i].bi.bookid
		        	 + "&bci.catalogId=" + data.pagingList[i].bi.bci[count].catalogId
		        	 + "' target='_blank'>" + data.pagingList[i].bi.bci[count].catalogTitle
		        	 + "</a></td>" + "<td>" + data.pagingList[i].bi.author.uname
		        	 + "</td><td><span class='spanA' onclick='deleteBsi1(this)' userid='"
		        	 + data.pagingList[i].userid + "' bookid='" + data.pagingList[i].bi.bookid
		        	 + "' bookname='图书《" + data.pagingList[i].bi.bookname + "》' catalogId='"
		        	 + data.pagingList[i].catalogid + "' >移除</span></td></tr>";
		    }
		    $("#BookSheifControl .menuContent table tbody").eq(0).html(html);
		    if ("" == data) {
		        $("#BookSheifControl .menuContent table tbody").eq(1).hide();
		    }
		    else {
		        $("#BookSheifControl .menuContent table tbody").eq(1).show();
		    }
		    var prev = "showBsis(" + (data.currentPage - 1) + ")";
		    var next = "showBsis(" + (data.currentPage + 1) + ")";
		    if (data.currentPage == data.totalPages) {
		        next = "void(0)";
		    }
		    if (data.currentPage == 1) {
		        prev = "void(0)";
		    }
		    //书架分页
		    $('#BsiPagingUL').jqPaginator('option', 
		    {
		        totalPages : data.totalPages, 
		        visiblePages : 5, 
		        currentPage : data.currentPage, 
		        prev : "<li class='prev'><a href='javascript:" + prev + "'>&laquo;</a></li>", 
		        next : "<li class='next'><a href='javascript:" + next + "'>&raquo;</a></li>" 
		    });
		}
		//点击菜单时要显示的div
		function showDiv(id,obj)
		{
		    $(".control-main .control-content").hide();
		    $("#" + id).show(0, function ()
		    {
		        $("#" + id + " .menuTab .active").eq(0).click();
		    });
		    $(".control-menu .click-hd .active").removeClass("active");
		    $(obj).parent().addClass("active");
		}

</script>
</head>

<body>
	<div id="HomeContent">
		<div class="control">
			<div class="pull-left control-menu">
				<div class="control-title">
					<span class="ribbon"></span> <i class="iconfont"></i> 会员中心
				</div>
				<div class="click-hd">
					<h3 class="active">
						<a> <i class="iconfont"></i> 我的首页
						</a>
					</h3>
					<h3>
						<a href="javascript:void(0)" onclick="showDiv('BookSheifControl',this)"> <i class="iconfont"></i> 我的书架
						</a>
					</h3>
					<h3>
						<a> <i class="iconfont"></i> 我的收藏
						</a>
					</h3>
					<h3>
						<a> <i class="iconfont"></i> 我的书评
						</a>
					</h3>
					<h3>
						<a href="javascript:void(0)" onclick="showDiv('editBookDiv',this)"> <i class="iconfont"></i> 图书编辑
						</a>
					</h3>
					<h3>
						<a> <i class="iconfont"></i> 我的钱包
						</a>
					</h3>
					<h3>
						<a> <i class="iconfont"></i> 个人设置
						</a>
					</h3>
					<h3>
						<a> <i class="iconfont"></i> 充值中心
						</a>
					</h3>
					<h3>
						<a href="javascript:exitLogin2()"> <i class="iconfont"></i>
							退出登录
						</a>
					</h3>
				</div>
			</div>
			<div class="pull-left control-main">
				<div class="control-content" id="BookSheifControl">
					<div class="menuTab">
						<span class="active" url="BookSheifInfo/queryAddTimeBsi" onclick="switchoverBookSheifInfo(this)">按收藏时间排序</span>
						<span url="BookSheifInfo/queryUpdateTimeBsi" onclick="switchoverBookSheifInfo(this)">按更新时间排序</span>
					</div>
					<div class="menuContent">
						<form>
							<table class="table table-condensed">
								<thead>
									<tr>
										<th></th>
										<th>书名</th>
										<th>阅读章节</th>
										<th>最新章节</th>
										<th>作者</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody></tbody>
								<tbody>
								<tr>
									<td class="td" style="text-align: right;">
										<div class="icheck-re">
										<input type="checkbox" id="selectAll"/>
										<label for="selectAll" onclick="selectAll()"></label>
										</div>
									</td>
									<td class="td">
										<label id="selectAllLaber" onclick="selectAll()" for="selectAll">全选</label>
										<label id="selectAllSpan" onclick="deleteBsiAll(this)" class="spanA" userid="1" bookid="" bookname="选中的图书">移除所选</label>
									</td>
									<td class="td" colspan="3" style="text-align: right;">
										<ul id="BsiPagingUL" style="margin: 0px;" class="pagination pagingation-lg"></ul>
									</td>
									<td class="td"></td>
								</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<div class="control-content" id="editBookDiv">
					<div class="menuTab">
						<span class="active" id="queryAuthorSpan" onclick="queryAuthorBookInfo(this)">作品管理</span>
						<span  onclick="showAddBookDiv(this)">新建作品</span>
						<span  onclick="">查看收入</span>
					</div>
					<div class="menuContent">
						<div class="panel-group" id="editBookInfo" style="display: none;"></div>
						<div id="ediyBookinfoAdd" style="padding: 10px;">
							<div class="pull-right" style="width:22%;font-size: 14px;line-height: 1.5em;border-left: 1px solid #e0e0e0;padding-left: 10px;">
								<h5 style="color:red;">新建作品说明：</h5>
								1、每项都为必填项。<br/>
								2、书名长度限16字符以下。<br/>
								3、每位作者只能同时连载3部作品。<br/>
								4、作品名字应与内容相符，不具有文学性、故意夸大其词的广告性、政治性以及恶搞性作品名将会被删除。<br/>
								5、上传的作品内容必须与符合潇湘书院传收录标准，不符合收录标准的作品将被禁阅或删除。<br/>
								6、新作品将在24小时内审核完毕，请建立完后立即上传章节，凡章节低于三章或少于3000字一般不会通过审核。<br/>
							</div>
							<form method="post" id="addBookInfoForm" role="form" style="width: 75%;">
								<input type="hidden" name="bookif.author.userid" value="10001" />
								<input type="hidden" name="bookif.bst.bsid" value="1" />
								<div class="form-group">
									<label class="control-label" for="">作品名称</label>
									<div style="position: relative;width: 50%;">
										<input maxlength="16" type="text"
										onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"onpaste="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"oncontextmenu ="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
										 id="bookNameText" name="bookif.bookname" class="form-control" placeholder="请输入书名（确认后不可更改）">
										<div class="fromInfo text-info bg-info" style="display: inline;">
										* 最多16个字符，只能由中英文号组成，查看<a>起书名规范条例</a>>>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>作品类别</label>
									<div style="position: relative;width: 50%;">
										<select id="bookInfoTypeSelect" name="bookif.bti.btid" class="form-control"></select>
										<div class="fromInfo text-info bg-info" style="display: inline;">
										* 请认真选择作品类别,一旦设定,将无法更改。
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>作品风格</label>
									<div id="bookStyleDiv"></div>
								</div>
								<div class="updateFile form-group">
									<label>作品图片</label>
									<div class="fileDiv" style="position: relative;">
										<button type="button" class="close" onclick="clearAway(this)" style="display: none;"><i class="glyphicon glyphicon-remove" style="color: red;"></i></button>
										<input type="file" id="bookPicFile" onchange="changImg(event,this)" name="bookpic" style="display: none;" />
										<div class="fileDefaultDiv" onclick="selectPic(this)">+</div>
										<img alt="" teaPicName="" src="" onclick="selectPic(this)">
										<div class="fromInfo text-info bg-info" style="display: inline;margin-left: 5px;">
											* 请选择规范的图片<br />图片中不能包含任何联系方式
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>内容简介</label>
									<div style="position: relative;width: 85%;">
										<textarea class="form-control"  rows="7" id="bookIntrodText" name="bookif.bookintrod" placeholder="请不要在内容简介中泄露你的QQ,电话等联系方式，以免被他人盗用"></textarea>
										<div class="fromInfo text-info bg-info" style="display: inline;">
											* 20至1000字，<br />填写后不可修改
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>著作权确认</label>
									<div class='icheck-re'>
										<input type='checkbox' id="affirmCheckbox" />
										<label for="affirmCheckbox" onclick="checkAffirm(this)" style="font-size: 12px;">
											 我谨保证我是此作品的著作权合法人，我同意“A309”及“A309”所属合作的网站、平台和媒体发表此稿件，并承诺主动在A309书院站上进行作品更新。未经A309书院或本人同意，其他媒体一律不得转载。
										</label>
									</div>
								</div>
								<div class="form-group">
									<input type="button" id="addBookInofBtn" onclick="addBookInfo()" class="btn btn-success btn-lg" disabled="disabled" value="创建作品" />
									<input type="reset" class="btn btn-danger btn-lg" value="重置" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">

$(function ()
		{
		    $("#bookNameText").blur(function ()
		    {
		        checkBookName();
		    }).focus(function(){
		    	$(this).parent().find(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("* 最多16个字符，只能由中英文号组成，查看<a>起书名规范条例</a>>>");
		    });
		});
		//选择图片
		function selectPic(obj)
		{
		    var parent = $(obj).parent();
		    parent.find("input").click();
		}
		//图片回显
		function changImg(e, obj) 
		{
		    var parent = $(obj).parent();
		    var num = $(obj).val().lastIndexOf(".");
		    var check = $(obj).val().substring(num + 1);
		    if (check == "jpg" || check == "gif" || check == "png" || check == "jpeg")
		    {
		        for (var i = 0; i < e.target.files.length; i++) 
		        {
		            var file = e.target.files.item(i);
		            if (!(/^image\/.*$/i.test(file.type))) {
		                continue;
		                //不是图片 就跳出这一次循环  
		            }
		            //实例化FileReader API  
		            var freader = new FileReader();
		            freader.readAsDataURL(file);
		            freader.onload = function (e) 
		            {
		                parent.find("img").attr("src", e.target.result).show();
		                parent.find("button").show();
		                parent.find("div").hide();
		            };
		        }
		    }
		    else {
		    	$(obj).val("");
		        toastr.error("请选择正确的图片格式！");
		    }
		}
		//清除选择的图片
		function clearAway(obj)
		{
		    var parent = $(obj).parent();
		    $(obj).hide();
		    parent.find("img").attr("src", "").hide();
		    parent.find("div").show();
		    parent.find("input").val("");
		}
		//显示添加图书的div
		function showAddBookDiv(obj){
			switchMenu(obj);
			showBookTypeAndStyle();
			$("#addBookInfoForm")[0].reset();
			$("#ediyBookinfoAdd").parent().children("div").hide();
			$("#ediyBookinfoAdd").show();
		}
		//验证作品名不为空
		function checkBookName()
		{
		    var str = ($("#bookNameText").val());
		    var infoObj = $("#bookNameText").parent().find(".fromInfo");
		    var result = false;
		    if ( str == "") {
		    	infoObj.removeClass().addClass("fromInfo bg-error").html("作品名不能为空");
		        result = false;
		    }
		    else 
		    {
		        $.ajax(
		        {
		            url : 'BookInfo/checkBookName', 
		            data : {
		                'bookif.bookname' : str 
		            },
		            type : 'post', 
		            dataType : 'json',
		            async:false,
		            success : function (data)
		            {
		                if ( null == data ) {
		                	infoObj.removeClass().addClass("fromInfo text-success bg-success").html("作品名可以使用");
		                    result = true;
		                }
		                else {
		                	infoObj.removeClass().addClass("fromInfo bg-error").html("作品名已经存在！");
		                    result = false ;
		                }
		            }
		        });
		    }
		    ;
		    return result;
		}
		//验证作品简介不能为空
		function checkBookIntrod()
		{
		    var obj = $("#bookIntrodText");
		    if (obj.val() == "") {
		        toastr.error("作品简介不能为空！");
		        return false ;
		    }
		    else {
		        return true;
		    }
		}
		//判断图片不能为空
		function checkBookPic()
		{
			if($("#bookPicFile").val()==""){
				toastr.error("作品图片不能为空！");
				return false;
			}
			return true;
		}
		//判断是否选中同意条款,同意以后才可以使用提交按钮
		function checkAffirm(obj){
			obj = $(obj).prev();
		    if ($(obj).prop("checked")) {
		        $("#addBookInofBtn").prop("disabled",true);
		    }else{
		    	$("#addBookInofBtn").prop("disabled",false);
		    }
		}
		//添加图书信息
		function addBookInfo()
		{
		 var form = new FormData(document.getElementById("addBookInfoForm"));
			if(checkBookName() && checkBookIntrod() && checkBookPic()){
				$.ajax({
					url : 'BookInfo/addBookInfo', 
					type : 'post', 
					data : form, 
					dataType : 'json',
					processData : false,
					contentType : false,
					success : function (data)
					  {
					     if(null!=data){
					    	 toastr.success("作品图片不能为空！");
						     editBookInfoContent(data);
						     $("#queryAuthorSpan").click();
					     }
					  },
					error : function(){
						
					}
				});
			}
		    
		}
		//显示小说分类和风格选项
		function showBookTypeAndStyle()
		{
			if($("#bookInfoTypeSelect").html()==""){
				//读取小说分类信息
			    $.ajax(
			    {
			        url : 'BookTypeInfo/queryBookTypeInfo', 
			        type : 'post', 
			        dataType : 'json',
			        success : function (data) 
			        {
			            var menu = "";
			            for (var i = 0; i < data.length; i++) 
			            {
			                if ( i == 0 )
			                {
			                    menu += "<option checked='checked' value='" + data[i].btid + "'>" + data[i].btname + "</option>";
			                }
			                else {
			                    menu += "<option value='" + data[i].btid + "'>" + data[i].btname + "</option>";
			                }
			            }
			            $("#bookInfoTypeSelect").html(menu);
			        }
			    });
			}
			if($("#bookStyleDiv").html()==""){
				 //读取小说风格信息
			    $.ajax(
			    {
			        url : 'BookStyle/queryAll', 
			        type : 'post', 
			        dataType : 'json',
			        success : function (data) 
			        {
			            var menu = "";
			            for (var i = 0; i < data.length; i++) 
			            {
			                menu += "<div class='icheck-re icheck-inline' style='width:19%;'><input ";
			                if ( i == 0 ) {
			                    menu += "checked='checked'";
			                }
			                menu += " value=" + data[i].bstid + " name='bookif.bstys.bstid'  type='checkbox' id='bookStyleCheckbox"
			                	 + i + "' />" + "<label for='bookStyleCheckbox" + i + "'>"
			                	 + data[i].bstname + "</label></div>";
			                if ( ( i + 1 ) % 5 == 0 ) {
			                    menu += "<br /><br />";
			                }
			            }
			            $("#bookStyleDiv").html(menu);
			        }
			    });
			}
		   
		}
		//查看图书信息
		function queryAuthorBookInfo(obj)
		{
			switchMenu(obj);
		    var userid = 10001;
		    if($("#editBookInfo").html()==""){
		    	$.ajax(
		    		    {
		    		        url : "BookInfo/queryAuthorBookInfo", 
		    		        type : "post", 
		    		        data : {
		    		            "bookif.authorid" : userid 
		    		        },
		    		        dataType : "json",
		    		        success : function (data)
		    		        {
		    		        	editBookInfoContent(data);
		    		        }
		    		    });
		    }
		    
		    $("#editBookInfo").parent().children("div").hide();
            $("#editBookInfo").show();
		}
		//编辑作品管理的页面的内容
		function editBookInfoContent(data){
			 var html = "";
	            if (data.length == 0) {
	                html = "你还没有发布作品，请先发布一个作品！";
	            }
	            else
	            {
	                html = "<div class='panel panel-default'><div class='panel-heading'>"
	                	 + "<span class='span1' style='font-size: 18px;'>书名</span>"
	                	 + "<span class='span2' style='font-size: 18px;'>状态</span>"
	                	 + "<span class='span1' style='font-size: 18px;'>最新章节</span></div></div>";
	                for (var i = 0 ; i < data.length ; i++)
	                {
	                    html += "<div class='panel panel-warning'><div class='panel-heading'>"
	                    	 + "<span class='span1'>" + data[i].bookname + "</span>"
	                    	 + "<span class='span2'>" + data[i].bst.bsname + "</span>"
	                    	 + "<span class='span1'>";
	                    if(data[i].bci.length>0){
	                    	html += data[i].bci[data[i].bci.length - 1].catalogTitle;
	                    }else{
	                    	html +="暂无章节";
	                    }
	                    html += "</span>"
	                    	 + "<span class='spanA span3' data-toggle='collapse' data-parent='#editBookInfo' onclick='showBookInfoDiv(this)' data-target='#BookInfo" + i + "'>" + "详细信息</span><span class='span2'>编辑</span></div>"
	                    	 + "<div id='#BookInfo" + i + "' class='panel-collapse collapse'>" + "<div class='panel-body'><span>类型："
	                    	 + data[i].bti.btname + "</span><span> </span><span>风格：</span>";
	                    for (var j = 0 ; j < data[i].bstys.length ; j++) {
	                        html += "<span>" + data[i].bstys[j].bstname + "</span>";
	                    }
	                    html += "<span>上架时间：" + data[i].addtime.replace("T"," ") + "</span>"
	                    	 + "<p>" + data[i].bookintrod + "</p>"
	                    	 + "<span><span class='span4'>" + data[i].booksize + "</span>字</span>"
	                    	 + "<span><span class='span4'>" + data[i].readnum + "</span>阅读</span>"
	                    	 + "<span><span class='span4'>" + data[i].collectnum + "</span>收藏</span>"
	                    	 + "<span>最后更新：" + data[i].updatetime.replace("T"," ") + "</span></div></div></div>";
	                }
	            }
	            $("#editBookInfo").html(html);
		}
		//显示或隐藏图书详细信息
		function showBookInfoDiv(obj)
		{
		    var id = "" + $(obj).attr("data-target");
		    $("#editBookInfo .collapse").each(function ()
		    {
		        if ($(this).attr("id") == id && $(this).css("display") == "none") {
		            $(this).show(300);
		        }
		        else {
		            $(this).hide(300);
		        }
		    });
		}
		//书架复选框全选与全不选
		function selectAll()
		{
		    if ($("#selectAll").prop("checked")) {
		        $("#selectAllLaber").html("全选");
		    }
		    else {
		        $("#selectAllLaber").html("取消全选");
		    }
		    $("#BookSheifControl .menuContent table .selectBSIcheckbox").each(function () 
		    {
		        $(this).prop("checked", !$("#selectAll").prop("checked"));
		    });
		}
		//书架复选框选中时判断是否全选
		function selectChecked(obj)
		{
		    obj = $(obj).prev();
		    if ($(obj).prop("checked")) {
		        $("#selectAll").prop("checked", false);
		        $("#selectAllLaber").html("全选");
		    }
		    else
		    {
		        var num = $("#BookSheifControl .menuContent table .selectBSIcheckbox").length - 1;
		        var num1 = 0;
		        $("#BookSheifControl .menuContent table .selectBSIcheckbox").each(function () 
		        {
		            if ($(this).prop("checked")) {
		                num1++;
		            }
		        });
		        if (num == num1) {
		            $("#selectAll").prop("checked", true);
		            $("#selectAllLaber").html("取消全选");
		        }
		    }
		}
		//删除选中的全部图书
		function deleteBsiAll(obj)
		{
		    var bookid = "";
		    $("#BookSheifControl .menuContent table .selectBSIcheckbox").each(function () 
		    {
		        if ($(this).prop("checked")) {
		            bookid += ",'" + $(this).val() + "'";
		        }
		    });
		    $(obj).attr("bookid", bookid.substring(2, bookid.length - 1));
		    if ($(obj).attr("bookid") != "") {
		        deleteBsi1(obj);
		    }
		    else {
		        toastr.error("请选择要删除的图书");
		    }
		}
		//删除选择的图书
		function deleteBsi1(obj)
		{
		    if (confirm('您确认要将' + $(obj).attr("bookname") + '从书架中移除?'))
		    {
		        $.ajax(
		        {
		            url : "BookSheifInfo/deleteBsi?bsi.userid=" + $(obj).attr("userid") + "&bsi.bookid='" + $(obj).attr("bookid") + "'", 
		            data : "post",
		            dataType : "json",
		            async : false,
		            success : function (data)
		            {
		                if (data != null) {
		                    toastr.success("删除成功");
		                    $("#BookSheifControl .menuTab .active").click();
		                }
		                else {
		                    toastr.error("删除失败");
		                }
		            },
		            error : function () { }
		        });
		    }
		}

</script>
	<div class="bottomDiv">
		<div class="bottomMenu">
			<a>关于本站</a> <a>联系我们</a> <a>作者帮助</a> <a>会员帮助</a>
		</div>
		<p>
			版权所有：AAA软件学院A309。<a href="http://www.miibeian.gov.cn/"
				target="_blank">豫ICP备400000010001号</a>
		</p>
	</div>
</body>
</html>
