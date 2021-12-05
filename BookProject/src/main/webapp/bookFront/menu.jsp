<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style type="text/css">
.LoginAndSignTab{
	width:50%;
	float: left;
	border-bottom:3px solid red;
	text-align: center;
	padding:20px 0 20px 0;
	font-size: 25px;
}
.f4 {
	text-align: center;
	width: 4em;
}

.f3 {
	letter-spacing: 0.5em;
	margin-right: -0.5em;
}

.f2 {
	letter-spacing: 2em;
	margin-right: -2em;
}

a{
	outline: 0;
	text-decoration: none;
}

a:hover,.spanA:hover {
	color: #fb6b84 !important;
	cursor: hand;
	text-decoration: none;
	transition: color .2s, background-color .2s;
}

@font-face {
	font-family: "iconfont";
	src: url('iconfont.eot?t=15337122965142'); /* IE9*/
	src: url('iconfont.eot?t=15337122965142#iefix')
		format('embedded-opentype'), /* IE6-IE8 */    
  
		
		
		
		
		url('data:application/x-font-woff;charset=utf-8;base64,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')
		format('woff'), url('iconfont.ttf?t=15337122965142')
		format('truetype'),
		/* chrome, firefox, opera, Safari, Android, iOS 4.2+*/
  url('iconfont.svg?t=15337122965142#iconfont') format('svg');
	/* iOS 4.1- */
}

/*表单填写提示*/
.fromInfo{
	position: absolute;
	left:101%;top:2px;
	width:auto;
	padding: 8px;
	border-radius:6px;
	white-space:nowrap;
	font-size:10px;
	display: none;
}
.bg-error{
	color:#a94442;
	background-color: #f2dede;
}
#homeTop{
	height:150px;
	background:url('image/head/head-1.jpg');
	background-size:100% 100%;
	position: relative;
}
#bookSheifInfoDiv{
	width: 500px;
	height:200px;
	position: absolute;
	padding:10px;
	top:85%;
	right:0px;
	background-color: #eeeeee;
	border-radius:4px;
	display: none;
	overflow: auto;
}

