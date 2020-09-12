<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="popuFlowToNextNode" class="easyui-dialog" title="Please select ....."
     style="width:500px;height:450px;padding:1px"
     data-options="
				iconCls: 'icon-more',
				closed:true,
				modal:true,
				buttons: [{
					text:'Confirm',
					iconCls:'icon-tip',
					handler:function(){
					  alert(132123);
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
            </table>
        </div>
        <div data-options="region:'south',split:true" style="height:80px;">
            <input class="easyui-textbox" data-options="multiline:true" value="" name="opinions" type="text"
                   id="opinions" style="width:100%;height: 99%"/>
        </div>
    </div>
</div>

<script type="text/javascript">
    //選擇
    function openFlowToNext() {
        //dataGrid basic Setting:流向列表
        var urlPath1 = '<%=basePath%>flowData/flowDirection.action?flowUuid=' + $("#flowUuid").val() + '&nodeUuid=' + $("#flowNodeUuid").val();
        var urlPath2 = '';
        $('#nodeList').datagrid({
            url: urlPath1,
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30, hidden: true},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'flowUuid', title: 'flowUuid', width: 100, hidden: true},
                {field: 'nodeUuid', title: 'nodeUuid', width: 100, hidden: true},
                {field: 'directionType', title: 'directionType', width: 50, hidden: true},
                {field: 'directionCode', title: '流向編碼', width: 80, hidden: true},
                {field: 'directionName', title: '流向名稱', width: 180},
                {field: 'targetNodeName', title: '目標環節', width: 100, hidden: true}
            ]],
            onClickRow: function (rowIndex, rowData) {
                alert(rowData.uuid);
            }
        });

        $('#handlerList').datagrid({
            url: urlPath2,
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'flowUuid', title: 'flowUuid', width: 100, hidden: true},
                {field: 'nodeUuid', title: 'nodeUuid', width: 100, hidden: true},
                {field: 'directionType', title: 'directionType', width: 50, hidden: true},
                {field: 'directionCode', title: '流向編碼', width: 80, hidden: true},
                {field: 'directionName', title: '流向名稱', width: 180},
                {field: 'targetNodeName', title: '目標環節', width: 100, hidden: true}
            ]],
            onClickRow: function (rowIndex, rowData) {
                //alert(rowData.targetNodeName);
            }
        });
        $('#popuFlowToNextNode').dialog('open');
    };
</script>