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
    <script type="text/javascript">
        $(document).ready(function () {
            $(".div2").click(function () {
                $(this).next("div").slideToggle("slow")
                    .siblings(".div3:visible").slideUp("slow");
            });
        });
    </script>
    <style>
        .navLeft {
            width: 99.9%;
            height: 100%;
            border: 0px solid #CCCCCC;
            color: #000000;
            font-size: 14px;
            text-align: center;
        }

        .left_top {
            height: 40px;
            line-height: 40px;
            text-align: center;
            background-color: #ededed;
            border-bottom: #ccc 1px dotted;
        }

        .div1 {
            text-align: center;
            width: 100%;
            padding-top: 0px;
        }

        .div2 {
            height: 40px;
            line-height: 40px;
            cursor: pointer;
            font-size: 13px;
            font-weight: bold;
            position: relative;
            border-bottom: #ccc 1px dotted;
            background-color: #ededed;
        }

        .flowMenu {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url('<%=basePath%>static/image/navmenu/1.png');
        }

        .flowData {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url('<%=basePath%>static/image/navmenu/2.png');
        }

        .div3 {
            display: block;
            cursor: pointer;
            font-size: 13px;

        }

        .div3 ul {
            margin: 0;
            padding: 0;
        }

        .div3 li a {
            height: 30px;
            line-height: 30px;
            list-style: none;
            border-bottom: #ccc 2px dotted;
            text-align: center;
        }
    </style>
</head>
<body id="bg">
<div class="navLeft">
    <div class="div1">
        <div class="left_top">
            <img src="<%=basePath%>static/image/navmenu/bbb_01.jpg" width="30px" height="30px">
            <img src="<%=basePath%>static/image/navmenu/bbb_02.jpg" width="30px" height="30px">
            <img src="<%=basePath%>static/image/navmenu/bbb_03.jpg" width="30px" height="30px">
            <img src="<%=basePath%>static/image/navmenu/bbb_04.jpg" width="30px" height="30px">
        </div>
        <div class="div2">
            <div class="flowMenu"></div>
            请假申请
        </div>
        <div class="div3">
            <ul>
                <li><a onclick="openFlowTabToUrl('<%=basePath%>vacation/draftDocument.action?flowCode=flow00002&ws=<%=ConfigConst.STR_WS_CREATE%>')">起 草 申 请</a></li>
                <li><a onclick="openFlowTabToUrl('<%=basePath%>vacation/toHandleList.action')">我 的 待 办</a></li>
                <li><a onclick="openFlowTabToUrl('<%=basePath%>vacation/myApplyList.action')">我 的 申 请</a></li>
                <li><a onclick="openFlowTabToUrl('<%=basePath%>vacation/allApplyList.action')">所有的申请</a></li>
                <li><a onclick="openFlowTabToUrl('<%=basePath%>vacation/unFinishList.action')"> 未完成申请</a></li>
                <li><a onclick="openFlowTabToUrl('<%=basePath%>vacation/isFinishList.action')">已完成申请</a></li>
            </ul>
        </div>
        <div class="div2">
            <div class="flowData"></div>
            数据维护
        </div>
        <div class="div3">
            <ul>
                <li><a onclick="openFlowTabToUrl('<%=basePath%>vacation/mainForm.action')">数据维护1</a></li>
                <li><a onclick="openFlowTabToUrl('<%=basePath%>vacation/xxxxxxxxx.action')">数据维护2</a></li>
                <li><a onclick="openFlowTabToUrl('<%=basePath%>vacation/xxxxxxxxx.action')">数据维护3</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
<script>
    //页面切换
    function openFlowTabToUrl(paraUrl) {
        if (paraUrl != "" && paraUrl != "null") {
            var url = paraUrl;
            if (url != "") {
                var tabName = '请假申请';
                var ifrName = '请假申请';
                //判断选项卡是否重复打开
                if (window.top.$('#workbench').tabs('exists', tabName)) {
                    window.top.$('#workbench').tabs('select', tabName);
                    window.top.frames[ifrName].location.href = paraUrl;
                } else {
                    window.top.$('#workbench').tabs('add', {
                        id: tabName,
                        title: tabName,
                        content: '<iframe id="' + ifrName + '" name="' + ifrName + '" scrolling="no" frameborder="0"  ' +
                            'src="' + url + '" style="width:100%;height:100%;"></iframe>',
                        closable: true
                    });
                }
            }
        }
    }
</script>