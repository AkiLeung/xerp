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
</head>
<body>
<form id="form1" action="" method="post">
    <div class="easyui-tabs" style="width:auto;height:auto">
        <div title="基础信息" style="padding:0px">
            <table class="tbl" style="width:100%;">
                <tr style="display:none">
                    <td class="tblTitle">
                        ws&uuid&flow_uuid
                    </td>
                    <td class="tblCell">
                        <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                        <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/>
                        <input class="easyui-textbox" value="<%=request.getParameter("flowUuid")%>" name="flowUuid"
                               type="hidden" id="flowUuid"/>
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle" style="width: 20%">
                        环节狀態
                    </td>
                    <td class="tblCell" style="width: 80%">
                        <label style="cursor: pointer"><input type="radio" name="status" value="01"
                                                              checked><%=ConfigConst.STR_STATUS_ACTIVE_TXT%>
                        </label>
                        <label style="cursor: pointer"><input type="radio" name="status"
                                                              value="00"><%=ConfigConst.STR_STATUS_BLOCK_TXT%>
                        </label>
                        <label style="cursor: pointer"><input type="radio" name="status"
                                                              value="99"><%=ConfigConst.STR_STATUS_DELETE_TXT%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle" style="width: 250px">
                        環節類型
                    </td>
                    <td class="tblCell" style="width: 750px">
                        <label style="cursor: pointer"><input type="radio" name="nodeType"
                                                              onclick="javascript:setNodeValue('0','<%=ConfigConst.STR_FLOW_START_TXT%>');"
                                                              value="<%=ConfigConst.STR_FLOW_START_NUM%>"><%=ConfigConst.STR_FLOW_START_TXT%>
                        </label>
                        <label style="cursor: pointer"><input type="radio" name="nodeType" checked
                                                              onclick="javascript:setNodeValue('1','<%=ConfigConst.STR_FLOW_TASK_TXT%>');"
                                                              value="<%=ConfigConst.STR_FLOW_TASK_NUM%>"><%=ConfigConst.STR_FLOW_TASK_TXT%>
                        </label>
                        <label style="cursor: pointer"><input type="radio" name="nodeType"
                                                              onclick="javascript:setNodeValue('2','<%=ConfigConst.STR_FLOW_NODE_TXT%>');"
                                                              value="<%=ConfigConst.STR_FLOW_NODE_NUM%>"><%=ConfigConst.STR_FLOW_NODE_TXT%>
                        </label>
                        <label style="cursor: pointer"><input type="radio" name="nodeType"
                                                              onclick="javascript:setNodeValue('99','<%=ConfigConst.STR_FLOW_END_TXT%>');"
                                                              value="<%=ConfigConst.STR_FLOW_END_NUM%>"><%=ConfigConst.STR_FLOW_END_TXT%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        環節编号
                    </td>
                    <td class="tblCell">
                        <input class="easyui-numberspinner" value="1" name="nodeCode" id="nodeCode"
                               data-options="increment:1,min:0,max:99,required:true" style="width:250px;"/>
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        環節名称
                    </td>
                    <td class="tblCell">
                        <input class="easyui-textbox" value="" name="nodeName" type="text" id="nodeName"
                               style="width:350px"
                               data-options="prompt:'Enter User name.',required:true,validType:'length[2,50]'"/>
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        備註信息
                    </td>
                    <td class="tblCell">
                        <input class="easyui-textbox" value="" name="comment" type="text" id="comment"
                               style="width:350px"/>
                    </td>
                </tr>
            </table>
        </div>
        <div title="办理人员" style="padding:0px">
            <table class="tbl" style="width:100%;">
                <tr>
                    <td class="tblTitle" style="width: 20%">
                        办理角色
                    </td>
                    <td class="tblCell" style="width: 80%">
                        <span style="display: none;"><input class="easyui-textbox" value="" name="handlerRoleCode"
                                                            type="text" id="handlerRoleCode"/></span>
                        <input class="easyui-textbox" value="" name="handlerRoleName" type="text" id="handlerRoleName"
                               editable="false"
                               style="width:350px"
                               data-options="prompt: '請選擇..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               openRoleSelect('handlerRoleCode','handlerRoleName','1');
				}}]"/>
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        办理字段
                    </td>
                    <td class="tblCell">
                        <input class="easyui-textbox" value="" name="handlerFieldCode" type="text" id="handlerFieldCode"
                               style="width:173px" data-options="prompt:'user code filed'"/>
                        <input class="easyui-textbox" value="" name="handlerFieldName" type="text" id="handlerFieldName"
                               style="width:173px" data-options="prompt:'user name filed'"/>
                        起草人：flowCreatorCode ; flowCreatorName
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        办理人员
                    </td>
                    <td class="tblCell">
                        <input class="easyui-textbox" value="" name="handlerCode" type="text" id="handlerCode"
                               style="width:350px"
                               data-options=""/><br>
                        <input class="easyui-textbox" value="" name="handlerName" type="text" id="handlerName"
                               style="width:350px"
                               data-options="prompt:'Enter User name.',validType:'length[2,50]'"/>
                        (会签-可多选)
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        办理人员
                    </td>
                    <td class="tblCellContent" height="208px">
                        <table id="handlerList" class="easyui-datagrid" style="width:100%;height: 200px" fit="true"
                               data-options="
                               singleSelect:false,
                               rownumbers:true,
                               idField:'uuid',
                               nowarp:false,
                               border:false,
                               collapsible:true,
                               method:'get',
                               toolbar:toolbar">
                            <thead>
                            <tr>
                                <th data-options="field:'cb',width:30,checkbox: 'true'"></th>
                                <th data-options="field:'uuid',width:100,hidden:true">uuid</th>
                                <th data-options="field:'nodeUuid',width:100,hidden:true">nodeUuid</th>
                                <th data-options="field:'handlerCode',width:80,hidden:false">办理人编号</th>
                                <th data-options="field:'handlerName',width:200,hidden:false">办理人名称</th>
                            </tr>
                            </thead>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div title="控制信息" style="padding:0px">
            <table class="tbl" style="width:100%;">
                <tr>
                    <td class="tblTitle" style="width: 20%">
                        编辑字段
                    </td>
                    <td class="tblCell" style="width: 80%">
                        <input class="easyui-textbox" value="" name="editableField" type="text" id="editableField"
                               style="width:99%;height: 100px"
                               data-options="multiline:true"/></td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        流向公式
                    </td>
                    <td class="tblCell">
                        <input class="easyui-textbox" value="" name="nodeFormula" type="text" id="nodeFormula"
                               style="width:99%;height: 120px"
                               data-options="multiline:true"/></td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        流向公式<br>
                        逻辑备注
                    </td>
                    <td class="tblCell">
                        <input class="easyui-textbox" value="" name="nodeFormulaDesc" type="text" id="nodeFormulaDesc"
                               style="width:99%;height: 100px"
                               data-options="multiline:true"/></td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        必填字段
                    </td>
                    <td class="tblCell">
                        <input class="easyui-textbox" value="" name="requiredFieldCode" type="text"
                               id="requiredFieldCode"
                               style="width:99%;height: 120px"
                               data-options="multiline:true"/></td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        必填字段<br>
                        提示信息
                    </td>
                    <td class="tblCell">
                        <input class="easyui-textbox" value="" name="requiredFieldName" type="text"
                               id="requiredFieldName"
                               style="width:99%;height: 120px"
                               data-options="multiline:true"/></td>
                </tr>
            </table>
        </div>
        <div title="控制提示" style="padding:0px">
            <table class="tbl" style="width:100%;">
                <tr>
                    <td class="tblTitle" style="width: 20%">
                        编辑字段
                    </td>
                    <td class="tblCell" style="width: 80%">
                        字段值必须是表单中控件的ID名称，常见id:<br>
                        flowCreatorName
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        流向公式
                    </td>
                    <td class="tblCell" style="height: 100px">
                        eg:<br>
                        1.当起草人等于管理员的时候，隐藏排序为0的流向！<br>
                        2.当起草人等于管理员的时候，显示排序为0的流向！
                        <input class="easyui-textbox" name="formulaExample" type="text" id="formulaExample"
                               style="width:99%;height: 120px"
                               value = "<script>if($('#flowCreatorCode').val()=='admin'){ easyuiDG_hideRow('nodeList', 0); }</script>
                                        <script>if($('#flowCreatorCode').val()=='admin'){ easyuiDG_showRow('nodeList', 1); }</script>"
                               data-options="multiline:true"/>
                    </td>
                </tr>
                <tr>
                    <td class="tblTitle">
                        必填字段<br>
                        提示信息
                    </td>
                    <td class="tblCell">
                        "必填字段"和"提示信息"必须一一对应，JS控制使用数组对应，信息间使用英文半角分号“;”分段。<br>
                        最后一个字符都必须带“;”
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div style="display: none;">
        GooFlow參數:
        gooflow_type：<input class="easyui-textbox" value="task" name="gooflowType" type="text" id="gooflowType" /><br>
        gooflow_left：<input class="easyui-textbox" value="88" name="gooflowLeft" type="text" id="gooflowLeft" /><br>
        gooflow_top：<input class="easyui-textbox" value="20" name="gooflowTop" type="text" id="gooflowTop" /><br>
        gooflow_width：<input class="easyui-textbox" value="100" name="gooflowWidth" type="text" id="gooflowWidth" /><br>
        gooflow_height：<input class="easyui-textbox" value="24" name="gooflowHeight" type="text" id="gooflowHeight" /><br>
        gooflow_alt：<input class="easyui-textbox" value="true" name="gooflowAlt" type="text" id="gooflowAlt" /><br>
    </div>
    <div id="flowNodeHandlerConfig" class="easyui-dialog" style="width:650px;height:200px"
         data-options="
         iconCls:'icon-setting',
         title:'办理人配置',
         closed:true,
         modal:true,
         collapsible:true,
         minimizable:false,
         maximizable:false,
         draggable:true,
         resizable:false,
         buttons: [{
					text:'Save',
					iconCls:'icon-save',
					handler:function(){
                        $('#ifrFlowNodeHandlerConfig')[0].contentWindow.saveData();
                        $('#flowNodeHandlerConfig').dialog('close');
                        $('#dataList').datagrid('reload');
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#flowNodeHandlerConfig').dialog('close');
					}
				}],cls:'c8'">
        <iframe id="ifrFlowNodeHandlerConfig" name="ifrFlowNodeHandlerConfig" src="" width="100%" height="100%"
                frameborder="0"></iframe>
    </div>
    <jsp:include page="../include/roleSelect01.jsp" flush="true"/>
