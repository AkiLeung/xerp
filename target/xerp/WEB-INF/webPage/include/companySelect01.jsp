<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="popuCompanySelectList" class="easyui-dialog" title="Please select Company"
     style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Select',
					iconCls:'icon-tip',
					handler:function(){
					    var uuid = $('#ifrSysCompanySelectList').contents().find('#uuid').val();
					    if(uuid !=''){
					    	$('#'+ifrSysCompanySelectList.$('#fieldCode').val()).textbox('setValue',uuid);
					        $('#popuCompanySelectList').dialog('close');
					        var urlPath = '<%=basePath%>sysOrg/company/listByUuid.action?uuid=' + uuid;
					        $.ajax({
                                async: true,
                                type: 'get',
                                url: urlPath,
                                dataType: 'json',
                                success: function (data) {
                                    $('#'+ifrSysCompanySelectList.$('#fieldName').val()).textbox('setValue',data[0].companyName);
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
						$('#'+ifrSysCompanySelectList.$('#fieldCode').val()).textbox('setValue','');
						$('#'+ifrSysCompanySelectList.$('#fieldName').val()).textbox('setValue','');
						$('#popuCompanySelectList').dialog('close');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#popuCompanySelectList').dialog('close');
					}
				}]">
    <iframe id="ifrSysCompanySelectList" name="ifrSysCompanySelectList" src="" width="100%" height="100%"
            frameborder="0"></iframe>
</div>
<script type="text/javascript">
    //選擇
    function openCompanySelect(urlPath) {
        window.ifrSysCompanySelectList.location.href = urlPath;
        $('#popuCompanySelectList').dialog('open');
    }
</script>