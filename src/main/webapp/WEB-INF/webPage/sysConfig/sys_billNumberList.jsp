<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Flow Module</title>
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
                               style="width: 16px; height: 16px"/>&nbsp;单号配置
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
                if(row.status=='<%=ConfigConst.STR_STATUS_ACTIVE_NUM%>'){
                    row.statusTxt= '<%=ConfigConst.STR_STATUS_ACTIVE_TXT%>';
                }
                if(row.status=='<%=ConfigConst.STR_STATUS_BLOCK_NUM%>'){
                    row.statusTxt = '<b><%=ConfigConst.STR_STATUS_BLOCK_TXT%><b>';
                }
                if(row.status=='<%=ConfigConst.STR_STATUS_DELETE_NUM%>'){
                    row.statusTxt = '<b><i><%=ConfigConst.STR_STATUS_DELETE_TXT%><i><b>';
                }
                },
               toolbar:toolbar">
        </table>
    </div>
    <div id="billNumberConfig" class="easyui-dialog" style="width:900px;height:450px"
         data-options="
         iconCls:'icon-setting',
         title:'单号配置',
         closed:true,
         modal:true,
         collapsible:true,
         minimizable:false,
         maximizable:false,
         draggable:true,
         resizable:false,
         buttons: [{
					text:'Save',
					iconCls:'icon-save',
					handler:function(){
                        $('#ifrBillNumberConfig')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#billNumberConfig').dialog('close');
					}
				}],cls:'c8'">
        <iframe id="ifrBillNumberConfig" name="ifrBillNumberConfig" src="" width="100%" height="100%"
                frameborder="0"></iframe>
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
            showDialogWin('ifrBillNumberConfig', 'billNumberConfig',
                '<%=basePath %>sysConfig/billNumber/gotoConfPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>');
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
                    $.post("<%=basePath%>sysConfig/billNumber/deleteData.action", {
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
            url: '<%=basePath%>sysConfig/billNumber/listData.action',
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'status', title: 'status', width: 50, hidden: true},
                {field: 'statusTxt', title: '狀態', width: 100},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {
                    field: 'moduleCode', title: '模塊編碼', width: 100,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrBillNumberConfig","billNumberConfig",' +
                            '"<%=basePath %>sysConfig/billNumber/gotoConfPage.action?ws=update&uuid=' + row.uuid + '");>'
                            + row.moduleCode + '</a>';
                    }
                },
                {
                    field: 'moduleName', title: '模塊名稱', width: 250,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrBillNumberConfig","billNumberConfig",' +
                            '"<%=basePath %>sysConfig/billNumber/gotoConfPage.action?ws=update&uuid=' + row.uuid + '");>'
                            + row.moduleName + '</a>';
                    }
                },
                {field: 'incrementRange', title: '增量类型', width: 100},
                {field: 'defaultLength', title: '默认长度', width: 100},
                {field: 'preNumWord', title: '默认前缀', width: 150},
                {field: 'currentRange', title: '当前范围', width: 100},
                {field: 'currentValue', title: '当前单号', width: 100},
                {
                    field: 'currentNumber', title: '完整单号', width: 250,
                    formatter: function (value, row, index) {
                        return row.preNumWord + ' ' + row.currentRange + '' + PrefixInteger(row.currentValue, row.defaultLength);
                    }
                },
                {field: 'createdDatetime', title: '创建时间', width: 150},
                {field: 'updatedDatetime', title: '修改时间', width: 150},
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

    // num传入的数字，n需要的字符长度
    function PrefixInteger(num, n) {
        return (Array(n).join(0) + num).slice(-n);
    }
</script>