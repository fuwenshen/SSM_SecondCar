<%--
  Created by IntelliJ IDEA.
  User: FWS
  Date: 2018/3/18
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="popBox">
    <div class="popCont"><a class="p_closed">关闭</a>
        <div class="p-tab"><a>会员登录<i></i></a><a>会员注册<i></i></a></div>
        <div class="p-detail">
            <%--登录--%>
            <div class="p-dl">
                <form  onsubmit="return login(); "enctype="multipart/form-data" method="post" name="form" id="form">
                <%--<form action="/ysCar/member/login" enctype="multipart/form-data" method="post" name="form" id="form">--%>
                    <ul class="login-items">
                        <li>
                            <label>用户名(邮箱)</label>
                            <input class="input" type="text" value="" maxlength="32" name="email"
                                   placeholder="请输入您的邮箱">
                        </li>
                        <li>
                            <label>密码</label>
                            <input class="input" type="password" value="" maxlength="16" name="password">
                        </li>
                    </ul>
                    <div class="login-check">
                        <input type="checkbox" name="checkbox" style=" width:auto;"/>
                        <label>记住我</label>
                        <a href="../../../Meet/editPass">忘记登录密码？</a></div>
                    <div class="login-button">
                        <input type="hidden" value="" name="carid" class="ordercarid"/>
                        <input type="hidden" value="" name="carstatus" class="orderstatus"/>
                        <input type="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" class="fM" onclick="loginF()"/>
                    </div>

                </form>
            </div>

            <%--注册  onsubmit="return regcheck();"--%>
            <div class="p-dl">
                <form class="registForm" onsubmit="return regist();" enctype="multipart/form-data" method="post"
                      name="reg" id="reg">
                    <ul class="login-items">
                        <li class="clearfix">
                            <input class="input" name="mobile" id="mobile" type="text" value=""
                                   placeholder="手机号码（登录帐号）">
                        </li>
                        <li class="clearfix">
                            <input class="input left" type="text"id="verify" name="verify" placeholder="输入验证码"
                                   style="width:100px;"/>
                            <div id="send"><a href="#" class="send_code right">获取验证码</a></div>
                        </li>
                        <li class="clearfix">
                            <input class="input" name="email" id="email" type="text" value=""
                                   placeholder="邮箱（必填）">
                        </li>
                        <li class="clearfix">
                            <input class="input" type="text" id="username" name="username" placeholder="姓名">
                        </li>
                        <%--<li class="clearfix sex">--%>
                            <%--<input type="radio" checked="" name="gender" value="M"/>--%>
                            <%--男&nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <%--<input type="radio" name="gender" value="F"/>--%>
                            <%--女--%>
                        <%--</li>--%>
                        <li class="clearfix">
                            <input id="password" class="input" type="password" name="password" value=""
                                   placeholder="输入密码（六位字符）">
                        </li>
                    </ul>
                    <div class="login-button">
                        <input type="submit" value="立即注册" class="fM"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="application/javascript">

    var yz=/\S{6,}/;
    var m=/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
    var mail=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    // 注册
    function regist(){

        var mobile=$('#mobile').val();//手机号
        var ver=$("#verify").val();//验证码
        var username=$("#username").val();//姓名
        var email=$("#email").val();//邮箱
        var password=$("#password").val()//密码

        var url='<%=path%>/ysCar/member/register';
        if(mobile==''){
            alert("手机不能为空");
            reg.mobile.focus();
            return false;
        }
        if(!m.exec(mobile)){
            alert("手机号格式不正确");
            reg.mobile.focus();
            return false;
        }
        if(ver==''){
            alert("验证码不能为空");
            reg.verify.focus();
            return false;
        }
        if(email==''){
            alert("邮箱不能为空");
            reg.email.focus();
            return false;
        }
        if(!mail.exec(email)){
            alert("邮箱号格式不正确");
            reg.email.focus();
            return false;
        }
        if(username==''){
            alert("用户名不能为空");
            reg.username.focus();
            return false;
        }
        if(password==''){
            alert("密码不能为空");
            reg.password.focus();
            return false;
        }
        if(!yz.exec(password)){
            alert("密码格式不正确");
            reg.password.focus();
            return false;
        }
        var Data ={"phone":mobile, "password":password,"username":username,"password":password ,"email":email};
        $.ajax({
            type: "POST",
            url: url,
            contentType: "application/json",
            data:JSON.stringify(Data),
            success: function(data){
                if(data.status==1) {
                    alert(data.desc)
                    $('#popBox').fadeOut();// 登录框隐藏
                }else {
                    alert(data.desc)
                }
            }
        });
        return false;
    }



//  登陆
    function login(){

        var user=form.email.value;
        var pass=form.password.value;
        var check=form.checkbox.value;

        if(user==''){
            alert("登录名不能为空");
            form.email.focus();
            return false;
        }
        if(pass==''){
            alert("密码不能为空");
            form.password.focus();
            return false;
        }
        var url='<%=path%>/ysCar/member/checklogin';
        var Data ={"email":user, "password":pass,"checkbox":check};
        $.ajax({
            type:"post",
            url: url,
            dataType:"json",
            contentType: "application/json",
            data:JSON.stringify(Data),
            success:function(data){
              // alert(JSON.stringify(data));
                if(data.status==1){
                    $('#popBox').fadeOut();// 登录框隐
                    location.reload();
                }
            }
        });


    }
    //测试
    function loginF() {
        $('#form').submit()
    }


</script>
