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
                <input class="easyui-textbox" value="<%=request.getParameter("flowUuid")%>" name="flowUuid" type="hidden" id="flowUuid"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 20%">
                模塊狀態
            </td>
            <td class="tblCell" style="width: 80%">
                <label style="cursor: pointer"><input type="radio" name="status" value="01"
                                                      checked><%=ConfigConst.STR_STATUS_ACTIVE_TXT%>
                </label>
                <label style="cursor: pointer"><input type="radio" name="status"
                                                      value="00"><%=ConfigConst.STR_STATUS_BLOCK_TXT%>
                </label>
                <label style="cursor: pointer"><input type="radio" name="status"
                                                      value="99"><%=ConfigConst.STR_STATUS_DELETE_TXT%>
                </label>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tblInfo">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info1.png"/>&nbsp;基础信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 250px">
                環節類型
            </td>
            <td class="tblCell" style="width: 750px">
                <label style="cursor: pointer"><input type="radio" name="nodeType" onclick="javascript:setNodeValue('0','<%=ConfigConst.STR_FLOW_START_TXT%>');"
                                                      value="<%=ConfigConst.STR_FLOW_START_NUM%>"><%=ConfigConst.STR_FLOW_START_TXT%>
                </label>
                <label style="cursor: pointer"><input type="radio" name="nodeType" checked onclick="javascript:setNodeValue('1','<%=ConfigConst.STR_FLOW_TASK_TXT%>');"
                                                      value="<%=ConfigConst.STR_FLOW_TASK_NUM%>"><%=ConfigConst.STR_FLOW_TASK_TXT%>
                </label>
                <label style="cursor: pointer"><input type="radio" name="nodeType" onclick="javascript:setNodeValue('2','<%=ConfigConst.STR_FLOW_NODE_TXT%>');"
                                                      value="<%=ConfigConst.STR_FLOW_NODE_NUM%>"><%=ConfigConst.STR_FLOW_NODE_TXT%>
                </label>
                <label style="cursor: pointer"><input type="radio" name="nodeType" onclick="javascript:setNodeValue('99','<%=ConfigConst.STR_FLOW_END_TXT%>');"
                                                      value="<%=ConfigConst.STR_FLOW_END_NUM%>"><%=ConfigConst.STR_FLOW_END_TXT%>
                </label>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                環節编号</td>
            <td class="tblCell">
                <input class="easyui-numberspinner" value="1"  name="nodeCode" id="nodeCode"  data-options="increment:1,min:0,max:99,required:true" style="width:250px;" />
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                環節名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="nodeName" type="text" id="nodeName"
                       style="width:350px"
                       data-options="prompt:'Enter User name.',required:true,validType:'length[2,50]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                備註信息
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="comment" type="text" id="comment" style="width:350px"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                办理角色
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="handlerRoleCode" type="text" id="handlerRoleCode" style="width:350px"/>
                <input class="easyui-textbox" value="" name="handlerRoleName" type="text" id="handlerRoleName" style="width:350px"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                办理字段
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="handlerFieldCode" type="text" id="handlerFieldCode" style="width:350px"/>
                <input class="easyui-textbox" value="" name="handlerFieldName" type="text" id="handlerFieldName" style="width:350px"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                办理人员
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="handlerName" type="text" id="handlerName"
                       style="width:350px"
                       data-options="prompt:'Enter User name.',validType:'length[2,50]'"/>
                <input class="easyui-textbox" value="" name="handlerCode" type="text" id="handlerCode"
                       style="width:100px"
                       data-options=""/>
               </td>
        </tr>
        <tr>
            <td class="tblTitle">
                编辑字段
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="editField" type="text" id="editField"
                       style="width:99%;height: 125px"
                       data-options="multiline:true"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                流向公式
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="nodeFormula" type="text" id="nodeFormula"
                       style="width:99%;height: 145px"
                       data-options="multiline:true"/></td>
        </tr>
        <tr style="display:none">
            <td class="tblTitle">
                GooFlow參數
            </td>
            <td class="tblCell">
                gooflow_type：<input class="easyui-textbox" value="task" name="gooflowType" type="text" id="gooflowType" style="width:50px"/><br>
                gooflow_left：<input class="easyui-textbox" value="88" name="gooflowLeft" type="text" id="gooflowLeft" style="width:50px"/><br>
                gooflow_top：<input class="easyui-textbox" value="20" name="gooflowTop" type="text" id="gooflowTop" style="width:50px"/><br>
                gooflow_width：<input class="easyui-textbox" value="100" name="gooflowWidth" type="text" id="gooflowWidth" style="width:50px"/><br>
                gooflow_height：<input class="easyui-textbox" value="24" name="gooflowHeight" type="text" id="gooflowHeight" style="width:50px"/><br>
                gooflow_alt：<input class="easyui-textbox" value="true" name="gooflowAlt" type="text" id="gooflowAlt" style="width:50px"/><br>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    //Default Execution or Setting
    $(function () {
        $('#nodeCode').textbox('textbox').attr('maxlength', 20);
        $('#nodeName').textbox('textbox').attr('maxlength', 50);
        $('#comment').textbox('textbox').attr('maxlength', 150);
    });

    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',
            url: "<%=basePath %>sysConfig/flowNode/listByUuid.action?uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("#flowUuid").textbox('setValue', data[0].flowUuid);
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("input[name='nodeType'][value ='" + data[0].nodeType + "']").attr("checked", "checked").parent().addClass('checked');
                $("#nodeCode").textbox('setValue', data[0].nodeCode);
                $("#nodeName").textbox('setValue', data[0].nodeName);
                $("#comment").textbox('setValue', data[0].comment);
                $("#handlerRoleCode").textbox('setValue', data[0].handlerRoleCode);
                $("#handlerRoleName").textbox('setValue', data[0].handlerRoleName);
                $("#handlerFieldCode").textbox('setValue', data[0].handlerFieldCode);
                $("#handlerFieldName").textbox('setValue', data[0].handlerFieldName);
                $("#handlerCode").textbox('setValue', data[0].handlerCode);
                $("#handlerName").textbox('setValue', data[0].handlerName);
                $("#editField").textbox('setValue', data[0].editField);
                $("#nodeFormula").textbox('setValue', data[0].nodeFormula);
                $("#gooflowType").textbox('setValue', data[0].gooflowType);
                $("#gooflowLeft").textbox('setValue', data[0].gooflowLeft);
                $("#gooflowTop").textbox('setValue', data[0].gooflowTop);
                $("#gooflowWidth").textbox('setValue', data[0].gooflowWidth);
                $("#gooflowHeight").textbox('setValue', data[0].gooflowHeight);
                $("#gooflowAlt").textbox('setValue', data[0].gooflowAlt);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#nodeCode").val() == "") {
            $.messager.alert('Field Required', 'Node code must be entered!');
            return false;
        }
        if ($("#nodeName").val() == "") {
            $.messager.alert('Field Required', 'Node name must be entered!');
            return false;
        }
        //設置環節top位置
        var positionLeft = 0 ;
        parseInt($("#nodeCode").val()) < 90 ? positionLeft = 138 : positionLeft = 1180;
        $("#gooflowLeft").textbox('setValue',positionLeft);

        //設置環節top位置
        var positionTop = 0 ;
        parseInt($("#nodeCode").val()) < 90 ? positionTop = 20 + ($("#nodeCode").val() * 100): positionTop = 500;
        $("#gooflowTop").textbox('setValue',positionTop);

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid:$("#uuid").val(),
            flowUuid:$("#flowUuid").val(),
            status: $('input[name="status"]:checked').val(),
            nodeCode: $("#nodeCode").val(),
            nodeName: $("#nodeName").val(),
            nodeType:  $('input[name="nodeType"]:checked').val(),
            handlerRoleCode: $("#handlerRoleCode").val(),
            handlerRoleName: $("#handlerRoleName").val(),
            handlerFieldCode: $("#handlerFieldCode").val(),
            handlerFieldName: $("#handlerFieldName").val(),
            handlerCode: $("#handlerCode").val(),
            handlerName: $("#handlerName").val(),
            editField: $("#editField").val(),
            nodeFormula: $("#nodeFormula").val(),
            gooflowType: $("#gooflowType").val(),
            gooflowLeft: $("#gooflowLeft").val(),
            gooflowTop: $("#gooflowTop").val(),
            gooflowWidth: $("#gooflowWidth").val(),
            gooflowHeight: $("#gooflowHeight").val(),
            gooflowaAlt: $("#gooflowaAlt").val(),
            comment: $("#comment").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/flowNode/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#flowNodeConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }

    //設置環節信息
    function setNodeValue(nodeCode,nodeType){
        $('#nodeCode').textbox('setValue', nodeCode);
        $('#gooflowType').textbox('setValue', nodeType);
    }
</script>