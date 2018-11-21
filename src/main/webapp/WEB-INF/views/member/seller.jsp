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
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/bootstrap-3.3.7-dist/css/bootstrap.css">
	<style> @import "../../../resources/css/base.css";</style>
	<%--<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/base.css">--%>
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/layout.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/pro.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/hurst.css">
	<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>

	<style type="text/css">
		.option{background:#0f3269;border-color:#0f3269;color:#fff;}

	</style>

</head>
<body>
<%@include file="../header.jsp"%>

<div id="about">
	<div class="mTags wrap">
		<a href="/ysCar/index">源深名车广场</a>><a href="/ysCar/order/seller">我是卖家</a>
	</div>
	<div class="mebBox">
		<div class="meb-cont clearfix wrap">
			<div class="meb-nav left dInline">
				<ul class="clearfix">
					<li id="1" ><a href="#" onclick="window.location='${ctx}/ysCar/member/memberVip'">会员中心</a></li>
					<%--<li id="2" ><a href="#" onclick="window.location='${ctx}/ysCar/order/getOrder'">我的订单</a></li>--%>
					<li id="3"><a href="#" onclick="window.location='${ctx}/ysCar/order/myFavorite'">我的收藏</a></li>
					<li><a href="#" onclick="window.location='${ctx}/ysCar/order/purchaser'">作为买方</a></li>
					<li class="on"><a href="#" onclick="window.location='${ctx}/ysCar/order/seller'">作为卖方</a></li>
					<li id="4"><a href="#" onclick="window.location='${ctx}/ysCar/member/manager'">账户管理</a></li>
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
								手机：${userInfo.phone} 邮箱：${userInfo.email} | [ <a href="${ctx}/ysCar/member/manager">管理账户信息</a>  ]
							</p>
						</div>
					</div>
				</div>

				<!---订单-->

				<div id="order" class="mr-detail">
					<div class="mr-tab clearfix">
						<a class="on">已出售的车辆信息</a>
						<a>订单确认</a>
						<a>发布的车辆</a>
					</div>
					<div class="me-box">

						<%--已出售的车辆信息--%>
						<div class="me-dl" style="display:block;">

							<!-- START table-responsive-->
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
									<tr class="table-th">
										<th>汽车编号</th>
										<th >配置信息</th>
										<th>售价</th>
										<th>车龄</th>
										<th>买家id</th>
										<th>买家联系方式</th>
										<th >操作</th>
									</tr>
									<thead>
									<tbody  class="table-tbody">
									<c:forEach items="${selledList}" var="item">
										<tr>
											<td>${item.carInfo.carId}</td>
											<td>${item.carInfo.confName}</td>
											<td>${item.carInfo.price }</td>
											<td>${item.carInfo.carAge}</td>
											<td>${item.user.uid}</td>
											<td>${item.user.uphone}</td>
											<td></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- END table-responsive-->
						</div>

						<%--订单确认--%>
						<div class="me-dl" style="display:none;" >

							<div class="table-responsive">
								<table id="table-id" class="table table-bordered table-hover">
									<thead>
									<tr class="table-th">
										<th>订单编号</th>
										<th>汽车编号</th>
										<th>基本信息</th>
										<th>售价</th>
										<th>预付定金</th>
										<th>买家id</th>
										<th>买家联系方式</th>
										<th>验车地址</th>
										<th>订单发布时间</th>
										<th>状态</th>
										<th  class="option">操作</th>
									</tr>
									<thead>
									<tbody id= "table-tbody" class="table-tbody">
									<c:forEach items="${checkOrder}" var="item">
										<tr>
											<td>${item.order.orderId}</td>
											<td>${item.order.carId}</td>
											<td><a  class="option" href="<%=path%>/ysCar/carInfo?id=${item.order.carId}">${item.order.baseinfo }</a></td>
											<td>${item.order.carPrice}</td>
											<td>${item.order.deposit}</td>
											<td>${item.order.buyerId}</td>
											<td>${item.phone}</td>
											<td>${item.order.address}</td>
											<td><fmt:formatDate value="${item.order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											<td>${item.order.orderStatus}</td>
											<td  class="option"><a href="javascript:void(0);" onclick="checkOrder(${item.order.orderId})" id="check">确认</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>

							<c:forEach var="order" items="${finshOrder}" end="${finshOrder.size()}" >
								<div class="me-one">
									<ul class="cs-list">
										<ul class="cs-list">
											<li class="clearfix" style="position: relative;">
												<span class="carImg left dInline">
													<a href="<%=path%>/ysCar/carInfo?id=${carInfo.carId}" target="_blank">
													    <div class="car_bg"> </div>
														<img src="${res}${order.carInfo.pic_url}"  width="300"/>
													</a>
												</span>

												<div class="carTxt right dInline">
													<h2><a href="<%=path%>/ysCar/carInfo?id=${order.carInfo.carId}" target="_blank">${carInfo.brand}    ${carInfo.carName}   ${carInfo.confName}</a></h2>
													<p> <span>车龄：${order.carInfo.carAge}</span>
														<span>行驶里程：${order.carInfo.carMileage}</span>
														<span>上牌地：${order.carInfo.licenseAddress}</span>
													</p>
													<div class="price clearfix" style="margin:5px 0;">
														<div class="left dInline pNum"><b>寄售价</b><br/>
															<span class="num nBlue">${order.order.carPrice}</span><b> 万元</b>
														</div>
														<span class="num1 left" style="height:43px;padding-top:10px;">
															<span> &nbsp;订单编号：<b>${order.order.orderId}</b> </span>
															<span> &nbsp;&nbsp;卖家联系方式：<b>${order.phone}</b></span>  <br/>
															<span> &nbsp;订单创建：<fmt:formatDate value="${order.order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
														</span>


													</div>
													<div class="cs_ding clearfix" style="margin-top:20px" >
														<div class="cdLeft left dInline" style="width:auto;">
															<span> 定金：<b>${order.order.deposit}  万元</b>  </span>
															<span>&nbsp;验车地址：<b>${order.order.address} </b>  </span>
															<span>&nbsp;订单状态: <b>${order.order.orderStatus}</b></span>
														</div>

														<%--<a href="javascript:void(0);" style="width:50px;color:#4573af; float:right;"--%>
														   <%--onclick="delOrder('delete','88')">取消订单</a>--%>
														<%--<a href="#" style="width:50px; margin:auto 10px;color:#4573af; float:right;">支付全款</a>--%>
														<%--<a href="#" style="width:50px;color:#4573af; float:right;">补交定金</a>--%>

												</div>

												</div>
											</li>
										</ul>
									</ul>
								</div>
							</c:forEach>
						</div>

						<%--发布的车辆--%>
						<div class="me-dl" style="display:none;" >
							<!-- START table-responsive-->
							<div class="table-responsive">
								<table  class="table table-bordered table-hover">
									<thead>
									<tr class="table-th">
										<th>汽车编号</th>
										<th>名称</th>
										<th>配置名</th>
										<th>变速箱</th>
										<th>发动机</th>
										<th>车身结构</th>
										<th>车龄</th>
										<th>行驶里程</th>
										<th class="option">操作</th>
									</tr>
									<thead>
									<tbody id=  class="table-tbody">
									<c:forEach items="${sellingList}" var="item">
										<tr>
											<td>${item.carId}</td>
											<td>${item.carName}</td>
											<td ><a class="option" href="<%=path%>/ysCar/carInfo?id=${item.carId}">${item.confName}</a></td>
											<td>${item.gearbox}</td>
											<td>${item.engine}</td>
											<td>${item.bodyStructure}</td>
											<td>${item.carAge}</td>
											<td>${item.carMileage}</td>
											<td class="option"><a href="javascript:void(0);" onclick="cancelSell(${item.carId})" id="cancel">撤销</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- END table-responsive-->
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

                    function delOrder(act,meb){
                        var url='/Member/delOrder/channel/7.html';
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: {act:act,meb:meb},
                            success: function(data){
                                if(data.result){
                                    alert('已取消该订单');
                                    window.location.reload();
                                }else{
                                    alert('订单取消失败');
                                }
                            }
                        });
                        return false;
                    }
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

</body>


<script type="text/javascript">
    /**
	 * 卖家订单确认
     */
	function checkOrder(orderId) {
        var url='<%=path%>/ysCar/order/confirmOrder?orderId='+orderId;
        var Data ={"orderId":orderId};
        $.ajax({
            type: "POST",
            url: url,
            contentType: "application/json",
            data:"",
            success: function(data){
                if(data.status==0) {
                    alert("确认订单失败！")
                }else {
                    alert("确认成功")
                    location.reload();
                }
            }
        });
    }

    function cancelSell(carId) {
        var url='<%=path%>/ysCar/order/cancelSell?carId='+carId;
        $.ajax({
            type: "POST",
            url: url,
            contentType: "application/json",
            data:"",
            success: function(data){
                if(data.status==1) {
                    alert("撤销成功")
                    location.reload();
                }else {
                    alert("撤销失败！")
                }
            }
        });
    }
</script>
</html>

