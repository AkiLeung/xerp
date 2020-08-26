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
                uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/></td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 20%;">
                角色编号
            </td>
            <td class="tblCell" style="width: 80%;">
                <label id="roleCode" name="roleCode"></label>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                角色名称
            </td>
            <td class="tblCell">
                <label id="roleName" name="roleName"></label>
        </tr>
        <tr>
            <td class="tblTitle">
                備註信息
            </td>
            <td class="tblCell">
                <label id="comment" name="comment"></label>
            </td>
        </tr>
    </table>
    <div data-options="region:'center'">
        <table id="dataList" class="easyui-datagrid" title="权限清单" style="width:885px;height:623px"
               data-options="
               rownumbers:true,
               idField:'uuid',
               pagination:true,
               singleSelect:false,
               nowarp:false,
               border:false,
               pageSize:20,
               pageList:[20,30,50],
               collapsible:true,
               url:'<%=basePath%>sysConfig/rolePermission/listData.action?roleCode=<%=request.getParameter("roleCode")%>',
               method:'get',
               toolbar:toolbar">
            <thead>
            <tr>
                <th data-options="field:'uuid',width:100,hidden: true">uuid</th>
                <th data-options="field:'roleCode',width:100,hidden: true">roleCode</th>
                <th data-options="field:'cb',checkbox: 'true',width:20"></th>
                <th data-options="field:'permissionCode',width:150">权限编码</th>
                <th data-options="field:'permissionName',width:140">权限名称</th>
                <th data-options="field:'permissionUrl',width:200">权限地址</th>
                <th data-options="field:'createdBy',width:80">创建人</th>
                <th data-options="field:'createdDatetime',width:150">创建时间</th>
            </tr>
            </thead>
        </table>
    </div>
    <div id="assignPermission" class="easyui-dialog" style="width:90%;height:650px"
         data-options="
         iconCls:'icon-setting',
         title:'权限选择',
         closed:true,
         modal:true,
         collapsible:false,
         minimizable:false,
         maximizable:false,
         draggable:true,
         resizable:false,
         buttons: [{
					text:'Save',
					iconCls:'icon-save',
					handler:function(){
                        $('#ifrAssignPermission')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#assignPermission').dialog('close');
					}
				}],cls:'c8'">
        <iframe id="ifrAssignPermission" name="ifrAssignPermission" src="" width="100%" height="100%"
                frameborder="0"></iframe>
    </div>
</form>
</body>
</html>
<script>
    //Toolbar
    var toolbar = [{
        text: '新增',
        iconCls: 'icon-add',
        handler: function () {
            showDialogWin('ifrAssignPermission', 'assignPermission',
                '<%=basePath %>sysConfig/rolePermission/gotoAssignPage.action?roleCode=<%=request.getParameter("roleCode")%>');
        }
    }, '-', {
        text: '删除',
        iconCls: 'icon-remove',
        handler: function () {
            var selectedRows = $("#dataList").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("Message", "Please Choose Data First！");
                return;
            }
            var arrayIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                arrayIds.push(selectedRows[i].uuid);
            }
            var uuids = arrayIds.join(",");
            $.messager.confirm("Message", "Are Sure to this option?", function (r) {
                if (r) {
                    $.post("<%=basePath%>sysConfig/rolePermission/deleteData.action", {
                        uuids: uuids
                    }, function (result) {
                        if (result.success) {
                            $("#dataList").datagrid("reload");
                        } else {
                            $.messager.error("Error", "Please contact system administrator！");
                        }
                    }, "json");
                }
            });
        }
    }, '-', {
        text: '刷新',
        iconCls: 'icon-reload',
        handler: function () {
            $("#dataList").datagrid("reload");
        }
    }];

    //Default Execution or Setting
    $(function () {
        $.ajax({
            async: true,
            type: 'get',//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysConfig/role/listByUuid.action?uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("#roleCode").text(data[0].roleCode);
                $("#roleName").text(data[0].roleName);
                $("#comment").text(data[0].comment);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    });
</script>