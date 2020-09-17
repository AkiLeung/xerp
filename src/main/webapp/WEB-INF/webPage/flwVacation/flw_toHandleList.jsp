<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north'" style="height:28px">
        <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td bgColor="#F9FBFC"
                    style="COLOR: #000000;text-align:left;font-weight:bold; color:#195E8A; height:23px">
                    &nbsp;<img alt="list" src="<%=basePath%>static/image/info1.png"
                               style="width: 16px; height: 16px"/>&nbsp;我的待办
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
               singleSelect:true,
               rownumbers:true,
               pagination:true,
               idField:'uuid',
               nowarp:false,
               border:false,
               pageSize:30,
               pageList:[30,50,70],
               collapsible:true,
               method:'get',
               rowStyler: function(index,row){
                if(row.status=='<%=ConfigConst.STR_STATUS_ACTIVE_NUM%>'){row.statusTxt = '<%=ConfigConst.STR_STATUS_ACTIVE_TXT%>';}
                if(row.status=='<%=ConfigConst.STR_STATUS_BLOCK_NUM%>'){row.statusTxt = '<b><%=ConfigConst.STR_STATUS_BLOCK_TXT%><b>';}
                if(row.status=='<%=ConfigConst.STR_STATUS_DELETE_NUM%>'){row.statusTxt = '<b><%=ConfigConst.STR_STATUS_DELETE_TXT%><b>';}
                if(row.userType=='<%=ConfigConst.STR_USER_TYPE_NUM_USER%>'){row.userType = '<%=ConfigConst.STR_USER_TYPE_TXT_USER%>';}
                if(row.userType=='<%=ConfigConst.STR_USER_TYPE_NUM_MANAGER%>'){row.userType = '<%=ConfigConst.STR_USER_TYPE_TXT_MANAGER%>';}
                if(row.userType=='<%=ConfigConst.STR_USER_TYPE_NUM_ADMIN%>'){row.userType = '<%=ConfigConst.STR_USER_TYPE_TXT_ADMIN%>';}
           },
           toolbar:toolbar">
        </table>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //Toolbar
    var toolbar = [{
        text: 'Refresh',
        iconCls: 'icon-reload',
        handler: function () {
            $("#dataList").datagrid("reload");
        }
    }];

    //dataGrid basic Setting
    $(function () {
        $('#dataList').datagrid({
            url: '<%=basePath%>sysConfig/user/listData.action',
            columns: [[
                {field: 'uuid', title: 'uuid', width: 100, hidden: true},
                {field: 'status', title: '狀態', width: 20, hidden: true},
                {field: 'statusTxt', title: '狀態', width: 50},
                {
                    field: 'userCode', title: '用戶編碼', width: 80,
                    formatter: function (value, row, index) {
                        return '<a style="color:blue" href="#" onclick=showDialogWin("ifrUserConfig","userConfig","<%=basePath %>sysConfig/user/gotoUpdatePage.action?ws=update&uuid=' + row.uuid + '")>' + row.userCode + '</a>';
                    }
                },
                {field: 'userName', title: '用戶名稱', width: 150},
                {field: 'userType', title: '用戶类型', width: 80},
                {field: 'theme', title: '主题', width: 100},
                {field: 'portalUuid', title: '门户', width: 30, hidden: true},
                {field: 'validFrom', title: '有效时间-起', width: 100},
                {field: 'validTo', title: '有效时间-止', width: 100},
                {field: 'language', title: '语言', width: 80},
                {field: 'createdBy', title: '创建人', width: 100},
                {field: 'createdDatetime', title: '创建时间', width: 150},
                {field: 'modifiedBy', title: '最后修改人', width: 80},
                {field: 'modifiedDatetime', title: '最后修改时间', width: 150},
            ]]
        });
    });
</script>