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
    <table class="tbl" style="width:100%;height:250px;">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 20%">
                流程狀態
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
            <td class="tblTitle">
                流程编号
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="flowCode" type="text" id="flowCode"
                       style="width:250px"
                       data-options="prompt:'Enter Flow code.',required:true,validType:'length[3,20]'"/>
                &nbsp;(一经确定不能修改，eg: flow00001 或 hr_flow_00001)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                流程名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="flowName" type="text" id="flowName"
                       style="width:350px"
                       data-options="prompt:'Enter Flow name.',required:true,validType:'length[3,50]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                流程版本
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="flowVersion" type="text" id="flowVersion"
                       style="width:350px"
                       data-options="prompt:'Enter Flow version.',required:true,validType:'length[3,50]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                流程模塊
            </td>
            <td class="tblCell">
                <span style="display:none"><input class="easyui-textbox" value="" id="moduleCode" name="moduleCode" type="text"  style="width:200px"/></span>
                <input class="easyui-textbox" value="" name="moduleName" type="text" id="moduleName"
                       style="width:350px"
                       data-options="iconWidth: 22,
                        prompt:'Select Flow Module...',
                        required:true,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                                //Execution
                               openFlowModuleSelect('<%=basePath %>sysPopu/flowModuleTree.action?code=moduleCode&name=moduleName&type=1');
				            }}]"/>
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
    </table>
    <jsp:include page="../include/flowModuleSelect01.jsp" flush="true"/>
</form>
</body>
</html>
<script>
    //Default Execution or Setting
    $(function () {
        $('#flowCode').textbox('textbox').attr('maxlength', 20);
        $('#flowName').textbox('textbox').attr('maxlength', 50);
        $('#comment').textbox('textbox').attr('maxlength', 150);
        $('#moduleName').textbox('textbox').attr('readonly',true);

        //flow_code Check
        $('#flowCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#flowCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysConfig/flowName/listByCode.action", {
                code: $("#flowCode").val()
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'Flow Code already exist!', 'warning');
                    $("#flowCode").textbox('setValue', "");
                }
            }, "json");
        });
    })


    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysConfig/flowName/listByUuid.action?uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("#flowCode").textbox('textbox').attr('readonly', true);
                $("#flowCode").textbox('textbox').attr('disabled', true);
                $("#moduleCode").textbox('setValue', data[0].moduleCode);
                getFlowModuleName(data[0].moduleCode,"moduleName");
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#flowCode").textbox('setValue', data[0].flowCode);
                $("#flowName").textbox('setValue', data[0].flowName);
                $("#flowVersion").textbox('setValue', data[0].flowVersion);
                $("#comment").textbox('setValue', data[0].comment);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#flowCode").val() == "") {
            $.messager.alert('Field Required', 'Flow code must be entered!');
            return false;
        }
        if ($("#flowName").val() == "") {
            $.messager.alert('Field Required', 'Flow name must be entered!');
            return false;
        }
        if ($("#flowVersion").val() == "") {
            $.messager.alert('Field Required', 'Flow version must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid:$("#uuid").val(),
            status: $('input[name="status"]:checked').val(),
            moduleCode: $("#moduleCode").val(),
            flowCode: $("#flowCode").val(),
            flowName: $("#flowName").val(),
            flowVersion: $("#flowVersion").val(),
            comment: $("#comment").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/flowName/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#flowNameConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }



    //获取流程模塊名称
    function getFlowModuleName(code,field) {
        if (code != '') {
            $.ajax({
                async: true,
                type: 'get',
                url: '<%=basePath%>sysConfig/flowModule/getModuleName.action?code=' + code,
                dataType: 'json',
                success: function (data) {
                    $('#' + field).textbox('setValue', data[0].moduleName);
                },
                error: function (data) {
                    alert('JSON数据获取失败，请联系管理员！');
                }
            });
        }
    }
</script>