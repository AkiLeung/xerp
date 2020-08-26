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
            <td class="tblTitle" style="width: 25%">
                模塊狀態
            </td>
            <td class="tblCell" style="width: 75%">
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
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info3.png"/>&nbsp;基础信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                模塊编号
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="moduleCode" type="text" id="moduleCode"
                       style="width:250px"
                       data-options="prompt:'Enter module code.',required:true,validType:'length[3,10]'"/>
                &nbsp;(一经确定不能修改,eg:  M00000X )
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                模塊名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="moduleName" type="text" id="moduleName"
                       style="width:350px"
                       data-options="prompt:'Enter module name.',required:true,validType:'length[3,50]'"/></td>
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
                排序</td>
            <td class="tblCell">
                <input class="easyui-numberspinner" value="1"  name="sort" id="sort"  data-options="increment:1,min:1,max:100,required:true" style="width:250px;" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    //Default Execution or Setting
    $(function () {
        $('#moduleCode').textbox('textbox').attr('maxlength', 10);
        $('#moduleName').textbox('textbox').attr('maxlength', 50);
        $('#comment').textbox('textbox').attr('maxlength', 150);

        //module_code Check
        $('#moduleCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#moduleCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysConfig/flowModule/listByCode.action", {
                code: $("#moduleCode").val()
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'Module Code already exist!', 'warning');
                    $("#moduleCode").textbox('setValue', "");
                }
            }, "json");
        });
    })


    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysConfig/flowModule/listByUuid.action?ws=" + webStatus + "&uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $('#moduleCode').textbox('textbox').attr('readonly', true);
                $('#moduleCode').textbox('textbox').attr('disabled', true);
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#moduleCode").textbox('setValue', data[0].moduleCode);
                $("#moduleName").textbox('setValue', data[0].moduleName);
                $("#comment").textbox('setValue', data[0].comment);
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
        if ($("#moduleCode").val() == "") {
            $.messager.alert('Field Required', 'Module code must be entered!');
            return false;
        }
        if ($("#moduleName").val() == "") {
            $.messager.alert('Field Required', 'Module name must be entered!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid:$("#uuid").val(),
            status: $('input[name="status"]:checked').val(),
            moduleCode: $("#moduleCode").val(),
            moduleName: $("#moduleName").val(),
            comment: $("#comment").val(),
            sort: $("#sort").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/flowModule/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#flowModuleConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>