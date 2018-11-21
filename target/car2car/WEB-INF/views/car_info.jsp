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
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/pro.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/quanju.css">
    <script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>
    <!--[if IE 6]>
    <script type="text/javascript" src="<%=path%>/resources/js/DD_belatedPNG.js"></script>
    <script>
        DD_belatedPNG.fix('*');
    </script>
    <![endif]-->

    <style type="text/css">
        .mTags span.right {
            font-size: 14px;
            padding-top: 4px;
            display: inline-block;
        }

        .mTags span.right a {
            font-size: 14px;
            color: #f60;
        }

        .l_dizhi {
            height: 35px;
            line-height: 35px;
        }

        .l_dizhi img {
            vertical-align: middle;
            position: relative;
            top: -1px;
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>


<div id="about">
    <div class="mTags wrap">
        <a href="/ysCar/index">源深名车广场</a>><a href="#">详请</a>
    </div>
    <div class="wrap clearfix buyTop" style="padding-bottom:40px;">
        <div class="left dInline" style="width:592px;">
            <!--图片切换部分开始-->
            <div id="play">
                <ul class="img_ul" >
                    <c:forEach var="pics" items="${car.pics}" begin="0" end="${car.pics.size()}">
                        <li style="display:block;"><a class="img_a"><img src="<%=basePath%>${pics.picUrl}" width="100%" height="365px" ></a></li>
                        <%--<li style="display:block;"><a class="img_a"><img src="<%=path%>/resources/images/th8.jpg"></a></li>--%>
                    </c:forEach>
                    <%--<li style="display:block;"><a class="img_a"><img src="<%=path%>/resources/images/th7.jpg"></a></li>--%>
                    <%--<li><a class="img_a"><img src="<%=path%>/resources/images/th8.jpg"></a></li>--%>
                    <%--<li><a class="img_a"><img src="<%=path%>/resources/images/th9.jpg"></a></li>--%>
                    <%--<li><a class="img_a"><img src="<%=path%>/resources/images/th10.jpg"></a></li>--%>
                </ul>
                <a href="javascript:void(0)" class="prev_a change_a" title="上一张"> <span></span></a>
                <a href="javascript:void(0)" class="next_a change_a" title="下一张"> <span style="display: inline; "></span> </a>
            </div>

            <div class="img_hd">
                <ul class=" clearfix1">
                    <c:forEach var="pics" items="${car.pics}" begin="0" end="${car.pics.size()}">
                        <li><a class="img_a"><img src="<%=basePath%>${pics.picUrl}" onload="imgs_load(this)"></a></li>
                    </c:forEach>
                    <%--<li><a class="img_a"><img src="<%=path%>/resources/images/th7.jpg" onload="imgs_load(this)"></a></li>--%>
                    <%--<li><a class="img_a"><img src="<%=path%>/resources/images/th8.jpg" onload="imgs_load(this)"></a></li>--%>
                    <%--<li><a class="img_a"><img src="<%=path%>/resources/images/th9.jpg" onload="imgs_load(this)"></a></li>--%>
                    <%--<li><a class="img_a"><img src="<%=path%>/resources/images/th10.jpg" onload="imgs_load(this)"></a></li>--%>
                </ul>
                <a class="bottom_a prev_a" style="opacity: 0.7; "></a>
                <a class="bottom_a next_a" style="opacity: 0.7; "></a>
            </div>
            <!--图片切换部分结束-->
        </div>
        <div class="buyTxt right dInline">
            <%--<h1>路虎 发现(进口) 2014 款 3.0T 自动 四代SDV6 HSE</h1>--%>
            <h1>${car.carInfo.brand} &nbsp; ${car.carInfo.carName} &nbsp; ${car.carInfo.confName}</h1>
            <div class="byDl clearfix">
                <div class="price" style="width:235px;">
                    <p> 源深一口价：</p>
                    <span class="num nBlue"> ${car.carInfo.price}</span> <b>万元</b>
                </div>
                <div class="right dInline jPrice" style="line-height:22px;"> 诺信汽车金融分期付款方案<br/>
                    <span>首付50%，日供约385元</span> 此方案只针对经审核后确定资质合格的用户<br/>
                </div>
            </div>
            <div class="byDl clearfix byDl_tab"> <span class="left bItem">
        <div> 车龄
          <p>${car.carInfo.carAge}</p>
        </div>
        </span> <span class="left bItem">
        <div> 行驶里程
          <p>${car.carInfo.carMileage}万公里</p>
        </div>
        </span> <span class="left bItem">
        <div> 车身结构
          <p>${car.carInfo.bodyStructure}</p>
        </div>
        </span> <span class="left bItem">
        <div> 牌子归属地
          <p>${car.carInfo.licenseAddress}</p>
        </div>
        </span>
            </div>

            <div class="byBtn clearfix"><a class="by_qd " onclick="addOrder(${car.carInfo.carId})" href="javascript:void(0)">立即抢定</a>
                <%--<a  href="javascript:void(0)" onclick="balance('2')" class="balance_2">加入对比</a>--%>
                <div class="jiathis_style_32x32">
                    <a href="http://www.jiathis.com/share?uid=2069164" title="分享"
                       class="jiathis "  style="text-decoration:none; text-align:center;display:inline-block;height:35px;  margin-right:12px">分享</a>
                </div>

             </div>

            <div class="b_ly clearfix"><img src="<%=path%>/resources/images/tel1.png"/>　看车电话 <b>销售热线 (400-888-666)</b>
                <span class="right"> <a id="QQZXFR" name=""><img src="<%=path%>/resources/images/qq1.png"/> 在线咨询</a>
                <a class="xsWx"> <img src="<%=path%>/resources/images/wx1.png"/> 微信咨询
                <div class="wx-img"> <img src="<%=path%>/resources/images/55e40d5761eac.jpg"/> </div>
                </a>
                </span>
                <div class="l_dizhi" style="line-height:35px;font-size:13px;;"> 看车地址：湘潭市雨湖区湖南科技大学　
                </div>
            </div>
        </div>
    </div>



    <div class="wrap speciality lazy-mod" id="speciality">
        <ul class="clearfix unstyled">
            <li class="notbad" style="width:148px"><span> <i></i> </span> <em>杜绝事故车</em></li>
            <li class="choiceness" style="width:148px"><span> <i></i> </span> <em>精选优质名车</em></li>
            <li class="check_360" style="width:148px"><span> <i></i> </span> <em>365项检测认证</em></li>
            <li class="new_car_standa" style="width:148px"><span> <i></i> </span> <em>准新车上市车标准</em></li>
            <li class="O2O" style="width:148px"><span> <i></i> </span> <em>待售车辆专人护理</em></li>
            <li class="km" style="width:148px"><span> <i></i> </span> <em>5千公里无需保养</em></li>
            <li class="one_year_ok" style="width:148px"><span> <i></i> </span> <em>一年或2万公里无忧质保</em></li>
            <li class="hover_24" style="width:148px"><span> <i></i> </span> <em>24小时道路救援</em></li>
        </ul>
    </div>


    <%--基本信息--%>
    <div class="wrap">
        <div class="buyDetail">
            <div class="b_tab_nav">
                <div class="b-tab"><a class="on b_ta" href="#cBox1" data-scroll data-speed="1000">基本信息<i></i></a>

                     <span  style="float:right;font-size:14px;color: #2e71b8; margin-right:30px;"><b>看车电话：销售部 (400-888-666)</b></span>
                </div>
            </div>


            <%--详情信息--%>
            <div class="b-cont">
                <div id="cBox1" class="c_box">
                    <%--<h2>路虎 发现(进口) 2014 款 3.0T 自动 四代SDV6 HSE</h2>--%>
                    <h2>${car.carInfo.brand} &nbsp; ${car.carInfo.carName} &nbsp; ${car.carInfo.confName}</h2>
                    <div class="cbox-a">
                        <%--<div class="ca-table">--%>
                            <%--<table>--%>
                                <%--<tr>--%>
                                    <%--<td class="ca-td1">上牌时间</td>--%>
                                    <%--<td>2014-07</td>--%>
                                    <%--<td class="ca-td1">年检到期时间</td>--%>
                                    <%--<td>2016-07</td>--%>
                                    <%--<td class="ca-td1">强险到期时间</td>--%>
                                    <%--<td>2016-07</td>--%>
                                    <%--<td class="ca-td1">车辆编号</td>--%>
                                    <%--<td>720214</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<td class="ca-td1">车身颜色</td>--%>
                                    <%--<td>咖啡色</td>--%>
                                    <%--<td class="ca-td1">车体形式</td>--%>
                                    <%--<td>SUV</td>--%>
                                    <%--<td class="ca-td1">变速箱</td>--%>
                                    <%--<td></td>--%>
                                    <%--<td class="ca-td1">排量</td>--%>
                                    <%--<td>3.0T</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<td colspan="8"><p>亿金名车，您身边的二手车专家！</p></td>--%>
                                <%--</tr>--%>
                            <%--</table>--%>
                        <%--</div>--%>
                        <%--基本信息--%>
                        <div class="ca-dl"><span class="caItem on">基本信息</span>
                            <div class="clearfix">
                                <div class="jb_infor left">
                                    <table>
                                        <tr>
                                            <td width="270">厂商</td>
                                            <td>${car.carInfo.carName}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">级别</td>
                                            <td class="ca-td1">${car.carInfo.level}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jb_infor right">
                                    <table>
                                        <tr>
                                            <td width="270">发动机</td>
                                            <td>${car.carInfo.engine}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">变速箱</td>
                                            <td class="ca-td1">${car.carInfo.gearbox}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jb_infor left">
                                    <table>
                                        <tr>
                                            <td width="270">车身结构</td>
                                            <td>${car.carInfo.bodyStructure}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">长*宽*高{mm)</td>
                                            <td class="ca-td1">${car.carInfo.size}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jb_infor right">
                                    <table>
                                        <tr>
                                            <td width="270">最大车速(km/s}</td>
                                            <td>>${car.carInfo.maximumspeed}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">行李箱容积(L)</td>
                                            <td class="ca-td1">>${car.carInfo.cargoVolume}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <%--发动机参数--%>
                        <div class="ca-dl" id="cBox2"><span class="caItem on">发动机参数</span>
                            <div class="clearfix">
                                <div class="jb_infor left">
                                    <table>
                                        <tr>
                                            <td width="270">排量(L</td>
                                            <td>${car.carEngineInfo.displacement}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">进气形式</td>
                                            <td class="ca-td1">${car.carEngineInfo.intakeForm}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">气缸排列形式</td>
                                            <td>${car.carEngineInfo.cylinderArrangement}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">气缸数</td>
                                            <td class="ca-td1">${car.carEngineInfo.cylinders}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">排放标准</td>
                                            <td>${car.carEngineInfo.enviromentStandard}</td>
                                        </tr>


                                    </table>
                                </div>
                                <div class="jb_infor right">
                                    <table>

                                        <tr>
                                            <td width="270">最大马力(Ps)</td>
                                            <td>${car.carEngineInfo.maximumHorsepower}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">燃料类型</td>
                                            <td class="ca-td1">${car.carEngineInfo.fuel}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">燃油标号</td>
                                            <td>${car.carEngineInfo.fuelLabel}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">供油方式</td>
                                            <td class="ca-td1">${car.carEngineInfo.oilsupplyMode}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <%--底盘及制动--%>
                        <div class="ca-dl"><span class="caItem on">底盘及制动</span>
                            <div class="clearfix">
                                <div class="jb_infor left">
                                    <table>
                                        <tr>
                                            <td width="270">驱动方式</td>
                                            <td>${car.carChassisBrakeInfo.driveMode}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">助力类型</td>
                                            <td class="ca-td1">${car.carChassisBrakeInfo.autoPowerType}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">前悬挂类型</td>
                                            <td>${car.carChassisBrakeInfo.frontSuspensionType}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">后悬挂类型</td>
                                            <td class="ca-td1">${car.carChassisBrakeInfo.rearSuspensionType}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">前制动类型</td>
                                            <td>${car.carChassisBrakeInfo.frontBrakeType}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jb_infor right">
                                    <table>
                                        <tr>
                                            <td width="270">后制动类型</td>
                                            <td>${car.carChassisBrakeInfo.rearBrakeType}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">驻车制动类型</td>
                                            <td class="ca-td1">${car.carChassisBrakeInfo.parkingBrakeType}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">前轮胎规格</td>
                                            <td>${car.carChassisBrakeInfo.frontWheelSize}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">后轮胎规格</td>
                                            <td class="ca-td1">${car.carChassisBrakeInfo.rearWheelSize}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>


                        <%--安全配置--%>
                        <div class="ca-dl"><span class="caItem on">安全配置</span>
                            <div class="clearfix">
                                <div class="jb_infor left">
                                    <table>
                                        <tr>
                                            <td width="270">主/副驾驶安全气囊</td>
                                            <td>${car.carSafetyInfo.frontAirbag}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">儿童座椅接口</td>
                                            <td class="ca-td1">${car.carSafetyInfo.childSeatInt}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">车内中控锁</td>
                                            <td>${car.carSafetyInfo.carLock}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">车身稳定控制</td>
                                            <td class="ca-td1">${car.carSafetyInfo.usc}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jb_infor right">
                                    <table>
                                        <tr>
                                            <td width="270">前/后排头部气囊</td>
                                            <td>${car.carSafetyInfo.headAirbag}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">胎压检测</td>
                                            <td class="ca-td1">${car.carSafetyInfo.tpms}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">ABS防抱死系统</td>
                                            <td>${car.carSafetyInfo.abs}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">无钥匙启动</td>
                                            <td class="ca-td1">${car.carSafetyInfo.pss}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <%--外部配置--%>
                        <div class="ca-dl"><span class="caItem on">外部配置</span>
                            <div class="clearfix">
                                <div class="jb_infor left">
                                    <table>
                                        <tr>
                                            <td width="270">电动天窗</td>
                                            <td>${car.carExternalInfo.electronicSunroof}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">电动吸合门</td>
                                            <td class="ca-td1">${car.carExternalInfo.electronicDoorPull}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">雨量感应雨刷</td>
                                            <td>${car.carExternalInfo.rainSensingWipers}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">前/后电动车窗</td>
                                            <td class="ca-td1">${car.carExternalInfo.powerWindow}</td>
                                        </tr>

                                        <tr>
                                            <td width="270">后视镜加热</td>
                                            <td>${car.carExternalInfo.rearviewMirrorHeating}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jb_infor right">
                                    <table>
                                        <tr>
                                            <td width="270">全景天窗</td>
                                            <td>${car.carExternalInfo.panoramicSunroof}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">电动后备箱</td>
                                            <td class="ca-td1">${car.carExternalInfo.electronicTrunk}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">后雨刷</td>
                                            <td>${car.carExternalInfo.rearWiper}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">电动后视镜</td>
                                            <td class="ca-td1">${car.carExternalInfo.electronicRearviewMirror}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <%--内部配置--%>
                        <div class="ca-dl"><span class="caItem on">内部配置</span>
                            <div class="clearfix">
                                <div class="jb_infor left">
                                    <table>
                                        <tr>
                                            <td width="270">多功能方向盘</td>
                                            <td>${car.carInternalInfo.mfSteeringWheel}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">定速巡航</td>
                                            <td class="ca-td1">${car.carInternalInfo.dlcc}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">手动空调</td>
                                            <td>${car.carInternalInfo.manualAirCon}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">GPS导航</td>
                                            <td class="ca-td1">${car.carInternalInfo.gps}</td>
                                        </tr>

                                        <tr>
                                            <td width="270">倒车雷达</td>
                                            <td>${car.carInternalInfo.parkingRedar}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="jb_infor right">
                                    <table>
                                        <tr>
                                            <td width="270">真皮座椅</td>
                                            <td>${car.carInternalInfo.leatherSeat}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">前后排座椅加热</td>
                                            <td class="ca-td1">${car.carInternalInfo.seatHeating}</td>
                                        </tr>
                                        <tr>
                                            <td width="270">自动空调</td>
                                            <td>${car.carInternalInfo.automaticAirCon}</td>
                                        </tr>
                                        <tr>
                                            <td class="ca-td1">倒车雷达</td>
                                            <td class="ca-td1">${car.carInternalInfo.parkingRedar}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <br/>
                <br/>
            </div>

        </div>

    </div>

</div>


<%@include file="footer.jsp" %>
<%--<%@include file="right.jsp" %>--%>
<%@include file="popLoginBox.jsp" %>

<script type="text/javascript" src="<%=path%>/resources/js/miniBar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/lg_reg.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/smooth-scroll.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.SuperSlide.2.1.1.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/CarLoad.js"></script>
<!--图片切换-->
<script type="text/javascript" src="<%=path%>/resources/js/jquery.min.js"></script>
<script>
    var i = 0; //图片标识
    var img_num = $(".img_ul").children("li").length; //图片个数
    $(".img_ul li").hide(); //初始化图片
    play();
    $(function () {
        $(".img_hd ul").css("width", ($(".img_hd ul li").outerWidth(true)) * img_num); //设置ul的长度

        $(".bottom_a").css("opacity", 0.7);	//初始化底部a透明度
        //$("#play").css("height",$("#play .img_ul").height());
        if (!window.XMLHttpRequest) {//对ie6设置a的位置
            $(".change_a").css("height", $(".change_a").parent().height());
        }
        $(".change_a").focus(function () {
            this.blur();
        });
        $(".bottom_a").hover(function () {//底部a经过事件
            $(this).css("opacity", 1);
        }, function () {
            $(this).css("opacity", 0.7);
        });
        $(".change_a").hover(function () {//箭头显示事件
            $(this).children("span").show();
        }, function () {
            $(this).children("span").hide();
        });
        $(".img_hd ul li").click(function () {
            i = $(this).index();
            play();
        });
        $(".prev_a").click(function () {
            //i+=img_num;
            i--;
            //i=i%img_num;
            i = (i < 0 ? 0 : i);
            play();
        });
        $(".next_a").click(function () {
            i++;
            //i=i%img_num;
            i = (i > (img_num - 1) ? (img_num - 1) : i);
            play();
        });
    });
    function play() {//动画移动
        var img = new Image(); //图片预加载
        img.onload = function () {
            img_load(img, $(".img_ul").children("li").eq(i).find("img"))
        };
        img.src = $(".img_ul").children("li").eq(i).find("img").attr("src");
        //$(".img_ul").children("li").eq(i).find("img").(img_load($(".img_ul").children("li").eq(i).find("img")));

        $(".img_hd ul").children("li").eq(i).addClass("on").siblings().removeClass("on");
        if (img_num > 7) {//大于7个的时候进行移动
            if (i < img_num - 3) { //前3个
                $(".img_hd ul").animate({"marginLeft": (-($(".img_hd ul li").outerWidth() + 4) * (i - 3 < 0 ? 0 : (i - 3)))});
            }
            else if (i >= img_num - 3) {//后3个
                $(".img_hd ul").animate({"marginLeft": (-($(".img_hd ul li").outerWidth() + 4) * (img_num - 7))});
            }
        }
        if (!window.XMLHttpRequest) {//对ie6设置a的位置
            $(".change_a").css("height", $(".change_a").parent().height());
        }
    }
    function img_load(img_id, now_imgid) {//大图片加载设置 （img_id 新建的img,now_imgid当前图片）

        if (img_id.width / img_id.height > 1) {
            if (img_id.width >= $("#play").width()) $(now_imgid).width($("#play").width());
        }
        else {
            if (img_id.height >= 500) $(now_imgid).height(365);
        }
        $(".img_ul").children("li").eq(i).show().siblings("li").hide(); //大小确定后进行显示
    }
    function imgs_load(img_id) {//小图片加载设置
        if (img_id.width >= $(".img_hd ul li").width()) {
            img_id.width = 80
        }
        ;
        //if(img_id.height>=$(".img_hd ul li").height()) {img_id.height=$(".img_hd ul li").height();}
    }
</script>

</body>


<%-- add by fws--%>
<script type="text/javascript">

    /**
     * 添加订单
     */
    function addOrder(carId) {

        var user='${username}';

        //如果没有登录，进入登陆界面
        if(user){
            //
            console.log("addOrder !")

            var Data ={"carId":carId};
            $.ajax({
                type: "POST",
                url: "<%=path%>/ysCar/order/createOrder",
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
            <%--window.location.href="<%=path%>/ysCar/order/createOrder";--%>
        }else {

            $('#popBox').fadeIn();
            $('.p-tab a:first').addClass('on').siblings().removeClass('on');
            $('.p-dl:first').show().siblings().hide();

        }



    }


    $('.b-login').click(function(){

        alert("hello !")
        <%--var user = "${user}";  //若session无user值 判为游客登录 返回登录界面--%>
        <%--if(user=="" || user==null) {--%>
            <%--alert("请先登录");--%>
            <%--window.location.href="/login/login"--%>
        <%--}--%>




        $.ajax({
            type:"post",
            url:"../order/create",
            <%--data:{id:${carInfo.carInfo.carId}},--%>
            data:{id:1},
            success:function(data){
                if(data.status == "1"){
                    alert("添加订单成功");
                    window.location.href="../ysCar/menberVip";
                }
                 //       alert(JSON.stringify(data));

            }
        });

//        $('#popBox').fadeIn();
//        $('.p-tab a:first').addClass('on').siblings().removeClass('on');
//        $('.p-dl:first').show().siblings().hide();

//        $.ajax({
//            type:"post",
//            url:"http://localhost:8080/xyCar/menberVip",
//            dataType:"json",
//            contentType: "application/json",
//            data:{},
//            success:function(data){
//                // alert(JSON.stringify(data));
//            }
//        });

    })


</script>
</html>