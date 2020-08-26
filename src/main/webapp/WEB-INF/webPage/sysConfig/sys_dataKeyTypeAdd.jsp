<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Data Key Value Type Config</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body style="text-align:left;">
<form id="form1" action="" method="post">
    <table class="tbl" style="width:100%; height:150px" border="1">
        <tr style="display:none">
            <td class="tblTitle">
                ws
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="text" id="ws"/>
        </tr>
        <tr>
            <td class="tblTitle" width="20%">
                數據狀態
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
                類別編碼
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="typeCode" type="text" id="typeCode"
                       style="width:250px"
                       data-options="prompt:'Enter Type code.',required:true,validType:'length[3,10]'"/>
                &nbsp;(一经确定不能修改)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                類別描述
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="typeName" type="text" id="typeName"
                       style="width:350px"
                       data-options="prompt:'Enter Type name.',required:true,validType:'length[3,50]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                排序
            </td>
            <td class="tblCell">
                <input class="easyui-numberspinner" value="1" name="sort" id="sort"
                       data-options="increment:1,min:1,max:100,required:true" style="width:100px;"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    //Default Execution or Setting
    $(function () {
        $('#typeCode').textbox('textbox').attr('maxlength', 10);
        $('#typeName').textbox('textbox').attr('maxlength', 50);

        //Code Check
        $('#typeCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#typeCode").next("span")).blur(function () {
            if ($("#typeCode").val() != "") {
                $.post("<%=basePath%>sysConfig/dataType/listByTypeCode.action", {
                    code: $("#typeCode").val(),
                }, function (result) {
                    if (result.success) {
                        $.messager.alert('Error', 'Type Code already exist!', 'error');
                        $("#typeCode").textbox('setValue', "");
                    }
                }, "json");
            }
        });
    });

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#typeCode").val() == "") {
            $.messager.alert('Field Required', 'Type code must be entered!');
            return false;
        }
        if ($("#typeName").val() == "") {
            $.messager.alert('Field Required', 'Type name must be entered!');
            return false;
        }
        //執行保存
        var objData = {
            ws: $("#ws").val(),
            typeCode: $("#typeCode").val(),
            typeName: $("#typeName").val(),
            status: $('input[name="status"]:checked').val(),
            sort: $("#sort").val()
        };
        var jsonData = JSON.stringify(objData);
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/dataType/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            dataType: "json",
            success: function (data) {
                parent.ifrSysDataKeyValueTree.window.location.reload();
                parent.$('#dataKeyValueConf').dialog('close');
            },
            error: function () {
            },
        });
    }
</script>