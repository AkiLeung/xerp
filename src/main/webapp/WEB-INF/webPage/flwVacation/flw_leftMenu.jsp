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
            $(".navLeft_div2").click(function () {
                $(this).next("div").slideToggle("slow")
                    .siblings(".navLeft_div3:visible").slideUp("slow");
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

        .navLeft_top {
            padding-top: 7px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            background-color: #eef3f3;
            border-bottom: #ccc 1px dotted;
        }

        .navLeft_div1 {
            text-align: center;
            width: 100%;
            padding-top: 0px;
        }

        .navLeft_div2 {
            height: 35px;
            line-height: 35px;
            cursor: pointer;
            font-size: 13px;
            font-weight: bold;
            position: relative;
            border-bottom: #ccc 1px dotted;
            background-color: #ededed;
        }

        .navLeft_flowMenu {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 35px;
            top: 10px;
            background: url('<%=basePath%>static/image/navmenu/1.png');
        }

        .navLeft_flowData {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 35px;
            top: 10px;
            background: url('<%=basePath%>static/image/navmenu/2.png');
        }

        .navLeft_div3 {
            display: block;
            cursor: pointer;
            font-size: 13px;

        }

        .navLeft_div3 ul {
            margin: 0;
            padding: 0;
        }

        .navLeft_div3 li a {
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
                <li>
                    <a onclick="
                            openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/draftDocument.action?flowCode=flow00002&ws=<%=ConfigConst.STR_WS_CREATE%>')">
                        起 草 申 请</a></li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toHandleList.action')">我 的 待
                    办</a></li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toMyApplyList.action')">我 的 申
                    请</a></li>
                <li>
                    <a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toAllApplyList.action')">所有的申请</a>
                </li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toUnFinishList.action')">
                    未完成申请</a></li>
                <li>
                    <a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/toIsFinishList.action')">已完成申请</a>
                </li>
            </ul>
        </div>
        <div class="navLeft_div2">
            <div class="navLeft_flowData"></div>
            数据维护
        </div>
        <div class="navLeft_div3">
            <ul>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/dataTest01.action')">数据维护1</a>
                </li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/dataTest01.action')">数据维护2</a>
                </li>
                <li><a onclick="openFlowTabToUrl('请假申请','请假申请','<%=basePath%>vacation/dataTest01.action')">数据维护3</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
<script>
    /**流程Tab撤换******************/
    function openFlowTabToUrl(tabName, ifrName, paraUrl) {
        if (paraUrl != "" && paraUrl != "null") {
            //判断选项卡是否重复打开
            if (window.top.$('#workbench').tabs('exists', tabName)) {
                window.top.$('#workbench').tabs('select', tabName);
                window.top.frames[ifrName].location.href = paraUrl;
            } else {
                window.top.$('#workbench').tabs('add', {
                    id: tabName,
                    title: tabName,
                    content: '<iframe id="' + ifrName + '" name="' + ifrName + '" scrolling="no" frameborder="0"  ' +
                        'src="' + paraUrl + '" style="width:100%;height:100%;"></iframe>',
                    closable: true
                });
            }
        }
    }
</script>