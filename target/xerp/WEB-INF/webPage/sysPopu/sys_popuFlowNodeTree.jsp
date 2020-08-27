
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        //基礎設置--層級:流程模塊關係只能夠實現單選
        var setting = {
            check: {
                enable: true,
                chkStyle: "radio",
                radioType: "all"
            },
            view: {
                dblClickExpand: false
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
                onClick: onClick,
            }
        };

        //初始化树
        function initZTree() {
            $.ajax({
                url: "<%=basePath %>sysConfig/flowNode/getZTree.action?flowUuid=" + $("#flowUuid").val(),
                type: "post",
                dataType: "json",
                success: function (data) {
                    var zTreeObj = $.fn.zTree.init($("#zTree"), setting, data);
                    //让第一个父节点展开
                    var rootNode_0 = zTreeObj.getNodeByParam('pid', 0, null);
                    zTreeObj.expandNode(rootNode_0, true, false, false, false);
                }
            });
        }

        //單擊事件
        function onClick(event, treeId, TreeNode) {
            var zTree = $.fn.zTree.getZTreeObj("zTree");
            zTree.expandNode(TreeNode);
            zTree.checkNode(TreeNode, !TreeNode.checked, null, true);
            if (TreeNode.checked) {
                $("#uuid").val(TreeNode.id);
            }
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
        uuid:<input type="text" id="uuid" name="uuid" style="width: 250px" /><br>
        parentUuid:<input type="text" id="parentUuid" name="parentUuid" /><br>
        flowUuid:<input type="text" value="<%=request.getParameter("flowUuid")%>" id="flowUuid" name="flowUuid"/><br>
        fieldCode:<input type="text" value="<%=request.getParameter("uuid")%>" id="fieldCode" name="fieldCode"><br>
        fieldName:<input type="text" value="<%=request.getParameter("name")%>" id="fieldName" name="fieldName"><br>
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
