<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <jsp:include page="../include/common.jsp" flush="true"/>
    <script>
        function closes() {
            $("#loading").fadeOut("normal", function () {
                $(this).remove();
            });
        }

        var pc;
        $.parser.onComplete = function () {
            if (pc) clearTimeout(pc);
            pc = setTimeout(closes, 500);
        }
    </script>
</head>
<body style="text-align: center">
<table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td bgColor="#F9FBFC" style="COLOR: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
            &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif" style="width: 16px; height: 16px"/>&nbsp;門戶菜單
            &nbsp;<span style="color: #006eb0;font-size: 14px;font-weight: bold" id="portalName" name="portalName"></span>
        </td>
    </tr>
    <tr>
        <td bgColor="#0a589a" style="COLOR: #000000;height:2px"></td>
    </tr>
    <tr>
        <td style="height:1px"></td>
    </tr>
</table>
<div class="easyui-panel" style="padding:5px;">
    &nbsp;<span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    <a href="#" class="easyui-menubutton"
       data-options="toggle:true,group:'btn',menu:'#menu_add',plain:true,iconCls:'icon-add'">新增</a>
    &nbsp;<span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'btn',plain:true,iconCls:'icon-edit'"
       onclick="javascript:updatePortalMenu('<%=ConfigConst.STR_WS_UPDATE%>');">修改</a>
    &nbsp;<span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'btn',plain:true,iconCls:'icon-remove'"
       onclick="javascript:deletePortalMenu();">刪除</a>
    &nbsp;<span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
    <a href="#" class="easyui-linkbutton"
       data-options="toggle:true,group:'btn',plain:true,iconCls:'icon-reload',selected:true"
       onclick="javascript:ifrSysPortalMenuTree.window.location.reload();">刷新</a>
    &nbsp;
    <a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'btn',plain:true,iconCls:'icon-back'"
       onclick="javascript:jsLocation('<%=basePath %>sysConfig/portal/configuration.action');">返回</a>
</div>
<div id="menu_add" style="width:100px;">
    <div data-options="iconCls:'icon-copy'" onclick="javascript:copyStandardMenu();">
        拷貝-標準
    </div>
    <div data-options="iconCls:'icon-add2'"
         onclick="javascript:openWinAddModule('<%=ConfigConst.STR_WS_CREATE%>','<%=ConfigConst.STR_PORTAL_MENU_MODULE%>');">
        新增-模塊
    </div>
    <div data-options="iconCls:'icon-assign'"
         onclick="javascript:openWinAddOption('<%=ConfigConst.STR_WS_CREATE%>','<%=ConfigConst.STR_PORTAL_MENU_OPTION%>');">
        分配-菜單
    </div>
</div>
<iframe id="ifrSysPortalMenuTree" name="ifrSysPortalMenuTree"
        src="<%=basePath %>sysConfig/portalMenu/gotoTreePage.action?portalUuid=<%=request.getParameter("portalUuid")%>"
        width="100%" height="750px"
        frameborder="0"></iframe>
