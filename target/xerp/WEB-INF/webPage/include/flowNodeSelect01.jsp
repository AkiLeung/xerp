<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div id="popuFlowNodeSelectList" class="easyui-dialog" title="Please select Flow Node" style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Select',
					iconCls:'icon-tip',
					handler:function(){
					    var uuid = $('#ifrSysFlowNodeSelectList').contents().find('#uuid').val();
					    $('#'+ifrSysFlowNodeSelectList.$('#fieldCode').val()).textbox('setValue',uuid);
					    $('#popuFlowNodeSelectList').dialog('close');
					    if(uuid !='')
					    {
					        $.ajax({
                                async: true,
                                type: 'get',
                                url: '<%=basePath%>sysConfig/flowNode/listByUuid.action?uuid=' + uuid,
                                dataType: 'json',
                                success: function (data) {
                                    $('#'+ifrSysFlowNodeSelectList.$('#fieldName').val()).textbox('setValue',data[0].nodeName);
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
						$('#'+ifrSysFlowNodeSelectList.$('#fieldCode').val()).textbox('setValue','');
						$('#'+ifrSysFlowNodeSelectList.$('#fieldName').val()).textbox('setValue','');
						$('#popuFlowNodeSelectList').dialog('close');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#popuFlowNodeSelectList').dialog('close');
					}
				}]">
    <iframe id="ifrSysFlowNodeSelectList" name="ifrSysFlowNodeSelectList" src="" width="100%" height="100%" frameborder="0"></iframe>
</div>
<script type="text/javascript">
    //選擇部門
    function openFlowNodeSelect(urlPath) {
        window.ifrSysFlowNodeSelectList.location.href = urlPath;
        $('#popuFlowNodeSelectList').dialog('open');
    }
</script>