<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.xerp.common.consts.ConfigConst" %>
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
<div class="navLeft">
    <div class="navLeft_div1">
        <div class="navLeft_top">
            <img src="<%=basePath%>static/image/navmenu/bbb_01.jpg" width="25px" height="25px">
            <img src="<%=basePath%>static/image/navmenu/bbb_02.jpg" width="25px" height="25px">
            <img src="<%=basePath%>static/image/navmenu/bbb_03.jpg" width="25px" height="25px">
            <img src="<%=basePath%>static/image/navmenu/bbb_04.jpg" width="25px" height="25px">
        </div>
        <div class="navLeft_div2">
            <div class="navLeft_flowMenu"></div>
            请假申请
        </div>
        <div class="navLeft_div3">
            <ul>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/draftDocument.action?flowCode=flow00002')">起 草 申 请</a></li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toHandleList.action')">我 的 待 办</a></li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toMyApplyList.action')">我 的 申 请</a></li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toAllApplyList.action')">所有的申请</a></li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toUnFinishList.action')">未完成申请</a></li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toIsFinishList.action')">已完成申请</a></li>
            </ul>
        </div>
        <div class="navLeft_div2">
            <div class="navLeft_flowData"></div>
            数据维护
        </div>
        <div class="navLeft_div3">
            <ul>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/dataTest01.action')">数据维护1</a></li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/dataTest01.action')">数据维护2</a></li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/dataTest01.action')">数据维护3</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $(".navLeft_div2").click(function () {
            $(this).next("div").slideToggle("slow")
                .siblings(".navLeft_div3:visible").slideUp("slow");
        });
    });
</script>