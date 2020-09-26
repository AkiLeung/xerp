<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<div id="popuRoleSelectList" class="easyui-dialog" title="Please select role"
     style="width:500px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Select',
					iconCls:'icon-tip',
					handler:function(){
					    var selectedRows = $('#dataList').datagrid('getSelections');
					    if (selectedRows.length == 0) {
                        $.messager.alert('Message', 'Please Choose Data First！');
                            return;
                        }
					    $('#popuRoleSelectList').dialog('close');
					    if(selectedRows.length > 0 ){
					        $.ajax({
                                async: true,
                                type: 'get',
                                url: '<%=basePath%>sysConfig/role/listByUuid.action?uuid=' + selectedRows[0].uuid,
                                dataType: 'json',
                                success: function (data) {
                                    $('#'+ $('#fieldCode').val()).textbox('setValue',data[0].roleCode);
                                    $('#'+ $('#fieldName').val()).textbox('setValue',data[0].roleName);
                                },
                                error: function (data) {
                                    alert('JSON数据获取失败，请联系管理员！');
                                }
                                });
					    }
					}
				},{
					text:'Clear',
					iconCls:'icon-clear',
					handler:function(){
						$('#'+$('#fieldCode').val()).textbox('setValue','');
						$('#'+$('#fieldName').val()).textbox('setValue','');
						$('#popuRoleSelectList').dialog('close');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#popuRoleSelectList').dialog('close');
					}
				}]">
    <table id="dataList" class="easyui-datagrid" style="width:100%;" fit="true"
           data-options="
                   toolbar:'#toolbar',
                   singleSelect:true,
                   rownumbers:true,
                   pagination:false,
                   idField:'uuid',
                   nowarp:false,
                   border:false,
                   collapsible:true,
                   method:'get'">
        <thead>
        <tr>
            <th data-options="field:'cb',width:30,checkbox:'true',hidden:true"></th>
            <th data-options="field:'uuid',width:100,hidden:true">uuid</th>
            <th data-options="field:'roleCode',width:150,hidden:false">角色编码</th>
            <th data-options="field:'roleName',width:300,hidden:false">角色名称</th>
        </tr>
        </thead>
    </table>
</div>
<div id="toolbar" style="padding:10px;height:auto">
    <div>
        &nbsp;&nbsp;条件: &nbsp;<input id="search" name="search" class="easyui-textbox" style="width:360px">
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:bandData()">查询</a>
    </div>
</div>
<span style="display: none">
        selectValue:<input type="text" value="" id="selectValue" name="selectValue"><br>
        fieldCode:<input type="text" value="" id="fieldCode" name="fieldCode"><br>
        fieldName:<input type="text" value="" id="fieldName" name="fieldName"><br>
        type:<input type="text" value="" id="type" name="type"><br>
</span>
<script type="text/javascript">
    //選擇
    function openRoleSelect(returnCode,returnName,single) {
        $('#popuRoleSelectList').dialog('open');
        $("#fieldCode").val(returnCode);
        $("#fieldName").val(returnName);
        $("#type").val(single);
        //加载数据
        bandData();
    }

    //绑定数据
    function bandData() {
        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/role/listDataAll.action?search='+$('#search').val(),
        });
    }
</script>