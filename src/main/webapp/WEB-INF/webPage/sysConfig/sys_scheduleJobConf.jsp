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
                ws&uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                <input value="<%=request.getParameter("jobId")%>" name="jobId" type="hidden" id="jobId"/></td>
        </tr>
        <tr>
            <td colspan="2" class="tblInfo">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info3.png"/>&nbsp;基础信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 20%">
                状态
            </td>
            <td class="tblCell" style="width: 80%">
                <label style="cursor: pointer"><input type="radio" name="status" value="1" checked>启用</label>
                <label style="cursor: pointer"><input type="radio" name="status" value="0">暂停</label>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                执行类名
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="jobClass" type="text" id="jobClass"
                       style="width:450px"
                       data-options="prompt:'Enter class full name.',required:true,validType:'length[1,250]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                执行组名
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="jobGroup" type="text" id="jobGroup"
                       style="width:450px"
                       data-options="required:true,validType:'length[1,250]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                计划名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="jobName" type="text" id="jobName"
                       style="width:450px"
                       data-options="required:true,validType:'length[1,250]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                触发器名
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="triggerName" type="text" id="triggerName"
                       style="width:450px"
                       data-options="required:true,validType:'length[1,250]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                触发器组
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="triggerGroup" type="text" id="triggerGroup"
                       style="width:450px"
                       data-options="required:true,validType:'length[1,250]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                CRON表达式
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="cronExpr" type="text" id="cronExpr"
                       style="width:450px"
                       data-options="required:true,validType:'length[1,250]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                开始时间
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" data-options="validType:'length[0,250]'" value=""
                       name="startTime" type="text"
                       id="startTime" style="width:450px"/>
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
            type: 'get',//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysConfig/scheduler/listByJobId.action?ws=" + webStatus + "&jobId=" + $("#jobId").val(),
            dataType: 'json',
            success: function (data) {
                // $("input[name='status'][value ='" + data[0].type + "']").attr("checked", "checked").parent().addClass('checked');
                $("#jobClass").textbox('setValue', data[0].jobClass);
                // $("#opinions").textbox('setValue', data[0].opinions);
                // $("#sort").textbox('setValue', data[0].sort);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#userCode").val() == "") {
            $.messager.alert('Field Required', 'User code must be entered!');
            return false;
        }
        if ($("#opinions").val() == "") {
            $.messager.alert('Field Required', 'Opinions must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid: $("#uuid").val(),
            type: $('input[name="type"]:checked').val(),
            userCode: $("#userCode").val(),
            opinions: $("#opinions").val(),
            sort: $("#sort").val(),
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/scheduler/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#comLanguageConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>