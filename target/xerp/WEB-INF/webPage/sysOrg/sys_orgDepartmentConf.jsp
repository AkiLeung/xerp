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
    <link rel="StyleSheet" href="./static/structureTree/dtree.css" type="text/css"/>
    <script type="text/javascript" src="./static/structureTree/dtree.js"></script>
</head>
<body style="text-align:left;">
<table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td bgColor="#F9FBFC" style="color: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
            &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif" style="width: 16px; height: 16px"/>&nbsp;部門配置
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
    &nbsp;
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'"
       onclick="javascript:openWinDepartment('<%=ConfigConst.STR_WS_CREATE%>');">新增</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'"
       onclick="javascript:openWinDepartment('<%=ConfigConst.STR_WS_UPDATE%>');">修改</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'"
       onclick="javascript:ifrSysDepartTree.window.location.reload();">刷新</a>
    &nbsp;<span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    &nbsp;
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'"
       onclick="javascript:deleteDepartment();">刪除</a>
</div>
<iframe id="ifrSysDepartTree" name="ifrSysDepartTree"
        src="<%=basePath %>sysOrg/department/gotoTreePage.action" width="100%" height="750px"
        frameborder="0"></iframe>
<div id="departmentConf" class="easyui-dialog" title="Department Setting" style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Save',
					iconCls:'icon-ok',
					handler:function(){
					    $('#ifrSysDepartConf')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#departmentConf').dialog('close');
					}
				}]">
    <iframe id="ifrSysDepartConf" name="ifrSysDepartConf" src="" width="100%" height="100%" frameborder="0"></iframe>
</div>
</body>
</html>
<script type="text/javascript">
    //操作部門
    function openWinDepartment(strOption) {
        var uuid = $("#ifrSysDepartTree").contents().find("#uuid").val();
        var parentUuid = $("#ifrSysDepartTree").contents().find("#parentUuid").val();

        //新增頁面
        if (strOption == "<%=ConfigConst.STR_WS_CREATE%>") {
            if (uuid == "") {
                $.messager.alert("Message", "Please Choose Company/Department First！");
                return;
            } else {
                var url = "<%=basePath %>sysOrg/department/gotoAddPage.action?ws=" + strOption + "&uuid=" + uuid;
                window.ifrSysDepartConf.location.href = url;
                $('#departmentConf').dialog('open');
            }
        }

        //修改頁面
        if (strOption == "<%=ConfigConst.STR_WS_UPDATE%>") {
            if (uuid != "" && parentUuid != "0") {
                var url = "<%=basePath %>sysOrg/department/gotoUptPage.action?ws=" + strOption + "&uuid=" + uuid;
                window.ifrSysDepartConf.location.href = url;
                $('#departmentConf').dialog('open');
            } else {
                $.messager.alert('message', 'please choose Department first!', 'warning');
            }
        }
    }

    //刪除部門
    function deleteDepartment() {
        var uuid = $("#ifrSysDepartTree").contents().find("#uuid").val();
        var parentUuid = $("#ifrSysDepartTree").contents().find("#parentUuid").val();
        var status = $("#ifrSysDepartTree").contents().find("#status").val();
        if (uuid != "" && parentUuid != "") {
            if (status == "<%=ConfigConst.STR_STATUS_DELETE_NUM%>") {
                $.messager.confirm("Message", "Are Sure to this option, It will delete all sub department?", function (r) {
                    if (r) {
                        $.post("<%=basePath%>sysOrg/department/deleteData.action", {
                            uuids: uuid
                        }, function (result) {
                            if (result.success) {
                                ifrSysDepartTree.window.location.reload();
                            } else {
                                $.messager.error("Error", "Please contact system administrator！");
                            }
                        }, "json");
                    }
                });
            }else{
                $.messager.alert("Message", "Please set Department to status【deleted】！");
                return;
            }
        } else {
            $.messager.alert("Message", "Please Choose Department First！");
            return;
        }
    }
</script>