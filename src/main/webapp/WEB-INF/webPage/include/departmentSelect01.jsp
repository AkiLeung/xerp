<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="popuDepartmentSelectList" class="easyui-dialog" title="Please select Department"
     style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Select',
					iconCls:'icon-tip',
					handler:function(){
					    var uuid = $('#ifrSysDepartmentSelectList').contents().find('#uuid').val();
					    if(uuid !=''){
					    	$('#'+ifrSysDepartmentSelectList.$('#fieldCode').val()).textbox('setValue',uuid);
					        $('#popuDepartmentSelectList').dialog('close');
					        var urlPath = '<%=basePath%>sysOrg/department/listByUuid.action?uuid=' + uuid;
					        $.ajax({
                                async: true,
                                type: 'get',
                                url: urlPath,
                                dataType: 'json',
                                success: function (data) {
                                    $('#'+ifrSysDepartmentSelectList.$('#fieldName').val()).textbox('setValue',data[0].departmentName);
                                },
                                error: function (data) {
                                    $('#'+ifrSysDepartmentSelectList.$('#fieldCode').val()).textbox('setValue','');
                                    $('#'+ifrSysDepartmentSelectList.$('#fieldName').val()).textbox('setValue','');
                                    alert('【'+urlPath+'】JSON数据获取失败，请联系管理员！');
                                }
                                });
					    }else{
					        $.messager.alert('Warning','Please Select First!','warning');
					    }
					}
				},{
					text:'Clear',
					iconCls:'icon-clear',
					handler:function(){
						$('#'+ifrSysDepartmentSelectList.$('#fieldCode').val()).textbox('setValue','');
						$('#'+ifrSysDepartmentSelectList.$('#fieldName').val()).textbox('setValue','');
						$('#popuDepartmentSelectList').dialog('close');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#popuDepartmentSelectList').dialog('close');
					}
				}]">
    <iframe id="ifrSysDepartmentSelectList" name="ifrSysDepartmentSelectList" src="" width="100%" height="100%"
            frameborder="0"></iframe>
</div>
<script type="text/javascript">
    //選擇
    function openDepartmentSelect(urlPath) {
        window.ifrSysDepartmentSelectList.location.href = urlPath;
        $('#popuDepartmentSelectList').dialog('open');
    }
</script>