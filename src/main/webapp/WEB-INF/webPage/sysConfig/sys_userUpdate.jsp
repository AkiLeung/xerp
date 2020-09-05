<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="com.xerp.common.consts.ConfigConst" %>
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
    <table class="tbl" style="width:100%; height:350px">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/></td>
        </tr>
        <tr>
            <td class="tblTitle" style="width:25%">
                用戶編號
            </td>
            <td class="tblCell" style="width:75%">
                <input class="easyui-textbox" name="userCode" type="text" id="userCode" style="width:250px"
                       data-options="
                       iconCls:'icon-man',
                       prompt:'Enter user code',
                       required:true"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                用戶名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="userName" type="text" id="userName" style="width:250px"
                       data-options="iconCls:'icon-man',prompt:'Enter user name.',required:true,validType:'length[1,50]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                用戶類型
            </td>
            <td class="tblCell">
                <label style="cursor: pointer"><input type="radio" name="userType" value="00" checked>普通用戶</label>&nbsp;&nbsp;
                <label style="cursor: pointer"><input type="radio" name="userType" value="01">治理層</label>&nbsp;&nbsp;
                <label style="cursor: pointer"><input type="radio" name="userType" value="*">系統管理員</label></td>
        </tr>
        <tr>
            <td class="tblTitle">
                用戶狀態
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
        </tr>
        <tr>
            <td class="tblTitle">
                默认门户
            </td>
            <td class="tblCell">
                <span style="display:none"><input class="easyui-textbox" value="" name="portalUuid" type="text"
                                                  id="portalUuid" style="width:250px"/></span>
                <input class="easyui-textbox" value="" name="portalName" type="text"
                       id="portalName" style="width:250px" data-options="prompt: '請選擇..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               openPortalSelect('<%=basePath %>sysPopu/portalTree.action?uuid=portalUuid&name=portalName&type=1');
				}}]"/>&nbsp;(必填)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                所属公司
            </td>
            <td class="tblCell">
                <span style="display:none"><input class="easyui-textbox" value="" name="cmpUuid" type="text"
                                                  id="cmpUuid" style="width:250px"/></span>
                <input class="easyui-textbox" value="" name="companyName" type="text"
                       id="companyName" style="width:250px" data-options="prompt: '請選擇..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               openPortalSelect('<%=basePath %>sysPopu/portalTree.action?uuid=cmpUuid&name=companyName&type=1');
				}}]"/>&nbsp;(必填)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                所属部门
            </td>
            <td class="tblCell">
                <span style="display:none"><input class="easyui-textbox" value="" name="depUuid" type="text"
                                                  id="depUuid" style="width:250px"/></span>
                <input class="easyui-textbox" value="" name="departmentName" type="text"
                       id="departmentName" style="width:250px" data-options="prompt: '請選擇..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               openPortalSelect('<%=basePath %>sysPopu/portalTree.action?uuid=depUuid&name=departmentName&type=1');
				}}]"/>&nbsp;(必填)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                事业部
            </td>
            <td class="tblCell">
                <span style="display:none"><input class="easyui-textbox" value="" name="portalUuid" type="text"
                                                  id="busUuid" style="width:250px"/></span>
                <input class="easyui-textbox" value="" name="businessUnitName" type="text"
                       id="businessUnitName" style="width:250px" data-options="prompt: '請選擇..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               openPortalSelect('<%=basePath %>sysPopu/portalTree.action?uuid=busUuid&name=businessUnitName&type=1');
				}}]"/>&nbsp;(选填)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                事业部-部门
            </td>
            <td class="tblCell">
                <span style="display:none"><input class="easyui-textbox" value="" name="portalUuid" type="text"
                                                  id="busDepUuid" style="width:250px"/></span>
                <input class="easyui-textbox" value="" name="busDepName" type="text"
                       id="busDepName" style="width:250px" data-options="prompt: '請選擇..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               openPortalSelect('<%=basePath %>sysPopu/portalTree.action?uuid=busDepUuid&name=busDepName&type=1');
				}}]"/>&nbsp;(选填)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                默认样式
            </td>
            <td class="tblCell">
                <select class="easyui-combobox" id="theme" name="theme" style="width:250px;">
                    <option value="default">default</option>
                    <option value="cupertino">cupertino</option>
                    <option value="bootstrap">bootstrap</option>
                    <option value="black">black</option>
                    <option value="gray">gray</option>
                    <option value="material">material</option>
                    <option value="metro">metro</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                有效期起
            </td>
            <td class="tblCell">
                <input class="easyui-datebox" value="2017-01-01"
                       data-options="formatter:myformatter,parser:myparser" name="validFrom" type="text"
                       id="validFrom" style="width:250px"/>
                (用户可以登录的有效期开始日期)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                有效期止
            </td>
            <td class="tblCell">
                <input class="easyui-datebox" value="2999-12-31"
                       data-options="formatter:myformatter,parser:myparser" name="validTo" type="text" id="validTo"
                       style="width:250px"/>
                (用户可以登录的有效期结束日期)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                默認語言
            </td>
            <td class="tblCell">
                <select class="easyui-combobox" name="language" id="language" style="width:250px;"
                        data-options="
                        valueField: 'keyCode',
                        textField: 'keyName',
                        url:'<%=basePath%>sysConfig/keyValue/listByDataType.action?typeCode=<%=ConfigConst.STR_SYS_KEY_VALUE_LANGUAGE%>'">
                </select>
            </td>
        </tr>
    </table>
    <jsp:include page="../include/portalSelect01.jsp" flush="true"/>
