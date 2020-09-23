<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="flowBtnTool">
    <div class="easyui-panel" style="width: 100%;padding:5px;text-align: right">
        <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,toggle:true,iconCls:'icon-save'"
           style="width:88px;font-weight:bolder"
           onclick="documentSave();">保 存</a>
        <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,toggle:true,iconCls:'icon-ok'"
           style="width:88px;font-weight:bolder"
           onclick="openFlowToNext();">提 交</a>
        <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    </div>
</div>
<script>

</script>