<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>default left menu</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
    <link rel="stylesheet" href="<%=basePath%>static/css/leftMenu.css" type="text/css"/>
    <script type="text/javascript">
        //获取门户名称
        $.ajax({
            async: true,
            type: 'get',
            url: "<%=basePath %>sysConfig/user/listByUuid.action?uuid=<shiro:principal property="uuid"/>",
            dataType: 'json',
            success: function (user) {
                $.ajax({
                    async: false,
                    type: 'get',
                    url: "<%=basePath %>sysConfig/portal/listByUuid.action?uuid="+user.portalUuid,
                    dataType: 'json',
                    success: function (data) {
                        $("#portalName").text(data.portalName);
                    }
                });
            }
        });
    </script>
</head>
<body class="panel" topmargin="0" leftmargin="0" style="text-align:left">
<div id="body">
    <ul id="menu">
        <li class="l1"><a href="javascript:void(0);" id="M01"><span id="portalName" name="portalName">門戶菜單</span></a></li>
        <ul id="M01D" style="display:block" class="U1">
            <li style="height: 665px">
                <iframe id="ifrSysMenuTree" name="ifrSysMenuTree"
                        src="<%=basePath %>sysFrame/menuOption.action" width="100%"
                        height="100%"
                        frameborder="0"></iframe>
            </li>
        </ul>
    </ul>
</div>
<div id="bottom"></div>
</body>
</html>
