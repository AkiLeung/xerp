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
                模塊狀態
            </td>
            <td class="tblCell" style="width: 75%">
                <label style="cursor: pointer"><input type="radio" name="status" value="01"
                                                      checked><%=ConfigConst.STR_STATUS_ACTIVE_TXT%>
                </label>
                <label style="cursor: pointer"><input type="radio" name="status"
                                                      value="99"><%=ConfigConst.STR_STATUS_DELETE_TXT%>
                </label>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                模塊编号
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="moduleCode" type="text" id="moduleCode"
                       style="width:250px"
                       data-options="prompt:'Enter module code.',required:true,validType:'length[3,20]'"/>
                &nbsp;(一经确定不能修改,eg:  NUM-00000X )
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
                增量类型
            </td>
            <td class="tblCell">
                <select class="easyui-combobox" name="incrementRange" id="incrementRange" style="width:250px;">
                    <option value="">&nbsp;</option>
                    <option value="YYYY">[YYYY]-Year</option>
                    <option value="YYYYMM">[YYYYMM]-Year+Month</option>
                    <option value="YYYYMMdd">[YYYYMMdd]-Year+Month+Day</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                默认长度</td>
            <td class="tblCell">
                <input class="easyui-numberspinner" value="3"  name="defaultLength" id="defaultLength"  data-options="increment:1,min:1,max:10,required:true" style="width:250px;" />
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                默认前缀</td>
            <td class="tblCell">
                <input class="easyui-textbox" value="ORD"  name="preNumWord" id="preNumWord" style="width:250px;" />
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
        //$('#comment').textbox('textbox').attr('maxlength', 150);

        //module_code Check
        $('#moduleCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#moduleCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysConfig/billNumber/listByCode.action", {
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
            url: "<%=basePath %>sysConfig/billNumber/listByUuid.action?ws=" + webStatus + "&uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $('#moduleCode').textbox('textbox').attr('readonly', true);
                $('#moduleCode').textbox('textbox').attr('disabled', true);
                $("#moduleCode").textbox('setValue', data[0].moduleCode);
                $("#moduleName").textbox('setValue', data[0].moduleName);
                $("#incrementRange").textbox('setValue', data[0].incrementRange);
                $("#defaultLength").textbox('setValue', data[0].defaultLength);
                $("#preNumWord").textbox('setValue', data[0].preNumWord);
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
            moduleCode: $("#moduleCode").val(),
            moduleName: $("#moduleName").val(),
            incrementRange: $("#incrementRange").val(),
            defaultLength: $("#defaultLength").val(),
            preNumWord: $("#preNumWord").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/billNumber/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#billNumberConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>