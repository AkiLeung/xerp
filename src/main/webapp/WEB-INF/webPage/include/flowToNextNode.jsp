<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div style="display: none11">
    <%--当前记录信息--%>
    flowUuid:<input value="" type="Text" name="flowUuid" id="flowUuid"/><br/>
    flowName:<input value="" type="Text" name="flowName" id="flowName"/><br/>
    flowVersion:<input value="" type="Text" name="flowVersion" id="flowVersion"/><br/>
    flowNodeUuid:<input value="" type="Text" name="flowNodeUuid" id="flowNodeUuid"/><br/>
    flowNodeType:<input value="" type="Text" name="flowNodeType" id="flowNodeType"/><br/>
    flowNodeCode:<input value="" type="Text" name="flowNodeCode" id="flowNodeCode"/><br/>
    flowNodeName:<input value="" type="Text" name="flowNodeName" id="flowNodeName"/><br/>
    editableField:<input value="" type="Text" name="editableField" id="editableField"/><br/>
    requiredFieldCode:<input value="" type="Text" name="requiredFieldCode" id="requiredFieldCode"/><br/>
    requiredFieldName:<input value="" type="Text" name="requiredFieldName" id="requiredFieldName"/><br/>
    curUserCode:<input value="<shiro:principal property="userCode"/>" type="Text" name="curUserCode" id="curUserCode"/><br/>
    curHandlerCode:<input value="" type="Text" name="curHandlerCode" id="curHandlerCode"/><br/>
    curHandlerName:<input value="" type="Text" name="curHandlerName" id="curHandlerName"/><br/>
    <%--当前环节信息--%>
    curNodeHandlerRoleCode:<input value="" type="Text" name="handlerRoleCode" id="handlerRoleCode"/><br/>
    curNodeHandlerRoleName:<input value="" type="Text" name="handlerRoleName" id="handlerRoleName"/><br/>
    curNodeHandlerFieldCode:<input value="" type="Text" name="handlerFieldCode" id="handlerFieldCode"/><br/>
    curNodeHandlerFieldName:<input value="" type="Text" name="handlerFieldName" id="handlerFieldName"/><br/>
    <%--目标流程信息--%>
    targetNodeUuid:<input value="" type="Text" name="flowNodeUuid" id="targetNodeUuid"/><br/>
    targetNodeType:<input value="" type="Text" name="flowNodeType" id="targetNodeType"/><br/>
    targetNodeCode:<input value="" type="Text" name="targetNodeCode" id="targetNodeCode"/><br/>
    targetNodeName:<input value="" type="Text" name="targetNodeName" id="targetNodeName"/><br/>
    targetHandlerNum:<input value="" type="Text" name="targetHandlerCode" id="targetHandlerCode"/><br/>
    targetHandlerNam:<input value="" type="Text" name="targetHandlerName" id="targetHandlerName"/><br/>
</div>
<div id="popuFlowToNextNode" class="easyui-dialog" title="Please select ....."
     style="width:550px;height:450px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Confirm',
					iconCls:'icon-tip',
					handler:function(){
                        submitToNextNode();
					}
				},{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#popuFlowToNextNode').dialog('close');
					}
				}]">
    <div class="easyui-layout" style="width:100%;height:100%;">
        <div data-options="region:'center',title:'流向'" style="width:50%;">
            <table id="nodeList" class="easyui-datagrid" style="width:100%;" fit="true"
                   data-options="
                   singleSelect:true,
                   showHeader:false,
                   rownumbers:true,
                   idField:'uuid',
                   nowarp:false,
                   border:false,
                   collapsible:true,
                   method:'get'">
                <thead>
                <tr>
                    <th data-options="field:'cb',width:30,checkbox: 'true'"></th>
                    <th data-options="field:'uuid',width:100,hidden:true">uuid</th>
                    <th data-options="field:'flowUuid',width:80,hidden:true">flowUuid</th>
                    <th data-options="field:'nodeUuid',width:80,hidden:true">nodeUuid</th>
                    <th data-options="field:'directionType',width:80,hidden:true">directionType</th>
                    <th data-options="field:'targetNodeType',width:80,hidden:true">目標環節-Type</th>
                    <th data-options="field:'targetNodeUuid',width:80,hidden:true">目標環節-Uuid</th>
                    <th data-options="field:'targetNodeCode',width:80,hidden:true">目標環節-Code</th>
                    <th data-options="field:'targetNodeName',width:80,hidden:true">目標環節-name</th>
                    <th data-options="field:'directionCode',width:80,hidden:true">流向編碼</th>
                    <th data-options="field:'directionName',width:200,hidden:false">流向名稱</th>
                </tr>
                </thead>
            </table>
        </div>
        <div data-options="region:'east',split:true,title:'办理人',collapsible:false" style="width:50%;">
            <table id="handlerList" class="easyui-datagrid" style="width:100%;" fit="true"
                   data-options="
                   singleSelect:true,
                   showHeader:false,
                   rownumbers:true,
                   idField:'uuid',
                   nowarp:false,
                   border:false,
                   collapsible:true,
                   method:'get'">
                <thead>
                <tr>
                    <th data-options="field:'cb',width:30,checkbox: 'true'"></th>
                    <th data-options="field:'uuid',width:100,hidden:true">uuid</th>
                    <th data-options="field:'handlerCode',width:80,hidden:true">办理人编号</th>
                    <th data-options="field:'handlerName',width:200,hidden:false">办理人名称</th>
                </tr>
                </thead>
            </table>
        </div>
        <div data-options="region:'south',split:true" style="height:130px;">
            <input class="easyui-textbox" data-options="multiline:true,validType:'length[0,250]'" value="" name="opinions" type="text"
                   id="opinions" style="width:100%;height: 99%"/>
        </div>
    </div>
