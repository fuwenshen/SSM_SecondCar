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

    <style type="text/css">
        .sameCar {
            margin-top: 20px;
            padding-bottom: 15px;
            border: 1px solid #ccc;
            border-top: none;
        }

        .sameCar h4 {
            font-size: 14px;
            color: #fff;
            padding: 10px;
            background: #3F7DDD;
        }

        .sameCar ul {
        }

        .sameCar li {
            line-height: 20px;
            margin: 0px 10px;
            border-bottom: 1px solid #ccc;
            padding: 5px 0;
        }

        .nav_fixed {
            position: fixed;
            top: 0px;
            z-index: 10;
        }

        * html .nav_fixed {
            position: absolute;
            bottom: auto;
            top: expression(eval(document.documentElement.scrollTop));
        }

        #d_gd, .gd_box {
            width: 253px;
            overflow: hidden;
        }

    </style>
</head>

<body>

<%--头部--%>
<%@include file="header.jsp" %>

<div id="about">
    <div class="mTags wrap">
        <a href="/ysCar/index">源深名车广场</a>><a href="/ysCar/getCar">我要买车</a>
    </div>
    <div class="wrap text-left">

        <!--  form  表单  add by fuwenshen  -->
        <form action="/ysCar/getCar" id="condition" method="post">
            <div class="condition">
                <ul>
                    <li class=""><span class="c-name left">品牌：</span>
                        <div class="spec-moudle left dInline">
                            <a href="/ysCar/getCar?brand=奥迪"><img src="<%=path%>/resources/images/55a46160eac22.png"
                                             style="height:32px;"/></a>
                            <a href="/ysCar/getCar?brand=奔驰"><img src="<%=basePath%>images/55a4613f6aab9.png" style="height:32px;"/></a>
                            <a href="/ysCar/getCar?brand=宝马"><img src="<%=path%>/resources/images/55c8639f1aa89.png"
                                             style="height:32px;"/></a>
                            <a href="/ysCar/getCar?brand=路虎"><img src="<%=path%>/resources/images/567a3b2190d9f.png"
                                             style="height:32px;"/></a>
                            <a href="/ysCar/getCar?brand=保时捷"><img src="<%=path%>/resources/images/567a3cdb8bf68.png"
                                             style="height:32px;"/></a>
                            <a href="/ysCar/getCar?brand=丰田"><img src="<%=path%>/resources/images/55a4afc65ed32.png"
                                             style="height:32px;"/></a>
                            <a href="/ysCar/getCar?brand=大众"><img src="<%=path%>/resources/images/55a34e9dcd43a.png"
                                             style="height:32px;"/></a>
                            <a href="/ysCar/getCar?brand=劳斯莱斯"><img src="<%=path%>/resources/images/567a3d20d7df1.png"
                                             style="height:32px;"/></a>

                            <div class="pro_smore">
                                <div class="clearfix ps-a">
                                    <select class="left" name="brand" id="Smakeid" placeholder="所属品牌">
                                        <option value=""> 选择品牌</option>
                                        <option value="奥迪"> A 奥迪</option>
                                        <option value="保时捷"> B 保时捷</option>
                                        <option value="别克"> B 别克</option>
                                        <option value="奔驰"> B 奔驰</option>
                                        <option value="宝马"> B 宝马</option>
                                        <option value="宾利"> B 宾利</option>
                                        <option value="巴博斯"> B 巴博斯</option>
                                        <option value="本田"> B 本田</option>
                                        <option value="标致"> B 标致</option>
                                        <option value="大众"> D 大众</option>
                                        <option value="道奇"> D 道奇</option>
                                        <option value="丰田"> F 丰田</option>
                                        <option value="福特"> F 福特</option>
                                        <option value="Jeep"> J Jeep</option>
                                        <option value="捷豹"> J 捷豹</option>
                                        <option value="克莱斯勒"> K 克莱斯勒</option>
                                        <option value="凯迪拉克"> K 凯迪拉克</option>
                                        <option value="劳斯莱斯"> L 劳斯莱斯</option>
                                        <option value="路虎"> L 路虎</option>
                                        <option value="雷克萨斯"> L 雷克萨斯</option>
                                        <option value="MINI"> M MINI</option>
                                        <option value="玛莎拉蒂"> M 玛莎拉蒂</option>
                                        <option value="马自达"> M 马自达</option>
                                        <option value="纳智捷"> N 纳智捷</option>
                                        <option value="日产"> R 日产</option>
                                        <option value="smart"> s smart</option>
                                        <option value="三菱"> S 三菱</option>
                                        <option value="111"> S 斯巴鲁</option>
                                        <option value="斯巴鲁"> W 沃尔沃</option>
                                        <option value="现代"> X 现代</option>
                                        <option value="雪佛兰"> X 雪佛兰</option>
                                        <option value="英菲尼迪"> Y 英菲尼迪</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class=""><span class="c-name left">价格：</span>
                        <div class="spec-moudle left dInline">
                            <a id="price1" href="javascript:void(0)" onclick="chosePrice(1)">5万以内</a>
                            <a id="price2" href="javascript:void(0)" onclick="chosePrice(2)" >5-10万</a>
                            <a id="price3" href="javascript:void(0)" onclick="chosePrice(3)">10-30万</a>
                            <a id="price4" href="javascript:void(0)" onclick="chosePrice(4)">30-100万</a>
                            <a id="price5" href="javascript:void(0)" onclick="chosePrice(5)">100万以上</a>
                            <div class="pro_smore">
                                <div class="clearfix ps-b">
                                    <table>
                                        <tr>
                                            <td><input type="text" class="sTxt" id="price_L" name="fPrice" value=""/></td>
                                            <td>-</td>
                                            <td><input type="text" class="sTxt" id="price_R" name="ePrice"value=""/></td>
                                            <td>万元</td>
                                            <td><input type="submit" value="确定" class="sBtn" id="tjprice"  style="line-height:10px"/></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </li>


                    <li class="" style="height:48px;"><span class="c-name left">车型：</span>
                        <div class="spec-moudle left dInline" style="height:auto;">
                            <a href="#" onclick="choseLevel(1)"><img src="<%=path%>/resources/images/c4.gif" height="30"/><br/>微型车</a>
                            <a href="#" onclick="choseLevel(2)"><img src="<%=path%>/resources/images/c2.gif" height="30"/><br/>紧凑型车</a>
                            <a href="#" onclick="choseLevel(3)"><img src="<%=path%>/resources/images/c6.gif" height="30"/><br/>豪华车</a>
                            <a href="#" onclick="choseLevel(4)"><img src="<%=path%>/resources/images/c1.gif" height="30"/><br/>SUV</a>
                            <a href="#" onclick="choseLevel(5)"><img src="<%=path%>/resources/images/c3.gif" height="30"/><br/>跑车</a>
                            <a href="#" onclick="choseLevel(6)"><img src="<%=path%>/resources/images/c5.gif" height="30"/><br/>MPV</a>
                        </div>
                        <table hidden>
                            <tr>
                                <td><input type="text" class="sTxt" id="carType" name="level"value=""/></td>
                            </tr>
                        </table>
                    </li>


                    <li class=""><span class="c-name left">车龄：</span>
                        <div class="spec-moudle left dInline">
                            <a href="#" id="0-1" onclick="choseCarAge(1)">1年以内</a>
                            <a href="#" id="0-2" onclick="choseCarAge(2)">2年以内</a>
                            <a href="#" id="0-3" onclick="choseCarAge(3)">3年以内</a>
                            <a href="#" id="3-5" onclick="choseCarAge(4)">3-5年</a>
                            <a href="#" id="5-0" onclick="choseCarAge(5)">5年以上</a>
                            <div class="pro_smore">
                                <div class="clearfix ps-b">
                                    <table>
                                        <tr>
                                            <td><input type="text" class="sTxt" id="cheling_L" name="carAge1" value=""/></td>
                                            <td>-</td>
                                            <td><input type="text" class="sTxt" id="cheling_R" name="carAge2" value=""/></td>
                                            <td>年</td>
                                            <td><input type="submit" value="确定" class="sBtn" id="tjcheling"  style="line-height:10px"/></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </li>


                    <li class=""><span class="c-name left">里程：</span>
                        <div class="spec-moudle left dInline">
                            <a href="#"  onclick="choseCarMile(1)">一万公里以内</a>
                            <a href="#"  onclick="choseCarMile(1)">1-3万公里</a>
                            <a href="#"  onclick="choseCarMile(1)">3-6万公里</a>
                            <a href="#"  onclick="choseCarMile(1)">6万公里以上</a>
                            <div class="pro_smore">
                                <div class="clearfix ps-b">
                                    <table>
                                        <tr>
                                            <td><input type="text" class="sTxt" id="licheng_L" name="carMileage1" value=""/></td>
                                            <td>-</td>
                                            <td><input type="text" class="sTxt" id="licheng_R" name="carMileage2" value=""/></td>
                                            <td>万公里</td>
                                            <td><input type="submit" value="确定" class="sBtn" id="tjlicheng"
                                                       style="line-height:10px"/></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </li>

                </ul>
            </div>

        </form>
        </div>

    </div>


    <!---xia-->
    <div class="aWrap clearfix wrap">
        <div class="left dInline aLeft">
            <div class="carSou">
                <%--&lt;%&ndash;列表头&ndash;%&gt;--%>
                <%--<div class="cs-tit">--%>
                    <%--<div class="clearfix">--%>
                        <%--<div class="ctLeft left dInline">--%>
                            <%--<div class="ct-a left dInline"><a class="on" href="#"><i>全部</i></a>--%>
                                <%--<a href="2/sta/B/ord/A/url_form.html"><i>在途</i>(13)</a>--%>
                                <%--<a href="2/sta/C/ord/A/url_form.html"><i>在售</i>(307)</a>--%>
                                <%--<a href="2/sta/E/ord/A/url_form.html"><i>预订</i>(22)</a>--%>
                                <%--<a href="2/sta/D/ord/A/url_form.html"><i>已售</i>(744)</a>--%>
                            <%--</div>--%>

                            <%--<div class="cs_sub"> 排序： <a class="cs-a1" href="#">默认<img--%>
                                    <%--src="<%=path%>/resources/images/down.gif"/></a>--%>
                                <%--<a href="2/sta/A/ord/B/url_form.html">点击量<img--%>
                                        <%--src="<%=path%>/resources/images/down.gif"/></a>--%>
                                <%--<a href="2/sta/A/ord/C/url_form.html">收藏量<img--%>
                                        <%--src="<%=path%>/resources/images/down.gif"/></a>--%>
                                <%--<a href="2/sta/A/ord/E/url_form.html">价格<img--%>
                                        <%--src="<%=path%>/resources/images/up.gif"/></a>--%>
                                <%--<a href="2/sta/A/ord/F/url_form.html">里程<img--%>
                                        <%--src="<%=path%>/resources/images/up.gif"/></a></div>--%>
                        <%--</div>--%>
                        <%--<div class="right cpages"> 1/32 <a href="#">&lt;</a><a href="2/sta/A/ord/A/p/2.html">&gt;</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="cs-tit1"></div>--%>
                <%--</div>--%>



                    <%--${carInfoList.get(0)}--%>
               <%--汽车list   开始  --%>
                <div class="cs-list">
                    <c:forEach   var="carInfo" items="${carInfoList}" begin="0" end="${carInfoList.size()}"  >

                        <ul>
                            <li class="clearfix" style="position: relative;">
                            <span class="carImg left dInline"> <a href="<%=path%>/ysCar/carInfo?id=${carInfo.carId}" target="_blank">
                            <div class="car_bg"> </div>
                            <img src="${res}${carInfo.pic_url}" width="300"/></a>
                            </span>
                            <div class="carTxt right dInline">
                                    <h2><a href="<%=path%>/ysCar/carInfo?id=${carInfo.carId}" target="_blank">${carInfo.brand}    ${carInfo.carName}   ${carInfo.confName}</a></h2>
                                    <p><span>车龄：${carInfo.carAge}</span> <span>行驶里程：${carInfo.carMileage}</span> <span>上牌地：${carInfo.licenseAddress}</span></p>
                                    <div class="price clearfix" style="margin:8px 0;">
                                        <div class="left dInline pNum" style="width:110px;">
                                            <b>一口价</b><br/>
                                            <span class="num nBlue">${carInfo.price} </span><b> 万元</b>
                                        </div>
                                     </span>
                                    </div>
                                    <div class="cs_bt clearfix" style="padding-top:7px;">
                                        <a href="javascript:void(0)" class="cs-q" onclick="addOrder(${carInfo.carId})" id="addOrder">立即抢订</a>
                                        <%--<a href="javascript:void(0)" onclick="balance('1165')" class="balance_1165">加入对比</a>--%>
                                        <a href="javascript:void(0)" onclick="addFavorte(${carInfo.carId})" id="collection_1165">收藏</a>
                                        <%--<span>已有188人关注此车</span></div>--%>
                                </div>
                            </div>
                            </li>

                        </ul>

                    </c:forEach>


                    <%--&lt;%&ndash;分页&ndash;%&gt;--%>
                    <%--<div class="pages"><a class="on" href="#">1</a><a class="" href="#">2</a>--%>
                        <%--<a class="" href="#">3</a>--%>
                        <%--<a class="" href="#">4</a>--%>
                        <%--<a class="" href="#">5</a>--%>
                        <%--<a href="#">>></a> <a href="#">32</a>--%>
                    <%--</div>--%>
                    <%@include file="page.jsp"%>
                </div>


                <%--汽车list   结束  --%>
            </div>
        </div>




        <div class="right dInline aRight">

            <%--推荐车源--%>
            <div id="d_gd">
                <div class="gd_box">
                    <!--<div class="dWx"> <a href="javascript:;"><img src="images/5678b0dbe039f.jpg-thumb.jpg"/></a> </div>-->
                    <div class="txtMarquee-top">
                        <div class="sameCar bd">
                            <h4>推荐车源车源 </h4>
                            <ul class="infoList">
                                <c:forEach var="car" items="${recommend}">
                                    <li><a href="<%=path%>/ysCar/carInfo?id=${recommend.get(5).carId}"> ${car.brand} &nbsp; ${car.carName} &nbsp; ${car.confName}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $(window).scroll(function () {
            var b = $(window).scrollTop();
            if (b >= amNavTop) {
                $('#d_gd').find('.gd_box').addClass('nav_fixed');
            }
            else {
                $('#d_gd').find('.gd_box').removeClass('nav_fixed');
            }
            ;

        });
    })
