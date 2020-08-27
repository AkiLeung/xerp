<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Menu Option Config</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
    <link rel="StyleSheet" href="./static/structureTree/dtree.css" type="text/css"/>
    <script type="text/javascript" src="./static/structureTree/dtree.js"></script>
</head>
<body style="text-align:left;">
<table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td bgColor="#F9FBFC" style="color: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
            &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif" style="width: 16px; height: 16px"/>&nbsp;菜單配置
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
    &nbsp;<span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span> &nbsp;
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="javascript:openWinMenuOption('<%=ConfigConst.STR_WS_CREATE%>');">新增</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="javascript:openWinMenuOption('<%=ConfigConst.STR_WS_UPDATE%>');">修改</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" onclick="javascript:ifrSysMenuOptionTree.window.location.reload();">刷新</a>
    &nbsp;<span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span> &nbsp;
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="javascript:deleteMenuOption();">刪除</a>
</div>
<iframe id="ifrSysMenuOptionTree" name="ifrSysMenuOptionTree" src="<%=basePath %>sysConfig/menuOption/gotoTreePage.action" width="100%" height="750px" frameborder="0"></iframe>
<div id="menuOptionConf" class="easyui-dialog" title="Menu Setting" style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Save',
					iconCls:'icon-ok',
					handler:function(){
					    $('#ifrSysMenuOptionConf')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#menuOptionConf').dialog('close');
					}
				}]">
    <iframe id="ifrSysMenuOptionConf" name="ifrSysMenuOptionConf" src="" width="100%" height="100%" frameborder="0"></iframe>
</div>
</body>
</html>
<script type="text/javascript">
    //操作
    function  openWinMenuOption(strOption) {
        var uuid = $("#ifrSysMenuOptionTree").contents().find("#uuid").val();
        var parent_uuid = $("#ifrSysMenuOptionTree").contents().find("#parent_uuid").val();

        //新增頁面
        if(strOption == "<%=ConfigConst.STR_WS_CREATE%>" ) {
            if (uuid != "" && parent_uuid == "0") {
                var url = "<%=basePath %>sysConfig/menuOption/gotoAddPage.action?ws="+strOption+"&uuid=" + uuid;
                window.ifrSysMenuOptionConf.location.href = url;
                $('#menuOptionConf').dialog('open');
            }else {
                $.messager.alert("Message", "Please Choose Menu Module First！");
                return;
            }
        }
        //修改頁面
        if(strOption == "<%=ConfigConst.STR_WS_UPDATE%>" ) {
            if(uuid != "" && parent_uuid != "0") {
                var url = "<%=basePath %>sysConfig/menuOption/gotoUptPage.action?ws="+strOption+"&uuid=" + uuid;
                window.ifrSysMenuOptionConf.location.href = url;
                $('#menuOptionConf').dialog('open');
            }else {
                $.messager.alert('message','please choose Menu first!','warning');
            }
        }
    }

    //刪除
    function  deleteMenuOption() {
        var uuid = $("#ifrSysMenuOptionTree").contents().find("#uuid").val();
        var parent_uuid = $("#ifrSysMenuOptionTree").contents().find("#parent_uuid").val();
        var status = $("#ifrSysMenuOptionTree").contents().find("#status").val();
        if (uuid != "" && parent_uuid != "") {
            if (status == "<%=ConfigConst.STR_STATUS_DELETE_NUM%>") {
                $.messager.confirm("Message", "Are Sure to this option?", function (r) {
                    if (r) {
                        $.post("<%=basePath%>sysConfig/menuOption/deleteData.action", {
                            uuids: uuid
                        }, function (result) {
                            if (result.success) {
                                ifrSysMenuOptionTree.window.location.reload();
                            } else {
                                $.messager.error("Error", "Please contact system administrator！");
                            }
                        }, "json");
                    }
                });
            }else{
                $.messager.alert("Message", "Please set Menu Option to status【deleted】！");
                return;
            }
        }else {
            $.messager.alert("Message", "Please Choose Menu Option First！");
            return;
        }
    }
</script>
