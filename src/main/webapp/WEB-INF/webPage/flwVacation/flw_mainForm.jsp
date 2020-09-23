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
    <style>
        .tbx {
            border: 0px;
            background-color: #ededed;
        }
    </style>
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
            docUuid:<input value="${docUuid}" type="Text" name="uuid" id="uuid"/><br/>
            flowModule:<input value="vacation" type="Text" name="flowModule" id="flowModule"/><br/>
            flowCode:<input value="${flowCode}" type="Text" name="flowCode" id="flowCode"/><br/>
            billNumber:<input class="easyui-textbox" value="" type="Text" name="billNumber" id="billNumber"/><br/>
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
            <jsp:include page="../include/flowProcessShow.jsp" flush="true"/>
        </td>
    </tr>
</table>
<table class="tbl" style="width:100%;height:200px;">
    <tr>
        <td class="tblCell" style="width: 100%;height: 60px;text-align: center" colspan="2">
            XXXXXX申请
        </td>
    </tr>
    <tr>
        <td class="tblTitle" style="width: 10%">
            创建人
        </td>
        <td class="tblCell" style="width: 90%">
            <input class="easyui-textbox" value="" name="flowCreatorCode" type="text" id="flowCreatorCode"
                   style="width:150px;"/>
            <input class="easyui-textbox" value="" name="flowCreatorName" type="text" id="flowCreatorName"
                   style="width:150px;"/>
        </td>
    </tr>
    <tr>
        <td class="tblTitle" style="width: 10%">
            备注
        </td>
        <td class="tblCell" style="width: 90%">
            <input class="easyui-textbox" data-options="multiline:true" value="" name="message" type="text" id="message"
                   style="width:80%;height: 99%"/>
        </td>
    </tr>
    <tr>
        <td class="tblTitle" style="width: 100%;height: 45px;" colspan="2">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:100px"
               onclick="documentSave();">保存</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" style="width:100px"
               onclick="openFlowToNext();">提交</a>
        </td>
    </tr>
</table>
<jsp:include page="../include/flowToNextNode.jsp" flush="true"/>
</body>
</html>
<script type="text/javascript">
    var pathUrl = "";
    if ($("#flowNodeUuid").val() != '' && $("#flowNodeCode").val() != 'null') {
        //当前环节信息
        pathUrl = "<%=basePath %>flowData/getNodeByNodeUuid.action?nodeUuid=" + $("#flowNodeUuid").val();
        $.ajax({
            async: true,
            type: 'get',
            url: pathUrl,
            dataType: 'json',
            success: function (data) {
                $("#editableField").val(data[0].editableField);
                $("#requiredFieldCode").val(data[0].requiredFieldCode);
                $("#requiredFieldName").val(data[0].requiredFieldName);
            },
            error: function (data) {
                alert("【" + url + "】JSON数据获取失败，请联系管理员！");
            }
        });

        //頁面加載時執行
        pathUrl = "<%=basePath %>vacation/getDataByUuid.action?uuid=${docUuid}";
        $.ajax({
            async: true,
            type: "get",
            url: pathUrl,
            dataType: 'json',
            success: function (data) {
                //单据核心信息
                $("#billNumber").textbox('setValue', data[0].billNumber);
                $("#flowCreatorCode").textbox('setValue', data[0].flowCreatorCode);
                $("#flowCreatorName").textbox('setValue', data[0].flowCreatorName);
                //单据审批内容
                $("#message").textbox('setValue', data[0].message);

                //当前环节可以编辑字段
                if ($("#editableField").val() != "") {
                    var fields = $("#editableField").val().split(';');
                    for (var i = 0; i < fields.length; i++) {
                        setObjectStatus(fields[i]);
                    }
                }
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存文档
    function documentSave() {
        alert("Document Save!!!!");
    }

    //提交文档
    function documentFlowToNext() {
        //執行保存
        var objData = {
            uuid: $("#uuid").val(),
            billNumber: $("#billNumber").val(),
            message: $("#message").val(),
            flowNodeUuid: $("#targetNodeUuid").val(),
            flowNodeTypeC: $("#flowNodeType").val(),
            flowNodeTypeN: $("#targetNodeType").val(),
            flowNodeCode: $("#targetNodeCode").val(),
            flowNodeName: $("#targetNodeName").val(),
            curHandlerCode: $("#targetHandlerCode").val(),
            curHandlerName: $("#targetHandlerName").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>vacation/submitFlowData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                alert("Save Document");
                window.location.href = '<%=basePath %>vacation/toHandleList.action';
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>