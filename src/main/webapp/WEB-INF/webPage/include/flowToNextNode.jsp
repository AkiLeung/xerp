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
                {field: 'targetNodeUuid', title: '目標環節', width: 100, hidden: true},
                {field: 'targetNodeName', title: '目標環節', width: 100, hidden: true}
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
                            $(this).datagrid('appendRow', { handlerName: '<div style="text-align:center;color:red">没有相关办理人！</div>' }).datagrid('mergeCells', { index: 0, field: 'handlerName', colspan: 2 })
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
</script>