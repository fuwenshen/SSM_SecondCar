<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/" + "resources/";
%>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>源深二手车_价格_图片</title>
	<meta name="description" content="源深汽车"/>
	<meta name="keywords" content="湖南二手车,长沙二手车,科大二手名车">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/layout.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/pro.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/hurst.css">
	<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>
	<!--[if IE 6]>
	<script type="text/javascript" src="<%=path%>/resources/js/DD_belatedPNG.js"></script>
	<script>
		DD_belatedPNG.fix('*');
	</script>
	<![endif]-->
</head>
<body>
<%@include file="../header.jsp"%>

<div id="about">
	<div class="mTags wrap">
		<a href="/ysCar/index">源深名车广场</a>><a href="/ysCar/member/manager">账号管理</a>
	</div>
	<div class="mebBox">
		<div class="meb-cont clearfix wrap">
			<div class="meb-nav left dInline">
				<ul class="clearfix">
					<ul class="clearfix">
						<li id="1" ><a href="#" onclick="window.location='${ctx}/ysCar/member/memberVip'">会员中心</a></li>
						<%--<li id="2" ><a href="#" onclick="window.location='${ctx}/ysCar/order/getOrder'">我的订单</a></li>--%>
						<li id="3"><a href="#" onclick="window.location='${ctx}/ysCar/order/myFavorite'">我的收藏</a></li>
						<li><a href="#" onclick="window.location='${ctx}/ysCar/order/purchaser'">作为买方</a></li>
						<li ><a href="#" onclick="window.location='${ctx}/ysCar/order/seller'">作为卖方</a></li>
						<li id="4" class="on"><a href="#" onclick="window.location='${ctx}/ysCar/member/manager'">账户管理</a></li>
					</ul>
				</ul>
			</div>
			<div class="meb-right right dInline">
				<!--  头部个人信息-->
				<div class="mr-top">
					<div class="mr-top-div clearfix">
					<span class="left">
						<img src="<%=path%>/resources/images/photo.png"/>
					</span>
						<div class="mr-infor left dInline">
							<h2>您好，尊敬的会员 <b>${userInfo.username}</b></h2>
							<p>
								手机：${userInfo.phone} 邮箱：${userInfo.email} | [ <a href="${ctx}/ysCar/member/manager">管理账户信息</a>  ]
							</p>
						</div>
					</div>
				</div>
				<div class="mr-detail">
					<div class="mr-tab clearfix">
						<a class="on">个人资料管理 </a>
						<a>修改密码</a>
					</div>
					<div class="me-box me-box1">
						<div class="me-dl" style="display:block;">
							<div class="me-one">
								<div class="accForm" >
									<form action="" enctype="multipart/form-data" name="editM" method="post"
										  onsubmit="return checkpost();">
										<div class="afl clearfix" >
											<label class="left">
												用户名
											</label>
											<div class="af-r left dInline">
												<input type="text" class="ar-txt" id="username" name="username"
													   value="${userInfo.username}"disabled="disabled"/>
											</div>
										</div>
										<div class="afl clearfix">
											<label class="left">
												邮箱
											</label>
											<div class="af-r left dInline">
												<input type="text" class="ar-txt" name="email"
													   value="${userInfo.email}" disabled="disabled"/>
											</div>
										</div>

										<div class="afl clearfix">
											<label class="left">
												手机号码
											</label>
											<div class="af-r left dInline">
												<input type="text" id="phone" class="ar-txt" name="phone" disabled="disabled"
													   value="${userInfo.phone}" />
											</div>
										</div>
										<div class="afl clearfix">
											<label class="left">
												真实姓名
											</label>
											<div class="af-r left dInline">
												<input type="text"  id="realName" class="ar-txt" name="username" disabled="disabled"
													   value="${userInfo.realName}"/>
											</div>
										</div>
										<div class="afl clearfix">
											<label class="left">
												年龄
											</label>
											<div class="af-r left dInline">
												<input type="text"  id="age" class="ar-txt" name="age" disabled="disabled"
													   value="${userInfo.age}"/>
											</div>
										</div>

										<%--<div class="afl clearfix">--%>
											<%--<label class="left">--%>
												<%--性别--%>
											<%--</label>--%>
											<%--<div class="af-r left dInline">--%>
												<%--<span>--%>
													<%--<input type="radio" name="gender" value="男"> 男--%>
												<%--</span>--%>
												<%--<span>--%>
													<%--<input type="radio" name="gender" checked="" value="女"> 女--%>
												<%--</span></div>--%>
										<%--</div>--%>

										<div class="afl clearfix">
											<label class="left">
												注册时间
											</label>
											<div class="af-r left dInline">
												<input type="text" class="ar-txt" name="username" disabled="disabled"
													   value="${userInfo.registTime}" />
											</div>
										</div>
										<div class="afl clearfix">
											<label class="left">
											</label>

											<fieldset>
												<div class="form-group">
													<div class="col-sm-4 col-sm-offset-2">
														<button type="button" id="edit" style="display:block" class="btn btn-primary">编辑
														</button>
														<button type="button" id="cancel" style="display:none" class="btn btn-default">取消
														</button>
														<button type="button" id="save" style="display:none" class="btn btn-primary">保存修改
														</button>
													</div>
												</div>
											</fieldset>
										<%----%>
											<%--<div class="af-r left dInline">--%>
												<%--<input type="submit" value="提 交" class="ar-btn">--%>
											<%--</div>--%>
										</div>
									</form>
								</div>
							</div>
						</div>


						<div class="me-dl" style="display:none;" >
							<div class="me-one">
								<div class="accForm">
									<form action="" enctype="multipart/form-data" name="editP" method="post"
										  onsubmit="return checkPasspost();">
										<div class="afl clearfix">
											<label class="left">
												当前密码
											</label>
											<div class="af-r left dInline">
												<input type="password" class="ar-txt" name="password"
													   placeholder="请输入当前密码" value=""/>
											</div>
										</div>
										<div class="afl clearfix">
											<label class="left">
												新密码
											</label>
											<div class="af-r left dInline">
												<input type="password" class="ar-txt" name="password1"
													   placeholder="请输入新密码" value=""/>
											</div>
										</div>
										<div class="afl clearfix">
											<label class="left">
												确认新密码
											</label>
											<div class="af-r left dInline">
												<input type="password" class="ar-txt" name="password2"
													   placeholder="请确认输入的新密码" value=""/>
											</div>
										</div>
										<div class="afl clearfix">
											<label class="left">
											</label>
											<div class="af-r left dInline">
												<input type="submit" value="提 交" class="ar-btn">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--footer部分开始-->
