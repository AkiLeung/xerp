/**Js Transfer to page******************/
function jsLocation(obj) {
    window.location.href = obj;
}

/**easyUI 弹出窗口******************/
function showDialogWin(ifrName, dialogId, urlPath) {
    window.frames[ifrName].location.href = urlPath;
    $('#' + dialogId).dialog('open');
}

/**uuid******************/
function uuid() {
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "";

    var uuid = s.join("");
    return uuid;
}


/**设置控件只读显示状态******************/
function setObjectStatusReadonly(objectId) {
    if (objectId != "") {
        $('#' + objectId).textbox('textbox').attr('readonly', true);
        $('#' + objectId).textbox('textbox').css("color", "#1a46e2");
        $('#' + objectId).textbox('textbox').css('background', '#f4fdff');
    }
}

/**设置控件可以编辑状态******************/
function setObjectStatusEditable(lvHandlerCode, lvCurUserCode, objectId) {
    if (objectId != "") {
        if (lvHandlerCode != "" && lvCurUserCode != "" && lvHandlerCode == lvCurUserCode) {
            $('#' + objectId).textbox('textbox').attr('readonly', false);
            $('#' + objectId).textbox('textbox').css("color", "#090809");
            $('#' + objectId).textbox('textbox').css('background', '#ffffff');
        }else{
            setObjectStatusReadonly(objectId);
        }
    }
}

/**流程Tab撤换******************/
function openFlowTabToUrl(tabName, ifrName, paraUrl) {
    if (paraUrl != "" && paraUrl != "null") {
        //判断选项卡是否重复打开
        if (window.top.$('#workbench').tabs('exists', tabName)) {
            window.top.$('#workbench').tabs('select', tabName);
            window.top.frames[ifrName].location.href = paraUrl;
        } else {
            window.top.$('#workbench').tabs('add', {
                id: tabName,
                title: tabName,
                content: '<iframe id="' + ifrName + '" name="' + ifrName + '" scrolling="no" frameborder="0"  ' +
                    'src="' + paraUrl + '" style="width:100%;height:100%;"></iframe>',
                closable: true
            });
        }
    }
}

/**over write easyui datetime format**/
function myformatter(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
}

function myparser(s) {
    if (!s) return new Date();
    var ss = (s.split('-'));
    var y = parseInt(ss[0], 10);
    var m = parseInt(ss[1], 10);
    var d = parseInt(ss[2], 10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
        return new Date(y, m - 1, d);
    } else {
        return new Date();
    }
}

/**over write Easyui textbox method onkeyup*/
$.extend($.fn.textbox.methods, {
    addClearBtn: function (jq, iconCls) {
        return jq.each(function () {
            var t = $(this);
            var opts = t.textbox('options');
            opts.icons = opts.icons || [];
            opts.icons.unshift({
                iconCls: iconCls,
                handler: function (e) {
                    $(e.data.target).textbox('clear').textbox('textbox').focus();
                    $(this).css('visibility', 'hidden');
                }
            });
            t.textbox();
            if (!t.textbox('getText')) {
                t.textbox('getIcon', 0).css('visibility', 'hidden');
            }
            t.textbox('textbox').bind('keyup', function () {
                var icon = t.textbox('getIcon', 0);
                if ($(this).val()) {
                    icon.css('visibility', 'visible');
                } else {
                    icon.css('visibility', 'hidden');
                }
            });
        });
    }
});

/***EasyUI dataGrid隐藏指定行*****************************/
function easyuiDG_hideRow(tableId, index) {
    //获取 easyui-datagrid 数据存储所在表格
    var tbody = easyuiDG_getTBody(tableId).children('tbody');
    tbody.children().eq(index).hide(); //隐藏指定行
    //如果显示行号的话 则隐藏行号
    if ($('#' + tableId).prevAll('div.datagrid-view1')) {
        var numbers = $('#' + tableId).prevAll('div.datagrid-view1')
            .children('div.datagrid-body')
            .children('div.datagrid-body-inner')
            .children('table.datagrid-btable')
            .children('tbody');
        numbers.children().eq(index).hide();//隐藏行号
    }
}

/***EasyUI dataGrid 显示指定行*****************************/
function easyuiDG_showRow(tableId, index) {
    //获取 easyui-datagrid 数据存储所在表格
    var tbody = easyuiDG_getTBody(tableId).children('tbody');
    tbody.children().eq(index).show(); //显示指定行
    //如果显示行号的话 则隐藏行号
    if ($('#' + tableId).prevAll('div.datagrid-view1')) {
        var numbers = $('#' + tableId).prevAll('div.datagrid-view1')
            .children('div.datagrid-body')
            .children('div.datagrid-body-inner')
            .children('table.datagrid-btable')
            .children('tbody');
        numbers.children().eq(index).show();//显示行号
    }
}

/***获取 easyui-datagrid 数据存储所在表格*****************************/
function easyuiDG_getTBody(tableId) {
    var view = $('#' + tableId).prevAll('div.datagrid-view2');
    var table = view.children('div.datagrid-body').children('table.datagrid-btable');
    return table;
}



