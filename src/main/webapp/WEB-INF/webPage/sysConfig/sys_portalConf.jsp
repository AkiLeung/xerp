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
    <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td bgColor="#0a589a" style="color: #000000;height:2px"></td>
        </tr>
        <tr>
            <td style="height:1px"></td>
        </tr>
    </table>
    <table class="tbl" style="width:100%;height:250px;">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/></td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 200px">
                門戶狀態
            </td>
            <td class="tblCell"  style="width: 700px">
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
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info(0).png"/>&nbsp;基础信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                門戶編碼
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="portalCode" type="text" id="portalCode"
                       style="width:250px"
                       data-options="prompt:'Enter portal code.',required:true,validType:'length[3,10]'"/>
                &nbsp;(一经确定不能修改 eg:SYS-0000X)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                門戶名稱
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="portalName" type="text" id="portalName"
                       style="width:350px"
                       data-options="prompt:'Enter portal name.',required:true,validType:'length[4,50]'"/></td>
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
</form>
</body>
</html>
<script>
    //Default Execution or Setting
    $(function () {
        $('#portalCode').textbox('textbox').attr('maxlength', 10);
        $('#portalName').textbox('textbox').attr('maxlength', 50);
        $('#comment').textbox('textbox').attr('maxlength', 200);

        //Code Check
        $('#portalCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#portalCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysConfig/portal/listByCode.action", {
                code: document.getElementById("portalCode").value
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'Portal Code already exist!', 'warning');
                    $("#portalCode").textbox('setValue', "");
                }
            }, "json");
        });
    })


    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',
            url: "<%=basePath %>sysConfig/portal/listByUuid.action?uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $('#portalCode').textbox('textbox').attr('readonly', true);
                $('#portalCode').textbox('textbox').attr('disabled', true);
                $("input[name='status'][value ='" + data.status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#portalCode").textbox('setValue', data.portalCode);
                $("#portalName").textbox('setValue', data.portalName);
                $("#comment").textbox('setValue', data.comment);
                $("#sort").textbox('setValue', data.sort);
            },
            error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#portalCode").val() == "") {
            $.messager.alert('Field Required', 'Portal code must be entered!');
            return false;
        }
        if ($("#portalName").val() == "") {
            $.messager.alert('Field Required', 'Portal name must be entered!');
            return false;
        }

        //執行保存
        $.post("<%=basePath %>/sysConfig/portal/saveData.action", $("#form1").serialize())
            .done(function (result) {
                if ("success" == result) {}
            }).fail(function (result) {
            alert("添加时出现异常" + result.toLocaleString());
        });
    }
</script>