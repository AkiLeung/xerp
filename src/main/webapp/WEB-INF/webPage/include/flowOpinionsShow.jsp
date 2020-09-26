<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<table id="opinionsList" class="easyui-datagrid" style="width:100%;" fit="true" title="办理意见"
       data-options="
               collapsible:true,
               singleSelect:false,
               rownumbers:true,
               pagination:false,
               idField:'uuid',
               nowarp:false,
               border:false,
               method:'get'">
</table>
<script>
    //加载数据
    $('#opinionsList').datagrid({
        url: '<%=basePath%>opinions/listDataByDocUuid.action?docUuid='+$("#uuid").val(),
        columns: [[
            {field: 'uuid', title: 'uuid', width: 100, hidden: true},
            {field: 'docUuid', title: 'docUuid', width: 100, hidden: true},
            {field: 'userCode', title: 'userCode', width: 100, hidden: true},
            {field: 'createdDatetime', title: '办理时间', width: 150},
            {field: 'userName', title: '办理人员', width: 150},
            {
                field: 'processNode', title: '办理环节', width: 180,
                formatter: function (value, row, index) {
                    return  row.flowFrmNodeName + ' -> ' + row.flowTgtNodeName;
                }
            },
            {field: 'opinions', title: '办理意见', width: 1024},
        ]]
    });
</script>