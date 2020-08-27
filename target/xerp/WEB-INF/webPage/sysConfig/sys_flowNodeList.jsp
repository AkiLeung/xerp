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
<body style="text-align: center">
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north'" style="height:28px">
            <span style="display: none">
            flowUuid:<input value="<%=request.getParameter("flowUuid")%>" name="flowUuid" type="text"
                             id="flowUuid"/>
            </span>
        <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td bgColor="#F9FBFC"
                    style="COLOR: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
                    &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif"
                               style="width: 16px; height: 16px"/>
                    &nbsp;<span style="color: #273466;font-size: 12px;font-weight: bold" id="flowName"
                                name="flowName"></span> -
                    節點列表
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
                   idField:'uuid',
                   nowarp:false,
                   border:false,
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

                        if(row.nodeType=='<%=ConfigConst.STR_FLOW_START_NUM%>'){
                            row.typeTxt= '<%=ConfigConst.STR_FLOW_START_TXT%>';
                        }
                        if(row.nodeType=='<%=ConfigConst.STR_FLOW_TASK_NUM%>'){
                            row.typeTxt = '<%=ConfigConst.STR_FLOW_TASK_TXT%>';
                        }
                        if(row.nodeType=='<%=ConfigConst.STR_FLOW_NODE_NUM%>'){
                            row.typeTxt = '<%=ConfigConst.STR_FLOW_NODE_TXT%>';
                        }
                        if(row.nodeType=='<%=ConfigConst.STR_FLOW_END_NUM%>'){
                            row.typeTxt = '<%=ConfigConst.STR_FLOW_END_TXT%>';
                        }
                   },
                   toolbar:toolbar">
        </table>
    </div>
    <div id="flowNodeConfig" class="easyui-dialog" style="width:900px;height:325px"
         data-options="
         iconCls:'icon-setting',
         title:'环节配置',
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
                        $('#ifrFlowNodeConfig')[0].contentWindow.saveData();
                        $('#flowNodeConfig').dialog('close');
                        $('#datalist').datagrid('reload');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#flowNodeConfig').dialog('close');
					}
				}],cls:'c8'">
        <iframe id="ifrFlowNodeConfig" name="ifrFlowNodeConfig" src="" width="100%" height="100%"
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
            showDialogWin('ifrFlowNodeConfig', 'flowNodeConfig',
                '<%=basePath %>sysConfig/flowNode/gotoConfPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>&flowUuid=<%=request.getParameter("flowUuid")%>');
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
            var array = [];
            for (var i = 0; i < selectedRows.length; i++) {
                array.push(selectedRows[i].uuid);
            }
            var uuids = array.join(",");
            $.messager.confirm("Message", "Are Sure to this option?", function (r) {
                if (r) {
                    $.post("<%=basePath%>sysConfig/flowNode/deleteData.action", {
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
    }, '-', {
        text: '后退',
        iconCls: 'icon-back',
        handler: function () {
            var urlPath = "<%=basePath %>sysConfig/flowName/configuration.action";
            jsLocation(urlPath);
        }
    }];

    //dataGrid basic Setting
    $(function () {
        //顯示當前編輯的流程
        if ($("#flow_uuid").val() != "") {
            $.ajax({
                async: false,
                type: 'get',
                url: '<%=basePath%>sysConfig/flowName/listByUuid.action?uuid=' + $("#flowUuid").val(),
                dataType: 'json',
                success: function (data) {
                    if (data != null) {
                        $("#flowName").text(data[0].flowName);
                    }
                }
            });
        }

        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/flowNode/listData.action?flowUuid=<%=request.getParameter("flowUuid")%>',
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'flowUuid', title: 'flowUuid', width: 100, hidden: true},
                {field: 'status', title: 'status', width: 50, hidden: true},
                {field: 'statusTxt', title: '狀態', width: 100},
                {field: 'nodeType', title: 'status', width: 50, hidden: true},
                {field: 'typeTxt', title: '環節類型', width: 80},
                {
                    field: 'nodeCode', title: '環節編碼', width: 80, align: 'center', halign: 'center',
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrFlowNodeConfig","flowNodeConfig",' +
                            '"<%=basePath %>sysConfig/flowNode/gotoConfPage.action?ws=update&flowUuid=' + row.flowUuid + '&uuid=' + row.uuid + '");>'
                            + row.nodeCode + '</a>';
                    }
                },
                {
                    field: 'nodeName', title: '環節名稱', width: 200, align: 'center', halign: 'center',
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrFlowNodeConfig","flowNodeConfig",' +
                            '"<%=basePath %>sysConfig/flowNode/gotoConfPage.action?ws=update&flowUuid=' + row.flowUuid + '&uuid=' + row.uuid + '");>'
                            + row.nodeName + '</a>';
                    }
                },
                {field: 'comment', title: '備註', width: 250},
                {field: 'createdBy', title: '創建人', width: 80},
                {field: 'createdDatetime', title: '創建時間', width: 150},
                {field: 'modifiedBy', title: '最後修改人', width: 80},
                {field: 'modifiedDatetime', title: '最後修改時間', width: 150},
                {
                    field: 'option', title: '操作', width: 100, align: 'center',
                    formatter: function (value, row, index) {
                        var btn = '';
                        if (row.nodeType != "<%=ConfigConst.STR_FLOW_END_NUM%>") {
                            btn = '<a class="editNode"  onclick="configFlowDirection(\'' + row.flowUuid + '\',\'' + row.uuid + '\')">流向</a>';
                            return btn;
                        } else {
                            return '';
                        }
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
                $('.editNode').linkbutton({plain: true, iconCls: 'icon-node'});
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

    //配置流向
    function configFlowDirection(flowUuid, nodeUuid) {
        var urlPath = "<%=basePath %>sysConfig/flowDirection/gotoListPage.action?flowUuid=" + flowUuid + "&nodeUuid=" + nodeUuid;
        jsLocation(urlPath);
    }
</script>