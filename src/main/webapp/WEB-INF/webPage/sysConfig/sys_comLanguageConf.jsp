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
            <td colspan="2" class="tblInfo">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info3.png"/>&nbsp;基础信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 25%">
                类型
            </td>
            <td class="tblCell" style="width: 75%">
                <label style="cursor: pointer"><input type="radio" name="type" value="sys" checked>系统</label>
                <label style="cursor: pointer"><input type="radio" name="type" value="user">用户</label>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                用户编号
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="userCode" type="text" id="userCode"
                       style="width:250px"
                       data-options="prompt:'Enter module code.',required:true,validType:'length[1,20]'"/>
                (系统共用，填写：*)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                语言内容
            </td>
            <td class="tblCell" style="height: 240px">
                <input class="easyui-textbox" data-options="multiline:true,validType:'length[0,250]'" value=""
                       name="opinions" type="text"
                       id="opinions" style="width:100%;height: 99%"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                排序
            </td>
            <td class="tblCell">
                <input class="easyui-numberspinner" value="1" name="sort" id="sort"
                       data-options="increment:1,min:0,max:100,required:true" style="width:250px;"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysConfig/comLanguage/listByUuid.action?ws=" + webStatus + "&uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("input[name='status'][value ='" + data[0].type + "']").attr("checked", "checked").parent().addClass('checked');
                $("#userCode").textbox('setValue', data[0].userCode);
                $("#opinions").textbox('setValue', data[0].opinions);
                $("#sort").textbox('setValue', data[0].sort);
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
            $.messager.alert('Field Required', 'User code must be entered!');
            return false;
        }
        if ($("#opinions").val() == "") {
            $.messager.alert('Field Required', 'Opinions must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid: $("#uuid").val(),
            type: $('input[name="type"]:checked').val(),
            userCode: $("#userCode").val(),
            opinions: $("#opinions").val(),
            sort: $("#sort").val(),
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/comLanguage/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#comLanguageConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>