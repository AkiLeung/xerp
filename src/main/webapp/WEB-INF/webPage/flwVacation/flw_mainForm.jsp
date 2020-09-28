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
            docUuid:<input value="${docUuid}" type="Text" name="uuid" id="uuid"/><br/>
            flowModule:<input value="vacation" type="Text" name="flowModule" id="flowModule"/><br/>
            flowCode:<input value="flow00002" type="Text" name="flowCode" id="flowCode"/><br/>
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
        <td class="tblCell" style="width: 100%;height: 50px;text-align: center" colspan="2">
            请假申请流程（Test 1.0）
        </td>
    </tr>
    <tr>
        <td class="tblCellBillNumber" style="width: 100%;height: 20px;" colspan="2">
            <span id="billNumberShow" style="font-weight: bolder;"></span>
        </td>
    </tr>
    <tr>
        <td class="tblTitle" style="width: 10%">
            创建人员
        </td>
        <td class="tblCell" style="width: 90%">
            <input class="easyui-textbox" value="" name="flowCreatorCode" type="text" id="flowCreatorCode"
                   style="width:20%;" editable="false"/>
            <input class="easyui-textbox" value="" name="flowCreatorName" type="text" id="flowCreatorName"
                   style="width:20%;" editable="false"/>
        </td>
    </tr>
    <tr>
        <td class="tblTitle" style="width: 10%">
            备注信息
        </td>
        <td class="tblCell" style="width: 90%">
            <input class="easyui-textbox" data-options="multiline:true" value="" name="message" type="text" id="message"
                   style="width:99.5%;height: 99.5%" editable="false"/>
        </td>
    </tr>
</table>
<jsp:include page="../include/flowButtonTool.jsp" flush="true"/>
<%--<jsp:include page="../include/flowOpinionsShow.jsp" flush="true"/>--%>
<jsp:include page="../include/flowToNextNode.jsp" flush="true"/>
<jsp:include page="../include/flowFormulaController.jsp" flush="true"/>
</body>
</html>
<script type="text/javascript">
    $(function () {
        //设置默认只读
        setObjectStatusReadonly("flowCreatorCode");
        setObjectStatusReadonly("flowCreatorName");
        setObjectStatusReadonly("message");
    });

    var pathUrl = "";
    if ($("#flowNodeUuid").val() != '' && $("#flowNodeCode").val() != 'null') {
        //获取流程当前环节信息
        pathUrl = "<%=basePath %>flowData/getNodeByNodeUuid.action?nodeUuid=" + $("#flowNodeUuid").val();
        $.ajax({
            async: true,
            type: 'get',
            url: pathUrl,
            dataType: 'json',
            success: function (data) {
                //可编辑字段
                $("#editableField").val(data[0].editableField);
                //必填字段
                $("#requiredFieldCode").val(data[0].requiredFieldCode);
                $("#requiredFieldName").val(data[0].requiredFieldName);
                //流程控制公式
                $("#nodeFormula").val(data[0].nodeFormula);
            },
            error: function (data) {
                alert("【" + url + "】JSON数据获取失败，请联系管理员！");
            }
        });

        //获取当前审批流程信息
        pathUrl = "<%=basePath %>vacation/getDataByUuid.action?uuid=${docUuid}";
        $.ajax({
            async: true,
            type: "get",
            url: pathUrl,
            dataType: 'json',
            success: function (data) {
                //单据核心信息
                $("#billNumber").textbox('setValue', data[0].billNumber);
                $("#billNumberShow").text(" (NO."+data[0].billNumber+")");
                $("#flowCreatorCode").textbox('setValue', data[0].flowCreatorCode);
                $("#flowCreatorName").textbox('setValue', data[0].flowCreatorName);
                //单据审批内容
                $("#message").textbox('setValue', data[0].message);

                //当前环节可以编辑字段
                if ($("#editableField").val() != "") {
                    var fields = $("#editableField").val().split(';');
                    var lvCurHandlerCode = $("#curHandlerCode").val();
                    var lvCurUserCode = $("#curUserCode").val();
                    for (var i = 0; i < fields.length; i++) {
                        setObjectStatusEditable(lvCurHandlerCode, lvCurUserCode, fields[i]);
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
        //執行保存
        var objData = {
            uuid: $("#uuid").val(),
            message: $("#message").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>vacation/saveFlowData.action",
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

    //提交文档
    function documentFlowToNext() {
        //執行提交
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
        //執行提交
        $.ajax({
            type: "POST",
            url: "<%=basePath %>vacation/submitFlowData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                //保存办理意见
                saveDocuOpinions();
                alert("Submit Document");
                window.location.href = '<%=basePath %>vacation/toHandleList.action';
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>