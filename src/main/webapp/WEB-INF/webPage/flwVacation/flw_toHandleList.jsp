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
                               style="width: 16px; height: 16px"/>&nbsp;我的待办
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
           },
           toolbar:toolbar">
        </table>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //Toolbar
    var toolbar = [{
        text: 'Refresh',
        iconCls: 'icon-reload',
        handler: function () {
            $("#dataList").datagrid("reload");
        }
    }];

    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>vacation/listDataToHandler.action',
            columns: [[
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'billNumber', title: '单号', width: 50},
                {
                    field: 'subject', title: '待办项目', width: 80,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="<%=basePath %>vacation/mainForm.action?uuid=' + row.uuid + '&flowCode=flow00002")>' + row.subject + '</a>';
                    }
                },
                {field: 'flowName', title: '待办流程', width: 150},
                {field: 'flowNodeName', title: '待办环节', width: 150},
                {field: 'curHandlerNam', title: '待办人', width: 150},
                {field: 'flowCreatorNam', title: '创建人', width: 150},
                {field: 'createdDatetime', title: '创建时间', width: 150},
                {field: 'updatedDatetime', title: '最后修改时间', width: 150},
            ]]
        });
    });
</script>