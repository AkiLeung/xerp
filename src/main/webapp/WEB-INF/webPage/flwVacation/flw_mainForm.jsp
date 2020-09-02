<%@ page import="com.xerp.common.consts.ConfigConst" %>
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
    <title>Title</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body>
<div id="winWorkFlow" class="easyui-window" title="Show Work Flow" style="width:1400px;height:700px;padding:1px;"
     data-options="
         modal:true,
         minimizable: false,
         maximizable: false,
         resizable: false,
         closed:true,
         iconCls:'icon-flow',cls:'c8'">
    <iframe id="ifrWorkFlow" name="ifrWorkFlow" src="" width="100%" height="100%" frameborder="0"></iframe>
</div>
<table class="tbl" style="width:100%;height:50px;">
    <tr style="display: none">
        <td class="tblCell" style="width: 100%" colspan="2">
            flowCode:<input value="flow00002" type="Text" name="flowCode" id="flowCode"/><br/>
            flowUuid:<input value="" type="Text" name="flowUuid" id="flowUuid"/><br/>
            flowName:<input value="" type="Text" name="flowName" id="flowName"/><br/>
            flowVersion:<input value="" type="Text" name="flowVersion" id="flowVersion"/><br/>
            docUuid:<input value="<%=request.getParameter("uuid")%>" type="Text" name="uuid" id="uuid"/><br/>
            flowNodeType:<input value="" type="Text" name="flowNodeType" id="flowNodeType"/><br/>
            flowNodeCode:<input value="" type="Text" name="flowNodeCode" id="flowNodeCode"/><br/>
            flowNodeName:<input value="" type="Text" name="flowNodeName" id="flowNodeName"/><br/>
            curHandlerNum:<input value="" type="Text" name="curHandlerNum" id="curHandlerNum"/><br/>
            curHandlerNam:<input value="" type="Text" name="curHandlerNam" id="curHandlerNam"/><br/>
        </td>
    </tr>
    <tr>
        <td bgColor="#0a589a" style="color: #000000;height:2px" colspan="2"></td>
    </tr>
    <tr>
        <td class="tblTitle" style="width: 10%">
            <img src="<%=basePath%>static/image/flow.png"/>
            <a id="flowInfo" onclick="showFlowGraph()" href="javascript:void(0)"></a>
        </td>
        <td class="tblCell" style="width: 90%">
            <span id="flowShow"></span>
        </td>
    </tr>
</table>
</body>
</html>
<script>
    //01 获取配置流程信息
    var url = "<%=basePath %>flowData/getFlowByCode.action?flowCode=" + $("#flowCode").val();
    $.ajax({
        async: false,
        type: 'get',
        url: url,
        dataType: 'json',
        success: function (data) {
            $("#flowUuid").val(data[0].uuid);
            $("#flowName").val(data[0].flowName);
            $("#flowVersion").val(data[0].flowVersion);
            $("#flowInfo").text(data[0].flowName + " - [ " + data[0].flowVersion + " ]");
        },
        error: function (data) {
            alert("【" + url + "】JSON数据获取失败，请联系管理员！");
        }
    });

    //02 获取当前文档的流程信息
    if ($("#uuid").val() != '' && $("#uuid").val() != 'null') {
        url = "<%=basePath %>vacation/getDataByUuid.action?uuid=" + $("#uuid").val();
        $.ajax({
            async: false,
            type: 'get',
            url: url,
            dataType: 'json',
            success: function (data) {
                $("#flowNodeType").val(data[0].flowNodeType);
                $("#flowNodeCode").val(data[0].flowNodeCode);
                $("#flowNodeName").val(data[0].flowNodeName);
                $("#curHandlerNum").text(data[0].curHandlerNum);
                $("#curHandlerNam").text(data[0].curHandlerNam);
            },
            error: function (data) {
                alert("【" + url + "】JSON数据获取失败，请联系管理员！");
            }
        });
    }else{
        //默认流程为第一个环节
        url = "<%=basePath %>flowData/getStartNodeByFlowUuid.action?flowUuid=" + $("#flowUuid").val();
        $.ajax({
            async: false,
            type: 'get',
            url: url,
            dataType: 'json',
            success: function (data) {
                $("#flowNodeType").val(data[0].nodeType);
                $("#flowNodeCode").val(data[0].nodeCode);
                $("#flowNodeName").val(data[0].nodeName);
                $("#curHandlerNum").val('<shiro:principal property="userCode"/>');
                $("#curHandlerNam").val('<shiro:principal property="userName"/>');
            },
            error: function (data) {
                alert("【" + url + "】JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //03 获取配置流程的所有节点信息
    var nodesData = "";
    url = '<%=basePath%>flowData/getNodesByFlowUuid.action?flowUuid=' + $("#flowUuid").val();
    $.ajax({
        async: false,
        type: 'get',
        url: url,
        dataType: 'json',
        success: function (data) {
            if (data != null) {
                nodesData = "";
                var curHandlerName = "";
                for (var i = 0; i < data.rows.length; i++) {
                    curHandlerName = "";
                    if($("#flowNodeCode").val() == data.rows[i].nodeCode){
                        curHandlerName = "[<span style='font-weight: bold;color:#154b76'>"+ $("#curHandlerNam").val() +"</span>]";
                    }
                    if (data.rows[i].nodeType == '<%=ConfigConst.STR_FLOW_START_NUM%>') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/start.png' /> "
                            + " <span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + curHandlerName + " -> ";
                    } else if (data.rows[i].nodeType == '<%=ConfigConst.STR_FLOW_TASK_NUM%>') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/node.png' /> "
                            + " <span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + curHandlerName + " -> ";
                    } else if (data.rows[i].nodeType == '<%=ConfigConst.STR_FLOW_NODE_NUM%>') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/node.png' /> "
                            + " <span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + curHandlerName + " -> ";
                    } else if (data.rows[i].nodeType == '<%=ConfigConst.STR_FLOW_END_NUM%>') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/finish.png' /> "
                            + " <span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + curHandlerName;
                    }
                }
                $("#flowShow").html(nodesData);
            }
        }
    });

    //99 預覽流程圖
    function showFlowGraph() {
        var urlPath = "<%=basePath %>sysPopu/gotoFlowGraphPage.action?flowUuid=" + $("#flowUuid").val();
        window.ifrWorkFlow.location.href = urlPath;
        $('#winWorkFlow').window('open');
    }
</script>