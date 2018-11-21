<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/" + "resources/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="<%=basePath%>"/>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>郑州高品质二手车专家_亿金汽车</title>
    <meta name="description" content="亿金汽车"/>
    <meta name="keywords" content="郑州二手车,河南二手车,郑州二手名车">
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/index.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/layout.css">
    <script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>



</head>
<body>
<%--<div id="header">--%>
    <%--<div class="top">--%>
        <%--<div class="wrap clearfix"><a href="#" class="logo left"><img src="<%=path%>/resources/images/cLogo.png"/></a>--%>
            <%--<div class="nav left dInline" id="headerMenu">--%>
                <%--<a class="on" href="<%=path%>/ysCar/index">首页</a>--%>
                <%--<a href="<%=path%>/ysCar/about">关于亿金</a>--%>
                <%--<a href="<%=path%>/ysCar/buyCar">我要买车</a>--%>
                <%--<a href="<%=path%>/ysCar/sellCar">我要卖车</a>--%>
                <%--&lt;%&ndash;<   href="<%=path%>/ysCar/member/memberVip"&ndash;%&gt;--%>
                <%--<a id="MemberMenuChange" class="b-login"  target="_self">会员中心</a>--%>
            <%--</div>--%>
            <%--<span class="right" id="rightMenuHtml">--%>
				<%--<a href="#" class="b-login" id="b-login">登录</a>|<a href="#" id="b-regist">注册</a>|&nbsp;&nbsp;&nbsp;&nbsp;<img--%>
                    <%--src="<%=path%>/resources/images/tel.png"/>--%>
                <%--</span>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<%@include file="header.jsp"%>

<style type="text/css">



    #banner .banShow a {
        display: block;
        width: 100%;
        height: 465px;
    }
</style>
<%--搜索背景--%>
<div id="banner">
    <div class="banShow clearfix" style="width:100%;">
        <a href="#" class="bDiv" style="background: url(<%=path%>/resources/images/y77.jpg) no-repeat center top;"></a>
        <a href="#" class="bDiv" style="background:url(<%=path%>/resources/images/1.jpg) no-repeat center top;"></a>
    </div>


    <%--搜索栏--%>
    <div class="searchBox">
        <div class="xnrj">
            <%--<img src="<%=path%>/resources/images/in1.png"/>--%>
            <form class="clearfix" action="<%=path%>/ysCar/buyCar" method="post" >
                <input type="text" name="keyword" placeholder="请输入您想要的品牌、车系或车辆编号搜索" class="left"/>
                <input type="submit" value="" class="right"/>
            </form>
        </div>
    </div>

</div>


