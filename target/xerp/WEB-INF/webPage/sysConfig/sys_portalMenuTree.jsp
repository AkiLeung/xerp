<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title></title>
    <jsp:include page="../include/common.jsp" flush="true"/>
    <script type="text/javascript" src="<%=basePath%>static/zTree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/zTree/js/jquery.ztree.core.js"></script>
    <link rel="stylesheet" href="<%=basePath%>static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript">
        //基礎設置
        var setting = {
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
            $.ajax({
                url: "<%=basePath %>sysConfig/portalMenu/listZTree.action?portalUuid=<%=request.getParameter("portalUuid")%>",
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
        portalUuid:<input type="text" id="portalUuid" name="portalUuid" value="<%=request.getParameter("portalUuid")%>"/><br>
        uuid:<input type="text" id="uuid" name="uuid" style="width: 250px"/><br>
        parentUuid:<input type="text" id="parentUuid" name="parentUuid"/><br>
        status:<input type="text" id="status" name="status"/><br>
    </span>
    <div>
        <ul id="zTree" class="ztree"></ul>
    </div>
    <br/>
</div>
</form>
<br>
</body>
</html>