<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String headerPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<link rel="stylesheet" href="<%=headerPath%>static/easyui/themes/<shiro:principal property="theme"/>/easyui.css" type="text/css" />
<link rel="stylesheet" href="<%=headerPath%>static/easyui/themes/icon.css" type="text/css"/>
<link rel="stylesheet" href="<%=headerPath%>static/easyui/themes/color.css" type="text/css"/>
<script type="text/javascript" src="<%=headerPath%>static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=headerPath%>static/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="<%=headerPath%>static/css/baseSheet.css" type="text/css"/>
<script type="text/javascript" src="<%=headerPath%>static/javascript/common.js"></script>
