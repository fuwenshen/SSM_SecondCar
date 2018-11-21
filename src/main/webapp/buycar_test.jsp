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
    <title>源深二手车_价格_图片</title>
    <meta name="description" content="源深汽车"/>
    <meta name="keywords" content="湖南二手车,长沙二手车,科大二手名车">
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/layout.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/pro.css">
    <script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>
    <!--[if IE 6]>
    <script type="text/javascript" src="<%=path%>/resources/js/DD_belatedPNG.js"></script>
    <script>
        DD_belatedPNG.fix('*');
    </script>
    <![endif]-->


</head>

<body>

<%--头部--%>
<%@include file="WEB-INF/views/header.jsp" %>


<%--页面底端--%>
<%@include file="WEB-INF/views/footer.jsp" %>


<%--弹出盒子--%>
<%@include file="WEB-INF/views/popLoginBox.jsp"%>

<!--右侧搜索加入对比开始-->
<script type="text/javascript" src="<%=path%>/resources/js/miniBar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/lg_reg.js"></script>

<%--<script type="text/javascript" src="<%=path%>/resources/js/search_car.js"></script>--%>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.SuperSlide.2.1.1.js"></script>



<%--%--<link rel="stylesheet" type="text/css" href="<%=path%>/resources/bootstrap/css/bootstrap-datetimepicker.css">&ndash;%&gt;--%>
<%--&lt;%&ndash;<link rel="stylesheet" type="text/css" href="<%=path%>/resources/bootstrap/css/bootstrap.min.css">&ndash;%&gt;--%>
<%--<script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>--%>

<!--右侧搜索加入对比结束-->
<!--右侧滚动开始-->
<%--<script type="text/javascript">--%>
    <%--$(function () {--%>
        <%--$(window).scroll(function () {--%>
        <%--})--%>
    <%--})--%>
    <%--jQuery(".txtMarquee-top").slide({--%>
        <%--mainCell: ".bd ul",--%>
        <%--autoPlay: true,--%>
        <%--effect: "topMarquee",--%>
        <%--vis: 5,--%>
        <%--interTime: 50,--%>
        <%--trigger: "click"--%>
    <%--});--%>
<%--</script>--%>
<!--右侧滚动结束-->


<%--<script type="text/javascript">--%>
<%--//    add by fuwneshen--%>

    <%--/**--%>
    <%--* 添加订单--%>
    <%--*/--%>
    <%--&lt;%&ndash;function addOrder(carId) {&ndash;%&gt;--%>

        <%--&lt;%&ndash;var user='${username}';&ndash;%&gt;--%>

        <%--&lt;%&ndash;//如果没有登录，进入登陆界面&ndash;%&gt;--%>
        <%--&lt;%&ndash;if(user){&ndash;%&gt;--%>
            <%--&lt;%&ndash;//&ndash;%&gt;--%>
            <%--&lt;%&ndash;console.log("addOrder !")&ndash;%&gt;--%>

            <%--&lt;%&ndash;var Data ={"carId":carId};&ndash;%&gt;--%>
            <%--&lt;%&ndash;$.ajax({&ndash;%&gt;--%>
                <%--&lt;%&ndash;type: "POST",&ndash;%&gt;--%>
                <%--&lt;%&ndash;url: "<%=path%>/ysCar/order/createOrder",&ndash;%&gt;--%>
                <%--&lt;%&ndash;contentType: "application/json",&ndash;%&gt;--%>
                <%--&lt;%&ndash;data:JSON.stringify(Data),&ndash;%&gt;--%>
                <%--&lt;%&ndash;success: function(data){&ndash;%&gt;--%>
                    <%--&lt;%&ndash;if(data.status==0) {&ndash;%&gt;--%>
                        <%--&lt;%&ndash;alert("添加订单失败！")&ndash;%&gt;--%>
                    <%--&lt;%&ndash;}else {&ndash;%&gt;--%>
                        <%--&lt;%&ndash;alert(JSON.stringify(data.desc))&ndash;%&gt;--%>
                    <%--&lt;%&ndash;}&ndash;%&gt;--%>

                <%--&lt;%&ndash;}&ndash;%&gt;--%>
            <%--&lt;%&ndash;});&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;window.location.href="<%=path%>/ysCar/order/createOrder";&ndash;%&gt;&ndash;%&gt;--%>
        <%--&lt;%&ndash;}else {&ndash;%&gt;--%>

            <%--&lt;%&ndash;$('#popBox').fadeIn();&ndash;%&gt;--%>
            <%--&lt;%&ndash;$('.p-tab a:first').addClass('on').siblings().removeClass('on');&ndash;%&gt;--%>
            <%--&lt;%&ndash;$('.p-dl:first').show().siblings().hide();&ndash;%&gt;--%>

        <%--&lt;%&ndash;}&ndash;%&gt;--%>



    <%--&lt;%&ndash;}&ndash;%&gt;--%>