</script>

<%--页面底端--%>
<%@include file="footer.jsp" %>

<%--&lt;%&ndash;侧栏&ndash;%&gt;--%>
<%--<%@include file="right.jsp" %>--%>

<%--弹出盒子--%>
<%@include file="popLoginBox.jsp"%>

<!--右侧搜索加入对比开始-->
<script type="text/javascript" src="<%=path%>/resources/js/miniBar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/lg_reg.js"></script>

<%--<script type="text/javascript" src="<%=path%>/resources/js/search_car.js"></script>--%>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.SuperSlide.2.1.1.js"></script>
<!--右侧搜索加入对比结束-->
<!--右侧滚动开始-->
<script type="text/javascript">
    $(function () {
        $(window).scroll(function () {
        })
    })
    jQuery(".txtMarquee-top").slide({
        mainCell: ".bd ul",
        autoPlay: true,
        effect: "topMarquee",
        vis: 5,
        interTime: 50,
        trigger: "click"
    });
</script>
<!--右侧滚动结束-->

<%--<link rel="stylesheet" type="text/css" href="<%=path%>/resources/bootstrap/css/bootstrap-datetimepicker.css">--%>
<%--&lt;%&ndash;<link rel="stylesheet" type="text/css" href="<%=path%>/resources/bootstrap/css/bootstrap.min.css">&ndash;%&gt;--%>
<%--<script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>--%>
<%--<script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>--%>


