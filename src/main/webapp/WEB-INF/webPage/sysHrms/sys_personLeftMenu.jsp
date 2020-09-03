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
            {id: "root-00", pId: "-1", name: "档案管理", open: true},
            {id: "node-01", pId: "root-00", name: "法人公司", open: true},
            {
                id: "node-11",
                pId: "node-01",
                name: "公司列表",
                isParent: false,
                iconSkin: "company",
                ifrName: "company",
                mainPath: "<%=basePath %>sysOrg/company/configuration.action"
            },
            {
                id: "node-12",
                pId: "node-01",
                name: "部门管理",
                isParent: false,
                iconSkin: "department",
                ifrName: "department",
                mainPath: "<%=basePath %>sysOrg/department/configuration.action"
            },
            {id: "node-02", pId: "root-00", name: "业务架构", isParent: true, open: true},
            {
                id: "node-21",
                pId: "node-02",
                name: "事业部",
                isParent: false,
                iconSkin: "business",
                ifrName: "business",
                mainPath: "<%=basePath %>sysOrg/business/configuration.action"
            },
            {
                id: "node-22",
                pId: "node-02",
                name: "事业部门",
                isParent: false,
                iconSkin: "businessUnit",
                ifrName: "businessUnit",
                mainPath: "<%=basePath %>sysOrg/businessUnit/configuration.action"
            },
            {
                id: "node-23",
                pId: "node-02",
                name: "功能架构-todo",
                isParent: false,
                iconSkin: "others",
                ifrName: "othersOrg",
                mainPath: "<%=basePath %>sysOrg/otherOrg/configuration.action"
            },
            {id: "node-90", pId: "root-00", name: "其他架构", isParent: true, open: true},
            {
                id: "node-91",
                pId: "node-90",
                name: "工厂管理",
                isParent: false,
                iconSkin: "factory",
                ifrName: "factory",
                mainPath: "<%=basePath %>sysOrg/factory/configuration.action"
            },
            {
                id: "node-92",
                pId: "node-90",
                name: "库位管理",
                isParent: false,
                iconSkin: "location",
                ifrName: "location",
                mainPath: "<%=basePath %>sysOrg/location/configuration.action"
            },
            {
                id: "node-93",
                pId: "node-90",
                name: "货仓管理",
                isParent: false,
                iconSkin: "warehouse",
                ifrName: "warehouse",
                mainPath: "<%=basePath %>sysOrg/warehouse/configuration.action"
            }
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