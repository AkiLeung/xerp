<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>factory Config</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body style="text-align:left;">
<table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td bgColor="#F9FBFC" style="color: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
            &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif" style="width: 16px; height: 16px"/>&nbsp;工厂配置
        </td>
    </tr>
    <tr>
        <td bgColor="#0a589a" style="color: #000000;height:2px"></td>
    </tr>
    <tr>
        <td style="height:1px"></td>
    </tr>
</table>
<div class="easyui-panel" style="padding:5px;">
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="javascript:openWinFactory('<%=ConfigConst.STR_WS_CREATE%>');">新增</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="javascript:openWinFactory('<%=ConfigConst.STR_WS_UPDATE%>');">修改</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="javascript:deleteFactory();">刪除</a>
    &nbsp;<span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span> &nbsp;
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" onclick="javascript:ifrSysFactoryTree.window.location.reload();">刷新</a>
</div>
<iframe id="ifrSysFactoryTree" name="ifrSysFactoryTree" src="<%=basePath%>sysOrg/factory/gotoTreePage.action" width="100%" height="750px" frameborder="0"></iframe>
<div id="factoryConf" class="easyui-dialog" title="Factory Setting" style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Save',
					iconCls:'icon-ok',
					handler:function(){
					    $('#ifrSysFactoryConf')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#factoryConf').dialog('close');
					}
				}]">
    <iframe id="ifrSysFactoryConf" name="ifrSysFactoryConf" src="" width="100%" height="100%" frameborder="0"></iframe>
</div>
</body>
</html>
<script type="text/javascript">
    //工厂编辑
    function  openWinFactory(strOption) {
        var uuid = $("#ifrSysFactoryTree").contents().find("#uuid").val();
        var parentUuid = $("#ifrSysFactoryTree").contents().find("#parentUuid").val();

        //新增頁面
        if(strOption == "<%=ConfigConst.STR_WS_CREATE%>" ) {
            if (uuid != "" && parentUuid == "0") {
                var url = "<%=basePath %>sysOrg/factory/gotoAddPage.action?ws="+strOption+"&uuid=" + uuid;
                window.ifrSysFactoryConf.location.href = url;
                $('#factoryConf').dialog('open');
            }else {
                $.messager.alert("Message", "Please Choose Company First！");
                return;
            }
        }
        //修改頁面
        if(strOption == "<%=ConfigConst.STR_WS_UPDATE%>" ) {
            if(uuid != "" && parentUuid != "0") {
                var url = "<%=basePath %>sysOrg/factory/gotoUptPage.action?ws="+strOption+"&uuid=" + uuid;
                window.ifrSysFactoryConf.location.href = url;
                $('#factoryConf').dialog('open');
            }else {
                $.messager.alert('message','please choose Factory first!','warning');
            }
        }
    }

    //刪除工厂
    function  deleteFactory() {
        var uuid = $("#ifrSysFactoryTree").contents().find("#uuid").val();
        var parentUuid = $("#ifrSysFactoryTree").contents().find("#parentUuid").val();
        var status = $("#ifrSysFactoryTree").contents().find("#status").val();
        if (uuid != "" && parentUuid != "0") {
            if (status == "<%=ConfigConst.STR_STATUS_DELETE_NUM%>") {
                $.messager.confirm("Message", "Are Sure to this option?", function (r) {
                    if (r) {
                        $.post("<%=basePath%>sysOrg/factory/deleteData.action", {
                            uuids: uuid
                        }, function (result) {
                            if (result.success) {
                                ifrSysFactoryTree.window.location.reload();
                            } else {
                                $.messager.error("Error", "Please contact system administrator！");
                            }
                        }, "json");
                    }
                });
            }else{
                $.messager.alert("Message", "Please set Factory to status【deleted】！");
                return;
            }
        }else {
            $.messager.alert("Message", "Please Choose Factory First！");
            return;
        }
    }
</script>
