<%--
  Created by IntelliJ IDEA.
  User: FWS
  Date: 2018/3/18
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="miniBus" style="right:-270px;">
    <div class="mini-bar">
        <div class="mini-barlist">
            <ul>
                <li class="miItem">
                    <div class="mini-mi browse"><i class="mini-ease"></i> <code></code> <span>最近浏览</span></div>
                </li>
                <li class="miItem">
                    <div class="mini-mi collec"><i class="mini-ease"></i> <code></code> <span>我的收藏</span></div>
                </li>
                <li>
                    <div class="mini-mi service"><i class="mini-ease" id="BizQQWPA"></i> <code></code> <span>在线客服</span>
                    </div>
                </li>
                <li class="callItem">
                    <div class="mini-mi callback"><i class="mini-ease"></i> <code></code> <span>意见反馈</span></div>
                </li>
                <li class="miItem">
                    <div class="mini-mi shopping"><i class="mini-ease"></i> <code></code> <span>对比车辆</span> <abbr
                            id="Dbnumber">0</abbr></div>
                </li>
            </ul>
        </div>
        <a class="mini-gotop"></a> <a class="wx1"><img src="<%=path%>/resources/images/wx_1.png"></a>
        <div class="wmImg hide"><img src="<%=path%>/resources/images/wx_2.png"></div>
    </div>
    <div class="mini-cont">
        <div class="mini-contlist">
            <div class="mini-ni">
                <div class="mini-h clearfix"><a class="mini-close mini-ease lf-fl"></a> <span
                        class="lf-fr"><code>最近浏览</code></span></div>
                <div class="miList" id="Liulan">
                    <ul>
                    </ul>
                </div>
            </div>
            <div class="mini-ni">
                <div class="mini-h clearfix"><a class="mini-close mini-ease lf-fl"></a> <span
                        class="lf-fr"><code>我的收藏</code></span></div>
                <div class="miList" id="shoucang">
                    <ul>
                    </ul>
                    <a href="javascript:void(0)" class="mini-fav b-login">查看更多收藏</a></div>
            </div>
            <!--<div class="mini-ni">
                      <div class="mini-h clearfix">
                          <a class="mini-close mini-ease lf-fl"></a>
                          <span class="lf-fr"><code>在线客服</code></span>
                      </div>
                  </div>-->
            <div class="mini-ni" id="shopping">
                <div class="mini-h clearfix"><a class="mini-close mini-ease lf-fl"></a> <span
                        class="lf-fr"><code>对比车辆</code></span> <span class="lf-fr"
                                                                     style="margin:auto 10px; font-size:26px; font-weight:bolder"
                                                                     id="deletealldb"><a><code>×</code></a></span></div>
                <div class="miList" id="Carduibi">
                    <ul>
                    </ul>
                    <a href="#" class="mini-fav">立即对比</a></div>
            </div>
        </div>
    </div>
    <div class="lf-view" id="lf-view">
        <form onsubmit="return Lmessage();" enctype="multipart/form-data" method="post" name="leaveMess" id="leaveMess">
            <b>您对我们的看法~</b>
            <div>
                <textarea placeholder="您的声音对我们很重要哟(必填)~" name="bankAuthSrc"></textarea>
            </div>
            <div><a id="viewSubmit" onclick="$('#leaveMess').submit()"></a>
                <input type="text" placeholder="请留下您的手机号码(必填)" id="viewAbout" name="mobile"/>
            </div>
        </form>
        <a id="viewClose"></a> <i id="viewIcon"></i>
        <p id="viewSign"></p>
    </div>
</div>