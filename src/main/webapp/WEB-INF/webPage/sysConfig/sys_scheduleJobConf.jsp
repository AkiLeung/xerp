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
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/></td>
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
                所属组
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
                <input class="easyui-datetimebox" data-options="" value=""
                       name="startTime" type="text"
                       id="startTime" style="width:450px"/>
                (yyyy-MM-dd hh:mm:ss)
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
            url: "<%=basePath %>sysConfig/scheduler/listByUuid.action?ws=" + webStatus + "&uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#jobClass").textbox('setValue', data[0].jobClass);
                $("#jobGroup").textbox('setValue', data[0].jobGroup);
                $("#jobName").textbox('setValue', data[0].jobName);
                $("#triggerName").textbox('setValue', data[0].triggerName);
                $("#triggerGroup").textbox('setValue', data[0].triggerGroup);
                $("#cronExpr").textbox('setValue', data[0].cronExpr);
                $("#startTime").textbox('setValue', data[0].startTime);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#jobClass").val() == "") {
            $.messager.alert('Field Required', 'Job Class must be entered!');
            return false;
        }
        if ($("#jobGroup").val() == "") {
            $.messager.alert('Field Required', 'Job Group must be entered!');
            return false;
        }

        if ($("#jobName").val() == "") {
            $.messager.alert('Field Required', 'Job Name must be entered!');
            return false;
        }

        if ($("#triggerName").val() == "") {
            $.messager.alert('Field Required', 'Trigger Name must be entered!');
            return false;
        }

        if ($("#triggerGroup").val() == "") {
            $.messager.alert('Field Required', 'Trigger Group must be entered!');
            return false;
        }

        if ($("#cronExpr").val() == "") {
            $.messager.alert('Field Required', 'Cron Expr must be entered!');
            return false;
        }

        if ($("#startTime").val() == "") {
            $.messager.alert('Field Required', 'Start Time must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid: $("#uuid").val(),
            status: $('input[name="status"]:checked').val(),
            jobClass: $("#jobClass").val(),
            jobGroup: $("#jobGroup").val(),
            jobName: $("#jobName").val(),
            triggerName: $("#triggerName").val(),
            triggerGroup: $("#triggerGroup").val(),
            cronExpr: $("#cronExpr").val(),
            startTime: $("#startTime").val(),
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
                parent.$('#schedulerConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>