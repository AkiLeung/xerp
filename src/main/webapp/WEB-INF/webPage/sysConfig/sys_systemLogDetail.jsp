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
    <table class="tbl" style="width:100%; height:300px">
        <tr style="display:none">
            <td class="tblTitle">
                logId
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("logId")%>" name="logId" type="Text" id="logId"/></td>
        </tr>
        <tr>
            <td class="tblTitle" style="width:10%">
                用戶編號
            </td>
            <td class="tblCell" style="width:90%">
                <input class="easyui-textbox" name="logFile" type="text" id="logFile" style="width:99%"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                文件名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="logClass" type="text" id="logClass" style="width:99%"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                方法名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="logMethod" type="text" id="logMethod" style="width:99%"/>
        </tr>
        <tr>
            <td class="tblTitle">
                文件行数
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="logLine" type="text" id="logLine" style="width:99%"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                线程名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="logThread" type="text" id="logThread" style="width:99%"/>
        </tr>
        <tr>
            <td class="tblTitle">
                日志等级
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="logLevel" type="text" id="logLevel" style="width:99%"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                发生时间
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="createdDatetime" type="text" id="createdDatetime" style="width:99%"/>
            </td>
        </tr>
        <tr style="height: 350px">
            <td class="tblTitle">
                详细信息
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="logMessage" type="text" id="logMessage" style="width:99%;height: 350px" data-options="multiline:true"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    //頁面加載時執行
    if ($("#logId").val() != "") {
        $.ajax({
            async: true,
            type: 'get',//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysConfig/sysLog/getByLogId.action?logId=" + $("#logId").val(),
            dataType: 'json',
            success: function (data) {
                $('#logFile').textbox('textbox').attr('readonly', true);
                $("#logFile").textbox('setValue', data.logFile);

                $('#logClass').textbox('textbox').attr('readonly', true);
                $("#logClass").textbox('setValue', data.logClass);

                $('#logMethod').textbox('textbox').attr('readonly', true);
                $("#logMethod").textbox('setValue', data.logMethod);

                $('#logLine').textbox('textbox').attr('readonly', true);
                $("#logLine").textbox('setValue', data.logLine);

                $('#logThread').textbox('textbox').attr('readonly', true);
                $("#logThread").textbox('setValue', data.logThread);

                $('#logLevel').textbox('textbox').attr('readonly', true);
                $("#logLevel").textbox('setValue', data.logLevel);

                $('#logMessage').textbox('textbox').attr('readonly', true);
                $("#logMessage").textbox('setValue', data.logMessage);

                $('#createdDatetime').textbox('textbox').attr('readonly', true);
                $("#createdDatetime").textbox('setValue', data.createdDatetime);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }
</script>