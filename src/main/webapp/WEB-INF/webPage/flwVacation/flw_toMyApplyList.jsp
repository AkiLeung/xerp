<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north'" style="height:28px">
        <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td bgColor="#F9FBFC"
                    style="COLOR: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
                    &nbsp;<img alt="list" src="<%=basePath%>static/image/info1.png"
                               style="width: 16px; height: 16px"/>&nbsp;我的申请
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
               singleSelect:false,
               rownumbers:true,
               pagination:true,
               idField:'uuid',
               nowarp:false,
               border:false,
               pageSize:30,
               pageList:[30,50,70],
               collapsible:true,
               method:'get',
               striped:true,
               fitColumns:true,
               striped:true,
               rowStyler: function(index,row){
           },
           toolbar:toolbar">
        </table>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //Toolbar
    var toolbar = [ {
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
                    $.post("<%=basePath%>vacation/deleteData.action", {
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
    },'-', {
        text: 'Refresh',
        iconCls: 'icon-reload',
        handler: function () {
            $("#dataList").datagrid("reload");
        }
    }];

    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>vacation/listDataToMyApply.action',
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {
                    field: 'billNumber', title: '单号', width: 150,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="<%=basePath %>vacation/mainForm.action?uuid=' + row.uuid + '")>' + row.billNumber + '</a>';
                    }
                },
                {
                    field: 'subject', title: '待办项目', width: 80,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="<%=basePath %>vacation/mainForm.action?uuid=' + row.uuid + '")>' + row.subject + '</a>';
                    }
                },
                {field: 'flowName', title: '待办流程', width: 150},
                {field: 'flowNodeName', title: '待办环节', width: 150},
                {field: 'curHandlerName', title: '待办人', width: 150},
                {field: 'flowCreatorName', title: '创建人', width: 150},
                {field: 'createdDatetime', title: '创建时间', width: 150},
                {field: 'updatedDatetime', title: '最后修改时间', width: 150},
            ]],
            onLoadSuccess: function (data) {
                //加载完毕后获取所有的checkbox遍历
                if (data.rows.length > 0) {
                    //循环判断操作
                    for (var i = 0; i < data.rows.length; i++) {
                        if (data.rows[i].flowNodeType != '<%=ConfigConst.STR_FLOW_START_NUM%>') {
                            $("input[type='checkbox']")[i + 1].disabled = true;
                        }
                    }
                }
                //隐藏抬头全选Checkbox
                $(".datagrid-header-check").children('input')[0].style.visibility="hidden";
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