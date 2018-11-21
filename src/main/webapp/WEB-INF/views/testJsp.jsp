<%--
  Created by IntelliJ IDEA.
  User: FWS
  Date: 2018/4/17
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/" + "resources/";
%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>
</head>
<body>

    <p>  seesion: ${test1}</p><br>
     <p>  seesion: <%=session.getAttribute("test1")%></p><br>
    <p>  sessionScope: ${sessionScope.test1}</p><br>

    <p>  username: ${sessionScope.username}</p><br>


    <p>----------------------------------------------------------</p>


    <form  onsubmit="return testSeesion();" enctype="multipart/form-data" method="post" name="form" id="form">

    </form>
    <form onsubmit="return testSeesion();" method="post"  >
        <input type="submit" value="测i">
    </form>
  //  <button type="button" onclick="testSeesion()" value="测试" > </button>


    <script type="text/javascript">

        function testSeesion() {
            $.ajax({
                type:"post",
                url:"http://localhost:8080/testSession1",
                dataType:"json",
                contentType: "application/json",
                data:{},
//            data:JSON.stringify(Data),
                success:function(data){
                    alert(JSON.stringify(data));

                }
            });
        }
    </script>
</body>
</html>
