<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
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
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/sell.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/alert.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/about.css">
    <script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>


    <!--[if IE 6]>
    <script type="text/javascript" src="<%=path%>/resources/js/DD_belatedPNG.js"></script>
    <script>
        DD_belatedPNG.fix('*');
    </script>
    <![endif]-->
</head>
<body>
<%@include file="header.jsp" %>

<div id="about">
    <div class="mTags wrap">
        <a href="/ysCar/index">源深名车广场</a>><a href="/ysCar/about">亿金简介</a>
    </div>
    <div class="wAbout">
        <%--<div class="a-wa">--%>
            <%--<div class="wrap a-nav">--%>
                <%--<ul class="clearfix">--%>
                    <%--<li class="on"><a href="#">亿金简介</a></li>--%>
                    <%--<li><a href="#">亿金动态</a></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">售后服务</a></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">招贤纳士</a></li>--%>
                    <%--<li><a href="#">联系我们</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="a-wb">
            <div class="wrap">
                <h1>源深简介</h1>
                <div class="a-div">
                    <p style="text-align: center;"><br/></p>
                    <p style="text-align: center;">
                        <span style="font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 14px;">&nbsp; &nbsp;<span
                                style="font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;">源深名车广场，系湖南源深有限公司旗下企业，
                        中部5S二手名车综合服务商，拥有一座10000多平米的双层豪华展厅。主营奥迪、宝马、奔驰、路虎、保时捷、等几十种高档精品二手名车。
                        业务涵盖车辆买卖、车辆置换、名车定制、新车销售、金融按揭、保险、保养维修等，并为客户代办车辆上牌、过户、违章处理、年检等贴心一站式服务。</span>
                        </span>
                    </p>
                    <p style="text-align: center;"><span
                            style="font-size: 14px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;">&nbsp; &nbsp; 自成立以来，公司秉承“诚立中原、信达天下”的经营理念，坚持“一口价”销售理念，引进“认证车”管理模式。所有车辆均经过资深技师<span
                            style="font-size: 16px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; color: rgb(0, 176, 240);">365项专业检测，以杜绝销售事故车，泡水车为原则，为客户承诺所售车辆7天退换，一年或2万公里无忧质保</span>，是中原首家推出在售车辆5000公里无需保养的二手车企业。
					    </span>
                    </p>
                    <p style="text-align: center;"><span
                            style="font-size: 14px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;">公司凭借精准的战略布局、明晰的市场定位、严苛的品质管理和贴心的全方位服务，在短短的两年时间里飞速发展。便捷的一站式购车平台和优质贴心的全方位服务赢得了客户的青睐和良好的口碑。“亿金名车”高端尊贵、值得信赖的品牌形象逐步树立，目前已成为中原人民购买高端二手车的首选品牌。</span>
                    </p>
                    <p><br/></p>
                    <p style="text-align: center;"><br/></p>
                    <p><br/></p>
                </div>
                <div class="a-div" id="dizhi">
                    <div class="a-xi clearfix">
                        <div style="width:697px;height:290px;border:#ccc solid 1px;margin-right:50px;" id="dituContent"
                             class="left"></div>
                        <p>
                            <strong>联系源深</strong><br/>
                            展厅地址：湘潭市湖南科技大学广场<br/>
                            联系电话 ：400-888-6666 <br/>
                            邮箱：fuwenshen168@SSsina.com<br/>
                            官方网站：http://www.hnyuanshen.com<br/>
                            源深名车官方微博：@源深二手名车广场<br/>
                            源深名车微信号：hnyuanshen
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="footer.jsp" %>

<%--<!--右侧内容的开始-->--%>
<%--<%@include file="right.jsp"%>--%>
<%--<!--右侧内容的结束-->--%>

<!--会员登录与注册开始-->

<%@include file="popLoginBox.jsp" %>

<!--会员登录与注册开始-->


<script type="text/javascript" src="<%=path%>/resources/js/miniBar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/lg_reg.js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap() {
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }

    //创建地图函数：
    function createMap() {
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(112.927285, 27.909063);//定义一个中心点坐标
        map.centerAndZoom(point, 17);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent() {
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl() {
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: 1});
        map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }

    //标注点数组
    var markerArr = [{
        title: "源深汽车",
        content: "地址：湖南省湘潭市湖南科技大学月湖广场<br/>电话：400-888-666",
        point: "112.927285|27.909063",
        isOpen: 0,
        icon: {w: 23, h: 25, l: 46, t: 21, x: 9, lb: 12}
    }
    ];
    //创建marker
    function addMarker() {
        for (var i = 0; i < markerArr.length; i++) {
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0, p1);
            var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point, {icon: iconImg});
            var iw = createInfoWindow(i);
            var label = new BMap.Label(json.title, {"offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20)});
            marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                borderColor: "#808080",
                color: "#333",
                cursor: "pointer"
            });

            (function () {
                var index = i;
                var _iw = createInfoWindow(i);
                var _marker = marker;
                _marker.addEventListener("click", function () {
                    this.openInfoWindow(_iw);
                });
                _iw.addEventListener("open", function () {
                    _marker.getLabel().hide();
                })
                _iw.addEventListener("close", function () {
                    _marker.getLabel().show();
                })
                label.addEventListener("click", function () {
                    _marker.openInfoWindow(_iw);
                })
                if (!!json.isOpen) {
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i) {
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>" + json.content + "</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json) {
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w, json.h), {
            imageOffset: new BMap.Size(-json.l, -json.t),
            infoWindowOffset: new BMap.Size(json.lb + 5, 1),
            offset: new BMap.Size(json.x, json.h)
        })
        return icon;
    }

    initMap();//创建和初始化地图
</script>


</body>
</html>











