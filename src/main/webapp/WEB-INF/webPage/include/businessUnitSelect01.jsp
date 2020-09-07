<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="popuBusinessUnitSelectList" class="easyui-dialog" title="Please select Business Unit"
     style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Select',
					iconCls:'icon-tip',
					handler:function(){
					    var uuid = $('#ifrSysBusinessUnitSelectList').contents().find('#uuid').val();
					    if(uuid !=''){
					    	$('#'+ifrSysBusinessUnitSelectList.$('#fieldCode').val()).textbox('setValue',uuid);
					        $('#popuBusinessUnitSelectList').dialog('close');
					        var urlPath = '<%=basePath%>sysOrg/businessUnit/listByUuid.action?uuid=' + uuid;
					        $.ajax({
                                async: true,
                                type: 'get',
                                url: urlPath,
                                dataType: 'json',
                                success: function (data) {
                                    $('#'+ifrSysBusinessUnitSelectList.$('#fieldName').val()).textbox('setValue',data[0].unitName);
                                },
                                error: function (data) {
                                    $('#'+ifrSysBusinessUnitSelectList.$('#fieldCode').val()).textbox('setValue','');
                                    $('#'+ifrSysBusinessUnitSelectList.$('#fieldName').val()).textbox('setValue','');
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
						$('#'+ifrSysBusinessUnitSelectList.$('#fieldCode').val()).textbox('setValue','');
						$('#'+ifrSysBusinessUnitSelectList.$('#fieldName').val()).textbox('setValue','');
						$('#popuBusinessUnitSelectList').dialog('close');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#popuBusinessUnitSelectList').dialog('close');
					}
				}]">
    <iframe id="ifrSysBusinessUnitSelectList" name="ifrSysBusinessUnitSelectList" src="" width="100%" height="100%"
            frameborder="0"></iframe>
</div>
<script type="text/javascript">
    //選擇
    function openBusinessUnitSelect(urlPath) {
        window.ifrSysBusinessUnitSelectList.location.href = urlPath;
        $('#popuBusinessUnitSelectList').dialog('open');
    }
</script>