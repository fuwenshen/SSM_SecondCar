<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/" + "resources/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.2.min.js"></script>


</head>
<body>

<form action ="/testSession2">
    <input type="submit" value="testSession2"/>
</form>



<form name="serForm" action="/fileUpload" method="post"  enctype="multipart/form-data">
    <h1>采用流的方式上传文件</h1>
    <input type="file" name="file" multiple>
    <input type="submit" value="upload"/>
</form>

<form name="Form2" action="/fileUpload2" method="post"  enctype="multipart/form-data">
    <h1>采用multipart提供的file.transfer方法上传文件</h1>
    <input type="file" name="file" multiple>
    <input type="submit" value="upload"/>
</form>

<form name="Form2" action="/springUpload" method="post"  enctype="multipart/form-data">
    <h1>使用spring mvc提供的类的方法上传文件</h1>
    <input type="file" name="file">
    <input type="submit" value="upload"/>
</form>


</body>
</html>