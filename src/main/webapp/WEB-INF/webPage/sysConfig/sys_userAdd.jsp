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
    <table class="tbl" style="width:100%; height:360px">
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
                               openCompanySelect('<%=basePath %>sysPopu/companyTree.action?uuid=cmpUuid&name=companyName&type=1');
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
                               var url = '<%=basePath %>sysPopu/departmentTree.action?cmpUuid='+ $('#cmpUuid').val();
                                   url = url + ' &uuid=depUuid&name=departmentName&type=1';
                               openDepartmentSelect(url);
				}}]"/>&nbsp;(必填)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                事业部
            </td>
            <td class="tblCell">
                <span style="display:none"><input class="easyui-textbox" value="" name="busUuid" type="text"
                                                  id="busUuid" style="width:250px"/></span>
                <input class="easyui-textbox" value="" name="businessName" type="text"
                       id="businessName" style="width:250px" data-options="prompt: '請選擇..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               openBusinessSelect('<%=basePath %>sysPopu/businessTree.action?uuid=busUuid&name=businessName&type=1');
				}}]"/>&nbsp;(选填)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                事业部-部门
            </td>
            <td class="tblCell">
                <span style="display:none"><input class="easyui-textbox" value="" name="busUnitUuid" type="text"
                                                  id="busUnitUuid" style="width:250px"/></span>
                <input class="easyui-textbox" value="" name="busUnitName" type="text"
                       id="busUnitName" style="width:250px" data-options="prompt: '請選擇..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               var url = '<%=basePath %>sysPopu/businessUnitTree.action?busUuid='+ $('#busUuid').val();
                                   url = url + ' &uuid=busUnitUuid&name=busUnitName&type=1';
                               openBusinessUnitSelect(url);
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
    <jsp:include page="../include/companySelect01.jsp" flush="true"/>
    <jsp:include page="../include/departmentSelect01.jsp" flush="true"/>
    <jsp:include page="../include/businessSelect01.jsp" flush="true"/>
    <jsp:include page="../include/businessUnitSelect01.jsp" flush="true"/>
</form>
</body>
</html>
<script>
    //用戶編碼自動校驗重複
    $(function () {
        $('#userCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#userCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysConfig/user/listByCode.action", {
                userCode: $("#userCode").val()
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'User Code already exist!', 'warning');
                    $("#userCode").textbox('setValue', "");
                }
            }, "json");
        });

        //设置只读
        $('#portalName').textbox('textbox').attr('disabled', true);
        $('#companyName').textbox('textbox').attr('disabled', true);
        $('#departmentName').textbox('textbox').attr('disabled', true);
        $('#businessName').textbox('textbox').attr('disabled', true);
        $('#busUnitName').textbox('textbox').attr('disabled', true);
    });

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
</script>