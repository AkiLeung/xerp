<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div style="display: none1">
    <%--当前记录信息--%>
    flowUuid:<input value="" type="Text" name="flowUuid" id="flowUuid"/><br/>
    flowName:<input value="" type="Text" name="flowName" id="flowName"/><br/>
    flowVersion:<input value="" type="Text" name="flowVersion" id="flowVersion"/><br/>
    flowNodeUuid:<input value="" type="Text" name="flowNodeUuid" id="flowNodeUuid"/><br/>
    flowNodeType:<input value="" type="Text" name="flowNodeType" id="flowNodeType"/><br/>
    flowNodeCode:<input value="" type="Text" name="flowNodeCode" id="flowNodeCode"/><br/>
    flowNodeName:<input value="" type="Text" name="flowNodeName" id="flowNodeName"/><br/>
    curHandlerCode:<input value="" type="Text" name="curHandlerCode" id="curHandlerCode"/><br/>
    curHandlerName:<input value="" type="Text" name="curHandlerName" id="curHandlerName"/><br/>
    <%--当前环节信息--%>
    curNodeHandlerRole:<input value="" type="Text" name="handlerRole" id="handlerRole"/><br/>
    curNodeHandlerField:<input value="" type="Text" name="handlerField" id="handlerField"/><br/>
    <%--目标流程信息--%>
    targetNodeUuid:<input value="" type="Text" name="flowNodeUuid" id="targetNodeUuid"/><br/>
    targetNodeType:<input value="" type="Text" name="flowNodeType" id="targetNodeType"/><br/>
    targetNodeCode:<input value="" type="Text" name="targetNodeCode" id="targetNodeCode"/><br/>
    targetNodeName:<input value="" type="Text" name="targetNodeName" id="targetNodeName"/><br/>
    targetHandlerNum:<input value="" type="Text" name="curHandlerNum" id="targetHandlerNum"/><br/>
    targetHandlerNam:<input value="" type="Text" name="curHandlerNam" id="targetHandlerNam"/><br/>
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
                    <th data-options="field:'handlerName',width:180">办理人名称</th>
                </tr>
                </thead>
            </table>
        </div>
        <div data-options="region:'south',split:true" style="height:130px;">
            <input class="easyui-textbox" data-options="multiline:true" value="" name="opinions" type="text"
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

    //99 預覽流程圖
    function showFlowGraph() {
        var urlPath = "<%=basePath %>sysPopu/gotoFlowGraphPage.action?flowUuid=" + $("#flowUuid").val();
        window.ifrWorkFlow.location.href = urlPath;
        $('#winWorkFlow').window('open');
    }

    //選擇
    function openFlowToNext() {
        //dataGrid basic Setting:流向列表
        var urlPath1 = '<%=basePath%>flowData/flowDirection.action?flowUuid=' + $("#flowUuid").val() + '&nodeUuid=' + $("#flowNodeUuid").val();
        $('#nodeList').datagrid({
            url: urlPath1,
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30, hidden: false},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'flowUuid', title: 'flowUuid', width: 100, hidden: true},
                {field: 'nodeUuid', title: 'nodeUuid', width: 100, hidden: true},
                {field: 'directionType', title: 'directionType', width: 50, hidden: true},
                {field: 'directionCode', title: '流向編碼', width: 80, hidden: true},
                {field: 'directionName', title: '流向名稱', width: 180, hidden: false},
                {field: 'targetNodeType', title: '目標環節-Type', width: 100, hidden: true},
                {field: 'targetNodeUuid', title: '目標環節-Uuid', width: 100, hidden: true},
                {field: 'targetNodeCode', title: '目標環節-Code', width: 100, hidden: true},
                {field: 'targetNodeName', title: '目標環節-Name', width: 100, hidden: true},
            ]],
            onClickRow: function (rowIndex, rowData) {
                var urlPath2 = '';
                //读取指定页面办理人
                urlPath2 = '<%=basePath%>flowData/getNodeByNodeUuid.action?nodeUuid=' + rowData.targetNodeUuid;
                $.ajax({
                    async: false,
                    type: 'get',
                    url: urlPath2,
                    dataType: 'json',
                    success: function (data) {
                        $("#handlerRole").val(data[0].handlerRole);
                        $("#handlerField").val(data[0].handlerField);
                    },
                    error: function (data) {
                        alert("【" + url + "】JSON数据获取失败，请联系管理员！");
                    }
                });

                //读取节点维护的办理人
                urlPath2 = '<%=basePath%>flowData/flowHandlerByNode.action?nodeUuid=' + rowData.targetNodeUuid;
                $('#handlerList').datagrid({
                    url: urlPath2,
                    // columns: [[
                    //     {field: 'cb', checkbox: 'true', width: 30},
                    //     {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                    //     {field: 'handlerCode', title: '办理人编号', width: 180, hidden: true},
                    //     {field: 'handlerName', title: '办理人名称', width: 180, hidden: false}
                    // ]]
                });

                //读取角色办理人
                if ($("#handlerRole").val() != "") {
                    //alert($("#handlerRole").val());
                    $('#handlerList').datagrid('appendRow', {
                        uuid: '123465789',
                        handlerCode: '132456',
                        handlerName: 'test'
                    });
                    // $('#handlerList').datagrid('insertRow',{
                    //     index: 1,
                    //     row:{
                    //         ck:'',
                    //         uuid: '132456',
                    //         handlerCode: "1123",
                    //         handlerName: "TEST"
                    //     }
                    // });
                }
            }
        });
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

        //目标字段赋值
        $("#targetNodeUuid").val(selectedNodeRows[0].targetNodeUuid);
        $("#targetNodeType").val(selectedNodeRows[0].targetNodeType);
        $("#targetNodeCode").val(selectedNodeRows[0].targetNodeCode);
        $("#targetNodeName").val(selectedNodeRows[0].targetNodeName);
        $("#targetHandlerCode").val(selectedHandlerRows[0].handlerCode);
        $("#targetHandlerName").val(selectedHandlerRows[0].handlerName);
        //关闭窗口
        $('#popuFlowToNextNode').dialog('close');
        //保存文档
        documentFlowToNext();
    }
</script>