<div id="portalMenuConf" class="easyui-dialog" title="Portal Menu Setting" style="width:800px;height:500px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Save',
					iconCls:'icon-ok',
					handler:function(){
					    $('#ifrSysPortalMenuConf')[0].contentWindow.saveData();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#portalMenuConf').dialog('close');
					}
				}]">
    <iframe id="ifrSysPortalMenuConf" name="ifrSysPortalMenuConf" src="" width="100%" height="100%" frameborder="0"></iframe>
    <div id='loading'
         style="position:absolute;z-index:1000;top:0px;left:0px;width:100%;height:100%;background:white;text-align:center;padding-top: 20%;">
        <h1>
            <image src="<%=basePath%>static/image/loading.gif"/>
            <font color="#15428B">Loading....</font></h1>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //獲取門戶名稱
    $(function () {
        $.ajax({
            async: true,
            async: true,
            type: 'get',
            url: "<%=basePath %>sysConfig/portal/listByUuid.action?uuid=<%=request.getParameter("portalUuid")%>",
            dataType: 'json',
            success: function (data) {
                if (data != null) {
                    $("#portalName").text("- " + data.portalName);
                }
            }
        });
    });

    //複製標準菜單
    function copyStandardMenu() {
        $.messager.confirm('Warring', 'Are you sure to copy ?', function(r){
            if (r){
                var blProcess = false;
                $.messager.progress({
                    title: 'Tips',
                    msg: 'Copying..............',
                    text: ''
                });
                //複製到門戶中
                $.ajax({
                    type: "post",
                    url: "<%=basePath %>sysConfig/portalMenu/copyStandardMenu.action?portalUuid=<%=request.getParameter("portalUuid")%>",
                    dataType: "json",
                    contentType: 'application/json;charset=UTF-8',
                    async: false,
                    success: function (data) {
                        blProcess = true;
                    }
                });

                //關閉進度條
                if (blProcess == true) {
                    $.messager.progress('close');
                    ifrSysPortalMenuTree.window.location.reload();
                }
            }
        });
    }

    //操作:新增模塊
    function openWinAddModule(strOption, strType) {
        //新增:模塊
        if (strOption == "<%=ConfigConst.STR_WS_CREATE%>" && strType == "<%=ConfigConst.STR_PORTAL_MENU_MODULE%>") {
            var pathUrl = "<%=basePath %>sysConfig/portalMenu/gotoModuleConfPage.action?ws="
                + strOption + "&portalUuid=<%=request.getParameter("portalUuid")%>";
            window.ifrSysPortalMenuConf.location.href = pathUrl;
            $('#portalMenuConf').dialog('open');
        }
    }

    //操作:新增操作
    function openWinAddOption(strOption, strType) {
        var uuid = $("#ifrSysPortalMenuTree").contents().find("#uuid").val();
        var parentUuid = $("#ifrSysPortalMenuTree").contents().find("#parentUuid").val();
        if (uuid != "" && parentUuid == "0"
            && strOption == "<%=ConfigConst.STR_WS_CREATE%>" && strType == "<%=ConfigConst.STR_PORTAL_MENU_OPTION%>") {
            var pathUrl = "<%=basePath %>sysConfig/portalMenu/gotoOptionConfPage.action?ws="
                + strOption + "&portalUuid=<%=request.getParameter("portalUuid")%>&uuid=" + uuid;
            window.ifrSysPortalMenuConf.location.href = pathUrl;
            $('#portalMenuConf').dialog('open');
        } else {
            $.messager.alert('message', 'please choose Module first!', 'warning');
        }
    }

    //操作：修改
    function updatePortalMenu(strOption) {
        var uuid = $("#ifrSysPortalMenuTree").contents().find("#uuid").val();
        if (uuid != "") {
            var pathUrl = "<%=basePath %>sysConfig/portalMenu/gotoUptPage.action?ws=" + strOption + "&uuid=" + uuid;
            window.ifrSysPortalMenuConf.location.href = pathUrl;
            $('#portalMenuConf').dialog('open');
        } else {
            $.messager.alert('message', 'please choose Module first!', 'warning');
        }
    }

    //操作：刪除
    function deletePortalMenu() {
        var uuid = $("#ifrSysPortalMenuTree").contents().find("#uuid").val();
        var status = $("#ifrSysPortalMenuTree").contents().find("#status").val();
        if (uuid != "") {
            if (status == "<%=ConfigConst.STR_STATUS_DELETE_NUM%>") {
                $.messager.confirm("Message", "Are Sure to this option?", function (r) {
                    if (r) {
                        $.post("<%=basePath%>sysConfig/portalMenu/deleteData.action", {
                                uuids: uuid
                            },
                            function (result) {
                                if (result.success) {
                                    ifrSysPortalMenuTree.window.location.reload();
                                } else {
                                    $.messager.error("Error", "Please contact system administrator！");
                                }
                            }, "json"
                        );
                    }
                });
            } else {
                $.messager.alert("Message", "Please set Menu to status【deleted】！");
                return;
            }
        } else {
            $.messager.alert("Message", "Please Choose Menu First！", 'warning');
        }
    }
</script>