<script type="text/javascript">
//    add by fuwneshen

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

/**
 * 添加到收藏
 * @param chose
 */
 function addFavorte(carId){

    var user='${username}';
    //如果没有登录，进入登陆界面
    if(user){
        var Data ={"carId":carId};
        $.ajax({
            type: "POST",
            url: "<%=path%>/ysCar/order/createFav",
            contentType: "application/json",
            data:JSON.stringify(Data),
            success: function(data){
                if(data.status==0) {
                    alert("添加到收藏夹失败！")
                }else {
                    alert(JSON.stringify(data.desc))
                }

            }
        });
    }else {
        alert("登录")
        $('#popBox').fadeIn();
        $('.p-tab a:first').addClass('on').siblings().removeClass('on');
        $('.p-dl:first').show().siblings().hide();

    }

}

    function  choseBrand(brand) {

        $("#condition").submit();
    }
// 汽车价格
function chosePrice(chose) {
        switch (chose){
            case 1:
                $("#price_L").val(0)
                $("#price_R").val(5);
                break;
            case 2:
                $("#price_L").val(5)
                $("#price_R").val(10);
                break;
            case 3:
                $("#price_L").val(10)
                $("#price_R").val(30);
                break;
            case 4:
                $("#price_L").val(30)
                $("#price_R").val(100);
                break;
            default :
                $("#price_L").val(100)
                $("#price_R").val(1000);
        }
            //  提交
             $("#condition").submit();
    }

    // 汽车level
    function choseLevel(level) {
        switch (level){
            case 1:
                $("#carType").val("微型车")
                break;
            case 2:
                $("#carType").val("紧凑型车")
                break;
            case 3:
                $("#carType").val("豪华车")
                break;
            case 4:
                $("#carType").val("SUV")
                break;
            case 5:
                $("#carType").val("跑车")
                break;
            default :
                $("#carType").val("MPV")
        }
        //  提交
        $("#condition").submit();
    }

    // 车年龄
    function choseCarAge(age) {
        switch (age){
            case 1:
                $("#cheling_L").val("0")
                $("#cheling_R").val("1")
                break;
            case 2:
                $("#cheling_L").val("0")
                $("#cheling_R").val("2")
                break;
            case 3:
                $("#cheling_L").val("0")
                $("#cheling_R").val("3")
                break;
            case 4:
                $("#cheling_L").val("3")
                $("#cheling_R").val("5")
                break;
            default :
                $("#cheling_L").val("5")
                $("#cheling_R").val("20")
        }
        //  提交
        $("#condition").submit();
    }

    // 车里程
    function choseCarMile(mile) {
        switch (mile){
            case 1:
                $("#licheng_L").val("0")
                $("#licheng_R").val("1")
                break;
            case 2:
                $("#cheling_L").val("1")
                $("#cheling_R").val("3")
                break;
            case 3:
                $("#cheling_L").val("3")
                $("#cheling_R").val("6")
                break;
            default :
                $("#cheling_L").val("6")
                $("#cheling_R").val("100")
        }
        //  提交
        $("#condition").submit();
    }
</script>
</body>
</html>