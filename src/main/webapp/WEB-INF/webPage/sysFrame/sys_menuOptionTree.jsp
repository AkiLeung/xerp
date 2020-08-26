<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <jsp:include page="../include/common.jsp" flush="true"/>
    <script type="text/javascript" src="<%=basePath%>static/zTree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/zTree/js/jquery.ztree.core.js"></script>
    <link rel="stylesheet" href="<%=basePath%>static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript">
        var setting = {
            async: {
                enable: true,
                type: "get",
                url: "<%=basePath%>sysFrame/asyncGetNodes.action",
                autoParam: ["id", "pid", "name"],
                dataFilter: filter
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: 'id',
                    pIdKey: 'pid',
                    rootPId: 0
                }
            },
            view: {
                showIcon: true
            },
            callback: {
                onClick: changeTabToUrl,
            }
        };

        //过滤特殊字符
        function filter(treeId, parentNode, childNodes) {
            if (!childNodes) return null;
            //正则替换
            for (var i = 0, l = childNodes.length; i < l; i++) {
                childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
            }
            return childNodes;
        }

        //初始化树
        function initZTree() {
            $.ajax({
                url: "<%=basePath%>sysFrame/portalUserMenuZTree.action",
                type: "post",
                dataType: "json",
                success: function (data) {
                    var zTreeObj = $.fn.zTree.init($("#userPortalMenuTree"), setting, data);
                    //让第一个父节点展开
                    var rootNode_0 = zTreeObj.getNodeByParam('pid', 0, null);
                    zTreeObj.expandNode(rootNode_0, true, false, false, false);
                }
            });
        }

        //页面切换
        function changeTabToUrl(event, treeId, TreeNode, clickFlag) {
            var treeObj = $.fn.zTree.getZTreeObj(treeId);
            if(!TreeNode.isParent){
                if (TreeNode.leftPath != "" && TreeNode.leftPath != "null") {
                    window.top.ifrSysLeft02.location.href = "<%=basePath%>"+TreeNode.leftPath;
                    window.top.$('#Tabs').tabs('select', 1);
                }
                if (TreeNode.mainPath != "" && TreeNode.mainPath != "null") {
                    //判断选项卡是否重复打开
                    if (window.top.$('#workbench').tabs('exists', TreeNode.name)) {
                        window.top.$('#workbench').tabs('select', TreeNode.name);
                    } else {
                        window.top.$('#workbench').tabs('add', {
                            id: TreeNode.name,
                            title: TreeNode.name,
                            content: '<iframe id="' + TreeNode.name + '" name="' + TreeNode.name + '" scrolling="no" frameborder="0"  src="' + TreeNode.mainPath + '" style="width:100%;height:100%;"></iframe>',
                            closable: true
                        });
                    }
                }
            }else{
                treeObj.expandNode(TreeNode);
            }
        }

        //页面加载数据
        $(document).ready(function () {
            initZTree();
        });
    </script>
</head>
<body>
<div>
    <ul id="userPortalMenuTree" class="ztree" ></ul>
</div>
<br/>
</body>
</html>