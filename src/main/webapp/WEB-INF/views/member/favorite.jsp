<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/" + "resources/";
%>
<c:set var="res" value="<%=basePath%>"/>
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
</head>                                        
<body>
<%@include file="../header.jsp"%>

<div id="about">
	<div class="mTags wrap">
		<a href="/ysCar/index">源深名车广场</a>><a href="/ysCar/order/myFavorite">我的收藏</a>
	</div>
	<div class="mebBox">
		<div class="meb-cont clearfix wrap">
			<div class="meb-nav left dInline">
				<ul class="clearfix">
					<ul class="clearfix">
						<li id="1" ><a href="#" onclick="window.location='${ctx}/ysCar/member/memberVip'">会员中心</a></li>
						<%--<li id="2" ><a href="#" onclick="window.location='${ctx}/ysCar/order/getOrder'">我的订单</a></li>--%>
						<li id="3"class="on"><a href="#" onclick="window.location='${ctx}/ysCar/order/myFavorite'">我的收藏</a></li>
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

				<!---我的车-->

				<div id="order" class="mr-detail">
					<div class="mr-tab clearfix">
						<a class="on">收藏的车型</a>
					</div>
					<div class="me-box">
						<%--收藏的车型--%>
							<div class="me-dl" style="display:block;">
								<c:if test="${myCar.myfav.size()}<=0">
									<div class="me-more">
										<a href="<%=path%>/ysCar/buyCar">
											<h3>您目前收藏的车型！</h3>
											<p>点击这里查看更多车型...</p>
										</a>
									</div>
								</c:if>
								<c:forEach var="myfav" items="${myCar.myfav}" end="${myCar.myfav.size()}" >
									<div class="me-one">
										<ul class="cs-list">
											<ul class="cs-list">
												<li class="clearfix" style="position: relative;">
													<span class="carImg left dInline">
														<a href="<%=path%>/ysCar/carInfo?id=${myfav.carId}" target="_blank">
															<div class="car_bg"> </div>
															<img src="${res}${myfav.pic_url}"  width="300"/>
														</a>
													</span>


													<div class="carTxt right dInline">
														<h2><a href="<%=path%>/ysCar/carInfo?id=${myfav.carId}" target="_blank">${myfav.brand}    ${myfav.carName}   ${myfav.confName}</a></h2>
														<p>
															<span>&nbsp;车龄&nbsp;：${myfav.carAge}</span>
															<span>&nbsp;行驶里程&nbsp;：${myfav.carMileage}</span>
															<span>&nbsp;上牌地&nbsp;：${myfav.licenseAddress}</span>
														</p>
														<div class="price clearfix" style="margin:5px 0;">
															<div class="left dInline pNum"><b>寄售价</b><br/>
																<span class="num nBlue">${myfav.price}</span><b> 万元</b>
															</div>
															<span class="num1 left" style="height:43px;padding-top:10px;">
															<span > &nbsp;&nbsp;<b>卖家联系方式：${myfav.phone}</b></span>  <br/>
														</span>


														</div>
														<div class="cs_ding clearfix" style="margin-top:20px" >
															<div class="cdLeft left dInline" style="width:auto;">

																<span><b>&nbsp;验车地址：${myfav.address} </b>  </span>
															</div>

															<a href="javascript:void(0);" style="width:50px;color:#4573af; float:right;"
															   onclick="cancelFav(${myfav.carId})"><b>取消收藏</b></a>
															<a href="#" style="width:50px; margin:auto 10px;color:#4573af; float:right;"
															   onclick="addOrder(${myfav.carId})"><b>立即购买</b>
															</a>

														</div>

													</div>
												</li>
											</ul>
										</ul>
									</div>

								</c:forEach>

							</div>
					</div>
				</div>


				<script type="text/javascript">
                    $('.mr-tab a').each(function(index){
                        $(this).click(function(){
                            $(this).addClass('on').siblings().removeClass('on');
                            $('.me-dl').eq(index).show().siblings().hide();
                        })
                    });
                    $('.cs_ding a').mouseover(function(){
                        this.style.color='blue';
                    })
                    $('.cs_ding a').mouseout(function(){
                        this.style.color='#4573af';
                    })

				</script>


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



<%--add by  funwenshen--%>
<script  type="text/javascript">

    /**
	 * 取消收藏
     * @param carId
     */
	function cancelFav(carId) {
		var url='<%=path%>/ysCar/order/cancelFav';
        var Data ={"carId":carId};
        $.ajax({
            type: "POST",
            url: url,
            contentType: "application/json",
            data:JSON.stringify(Data),
            success: function(data){
                if(data.status==1){
                    alert('取消成功！');
                    window.location.reload();
                }
            }
        });
    }


    function addOrder(carId) {


        var url='<%=path%>/ysCar/order/createOrder';
        var Data ={"carId":carId};
        $.ajax({
            type: "POST",
            url: url,
            contentType: "application/json",
            data:JSON.stringify(Data),
            success: function(data){
                if(data.status==0) {
                    alert("添加订单失败！")
                }else {
                    alert(JSON.stringify(data.desc))
                }
            }
        });
    }

</script>

</body>
</html>

