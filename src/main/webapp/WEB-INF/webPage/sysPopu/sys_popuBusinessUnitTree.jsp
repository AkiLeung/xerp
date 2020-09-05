<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript" src="<%=basePath%>static/zTree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript">
        //基礎設置
        var setting = {
            async: {
                enable: true,
                type: "get",
                url: "<%=basePath%>sysOrg/businessUnit/getAsyncZTree.action",
                autoParam: ["id"],
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
                showIcon: true,
                dblClickExpand: false
            },
            callback: {
                onClick: onClick,
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
            var url = "<%=basePath %>sysOrg/businessUnit/getListZTreeByUuid.action?cmpUuid=<%=request.getParameter("cmpUuid")%>";
            $.ajax({
                url: url,
                type: "post",
                dataType: "json",
                success: function (data) {
                    var zTreeObj = $.fn.zTree.init($("#zTree"), setting, data);
                    //让第一个父节点展开
                    var rootNode_0 = zTreeObj.getNodeByParam('pid', 0, null);
                    zTreeObj.expandNode(rootNode_0, false, false, false, false);
                }
            });
        }

        //單擊事件
        function onClick(event, treeId, TreeNode) {
            var zTree = $.fn.zTree.getZTreeObj("zTree");
            zTree.expandNode(TreeNode);
            $("#uuid").val(TreeNode.id);
            $("#parentUuid").val(TreeNode.pid);
            $("#status").val(TreeNode.status);
            return false;
        }

        //页面加载数据
        $(document).ready(function () {
            initZTree();
        });
    </script>
</head>
<body style="text-align:left;">
<form id="form1">
    <span style="display: none">
        uuid:<input type="text" id="uuid" name="uuid" style="width: 500px"/><br>
        fieldCode:<input type="text" value="<%=request.getParameter("uuid")%>" id="fieldCode" name="fieldCode"><br>
        fieldName:<input type="text" value="<%=request.getParameter("name")%>" id="fieldName" name="fieldName"><br>
        type:<input type="text" value="<%=request.getParameter("type")%>" id="type" name="type"><br>
    </span>
    <div class="easyui-panel" style="padding:5px;">
        <a id="expandAllBtn" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-unFold'"
           onclick=" $.fn.zTree.getZTreeObj('zTree').expandAll(true);">expand All</a>
        <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
        <a id="collapseAllBtn" href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fold'"
           onclick=" $.fn.zTree.getZTreeObj('zTree').expandAll(false);">collapse All</a>
    </div>
    <div>
        <ul id="zTree" class="ztree"></ul>
    </div>
    <br/>
</form>
</body>
</html>