<div id="main">
    <div class="main-a mDiv" id="box1">
        <div class="wrap">
            <div class="in-tit clearfix">
                <h1 class="left dInline"> 今日推荐 </h1>
                <!--<div class="end-time right dInline"><%=basePath%>
                            距离结束只剩下<b>20</b>小时<b>50</b>分<b>18</b>秒
                        </div>-->
            </div>
            <div class="inBox clearfix">
                <div class="thPic left dInline pve tBox"><a href="<%=path%>/ysCar/carInfo?id=${recommend.get(0).carId}" target="_blank"> <img
                        src="${res}${recommend.get(0).pic_url}" width="100%"  height="100%" class="imgVt"/>
                    <span class="icon icon_hd"></span></a>
                </div>
                <div class="tBox right pve dInline thPicRight">
                    <div class="thPic1 left dInline pve">
                        <ul class="clearfix">
                            <li class="pve">
                                <a href="<%=path%>/ysCar/carInfo?id=${recommend.get(1).carId}" target="_blank"> <span class="icon icon_th"></span>
                                <div class="car-pic"><img src="${res}${recommend.get(1).pic_url}" width="100%" height="100%"/></div>
                                <div class="price"><font>一口价</font> <span class="num nBlue">${recommend.get(1).price} </span> <font>&nbsp;&nbsp;万元</font> </div>
                                <p>${recommend.get(1).brand} &nbsp; ${recommend.get(1).carName} &nbsp; ${recommend.get(1).confName}</p>
                                </a>
                            </li>

                            <li class="pve">
                                <a href="<%=path%>/ysCar/carInfo?id=${recommend.get(2).carId}" target="_blank"> <span class="icon icon_th"></span>
                                    <div class="car-pic"><img src="${res}${recommend.get(2).pic_url}" width="100%" height="100%"/></div>
                                    <div class="price"><font>一口价</font> <span class="num nBlue">${recommend.get(2).price} </span> <font>&nbsp;&nbsp;万元</font> </div>
                                    <p>${recommend.get(2).brand} &nbsp; ${recommend.get(2).carName} &nbsp; ${recommend.get(2).confName}</p>
                                </a>
                            </li>

                            <li class="pve">
                                <a href="<%=path%>/ysCar/carInfo?id=${recommend.get(3).carId}" target="_blank"> <span class="icon icon_th"></span>
                                    <div class="car-pic"><img src="${res}${recommend.get(3).pic_url}" width="100%" height="100%"/></div>
                                    <div class="price"><font>一口价</font> <span class="num nBlue">${recommend.get(3).price} </span> <font>&nbsp;&nbsp;万元</font> </div>
                                    <p>${recommend.get(3).brand} &nbsp; ${recommend.get(3).carName} &nbsp; ${recommend.get(3).confName}</p>
                                </a>
                            </li>

                            <li class="pve">
                                <a href="<%=path%>/ysCar/carInfo?id=${recommend.get(4).carId}" target="_blank"> <span class="icon icon_th"></span>
                                    <div class="car-pic"><img src="${res}${recommend.get(4).pic_url}" width="100%" height="100%"/></div>
                                    <div class="price"><font>一口价</font> <span class="num nBlue">${recommend.get(4).price} </span> <font>&nbsp;&nbsp;万元</font> </div>
                                    <p>${recommend.get(4).brand} &nbsp; ${recommend.get(4).carName} &nbsp; ${recommend.get(4).confName}</p>
                                </a>
                            </li>

                        </ul>
                    </div>
                    <div class="pve right dInline hdPic" style="margin-bottom: 4px"> <a href="<%=path%>/ysCar/carInfo?id=${recommend.get(5).carId}" target="_blank">
                    <img src="${res}${recommend.get(5).pic_url}" width="100%"  height="230px" class="imgVt"/> <span
                        class="icon icon_hd"></span></a>
                    </div>
                    <div class="pve right dInline hdPic" style="margin-top: 4px"> <a href="<%=path%>/ysCar/carInfo?id=${recommend.get(5).carId}" target="_blank">
                        <img src="${res}${recommend.get(5).pic_url}" width="100%"  height="230px" class="imgVt"/> <span
                            class="icon icon_hd"></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--<div class="mDiv" id="box2">--%>
        <%--<div class="wrap">--%>
            <%--<div class="in-tit clearfix">--%>
                <%--<h1 class="left dInline"> 最新到店 </h1>--%>
            <%--</div>--%>
            <%--<div class="inBox clearfix">--%>
                <%--<div class="tBox left pve dInline thPicRight">--%>
                    <%--<div class="thPic1 left dInline pve">--%>
                        <%--<ul class="clearfix">--%>
                            <%--<li class="pve"><a href="#" target="_blank"> <span class="icon icon_npro"></span>--%>
                                <%--<div class="car-pic"><img src="<%=path%>/resources/images/5688cddeae512.png"/></div>--%>
                                <%--<div class="price"><font>一口价</font> <span class="num nBlue">28.99 </span> <font>&nbsp;&nbsp;万元</font>--%>
                                <%--</div>--%>
                                <%--<p>宝马3系 2014 款 2.0T 自动 320Li豪华设计套装</p>--%>
                            <%--</a></li>--%>

                            <%--<li class="pve"><a href="#" target="_blank"> <span class="icon icon_npro"></span>--%>
                                <%--<div class="car-pic"><img src="<%=path%>/resources/images/5688cddeae512.png"/></div>--%>
                                <%--<div class="price"><font>一口价</font> <span class="num nBlue">28.99 </span> <font>&nbsp;&nbsp;万元</font>--%>
                                <%--</div>--%>
                                <%--<p>宝马3系 2014 款 2.0T 自动 320Li豪华设计套装</p>--%>
                            <%--</a></li>--%>

                            <%--<li class="pve"><a href="#" target="_blank"> <span class="icon icon_npro"></span>--%>
                                <%--<div class="car-pic"><img src="<%=path%>/resources/images/5688cddeae512.png"/></div>--%>
                                <%--<div class="price"><font>一口价</font> <span class="num nBlue">28.99 </span> <font>&nbsp;&nbsp;万元</font>--%>
                                <%--</div>--%>
                                <%--<p>宝马3系 2014 款 2.0T 自动 320Li豪华设计套装</p>--%>
                            <%--</a></li>--%>

                            <%--<li class="pve liHd"><a href="Cars/index/channel/2/id/949.html" target="_blank"> <img--%>
                                    <%--src="<%=path%>/resources/images/56c56f308b591.jpg" class="imgVt"/> <span--%>
                                    <%--class="icon icon_hd"></span></a></li>--%>

                            <%--<li class="pve"><a href="Cars/index/channel/2/id/1092.html" target="_blank"> <span--%>
                                    <%--class="icon icon_npro"></span>--%>
                                <%--<div class="car-pic"><img src="<%=path%>/resources/images/5688cddeae512.png"/></div>--%>
                                <%--<div class="price"><font>一口价</font> <span class="num nBlue">34.8 </span> <font>&nbsp;&nbsp;万元</font>--%>
                                <%--</div>--%>
                                <%--<p>凯迪拉克SRX(进口) 2014 款 3.0L 自动 精英型</p>--%>
                            <%--</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="thPic right dInline pve tBox"><a href="pp2_/ord/sta.html" target="_blank"> <img--%>
                        <%--src="<%=path%>/resources/images/55ed9ec02ac8d.jpg" class="imgVt"/> <span--%>
                        <%--class="icon icon_hd"></span></a></div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>


</div>


<!--底部的开始-->
<%@include file="footer.jsp" %>
<!--底部的结束-->

<%--<!--右侧内容的开始-->--%>
<%--<%@include file="right.jsp" %>--%>
<%--<!--右侧内容的结束-->--%>

<!--会员登录和注册弹出框开始-->
<%@include file="popLoginBox.jsp"%>
<!--会员登录和注册弹出框结束-->


<script type="text/javascript" src="<%=path%>/resources/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/index.js"></script>
<!--右侧滑动-->
<script type="text/javascript" src="<%=path%>/resources/js/miniBar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/lg_reg.js"></script>



</body>
</html>