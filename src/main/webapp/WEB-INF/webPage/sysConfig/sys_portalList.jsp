<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north'" style="height:28px">
        <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td bgColor="#F9FBFC"
                    style="COLOR: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
                    &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif"
                               style="width: 16px; height: 16px"/>&nbsp;門戶列表
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
    <div id="portalConfig" class="easyui-dialog" style="width:900px;height:330px"
         data-options="
         iconCls:'icon-setting',
         title:'门户配置',
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
                        $('#ifrPortalConfig')[0].contentWindow.saveData();
                        $('#portalConfig').dialog('close');
                        $('#dataList').datagrid('reload');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#portalConfig').dialog('close');
					}
				}]">
        <iframe id="ifrPortalConfig" name="ifrPortalConfig" src="" width="100%" height="100%" frameborder="0"></iframe>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //Toolbar
    var toolbar = [
        '-', {
            text: 'Add New',
            iconCls: 'icon-add',
            handler: function () {
                showDialogWin('ifrPortalConfig', 'portalConfig', '<%=basePath %>sysConfig/portal/gotoConfPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>');
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
                var arrList = [];
                for (var i = 0; i < selectedRows.length; i++) {
                    arrList.push(selectedRows[i].uuid);
                }
                var uuids = arrList.join(",");
                $.messager.confirm("Message", "Are Sure to this option?", function (r) {
                    if (r) {
                        $.post("<%=basePath%>sysConfig/portal/deleteData.action", {
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
            text: 'Refresh',
            iconCls: 'icon-reload',
            handler: function () {
                $("#dataList").datagrid("reload");
            }
        }];

    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/portal/listData.action',
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'status', title: 'status', width: 50, hidden: true},
                {field: 'statusTxt', title: '狀態', width: 100},
                {
                    field: 'portalCode', title: '門戶編碼', width: 100,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrPortalConfig","portalConfig",' +
                            '"<%=basePath %>sysConfig/portal/gotoConfPage.action?ws=update&uuid=' + row.uuid + '")>' + row.portalCode + '</a>';
                    }
                },
                {
                    field: 'portalName', title: '門戶名稱', width: 250,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrPortalConfig","portalConfig",' +
                            '"<%=basePath %>sysConfig/portal/gotoConfPage.action?ws=update&uuid=' + row.uuid + '")>' + row.portalName + '</a>';
                    }
                },
                {field: 'comment', title: '備註信息', width: 250},
                {field: 'sort', title: '默認排序', width: 80},
                {
                    field: 'option1', title: '門戶菜單', width: 100, align: 'center',
                    formatter: function (value, row, index) {
                        var btn01 = '<a class="configPortalMenu"  onclick="configPortalMenu(\'' + row.uuid + '\')" href="javascript:void(0)">配置</a>';
                        return btn01;
                    }
                }
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
                $('.configPortalMenu').linkbutton({plain: true, iconCls: 'icon-module'});
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

    //配置菜單
    function configPortalMenu(uuid) {
        var urlPath = "<%=basePath %>sysConfig/portalMenu/configuration.action?portalUuid=" + uuid;
        jsLocation(urlPath);
    }
</script>
