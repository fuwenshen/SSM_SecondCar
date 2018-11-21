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
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/layout.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/pro.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/hurst.css">
	<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
        //add fws
        window.onload=function(){


             alert("fuwenshen");
             console.log("fuwenshen")


        }

	</script>
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
		<a href="/ysCar/index">源深名车广场</a>><a href="/ysCar/member/memberVip">会员中心</a>
	</div>
	<div class="mebBox">
		<div class="meb-cont clearfix wrap">
			<div class="meb-nav left dInline">
				<ul class="clearfix">
					<ul class="clearfix">
						<li id="1" class="on"><a href="#" onclick="window.location='${ctx}/ysCar/member/memberVip'">会员中心</a></li>
						<%--<li id="2" ><a href="#" onclick="window.location='${ctx}/ysCar/order/getOrder'">我的订单</a></li>--%>
						<li id="3"><a href="#" onclick="window.location='${ctx}/ysCar/order/myFavorite'">我的收藏</a></li>
						<li><a href="#" onclick="window.location='${ctx}/ysCar/order/purchaser'">作为买方</a></li>
						<li ><a href="#" onclick="window.location='${ctx}/ysCar/order/seller'">作为卖方</a></li>
						<li id="4"><a href="#" onclick="window.location='${ctx}/ysCar/member/manager'">账户管理</a></li>
					</ul>
				</ul>
			</div>
			<div class="meb-right right dInline">
				<div class="mr-top">
					<div class="mr-top-div clearfix">
					<span class="left">
						<img src="<%=path%>/resources/images/photo.png"/>
					</span>
						<div class="mr-infor left dInline">
							<h2>您好，尊敬的会员 <b>${userInfo.username}</b></h2>
							<p>
								手机：${userInfo.phone} 邮箱：${userInfo.email} | [ <a href="${ctx}/ysCar/member/manager">管理账户信息</a> ]
							</p>
						</div>
					</div>
				</div>

				<%-- 详情--%>

				<!---会员中心-->
				<div id="center" class="mr-detail">
					<div class="me-box">
						<div class="mx-a">
							<ul class="clearfix">
								<li>
									<img src="<%=path%>/resources/images/hu1.png"/>
									<span>您目前有 <a href="${ctx}/ysCar/order/purchaser"><b>${count.orderCount}</b></a> 个未完成订单</span>
								</li>
								<li>
									<img src="<%=path%>/resources/images/hu2.png"/>
									<span>您共有 <a href="${ctx}/ysCar/order/myFavorite"><b>${count.favCount}</b></a> 个收藏的车型</span>
								</li>
							</ul>
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

<script type="text/javascript" src="<%=path%>/resources/js/miniBar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/lg_reg.js"></script>

<script type="text/javascript">
	var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
	document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Faa70c6792578150b40ad413464080efa' type='text/javascript'%3E%3C/script%3E"))
</script>


<script  type="text/javascript">

	function chosePage( chosePage) {
            $("#1").removeClass("on");
            $("#2").removeClass("on");
            $("#3").removeClass("on");
            $("#4").removeClass("on");
        	$("#").removeClass("on");
        	switch (chosePage){
				case 1:
                    $("#1").addClass("on");
                    break;
                case 2:
                    $("#2").addClass("on");
                    break;
                case 3:
                    $("#3").addClass("on");
                    break;
                default :
                    $("#4").addClass("on");

			}
    }

</script>
</body>
</html>

