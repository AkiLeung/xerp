package com.xerp.common.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.common.consts.ConfigConst;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author Joseph.L
 * @date 2019-10-28
 * @description 工具：文本工具方法集合
 */
public class StringUtils {

    /**
     * 主方法-测试
     */
    public static void main(String[] args) {
        String uuid = createUUID();
        System.out.println(uuid);
    }

    /**
     * 生成UUID
     *
     * @return uuid
     * @author Joseph.L
     */
    public static String createUUID() {
        //获取UUID并转化为String对象
        String uuid = UUID.randomUUID().toString();
        //因为UUID本身为32位只是生成时多了“-”，所以将它们去点就可
        uuid = uuid.replace("-", "");
        return uuid;
    }

    /**
     * 判断是否是空字符串 null和"" 都返回 true
     *
     * @param s
     * @return
     * @author Joseph.L
     */
    public static boolean isEmpty(String s) {
        if (s != null && !s.equals("")) {
            return false;
        }
        return true;
    }

    /**
     * 获取当前日期和时间
     */
    public static String getDatetime() {
        Date date = new Date();
        //设置日期格式
        java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateTime = df.format(date);
        return dateTime;
    }

    /**
     * 轉換日期和时间
     */
    public static String toDatetime(String strDatetime) {
        //设置日期格式
        java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateTime = df.format(strDatetime);
        return dateTime;
    }

    /**
     * 功能说明：分页数据处理
     *
     * @param request
     * @param listCount
     * @return PageModel-pager
     * @author Joseph
     * @date 20181101
     */
    public static PageModel getPager(HttpServletRequest request, Integer listCount) throws Exception {
        //獲取分頁情況
        int page = Integer.parseInt(request.getParameter("page"));
        int rows = Integer.parseInt(request.getParameter("rows"));
        int startRow = 0;
        if (page > 1) {
            startRow = (page - 1) * rows;
        }
        PageModel pager = new PageModel();
        pager.setStartRow(startRow);
        pager.setRows(rows);
        pager.setTotal(listCount);
        return pager;
    }

    /**
     * 功能说明：回寫數據流（UTF-8）-分页
     *
     * @param response
     * @param listCount
     * @param jsonArray
     * @author Joseph
     * @date 20181101
     */
    public static void writePager(HttpServletResponse response, int listCount, JSONArray jsonArray) throws Exception {
        //数据内容
        JSONObject resultSet = new JSONObject();
        resultSet.put("rows", jsonArray);
        resultSet.put("total", listCount);
        //输出流
        write(response, resultSet);
    }

    /**
     * 功能说明：回寫數據流（UTF-8）
     *
     * @param response
     * @param object
     * @author Joseph
     * @date 20181101
     */
    public static void write(HttpServletResponse response, Object object) throws Exception {
        PrintWriter out = response.getWriter();
        response.reset();
        response.setContentType("text/html;charset=utf-8");
        response.addHeader("Access-Control-Allow-Origin", "*");
        out.println(object.toString());
        out.flush();
        out.close();
    }

    /**
     * 功能说明：修改TreeNode節點信息
     *
     * @param nodeList 需要修改的節點
     * @param pid      父鍵
     * @param name     節點名
     * @param icon     圖標
     * @param isParent 字符串：[true/false]
     * @return List<TreeNode> 修改好節點后返回結果
     * @author Joseph
     * @date 20181109
     */
    public static List<TreeNode> modifyNode(List<TreeNode> nodeList,
                                            String pid, String name, String icon, String isParent) {
        for (TreeNode node : nodeList) {
            //當有特殊要求是覆蓋節點父鍵時執行
            if (pid != "" && !"".equals(pid)) {
                node.setPid(pid);
            }

            //當有特殊要求是覆蓋節點名時，否則默認顯示：編碼 + 名稱
            if (name == "" && "".equals(name)) {
                node.setName("【" + node.getCode() + "】" + node.getName());
            } else {
                node.setName(name);
            }

            //顯示狀態圖標
            if (node.getStatus().equals(ConfigConst.STR_STATUS_DELETE_NUM)) {
                node.setIconSkin("delete");
            } else if (node.getStatus().equals(ConfigConst.STR_STATUS_BLOCK_NUM)) {
                node.setIconSkin("block");
            } else if (node.getStatus().equals(ConfigConst.STR_STATUS_ACTIVE_NUM)) {
                //當有特殊要求是覆蓋節點圖標時執行
                if (icon != "" && !"".equals(icon)) {
                    node.setIconSkin(icon);
                }
            }

            //當有特殊要求是覆蓋節點父關係時執行
            if (isParent != "" && !"".equals(isParent)) {
                node.setIsParent(isParent);
            }
        }
        return nodeList;
    }
}
