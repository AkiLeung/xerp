<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>User Config</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north'" style="height:28px">
        <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td bgColor="#F9FBFC"
                    style="COLOR: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
                    &nbsp;<img alt="Config" src="<%=basePath%>static/image/config.gif"
                               style="width: 16px; height: 16px"/>&nbsp;日志列表
                </td>
            </tr>
            <tr>
                <td bgColor="#0a589a" style="COLOR: #000000;height:2px"></td>
            </tr>
            <tr>
                <td style="height:1px"></td>
            </tr>
        </table>
    </div>
    <div data-options="region:'center'">
        <table id="dataList" class="easyui-datagrid" style="width:100%;" fit="true"
               data-options="
               singleSelect:false,
               rownumbers:true,
               pagination:true,
               idField:'logId',
               nowarp:false,
               border:false,
               pageSize:30,
               pageList:[30,50,70],
               collapsible:true,
               method:'get',
               rowStyler: function(index,row){
                <%--if(row.status=='<%=ConfigConst.STR_STATUS_ACTIVE_NUM%>'){row.status = '<%=ConfigConst.STR_STATUS_ACTIVE_TXT%>';}--%>
                <%--if(row.status=='<%=ConfigConst.STR_STATUS_BLOCK_NUM%>'){row.status = '<b><%=ConfigConst.STR_STATUS_BLOCK_TXT%><b>';}--%>
           },
           toolbar:toolbar">
        </table>
    </div>
    <div id="sysLogDetail" class="easyui-dialog" style="width:900px;height:665px"
         data-options="
         iconCls:'icon-setting',
         title:'日志明细',
         closed:true,
         modal:true,
         collapsible:false,
         minimizable:false,
         maximizable:false,
         draggable:true,
         resizable:false,
         buttons: [{
					text:'Close',
					iconCls:'icon-close',
					handler:function(){
						$('#sysLogDetail').dialog('close');
					}
				}]">
        <iframe id="ifrSysLogDetail" name="ifrSysLogDetail" src="" width="100%" height="100%" frameborder="0"></iframe>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //Toolbar
    var toolbar = [ {
        text: 'Refresh',
        iconCls: 'icon-reload',
        handler: function () {
            $("#dataList").datagrid("reload");
        }
    }];

    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/sysLog/listData.action',
            columns: [[
                {field: 'logId', title: 'logId', width: 100},
                {field: 'logFile', title: 'File', width: 180},
                {
                    field: 'logClass', title: 'Class', width: 300,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrSysLogDetail","sysLogDetail","<%=basePath %>sysConfig/sysLog/gotoDetailPage.action?logId=' + row.logId + '")>' + row.logClass + '</a>';
                    }
                },
                {field: 'logMethod', title: 'Method', width: 130},
                {field: 'logLine', title: 'Line', width: 40},
                {field: 'logThread', title: 'Thread', width: 150},
                {field: 'logLevel', title: 'Level', width: 70},
                {field: 'logMessage', title: 'Message', width: 450},
                {field: 'createdDatetime', title: 'Datetime', width: 150}
            ]]
        });
    });
</script>