<%@include file="../footer.jsp"%>

<%--<!--右侧内容的开始-->--%>
<%--<%@include file="../right.jsp"%>--%>
<%--<!--右侧内容的结束-->--%>

<!--会员登录与注册开始-->
<%@include file="../popLoginBox.jsp"%>
<!--会员登录与注册开始-->


<script type="text/javascript" src="js/miniBar.js"></script>
<script type="text/javascript" src="js/lg_reg.js"></script>
<script type="text/javascript">
$(function(){
	$('.mr-tab a').each(function(index){
		$(this).click(function(){
			$(this).addClass('on').siblings().removeClass('on');
			$('.me-dl').eq(index).show().siblings().hide();
		})
	});
})
</script>
<script>


    $("#edit").click(function () {
            $("#edit").attr("style", "display:none");
            $("#save").attr("style", "display:block");
            $("#cancel").attr("style", "display:block");

            $('#realName').attr("disabled",false);
            $("#username").attr("disabled",false);
//            $("#sex").attr("disabled",false);
            $("#age").attr("disabled",false);
            $("#phone").attr("disabled",false);

    });

    $("#save").click(function () {
            $("#edit").attr("style", "display:block");
            $("#save").attr("style", "display:none");
            $("#cancel").attr("style", "display:none");
            var username= $("#username").val();var name = $("#realName").val();
            var age = $("#age").val();    var phone = $("#phone").val();
            var Data={"id":${userInfo.id},"username":username, "name":name ,
				"age":age ,"phone":phone}
        	var url='<%=path%>/ysCar/member/update';
        $.ajax({
            type: "POST",
            url: url,
            contentType: "application/json",
            data:JSON.stringify(Data),
            success: function(data){
                if(data.status==1) {
                    alert("修改成功")
                    location.reload();
                }else {
                    alert("修改失败！")
                }
            }
        });
    });

    $("#cancel").click(function () {

            $("#edit").attr("style", "display:block");
            $("#save").attr("style", "display:none");
            $("#cancel").attr("style", "display:none");

        $('#realName').attr("disabled",true);
        $("#username").attr("disabled",true);
//            $("#sex").attr("disabled",true);
        $("#age").attr("disabled",true);
        $("#phone").attr("disabled",true);
        return false;
    });


function checkpost(){
	var realname=editM.realname.value;//手机号
	var gender=editM.gender.value;//验证码
	var email=editM.email.value;//姓名
	var Yemail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; //邮箱验证
	var url='/Member/manage/channel/7/list/15';
	if(realname.length>10){
		alert("姓名要不得大于10个字符");
		editM.realname.focus();
		return false;
	}
	if(!Yemail.exec(email)&&email!=''){
		alert("邮箱格式不正确");
		editM.email.focus();
		return false;
	}
	$.ajax({
		 type: "POST",
		 url: url,
		 data: {realname:realname, gender:gender,email:email},
		 dataType: "json",
		 success: function(data){
			 alert(data.msg);
		}
	 });
	 return false;
}
//修改密码
function checkPasspost(){
	var password=editP.password.value;//性别
	var password1=editP.password1.value;//密码
	var password2=editP.password2.value;//密码
	var Ypass=/\S{6,}/;//密码验证
    var Data={"id":${userInfo.id},"oldPassword":password, "newPassword":password1};
    var url='<%=path%>/ysCar/member/updatePassword';
	if(!password1){
		alert("请输入新密码");
		editP.password1.focus();
		return false;
	}
	if(!password2){
		alert("请重复输入新密码");
		editP.password2.focus();
		return false;
	}
	if(password1!=password2){
		alert("两次新密码输入不同");
		editP.password1.focus();
		return false;
	}
	if(!Ypass.exec(password1)){
		alert("密码格式不正确，必须以字母开头的6-16 字母，数字");
		editP.password1.focus();
		return false;
	}
	$.ajax({
		 type: "POST",
		 url: url,
		 data:JSON.stringify(Data),
         contentType: "application/json",
		 success: function(data){
             if(data.status==1) {
                 alert("修改成功,请使用新密码重新登录！")
                 window.location.href="<%=path%>/ysCar/member/logout";
             }else if(data.status==4) {
                 alert("原密码错误！修改失败");
             }else {
                 alert("修改失败");
			 }
		}
	 });
	 return false;
}
</script>




</body>
</html>
