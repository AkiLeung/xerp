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
<body style="text-align:left;">
<form id="form1" action="" method="post">
    <table class="tbl" style="width:100%; height:200px" border="1">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid
            </td>
            <td class="tblCell">
                <input type="text" id="portalUuid" name="portalUuid"
                       value="<%=request.getParameter("portalUuid")%>"/><br>
                <input value="<%=request.getParameter("ws")%>" name="ws" type="text" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="parentUuid" type="text" id="parentUuid"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle" width="20%">
                菜單狀態
            </td>
            <td class="tblCell" width="80%">
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
            <td class="tblTitle">
                菜單编号
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="menuCode" type="text" id="menuCode"
                       style="width:200px"
                       data-options="prompt:'Enter menu code.',required:true,validType:'length[3,10]'"/>
                &nbsp;(一经确定不能修改)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                菜單名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="menuName" type="text" id="menuName"
                       style="width:300px"
                       data-options="prompt:'Enter menu name.',required:true,validType:'length[4,20]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                備註說明
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="comment" type="text" id="comment" style="width:400px"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                模塊圖標
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="icon" type="text" id="icon"
                       style="width:400px"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                導航路徑
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="leftPath" type="text" id="leftPath" style="width:400px"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                主 界 面
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="mainPath" type="text" id="mainPath" style="width:400px"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                排序
            </td>
            <td class="tblCell">
                <input class="easyui-numberspinner" value="1" name="sort" id="sort"
                       data-options="increment:1,min:0,max:100,required:true" style="width:100px;"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    //編碼自動校驗重複
    $(function () {
        $('#menuCode').textbox('textbox').attr('maxlength', 10);
        $('#menuName').textbox('textbox').attr('maxlength', 50);

        $('#menuCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#menuCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysConfig/menuOption/listByCode.action", {
                code: document.getElementById("menuCode").value
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'Menu Code already exist!', 'warning');
                    $("#menuCode").textbox('setValue', "");
                }
            }, "json");
        });
    })

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#menuCode").val() == "") {
            $.messager.alert('Field Required', 'Menu code must be entered!');
            return false;
        }
        if ($("#menuName").val() == "") {
            $.messager.alert('Field Required', 'Menu name must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            parentUuid: $("#parentUuid").val(),
            portalUuid: $("#portalUuid").val(),
            menuUuid: "",
            status: $('input[name="status"]:checked').val(),
            menuType: "01",
            menuCode: $("#menuCode").val(),
            menuName: $("#menuName").val(),
            leftPath: $("#leftPath").val(),
            mainPath: $("#mainPath").val(),
            icon: $("#icon").val(),
            comment: $("#comment").val(),
            sort: $("#sort").val()
        };

        var jsonData = JSON.stringify(objData);
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/portalMenu/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.ifrSysPortalMenuTree.window.location.reload();
                parent.$('#portalMenuConf').dialog('close');
            },
            error: function () {
            },
        });
    }
</script>