</form>
</body>
</html>
<script>
    //用戶編碼自動校驗重複
    $(function () {
        $('#password').textbox('textbox').attr('maxlength', 10);
        $('#userCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#userCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysConfig/user/listByCode.action", {
                userCode: document.getElementById("userCode").value
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'User Code already exist!', 'warning');
                    $("#userCode").textbox('setValue', "");
                }
            }, "json");
        });
    });

    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysConfig/user/listByUuid.action?ws=" + webStatus + "&uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("#userCode").textbox('textbox').attr('readonly', true);
                $("#userCode").textbox('textbox').attr('disabled', true);
                $("#userCode").textbox('setValue', data.userCode);
                $("#userName").textbox('setValue', data.userName);
                $("input[name='userType'][value ='" + data.userType + "']").attr("checked", "checked").parent().addClass('checked');
                $("input[name='status'][value ='" + data.status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#portalUuid").textbox('setValue', data.portalUuid);
                getPortalName(data.portalUuid, "portalName");
                $('#portalName').textbox('textbox').attr('readonly', true);


                $("#theme").textbox('setValue', data.theme);
                $("#validFrom").textbox('setValue', data.validFrom);
                $('#validFrom').textbox('textbox').attr('readonly', true);
                $("#validTo").textbox('setValue', data.validTo);
                $('#validTo').textbox('textbox').attr('readonly', true);
                $("#language").textbox('setValue', data.language);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

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
        if ($("#portalUuid").val() == "") {
            $.messager.alert('Field Required', 'portal must be entered!');
            return false;
        }
        //執行保存
            $.post("<%=basePath %>sysConfig/user/saveData.action", $("#form1").serialize())
                .done(function (result) {
                    if ("success" == result) {
                        parent.$('#dataList').datagrid('reload');
                        parent.$('#userConfig').dialog('close');
                    }
                }).fail(function (result) {
                alert("添加时出现异常" + result.toLocaleString());
            });
    }

    //默認門戶
    function getPortalName(uuid, field) {
        if (uuid != '') {
            $.ajax({
                async: true,
                type: 'get',
                url: '<%=basePath%>sysConfig/portal/listByUuid.action?uuid=' + uuid,
                dataType: 'json',
                success: function (data) {
                    $('#' + field).textbox('setValue', data.portalName);
                },
                error: function (data) {
                    alert('JSON数据获取失败，请联系管理员！');
                }
            });
        }
    }
</script>