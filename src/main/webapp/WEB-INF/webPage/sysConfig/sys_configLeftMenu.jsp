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
    <script type="text/javascript" src="<%=basePath%>static/zTree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/zTree/js/jquery.ztree.core.js"></script>
    <link rel="stylesheet" href="<%=basePath%>static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript">
        <!--
        //默認設置
        var setting = {
            data: {
                simpleData: {
                    enable: true
                }
            },
            view: {
                showIcon: true
            },
            callback: {
                onClick: openTabToUrl,
            }
        };

        //樹數據
        var zNodes = [
            {id: "root-00", pId: "-1", name: "系統配置", open: true},
            {id: "node-02", pId: "root-00", name: "账号权限", open: true},
            {
                id: "node-21",
                pId: "node-02",
                name: "账号配置",
                isParent: false,
                iconSkin: "config",
                ifrName: "configUser",
                mainPath: "<%=basePath %>sysConfig/user/configuration.action"
            },
            {
                id: "node-24",
                pId: "node-02",
                name: "权限配置",
                isParent: false,
                iconSkin: "config",
                ifrName: "configUserPermission",
                mainPath: "<%=basePath %>sysConfig/permission/configuration.action"
            },
            {
                id: "node-25",
                pId: "node-02",
                name: "角色配置",
                isParent: false,
                iconSkin: "config",
                ifrName: "configRole",
                mainPath: "<%=basePath %>sysConfig/role/configuration.action"
            },
            {id: "node-01", pId: "root-00", name: "門戶管理", isParent: true, open: true},
            {
                id: "node-17",
                pId: "node-01",
                name: "門戶配置",
                isParent: false,
                iconSkin: "config",
                ifrName: "configPortal",
                mainPath: "<%=basePath %>sysConfig/portal/configuration.action"
            },

            {id: "node-03", pId: "root-00", name: "流程管理", open: true},
            {
                id: "node-31",
                pId: "node-03",
                name: "流程模块",
                isParent: false,
                iconSkin: "config",
                ifrName: "configFlowModule",
                mainPath: "<%=basePath %>sysConfig/flowModule/configuration.action"
            },
            {
                id: "node-32",
                pId: "node-03",
                name: "流程配置",
                isParent: false,
                iconSkin: "config",
                ifrName: "configFlowName",
                mainPath: "<%=basePath %>sysConfig/flowName/configuration.action"
            },
            {id: "node-04", pId: "root-00", name: "菜單管理", open: true},
            {
                id: "node-41",
                pId: "node-04",
                name: "菜單模塊",
                isParent: false,
                iconSkin: "config",
                ifrName: "configMenuModule",
                mainPath: "<%=basePath %>sysConfig/menuModule/configuration.action"
            },
            {
                id: "node-42",
                pId: "node-04",
                name: "菜單配置",
                isParent: false,
                iconSkin: "config",
                ifrName: "configMenuOption",
                mainPath: "<%=basePath %>sysConfig/menuOption/configuration.action"
            },
            {
                id: "node-05",
                pId: "root-00",
                name: "公共窗口（ToDo）",
                isParent: false,
                iconSkin: "config",
                ifrName: "xxxxxxxx",
                mainPath: "<%=basePath %>sysConfig/xxxxxxxxxxxxxxxx/configuration.action"
            },
            {
                id: "node-06",
                pId: "root-00",
                name: "数据字典",
                isParent: false,
                iconSkin: "config",
                ifrName: "configKeyValue",
                mainPath: "<%=basePath %>sysConfig/keyValue/configuration.action"
            },
            {
                id: "node-07",
                pId: "root-00",
                name: "单号配置",
                isParent: false,
                iconSkin: "config",
                ifrName: "configKeyValue",
                mainPath: "<%=basePath %>sysConfig/billNumber/configuration.action"
            },
            {
                id: "node-08",
                pId: "root-00",
                name: "审批用语",
                isParent: false,
                iconSkin: "config",
                ifrName: "configSysLog",
                mainPath: "<%=basePath %>sysConfig/comLanguage/configuration.action"
            },
            {
                id: "node-09",
                pId: "root-00",
                name: "系统日志",
                isParent: false,
                iconSkin: "config",
                ifrName: "configSysLog",
                mainPath: "<%=basePath %>sysConfig/sysLog/configuration.action"
            },
            {
                id: "node-10",
                pId: "root-00",
                name: "系统信息",
                isParent: false,
                iconSkin: "config",
                ifrName: "configSysInfo",
                mainPath: "<%=basePath %>sysConfig/sysInfo/configuration.action"
            },
        ];

        //页面切换
        function openTabToUrl(event, treeId, TreeNode, clickFlag) {
            var treeObj = $.fn.zTree.getZTreeObj(treeId);
            if (!TreeNode.isParent) {
                if (TreeNode.mainPath != "" && TreeNode.mainPath != "null") {
                    var url = TreeNode.mainPath;
                    if (url != "") {
                        var tabName = TreeNode.name;
                        var ifrName = TreeNode.ifrName;
                        //判断选项卡是否重复打开
                        if (window.top.$('#workbench').tabs('exists', tabName)) {
                            window.top.$('#workbench').tabs('select', tabName);
                        } else {
                            window.top.$('#workbench').tabs('add', {
                                id: tabName,
                                title: tabName,
                                content: '<iframe id="' + ifrName + '" name="' + ifrName + '" scrolling="no" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>',
                                closable: true
                            });
                        }
                    }
                }
            } else {
                treeObj.expandNode(TreeNode);
            }
        }

        //加載配置樹
        $(document).ready(function () {
            $.fn.zTree.init($("#configTree"), setting, zNodes);
        });
        //-->
    </script>
</head>
<body id="bg">
<div class="zTreeDemoBackground left">
    <ul id="configTree" class="ztree"></ul>
</div>
</body>
</html>