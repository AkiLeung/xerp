<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
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
    <table class="tbl" style="width:100%;height:auto;">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid
            </td>
            <td class="tblCell" colspan="7">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/></td>
        </tr>
        <tr>
            <td class="tblInfo" colspan="8">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info1.png"/>&nbsp;基础信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 8%">
                员工编号
            </td>
            <td class="tblCell" style="width: 17%">
                <input class="easyui-textbox" value="" name="personCode" type="text" id="personCode"
                       style="width:96%"
                       data-options="required:true,validType:'length[6,10]'"/>
            </td>
            <td class="tblTitle" style="width: 8%">
                姓名1
            </td>
            <td class="tblCell" style="width: 17%">
                <input class="easyui-textbox" value="" name="personName1" type="text" id="personName1"
                       style="width:98%"
                       data-options="required:true,validType:'length[3,10]'"/>
            </td>
            <td class="tblTitle" style="width: 8%">
                姓名2
            </td>
            <td class="tblCell" style="width: 17%">
                <input class="easyui-textbox" value="" name="personName2" type="text" id="personName2"
                       style="width:98%"
                       data-options="validType:'length[3,10]'"/>
            </td>
            <td class="tblTitle" style="width: 8%">
                姓名3
            </td>
            <td class="tblCell" style="width: 17%">
                <input class="easyui-textbox" value="" name="personName3" type="text" id="personName3"
                       style="width:98%"
                       data-options="validType:'length[3,10]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                性别
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="personCode" type="text" id="TEST1"
                       style="width:96%"
                       data-options="required:true,validType:'length[6,10]'"/>
            </td>
            <td class="tblTitle">
                出生
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="personName1" type="text" id="TEST2"
                       style="width:98%"
                       data-options="required:true,validType:'length[3,10]'"/>
            </td>
            <td class="tblTitle">
                证件类型
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="personName2" type="text" id="TEST3"
                       style="width:98%"
                       data-options="validType:'length[3,10]'"/>
            </td>
            <td class="tblTitle">
                证件号码
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="personName3" type="text" id="TEST4"
                       style="width:98%"
                       data-options="validType:'length[3,10]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                国家
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="personCode" type="text" id="TEST5"
                       style="width:96%"
                       data-options="required:true,validType:'length[6,10]'"/>
            </td>
            <td class="tblTitle">
                地区/省份
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="personName1" type="text" id="TEST6"
                       style="width:98%"
                       data-options="required:true,validType:'length[3,10]'"/>
            </td>
            <td class="tblTitle">
                城市
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="personName2" type="text" id="TEST7"
                       style="width:98%"
                       data-options="validType:'length[3,10]'"/>
            </td>
            <td class="tblTitle">
                地址
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="personName3" type="text" id="TEST8"
                       style="width:98%"
                       data-options="validType:'length[3,10]'"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                備註信息
            </td>
            <td class="tblCell" colspan="7" >
                <input class="easyui-textbox" value="" name="comment" type="text" id="comment"
                       style="width:99.7%"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