.iconfont {
    font-family: "iconfont" !important;
    font-size: 16px;
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
input{
	margin: 0;
    vertical-align: middle;
    outline: 0;
}
.search-text{
	width: 430.8px;
	font-size: 16px;
	padding: 0 20px;
	height: 44px;
	line-height: 44px;
	border: 1px solid #ccc;
	border-right: 0;
	-webkit-border-radius: 22px 0 0 22px;
	color: #000;
}
.search-btn-bar {
    position: relative;
    display: inline-block;
    width: 50px;
    height: 44px;
    vertical-align: middle;
    background-color: #fb6b84;
    border-radius: 0 22px 22px 0;
    -webkit-border-radius: 0 22px 22px 0;
    -moz-border-radius: 0 22px 22px 0;
    -ms-border-radius: 0 22px 22px 0;
}
.search-btn-bar .iconfont {
    position: absolute;
    left: 0;
    top: 0;
    z-index: 1;
    font-size: 26px;
    line-height: 42px;
    width: 50px;
    text-align: center;
    color: #fff;
}
.search-btn-bar .search-btn {
    width: 50px;
    height: 44px;
    border: 0;
    background: 0;
    position: absolute;
    left: 0;
    top: 0;
    z-index: 2;
    cursor: pointer;
}
.bottomDiv{
    background: #f7f7f7;
    border-top: 2px solid #ddd;
    color: #333;
    text-align: center;
    line-height: 28px;
    padding: 0 0 30px;
}
.bottomDiv .bottomMenu {
    line-height: 48px;
}
.bottomDiv a{
	outline: 0;
	text-decoration: none;
	color: #000;
	display: inline-block;
	padding: 0 25px;
}
.bottomDiv a:hover{
	color: #fb6b84 !important;
	cursor: hand;
}
</style>

<script type="text/javascript">
	$(function() {
		//使提示信息居中显示
		toastr.options.positionClass = 'toast-center-center';
		//使用bootstrap提示工具
		$("[data-toggle='tooltip']").tooltip();
		//使用bootstrap弹出框
		$("[data-toggle='popover']").popover();
		//设置导航栏的大小
		setNav();
		//分辨率大小改变时
		$(window).resize(function(){
			setNav();
			});
		//判断用户是否登录
		checkUser();
		//书架的显示和隐藏
		$("#bookSheifInfoLI").mouseover(function (){  
            $("#bookSheifInfoDiv").show();  
        }).mouseout(function (){  
            $("#bookSheifInfoDiv").hide();  
        });
		//读取导航栏
		$.ajax({
			url : 'BookTypeInfo/queryBookTypeInfo',
			type : 'post',
			dataType : 'json',
			async:false,
			success : function(data) {
				var menu = "<li><a href='bookFront/HomePage.jsp' style='color:black;'>首页</a></li>";
				for (var i = 0; i < data.length; i++) {
					menu += "<li style='border-left:1px dashed black;'><a href='BookInfo/showQueryBookInfo?bookif.btid="+data[i].btid+"' style='color:black;'>"
							+ data[i].btname + "</a></li>";
					}
				$("#menu").html(menu);
			}
		});
		$("#loginA,#loginDivTab").click(function() {
			if($("#userLogin").is(":hidden")){
				createCode();
				$("#loginDivTab").css({
					"color" : "red",
					"border-color" : "red"
				});
				$("#signDivTab").css({
					"color" : "black",
					"border-color" : "black"
				});
				$("#loginFrom")[0].reset();
				$("#loginFrom input").each(function() {
					$(this).parent().removeClass("has-error has-success has-warning").nextAll(".fromInfo").hide();
				});
				$("#userSign").hide();
				$("#userLogin").show();
			}
		});
		$("#signA,#signDivTab").click(function() {
			if($("#userSign").is(":hidden")){
				$("#loginDivTab").css({
					"color" : "black",
					"border-color" : "black"
				});
				$("#signDivTab").css({
					"color" : "red",
					"border-color" : "red"
				});
				$("#signFrom")[0].reset();
				smsCheckNum=0;
				$("#signFrom input").each(function() {
					$(this).parent().removeClass("has-error has-success has-warning").nextAll(".fromInfo").hide();
				});
				$("#pwdWeak").css("width","0%").html("");
				$("#pwdMedium").css("width","0%").html("");
				$("#pwdStrong").css("width","0%").html("");
				$("#userLogin").hide();
				$("#userSign").show();
			}
		});
		$("input").focus(function() {
			$(this).parent().removeClass("has-error has-success has-warning");
		});
		var checkReadNum = false;
		var checkUnameLogin = false;
		var checkUpwdLogin = false;
		$("#checkRandNumText").blur(function() {
			if ($(this).val() == "") {
				$(this).parent().addClass("has-warning").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("请填写验证码").show();
				checkReadNum = false;
			} else if ($(this).val().toLowerCase() == code) {
				$(this).parent().addClass("has-success").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-success bg-success").html("正确 <span class='glyphicon glyphicon-ok'></span>").show();
				checkReadNum = true;
			} else {
				$(this).parent().addClass("has-error").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo bg-error").html("验证码填写错误,请重新填写").show();
				createCode();
				checkReadNum = false;
			}
		}).focus(function(){
			$(this).parent().parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("请输入验证码").show();
		});

		$("#unameLogin").blur(function() {
			if ($(this).val() == "") {
				$(this).parent().addClass("has-warning").nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("用户名不能为空").show();
				checkUnameLogin = false;
			} else if ($(this).val().length > 3) {
				$(this).parent().addClass("has-success").nextAll(".fromInfo").removeClass().addClass("fromInfo text-success bg-success").html("正确 <span class='glyphicon glyphicon-ok'></span>").show();
				checkUnameLogin = true;
			} else {
				$(this).parent().addClass("has-error").nextAll(".fromInfo").removeClass().addClass("fromInfo bg-error").html("请填写正确的用户名或手机号").show();
				checkUnameLogin = false;
			}
		}).focus(function(){
			$(this).parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("请输入正确的用户名或手机号").show();
		});
		$("#upwdLogin").blur(function() {
			if ($(this).val() == "") {
				$(this).parent().addClass("has-warning").nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("密码不能为空").show();
				checkUpwdLogin = false;
			} else if ($(this).val().length > 5) {
				$(this).parent().addClass("has-success").nextAll(".fromInfo").removeClass().addClass("fromInfo text-success bg-success").html("正确 <span class='glyphicon glyphicon-ok'></span>").show();
				checkUpwdLogin = true;
			} else {
				$(this).parent().addClass("has-error").nextAll(".fromInfo").removeClass().addClass("fromInfo bg-error").html("密码格式不正确").show();
				checkUpwdLogin = false;
			}
		}).focus(function(){
			$(this).parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("请输入正确的登录密码").show();
		});
		//登录
		$("#LoginSub").click(function() {
			$("#loginFrom input").each(function() {
				$(this).blur();
			});
			if (checkReadNum && checkUnameLogin&& checkUpwdLogin) {
				$.ajax({
					url : 'users/Login' ,
					type : 'post',
					data : $("#loginFrom").serialize(),
					dataType : 'json',
					success : function(data) {
						if (data) {
						location.reload();
						} else {
							toastr.error("用户名不存在或密码不正确");
							createCode();
							$("#loginFrom")[0].reset();
							$("#loginFrom input").each(function() {
								$(this).parent().removeClass("has-error has-success has-warning").nextAll(".fromInfo").hide();
							});
						}
					},
					error : function() {}
				});
			}  
			
		});
		
		
		//获取短信验证码
		$("#loginCheckSpan").click(function() {
			if(signPhoneTextBlur()){
				getSmsCheckNum();
				$(this).prop("disabled", "disabled");
				num = 60;
				smsTime();
			}else{
				toastr.error("请输入正确的手机号");
			}
		});
		//切换随机验证码
		$("#NumCheckSpan").click(function() {
			createCode();
		});
		//注册手机号验证
		$("#signPhoneText").blur(function(){
			signPhoneTextBlur();
		}).focus(function(){
			$(this).parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("请输入11位手机号").show();
		});
		//注册用户名验证
		$("#signUnameText").blur(function(){
			signUnameTextBlur();
		}).focus(function(){
			$(this).parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("请填写一个不一样的用户名").show();
		});
		//注册密码验证
		$("#signUpwdText").blur(function(){
			signUpwdTextBlur();
		}).focus(function(){
			$(this).parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("设置一个密码保护你的账户").show();
		});
		//注册密码再次确认
		$("#signUpwdCheckText").blur(function(){
			signUpwdCheckTextBlur();
		}).focus(function(){
			$(this).parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("再次输入密码确认一下").show();
		});
		//手机验证码确认
		$("#smsCheckNumText").blur(function(){
			smsCheckNumTextBlur();
		}).focus(function(){
			$(this).parent().parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("请输入获得的手机验证码").show();
		});
		
		//用户注册
		$("#signSub").click(function(){
			if(signPhoneTextBlur() && signUnameTextBlur() && signUpwdTextBlur() && signUpwdCheckTextBlur() && smsCheckNumTextBlur()){
				$.ajax({
					url:"user/userSign?" ,
					type:"post",
					data:$("#signFrom").serialize(),
					dataType:"json",
					async:false,
					success:function(data){
						if(data){
							toastr.success("恭喜你，注册成功！");
							setTimeout(function () { 
								location.reload();
							}, 2000);
						}else{
							toastr.error("注册失败，请重新注册");
						}
					},
					error:function(){
						toastr.error("出错了");
					}
				});
			}
		});
		
	});
	//如果用户已经登录,获取用户信息
	var user = "${sessionScope.user}";
	//判断用户是否登录
	function checkUser() {
		if (user == "") {
			$("#UserInfoORExit").hide();
			$("#LoginOrSign").show();
		} else {
			$("#LoginOrSign").hide();
			$("#UserInfo").html('${user.uname}');
			$("#UserInfoORExit").show();
			showBsi(${user.userid});
		}
	}
	//显示书架信息
	function showBookSheifInfo(data){
		var html="";
		for(var i=0 ; i < data.length ; i++ ){
			html+="<tr><td><a href='BookInfo/showBookInfo?bookif.bookid="
				+ data[i].bi.bookid + "' target='_blank'>"+data[i].bi.bookname+"</a></td>"
				+ "<td><a href='Bci/showBci?bci.bookId="
				+ data[i].bi.bookid + "&bci.catalogId="
				+ data[i].catalogid + "' target='_blank'>"+data[i].bci.catalogTitle+"</a></td>"
				+ "<td>"+data[i].bi.author.uname+"</td><td><span class='spanA' onclick='deleteBsi(this)' userid='"
				+ data[i].userid + "' bookid='" + data[i].bi.bookid + "' bookname='"
				+ data[i].bi.bookname +"' catalogId='" + data[i].catalogid + "' >移除</span></td></tr>";
		}
		$("#bookSheifInfoDiv table tbody").html(html);
	}
	//读取用户书架信息
	function showBsi(userid){
		$.ajax({
			url:"BookSheifInfo/queryBsi?bsi.userid="+userid,
			type:"post",
			dataType:"json",
			async:false,
			success:function(data){
				showBookSheifInfo(data);
			},
			error:function(){
				
			}
		});
	}
	//加入书架时判断用户是否登录
	function addBookSheifInfo(obj){
		if(user == "") {
			$("#loginA").click();
		} else {
			$.ajax({
				url:"BookSheifInfo/addBsi",
				type:"post",
				data:{
					"bsi.userid":"${user.userid }",
					"bsi.bi.bookid":$(obj).attr("bookid"),
					"bsi.bci.catalogId":$(obj).attr("catalogid")
				},
				dataType:"json",
				async:false,
				success:function(data){
					if(data!=null){
						toastr.success("添加成功");
						showBookSheifInfo(data);
					}else{
						toastr.error("添加失败,图书已经在书架中了！");
					}
				},
				error:function(){
						
				}
			});
		}
	}
	//删除用户书架中的指定图书信息
	function deleteBsi(obj){
		if (confirm('您确认要将图书《'+$(obj).attr("bookname")+'》从书架中移除?')){
			$.ajax({
				url:"BookSheifInfo/deleteBsi",
				type:"post",
				data:{
					"bsi.userid":$(obj).attr("userid"),
					"bsi.bookid": "'"+ $(obj).attr("bookid")+"'"
				},
				dataType:"json",
				async:false,
				success:function(data){
					if(data!=null){
						toastr.success("删除成功");
						showBookSheifInfo(data);
					}else{
						toastr.error("删除失败");
					}
				},
				error:function(){
						
				}
			});
		}
	}
	//设置导航栏的大小
	function setNav(){
		var scrWidth=window.screen.width;
		$("nav").css({"width":scrWidth,"min-width":scrWidth});
		$("nav ul").css({"font-size":scrWidth/64+"px"});
		$("nav #navLeft ul").css({"font-size":scrWidth/85+"px"});
		$("body").css({"width":scrWidth*0.989+"px","margin":"auto","padding-top":$("nav").height()*0.6425});
	}
	var code;
	//创建随机验证码
	function createCode() {
		code = "";
		var codeLength = 6; //验证码的长度
		var codeChars = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'm', 'n',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M',
				'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
		for (var i = 0; i < codeLength; i++) {
			var charNum = Math.floor(Math.random() * 57);
			code += codeChars[charNum];
		}
		$("#NumCheckSpan").val(code);
		//清除空格 并全部转换为小写
		code = code.toLowerCase();
	}
	
	var smsCheckNum;
	//获取手机验证码
	function getSmsCheckNum(){
		var phone=$("#signPhoneText").val();
		$.ajax({
			url:"smsVer/SignCheck",
			type:"post",
			data:{
				"phone":phone
			},
			dataType:"json",
			async:false,
			success:function(data){
				smsCheckNum=data;
			},
			error:function(){
				
			}
		});
	}
	//定义
	var num;
	var s;

	//手机验证码按钮切换
	function smsTime() {
		$("#loginCheckSpan").val(num + "s重新获取");
		num = num - 1;
		if (num == 50) {
			stopTime();
			$("#loginCheckSpan").val("获取短信验证码").prop("disabled", false);
		} else {
			s = setTimeout("smsTime()", 1000);
		}
	}
	//停用时间函数
	function stopTime() {
		clearTimeout(s);
	}
	//注册手机号验证
	function signPhoneTextBlur(){
		var text=$("#signPhoneText").val();
		var result=false;
		if(""==text){
			$("#signPhoneText").parent().addClass("has-warning").nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("手机号不能为空").show();
			result=false;
		}else if(!(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/.test(text))){
			$("#signPhoneText").parent().addClass("has-error").nextAll(".fromInfo").removeClass().addClass("fromInfo bg-error").html("手机号格式不正确").show();
			result=false;
		}else{
			$.ajax({
				url:"user/CheckPhone",
				type:"post",
				data:{
					"user.phone":text
				},
				dataType:"json",
				async:false,
				success:function(data){
					if(data){
						$("#signPhoneText").val("").parent().addClass("has-warning").nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("手机号已存在").show();
						result=false;
					}else{
						$("#signPhoneText").parent().addClass("has-success").nextAll(".fromInfo").removeClass().addClass("fromInfo text-success bg-success").html("手机号输入正确 <span class='glyphicon glyphicon-ok'></span>").show();
						result=true;
					}
				},
				error:function(xhr,status,error){
					toastr.error("错误");
				}
			});
		}
		return result;
	}
	//注册用户名验证
	function signUnameTextBlur(){
		var text=$("#signUnameText").val();
		var result=false;
		if(""==text){
			$("#signUnameText").parent().addClass("has-warning").nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("用户名不能为空").show();
			result=false;
		}else if(!/^[\u4E00-\u9FA5a-zA-Z0-9_-]{4,10}$/.test(text)){
			$("#signUnameText").parent().addClass("has-error").nextAll(".fromInfo").removeClass().addClass("fromInfo bg-error").html("用户名格式不正确").show();
			result=false;
		}else{
			$.ajax({
				url:"user/CheckUname",
				type:"post",
				data:{
					"user.name":text
				},
				dataType:"json",
				async:false,
				success:function(data){
					if(data){
						$("#signUnameText").val("").parent().addClass("has-warning").nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("用户名已存在").show();
						result=false;
					}else{
						$("#signUnameText").parent().addClass("has-success").nextAll(".fromInfo").removeClass().addClass("fromInfo text-success bg-success").html("用户名正确 <span class='glyphicon glyphicon-ok'></span>").show();
						result=true;
					}
				},
				error:function(xhr,status,error){
					toastr.error("错误");
				}
			});
		}
		return result;
	}
	//注册密码验证
	function signUpwdTextBlur(){
		var text=$("#signUpwdText").val();
		var result=false;
		if(""==text){
			$("#signUpwdText").parent().addClass("has-warning").nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("密码不能为空").show();
			result=false;
		}else if(!(/^[a-zA-Z][\S]{6,15}$/.test(text))){
			$("#signUpwdText").val("").parent().addClass("has-error").nextAll(".fromInfo").removeClass().addClass("fromInfo bg-error").html("密码格式不正确，请重新输入").show();
			result=false;
		}else{
			$("#signUpwdText").parent().addClass("has-success");
			pwdIntension($("#signUpwdText"));
			result=true;
		}
		return result;
	}
	//注册密码再次确认
	function signUpwdCheckTextBlur(){
		var text=$("#signUpwdCheckText").val();
		var result=false;
		if(""==text){
			$("#signUpwdCheckText").parent().addClass("has-warning").nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("请再次输入密码").show();
			result=false;
		}else if(text!=$("#signUpwdText").val()){
			$("#signUpwdCheckText").val("").parent().addClass("has-error").nextAll(".fromInfo").removeClass().addClass("fromInfo bg-error").html("密码不一致,请核对后输入").show();
			result=false;
		}else{
			$("#signUpwdCheckText").parent().addClass("has-success").nextAll(".fromInfo").removeClass().addClass("fromInfo text-success bg-success").html("输入正确 <span class='glyphicon glyphicon-ok'></span>").show();
			result=true;
		}
		return result;
	}
	//手机验证码确认
	function smsCheckNumTextBlur(){
		var text=$("#smsCheckNumText").val();
		var result=false;
		if(""==text){
			$("#smsCheckNumText").parent().addClass("has-warning").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("请输入收到的验证码").show();
			result=false;
		}else if(text!=smsCheckNum){
			$("#smsCheckNumText").val("").parent().addClass("has-error").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo bg-error").html("验证码输入错误，请重新输入").show();
			result=false;
		}else{
			$("#smsCheckNumText").parent().addClass("has-success").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-success bg-success").html("验证码输入正确 <span class='glyphicon glyphicon-ok'></span>").show();
			result=true;
		}
		return result;
	}
	
	//限制文本框只能输入整数
	function CheckNum(obj) {
		obj = $(obj);
		if (!/^\d+$/.test(obj.val())) {
			obj.val(obj.val().replace(/[^\d]+/g, ''));
		}
	}

	//密码强度判断
	function pwdIntension(obj) {
		  var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		  var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		  var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
		  if (false == enoughRegex.test($(obj).val())) { 
		    //密码小于六位的时候，密码强度图片都为灰色 
			$("#pwdWeak").css("width","0%").html("");
			$("#pwdMedium").css("width","0%").html("");
			$("#pwdStrong").css("width","0%").html("");
			$("#signUpwdText").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-info bg-info").html("设置一个密码保护你的账户").show();
		  } 
		  else if (strongRegex.test($(obj).val())) { 
		    //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
			$("#pwdWeak").css("width","33%").html("危险");
			$("#pwdMedium").css("width","34%").html("中等");
			$("#pwdStrong").css("width","33%").html("强");
			$("#signUpwdText").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-success bg-success").html("密码填写正确 <span class='glyphicon glyphicon-ok'></span>").show();
		  } 
		  else if (mediumRegex.test($(obj).val())) { 
		    //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
			$("#pwdWeak").css("width","33%").html("危险");
			$("#pwdMedium").css("width","34%").html("中等");
			$("#pwdStrong").css("width","0%").html("");
			$("#signUpwdText").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo text-warning bg-warning").html("试试数字,符号和大小<br>写字母组合提高密码强度").show();
		  } 
		  else { 
		    //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
			$("#pwdWeak").css("width","33%").html("危险");
			$("#pwdMedium").css("width","0%").html("");
			$("#pwdStrong").css("width","0%").html("");
			$("#signUpwdText").parent().nextAll(".fromInfo").removeClass().addClass("fromInfo bg-error").html("密码使用危险，试试更复杂的组合").show(); 
		  } 
		 }
	//退出登录
	function exitLogin(){
		$.ajax({
			url:"user/exitLogin",
			type:"post",
			dataType:"json",
			success:function(data){
				if(data){
					location.reload();
				}
			}
		});
	}
</script>

<nav class="navbar-fixed-top navbar-default" role="navigation"
	style="padding:5px 0 2px 5px;background-color: DarkGray;">
	<div style="width:20%;float: left;text-align: center;"><span class="glyphicon glyphicon-book"></span> 快乐阅读</div>
	<div style="width:55%;float: left;text-align: center;">
		<ul id="menu" class='nav nav-pills'></ul>
	</div>
	<div style="width:25%;float: left;padding-top: 3px;" id="navLeft">
		<ul id="LoginOrSign" class='nav nav-pills'>
			<li><a style='color:black;' data-toggle="modal" id="loginA"
				data-target="#login">登录</a></li>
			<li><a style='color:black;' data-toggle="modal" id="signA"
				data-target="#login">注册</a></li>
		</ul>
		<ul id="UserInfoORExit" class='nav nav-pills' style="font-size:22px;">
			<li><a style='color:black;' id="UserInfo" href="user/userControlCenter.action"></a></li>
			<li><a style='color:black;' id="exitLogin" href="javascript:exitLogin()">退出登录</a></li>
			<li id="bookSheifInfoLI"><a href="javascript:void(0)" style="color:black;position: relative;">书架
				<div id="bookSheifInfoDiv">
					<table class="table table-condensed"  style="text-align: center;font-size: 12px;">
					  <thead>
					  	<tr>
					      <th style="text-align: center;">书名</th>
					      <th style="text-align: center;">阅读章节</th>
					      <th style="text-align: center;">作者</th>
					      <th style="text-align: center;">操作</th>
					  	</tr>
					  </thead>
					  <tbody>
					    
					  </tbody>
					</table>
				</div>
				</a>
			</li>
		</ul>
	</div>

</nav>
<div id="HomeTop">
	<img id="TopBookTypePic" src="image/booktype1.png" style="width:150px;position: absolute;left:10%;top:45px;">
	<div style="width:auto;position: absolute;left:33%;top:50px;">
		<div class="input-group input-group-lg">
            <input type="text" class="search-text"><span class="search-btn-bar">
            	<i class="iconfont"></i>
            	<input class="search-btn" type="submit" value=""/>
            </span>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="login" data-backdrop="static" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="position: relative;">
			<button type="button" data-dismiss="modal" aria-hidden="true" class="close"
				style="position: absolute;top:5px;right:15px;font-size: 50px;">&times;</button>
			<div>
				<div id="loginDivTab" class="LoginAndSignTab">用户登录</div>
				<div id="signDivTab" class="LoginAndSignTab">快速注册</div>
				<div class="clearfix"></div>
			</div>
			<div class="modal-body" style="padding:10% 25% 10% 15%;">
				<!-- 用户登录 -->
				<div id="userLogin">
					<form id="loginFrom" role="form" method="post">
						<div class="form-group" style="position: relative;">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-user"></span>
								</div>
								<input maxlength="11" type="text" class="form-control"
									id="unameLogin" name="user.uname" placeholder="请输入用户名 / 手机号">
							</div>
							<div class="fromInfo text-info bg-info">设置一个密码保护安全</div>
						</div>
						<div class="form-group" style="position: relative;">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock"> </span>
								</div>
								<input type="password" maxlength="18" class="form-control" id="upwdLogin"
									name="user.upwd" placeholder="请输入密码">
							</div>
							<div class="fromInfo text-info bg-info">设置一个密码保护安全</div>
						</div>
						<div class="form-group" id="smsLoginCheck" style="position: relative;">
							<div style="width:60%;float: left;">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-check"> </span>
									</div>
									<input type="text" class="form-control" maxlength="6" id="checkRandNumText"
										onKeyUp="value=value.replace(/[\W]/g,'')" placeholder="请输入6位验证码">
								</div>
							</div>
							<div style="width:35%;float: left;margin-left: 5%;">
								<input type="button" id="NumCheckSpan" style="letter-spacing:0.6em;"
									class="btn btn-info btn-block" value="" />
							</div>
							<div class="clearfix"></div>
							<div class="fromInfo text-info bg-info">设置一个密码保护安全</div>
						</div>
						<div class="form-group">
							<input type="button" id="LoginSub"
								class="btn btn-primary btn-block" value="登 录" />
						</div>
						<div class="form-group">
							<div style="width:49%;float: left;">qq直接登录</div>
							<div style="float: right;">忘记密码</div>
						</div>
					</form>
				</div>
				<!-- 用户注册 -->
				<div id="userSign">
					<form id="signFrom" role="form" method="post">
						<div class="form-group" style="position: relative;">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="f3">手机号</span>
								</div>
								<input type="text" class="form-control" id="signPhoneText" 
								name="user.phone" onKeyUp="CheckNum(this)"
								placeholder="请输入手机号" maxlength="11">
							</div>
							<div class="fromInfo text-info bg-info">请输入11位大陆手机号</div>
						</div>
						<div class="form-group" style="position: relative;">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="f3">用户名</span>
								</div>
								<input type="text" class="form-control" id="signUnameText"
									name="user.uname" placeholder="请输入4-10位用户名" maxlength="10">
							</div>
							<div class="fromInfo text-info bg-info">起一个用于交流的昵称</div>
						</div>

						<div class="form-group" style="position: relative;">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="f4">登录密码</span>
								</div>
								<input type="password" class="form-control" id="signUpwdText"
									name="user.upwd" onKeyUp="pwdIntension(this)" placeholder="请输入登录密码(6-16)" maxlength="16">
							</div>
							<div class="fromInfo text-info bg-info">设置一个密码保护安全</div>
						</div>
						<div class="form-group">
							<div class="progress progress-striped" style="margin: -1% 1.2% 0 25%;background-color:Gainsboro;">
								<div class="progress-bar progress-bar-danger" role="progressbar"
									 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
									 style="width: 0%;" id="pwdWeak">
								</div>
								<div class="progress-bar progress-bar-warning" role="progressbar"
									 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
									 style="width: 0%;" id="pwdMedium">
								</div>
								<div class="progress-bar progress-bar-success" role="progressbar"
									 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
									 style="width: 0%;" id="pwdStrong">
								</div>
							</div>
						</div>
						<div class="form-group" style="position: relative;">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="f4">确认密码</span>
								</div>
								<input type="password" class="form-control" id="signUpwdCheckText"
									placeholder="请再次输入密码" maxlength="16">
							</div>
							<div class="fromInfo text-info bg-info">再次输入密码确认一下</div>
						</div>
						<div class="form-group" style="position: relative;">
							<div style="width:60%;float: left;">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="f3">验证码</span>
									</div>
									<input type="text" class="form-control" maxlength="6" id="smsCheckNumText"
										onKeyUp="CheckNum(this)" placeholder="请输入6位验证码">
								</div>
							</div>
							<div style="width:35%;float: left;margin-left: 5%;">
								<input type="button" id="loginCheckSpan"
									class="btn btn-info btn-block" value="获取短信验证码" />
							</div>
							<div class="clearfix"></div>
							<div class="fromInfo text-info bg-info">输入获取到的验证码</div>
						</div>
						<div class="form-group">
							<input type="button" id="signSub" class="btn btn-primary btn-block" value="提 交 注 册" />
						</div>
						<div class="form-group">
							<div style="width:49%;float: left;">qq直接登录</div>
							<div style="width:49%;float: left;">
								2
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>