</div>
<script type="text/javascript">
    //01 获取配置流程信息
    var url = "<%=basePath %>flowData/getFlowByCode.action?flowCode=" + $("#flowCode").val();
    $.ajax({
        async: false,
        type: 'get',
        url: url,
        dataType: 'json',
        success: function (data) {
            $("#flowUuid").val(data[0].uuid);
            $("#flowName").val(data[0].flowName);
            $("#flowVersion").val(data[0].flowVersion);
            $("#flowInfo").text(data[0].flowName + " - [ " + data[0].flowVersion + " ]");
        },
        error: function (data) {
            alert("【" + url + "】JSON数据获取失败，请联系管理员！");
        }
    });

    //02 获取当前文档的流程信息
    if ($("#uuid").val() != '' && $("#uuid").val() != 'null') {
        url = "<%=basePath %>" + $("#flowModule").val() + "/getDataByUuid.action?uuid=" + $("#uuid").val();
        $.ajax({
            async: false,
            type: 'get',
            url: url,
            dataType: 'json',
            success: function (data) {
                $("#flowNodeUuid").val(data[0].flowNodeUuid);
                $("#flowNodeType").val(data[0].flowNodeType);
                $("#flowNodeCode").val(data[0].flowNodeCode);
                $("#flowNodeName").val(data[0].flowNodeName);
                $("#curHandlerCode").val(data[0].curHandlerCode);
                $("#curHandlerName").val(data[0].curHandlerName);
            },
            error: function (data) {
                alert("【" + url + "】JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //03 获取配置流程的所有节点信息
    var nodesData = "";
    url = '<%=basePath%>flowData/getNodesByFlowUuid.action?flowUuid=' + $("#flowUuid").val();
    $.ajax({
        async: false,
        type: 'get',
        url: url,
        dataType: 'json',
        success: function (data) {
            if (data != null) {
                nodesData = "";
                var curHandlerName = "";
                for (var i = 0; i < data.rows.length; i++) {
                    curHandlerName = "";
                    if ($("#flowNodeCode").val() == data.rows[i].nodeCode) {
                        curHandlerName = "[<span style='font-weight: bold;'>" + $("#curHandlerName").val() + "</span>]";
                    }
                    if (data.rows[i].nodeType == '<%=ConfigConst.STR_FLOW_START_NUM%>') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/start.png' /> "
                            + " <span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + curHandlerName + " -> ";
                    } else if (data.rows[i].nodeType == '<%=ConfigConst.STR_FLOW_TASK_NUM%>') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/node.png' /> "
                            + " <span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + curHandlerName + " -> ";
                    } else if (data.rows[i].nodeType == '<%=ConfigConst.STR_FLOW_NODE_NUM%>') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/node.png' /> "
                            + " <span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + curHandlerName + " -> ";
                    } else if (data.rows[i].nodeType == '<%=ConfigConst.STR_FLOW_END_NUM%>') {
                        nodesData = nodesData + "<img src='<%=basePath%>static/image/flow/finish.png' /> "
                            + " <span id='" + data.rows[i].uuid + "' name = '" + data.rows[i].nodeCode + "'>" + data.rows[i].nodeName + "</span>" + curHandlerName;
                    }
                }
                $("#flowShow").html(nodesData);
            }
        }
    });

    //04 获取当前节点：可编辑字段和必填字段


    //99 預覽流程圖
    function showFlowGraph() {
        var urlPath = "<%=basePath %>sysPopu/gotoFlowGraphPage.action?flowUuid=" + $("#flowUuid").val();
        window.ifrWorkFlow.location.href = urlPath;
        $('#winWorkFlow').window('open');
    }

    //流向和办理人選擇
    function openFlowToNext() {
        //当前环节必填字段
        if ($("#requiredFieldCode").val() != "") {
            var requiredCodes = $("#requiredFieldCode").val().split(";");
            var requiredNames = $("#requiredFieldName").val().split(";");
            for (var i = 0; i < requiredCodes.length; i++) {
                //保存前檢查
                if ($("#" + requiredCodes[i]).val() == "") {
                    $.messager.alert('Field Required', requiredNames[i] + ' must be entered!');
                    return false;
                }
            }
        }

        //dataGrid basic Setting:流向列表
        var urlPath1 = '<%=basePath%>flowData/flowDirection.action?flowUuid=' + $("#flowUuid").val() + '&nodeUuid=' + $("#flowNodeUuid").val();
        $('#nodeList').datagrid({
            url: urlPath1,
            //单击时：读取办理人信息
            onClickRow: function (rowIndex, rowData) {
                var urlPath2;
                //读取节点指定页面办理人
                urlPath2 = '<%=basePath%>flowData/getNodeByNodeUuid.action?nodeUuid=' + rowData.targetNodeUuid;
                $.ajax({
                    async: false,
                    type: 'get',
                    url: urlPath2,
                    dataType: 'json',
                    success: function (data) {
                        //办理角色
                        $("#handlerRoleCode").val(data[0].handlerRoleCode);
                        $("#handlerRoleName").val(data[0].handlerRoleName);
                        //办理设置控制
                        $("#handlerFieldCode").val(data[0].handlerFieldCode);
                        $("#handlerFieldName").val(data[0].handlerFieldName);
                    },
                    error: function (data) {
                        alert("【" + url + "】JSON数据获取失败，请联系管理员！");
                    }
                });

                //读取节点维护的办理人（独立办理人）
                urlPath2 = '<%=basePath%>flowData/flowSingleHandlerByNode.action?nodeUuid=' + rowData.targetNodeUuid;
                $('#handlerList').datagrid({
                    url: urlPath2,
                    onLoadSuccess: function (data) {
                        var lvHandlerCode = "";
                        var lvHandlerName = "";

                        //读取独立办理人(会签人员)
                        urlPath2 = '<%=basePath%>flowData/flowMultipleHandlerByNode.action?nodeUuid=' + rowData.targetNodeUuid;
                        $.ajax({
                            async: false,
                            type: 'get',
                            url: urlPath2,
                            dataType: 'json',
                            success: function (handler) {
                                if (handler.length > 0) {
                                    lvHandlerCode = handler[0].handlerCode;
                                    lvHandlerName = handler[0].handlerName;
                                }
                            }
                        });
                        //添加会签人员
                        if (lvHandlerCode != "" && lvHandlerName != "") {
                            $(this).datagrid('appendRow', {
                                uuid: uuid(),
                                handlerCode: lvHandlerCode,
                                handlerName: lvHandlerName
                            });
                        }

                        //读取节点维护的角色
                        var handlerRole;
                        if ($("#handlerRoleCode").val().trim() != "") {
                            urlPath2 = '<%=basePath%>flowData/flowRoleHandlerByCode.action?roleCode=' + $("#handlerRoleCode").val().trim();
                            $.ajax({
                                async: false,
                                type: 'get',
                                url: urlPath2,
                                dataType: 'json',
                                success: function (role) {
                                    handlerRole = role;
                                }
                            });
                        }
                        ;
                        if (handlerRole != null) {
                            for (var i = 0; i < handlerRole.length; i++) {
                                //添加角色人员
                                if (handlerRole[i].handlerCode != "") {
                                    $(this).datagrid('appendRow', {
                                        uuid: uuid(),
                                        handlerCode: handlerRole[i].handlerCode,
                                        handlerName: handlerRole[i].handlerName
                                    });
                                }
                            }
                        }

                        //读取页面选定办理人
                        if ($("#handlerFieldCode").val().trim() != "") {
                            lvHandlerCode = $('#' + $("#handlerFieldCode").val()).val().trim();
                            lvHandlerName = $('#' + $("#handlerFieldName").val()).val().trim();
                            if (lvHandlerCode != "" && lvHandlerName != "") {
                                $(this).datagrid('appendRow', {
                                    uuid: uuid(),
                                    handlerCode: lvHandlerCode,
                                    handlerName: lvHandlerName
                                });
                            }
                        }
                    }
                });
            }
        });
        //弹出提交窗口
        $('#popuFlowToNextNode').dialog('open');
    };

    //提交
    function submitToNextNode() {
        var selectedNodeRows = $('#nodeList').datagrid('getSelections');
        if (selectedNodeRows.length == 0) {
            $.messager.alert('Message', 'Please Next Node First！');
            return;
        }
        var selectedHandlerRows = $('#handlerList').datagrid('getSelections');
        if (selectedHandlerRows.length == 0) {
            $.messager.alert('Message', 'Please Handler First！');
            return;
        }

        //办理意见不能为空
        if($("#opinions").val().trim()==""){
            $.messager.alert('Message', 'Opinions is required！');
            return;
        }

        //目标字段赋值
        $("#targetNodeUuid").val(selectedNodeRows[0].targetNodeUuid);
        $("#targetNodeType").val(selectedNodeRows[0].targetNodeType);
        $("#targetNodeCode").val(selectedNodeRows[0].targetNodeCode);
        $("#targetNodeName").val(selectedNodeRows[0].targetNodeName);

        //办理人
        $("#targetHandlerCode").val(selectedHandlerRows[0].handlerCode);
        $("#targetHandlerName").val(selectedHandlerRows[0].handlerName);

        //关闭窗口
        $('#popuFlowToNextNode').dialog('close');

        //保存文档
        documentFlowToNext();
    }

    //保存办理人意见
    function  saveDocuOpinions() {
        //執行保存
        var objData = {
            docUuid: $("#uuid").val(),
            opinions: $("#opinions").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>opinions/saveOpinions.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>