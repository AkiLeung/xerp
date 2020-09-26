<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Menu Module</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body style="text-align: center">
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north'" style="height:40px">
        <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td bgColor="#0a589a" style="COLOR: #000000;height:2px"></td>
            </tr>
            <tr>
                <td style="height:35px;background-color:#e3e5de">
                    &nbsp;
                    <img alt="info" src="<%=basePath%>static/image/info3.png"/>
                    &nbsp;<b>条件</b>：
                    <input class="easyui-textbox" value="" name="search" type="text" id="search" style="width:350px"
                           data-options="prompt: 'Input something here!'"/>
                    &nbsp;&nbsp;
                    <a href="#" class="easyui-linkbutton" iconCls="icon-search" style="width:90px;height:25px" onclick="doSearch()">查询</a>
                </td>
            </tr>
        </table>
    </div>
    <div data-options="region:'center'">
        <table id="dataList" class="easyui-datagrid" style="width:100%;" fit="true"
               data-options="
               singleSelect:false,
               rownumbers:true,
               pagination:true,
               idField:'uuid',
               nowarp:false,
               border:false,
               pageSize:30,
               pageList:[30,50,70],
               collapsible:true,
               method:'get'">
        </table>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/permission/listData.action?search='+$("#search").val(),
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'permissionCode', title: '权限编码', width: 150},
                {field: 'permissionName', title: '权限名稱', width: 150},
                {field: 'permissionUrl', title: '权限地址', width: 200}
            ]],
            onClickRow: function (rowIndex, rowData) {
                //加载完毕后获取所有的checkbox遍历
                $("input[type='checkbox']").each(function (index, el) {
                    //如果当前的复选框不可选，则不让其选中
                    if (el.disabled == true) {
                        $('#dataList').datagrid('unselectRow', index - 1);
                    }
                })
            }
        });
    });

    //保存提交時執行
    function saveData() {
        var selectedRows = $("#dataList").datagrid('getSelections');
        if (selectedRows.length == 0) {
            $.messager.alert("Message", "Please Choose Data First！");
            return;
        }
        var arrayIds = [];
        for (var i = 0; i < selectedRows.length; i++) {
            arrayIds.push(selectedRows[i].permissionCode);
        }
        var permissionCodes = arrayIds.join(",");
        //執行保存
        var objData = {
            roleCode: "<%=request.getParameter("roleCode")%>",
            permissionCodes: permissionCodes
        };
        var jsonData = JSON.stringify(objData);
        $.ajax({
            type: "POST",
            url: "<%=basePath %>/sysConfig/rolePermission/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#assignPermission').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function () {
            },
        });
    }

    //查询
    function doSearch(){
        var url='<%=basePath%>sysConfig/permission/listData.action?search='+$("#search").val();
        $('#dataList').datagrid('options').url = url;
        $("#dataList").datagrid('reload');
        $('#dataList').datagrid('clearSelections');
    }
</script>