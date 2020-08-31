<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body id="bg">
<div id="menuAccordion"></div>
<ul>
    <li><A class="hover" href="#">请假申请</A></li>
    <li><A href="#">起草申请</A></li>
    <li><A href="#">我的申请</A></li>
    <li><A href="#">未完成申请</A></li>
    <li><A href="#">已完成申请</A></li>
    <li><A href="#">所有的申请</A></li>
</ul>
</body>
</html>