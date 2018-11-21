<%--
  Created by IntelliJ IDEA.
  User: FWS
  Date: 2018/3/18
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript" src="<%=path%>/resources/js/lg_reg.js"></script>
<script type="text/javascript">
    //add fws
    window.onload=function(){
        var username=null;
        <% if (session.getAttribute("username")!=null) {%>
         var username="<%=session.getAttribute("username")%>";
        // 登陆成功  ，  移除 检验登陆 功能！ ，生成超链接
        $("#MemberMenuChange").removeClass();
        $("#MemberMenuChange").attr("href","<%=path%>/ysCar/member/memberVip");
        <%}%>

        //on 事件  对应的页面
        var page=${page};
        switch (page){
            case 1:
                $("#1").addClass("on");
                break;
            case 2:
                $("#2").addClass("on");
                break;
            case 3:
                $("#3").addClass("on");
                break;
            case 4:
                $("#4").addClass("on");
                break;
            default :
                $("#MemberMenuChange").addClass("on");

        }

       // alert(username);
        // 登陆按钮隐藏
        if(username != null){
            $("#rightMenuHtml").hide();
            $("#userName").show();
        }

    }


</script>


<div id="header">
    <div class="top">
        <div class="wrap clearfix"> <a href="#" class="logo left"><img src="<%=path%>/resources/images/cLogo.png"/></a>
            <div class="nav left dInline" id="headerMenu">
                <a id="1"  href="<%=path%>/ysCar/index">首页</a>
                <a id="2"  href="<%=path%>/ysCar/about">关于源深</a>
                <a id="3"  href="<%=path%>/ysCar/buyCar">我要买车</a>
                <a id="4"  href="<%=path%>/ysCar/sellCar">我要卖车</a>
                <%--<   href="<%=path%>/ysCar/member/memberVip"--%>
                <a  id="MemberMenuChange" class="b-login">会员中心</a>
            </div>
            <span class="right" id="rightMenuHtml">
				<a href="#" class="b-login" id="b-login">登录</a>|<a href="#" id="b-regist">注册</a>|&nbsp;&nbsp;&nbsp;&nbsp;<img
                    src="<%=path%>/resources/images/tel.png"/>
            </span>
            <span class="right" id="userName" style="display:none">
            <a href="<%=path%>/ysCar/member/memberVip">${username}</a>|<a href="#" id="logout">退出</a>|&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=path%>/resources/images/tel.png"/>
			</span>
        </div>
    </div>
    <div class="head-search">
        <div class="wrap clearfix">
            <div class="yjxj clearfix left" >
                <form  action="${ctx}/ysCar/buyCar" method="post" >
                <input type="text" name="keyword" placeholder="请输入您想要的品牌、车系或车辆编号搜索" class="left" />
                <input type="submit" value="搜 索" class="right" />
                </form>
            </div>
            <div class="hotWords left dInline"> 热门品牌：
                <a href="${ctx}/ysCar/buyCar?keyword=奥迪">奥迪</a>
                <a href="${ctx}/ysCar/buyCar?keyword=宝马">宝马</a>
                <a href="${ctx}/ysCar/buyCar?keyword=奔驰">奔驰</a>
                <a href="${ctx}/ysCar/buyCar?keyword=大众">大众</a>
                <a href="${ctx}/ysCar/buyCar?keyword=本田">本田</a>
            </div>
        </div>
    </div>
</div>

 add by fws
<script type="text/javascript">


    $('#login').click(function(){
        var idd=$(this).attr('id');
        if(idd){
            var strs=idd.split("_");
            $('.orderstatus').val(strs[0]);
            $('.ordercarid').val(strs[1]);
        }else{
            $('.ordercarid').val('');
        }
        $('#popBox').fadeIn();
        $('.p-tab a:first').addClass('on').siblings().removeClass('on');
        $('.p-dl:first').show().siblings().hide();
    })

    //退出登陆
$('#logout').click(function(){
    <%--<%session.invalidate();%>--%>
    alert('退出成功!');
    window.location.href='<%=path%>/ysCar/member/logout';
})


</script>
