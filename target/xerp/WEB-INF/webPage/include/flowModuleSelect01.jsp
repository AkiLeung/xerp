<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div id="popuFlowModuleSelectList" class="easyui-dialog" title="Please select module" style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Select',
					iconCls:'icon-tip',
					handler:function(){
					    var selectValue = $('#ifrSysFlowModuleSelectList').contents().find('#selectValue').val();
					    $('#'+ifrSysFlowModuleSelectList.$('#fieldCode').val()).textbox('setValue',selectValue);
					    $('#popuFlowModuleSelectList').dialog('close');
					    if(selectValue !=''){
					        $.ajax({
                                async: true,
                                type: 'get',
                                url: '<%=basePath%>sysConfig/flowModule/getModuleName.action?code=' + selectValue,
                                dataType: 'json',
                                success: function (data) {
                                    $('#'+ifrSysFlowModuleSelectList.$('#fieldName').val()).textbox('setValue',data[0].moduleName);
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
						$('#'+ifrSysFlowModuleSelectList.$('#fieldCode').val()).textbox('setValue','');
						$('#'+ifrSysFlowModuleSelectList.$('#fieldName').val()).textbox('setValue','');
						$('#popuFlowModuleSelectList').dialog('close');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#popuFlowModuleSelectList').dialog('close');
					}
				}]">
    <iframe id="ifrSysFlowModuleSelectList" name="ifrSysFlowModuleSelectList" src="" width="100%" height="100%" frameborder="0"></iframe>
</div>
<script type="text/javascript">
//選擇部門
function openFlowModuleSelect(urlPath) {
    window.ifrSysFlowModuleSelectList.location.href = urlPath;
    $('#popuFlowModuleSelectList').dialog('open');
}
</script>