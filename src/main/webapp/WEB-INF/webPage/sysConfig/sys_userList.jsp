<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>User Config</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north'" style="height:28px">
        <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td bgColor="#F9FBFC"
                    style="COLOR: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
                    &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif"
                               style="width: 16px; height: 16px"/>&nbsp;账号列表
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
                if(row.status=='<%=ConfigConst.STR_STATUS_ACTIVE_NUM%>'){row.statusTxt = '<%=ConfigConst.STR_STATUS_ACTIVE_TXT%>';}
                if(row.status=='<%=ConfigConst.STR_STATUS_BLOCK_NUM%>'){row.statusTxt = '<b><%=ConfigConst.STR_STATUS_BLOCK_TXT%><b>';}
                if(row.status=='<%=ConfigConst.STR_STATUS_DELETE_NUM%>'){row.statusTxt = '<b><%=ConfigConst.STR_STATUS_DELETE_TXT%><b>';}
                if(row.userType=='<%=ConfigConst.STR_USER_TYPE_NUM_USER%>'){row.userType = '<%=ConfigConst.STR_USER_TYPE_TXT_USER%>';}
                if(row.userType=='<%=ConfigConst.STR_USER_TYPE_NUM_MANAGER%>'){row.userType = '<%=ConfigConst.STR_USER_TYPE_TXT_MANAGER%>';}
                if(row.userType=='<%=ConfigConst.STR_USER_TYPE_NUM_ADMIN%>'){row.userType = '<%=ConfigConst.STR_USER_TYPE_TXT_ADMIN%>';}
           },
           toolbar:toolbar">
        </table>
    </div>
    <div id="userConfig" class="easyui-dialog" style="width:900px;height:665px"
         data-options="
         iconCls:'icon-setting',
         title:'用户配置',
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
                         $('#ifrUserConfig')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#userConfig').dialog('close');
					}
				}],cls:'c8'">
        <iframe id="ifrUserConfig" name="ifrUserConfig" src="" width="100%" height="100%" frameborder="0"></iframe>
    </div>
    <div id="userPassword" class="easyui-dialog" style="width:400px;height:350px"
         data-options="
         iconCls:'icon-setting',
         title:'修改密码',
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
                       $('#ifrUserPassword')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#userPassword').dialog('close');
					}
				}],cls:'c8'">
        <iframe id="ifrUserPassword" name="ifrUserPassword" src="" width="100%" height="100%" frameborder="0"></iframe>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //Toolbar
    var toolbar = [{
        text: 'Add New',
        iconCls: 'icon-add',
        handler: function () {
            showDialogWin('ifrUserConfig', 'userConfig', '<%=basePath %>sysConfig/user/gotoAddPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>');
        }
    }, '-', {
        text: 'Remove',
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
                    $.post("<%=basePath%>sysConfig/user/deleteData.action", {
                        uuids: uuids
                    }, function (result) {
                        if (result.success) {
                            //$.messager.alert("系统提示", "操作成功！");
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
        text: 'Refresh',
        iconCls: 'icon-reload',
        handler: function () {
            $("#dataList").datagrid("reload");
        }
    }];

    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/user/listData.action',
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'status', title: '狀態', width: 20, hidden: true},
                {field: 'statusTxt', title: '狀態', width: 50},
                {
                    field: 'userCode', title: '用戶編碼', width: 80,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrUserConfig","userConfig","<%=basePath %>sysConfig/user/gotoUpdatePage.action?ws=update&uuid=' + row.uuid + '")>' + row.userCode + '</a>';
                    }
                },
                {field: 'userName', title: '用戶名稱', width: 150},
                {field: 'userType', title: '用戶类型', width: 80},
                {field: 'theme', title: '主题', width: 100},
                {field: 'portalUuid', title: '门户', width: 30, hidden: true},
                {
                    field: 'portalName', title: '门户', width: 100,
                    formatter: function (value, row, index) {
                        var portalName = "";
                        if (row.portalUuid != "") {
                            $.ajax({
                                async: false,
                                type: 'get',
                                url: '<%=basePath%>sysConfig/portal/listByUuid.action?uuid=' + row.portalUuid,
                                dataType: 'json',
                                success: function (portal) {
                                    if (portal != null) {
                                        portalName = portal.portalName;
                                    }
                                }
                            });
                        }
                        return portalName;
                    }
                },
                {field: 'validFrom', title: '有效时间-起', width: 100},
                {field: 'validTo', title: '有效时间-止', width: 100},
                {field: 'language', title: '语言', width: 80},
                {field: 'createdBy', title: '创建人', width: 100},
                {field: 'createdDatetime', title: '创建时间', width: 150},
                {field: 'modifiedBy', title: '最后修改人', width: 80},
                {field: 'modifiedDatetime', title: '最后修改时间', width: 150},
                {
                    field: 'option1', title: '修改密码', width: 90, align: 'center',
                    formatter: function (value, row, index) {
                        var btn01 = '<a style="color:blue;font-weight: bold"  onclick="updatePassword(\'' + row.uuid + '\')" href="javascript:void(0)">修改</a>';
                        return btn01;
                    }
                }
            ]],
            onLoadSuccess: function (data) {
                //加载完毕后获取所有的checkbox遍历
                if (data.rows.length > 0) {
                    //循环判断操作为新增的不能选择
                    for (var i = 0; i < data.rows.length; i++) {
                        //让某些行不可选
                        if (data.rows[i].status != '<%=ConfigConst.STR_STATUS_DELETE_NUM%>') {
                            $("input[type='checkbox']")[i + 1].disabled = true;
                        }
                        if (data.rows[i].userType == '<%=ConfigConst.STR_USER_TYPE_TXT_ADMIN%>') {
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

    //修改密码
    function updatePassword(uuid) {
        var urlPath = "<%=basePath %>sysConfig/user/gotoPasswordPage.action?uuid=" + uuid;
        showDialogWin("ifrUserPassword", "userPassword", urlPath)
    }
</script>