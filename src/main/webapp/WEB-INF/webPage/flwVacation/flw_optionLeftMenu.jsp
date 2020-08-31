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
    <script type="text/javascript">
         $(document).ready(function () {
             $(".div2").click(function () {
                 $(this).next("div").slideToggle("slow")
                     .siblings(".div3:visible").slideUp("slow");
             });
         });
    </script>
    <style>
        /*body {*/
            /*margin: 0;*/
            /*font-family: 微软雅黑;*/
        /*}*/
        .left {
            width: 99.8%;
            height: 100%;
            border-right: 1px solid #CCCCCC;
            color: #000000;
            font-size: 14px;
            text-align: center;
        }

        .div1 {
            text-align: center;
            width: 100%;
            padding-top: 10px;
        }

        .div2 {
            height: 40px;
            line-height: 40px;
            cursor: pointer;
            font-size: 13px;
            position: relative;
            border-bottom: #ccc 1px dotted;
        }

        .flowMenu {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url('<%=basePath%>static/image/navmenu/1.png');
        }

        <%--.xwzx {--%>
            <%--position: absolute;--%>
            <%--height: 20px;--%>
            <%--width: 20px;--%>
            <%--left: 40px;--%>
            <%--top: 10px;--%>
            <%--background: url('<%=basePath%>static/image/navmenu/2.png');--%>
        <%--}--%>

        <%--.zxcp {--%>
            <%--position: absolute;--%>
            <%--height: 20px;--%>
            <%--width: 20px;--%>
            <%--left: 40px;--%>
            <%--top: 10px;--%>
            <%--background: url('<%=basePath%>static/mage/navmenu/4.png');--%>
        <%--}--%>

        <%--.lmtj {--%>
            <%--position: absolute;--%>
            <%--height: 20px;--%>
            <%--width: 20px;--%>
            <%--left: 40px;--%>
            <%--top: 10px;--%>
            <%--background: url('<%=basePath%>static/image/navmenu/8.png');--%>
        <%--}--%>

        .div3 {
            display: block; /*none*/
            cursor: pointer;
            font-size: 13px;
        }

        .div3 ul {
            margin: 0;
            padding: 0;
        }

        .div3 li {
            height: 30px;
            line-height: 30px;
            list-style: none;
            border-bottom: #ccc 1px dotted;
            text-align: center;
        }
    </style>
</head>
<body id="bg">
<div class="left">
    <div class="div1">
        <div class="left_top">
            <img src="<%=basePath%>static/image/navmenu/bbb_01.jpg">
            <img src="<%=basePath%>static/image/navmenu/bbb_02.jpg" id="2">
            <img src="<%=basePath%>static/image/navmenu/bbb_03.jpg">
            <img src="<%=basePath%>static/image/navmenu/bbb_04.jpg">
        </div>
        <div class="div2">
            <div class="flowMenu"></div>
             流程申请
        </div>
        <div class="div3">
            <ul>
                <li> 起草申请</li>
                <li> 我的申请</li>
                <li> 未完成申请</li>
                <li> 已完成申请</li>
                <li> 所有的申请</li>
            </ul>
        </div>
        <div class="div2" style="display: none">
            <div class="xwzx"></div>
            新闻中心
        </div>
        <div class="div3" style="display: none">
            <ul>
                <li> 管理文章</li>
                <li> 文章分类</li>
                <li> 添加文章</li>
            </ul>
        </div>
        <div class="div2" style="display: none">
            <div class="zxcp"></div>
            最新产品
        </div>
        <div class="div3" style="display: none">
            <ul>
                <li>图片管理</li>
                <li> 图片分类</li>
                <li> 添加图片</li>
            </ul>
        </div>
        <div class="div2" style="display: none">
            <div class="lmtj"></div>
            栏目添加
        </div>
        <div class="div3" style="display: none">
            <ul>
                <li> 文章系统</li>
                <li> 图片系统</li>
                <li> 添加表单</li>
                <li> 招聘系统</li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>