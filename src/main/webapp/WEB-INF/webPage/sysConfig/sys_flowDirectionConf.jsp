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
    <table class="tbl" style="width:100%;height:auto;">
        <tr style="display:none">
            <td class="tblTitle">
                ws&uuid&flowUuid&nodeUuid
            </td>
            <td class="tblCell">
                <input value="<%=request.getParameter("ws")%>" name="ws" type="text" id="ws"/>
                <input value="<%=request.getParameter("uuid")%>" name="uuid" type="text" id="uuid"/>
                <input class="easyui-textbox" value="<%=request.getParameter("flowUuid")%>" name="flowUuid"
                       type="text" id="flowUuid"/>
                <input class="easyui-textbox" value="<%=request.getParameter("nodeUuid")%>" name="nodeUuid"
                       type="text" id="nodeUuid"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 25%">
                流程-環節
            </td>
            <td class="tblCell" style="width: 75%">
                &nbsp;<span style="color: black;font-size: 14px;font-weight: bold" id="flowName" name="flowName"></span> -
                &nbsp;<span style="color: black;font-size: 14px;font-weight: bold" id="nodeName" name="nodeName"></span>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tblInfo" style="width:100%">
                &nbsp;<img alt="info" src="<%=basePath%>static/image/info1.png"/>&nbsp;基础信息
            </td>
        </tr>
        <tr>
            <td class="tblTitle" style="width: 250px">
                流向编号
            </td>
            <td class="tblCell" style="width: 750px">
                <input class="easyui-numberspinner" value="1" name="directionCode" id="directionCode"
                       data-options="increment:1,min:0,max:99,required:true" style="width:250px;"/>
            </td>
        </tr>
        <tr>
            <td class="tblTitle">
                流向名称
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="directionName" type="text" id="directionName"
                       style="width:350px"
                       data-options="prompt:'Enter Direction name.',required:true,validType:'length[2,50]'"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                目標環節
            </td>
            <td class="tblCell">
                <span style="display: none"><input class="easyui-textbox" name="directionType" id="directionType" style="width:50px;"/></span>
                <span style="display: none"><input class="easyui-textbox" name="targetNodeUuid" id="targetNodeUuid" style="width:50px;"/></span>
                <input class="easyui-textbox" value="" name="targetNodeName" type="text" id="targetNodeName"
                       style="width:350px"
                       data-options="required:true,validType:'length[1,50]',
                        prompt:'Target Flow Node...',
                        iconWidth: 22,
                        icons: [{
                            iconCls:'icon-search',
                            handler: function(e){
                               //Execution
                               var flowUuid = $('#flowUuid').val();
                               var urlPath = '<%=basePath %>sysPopu/flowNodeTree.action';
                               urlPath = urlPath + '?uuid=targetNodeUuid&name=targetNodeName&flowUuid='+flowUuid+'&type=1'
                               openFlowNodeSelect(urlPath);
				            }}]"/></td>
        </tr>
        <tr>
            <td class="tblTitle">
                備註信息
            </td>
            <td class="tblCell">
                <input class="easyui-textbox" value="" name="comment" type="text" id="comment" style="width:350px"/>
            </td>
        </tr>
        <tr style="display:none">
            <td class="tblTitle">
                GooFlow參數
            </td>
            <td class="tblCell">
                gooflowType：<input class="easyui-textbox" value="sl" name="gooflowType" type="text" id="gooflowType" style="width:50px"/><br>
                gooflowM：<input class="easyui-textbox" value="" name="gooflowM" type="text" id="gooflowM" style="width:50px"/><br>
                gooflowAlt：<input class="easyui-textbox" value="true" name="gooflowAlt" type="text" id="gooflowAlt" style="width:50px"/><br>
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
    <jsp:include page="../include/flowNodeSelect01.jsp" flush="true"/>
