<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>userConfig</title>
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
    <table class="tbl" style="width:600px; height:120px">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/></td>
        </tr>
        <tr>
            <td colspan="2" class="tblInfo">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info3.png"/>&nbsp;请填写新密码
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width:25%">
                用戶編號
            </td>
            <td class="tblCell" style="width:75%">
                <input class="easyui-textbox" name="userCode" type="text" id="userCode" style="width:250px"
                       data-options="
                       iconCls:'icon-man',
                       prompt:'Enter user code'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                用戶名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="userName" type="text" id="userName" style="width:250px"
                       data-options="iconCls:'icon-man',prompt:'Enter user name.'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                登录密码
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="<spring:message code="xerp.system.password"></spring:message>"
                       name="password" type="text" id="password" maxlength="10"
                       style="width:250px"
                       data-options="iconCls:'icon-lock',required:true,validType:'length[1,10]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblBottom" colspan="2" style="text-align: center;height: 60px">
                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveData();">Save</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    //頁面加載時執行
    <%--$.ajax({--%>
        <%--async: true,--%>
        <%--type: 'get',--%>
        <%--url: "<%=basePath %>sysConfig/user/listByUuid.action?uuid=" + $("#uuid").val(),--%>
        <%--dataType: 'json',--%>
        <%--success: function (data) {--%>
            <%--$('#userCode').textbox('textbox').attr('readonly', true);--%>
            <%--$('#userCode').textbox('textbox').attr('disabled', true);--%>
            <%--$("#userCode").textbox('setValue', data.userCode);--%>
            <%--$('#userName').textbox('textbox').attr('readonly', true);--%>
            <%--$('#userName').textbox('textbox').attr('disabled', true);--%>
            <%--$("#userName").textbox('setValue', data.userName);--%>
        <%--},--%>
        <%--error: function (data) {--%>
            <%--alert("JSON数据获取失败，请联系管理员！");--%>
        <%--}--%>
    <%--});--%>

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#userCode").val() == "") {
            $.messager.alert('Field Required', 'user code must be entered!');
            return false;
        }
        if ($("#userName").val() == "") {
            $.messager.alert('Field Required', 'user name must be entered!');
            return false;
        }
        if ($("#password").val() == "") {
            $.messager.alert('Field Required', 'password must be entered!');
            return false;
        }
        //執行保存
        $.post("<%=basePath %>sysConfig/user/updatePassword.action", $("#form1").serialize())
            .done(function (result) {
                if ("success" == result) {
                    parent.$('#dataList').datagrid('reload');
                    parent.$('#userPassword').dialog('close');
                }
            }).fail(function (result) {
            alert("添加时出现异常" + result.toLocaleString());
        });
    }
</script>