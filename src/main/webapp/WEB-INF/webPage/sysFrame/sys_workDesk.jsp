<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>workDesk</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
    <link rel="stylesheet" href="<%=basePath%>static/easyui/portal.css" type="text/css"/>
    <script type="text/javascript" src="<%=basePath%>static/easyui/jquery.portal.js"></script>
    <script>
        $(function () {
            $('#portal').portal({
                border: false,
                fit: true
            });
        });
    </script>
</head>
<body>
<div id="body" style="background: #0092DC url('<%=basePath%>static/image/main-bg1.gif');height: 870px">
    <div id="portal" style="position:relative;height: 100%">
        <div style="width:30%;">
            <div id="div11" title="test11" collapsible="true" closable="false"
                 style="background:#f2fddb;height:260px;padding:2px;">
                123
            </div>
            <div id="div12" title="div12" collapsible="true" closable="false"
                 style="background:#f2fddb;height:260px;padding:2px;">
                222
            </div>
            <div id="div13" title="div13" collapsible="true" closable="false"
                 style="background:#f2fddb;height:300px;padding:2px;">
                333
            </div>
        </div>
        <div style="width:50%;">
            <div id="div21" title="test21" collapsible="true" closable="false" style="background:#f2fddb;height:300px;">
                22222222
            </div>
            <div id="div22" title="test22" collapsible="true" closable="false" style="background:#f2fddb;height:529px;">
                333333333
            </div>
        </div>
        <div style="width:20%;">
            <div id="div31" title="test31" iconCls="icon-search" collapsible="true" closable="false" style="background:#f2fddb;height:230px;padding:1px;">
                3333333333
            </div>
            <div id="div32" title="test32" collapsible="true" closable="false" style="background:#f2fddb;height:238px;text-align:center;">
                3333333333
            </div>
            <div id="div33" title="test33" collapsible="true" closable="false" style="background:#f2fddb;height:350px;text-align:center;">
                3333333333
            </div>
        </div>
    </div>
</div>
</body>
</html>
