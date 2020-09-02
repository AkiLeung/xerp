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
            <table id="dataList" class="easyui-datagrid" style="width:100%;" fit="true"
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
            xxxxxxxxxx
        </div>
        <div data-options="region:'south',split:true" style="height:80px;">
            <input class="easyui-textbox"  data-options="multiline:true" value="" name="opinions" type="text" id="opinions" style="width:100%;height: 99%"/>
        </div>
    </div>
</div>
<script type="text/javascript">
    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/flowNode/listData.action?flowUuid=' + $("#flowUuid").val(),
            columns: [[
                {field: 'cb', checkbox: 'true', width: 30},
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'nodeName', title: '流向', width: 180},
            ]],
            onClickRow: function (rowIndex, rowData) {
                //加载完毕后获取所有的checkbox遍历
                $("input[type='checkbox']").each(function (index, el) {
                    //如果当前的复选框不可选，则不让其选中
                    if (el.disabled == true) {
                        $('#dataList').datagrid('unselectRow', index - 1);
                    }
                })
            }
        });
    });

    //選擇
    function openFlowToNext(urlPath) {
        // window.ifrSysCompanySelectList.location.href = urlPath;
         $('#popuFlowToNextNode').dialog('open');
    }
</script>

