<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><spring:message code="xerp.system.name"></spring:message></title>
    <jsp:include page="../include/common.jsp" flush="true"/>
    <link rel="stylesheet" href="<%=basePath%>static/css/headerStyle.css" type="text/css"/>
</head>
</head>
<body id="layOut" class="easyui-layout">
<div id="layOutNorth" data-options="iconCls:'icon-man',region:'north',split:false,title:'',border:false,collapsed:false"
     style="height: 52px; background-color: #CEDEF2;">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".def-nav,.info-i").hover(function () {
                $(this).find(".pulldown-nav").addClass("hover");
                $(this).find(".pulldown").show();
            }, function () {
                $(this).find(".pulldown").hide();
                $(this).find(".pulldown-nav").removeClass("hover");
            });
        });
    </script>
    <div class="hd-main clearfix" id="header" style="position:fixed;z-index:99999;width:100%">
        <span class="logo"></span>
        <div class="navs">
            <a class="def-nav" href="">主页</a>
            <span class="separate"></span>
            <div class="def-nav current has-pulldown-special" style="z-index:99999;">
                <a class="pulldown-nav" href=""><em class="f-icon"></em>办公1</a>
                <div class="pulldown app-url" style="z-index:99999;">
                    <div class="content">
                        <a class="li disk" href=""><span class="icon"></span><span class="text">功能11</span></a>
                        <a class="li tongxunlu" href=""><span class="icon"></span><span class="text">功能12</span></a>
                        <a class="li xiangce" href=""><span class="icon"></span><span class="text">功能13</span></a>
                        <a class="li wenzhang" href=""><span class="icon"></span><span class="text">功能14</span></a>
                        <a class="li note" href=""> <span class="icon"></span><span class="text">功能15</span></a>
                        <a class="li duanxin" href=""><span class="icon"></span><span class="text">功能16</span></a>
                        <a class="li zhaohui" href=""><span class="icon"></span><span class="text">功能17</span></a>
                        <a class="li youxi" href=""><span class="icon"></span><span class="text">功能18</span></a>
                        <a class="li jiankang" href=""><span class="icon"></span><span class="text">功能19</span></a>
                    </div>
                </div>
            </div>
            <span class="separate"></span>
            <div class="def-nav current has-pulldown-special" style="z-index:99999;">
                <a class="pulldown-nav" href=""><em class="f-icon"></em>办公2</a>
                <div class="pulldown app-url" style="z-index:99999;">
                    <div class="content">
                        <a class="li disk" href=""><span class="icon"></span><span class="text">功能21</span></a>
                        <a class="li tongxunlu" href=""><span class="icon"></span><span class="text">功能22</span></a>
                        <a class="li xiangce" href=""><span class="icon"></span><span class="text">功能23</span></a>
                        <a class="li wenzhang" href=""><span class="icon"></span><span class="text">功能24</span></a>
                        <a class="li note" href=""> <span class="icon"></span><span class="text">功能25</span></a>
                        <a class="li duanxin" href=""><span class="icon"></span><span class="text">功能26</span></a>
                        <a class="li zhaohui" href=""><span class="icon"></span><span class="text">功能27</span></a>
                        <a class="li youxi" href=""><span class="icon"></span><span class="text">功能28</span></a>
                        <a class="li jiankang" href=""><span class="icon"></span><span class="text">功能29</span></a>
                    </div>
                </div>
            </div>
            <a class="def-nav" href="">应用</a>
        </div>
        <div class="info">
            <ul>
                <li class="info-i user-name has-pulldown">
                    <em class="f-icon pull-arrow"></em>
                    <span class="userInfo"></span>
                    <span class="name top-username"><shiro:principal property="userName"/></span>
                    <div class="pulldown user-info">
                        <em class="arrow"></em>
                        <div class="content">
                            <span class="li"><a href="">个人资料</a></span>
                            <span class="li"><a href="">XXXXXXX</a></span>
                            <span class="li"><a href="">XXXXXXX</a></span>
                            <span class="li"><a href="">XXXXXXX</a></span>
                            <span class="separate-li no-height"></span>
                            <span class="li"><a href="${basePath}logout.action" id="signout">退出</a></span>
                        </div>
                    </div>
                </li>
                <li class="info-i default-text">
                    <a class="notice" href="" id="notificationTrigger">通知</a>
                    <em class="f-icon notice-nu" id="noticeNoParent">
                        <b class="f-icon" id="noticeNo">0</b>
                    </em>
                </li>
                <li class="info-i no-separate default-text has-pulldown">
                    <em class="f-icon pull-arrow"></em>
                    <span class="more" hideFocus="hideFocus">更多..</span>
                    <div class="pulldown more-info">
                        <em class="arrow"></em>
                        <div class="content">
                            <span class="separate-li no-height"></span>
                            <span class="li"><a href="">收藏工具</a></span>
                            <span class="li"><a href="">历史记录</a></span>
                            <span class="li"><a href="">版本更新</a></span>
                            <span class="li"><a href="">帮助中心</a></span>
                            <span class="li"><a href="">问题反馈</a></span>
                            <span class="li"><a href="">服务协议</a></span>
                            <span class="li"><a href="">权利声明</a></span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div data-options="region:'west',iconCls:'icon-more',split:true,title:'<spring:message code="xerp.common.navMenu"></spring:message>'"
     style="width: 240px; padding: 0px;">
    <div id="Tabs" class="easyui-tabs"
         data-options="fit:true,border:false,plain:true"
         style="background-color: #CEDEF2">
        <div id="tab01" title="tab01" data-options="title:'Menu List',tools:'#menu-tools01'"
             style="padding: 1px;cursor:pointer">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <iframe id="ifrSysLeft01" name="ifrSysLeft01"
                        src="<%=basePath %>sysFrame/leftMenu.action" width="100%" height="100%"
                        frameborder="0"></iframe>
            </div>
        </div>
        <div id="tab02" title="tab02" data-options="title:'Current Option',tools:'#menu-tools02'"
             style="padding: 1px;cursor:pointer">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <iframe id="ifrSysLeft02" name="ifrSysLeft02"
                        src="<%=basePath %>sysFrame/leftMenu.action" width="100%" height="100%"
                        frameborder="0"></iframe>
            </div>
        </div>
    </div>
    <div id="menu-tools01">
        <a href="javascript:void(0)" class="icon-mini-refresh"
           onclick="javascript:ifrSysLeft01.window.location.reload();"></a>
    </div>
    <div id="menu-tools02">
        <a href="javascript:void(0)" class="icon-mini-refresh"
           onclick="javascript:ifrSysLeft02.window.location.reload();"></a>
    </div>
