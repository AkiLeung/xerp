<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>CompanyList</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body>
<form id="form1" action="" method="post">
    <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td bgColor="#0a589a" style="color: #000000;height:2px"></td>
        </tr>
        <tr>
            <td style="height:1px"></td>
        </tr>
    </table>
    <table class="tbl" style="width:auto;height:200px;">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                狀態
            </td>
            <td class="tblCell">
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
            <td colspan="2" class="tblInfo">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info1.png"/>&nbsp;基础信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle"  style="width: 150px">
                事业部编号
            </td>
            <td class="tblCell"  style="width: 550px">
                <input class="easyui-textbox" value="" name="businessCode" type="text" id="businessCode"
                       style="width:250px"
                       data-options="prompt:'Enter business code.',required:true,validType:'length[3,10]'"/>
                &nbsp;(一经确定不能修改 eg:BS000XXX)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                事业部名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="businessName" type="text" id="businessName"
                       style="width:250px"
                       data-options="prompt:'Enter business name.',required:true,validType:'length[4,50]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                负责人员
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="supervisorName" type="text" id="supervisorName"
                       style="width:250px"
                       data-options="prompt: '负责人员..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                                var v = $(e.data.target).textbox('getValue');
                                alert('The inputed value is ' + (v ? v : 'empty'));
				}}]"/>
                <span style="display:none"><input class="easyui-textbox" value="" name="supervisorCode" type="text"
                                                  id="supervisorCode" style="width:250px;"/></span></td>
        </tr>
        <tr>
            <td class="tblTitle">
                備註信息
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="comment" type="text" id="comment" style="width:350px"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                排序
            </td>
            <td class="tblCell">
                <input class="easyui-numberspinner" value="1" name="sort" id="sort"
                       data-options="increment:1,min:1,max:100,required:true" style="width:250px;"/>
            </td>
        </tr>
    </table>
</form>
</body>
<script>
    //Default Execution or Setting
    $(function () {
        $('#businessCode').textbox('textbox').attr('maxlength', 10);
        $('#businessName').textbox('textbox').attr('maxlength', 50);
        $('#comment').textbox('textbox').attr('maxlength', 200);

        //Company Check
        $('#businessCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#businessCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysOrg/business/listByCode.action", {
                code: document.getElementById("businessCode").value
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'BusinessName Code already exist!', 'warning');
                    $("#businessCode").textbox('setValue', "");
                }
            }, "json");
        });
    });

    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        var url = "<%=basePath %>sysOrg/business/listByUuid.action?ws=" + webStatus + "&uuid=" + $("#uuid").val();
        $.ajax({
            async: true,
            type: 'get',
            url: url,
            dataType: 'json',
            success: function (data) {
                $('#businessCode').textbox('textbox').attr('readonly', true);
                $('#businessCode').textbox('textbox').attr('disabled', true);
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#businessCode").textbox('setValue', data[0].businessCode);
                $("#businessName").textbox('setValue', data[0].businessName);
                $("#supervisorCode").textbox('setValue', data[0].supervisorCode);
                $("#supervisorName").textbox('setValue', data[0].supervisorName);
                $("#comment").textbox('setValue', data[0].comment);
                $("#sort").textbox('setValue', data[0].sort);
            },
            error: function (data) {
                alert("【" + url + "】JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#businessCode").val() == "") {
            $.messager.alert('Field Required', 'Business code must be entered!');
            return false;
        }
        if ($("#businessName").val() == "") {
            $.messager.alert('Field Required', 'Business name must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid:$("#uuid").val(),
            businessCode: $("#businessCode").val(),
            businessName: $("#businessName").val(),
            supervisorCode: $("#supervisorCode").val(),
            supervisorName: $("#supervisorName").val(),
            comment: $("#comment").val(),
            status: $('input[name="status"]:checked').val(),
            sort: $("#sort").val(),
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysOrg/business/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#businessConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("error");
            },
        });
    }
</script>
