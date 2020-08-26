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
            <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/>
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
            菜單编号
        </td>
        <td class="tblCell">
            <input class="easyui-textbox" value="" name="menuCode" type="text" id="menuCode"
                   style="width:250px"
                   data-options="prompt:'Enter module code.',required:true,validType:'length[3,10]'"/>
        </td>
    </tr>
    <tr>
        <td class="tblTitle">
            菜單名称
        </td>
        <td class="tblCell">
            <input class="easyui-textbox" value="" name="menuName" type="text" id="menuName"
                   style="width:400px"
                   data-options="prompt:'Enter module name.',required:true,validType:'length[3,50]'"/></td>
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
            模塊圖標
        </td>
        <td class="tblCell">
            <input class="easyui-textbox" value="" name="icon" type="text" id="icon"
                   style="width:400px"/></td>
    </tr>
    <tr>
        <td class="tblTitle">
            備註信息
        </td>
        <td class="tblCell">
            <input class="easyui-textbox" value="" name="comment" type="text" id="comment" style="width:400px"/>
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
        $('#menuCode').textbox('textbox').attr('maxlength', 10);
        $('#menuName').textbox('textbox').attr('maxlength', 50);

        //頁面加載時執行
        var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
        if ($("#ws").val() == webStatus) {
            $.ajax({
                async: true,
                type: "get",
                url: "<%=basePath %>sysConfig/portalMenu/listByUuid.action?uuid=" + $("#uuid").val(),
                dataType: 'json',
                success: function (data) {
                    $("input[name='status'][value ='" + data.status + "']").attr("checked", "checked").parent().addClass('checked');
                    $("#menuCode").textbox('setValue', data.menuCode);
                    $('#menuCode').textbox('textbox').attr('readonly', true);
                    $('#menuCode').textbox('textbox').attr('disabled', true);
                    $("#menuName").textbox('setValue', data.menuName);
                    $("#leftPath").textbox('setValue', data.leftPath);
                    $("#mainPath").textbox('setValue', data.mainPath);
                    $("#icon").textbox('setValue', data.icon);
                    $("#comment").textbox('setValue', data.comment);
                    $("#sort").textbox('setValue', data.sort);
                }, error: function (data) {
                    alert("JSON数据获取失败，请联系管理员！");
                }
            });
        }
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
            uuid:$("#uuid").val(),
            status: $('input[name="status"]:checked').val(),
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

