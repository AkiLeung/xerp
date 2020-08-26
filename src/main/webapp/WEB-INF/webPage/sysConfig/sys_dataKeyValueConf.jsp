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
            &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif" style="width: 16px; height: 16px"/>&nbsp;數據字典
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
    <a href="#" class="easyui-menubutton"
       data-options="toggle:true,group:'btn',menu:'#menu_add',plain:true,iconCls:'icon-add'">新增</a>
    <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'"
       onclick="javascript:openWinDataKeyType('<%=ConfigConst.STR_WS_UPDATE%>');">修改</a>
    <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" title="物理刪除"
       onclick="javascript:deleteDataType();">刪除</a>
    <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>

    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'"
       onclick="javascript:openWinDataKeyValue('<%=ConfigConst.STR_WS_UPDATE%>');">修改數值</a>
    <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" title="物理刪除"
       onclick="javascript:deleteDataValue();">刪除數值</a>
    <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>

    <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'"
       onclick="javascript:ifrSysDataKeyValueTree.window.location.reload();">刷新</a>
</div>
<div id="menu_add" style="width:100px;">
    <div data-options="iconCls:'icon-add2'" onclick="javascript:openWinDataKeyType('<%=ConfigConst.STR_WS_CREATE%>');">
        類別
    </div>
    <div data-options="iconCls:'icon-add2'"
         onclick="javascript:openWinDataKeyValue('<%=ConfigConst.STR_WS_CREATE%>');">
        數值
    </div>
</div>
<iframe id="ifrSysDataKeyValueTree" name="ifrSysDataKeyValueTree"
        src="<%=basePath %>sysConfig/keyValue/gotoTreePage.action" width="100%" height="600px"
        frameborder="0"></iframe>
<div id="dataKeyValueConf" class="easyui-dialog" title="Data Key Value Setting"
     style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Save',
					iconCls:'icon-ok',
					handler:function(){
					    $('#ifrSysDataKeyConf')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#dataKeyValueConf').dialog('close');
					}
				}]">
    <iframe id="ifrSysDataKeyConf" name="ifrSysDataKeyConf" src="" width="100%" height="100%"
            frameborder="0"></iframe>
</div>
</body>
</html>
<script type="text/javascript">
    //操作-数据类型
    function openWinDataKeyType(strOption) {
        //新增頁面
        if (strOption == "<%=ConfigConst.STR_WS_CREATE%>") {
            var url = "<%=basePath %>sysConfig/dataType/gotoAddPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>";
            window.ifrSysDataKeyConf.location.href = url;
            $('#dataKeyValueConf').dialog('open');
        }
        //修改頁面
        if (strOption == "<%=ConfigConst.STR_WS_UPDATE%>") {
            var uuid = $("#ifrSysDataKeyValueTree").contents().find("#uuid").val();
            var parent_uuid = $("#ifrSysDataKeyValueTree").contents().find("#parent_uuid").val();
            if (uuid != "" && parent_uuid == "0") {
                var url = "<%=basePath %>sysConfig/dataType/gotoUptPage.action?ws=<%=ConfigConst.STR_WS_UPDATE%>&code=" + uuid;
                window.ifrSysDataKeyConf.location.href = url;
                $('#dataKeyValueConf').dialog('open');
            } else {
                $.messager.alert('message', 'please choose Data Type first!', 'warning');
            }
        }
    }

    //刪除
    function deleteDataType() {
        var typeCode = $("#ifrSysDataKeyValueTree").contents().find("#uuid").val();
        var parent_uuid = $("#ifrSysDataKeyValueTree").contents().find("#parent_uuid").val();
        var status = $("#ifrSysDataKeyValueTree").contents().find("#status").val();
        if (typeCode == "" && parent_uuid == "") {
            $.messager.alert("Message", "Please Choose Type First！");
            return;
        }
        if (typeCode != "" && parent_uuid != "0") {
            $.messager.alert("Message", "Please Choose Type First！");
            return;
        }
        //刪除狀態才能夠執行刪除
        if (status == "<%=ConfigConst.STR_STATUS_DELETE_NUM%>") {
            $.messager.confirm("Message", "Are Sure to this option? it will delete type and data.", function (r) {
                if (r) {
                    //刪除類別
                    $.post("<%=basePath%>sysConfig/dataType/deleteDataByTypeCode.action", {
                        typeCode: typeCode,
                    }, function (result) {
                        if (result.success) {
                            //刪除類別下的數據
                            $.post("<%=basePath%>sysConfig/keyValue/deleteDataByTypeCode.action", {typeCode: typeCode}, "json");
                        } else {
                            $.messager.error("Error", "Please contact system administrator！");
                        }
                    }, "json");
                    ifrSysDataKeyValueTree.window.location.reload();
                }
            });
        } else {
            $.messager.alert("Message", "Please set Type to status【deleted】！");
            return;
        }
    }

    //操作-数据值
    function openWinDataKeyValue(strOption) {
        var uuid = $("#ifrSysDataKeyValueTree").contents().find("#uuid").val();
        var parent_uuid = $("#ifrSysDataKeyValueTree").contents().find("#parent_uuid").val();

        //新增頁面
        if (strOption == "<%=ConfigConst.STR_WS_CREATE%>") {
            if (uuid != "" && parent_uuid == "0") {
                var url = "<%=basePath %>sysConfig/keyValue/gotoAddPage.action?ws=" + strOption + "&uuid=" + uuid;
                window.ifrSysDataKeyConf.location.href = url;
                $('#dataKeyValueConf').dialog('open');
            } else {
                $.messager.alert("Message", "Please Choose Data Type First！");
                return;
            }
        }

        //修改頁面
        if (strOption == "<%=ConfigConst.STR_WS_UPDATE%>") {
            if (uuid != "" && parent_uuid != "0") {
                var url = "<%=basePath %>sysConfig/keyValue/gotoUptPage.action?ws=" + strOption + "&uuid=" + uuid;
                window.ifrSysDataKeyConf.location.href = url;
                $('#dataKeyValueConf').dialog('open');
            } else {
                $.messager.alert('message', 'please choose Data first!', 'warning');
            }
        }
    }

    //刪除數據
    function deleteDataValue() {
        var uuid = $("#ifrSysDataKeyValueTree").contents().find("#uuid").val();
        var parent_uuid = $("#ifrSysDataKeyValueTree").contents().find("#parent_uuid").val();
        var status = $("#ifrSysDataKeyValueTree").contents().find("#status").val();
        //執行刪除
        if (uuid != "" && parent_uuid != "") {
            if (status == "<%=ConfigConst.STR_STATUS_DELETE_NUM%>") {
                $.messager.confirm("Message", "Are Sure to this option?", function (r) {
                    if (r) {
                        $.post("<%=basePath%>sysConfig/keyValue/deleteData.action", {
                            uuid: uuid
                        }, function (result) {
                            if (result.success) {
                                ifrSysDataKeyValueTree.window.location.reload();
                            } else {
                                $.messager.error("Error", "Please contact system administrator！");
                            }
                        }, "json");
                    }
                });
            } else {
                $.messager.alert("Message", "Please set Data to status【deleted】！");
                return;
            }
        } else {
            $.messager.alert("Message", "Please Choose Data First！");
            return;
        }
    }
</script>
