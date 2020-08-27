<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>CompanyList</title>
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
    <table class="tbl" style="width:auto;height:500px;">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="hidden" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="hidden" id="uuid"/></td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 250px">
                上级公司
            </td>
            <td class="tblCell" style="width: 700px">
                <span style="display:none"><input class="easyui-textbox" value="" id="parentUuid" name="parentUuid"
                                                  type="text"/></span>
                <input class="easyui-textbox" value="" id="parentName" name="parentName" type="text"
                       style="width:250px"
                       data-options="prompt: '如有上層集團請選擇..!',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               openCompanySelect('<%=basePath %>sysPopu/companyTree.action?uuid=parentUuid&name=parentName&type=1');
				}}]"/>&nbsp;(留空即表示层次最高)
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tblInfo">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info1.png"/>&nbsp;基础信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                公司编号
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="companyCode" type="text" id="companyCode"
                       style="width:250px"
                       data-options="prompt:'Enter company code.',required:true,validType:'length[3,10]'"/>
                &nbsp;(一经确定不能修改)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                公司名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="companyName" type="text" id="companyName"
                       style="width:350px"
                       data-options="prompt:'Enter company name.',required:true,validType:'length[4,50]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                公司地址
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="address" type="text" id="address"
                       style="width:350px"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                所在城市
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="city" type="text" id="city"
                       style="width:250px"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                所在國家
            </td>
            <td class="tblCell">
                <select class="easyui-combobox" name="country" id="country" style="width:250px;"
                        data-options="valueField: 'keyCode', textField: 'keyName',
                        url:'<%=basePath%>sysConfig/keyValue/listByDataType.action?typeCode=<%=ConfigConst.STR_SYS_KEY_VALUE_COUNTRY%>'">
                </select>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                默认語言
            </td>
            <td class="tblCell">
                <select class="easyui-combobox" name="language" id="language" style="width:250px;"
                        data-options="valueField: 'keyCode', textField: 'keyName',
                        url:'<%=basePath%>sysConfig/keyValue/listByDataType.action?typeCode=<%=ConfigConst.STR_SYS_KEY_VALUE_LANGUAGE%>'">
                </select>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                固定電話
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="telephone" type="text" id="telephone" style="width:250px"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                傳真號碼
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="faxNumber" type="text" id="faxNumber"
                       style="width:250px"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                電子郵箱
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="email" type="text" id="email"
                       data-options="prompt:'Enter a email address...',validType:'email'" style="width:250px"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                法定人員
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="supervisorName" type="text" id="supervisorName"
                       style="width:250px"
                       data-options="prompt: '法定人員..!',
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
                備註信息
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="comment" type="text" id="comment" style="width:350px"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tblInfo">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info2.png"/>&nbsp;控制信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                公司狀態
            </td>
            <td class="tblCell">
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
                啟用工廠
            </td>
            <td class="tblCell">
                <input id="factory" name="factory" class="easyui-switchbutton" onText="true" offText="false" checked>
                (默認公司下有工廠)
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                啟用貨倉
            </td>
            <td class="tblCell">
                <input id="warehouse" name="warehouse" class="easyui-switchbutton" onText="true" offText="false">
                (默認公司下無貨倉)
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
    <jsp:include page="../include/companySelect01.jsp" flush="true"/>
