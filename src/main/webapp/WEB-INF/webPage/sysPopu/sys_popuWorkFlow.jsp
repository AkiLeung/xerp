<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html xmlns:v="urn:schemas-microsoft-com:vml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <jsp:include page="../include/common.jsp" flush="true"/>
    <!--[if lt IE 9]>
    <?import namespace="v" implementation="#default#VML" ?>
    <![endif]-->
    <script type="text/javascript" src="<%=basePath%>static/gooflow/plugin/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/gooflow/codebase/GooFunc.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/gooflow/plugin/json2.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/gooflow/codebase/GooFlow.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/gooflow/codebase/GooFlow.color.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/gooflow/plugin/promise.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/gooflow/plugin/html2canvas.min.js"></script>
    <!--[if lte IE 11]-->
    <script type="text/javascript" src="<%=basePath%>static/gooflow/plugin/canvg.js"></script>
    <!--[endif]-->
    <script type="text/javascript" src="<%=basePath%>static/gooflow/codebase/GooFlow.export.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>static/gooflow/codebase/GooFlow.css"/>
    <script type="text/javascript">
        var jsonData = [];
        //加載流程數據
        $(function () {
            var flowUuid = "<%=request.getParameter("flowUuid")%>";
            //Step1:獲取流程名稱
            var flowName = "";
            var flowVersion = "";
            $.ajax({
                async: false,
                type: 'get',
                url: '<%=basePath%>sysConfig/flowName/listByUuid.action?uuid=' + flowUuid,
                dataType: 'json',
                success: function (data) {
                    if (data != null) {
                        flowName = data[0].flowName;
                        flowVersion = data[0].flowVersion
                    }
                }
            });

            //Step2:獲取環節名稱
            var nodesData = "";
            var node = {};
            $.ajax({
                async: false,
                type: 'get',
                url: '<%=basePath%>sysConfig/flowNode/listData.action?flowUuid=' + flowUuid,
                dataType: 'json',
                success: function (data) {
                    if (data != null) {
                        nodesData = "{";
                        for (var i = 0; i < data.rows.length; i++) {
                            node = {
                                "name": data.rows[i].nodeName,
                                "left": parseInt(data.rows[i].gooflowLeft),
                                "top": parseInt(data.rows[i].gooflowTop),
                                "type": data.rows[i].gooflowType,
                                "width": parseInt(data.rows[i].gooflowWidth),
                                "height": parseInt(data.rows[i].gooflowHeight),
                                "alt": data.rows[i].gooflowAlt,
                            };
                            nodesData = nodesData + '"' + data.rows[i].uuid + '":' + JSON.stringify(node);
                            if (i < (data.rows.length - 1)) {
                                nodesData = nodesData + ',';
                            }
                        }
                        nodesData = nodesData + "}";
                    }
                }
            });

            //Step3:獲取線條 即 流向
            var linesData = "";
            var line = {};
            $.ajax({
                async: false,
                type: 'get',
                url: '<%=basePath%>sysConfig/flowDirection/listByFlowUuid.action?flowUuid=' + flowUuid,
                dataType: 'json',
                success: function (data) {
                    if (data != null) {
                        linesData = "{";
                        for (var i = 0; i < data.rows.length; i++) {
                            line = {
                                "type": data.rows[i].gooflowType,
                                "from": data.rows[i].nodeUuid,
                                "to": data.rows[i].targetNodeUuid,
                                "name": data.rows[i].directionName,
                                "M": parseFloat(data.rows[i].gooflowM),
                                "alt": data.rows[i].gooflowAlt,
                            };
                            linesData = linesData + '"' + data.rows[i].uuid + '":' + JSON.stringify(line);
                            if (i < (data.rows.length - 1)) {
                                linesData = linesData + ',';
                            }
                        }
                        linesData = linesData + "}";
                    }
                }
            });

            //Step4:獲取區域
            //var areasData = "{}";
            // var area = {};
            <%--$.ajax({--%>
                <%--async: false,--%>
                <%--type: 'get',--%>
                <%--url: '<%=basePath%>sysConfig/flowArea/listByFlowUuid.action?flowUuid=' + flowUuid,--%>
                <%--dataType: 'json',--%>
                <%--success: function (data) {--%>
                    <%--if (data != null) {--%>
                        <%--areasData = "{";--%>
                        <%--for (var i = 0; i < data.rows.length; i++) {--%>
                            <%--area = {--%>
                                <%--"name": data.rows[i].areaName,--%>
                                <%--"left": parseInt(data.rows[i].gooflowLeft),--%>
                                <%--"top": parseInt(data.rows[i].gooflowTop),--%>
                                <%--"color": data.rows[i].gooflowColor,--%>
                                <%--"width": parseInt(data.rows[i].gooflowWidth),--%>
                                <%--"height": parseInt(data.rows[i].gooflowHeight),--%>
                                <%--"alt": data.rows[i].gooflowAlt,--%>
                            <%--};--%>
                            <%--areasData = areasData + '"' + data.rows[i].uuid + '":' + JSON.stringify(area);--%>
                            <%--if (i < (data.rows.length - 1)) {--%>
                                <%--areasData = areasData + ',';--%>
                            <%--}--%>
                        <%--}--%>
                        <%--areasData = areasData + "}";--%>
                    <%--}--%>
                <%--}--%>
            <%--});--%>

            //加載數據JSON
            jsonData = {
                "title": flowName + "_" + flowVersion,
                "nodes": JSON.parse(nodesData),
                "lines": JSON.parse(linesData),
                "areas": {},//JSON.parse(areasData),
                "initNum": 1
            };
        });

        //控件屬性
        var property = {
            width: 1377,
            height: 620,
            toolBtns: ["start", "end", "task", "node"],
            haveHead: true,
            headLabel: true,
            headBtns: ["save", "undo", "redo", "reload", "print"],
            haveTool: true,
            haveGroup: true,
            useOperStack: true
        };
        //控件說明
        var remark = {
            cursor: "指针",
            direct: "连线",
            start: "開始",
            end: "结束",
            task: "任务",
            node: "節點",
            group: "分組"
        };

        var demo;
        $(function () {
            demo = $.createGooFlow($("#demo"), property);
            demo.setNodeRemarks(remark);
            demo.loadData(jsonData);

            //屬性賦值
            demo.onItemFocus = function (id, model) {
                /*
                var obj;
                $("#ele_model").val(model);
                $("#ele_id").val(id);
                if(model=="line"){
                    obj=this.$lineData[id];
                    $("#ele_type").val(obj.M);
                    $("#ele_left").val("");
                    $("#ele_top").val("");
                    $("#ele_width").val("");
                    $("#ele_height").val("");
                    $("#ele_from").val(obj.from);
                    $("#ele_to").val(obj.to);
                }else if(model=="node"){
                    obj=this.$nodeData[id];
                    $("#ele_type").val(obj.type);
                    $("#ele_left").val(obj.left);
                    $("#ele_top").val(obj.top);
                    $("#ele_width").val(obj.width);
                    $("#ele_height").val(obj.height);
                    $("#ele_from").val("");
                    $("#ele_to").val("");
                }
                $("#ele_name").val(obj.name);
                */
                return true;
            };
            demo.onItemBlur = function (id, model) {
                //document.getElementById("propertyForm").reset();
                return true;
            };
            //保存按鈕
            demo.onBtnSaveClick = function () {
                alert("save.......");
            };
            //刷新按鈕
            demo.onFreshClick = function () {
                alert("refresh.......");
            };
            //打印按鈕
            demo.onPrintClick = function () {
                demo.exportDiagram("flowPicture");
            };
        });

        // var out;

        //導入所有
        function importAll() {
            jsondata = JSON.stringify(document.getElementById("result").value);
            demo.loadData(jsondata);
        }

        //導出所有
        function exportAll() {
            document.getElementById("result").value = JSON.stringify(demo.exportData());
        }

        //導出節點
        // function exportNode() {
        //     var obj = demo.exportData();
        //     document.getElementById("result").value = JSON.stringify(obj.nodes);
        // }

        //導出線條
        // function exportLine() {
        //     var obj = demo.exportData();
        //     document.getElementById("result").value = JSON.stringify(obj.lines);
        // }

        //導出區域
        // function exportArea() {
        //     var obj = demo.exportData();
        //     document.getElementById("result").value = JSON.stringify(obj.areas);
        // }
    </script>
