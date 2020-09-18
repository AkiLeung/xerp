/**Js Transfer to page******************/
function jsLocation(obj) {
    window.location.href = obj;
}

/**easyUI 弹出窗口******************/
function showDialogWin(ifrName,dialogId, urlPath) {
    window.frames[ifrName].location.href = urlPath;
    $('#' + dialogId).dialog('open');
}


/**流程Tab撤换******************/
// function openFlowTabToUrl(tabName,ifrName,paraUrl) {
//     if (paraUrl != "" && paraUrl != "null") {
//         var url = paraUrl;
//         if (url != "") {
//             //判断选项卡是否重复打开
//             if (window.top.$('#workbench').tabs('exists', tabName)) {
//                 window.top.$('#workbench').tabs('select', tabName);
//                 window.top.frames[ifrName].location.href = paraUrl;
//             } else {
//                 window.top.$('#workbench').tabs('add', {
//                     id: tabName,
//                     title: tabName,
//                     content: '<iframe id="' + ifrName + '" name="' + ifrName + '" scrolling="no" frameborder="0"  ' +
//                         'src="' + url + '" style="width:100%;height:100%;"></iframe>',
//                     closable: true
//                 });
//             }
//         }
//     }
// }

/**over write easyui datetime format**/
function myformatter(date){
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    var d = date.getDate();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}
function myparser(s){
    if (!s) return new Date();
    var ss = (s.split('-'));
    var y = parseInt(ss[0],10);
    var m = parseInt(ss[1],10);
    var d = parseInt(ss[2],10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
        return new Date(y,m-1,d);
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