</div>
<div data-options="region:'center',iconCls:'icon-tip',title:''">
    <div id="workbench" name="workbench" class="easyui-tabs" data-options="tools:'#tab-tools'"
         style="width: 100%;height: 100%">
        <div id="myCalendar" name="myCalendar" title="我的日程">
            <iframe id="ifrSysCalendar" name="ifrSysCalendar"
                    src="http://www.baidu.com" width="100%" height="100%" frameborder="0"></iframe>
        </div>
        <div id="myDesk" name="myDesk" title="系统首页">
            <iframe id="ifrSysMain" name="ifrSysMain"
                    src="<%=basePath %>sysFrame/workDesk.action" width="100%" height="100%" frameborder="0"></iframe>
        </div>
    </div>
    <div id="tab-tools">
        <a href="javascript:void(0)" title="關閉所有頁簽.." class="easyui-linkbutton"
           data-options="plain:true,iconCls:'icon-tab_close'" onclick="closeAllTabs()"></a>
    </div>
</div>
<div data-options="region:'south',border:false"
     style="height: 22px; padding: 1px; text-align: center; vertical-align: middle;">Copy Right @ 2018~2020
</div>
</body>
</html>
<script type="text/javascript">
    //关闭所有的tab
    function closeAllTabs() {
        var list = new Array();
        var tabs = $('#workbench').tabs('tabs');
        var len = tabs.length;
        if (len > 0) {
            for (var j = 0; j < len; j++) {
                var tabId = tabs[j].panel('options').id;
                list.push(tabId);
            }
            for (var i = 0; i < list.length; i++) {
                $('#workbench').tabs('close', list[i]);
            }
        }
    }
</script>
