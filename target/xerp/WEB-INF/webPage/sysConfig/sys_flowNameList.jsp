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
                               style="width: 16px; height: 16px"/>&nbsp;流程列表
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
               pageSize:50,
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
</div>
<div id="flowNameConfig" class="easyui-dialog" style="width:900px;height:700px"
     data-options="
         iconCls:'icon-setting',
         title:'流程配置',
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
                        $('#ifrFlowNameConfig')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#flowNameConfig').dialog('close');
					}
				}],cls:'c8'">
    <iframe id="ifrFlowNameConfig" name="ifrFlowNameConfig" src="" width="100%" height="100%"
            frameborder="0"></iframe>
</div>
<div id="winWorkFlow" class="easyui-window" title="Show Work Flow" style="width:1400px;height:700px;padding:1px;"
     data-options="
     modal:true,
     minimizable: false,
     maximizable: false,
     resizable: false,
     closed:true,
     iconCls:'icon-flow',cls:'c8'">
    <iframe id="ifrWorkFlow" name="ifrWorkFlow" src="" width="100%" height="100%" frameborder="0"></iframe>
</div>
</body>
</html>
<script type="text/javascript">
    //Toolbar
    var toolbar = [{
        text: '新增',
        iconCls: 'icon-add',
        handler: function () {
            showDialogWin('ifrFlowNameConfig', 'flowNameConfig',
                '<%=basePath %>sysConfig/flowName/gotoConfPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>');
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
            var arrayList = [];
            for (var i = 0; i < selectedRows.length; i++) {
                arrayList.push(selectedRows[i].uuid);
            }
            var uuids = arrayList.join(",");
            $.messager.confirm("Message", "Are Sure to this option?", function (r) {
                if (r) {
                    $.post("<%=basePath%>sysConfig/flowName/deleteData.action", {
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

    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/flowName/listData.action',
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'status', title: 'status', width: 50, hidden: true},
                {field: 'statusTxt', title: '狀態', width: 60},
                {field: 'moduleCode', title: 'moduleCode', width: 100, hidden: true},
                {
                    field: 'moduleName', title: '所屬模塊', width: 90,
                    formatter: function (value, row, index) {
                        var flowModule = "";
                        if (row.moduleCode != "") {
                            $.ajax({
                                async: false,
                                type: 'get',
                                url: '<%=basePath%>sysConfig/flowModule/getModuleName.action?code=' + row.moduleCode,
                                dataType: 'json',
                                success: function (data) {
                                    if (data != null) {
                                        flowModule = data[0].moduleName;
                                    }
                                }
                            });
                        }
                        return flowModule;
                    }
                },
                {
                    field: 'flowCode', title: '流程編碼', width: 100, align: 'left', halign: 'center',
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrFlowNameConfig","flowNameConfig",' +
                            '"<%=basePath %>sysConfig/flowName/gotoConfPage.action?ws=update&uuid=' + row.uuid + '");>'
                            + row.flowCode + '</a>';
                    }
                }, {
                    field: 'flowName', title: '流程名稱', width: 250, align: 'left', halign: 'center',
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrFlowNameConfig","flowNameConfig",' +
                            '"<%=basePath %>sysConfig/flowName/gotoConfPage.action?ws=update&uuid=' + row.uuid + '");>'
                            + row.flowName + '</a>';
                    }
                },
                {field: 'flowVersion', title: '版本', width: 60},
                {field: 'comment', title: '備註', width: 200},
                {field: 'createdBy', title: '創建人', width: 80},
                {field: 'createdDatetime', title: '創建時間', width: 150},
                {field: 'modifiedBy', title: '最後修改人', width: 80},
                {field: 'modifiedDatetime', title: '最後修改時間', width: 150},
                {
                    field: 'option1', title: '操作', width: 100, align: 'center',
                    formatter: function (value, row, index) {
                        var btn01 = '<a class="configFlowNode"  onclick="configFlowNode(\'' + row.uuid + '\')" href="javascript:void(0)">配置</a>';
                        return btn01;
                    }
                },
                {
                    field: 'option2', title: '預覽', width: 100, align: 'center',
                    formatter: function (value, row, index) {
                        var btn02 = '<a class="showFlowGraph"  onclick="showFlowGraph(\'' + row.uuid + '\')" href="javascript:void(0)">預覽</a>';
                        return btn02;
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
                $('.configFlowNode').linkbutton({plain: true, iconCls: 'icon-node'});
                $('.showFlowGraph').linkbutton({plain: true, iconCls: 'icon-flow'});
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

    //配置節點
    function configFlowNode(flowUuid) {
        var urlPath = "<%=basePath %>sysConfig/flowNode/gotoListPage.action?flowUuid=" + flowUuid;
        jsLocation(urlPath);
    }

    //預覽流程圖
    function showFlowGraph(flowUuid) {
        var urlPath = "<%=basePath %>sysPopu/gotoFlowGraphPage.action?flowUuid=" + flowUuid;
        window.ifrWorkFlow.location.href = urlPath;
        $('#winWorkFlow').window('open');
    }
</script>