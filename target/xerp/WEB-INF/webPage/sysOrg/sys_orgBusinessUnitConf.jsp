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
    <title>Department Config</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body style="text-align:left;">
<table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td bgColor="#F9FBFC" style="color: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
            &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif" style="width: 16px; height: 16px"/>&nbsp;事業部门配置
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
    <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    &nbsp;
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'"
       onclick="javascript:openWinBusinessUnit('<%=ConfigConst.STR_WS_CREATE%>');">新增</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'"
       onclick="javascript:openWinBusinessUnit('<%=ConfigConst.STR_WS_UPDATE%>');">修改</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" title="物理刪除"
       onclick="javascript:deleteBusinessUnit();">刪除</a>
    <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'"
       onclick="javascript:ifrSysBusinessUnitTree.window.location.reload();">刷新</a>
</div>
<iframe id="ifrSysBusinessUnitTree" name="ifrSysBusinessUnitTree"
        src="<%=basePath%>sysOrg/businessUnit/gotoTreePage.action" width="100%" height="600px"
        frameborder="0"></iframe>
<div id="businessUnitConf" class="easyui-dialog" title="Business Unit Setting"
     style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-setting',
				closed:true,
				modal:true,
				buttons: [{
					text:'Save',
					iconCls:'icon-ok',
					handler:function(){
					    $('#ifrSysBusinessUnitConf')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#businessUnitConf').dialog('close');
					}
				}]">
    <iframe id="ifrSysBusinessUnitConf" name="ifrSysBusinessUnitConf" src="" width="100%" height="100%"
            frameborder="0"></iframe>
</div>
</body>
</html>
<script type="text/javascript">
    //事業部门操作
    function openWinBusinessUnit(strOption) {
        var uuid = $("#ifrSysBusinessUnitTree").contents().find("#uuid").val();
        var parentUuid = $("#ifrSysBusinessUnitTree").contents().find("#parentUuid").val();
        var url = "";
        if (strOption == '<%=ConfigConst.STR_WS_CREATE%>') {
            url = "<%=basePath %>sysOrg/businessUnit/gotoAddPage.action?ws=" + strOption + "&uuid=" + uuid;
        } else {
            if (parentUuid != "0") {
                url = "<%=basePath %>sysOrg/businessUnit/gotoUptPage.action?ws=" + strOption + "&uuid=" + uuid;
            }else{
                $.messager.alert('Error',"Please Choose Unit First！");
            }
        }
        if(url!="") {
            $('#businessUnitConf').dialog('open');
            window.ifrSysBusinessUnitConf.location.href = url;
        }
    }

    //刪除事業部-部門
    function deleteBusinessUnit() {
        var uuid = $("#ifrSysBusinessUnitTree").contents().find("#uuid").val();
        var parentUuid = $("#ifrSysBusinessUnitTree").contents().find("#parentUuid").val();
        if (uuid == "" || parentUuid == "") {
            $.messager.alert("Message", "Please Choose Unit First！");
            return;
        }

        $.messager.confirm("Message", "Are Sure to this option?", function (r) {
            if (r) {
                $.post("<%=basePath%>sysOrg/businessUnit/deleteDataByParentUuid.action", {
                    uuids: uuid
                }, function (result) {
                    if (result.success) {
                        ifrSysBusinessUnitTree.window.location.reload();
                    } else {
                        $.messager.error("Error", "Please contact system administrator！");
                    }
                }, "json");
            }
        });
    }
</script>
