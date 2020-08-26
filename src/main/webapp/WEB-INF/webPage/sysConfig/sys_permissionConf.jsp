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
    <table class="tbl" style="width:100%;">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/></td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 25%">
                权限状态
            </td>
            <td class="tblCell" style="width: 75%">
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
            <td class="tblTitle">
                权限编号
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="XXX-00000000000000X" name="permissionCode" type="text" id="permissionCode"
                       style="width:250px"
                       data-options="prompt:'Enter permission code.',required:true,validType:'length[1,20]'"/>
                &nbsp;(一经确定不能修改:eg:XXX-00000000000000X)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                权限名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="permissionName" type="text" id="permissionName"
                       style="width:350px"
                       data-options="prompt:'Enter permission name.',required:true,validType:'length[4,50]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                权限地址
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="permissionUrl" type="text" id="permissionUrl"
                       style="width:350px"
                       data-options="prompt:'Enter permission URL.',required:true,validType:'length[1,255]'"/></td>
        </tr>
        <tr style="display: none;">
            <td class="tblTitle">
                权限圖標
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="icon" type="text" id="icon"
                       style="width:350px"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                備註信息
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="comment" type="text" id="comment" style="width:350px"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    //Default Execution or Setting
    $(function () {
        $('#permissionCode').textbox('textbox').attr('maxlength', 20);
        $('#permissionName').textbox('textbox').attr('maxlength', 50);
        $('#icon').textbox('textbox').attr('maxlength', 150);
        $('#comment').textbox('textbox').attr('maxlength', 150);

        //permissionCode Check
        $('#permissionCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#permissionCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysConfig/permission/listByCode.action", {
                code: $("#permissionCode").val()
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'Permission Code already exist!', 'warning');
                    $("#permissionCode").textbox('setValue', "");
                }
            }, "json");
        });
    })

    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysConfig/permission/listByUuid.action?ws=" + webStatus + "&uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $('#permissionCode').textbox('readonly');
                $('#permissionCode').textbox('textbox').attr('disabled', true);
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#permissionCode").textbox('setValue', data[0].permissionCode);
                $("#permissionName").textbox('setValue', data[0].permissionName);
                $("#permissionUrl").textbox('setValue', data[0].permissionUrl);
                $("#icon").textbox('setValue', data[0].icon);
                $("#comment").textbox('setValue', data[0].comment);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#permissionCode").val() == "") {
            $.messager.alert('Field Required', 'Permission code must be entered!');
            return false;
        }
        if ($("#permissionName").val() == "") {
            $.messager.alert('Field Required', 'Permission name must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid:$("#uuid").val(),
            status: $('input[name="status"]:checked').val(),
            permissionCode: $("#permissionCode").val(),
            permissionName: $("#permissionName").val(),
            permissionUrl: $("#permissionUrl").val(),
            type: '',
            icon: $("#icon").val(),
            comment: $("#comment").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/permission/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#permissionConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>