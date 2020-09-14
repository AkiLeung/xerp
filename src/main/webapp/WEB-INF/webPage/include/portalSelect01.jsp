<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="popuPortalSelectList" class="easyui-dialog" title="Please select Portal"
     style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Select',
					iconCls:'icon-tip',
					handler:function(){
					    var uuid = $('#ifrSysPortalSelectList').contents().find('#uuid').val();
					    $('#'+ifrSysPortalSelectList.$('#fieldCode').val()).textbox('setValue',uuid);
					    $('#popuPortalSelectList').dialog('close');
					    if(uuid !=''){
					        $.ajax({
                                async: true,
                                type: 'get',
                                url: '<%=basePath%>sysConfig/portal/listByUuid.action?uuid=' + uuid,
                                dataType: 'json',
                                success: function (data) {
                                    $('#'+ifrSysPortalSelectList.$('#fieldName').val()).textbox('setValue',data.portalName);
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
						$('#'+ifrSysPortalSelectList.$('#fieldCode').val()).textbox('setValue','');
						$('#'+ifrSysPortalSelectList.$('#fieldName').val()).textbox('setValue','');
						$('#popuPortalSelectList').dialog('close');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#popuPortalSelectList').dialog('close');
					}
				}]">
    <iframe id="ifrSysPortalSelectList" name="ifrSysPortalSelectList" src="" width="100%" height="100%"
            frameborder="0"></iframe>
</div>
<script type="text/javascript">
    //選擇
    function openPortalSelect(urlPath) {
        window.ifrSysPortalSelectList.location.href = urlPath;
        $('#popuPortalSelectList').dialog('open');
    }
</script>