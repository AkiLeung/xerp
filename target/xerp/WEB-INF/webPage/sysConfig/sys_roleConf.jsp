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
                角色状态
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
                角色编号
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="XXX-00000000000000X" name="roleCode" type="text" id="roleCode"
                       style="width:250px"
                       data-options="prompt:'Enter role code.',required:true,validType:'length[1,20]'"/>
                &nbsp;(一经确定不能修改:eg:XXX-00000000000000X)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                角色名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="roleName" type="text" id="roleName"
                       style="width:350px"
                       data-options="prompt:'Enter role name.',required:true,validType:'length[4,50]'"/></td>
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
        $('#roleCode').textbox('textbox').attr('maxlength', 20);
        $('#roleName').textbox('textbox').attr('maxlength', 50);
        $('#comment').textbox('textbox').attr('maxlength', 150);

        //permissionCode Check
        $('#roleCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#roleCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysConfig/role/listByCode.action", {
                code: $("#roleCode").val()
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'Role Code already exist!', 'warning');
                    $("#roleCode").textbox('setValue', "");
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
            url: "<%=basePath %>sysConfig/role/listByUuid.action?ws=" + webStatus + "&uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $('#roleCode').textbox('readonly');
                $('#roleCode').textbox('textbox').attr('disabled', true);
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#roleCode").textbox('setValue', data[0].roleCode);
                $("#roleName").textbox('setValue', data[0].roleName);
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
        if ($("#rolenCode").val() == "") {
            $.messager.alert('Field Required', 'Role code must be entered!');
            return false;
        }
        if ($("#roleName").val() == "") {
            $.messager.alert('Field Required', 'Role name must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid:$("#uuid").val(),
            status: $('input[name="status"]:checked').val(),
            roleCode: $("#roleCode").val(),
            roleName: $("#roleName").val(),
            comment: $("#comment").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/role/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#roleConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>