</form>
</body>
<script>
    //Default Execution or Setting
    $(function () {
        $('#parentName').textbox('textbox').attr('readonly', true);
        $('#companyCode').textbox('textbox').attr('maxlength', 10);
        $('#companyName').textbox('textbox').attr('maxlength', 50);
        $('#address').textbox('textbox').attr('maxlength', 150);
        $('#city').textbox('textbox').attr('maxlength', 50);
        $('#telephone').textbox('textbox').attr('maxlength', 20);
        $('#faxNumber').textbox('textbox').attr('maxlength', 20);
        $('#email').textbox('textbox').attr('maxlength', 20);
        $('#comment').textbox('textbox').attr('maxlength', 200);

        //Company Check
        $('#companyCode').textbox().textbox('addClearBtn', 'icon-cancel');
        $("input", $("#companyCode").next("span")).blur(function () {
            $.post("<%=basePath%>sysOrg/company/listByCode.action", {
                code: document.getElementById("companyCode").value
            }, function (result) {
                if (result.success) {
                    $.messager.alert('Error', 'Company Code already exist!', 'warning');
                    $("#companyCode").textbox('setValue', "");
                }
            }, "json");
        });
    });

    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        var url = "<%=basePath %>sysOrg/company/listByUuid.action?ws=" + webStatus + "&uuid=" + $("#uuid").val();
        $.ajax({
            async: true,
            type: 'get',
            url: url,
            dataType: 'json',
            success: function (data) {
                $('#companyCode').textbox('textbox').attr('readonly', true);
                $('#companyCode').textbox('textbox').attr('disabled', true);
                $("#parentUuid").textbox('setValue', data[0].parentUuid);
                if (data[0].parentUuid != '') {
                    $.ajax({
                        async: false,
                        type: 'get',
                        url: '<%=basePath%>sysOrg/company/listByUuid.action?uuid=' + data[0].parentUuid,
                        dataType: 'json',
                        success: function (company) {
                            if (company != null) {
                                $("#parentName").textbox('setValue', company[0].companyName);
                            }
                        }
                    });
                }
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#companyCode").textbox('setValue', data[0].companyCode);
                $("#companyName").textbox('setValue', data[0].companyName);
                $("#address").textbox('setValue', data[0].address);
                $("#city").textbox('setValue', data[0].city);
                $("#country").textbox('setValue', data[0].country);
                $("#language").textbox('setValue', data[0].language);
                $("#telephone").textbox('setValue', data[0].telephone);
                $("#faxNumber").textbox('setValue', data[0].faxNumber);
                $("#email").textbox('setValue', data[0].email);
                $("#supervisorCode").textbox('setValue', data[0].supervisorCode);
                $("#supervisorName").textbox('setValue', data[0].supervisorName);
                $("#comment").textbox('setValue', data[0].comment);
                if (data[0].factory == "true") {
                    $("[switchbuttonName='factory']").switchbutton("check");
                } else {
                    $("[switchbuttonName='factory']").switchbutton("uncheck");
                }
                if (data[0].warehouse == "true") {
                    $("[switchbuttonName='warehouse']").switchbutton("check");
                } else {
                    $("[switchbuttonName='warehouse']").switchbutton("uncheck");
                }
                $("#sort").textbox('setValue', data[0].sort);
            },
            error: function (data) {
                alert("【" + url + "】JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData() {
        //保存前檢查
        if ($("#companyCode").val() == "") {
            $.messager.alert('Field Required', 'Company code must be entered!');
            return false;
        }
        if ($("#companyName").val() == "") {
            $.messager.alert('Field Required', 'Company name must be entered!');
            return false;
        }
        //修改狀態下上級公司不能等於本公司
        if ($("#uuid").val() == $("#parentUuid").textbox('getValue')) {
            $.messager.alert('error', 'Parent company can not be same.', 'error');
            return false;
        }
        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid:$("#uuid").val(),
            parentUuid: $("#parentUuid").val(),
            companyCode: $("#companyCode").val(),
            companyName: $("#companyName").val(),
            address: $("#address").val(),
            city: $("#city").val(),
            country: $("#country").combobox("getValue"),
            language: $("#language").combobox("getValue"),
            telephone: $("#telephone").val(),
            faxNumber: $("#faxNumber").val(),
            email: $("#email").val(),
            supervisorCode: $("#supervisorCode").val(),
            supervisorName: $("#supervisorName").val(),
            comment: $("#comment").val(),
            factory: $("[switchbuttonName='factory']").switchbutton("options").checked,
            warehouse: $("[switchbuttonName='warehouse']").switchbutton("options").checked,
            status: $('input[name="status"]:checked').val(),
            sort: $("#sort").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysOrg/company/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#companyConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("error");
            },
        });
    }
</script>