<%--/**--%>
 <%--* 添加到收藏--%>
 <%--* @param chose--%>
 <%--*/--%>
 <%--function addFavorte(carId){--%>

    <%--var user='${username}';--%>
    <%--//如果没有登录，进入登陆界面--%>
    <%--if(user){--%>
        <%--var Data ={"carId":carId};--%>
        <%--$.ajax({--%>
            <%--type: "POST",--%>
            <%--url: "<%=path%>/ysCar/order/createFav",--%>
            <%--contentType: "application/json",--%>
            <%--data:JSON.stringify(Data),--%>
            <%--success: function(data){--%>
                <%--if(data.status==0) {--%>
                    <%--alert("添加到收藏夹失败！")--%>
                <%--}else {--%>
                    <%--alert(JSON.stringify(data.desc))--%>
                <%--}--%>

            <%--}--%>
        <%--});--%>
    <%--}else {--%>
        <%--alert("登录")--%>
        <%--$('#popBox').fadeIn();--%>
        <%--$('.p-tab a:first').addClass('on').siblings().removeClass('on');--%>
        <%--$('.p-dl:first').show().siblings().hide();--%>

    <%--}--%>

<%--}--%>

<%--// 汽车价格--%>
<%--function chosePrice(chose) {--%>
        <%--switch (chose){--%>
            <%--case 1:--%>
                <%--$("#price_L").val(0)--%>
                <%--$("#price_R").val(5);--%>
                <%--break;--%>
            <%--case 2:--%>
                <%--$("#price_L").val(5)--%>
                <%--$("#price_R").val(10);--%>
                <%--break;--%>
            <%--case 3:--%>
                <%--$("#price_L").val(10)--%>
                <%--$("#price_R").val(30);--%>
                <%--break;--%>
            <%--case 4:--%>
                <%--$("#price_L").val(30)--%>
                <%--$("#price_R").val(100);--%>
                <%--break;--%>
            <%--default :--%>
                <%--$("#price_L").val(100)--%>
                <%--$("#price_R").val(1000);--%>
        <%--}--%>
            <%--//  提交--%>
             <%--$("#condition").submit();--%>
    <%--}--%>

    <%--// 汽车level--%>
    <%--function choseLevel(level) {--%>
        <%--switch (level){--%>
            <%--case 1:--%>
                <%--$("#carType").val("微型车")--%>
                <%--break;--%>
            <%--case 2:--%>
                <%--$("#carType").val("紧凑型车")--%>
                <%--break;--%>
            <%--case 3:--%>
                <%--$("#carType").val("豪华车")--%>
                <%--break;--%>
            <%--case 4:--%>
                <%--$("#carType").val("SUV")--%>
                <%--break;--%>
            <%--case 5:--%>
                <%--$("#carType").val("跑车")--%>
                <%--break;--%>
            <%--default :--%>
                <%--$("#carType").val("MPV")--%>
        <%--}--%>
        <%--//  提交--%>
        <%--$("#condition").submit();--%>
    <%--}--%>

    <%--// 车年龄--%>
    <%--function choseCarAge(age) {--%>
        <%--switch (age){--%>
            <%--case 1:--%>
                <%--$("#cheling_L").val("0")--%>
                <%--$("#cheling_R").val("1")--%>
                <%--break;--%>
            <%--case 2:--%>
                <%--$("#cheling_L").val("0")--%>
                <%--$("#cheling_R").val("2")--%>
                <%--break;--%>
            <%--case 3:--%>
                <%--$("#cheling_L").val("0")--%>
                <%--$("#cheling_R").val("3")--%>
                <%--break;--%>
            <%--case 4:--%>
                <%--$("#cheling_L").val("3")--%>
                <%--$("#cheling_R").val("5")--%>
                <%--break;--%>
            <%--default :--%>
                <%--$("#cheling_L").val("5")--%>
                <%--$("#cheling_R").val("20")--%>
        <%--}--%>
        <%--//  提交--%>
        <%--$("#condition").submit();--%>
    <%--}--%>

    <%--// 车里程--%>
    <%--function choseCarMile(mile) {--%>
        <%--switch (mile){--%>
            <%--case 1:--%>
                <%--$("#licheng_L").val("0")--%>
                <%--$("#licheng_R").val("1")--%>
                <%--break;--%>
            <%--case 2:--%>
                <%--$("#cheling_L").val("1")--%>
                <%--$("#cheling_R").val("3")--%>
                <%--break;--%>
            <%--case 3:--%>
                <%--$("#cheling_L").val("3")--%>
                <%--$("#cheling_R").val("6")--%>
                <%--break;--%>
            <%--default :--%>
                <%--$("#cheling_L").val("6")--%>
                <%--$("#cheling_R").val("100")--%>
        <%--}--%>
        <%--//  提交--%>
        <%--$("#condition").submit();--%>
    <%--}--%>
<%--</script>--%>
</body>
</html>