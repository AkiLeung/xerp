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
                               style="width: 16px; height: 16px"/>&nbsp;定时任务
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
                if(row.status=='0'){row.statusTxt= 'Stop';}
                if(row.status=='1'){row.statusTxt = '<b>Running<b>';}
                },
               toolbar:toolbar">
        </table>
    </div>
    <div id="schedulerConfig" class="easyui-dialog" style="width:900px;height:450px"
         data-options="
         iconCls:'icon-setting',
         title:'定时任务维护',
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
                        $('#ifrSchedulerConfig')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#schedulerConfig').dialog('close');
					}
				}],cls:'c8'">
        <iframe id="ifrSchedulerConfig" name="ifrSchedulerConfig" src="" width="100%" height="100%"
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
            showDialogWin('ifrSchedulerConfig', 'schedulerConfig',
                '<%=basePath %>sysConfig/scheduler/gotoConfPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>');
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
                    $.post("<%=basePath%>sysConfig/scheduler/deleteData.action", {
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
            url: '<%=basePath%>sysConfig/scheduler/listData.action',
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {
                    field: 'jobClass', title: '执行类', width: 250,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrSchedulerConfig","schedulerConfig",' +
                            '"<%=basePath %>sysConfig/scheduler/gotoConfPage.action?ws=update&uuid=' + row.uuid + '");>'
                            + row.jobClass + '</a>';
                    }
                },
                {
                    field: 'jobGroup', title: '所属组', width: 150,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrSchedulerConfig","schedulerConfig",' +
                            '"<%=basePath %>sysConfig/scheduler/gotoConfPage.action?ws=update&uuid=' + row.uuid + '");>'
                            + row.jobGroup + '</a>';
                    }
                },
                {field: 'jobName', title: '任务名称', width: 100},
                {field: 'triggerName', title: '触发名', width: 100},
                {field: 'triggerGroup', title: '触发组', width: 100},
                {field: 'status', title: '状态', width: 50, hidden: true},
                {field: 'statusTxt', title: '状态', width: 100},
                {field: 'cronExpr', title: '定时计划', width: 150},
                {field: 'startTime', title: '开始时间', width: 150},
                {
                    field: 'option1', title: '操作', width: 90, align: 'center',
                    formatter: function (value, row, index) {
                        var btn01 = '<span style="color:grey">启用</span>';
                        if(row.status == '0') {
                            //btn01 = '<input id="sb" class="easyui-switchbutton" checked style="width:100px;height:30px">';
                            btn01 = '<a style="color:blue;font-weight: bold"  onclick="updatePassword(\'' + row.jobId + '\')" href="javascript:void(0)">启用</a>';
                        }
                        return btn01;
                    }
                },
                {
                    field: 'option2', title: '操作', width: 90, align: 'center',
                    formatter: function (value, row, index) {
                        var btn02 = '<span style="color:grey">停用</span>';
                        if(row.status == '1') {
                            btn02 = '<a style="color:blue;font-weight: bold"  onclick="updatePassword(\'' + row.jobId + '\')" href="javascript:void(0)">停用</a>';
                        }
                        return btn02;
                    }
                }
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
</script>