</form>
</body>
</html>
<script>
    //Toolbar
    var toolbar = [{
        text: '新增',
        iconCls: 'icon-add',
        handler: function () {
            showDialogWin('ifrFlowNodeHandlerConfig', 'flowNodeHandlerConfig',
                '<%=basePath %>sysConfig/flowNodeHandler/gotoConfPage.action?ws=<%=ConfigConst.STR_WS_CREATE%>&nodeUuid=<%=request.getParameter("uuid")%>');
        }
    }, '-', {
        text: '删除',
        iconCls: 'icon-remove',
        handler: function () {
            var selectedRows = $("#handlerList").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("Message", "Please Choose Data First！");
                return;
            }
            var array = [];
            for (var i = 0; i < selectedRows.length; i++) {
                array.push(selectedRows[i].uuid);
            }
            var uuids = array.join(",");
            $.messager.confirm("Message", "Are Sure to this option?", function (r) {
                if (r) {
                    $.post("<%=basePath%>sysConfig/flowNodeHandler/deleteData.action", {
                        uuids: uuids
                    }, function (result) {
                        if (result.success) {
                            $("#handlerList").datagrid("reload");
                        } else {
                            $.messager.error("Error", "Please contact system administrator！");
                        }
                    }, "json");
                }
            });
        }
    }, '-', {
        text: '刷新',
        iconCls: 'icon-reload',
        handler: function () {
            $("#handlerList").datagrid("reload");
        }
    }];

    //Default Execution or Setting
    $(function () {
        $('#nodeCode').textbox('textbox').attr('maxlength', 20);
        $('#nodeName').textbox('textbox').attr('maxlength', 50);
        $('#comment').textbox('textbox').attr('maxlength', 150);

        //dataGrid basic Setting
        $('#handlerList').datagrid({
            url: '<%=basePath%>sysConfig/flowNodeHandler/listData.action?nodeUuid=<%=request.getParameter("uuid")%>'
        });
    });

    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',
            url: "<%=basePath %>sysConfig/flowNode/listByUuid.action?uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("#flowUuid").textbox('setValue', data[0].flowUuid);
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("input[name='nodeType'][value ='" + data[0].nodeType + "']").attr("checked", "checked").parent().addClass('checked');
                $("#nodeCode").textbox('setValue', data[0].nodeCode);
                $("#nodeName").textbox('setValue', data[0].nodeName);
                $("#comment").textbox('setValue', data[0].comment);
                $("#handlerRoleCode").textbox('setValue', data[0].handlerRoleCode);
                $("#handlerRoleName").textbox('setValue', data[0].handlerRoleName);
                $("#handlerFieldCode").textbox('setValue', data[0].handlerFieldCode);
                $("#handlerFieldName").textbox('setValue', data[0].handlerFieldName);
                $("#handlerCode").textbox('setValue', data[0].handlerCode);
                $("#handlerName").textbox('setValue', data[0].handlerName);
                $("#editableField").textbox('setValue', data[0].editableField);
                $("#requiredFieldCode").textbox('setValue', data[0].requiredFieldCode);
                $("#requiredFieldName").textbox('setValue', data[0].requiredFieldName);
                $("#nodeFormula").textbox('setValue', data[0].nodeFormula);
                $("#nodeFormulaDesc").textbox('setValue', data[0].nodeFormulaDesc);
                //控件参数
                $("#gooflowType").textbox('setValue', data[0].gooflowType);
                $("#gooflowLeft").textbox('setValue', data[0].gooflowLeft);
                $("#gooflowTop").textbox('setValue', data[0].gooflowTop);
                $("#gooflowWidth").textbox('setValue', data[0].gooflowWidth);
                $("#gooflowHeight").textbox('setValue', data[0].gooflowHeight);
                $("#gooflowAlt").textbox('setValue', data[0].gooflowAlt);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#nodeCode").val() == "") {
            $.messager.alert('提示', 'Node code must be entered!');
            return ;
        }
        if ($("#nodeName").val() == "") {
            $.messager.alert('提示', 'Node name must be entered!','error');
            return false;
        }
        //設置環節top位置
        var positionLeft = 0;
        parseInt($("#nodeCode").val()) < 90 ? positionLeft = 138 : positionLeft = 1180;
        $("#gooflowLeft").textbox('setValue', positionLeft);

        //設置環節top位置
        var positionTop = 0;
        parseInt($("#nodeCode").val()) < 90 ? positionTop = 20 + ($("#nodeCode").val() * 100) : positionTop = 500;
        $("#gooflowTop").textbox('setValue', positionTop);

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid: $("#uuid").val(),
            flowUuid: $("#flowUuid").val(),
            status: $('input[name="status"]:checked').val(),
            nodeCode: $("#nodeCode").val(),
            nodeName: $("#nodeName").val(),
            nodeType: $('input[name="nodeType"]:checked').val(),
            handlerRoleCode: $("#handlerRoleCode").val(),
            handlerRoleName: $("#handlerRoleName").val(),
            handlerFieldCode: $("#handlerFieldCode").val(),
            handlerFieldName: $("#handlerFieldName").val(),
            handlerCode: $("#handlerCode").val(),
            handlerName: $("#handlerName").val(),
            editableField: $("#editableField").val(),
            requiredFieldCode: $("#requiredFieldCode").val(),
            requiredFieldName: $("#requiredFieldName").val(),
            nodeFormula: $("#nodeFormula").val(),
            nodeFormulaDesc: $("#nodeFormulaDesc").val(),
            gooflowType: $("#gooflowType").val(),
            gooflowLeft: $("#gooflowLeft").val(),
            gooflowTop: $("#gooflowTop").val(),
            gooflowWidth: $("#gooflowWidth").val(),
            gooflowHeight: $("#gooflowHeight").val(),
            gooflowaAlt: $("#gooflowaAlt").val(),
            comment: $("#comment").val()
        };
        var jsonData = JSON.stringify(objData);

        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/flowNode/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#flowNodeConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }

    //設置環節信息
    function setNodeValue(nodeCode, nodeType) {
        $('#nodeCode').textbox('setValue', nodeCode);
        $('#gooflowType').textbox('setValue', nodeType);
    }
</script>