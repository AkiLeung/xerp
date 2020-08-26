package com.xerp.common.consts;

/**
 * show XERP 系統 靜態常量
 *
 * @author JOSEPH.L
 * Date     2018-08-01
 * show 注意：除灰色未使用變量，其他所有變量只能新增不能刪除和修改
 */
public class ConfigConst {

    /**
     * ZTree & DTree 默认 Root
     */
    public static final String STR_SYSTEM_ROOT_NODE_ID = "0";
    /**
     * 系统保留uuid
     */
    public static final String STR_SYSTEM_ZZZZZZZ_UUID = "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz";

    /**
     * 通用常量:菜單類型 模塊
     */
    public static final String STR_PORTAL_MENU_MODULE = "00";
    /**
     * 通用常量:菜單類型 菜單
     */
    public static final String STR_PORTAL_MENU_OPTION = "01";

    /**
     * 通用常量:網頁狀態 新增
     */
    public static final String STR_WS_CREATE = "create";
    /**
     * 通用常量:網頁狀態 修改
     */
    public static final String STR_WS_UPDATE = "update";
    /**
     * 通用常量:網頁狀態 刪除
     */
    public static final String STR_WS_DELETE = "delete";
    /**
     * 通用常量:網頁狀態 刪除
     */
    public static final String STR_WS_SEARCH = "search";

    /**
     * 通用常量:返回成功信息
     */
    public static final String STR_AJAX_SUCCESS = "success";
    /**
     * 通用常量:返回失敗信息
     */
    public static final String STR_AJAX_ERROR = "error";

    /**
     * 通用常量:激活
     */
    public static final String STR_STATUS_ACTIVE_NUM = "01";
    public static final String STR_STATUS_ACTIVE_TXT = "active";
    /**
     * 通用常量:凍結
     */
    public static final String STR_STATUS_BLOCK_NUM = "00";
    public static final String STR_STATUS_BLOCK_TXT = "blocked";
    /**
     * 通用常量:刪除
     */
    public static final String STR_STATUS_DELETE_NUM = "99";
    public static final String STR_STATUS_DELETE_TXT = "deleted";

    /**
     * 用户类型：普通用戶
     */
    public static final String STR_USER_TYPE_NUM_USER = "00";
    public static final String STR_USER_TYPE_TXT_USER = "user";
    /**
     * 用户类型：經理層
     */
    public static final String STR_USER_TYPE_NUM_MANAGER = "01";
    public static final String STR_USER_TYPE_TXT_MANAGER = "manager";
    /**
     * 用户类型：系統管理員
     */
    public static final String STR_USER_TYPE_NUM_ADMIN = "*";
    public static final String STR_USER_TYPE_TXT_ADMIN = "admin";

    /**
     * 通用常量 環節類型:起草
     */
    public static final String STR_FLOW_START_NUM = "00";
    public static final String STR_FLOW_START_TXT = "start";
    /**
     * 通用常量 環節類型:流轉中-任務
     */
    public static final String STR_FLOW_TASK_NUM = "01";
    public static final String STR_FLOW_TASK_TXT = "task";
    /**
     * 通用常量 環節類型:流轉中-節點
     */
    public static final String STR_FLOW_NODE_NUM = "02";
    public static final String STR_FLOW_NODE_TXT = "node";
    /**
     * 通用常量 環節類型:結束
     */
    public static final String STR_FLOW_END_NUM = "99";
    public static final String STR_FLOW_END_TXT = "end";

    /**
     * 通用常量 流向類型:向前
     */
    public static final String STR_FLOW_DIRECTION_SEND_NUM = "01";
    public static final String STR_FLOW_DIRECTION_SEND_TXT = "SendTo";
    /**
     * 通用常量 流向類型:向後
     */
    public static final String STR_FLOW_DIRECTION_BACK_NUM = "02";
    public static final String STR_FLOW_DIRECTION_BACK_TXT = "Return";

    /**
     * 系统同KeyValue：语言
     */
    public static final String STR_SYS_KEY_VALUE_LANGUAGE = "language";
    /**
     * 系统同KeyValue国家
     */
    public static final String STR_SYS_KEY_VALUE_COUNTRY = "country";
    /**
     * 系统同KeyValue權限分類
     */
    public static final String STR_SYS_KEY_VALUE_AUTHORITY = "authority";
}
