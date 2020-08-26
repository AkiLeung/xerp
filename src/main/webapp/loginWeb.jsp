<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="xerp.system.login"></spring:message></title>
    <link href="static/loginTheme/styleDefault/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="login">
    <form action="${basePath}system.action" method="post">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${basePath}static/image/language.png" alt="language"/>
        <a href="<%=basePath%>zh.action" style="color: white;font-weight: bold;font-size: 12px">
            <spring:message code="xerp.system.language.zh"/></a> |
        <a href="<%=basePath%>en.action" style="color: white;font-weight: bold;font-size: 12px">
            <spring:message code="xerp.system.language.en"/></a>
        <div class="logos"></div>
        <div class="login_form">
            <div class="user">
                <input class="text_value" value="${requestScope.userCode}" name="userCode" type="text"
                       id="userCode"/>
                <input class="text_value" value="${requestScope.password}" name="password" type="password"
                       id="password"/>
            </div>
            <button class="button" id="submit" name="submit" type="submit"></button>
        </div>
    </form>
</div>
</body>
</html>
<script>
    //提示用戶/密碼錯誤
    var loginFailure = "${login}";
    if (loginFailure.trim() != "") {
        alert("<spring:message code="xerp.system.login.failure"></spring:message>");
    }
    //开发用
    //document.getElementById("submit").click();
</script>