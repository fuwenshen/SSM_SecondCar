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
  <script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>


  <!--[if IE 6]>
  <script type="text/javascript" src="<%=path%>/resources/js/DD_belatedPNG.js"></script>
  <script>
    DD_belatedPNG.fix('*');
  </script>
  <![endif]-->
</head>
<body>
<!--头部的开始-->
<%@include file="header.jsp"%>

<!--头部的结束-->

<style>
  input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {color: #000;}
  input:-moz-placeholder, textarea:-moz-placeholder {color:#000;}
  input::-moz-placeholder, textarea::-moz-placeholder {color:#000;}
  input:-ms-input-placeholder, textarea:-ms-input-placeholder {color:#000;}
  .select-item{margin-bottom: 18px;}
</style>
<div id="about">
  <div class="mTags wrap">
    <a href="/ysCar/index">源深名车广场</a>><a href="/ysCar/sellCar">我要卖车</a>
  </div>
  <div class="sellBox">

    <div class="sellTop">
      <div class="wrap">
        <div class="selDetail">
          <%--左边介绍--%>
          <div class="sel-a left dInline">
            <ul class="clearfix">
              <li>
                <img src="<%=path%>/resources/images/sell1_1.png"/>
                <strong>流程简单</strong>
              </li>
              <li>
                <img src="<%=path%>/resources/images/sell1_2.png"/>
                <strong>快速回款</strong>
              </li>
              <li class="last">
                <img src="<%=path%>/resources/images/sell1.png" style="color:#000" />
                <strong>诚信服务</strong>
              </li>
            </ul>
            <p>
              <strong style="font-size:24px;">源深标准</strong><br/><br/>
              车龄不超过4年<br/>
              行驶里程不超过80000公里<br/>
              无结构性损伤，非事故车、泡水车或火烧车<br/>
              具有完备、合法的车辆手续
            </p>
          </div>

          <%--登记车辆--%>
          <div class="sell-form right dInline">
            <form enctype="multipart/form-data" action="<%=path%>/ysCar/saveCarInfo" method="post" name="forms" id="forms">
              <h3>登记您的爱车信息</h3>
              <div class="sell-info" style="margin-top:5px">
                <div class="select-item clearfix">
                  <input type="file" id="carPic" name="carPic" multiple style="width:160px" class="cPut" >
                  <select class="select car-select" name="brand" id="brand" style="width:170px;margin:0 5px 0 25px">
                    <option value="">请选择品牌</option>
                    <option value="9">A 奥迪</option><option value="92">A 阿尔法·罗密欧</option><option value="97">A 阿斯顿·马丁</option><option value="184">B 保斐利</option><option value="82">B 保时捷</option><option value="127">B 别克</option><option value="163">B 北京</option><option value="14">B 北汽制造</option><option value="168">B 北汽威旺</option><option value="211">B 北汽幻速</option><option value="216">B 北汽新能源</option><option value="195">B 北汽绅宝</option><option value="59">B 奔腾</option><option value="2">B 奔驰</option><option value="3">B 宝马</option><option value="157">B 宝骏</option><option value="85">B 宾利</option><option value="172">B 巴博斯</option><option value="135">B 布加迪</option><option value="26">B 本田</option><option value="5">B 标致</option><option value="15">B 比亚迪</option><option value="221">C 成功</option><option value="129">C 昌河</option><option value="21">C 长城</option><option value="159">C 长安商用</option><option value="230">C 长安跨越</option><option value="136">C 长安轿车</option><option value="179">D DS</option><option value="29">D 东南</option><option value="27">D 东风</option><option value="235">D 东风·郑州日产</option><option value="205">D 东风小康</option><option value="215">D 东风御风</option><option value="197">D 东风风度</option><option value="141">D 东风风神</option><option value="115">D 东风风行</option><option value="8">D 大众</option><option value="106">D 大宇</option><option value="165">D 大通MAXUS</option><option value="113">D 道奇</option><option value="7">F 丰田</option><option value="91">F 法拉利</option><option value="208">F 福汽启腾</option><option value="17">F 福特</option><option value="128">F 福田</option><option value="67">F 福迪</option><option value="40">F 菲亚特</option><option value="199">F 飞驰商务车</option><option value="109">G GMC</option><option value="110">G 光冈</option><option value="147">G 广汽传祺</option><option value="63">G 广汽吉奥</option><option value="182">G 观致汽车</option><option value="44">H 华普</option><option value="112">H 华泰</option><option value="225">H 华颂</option><option value="196">H 哈弗</option><option value="31">H 哈飞</option><option value="181">H 恒天汽车</option><option value="108">H 悍马</option><option value="45">H 汇众</option><option value="170">H 海格</option><option value="32">H 海马</option><option value="149">H 海马商用车</option><option value="58">H 红旗</option><option value="52">H 黄海</option><option value="4">J Jeep</option><option value="152">J 九龙</option><option value="34">J 吉利汽车</option><option value="98">J 捷豹</option><option value="38">J 江南</option><option value="35">J 江淮</option><option value="37">J 江铃</option><option value="224">J 江铃集团轻汽</option><option value="39">J 金杯</option><option value="51">K 克莱斯勒</option><option value="220">K 凯翼</option><option value="107">K 凯迪拉克</option><option value="213">K 卡威</option><option value="188">K 卡尔森</option><option value="241">K 康迪</option><option value="150">K 开瑞</option><option value="145">K 科尼赛克</option><option value="218">K 科瑞斯的</option><option value="86">L 兰博基尼</option><option value="76">L 力帆</option><option value="80">L 劳斯莱斯</option><option value="95">L 林肯</option><option value="153">L 猎豹汽车</option><option value="166">L 理念</option><option value="146">L 莲花</option><option value="200">L 蓝海房车</option><option value="83">L 路特斯</option><option value="96">L 路虎</option><option value="16">L 铃木</option><option value="36">L 陆风</option><option value="229">L 雷丁电动</option><option value="94">L 雷克萨斯</option><option value="99">L 雷诺</option><option value="79">M MG</option><option value="81">M MINI</option><option value="93">M 玛莎拉蒂</option><option value="55">M 美亚</option><option value="183">M 迈凯伦</option><option value="88">M 迈巴赫</option><option value="18">M 马自达</option><option value="155">N 纳智捷</option><option value="104">O 欧宝</option><option value="171">O 欧朗</option><option value="84">O 讴歌</option><option value="Q1441684582">Q 亿金</option><option value="156">Q 启辰</option><option value="42">Q 奇瑞</option><option value="43">Q 庆铃</option><option value="28">Q 起亚</option><option value="30">R 日产</option><option value="142">R 瑞麒</option><option value="78">R 荣威</option><option value="89">s smart</option><option value="25">S 三菱</option><option value="137">S 世爵</option><option value="50">S 双环</option><option value="102">S 双龙</option><option value="209">S 山姆</option><option value="111">S 斯巴鲁</option><option value="10">S 斯柯达</option><option value="103">S 萨博</option><option value="169">S 陕汽通家</option><option value="54">T 天马</option><option value="202">T 泰卡特</option><option value="189">T 特斯拉</option><option value="175">T 腾势</option><option value="56">T 通田</option><option value="46">W 万丰</option><option value="132">W 五十铃</option><option value="48">W 五菱</option><option value="186">W 威兹曼</option><option value="140">W 威麟</option><option value="19">W 沃尔沃</option><option value="207">W 潍柴英致</option><option value="57">X 厦门金龙</option><option value="71">X 新凯</option><option value="65">X 新大地</option><option value="62">X 新雅途</option><option value="174">X 星客特</option><option value="13">X 现代</option><option value="87">X 西雅特</option><option value="49">X 雪佛兰</option><option value="6">X 雪铁龙</option><option value="53">Y 一汽</option><option value="47">Y 仪征</option><option value="41">Y 依维柯</option><option value="75">Y 永源</option><option value="100">Y 英菲尼迪</option><option value="138">Y 野马汽车</option><option value="33">Z 中兴</option><option value="60">Z 中华</option><option value="64">Z 中客华北</option><option value="167">Z 中欧奔驰房车</option><option value="72">Z 中顺</option><option value="77">Z 众泰</option><option value="233">Z 知豆</option></select>                                    </select>

                </div>


                <div class="select-item clearfix">
                  <input  type="text" id="carName" name="carName" placeholder="请输入车型" class="cPut" style="width:160px" />
                  <input type="text" id="carMileage" name="carMileage" placeholder="里程数"  class="cPut" id="mialval"  style="float:right" />
                  <div class="unit">万公里</div>
                </div>

                <div class="select-item clearfix">
                  <select class="select car-select" id="carDamage" name="carDamage"  style="width:175px">
                    <option value="">受损程度</option>
                    <option>0%</option>
                    <option>5%</option>
                    <option>10%</option>
                    <option>15%</option>
                    <option>20%</option>
                    <option>25%</option>
                    <option>30%</option>
                    <option>35%</option>
                    <option>40%</option>
                    <option>45%</option>
                    <option>50%</option>
                    <option>55%</option>
                    <option>60%</option>
                    <option>65%</option>
                    <option>70%</option>
                    <option>75%</option>
                    <option>80%</option>
                    <option>85%</option>
                    <option>90%</option>
                    <option>95%</option>
                    <option>100%</option>
                  </select>
                  <select class="select car-select"  name="iseager"  style="width:168px; margin:0 5px 0 25px">
                    <option value="">是否急于出售</option>
                    <option value="Y">是</option>
                    <option value="N">否</option>
                  </select>
                </div>

                <div class="select-item clearfix">
                  <input type="text" id="price" name="price" placeholder="报价" class="cPut" style="width:160px" />
                  <input type="text" id="carAge" name="carAge" placeholder="车龄" style="width:160px; margin:0 5px 0 25px" class="cPut" />
                </div>

                <div class="select-item clearfix">
                  <input  type="text" id="address" name="address" placeholder="验车地址" class="cPut" style="width:160px" />
                  <input  type="text" id="licenseAddress" name="licenseAddress" placeholder="牌照归属地" style="width:160px; margin:0 5px 0 25px" class="cPut" />
                </div>

                <div class="select-item clearfix">
                  <input id="phone" type="text" name="phone" placeholder="手机号" class="cPut" style="width:158px" />
                  <input id="msg" type="text" name="msg" placeholder="请输入验证码" style="width:159px; margin:0 5px 0 25px" class="cPut" />
                  <div id="send_Mess" class="left"><a href="#" class="send_Mess right"><b>获取验证码</b></a></div>
                </div>

                <div class="seBtn">
                  <%--<input id="input-phone" type="hidden" name="mobile" value="" />--%>
                  <%--<input id="input-verify" type="hidden" name="verify" value="" />--%>
                  <%--<a href="#showDiv" class="gj_btn">估一下价</a>--%>
                  <a href="javascript:void(0)" onclick="submitCarInfo()">提交</a>
                  <%--<input type="submit" value="提交">--%>

                </div>
              </div>
            </form>
            <input type="hidden" id="ckmobile" value="1" />

            <link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/jquery.fancybox-1.3.4.css">
            <script type="text/javascript" src="<%=path%>/resources/js/jquery.fancybox-1.3.4.js"></script>
            <script type="text/javascript">
                $(function(){
                    $(".gj_btn").live("click",function(){
                        var makeCar=$("#makeCar").val();
                        var modeCar=$("#modeCar").val();
                        var styleCar=$("#styleCar").val();
                        var buytimeval=$("#buytimeval").val();
                        var mialval=$("#mialval").val();
                        var url='/Sales/getprice';
                        if(makeCar==''){
                            alert("请选择品牌");
                            $("#makeCar").focus();
                            return false;
                        }
                        if(modeCar==''){
                            alert("请选择车系");
                            $("#modeCar").focus();
                            return false;
                        }
                        if(styleCar==''){
                            alert("请选择车型");
                            $("#styleCar").focus();
                            return false;
                        }
                        if(buytimeval==''){
                            alert("请选择日期");
                            $("#buytimeval").focus();
                            return false;
                        }
                        if(mialval==''){
                            alert("请输入里程");
                            $("#mialval").focus();
                            return false;
                        }

                        $.ajax({
                            type: "POST",
                            url: url,
                            data: {makeid:makeCar, modeid:modeCar,styleid:styleCar,buytime:buytimeval,mile:mialval},
                            dataType: "json",
                            success: function(data){
                                // alert(data);

                                $(".gj_btn").fancybox({
                                    'padding':'0',
                                    'titlePosition':'inside',
                                    'transitionIn':'elastic',
                                    'transitionOut':'elastic'
                                });
                            }
                        });
                        return false;
                    });

                })
            </script>
          </div>
        </div>
      </div>
    </div>
    <!--二手车流程-->
    <div class="sell-a">
      <div class="wrap">
        <h2>二手车须知及流程</h2>
        <div class="sa-list">
          <ul class="clearfix">
            <li>
              <img src="<%=path%>/resources/images/sell2_1.png"/>
              <h4>准备手续</h4>
              <p>
                <!-- <b>车辆手续：</b><br/>
                包括行驶证、机动车登记证、购置附加税凭证、保险单据等，主要是前面三项。
                <b>车主手续：</b><br/>
                个人准备身份证原件；单位准备公章、组织机构代码证原件（正本、副本都可）。 -->
                机动车登记证、行驶证、保养手册、身份证复印件等车辆资料
              </p>
            </li>
            <li>
              <img src="<%=path%>/resources/images/sell2_2.png"/>
              <h4>上门评估</h4>
              <p>
                可以通过电话、网络提交评估需求，我们专业评估团队会及时联系您约上门评估时间和地点。
              </p>
            </li>
            <!-- <li>
                <img src="images/sell2_3.png"/>
                <h4>亿金365项检测</h4>
                <p>
                    可以通过二手车市场、置换、网上自己出售等多种方式选择出售车辆。选择一家知名度高、信誉好的二手车企业，不仅可以简化交易流程，还可避免不必要的经济损失。
                </p>
            </li> -->
            <li>
              <img src="<%=path%>/resources/images/sell2_4.png"/>
              <h4>确定价格</h4>
              <p>
                评估师根据车况反馈评估价格，结合车主售车意愿确定车辆价格。
              </p>
            </li>
            <li class="last">
              <img src="<%=path%>/resources/images/sell2_4.png"/>
              <h4>手续办理</h4>
              <p>
                确定交易的车辆准备好相关手续，由车主本人现场签字办理相关手续。
              </p>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <div class="main-a">
      <div class="mDiv sell-b">
        <img src="<%=path%>/resources/images/sell3.jpg"/>
      </div>
    </div>
  </div>

  <style type="text/css">
    .sa-list li{width:223px;}
    #showDiv{width:800px;height:270px;background:#fff;position:relative;}
    #showDiv .s_gu{position:absolute;right:20px;bottom:15px;}
    .guBox{padding:20px 30px 0 30px;font-size:20px;}
    .guBox h3{color:#000;font-weight: normal;margin-top:30px;font-size:20px;}
    .guBox h3 strong{font-weight: bold;color:#0756b5}
    .guBox p{color:#427dc6;font-weight: bold;padding:10px 0;}
    .guBox span{font-size:14px;display:inline-block;margin-right:15px;}
    .guBox span font{font-weight: bold;color:#437ec6;font-size:14px;}
  </style>
</div>



<%@include file="footer.jsp"%>
<%--<%@include file="right.jsp"%>--%>
<%@include file="popLoginBox.jsp"%>

<script type="text/javascript" src="<%=path%>/resources/js/miniBar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/lg_reg.js"></script>
<!--<script type="text/javascript" src="js/borrow.js"></script>-->

<%--<script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>--%>
<%--<script type="text/javascript" src="<%=path%>/resources/bootstrap/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>--%>
<%--<link rel="stylesheet" type="text/css" href="<%=path%>/resources/bootstrap/css/bootstrap-datetimepicker.css">--%>
<%--<link rel="stylesheet" type="text/css" href="<%=path%>/resources/bootstrap/css/bootstrap.min.css">--%>
<script type="text/javascript">


  // fws  提交表单
  function submitCarInfo() {

      var user='${username}';

          if(user){
              var carPic=$("#carPic").val();
              var brand=$("#brand").val();
              var carName=$("#carName").val();
              var carDamage=$("#carDamage").val();
              var price=$("#price").val();
              var carAge=$("#carAge").val();
              var address=$("#address").val();
              var licenseAddress=$("#licenseAddress").val();
              var phone=$("#phone").val();
              var msg=$("#msg").val();

              if(carPic==''){
                  alert("请上传汽车图片");
                  $("#carPic").focus();
                  return false;
              }
              if(brand==''){
                  alert("请选择品牌");
                  $("#brand").focus();
                  return false;
              }
              if(carName==''){
                  alert("请选择车型");
                  $("#carName").focus();
                  return false;
              }
              if(carMileage==''){
                  alert("请选择受损程度");
                  $("#carmileage").focus();
                  return false;
              }
              if(carDamage==''){
                  alert("请选择里程数");
                  $("#carDamage").focus();
                  return false;
              }
              if(price==''){
                  alert("请输入报价");
                  $("#price").focus();
                  return false;
              }
              if(carAge==''){
                  alert("请输入车龄");
                  $("#carAge").focus();
                  return false;
              }
              if(address==''){
                  alert("请输入验车地址");
                  $("#address").focus();
                  return false;
              }
              if(licenseAddress==''){
                  alert("请输入牌照归属地");
                  $("#licenseAddress").focus();
                  return false;
              }
              if(phone==''){
                  alert("请输入手机号");
                  $("#phone").focus();
                  return false;
              }
              if(msg==''){
                  alert("请输入验证码");
                  $("#msg").focus();
                  return false;
              }
              $("#forms").submit();
          }
          else {
              $('#popBox').fadeIn();
              $('.p-tab a:first').addClass('on').siblings().removeClass('on');
              $('.p-dl:first').show().siblings().hide();
          }

  }

</script>

</body>
</html>