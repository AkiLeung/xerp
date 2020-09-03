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
        flowUuid:<input value="<%=request.getParameter("flowUuid")%>" name="flowUuid" type="text" id="flowUuid"/>
        nodeUuid:<input value="<%=request.getParameter("nodeUuid")%>" name="nodeUuid" type="text" id="nodeUuid"/>
    </span>
        <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td bgColor="#F9FBFC"
                    style="COLOR: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
                    &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif" style="width: 16px; height: 16px"/>
                    &nbsp;<span style="color: red;font-size: 12px;font-weight: bold" id="flowName" name="flowName"></span> -
                    &nbsp;<span style="color: black;font-size: 12px;font-weight: bold" id="nodeName" name="nodeName"></span> -
                    流向列表
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
                    if(row.directionType=='<%=ConfigConst.STR_FLOW_DIRECTION_SEND_NUM%>'){
                        row.directionText = '<%=ConfigConst.STR_FLOW_DIRECTION_SEND_TXT%>';
                     }
                    if(row.directionType=='<%=ConfigConst.STR_FLOW_DIRECTION_BACK_NUM%>'){
                        row.directionText = '<%=ConfigConst.STR_FLOW_DIRECTION_BACK_TXT%>';
                    }
                },
            toolbar:toolbar">
        </table>
    </div>

    <div id="flowDirectionConfig" class="easyui-dialog" style="width:900px;height:590px"
         data-options="
         iconCls:'icon-setting',
         title:'流向配置',
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
                        $('#ifrFlowDirectionConfig')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#flowDirectionConfig').dialog('close');
					}
				}],cls:'c8'">
        <iframe id="ifrFlowDirectionConfig" name="ifrFlowDirectionConfig" src="" width="100%" height="100%"
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
            showDialogWin('ifrFlowDirectionConfig', 'flowDirectionConfig',
                '<%=basePath %>sysConfig/flowDirection/gotoConfPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>'+
                '&flowUuid=<%=request.getParameter("flowUuid")%>'+
                '&nodeUuid=<%=request.getParameter("nodeUuid")%>');
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
                    $.post("<%=basePath%>sysConfig/flowDirection/deleteData.action", {
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
            var urlPath = "<%=basePath %>sysConfig/flowNode/gotoListPage.action?flowUuid=<%=request.getParameter("flowUuid")%>&nodeUuid=<%=request.getParameter("nodeUuid")%>";
            jsLocation(urlPath);
        }
    }
    ];

    //dataGrid basic Setting
    $(function () {
        //顯示當前編輯的流程
        if ($("#flowUuid").val() != "") {
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
        ;

        //顯示當前編輯的節點
        if ($("#nodeUuid").val() != "") {
            $.ajax({
                async: false,
                type: 'get',
                url: '<%=basePath%>sysConfig/flowNode/listByUuid.action?uuid=' + $("#nodeUuid").val(),
                dataType: 'json',
                success: function (data) {
                    if (data != null) {
                        $("#nodeName").text("【" + data[0].nodeName + "】");
                    }
                }
            });
        };

        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/flowDirection/listData.action?flowUuid=<%=request.getParameter("flowUuid")%>&nodeUuid=<%=request.getParameter("nodeUuid")%>',
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'flowUuid', title: 'flowUuid', width: 100, hidden: true},
                {field: 'nodeUuid', title: 'nodeUuid', width: 100, hidden: true},
                {field: 'directionType', title: 'directionType', width: 50, hidden: true},
                {field: 'directionText', title: '狀態', width: 100},
                {
                    field: 'directionCode', title: '流向編碼', width: 80, align: 'center', halign: 'center',
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrFlowDirectionConfig","flowDirectionConfig","' +
                            '<%=basePath %>sysConfig/flowDirection/gotoConfPage.action?ws=update&flowUuid='+ row.flowUuid
                            + '&nodeUuid=' + row.nodeUuid
                            + '&uuid=' + row.uuid + '");>'
                            + row.directionCode + '</a>';
                    }
                },
                {
                    field: 'directionName', title: '流向名稱', width: 200, align: 'center', halign: 'center',
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrFlowDirectionConfig","flowDirectionConfig","' +
                            '<%=basePath %>sysConfig/flowDirection/gotoConfPage.action?ws=update&flowUuid='+ row.flowUuid
                            + '&nodeUuid=' + row.nodeUuid
                            + '&uuid=' + row.uuid + '");>'
                            + row.directionName + '</a>';
                    }
                },
                {field: 'targetNodeName', title: '目標環節', width: 100},
                {field: 'comment', title: '備註', width: 100},
                {field: 'sort', title: '排序', width: 50},
                {field: 'createdBy', title: '創建人', width: 80},
                {field: 'createdDatetime', title: '創建時間', width: 150},
                {field: 'modifiedBy', title: '最後修改人', width: 80},
                {field: 'modifiedDatetime', title: '最後修改時間', width: 150},
            ]]
        });
    });
</script>