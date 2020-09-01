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

    var nodesData = "";
    //var node = {};
    $.ajax({
        async: false,
        type: 'get',
        url: '<%=basePath%>sysConfig/flowNode/listData.action?flowUuid=' + $("#flowUuid").val(),
        dataType: 'json',
        success: function (data) {
            if (data != null) {
                nodesData = "";
                for (var i = 0; i < data.rows.length; i++) {
                    if (data.rows[i].nodeType == '00') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/start.png' /> "
                            + "<span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + " -> ";
                    } else if (data.rows[i].nodeType == '01') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/node.png' /> "
                            + "<span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + " -> ";
                    } else if (data.rows[i].nodeType == '02') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/node.png' /> "
                            + "<span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + " -> ";
                    } else if (data.rows[i].nodeType == '99') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/finish.png' /> "
                            + "<span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>";
                    }
                }
                $("#flowShow").html(nodesData);
            }
        }
    });

    //預覽流程圖
    function showFlowGraph() {
        var urlPath = "<%=basePath %>sysPopu/gotoFlowGraphPage.action?flowUuid=" + $("#flowUuid").val();
        window.ifrWorkFlow.location.href = urlPath;
        $('#winWorkFlow').window('open');
    }
</script>