</head>
<body style="font-size: 12px;margin: 0 0 0 0">
<div class="easyui-tabs" style="width:100%;height:100%">
    <div title="Flow Chart" style="padding:1px">
        <div id="demo" style="margin:0px"></div>
    </div>
    <div title="Flow Data" style="padding:1px">
        <div class="easyui-panel" style="padding:5px;">
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'"
               onclick="javascript:importAll();">导入數據</a>
            &nbsp;<span class="datagrid-btn-separator"
                        style="vertical-align: middle;display:inline-block;float:none"></span> &nbsp;
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'"
               onclick="javascript:exportAll();">导出所有</a>
            &nbsp;<span class="datagrid-btn-separator"
                        style="vertical-align: middle;display:inline-block;float:none"></span> &nbsp;
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'"
               onclick="javascript:exportNode();">导出節點</a>
            &nbsp;<span class="datagrid-btn-separator"
                        style="vertical-align: middle;display:inline-block;float:none"></span> &nbsp;
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'"
               onclick="javascript:exportLine();">导出流向</a>
            &nbsp;<span class="datagrid-btn-separator"
                        style="vertical-align: middle;display:inline-block;float:none"></span> &nbsp;
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'"
               onclick="javascript:exportArea();">导出區域</a>
            &nbsp;<span class="datagrid-btn-separator"
                        style="vertical-align: middle;display:inline-block;float:none"></span> &nbsp;
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'"
               onclick="javascript:$('#w').window('open');">Open</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'"
               onclick="javascript:$('#w').window('close');">Close</a>
        </div>
        <textarea id="result" row="6" style="width:1380px;height:570px"></textarea>
    </div>
</div>
</body>
</html>
