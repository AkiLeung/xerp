<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="com.xerp.common.consts.ConfigConst" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
                ws&uuid</td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="text" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="text" id="uuid"/>
                <input class="easyui-textbox" name="parentUuid" type="text" id="parentUuid"/></td>
        </tr>
        <tr>
            <td class="tblTitle" width="20%">
                库位狀態</td>
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
                库位编号</td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="locationCode" type="text" id="locationCode" style="width:250px"
                       data-options="prompt:'Enter location code.',required:true,validType:'length[4,10]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                库位名称</td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="locationName" type="text" id="locationName" style="width:250px"
                       data-options="prompt:'Enter location name.',required:true,validType:'length[3,50]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                备注</td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="comment" type="text" id="comment" style="width:450px"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                排序</td>
            <td class="tblCell">
                <input class="easyui-numberspinner" value="1"  name="sort" id="sort"  data-options="increment:1,min:0,max:100,required:true" style="width:100px;" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: "get",//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysOrg/location/listByUuid.action?uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("#parentUuid").textbox('setValue', data[0].factoryUuid);
                $("input[name='status'][value ='" + data[0].status + "']").attr("checked", "checked").parent().addClass('checked');
                $("#locationCode").textbox('setValue', data[0].locationCode);
                $('#locationCode').textbox('textbox').attr('readonly',true);
                $('#locationCode').textbox('textbox').attr('disabled',true);
                $("#locationName").textbox('setValue', data[0].locationName);
                $("#comment").textbox('setValue', data[0].comment);
                $("#sort").textbox('setValue', data[0].sort);
            },error: function (data) {
                alert("JSON数据获取失败，请联系管理员！");
            }
        });
    }

    //保存提交時執行
    function saveData(){
        //保存前檢查
        if($("#locationCode").val() == "") {
            $.messager.alert('Field Required','Location code must be entered!');
            return false;
        }
        if($("#locationName").val() == "") {
            $.messager.alert('Field Required','Location name must be entered!');
            return false;
        }
        //執行保存
        var objData = {
            ws:$("#ws").val(),
            uuid:$("#uuid").val(),
            parentUuid:$("#parentUuid").val(),
            status:$('input[name="status"]:checked').val(),
            locationCode: $("#locationCode").val(),
            locationName: $("#locationName").val(),
            comment: $("#comment").val(),
            sort: $("#sort").val()
        };
        var jsonData = JSON.stringify(objData);
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysOrg/location/saveData.action",
            dataType:"json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function(data) {
                parent.ifrSysLocationTree.window.location.reload();
                parent.$('#locationConf').dialog('close');
            },
            error:function(){},
        });
    }
</script>