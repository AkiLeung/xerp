<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
    <table class="tbl" style="width:100%; height:150px">
        <tr style="display:none">
            <td class="tblTitle">
                uuid
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" name="uuid" type="text" id="uuid" style="width:350px"/></td>
        </tr>
        <tr>
            <td class="tblTitle" style="width:15%">
                系统名称：
            </td>
            <td class="tblCell" style="width:85%">
                <input class="easyui-textbox" name="sysName" type="text" id="sysName" style="width:350px"
                       data-options="
                       iconCls:'icon-xxx',
                       prompt:'Enter System Name',
                       required:true"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                经营宗旨：
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="sysMotto" type="text" id="sysMotto" style="width:350px"
                       data-options="iconCls:'icon-xxx',prompt:'Enter Company motto.',required:true,validType:'length[1,100]'"/>
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
    $.ajax({
        async: true,
        type: 'get',//get是获取数据，post是带数据的向服务器发送请求
        url: "<%=basePath %>sysConfig/sysInfo/listByDefault.action",
        dataType: 'json',
        success: function (data) {
            $("#uuid").textbox('setValue', data.uuid);
            $("#sysName").textbox('setValue', data.sysName);
            $("#sysMotto").textbox('setValue', data.sysMotto);
        },
        error: function (data) {
            alert("JSON数据获取失败，请联系管理员！");
        }
    });

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#sysName").val() == "") {
            $.messager.alert('Field Required', 'SysInfo Name must be entered!');
            return false;
        }
        if ($("#sysMotto").val() == "") {
            $.messager.alert('Field Required', 'Company Motto must be entered!');
            return false;
        }

        //執行保存
        $.post("<%=basePath %>sysConfig/sysInfo/saveData.action", $("#form1").serialize())
            .done(function (result) {
                if ("success" == result) {
                    $.messager.alert({
                        title:'提示信息' ,
                        msg:'数据保存成功！',
                        icon:'info',
                        fn:function(){
                            window.location.reload();
                        }
                    })
                }
            }).fail(function (result) {
            alert("添加时出现异常" + result.toLocaleString());
        });
    }
</script>