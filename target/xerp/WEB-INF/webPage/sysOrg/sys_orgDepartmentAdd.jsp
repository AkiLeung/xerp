<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Department Config</title>
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
                <input value="<%=request.getParameter("ws")%>" name="ws" type="text" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="parentUuid" type="text" id="parentUuid"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle" width="20%">
                部門狀態
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
                部門编号
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="departmentCode" type="text" id="departmentCode"
                       style="width:250px"
                       data-options="prompt:'Enter department code.',required:true,validType:'length[3,20]'"/>
                &nbsp;(一经确定不能修改)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                部門名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="departmentName" type="text" id="departmentName"
                       style="width:350px"
                       data-options="prompt:'Enter department name.',required:true,validType:'length[3,50]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                負責人員
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="supervisorName" type="text" id="supervisorName"
                       style="width:250px"
                       data-options="prompt: '部門負責人..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                                var v = $(e.data.target).textbox('getValue');
                                alert('The inputed value is ' + (v ? v : 'empty'));
				}}]"/>
                <span style="display:none"><input class="easyui-textbox" value="" name="supervisorCode" type="text"
                                                  id="supervisorCode" style="width:250px;"/></span></td>
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
    //Default Execution or Setting
    $(function () {
        $('#departmentCode').textbox('textbox').attr('maxlength', 10);
        $('#departmentName').textbox('textbox').attr('maxlength', 50);

        //Department Check
        $('#departmentCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#departmentCode").next("span")).blur(function () {
            if ($("#departmentCode").val() != "") {
                $.post("<%=basePath%>sysOrg/department/listByCode.action", {
                    code: $("#departmentCode").val(),
                }, function (result) {
                    if (result.success) {
                        $.messager.alert('Error', 'Department Code already exist!', 'error');
                        $("#departmentCode").textbox('setValue', "");
                    }
                }, "json");
            }
        });
    });

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#departmentCode").val() == "") {
            $.messager.alert('Field Required', 'Department code must be entered!');
            return false;
        }
        if ($("#departmentName").val() == "") {
            $.messager.alert('Field Required', 'Department name must be entered!');
            return false;
        }
        //執行保存
        var objData = {
            ws: $("#ws").val(),
            parentUuid: $("#parentUuid").val(),
            status: $('input[name="status"]:checked').val(),
            departmentCode: $("#departmentCode").val(),
            departmentName: $("#departmentName").val(),
            supervisorCode: $("#supervisorCode").val(),
            supervisorName: $("#supervisorName").val(),
            sort: $("#sort").val()
        };
        var jsonData = JSON.stringify(objData);
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysOrg/department/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.ifrSysDepartTree.window.location.reload();
                parent.$('#departmentConf').dialog('close');
            },
            error: function () {
            },
        });
    }
</script>