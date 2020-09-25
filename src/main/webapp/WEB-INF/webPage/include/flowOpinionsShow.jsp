<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<table id="opinionsList" class="easyui-datagrid" style="width:100%;" fit="true" title="办理意见"
       data-options="
               collapsible:true,
               singleSelect:true,
               rownumbers:true,
               pagination:false,
               idField:'uuid',
               nowarp:false,
               border:false,
               method:'get'">
    <thead>
    <tr>
        <th data-options="field:'uuid',width:100,hidden:true">uuid</th>
        <th data-options="field:'docUuid',width:100,hidden:true">docUuid</th>
        <th data-options="field:'userCode',width:80,hidden:true">userCode</th>
        <th data-options="field:'createdDatetime',width:150,hidden:false">办理时间</th>
        <th data-options="field:'userName',width:120,hidden:false">办理人员</th>
        <th data-options="field:'flowFrmNodeName',width:120,hidden:false">办理环节</th>
        <th data-options="field:'opinions',width:1024,hidden:false">办理意见</th>
    </tr>
    </thead>
</table>
<script>
    //加载数据
    $('#opinionsList').datagrid({
        url: '<%=basePath%>opinions/listDataByDocUuid.action?docUuid='+$("#uuid").val(),
    });
</script>