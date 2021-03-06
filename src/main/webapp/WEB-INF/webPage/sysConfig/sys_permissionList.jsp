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
    <div data-options="region:'north'" style="height:28px">
        <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td bgColor="#F9FBFC"
                    style="COLOR: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
                    &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif"
                               style="width: 16px; height: 16px"/>&nbsp;权限列表
                </td>
            </tr>
            <tr>
                <td bgColor="#0a589a" style="COLOR: #000000;height:2px"></td>
            </tr>
            <tr>
                <td style="height:1px"></td>
            </tr>
        </table>
    </div>
    <div data-options="region:'center'">
        <table id="dataList" class="easyui-datagrid" style="width:100%;" fit="true"
               data-options="
               singleSelect:true,
               rownumbers:true,
               pagination:true,
               idField:'uuid',
               nowarp:false,
               border:false,
               pageSize:30,
               pageList:[30,50,70],
               collapsible:true,
               method:'get',
               rowStyler: function(index,row){
                if(row.status=='<%=ConfigConst.STR_STATUS_ACTIVE_NUM%>'){row.statusTxt= '<%=ConfigConst.STR_STATUS_ACTIVE_TXT%>';}
                if(row.status=='<%=ConfigConst.STR_STATUS_BLOCK_NUM%>'){row.statusTxt = '<b><%=ConfigConst.STR_STATUS_BLOCK_TXT%><b>';}
                if(row.status=='<%=ConfigConst.STR_STATUS_DELETE_NUM%>'){row.statusTxt = '<b><i><%=ConfigConst.STR_STATUS_DELETE_TXT%><i><b>';}
           },
           toolbar:toolbar">
        </table>
    </div>
    <div id="permissionConfig" class="easyui-dialog" style="width:900px;height:350px"
         data-options="
         iconCls:'icon-setting',
         title:'权限配置',
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
                        $('#ifrPermissionConfig')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#permissionConfig').dialog('close');
					}
				}],cls:'c8'">
        <iframe id="ifrPermissionConfig" name="ifrPermissionConfig" src="" width="100%" height="100%"
                frameborder="0"></iframe>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //Toolbar
    var toolbar = [{
        text: '新增',
        iconCls: 'icon-add',
        handler: function () {
            showDialogWin('ifrPermissionConfig', 'permissionConfig',
                '<%=basePath %>sysConfig/permission/gotoConfPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>');
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
                    $.post("<%=basePath%>sysConfig/permission/deleteData.action", {
                        uuids: uuids
                    }, function (result) {
                        if (result.success) {
                            $("#dataList").datagrid("reload");
                            $('#dataList').datagrid('clearSelections');
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

    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/permission/listData.action',
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'status', title: 'status', width: 50, hidden: true},
                {field: 'statusTxt', title: '狀態', width: 100},
                {
                    field: 'permissionCode', title: '权限编码', width: 200,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrPermissionConfig","permissionConfig",' +
                            '"<%=basePath %>sysConfig/permission/gotoConfPage.action?ws=update&uuid=' + row.uuid + '");>'
                            + row.permissionCode + '</a>';
                    }
                },
                {
                    field: 'permissionName', title: '权限名稱', width: 250,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrPermissionConfig","permissionConfig",' +
                            '"<%=basePath %>sysConfig/permission/gotoConfPage.action?ws=update&uuid=' + row.uuid + '");>'
                            + row.permissionName + '</a>';
                    }
                },
                {field: 'permissionUrl', title: '权限地址', width: 250},
                {field: 'comment', title: '備註', width: 250},
            ]],
            onLoadSuccess: function (data) {
                //加载完毕后获取所有的checkbox遍历
                if (data.rows.length > 0) {
                    //循环判断操作
                    for (var i = 0; i < data.rows.length; i++) {
                        if (data.rows[i].status != '<%=ConfigConst.STR_STATUS_DELETE_NUM%>') {
                            $("input[type='checkbox']")[i + 1].disabled = true;
                        }
                    }
                }
            },
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
</script>