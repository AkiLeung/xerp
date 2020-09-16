<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div style="display: none1">
    <%--当前信息--%>
    flowUuid:<input value="" type="Text" name="flowUuid" id="flowUuid"/><br/>
    flowName:<input value="" type="Text" name="flowName" id="flowName"/><br/>
    flowVersion:<input value="" type="Text" name="flowVersion" id="flowVersion"/><br/>
    flowNodeUuid:<input value="" type="Text" name="flowNodeUuid" id="flowNodeUuid"/><br/>
    flowNodeType:<input value="" type="Text" name="flowNodeType" id="flowNodeType"/><br/>
    flowNodeCode:<input value="" type="Text" name="flowNodeCode" id="flowNodeCode"/><br/>
    flowNodeName:<input value="" type="Text" name="flowNodeName" id="flowNodeName"/><br/>
    curHandlerNum:<input value="" type="Text" name="curHandlerNum" id="curHandlerNum"/><br/>
    curHandlerNam:<input value="" type="Text" name="curHandlerNam" id="curHandlerNam"/><br/>
    <%--目标信息--%>
    targetNodeUuid:<input value="" type="Text" name="flowNodeUuid" id="targetNodeUuid"/><br/>
    targetNodeType:<input value="" type="Text" name="flowNodeType" id="targetNodeType"/><br/>
    targetNodeCode:<input value="" type="Text" name="targetNodeCode" id="targetNodeCode"/><br/>
    targetNodeName:<input value="" type="Text" name="targetNodeName" id="targetNodeName"/><br/>
    targetHandlerNum:<input value="" type="Text" name="curHandlerNum" id="targetHandlerNum"/><br/>
    targetHandlerNam:<input value="" type="Text" name="curHandlerNam" id="targetHandlerNam"/><br/>
</div>
<div id="popuFlowToNextNode" class="easyui-dialog" title="Please select ....."
     style="width:1500px;height:450px;padding:1px"
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
                   showHeader:true,
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
            </table>
        </div>
        <div data-options="region:'south',split:true" style="height:80px;">
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
    <%--if ($("#uuid").val() != '' && $("#uuid").val() != 'null') {--%>
        <%--url = "<%=basePath %>" + $("#flowModule").val() + "/getDataByUuid.action?uuid=" + $("#uuid").val();--%>
        <%--$.ajax({--%>
            <%--async: false,--%>
            <%--type: 'get',--%>
            <%--url: url,--%>
            <%--dataType: 'json',--%>
            <%--success: function (data) {--%>
                <%--$("#flowNodeUuid").val(data[0].flowNodeUuid);--%>
                <%--$("#flowNodeType").val(data[0].flowNodeType);--%>
                <%--$("#flowNodeCode").val(data[0].flowNodeCode);--%>
                <%--$("#flowNodeName").val(data[0].flowNodeName);--%>
                <%--$("#curHandlerNum").text(data[0].curHandlerNum);--%>
                <%--$("#curHandlerNam").text(data[0].curHandlerNam);--%>
            <%--},--%>
            <%--error: function (data) {--%>
                <%--alert("【" + url + "】JSON数据获取失败，请联系管理员！");--%>
            <%--}--%>
        <%--});--%>
    <%--} else {--%>
        //默认流程为第一个环节
        url = "<%=basePath %>flowData/getStartNodeByFlowUuid.action?flowUuid=" + $("#flowUuid").val();
        $.ajax({
            async: false,
            type: 'get',
            url: url,
            dataType: 'json',
            success: function (data) {
                $("#flowNodeUuid").val(data[0].uuid);
                $("#flowNodeType").val(data[0].nodeType);
                $("#flowNodeCode").val(data[0].nodeCode);
                $("#flowNodeName").val(data[0].nodeName);
                $("#curHandlerNum").val('<shiro:principal property="userCode"/>');
                $("#curHandlerNam").val('<shiro:principal property="userName"/>');
            },
            error: function (data) {
                alert("【" + url + "】JSON数据获取失败，请联系管理员！");
            }
        });
    // };

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
                        curHandlerName = "[<span style='font-weight: bold;'>" + $("#curHandlerNam").val() + "</span>]";
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
                {field: 'targetNodeType', title: '目標環節-Type', width: 100, hidden: false},
                {field: 'targetNodeUuid', title: '目標環節-Uuid', width: 100, hidden: false},
                {field: 'targetNodeCode', title: '目標環節-Code', width: 100, hidden: false},
                {field: 'targetNodeName', title: '目標環節-Name', width: 100, hidden: false},
            ]],
            onClickRow: function (rowIndex, rowData) {
                var urlPath2 = '<%=basePath%>flowData/flowHandler.action?nodeUuid=' + rowData.targetNodeUuid;
                $('#handlerList').datagrid({
                    url: urlPath2,
                    columns: [[
                        {field: 'cb', checkbox: 'true', width: 30},
                        {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                        {field: 'handlerCode', title: '办理人编号', width: 180, hidden: true},
                        {field: 'handlerName', title: '办理人名称', width: 180, hidden: false}
                    ]],
                    onLoadSuccess: function (data) {
                        if (data.total == 0) {
                            //添加一个新数据行，第一列的值为你需要的提示信息，然后将其他列合并到第一列来，注意修改colspan参数为你columns配置的总列数
                            $(this).datagrid('appendRow', {handlerName: '<div style="text-align:center;color:red">没有相关办理人！</div>'}).datagrid('mergeCells', {
                                index: 0,
                                field: 'handlerName',
                                colspan: 2
                            })
                            //隐藏分页导航条，这个需要熟悉datagrid的html结构，直接用jquery操作DOM对象，easyui datagrid没有提供相关方法隐藏导航条
                            $(this).closest('div.datagrid-wrap').find('div.datagrid-pager').hide();
                        }
                        //如果通过调用reload方法重新加载数据有数据时显示出分页导航容器
                        else $(this).closest('div.datagrid-wrap').find('div.datagrid-pager').show();
                    },
                    onClickRow: function (rowIndex, rowData) {
                        //alert(rowData.targetNodeName);
                    }
                });
            }
        });
        $('#popuFlowToNextNode').dialog('open');
    };

    //提交
    function  submitToNextNode() {
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
        $("#targetHandlerNum").val(selectedHandlerRows[0].handlerCode);
        $("#targetHandlerNam").val(selectedHandlerRows[0].handlerName);
        //关闭窗口
        $('#popuFlowToNextNode').dialog('close');
        //保存文档
        saveDocument();
    }
</script>