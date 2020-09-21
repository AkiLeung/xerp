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
</head>
<body>
<form id="form1" action="" method="post">
    <table class="tbl" style="width:100%;">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid&flow_uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/>
                <input class="easyui-textbox" value="<%=request.getParameter("nodeUuid")%>" name="nodeUuid" type="hidden" id="nodeUuid"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tblInfo">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info1.png"/>&nbsp;办理人员
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 20%">
                办理人员-工号
            </td>
            <td class="tblCell" style="width: 80%">
                <input class="easyui-textbox" value="" name="handlerCode" type="text" id="handlerCode"
                       style="width:160px"
                       data-options="prompt:'User code',validType:'length[2,50]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                办理人员-姓名
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="handlerName" type="text" id="handlerName"
                       style="width:160px"
                       data-options="prompt:'User name',validType:'length[2,50]'"/>
               </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',
            url: "<%=basePath %>sysConfig/flowNodeHandler/listByUuid.action?uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("#nodeUuid").textbox('setValue', data[0].nodeUuid);
                $("#handlerCode").textbox('setValue', data[0].handlerCode);
                $("#handlerName").textbox('setValue', data[0].handlerName);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#handlerCode").val() == "") {
            $.messager.alert('Field Required', 'Handler code must be entered!');
            return false;
        }
        if ($("#handlerName").val() == "") {
            $.messager.alert('Field Required', 'Handler name must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid:$("#uuid").val(),
            nodeUuid:$("#nodeUuid").val(),
            handlerCode: $("#handlerCode").val(),
            handlerName: $("#handlerName").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/flowNodeHandler/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#flowNodeHandlerConfig').dialog('close');
                parent.$('#handlerList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>