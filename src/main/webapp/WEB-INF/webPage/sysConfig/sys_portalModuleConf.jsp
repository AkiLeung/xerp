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
<table class="tbl" style="width:100%;height:250px;">
    <tr style="display:none">
        <td class="tblTitle">
            ws&uuid
        </td>
        <td class="tblCell">
            <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
            <input value="<%=request.getParameter("portalUuid")%>" name="portalUuid" type="hidden" id="portalUuid"/>
        </td>
    </tr>
    <tr>
        <td class="tblTitle" width="20%">
            模塊狀態
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
        <td colspan="2" class="tblInfo">
            &nbsp;<img alt="info" src="<%=basePath%>static/image/info1.png"/>&nbsp;基础信息
        </td>
    </tr>
    <tr>
        <td class="tblTitle">
            模塊编号
        </td>
        <td class="tblCell">
            <input class="easyui-textbox" value="" name="menuCode" type="text" id="menuCode"
                   style="width:250px"
                   data-options="prompt:'Enter module code.',required:true,validType:'length[3,10]'"/>
            &nbsp;(一经确定不能修改,eg:M00000000X)
        </td>
    </tr>
    <tr>
        <td class="tblTitle">
            模塊名称
        </td>
        <td class="tblCell">
            <input class="easyui-textbox" value="" name="menuName" type="text" id="menuName"
                   style="width:350px"
                   data-options="prompt:'Enter module name.',required:true,validType:'length[3,50]'"/></td>
    </tr>
    <tr>
        <td class="tblTitle">
            模塊圖標
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
    <tr>
        <td class="tblTitle">
            排序
        </td>
        <td class="tblCell">
            <input class="easyui-numberspinner" value="1" name="sort" id="sort"
                   data-options="increment:1,min:1,max:100,required:true" style="width:250px;"/>
        </td>
    </tr>
</table>
</body>
</html>
<script type="text/javascript">
    //Default Execution or Setting
    $(function () {
        $('#menu_code').textbox('textbox').attr('maxlength', 10);
        $('#menu_name').textbox('textbox').attr('maxlength', 50);

        //menu code Check
        $('#menu_code').textbox().textbox('addClearBtn', 'icon-cancel');
    });

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#menuCode").val() == "") {
            $.messager.alert('Field Required', 'Module code must be entered!');
            return false;
        }
        if ($("#menuName").val() == "") {
            $.messager.alert('Field Required', 'Module name must be entered!');
            return false;
        }
        //執行保存
        var objData = {
            ws: $("#ws").val(),
            parentUuid: "",
            portalUuid:$("#portalUuid").val(),
            menuUuid:"",
            status: $('input[name="status"]:checked').val(),
            menuType:"00",
            menuCode: $("#menuCode").val(),
            menuName: $("#menuName").val(),
            leftPath:"",
            mainPath:"",
            icon: $("#icon").val(),
            comment:$("#comment").val(),
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
            dataType: "json",
            success: function (data) {
                parent.ifrSysPortalMenuTree.window.location.reload();
                parent.$('#portalMenuConf').dialog('close');
            },
            error: function () {
            },
        });
    }
</script>
