<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="popuBusinessSelectList" class="easyui-dialog" title="Please select Business"
     style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Select',
					iconCls:'icon-tip',
					handler:function(){
					    var uuid = $('#ifrSysBusinessSelectList').contents().find('#uuid').val();
					    if(uuid !=''){
					    	$('#'+ifrSysBusinessSelectList.$('#fieldCode').val()).textbox('setValue',uuid);
					        $('#popuBusinessSelectList').dialog('close');
					        var urlPath = '<%=basePath%>sysOrg/business/listByUuid.action?uuid=' + uuid;
					        $.ajax({
                                async: true,
                                type: 'get',
                                url: urlPath,
                                dataType: 'json',
                                success: function (data) {
                                    $('#'+ifrSysBusinessSelectList.$('#fieldName').val()).textbox('setValue',data[0].businessName);
                                },
                                error: function (data) {
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
						$('#'+ifrSysBusinessSelectList.$('#fieldCode').val()).textbox('setValue','');
						$('#'+ifrSysBusinessSelectList.$('#fieldName').val()).textbox('setValue','');
						$('#popuBusinessSelectList').dialog('close');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#popuBusinessSelectList').dialog('close');
					}
				}]">
    <iframe id="ifrSysBusinessSelectList" name="ifrSysBusinessSelectList" src="" width="100%" height="100%"
            frameborder="0"></iframe>
</div>
<script type="text/javascript">
    //選擇
    function openBusinessSelect(urlPath) {
        window.ifrSysBusinessSelectList.location.href = urlPath;
        $('#popuBusinessSelectList').dialog('open');
    }
</script>