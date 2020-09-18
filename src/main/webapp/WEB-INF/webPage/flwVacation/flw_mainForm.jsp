<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <jsp:include page="../include/common.jsp" flush="true"/>
</head>
<body>
<div id="winWorkFlow" class="easyui-window" title="Show Work Flow" style="width:1400px;height:700px;padding:1px;"
     data-options="
         modal:true,
         minimizable: false,
         maximizable: false,
         resizable: false,
         closed:true,
         iconCls:'icon-flow',cls:'c8'">
    <iframe id="ifrWorkFlow" name="ifrWorkFlow" src="" width="100%" height="100%" frameborder="0"></iframe>
</div>
<table class="tbl" style="width:100%;height:50px;">
    <tr style="display: none">
        <td class="tblCell" style="width: 100%" colspan="2">
            docUuid:<input value="${docUuid}" type="Text" name="uuid" id="uuid"/><br/>
            flowModule:<input value="vacation" type="Text" name="flowModule" id="flowModule"/><br/>
        </td>
    </tr>
    <tr>
        <td bgColor="#0a589a" style="color: #000000;height:2px" colspan="2"></td>
    </tr>
    <tr>
        <td class="tblTitle" style="width: 10%">
            <img src="<%=basePath%>static/image/flow.png"/>
            <a id="flowInfo" onclick="showFlowGraph()" href="javascript:void(0)"></a>
        </td>
        <td class="tblCell" style="width: 90%">
            <jsp:include page="../include/flowProcessShow.jsp" flush="true"/>
        </td>
    </tr>
</table>
<table class="tbl" style="width:100%;height:200px;">
    <tr>
        <td class="tblCell" style="width: 100%;height: 60px;text-align: center" colspan="2">
            XXXXXX申请
        </td>
    </tr>
    <tr>
        <td class="tblTitle" style="width: 10%">
            备注
        </td>
        <td class="tblCell" style="width: 90%">
            <input class="easyui-textbox" data-options="multiline:true" value="" name="message" type="text" id="message"
                   style="width:80%;height: 99%"/>
        </td>
    </tr>
    <tr>
        <td class="tblTitle" style="width: 100%;height: 45px;" colspan="2">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:100px"
               onclick="documentSave();">保存</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" style="width:100px"
               onclick="openFlowToNext();">提交</a>
        </td>
    </tr>
</table>
<jsp:include page="../include/flowToNextNode.jsp" flush="true"/>
</body>
</html>
<script type="text/javascript">
    //頁面加載時執行
    $.ajax({
        async: true,
        type: "get",//get是获取数据，post是带数据的向服务器发送请求
        url: "<%=basePath %>vacation/getDataByUuid.action?uuid=${docUuid}",
        dataType: 'json',
        success: function (data) {
            //内容
            $("#message").textbox('setValue', data[0].message);
        },
        error: function (data) {
            alert("JSON数据获取失败，请联系管理员！");
        }
    });

    //保存文档
    function documentSave() {

    }
    //提交文档
    function documentFlowToNext() {
        //執行保存
        var objData = {
            uuid:$("#uuid").val(),
            message: $("#message").val(),
            flowNodeUuid: $("#targetNodeUuid").val(),
            flowNodeType: $("#targetNodeType").val(),
            flowNodeCode: $("#targetNodeCode").val(),
            flowNodeName: $("#targetNodeName").val(),
            curHandlerNum: $("#targetHandlerNum").val(),
            curHandlerNam: $("#targetHandlerNam").val()
        };
        var jsonData = JSON.stringify(objData);
        //执行保存
        $.ajax({
            type: "POST",
            url: "<%=basePath %>vacation/submitFlowData.action",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            async: false,
            data: jsonData,
            success: function (data) {
                alert("Save Document");
                window.location.href = '<%=basePath %>vacation/toHandleList.action';
            },
            error: function (data) {
                alert("添加时出现异常");
            },
        });
    }
</script>