</form>
</body>
</html>
<script>
    //Default Execution or Setting
    $(function () {
        $('#directionCode').textbox('textbox').attr('maxlength', 20);
        $('#directionName').textbox('textbox').attr('maxlength', 50);
        $('#comment').textbox('textbox').attr('maxlength', 150);
        $('#targetNodeName').textbox('textbox').attr('readonly',true);

        //顯示當前編輯的流程
        if ($("#flowUuid").val() != "") {
            $.ajax({
                async: false,
                type: 'get',
                url: '<%=basePath%>sysConfig/flowName/listByUuid.action?uuid=' + $("#flowUuid").val(),
                dataType: 'json',
                success: function (data) {
                    if (data != null) {
                        $("#flowName").text(data[0].flowName);
                    }
                }
            });
        };

        //顯示當前編輯的節點
        if ($("#nodeUuid").val() != "") {
            $.ajax({
                async: false,
                type: 'get',
                url: '<%=basePath%>sysConfig/flowNode/listByUuid.action?uuid=' + $("#nodeUuid").val(),
                dataType: 'json',
                success: function (data) {
                    if (data != null) {
                        $("#nodeName").text("【" + data[0].nodeName + "】");
                    }
                }
            });
        };
    });

    //頁面加載時執行
    var webStatus = "<%=ConfigConst.STR_WS_UPDATE%>";
    if ($("#ws").val() == webStatus) {
        $.ajax({
            async: true,
            type: 'get',//get是获取数据，post是带数据的向服务器发送请求
            url: "<%=basePath %>sysConfig/flowDirection/listByUuid.action?uuid=" + $("#uuid").val(),
            dataType: 'json',
            success: function (data) {
                $("#flowUuid").textbox('setValue', data[0].flowUuid);
                $("#nodeUuid").textbox('setValue', data[0].nodeUuid);
                $("#directionType").textbox('setValue', data[0].directionType);
                $("#directionCode").textbox('setValue', data[0].directionCode);
                $("#directionName").textbox('setValue', data[0].directionName);
                $("#targetNodeUuid").textbox('setValue', data[0].targetNodeUuid);
                $("#targetNodeName").textbox('setValue', data[0].targetNodeName);
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
        if ($("#directionCode").val() == "") {
            $.messager.alert('Field Required', 'Direction code must be entered!');
            return false;
        }
        if ($("#directionName").val() == "") {
            $.messager.alert('Field Required', 'Direction name must be entered!');
            return false;
        }
        if ($("#targetNodeName").val() == "") {
            $.messager.alert('Field Required', 'Target node must be entered!');
            return false;
        }

        //保存前執行，判斷目標環節和當前環節 關係：向前提交 還是 向後提交
        var cur_number = "0",tag_number = "0";
        $.ajax({
            async: false,
            type: 'get',
            url: "<%=basePath %>sysConfig/flowNode/listByUuid.action?uuid=" + $("#nodeUuid").val(),
            dataType: 'json',
            success: function (data) {
                cur_number = data[0].nodeCode;
            }
        });
        $.ajax({
            async: false,
            type: 'get',
            url: "<%=basePath %>sysConfig/flowNode/listByUuid.action?uuid=" + $("#targetNodeUuid").val(),
            dataType: 'json',
            success: function (data) {
                tag_number = data[0].nodeCode;
            }
        });

        //向前提交
        if(parseInt(tag_number)>parseInt(cur_number)){
            $("#directionType").textbox('setValue', "<%=ConfigConst.STR_FLOW_DIRECTION_SEND_NUM%>");
        }else if(parseInt(tag_number)<parseInt(cur_number)){
            $("#directionType").textbox('setValue', "<%=ConfigConst.STR_FLOW_DIRECTION_BACK_NUM%>");
        }else{
            $.messager.alert('Field Required', 'Target node can not be current node!');
            return false;
        }

        //執行保存
        var objData = {
            ws: $("#ws").val(),
            uuid:$("#uuid").val(),
            flowUuid: $("#flowUuid").val(),
            nodeUuid: $("#nodeUuid").val(),
            directionType: $("#directionType").val(),
            directionCode: $("#directionCode").val(),
            directionName: $("#directionName").val(),
            targetNodeUuid: $("#targetNodeUuid").val(),
            targetNodeName: $("#targetNodeName").val(),
            gooflowType: $("#gooflowType").val(),
            gooflowM: $("#gooflowM").val(),
            gooflowAlt: $("#gooflowAlt").val(),
            comment: $("#comment").val(),
            sort: $("#sort").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>sysConfig/flowDirection/saveData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                parent.$('#flowDirectionConfig').dialog('close');
                parent.$('#dataList').datagrid('reload');
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }

</script>