package com.xerp.common.consts;

/**
 * @author Joseph.L
 * @date 2019-10-28
 * @description 常量：文件地址路径
 */
public class UrlPathConst {

    /**
     * 前缀
     */
    public final static String SYS_SERVER_PATH = "/WEB-INF/webPage";
    /**
     * 登錄主框架-登录面
     */
    public final static String STR_SYSTEM_LOGIN_PAGE = "loginWeb.jsp";

    /**
     * 登錄主框架-主页面
     */
    public final static String STR_SYSTEM_FRAME_PAGE = SYS_SERVER_PATH + "/sysFrame/sys_mainFrame.jsp";
    /**
     * 登錄主框架-左菜单
     */
    public final static String STR_SYSTEM_LEFT_PAGE = SYS_SERVER_PATH + "/sysFrame/sys_leftMenu.jsp";
    /**
     * 登錄主框架-左菜单-操作
     */
    public final static String STR_SYSTEM_LEFT_OPTION_PAGE = SYS_SERVER_PATH + "/sysFrame/sys_menuOptionTree.jsp";
    /**
     * 登錄主框架-工作台
     */
    public final static String STR_SYSTEM_WORK_DESK_PAGE = SYS_SERVER_PATH + "/sysFrame/sys_workDesk.jsp";


    /**
     * 系统错误页面
     */
    public final static String STR_COMMON_ERROR_PAGE = SYS_SERVER_PATH + "/common/error.jsp";
    /**
     * 系统未授權页面
     */
    public final static String STR_COMMON_UNAUTH_PAGE = SYS_SERVER_PATH + "/common/unauthorized.jsp";
    /**
     * 系统404页面
     */
    public final static String STR_COMMON_404_PAGE = SYS_SERVER_PATH + "/common/404.jsp";



    /********************************************Start后台管理***************************************************/
    /**
     * 后台管理：配置菜单
     */
    public final static String STR_SYSTEM_CONFIG_MENU = SYS_SERVER_PATH + "/sysConfig/sys_configLeftMenu.jsp";
    /**
     * 后台管理：配置主页
     */
    public final static String STR_SYSTEM_CONFIG_MAIN = SYS_SERVER_PATH + "/sysConfig/sys_configPanel.jsp";
    /**
     *后台管理：用户-列表
     */
    public final static String STR_SYSTEM_CONFIG_USER = SYS_SERVER_PATH + "/sysConfig/sys_userList.jsp";
    /**
     *后台管理：用户-新增
     */
    public final static String STR_SYSTEM_CONFIG_USER_ADD = SYS_SERVER_PATH + "/sysConfig/sys_userAdd.jsp";
    /**
     *后台管理：用户-修改
     */
    public final static String STR_SYSTEM_CONFIG_USER_UPT = SYS_SERVER_PATH + "/sysConfig/sys_userUpdate.jsp";
    /**
     *后台管理：用户-修改密码
     */
    public final static String STR_SYSTEM_CONFIG_USER_PSW = SYS_SERVER_PATH + "/sysConfig/sys_userUpdatePsw.jsp";
    /**
     *后台管理：权限編碼
     */
    public final static String STR_SYSTEM_CONFIG_USER_PERMISSION = SYS_SERVER_PATH + "/sysConfig/sys_permissionList.jsp";
    /**
     *后台管理：权限編碼-配置
     */
    public final static String STR_SYSTEM_CONFIG_USER_PERMISSION_CONF = SYS_SERVER_PATH + "/sysConfig/sys_permissionConf.jsp";
    /**
     *后台管理：角色列表
     */
    public final static String STR_SYSTEM_CONFIG_ROLE = SYS_SERVER_PATH + "/sysConfig/sys_roleList.jsp";
    /**
     *后台管理：角色配置
     */
    public final static String STR_SYSTEM_CONFIG_ROLE_CONF = SYS_SERVER_PATH + "/sysConfig/sys_roleConf.jsp";
    /**
     *后台管理：角色配置-分配权限
     */
    public final static String STR_SYSTEM_CONFIG_ROLE_PERMISSION_CONF = SYS_SERVER_PATH + "/sysConfig/sys_rolePermissionConf.jsp";
    /**
     *后台管理：角色配置-分配权限
     */
    public final static String STR_SYSTEM_CONFIG_ROLE_PERMISSION_ASSIGN = SYS_SERVER_PATH + "/sysConfig/sys_rolePermissionSelect.jsp";
    /**
     *后台管理：角色配置-分配用户
     */
    public final static String STR_SYSTEM_CONFIG_ROLE_USER_CONF = SYS_SERVER_PATH + "/sysConfig/sys_roleUserConf.jsp";
    /**
     *后台管理：角色配置-分配权限
     */
    public final static String STR_SYSTEM_CONFIG_ROLE_USER_ASSIGN = SYS_SERVER_PATH + "/sysConfig/sys_roleUserSelect.jsp";
    /**
     *后台管理：门户配置-列表
     */
    public final static String STR_SYSTEM_CONFIG_PORTAL = SYS_SERVER_PATH + "/sysConfig/sys_portalList.jsp";
    /**
     *后台管理：门户配置-配置
     */
    public final static String STR_SYSTEM_CONFIG_PORTAL_CONF = SYS_SERVER_PATH + "/sysConfig/sys_portalConf.jsp";
    /**
     *后台管理：门户配置-菜單-列表
     */
    public final static String STR_SYSTEM_CONFIG_PORTAL_MENU = SYS_SERVER_PATH + "/sysConfig/sys_portalMenuConf.jsp";
    /**
     *后台管理：门户配置-菜單-更新
     */
    public final static String STR_SYSTEM_CONFIG_PORTAL_MENU_UPT = SYS_SERVER_PATH + "/sysConfig/sys_portalMenuUpdate.jsp";
    /**
     *后台管理：门户配置-菜單-TREE
     */
    public final static String STR_SYSTEM_CONFIG_PORTAL_MENU_TREE = SYS_SERVER_PATH + "/sysConfig/sys_portalMenuTree.jsp";
    /**
     *后台管理：门户配置-菜單-模塊-配置
     */
    public final static String STR_SYSTEM_CONFIG_PORTAL_MENU_MODULE_CONF = SYS_SERVER_PATH + "/sysConfig/sys_portalModuleConf.jsp";
    /**
     *后台管理：门户配置-菜單-操作-配置
     */
    public final static String STR_SYSTEM_CONFIG_PORTAL_MENU_OPTION_CONF = SYS_SERVER_PATH + "/sysConfig/sys_portalOptionConf.jsp";
    /**
     *后台管理：流程模塊
     */
    public final static String STR_SYSTEM_CONFIG_FLOW_MODULE = SYS_SERVER_PATH + "/sysConfig/sys_flowModuleList.jsp";
    /**
     *后台管理：流程模塊-配置
     */
    public final static String STR_SYSTEM_CONFIG_FLOW_MODULE_CONF = SYS_SERVER_PATH + "/sysConfig/sys_flowModuleConf.jsp";

    /**
     *后台管理：流程名称
     */
    public final static String STR_SYSTEM_CONFIG_FLOW_NAME = SYS_SERVER_PATH + "/sysConfig/sys_flowNameList.jsp";
    /**
     *后台管理：流程名称-配置
     */
    public final static String STR_SYSTEM_CONFIG_FLOW_NAME_CONF = SYS_SERVER_PATH + "/sysConfig/sys_flowNameConf.jsp";
    /**
     *后台管理：流程節點-列表
     */
    public final static String STR_SYSTEM_CONFIG_FLOW_NODE = SYS_SERVER_PATH + "/sysConfig/sys_flowNodeList.jsp";
    /**
     *后台管理：流程節點-配置
     */
    public final static String STR_SYSTEM_CONFIG_FLOW_NODE_CONF = SYS_SERVER_PATH + "/sysConfig/sys_flowNodeConf.jsp";
    /**
     *后台管理：流程流向-列表
     */
    public final static String STR_SYSTEM_CONFIG_FLOW_DIRECTION = SYS_SERVER_PATH + "/sysConfig/sys_flowDirectionList.jsp";
    /**
     *后台管理：流程流向-配置
     */
    public final static String STR_SYSTEM_CONFIG_FLOW_DIRECTION_CONF = SYS_SERVER_PATH + "/sysConfig/sys_flowDirectionConf.jsp";

    /**
     *后台管理：菜單模塊
     */
    public final static String STR_SYSTEM_CONFIG_MENU_MODULE = SYS_SERVER_PATH + "/sysConfig/sys_menuModuleList.jsp";
    /**
     *后台管理：菜單模塊-配置
     */
    public final static String STR_SYSTEM_CONFIG_MENU_MODULE_CONF = SYS_SERVER_PATH + "/sysConfig/sys_menuModuleConf.jsp";
    /**
     *后台管理：菜單配置-配置
     */
    public final static String STR_SYSTEM_CONFIG_MENU_OPTION_CONF = SYS_SERVER_PATH + "/sysConfig/sys_menuOptionConf.jsp";
    /**
     *后台管理：菜單配置-TREE
     */
    public final static String STR_SYSTEM_CONFIG_MENU_OPTION_TREE = SYS_SERVER_PATH + "/sysConfig/sys_menuOptionTree.jsp";
    /**
     *后台管理：菜單配置-新增
     */
    public final static String STR_SYSTEM_CONFIG_MENU_OPTION_ADD = SYS_SERVER_PATH + "/sysConfig/sys_menuOptionAdd.jsp";
    /**
     *后台管理：菜單配置-修改
     */
    public final static String STR_SYSTEM_CONFIG_MENU_OPTION_UPT = SYS_SERVER_PATH + "/sysConfig/sys_menuOptionUpdate.jsp";

    /**
     *后台管理：數據字典-主页面
     */
    public final static String STR_SYSTEM_CONFIG_DATA_KEY_VALUE = SYS_SERVER_PATH + "/sysConfig/sys_dataKeyValueConf.jsp";
    /**
     *后台管理：數據字典-TREE
     */
    public final static String STR_SYSTEM_CONFIG_DATA_KEY_VALUE_TREE = SYS_SERVER_PATH + "/sysConfig/sys_dataKeyValueTree.jsp";
    /**
     *后台管理：數據類型-新增
     */
    public final static String STR_SYSTEM_CONFIG_DATA_KEY_TYPE_ADD = SYS_SERVER_PATH + "/sysConfig/sys_dataKeyTypeAdd.jsp";
    /**
     *后台管理：數據類型-修改
     */
    public final static String STR_SYSTEM_CONFIG_DATA_KEY_TYPE_UPT = SYS_SERVER_PATH + "/sysConfig/sys_dataKeyTypeUpdate.jsp";
    /**
     *后台管理：數據字典-新增
     */
    public final static String STR_SYSTEM_CONFIG_DATA_KEY_VALUE_ADD = SYS_SERVER_PATH + "/sysConfig/sys_dataKeyValueAdd.jsp";
    /**
     *后台管理：數據字典-修改
     */
    public final static String STR_SYSTEM_CONFIG_DATA_KEY_VALUE_UPT = SYS_SERVER_PATH + "/sysConfig/sys_dataKeyValueUpdate.jsp";
    /**
     *后台管理：系统日志
     */
    public final static String STR_SYSTEM_CONFIG_SYSTEM_LOG = SYS_SERVER_PATH + "/sysConfig/sys_systemLogList.jsp";
    /**
     *后台管理：系统日志
     */
    public final static String STR_SYSTEM_CONFIG_SYSTEM_DETAIL = SYS_SERVER_PATH + "/sysConfig/sys_systemLogDetail.jsp";
    /**
     *后台管理：系统信息
     */
    public final static String STR_SYSTEM_CONFIG_SYSTEM_INFO = SYS_SERVER_PATH + "/sysConfig/sys_systemInfo.jsp";
    /********************************************End 后台管理***************************************************/


    /********************************************Start组织架构***************************************************/
    /**
     * 组织架构：配置菜单
     */
    public final static String STR_SYSTEM_ORG_MENU = SYS_SERVER_PATH + "/sysOrg/sys_orgLeftMenu.jsp";
    /**
     * 组织架构：配置主页
     */
    public final static String STR_SYSTEM_ORG_MAIN = SYS_SERVER_PATH + "/sysOrg/sys_configPanel.jsp";
    /**
     * 组织架构：公司配置
     */
    public final static String STR_SYSTEM_ORG_COMPANY_LIST = SYS_SERVER_PATH + "/sysOrg/sys_orgCompanyList.jsp";
    /**
     * 组织架构：公司配置
     */
    public final static String STR_SYSTEM_ORG_COMPANY_CONF = SYS_SERVER_PATH + "/sysOrg/sys_orgCompanyConf.jsp";
    /**
     * 后台管理：部门配置
     */
    public final static String STR_SYSTEM_ORG_DEPARTMENT_CONF = SYS_SERVER_PATH + "/sysOrg/sys_orgDepartmentConf.jsp";
    /**
     * 后台管理：部门結構-Tree
     */
    public final static String STR_SYSTEM_ORG_DEPARTMENT_TREE = SYS_SERVER_PATH + "/sysOrg/sys_orgDepartmentTree.jsp";
    /**
     *后台管理：部门結構-新增
     */
    public final static String STR_SYSTEM_ORG_DEPARTMENT_ADD = SYS_SERVER_PATH + "/sysOrg/sys_orgDepartmentAdd.jsp";
    /**
     *后台管理：部门結構-修改
     */
    public final static String STR_SYSTEM_ORG_DEPARTMENT_UPT = SYS_SERVER_PATH + "/sysOrg/sys_orgDepartmentUpdate.jsp";
    /**
     * 组织架构：事业部列表
     */
    public final static String STR_SYSTEM_ORG_BUSINESS_LIST = SYS_SERVER_PATH + "/sysOrg/sys_orgBusinessList.jsp";
    /**
     * 组织架构：事业部配置
     */
    public final static String STR_SYSTEM_ORG_BUSINESS_CONF = SYS_SERVER_PATH + "/sysOrg/sys_orgBusinessConf.jsp";
    /**
     * 组织架构：事业部门配置
     */
    public final static String STR_SYSTEM_ORG_BUSINESS_UNIT_CONF = SYS_SERVER_PATH + "/sysOrg/sys_orgBusinessUnitConf.jsp";
    /**
     * 组织架构：事业部门配置-TREE
     */
    public final static String STR_SYSTEM_ORG_BUSINESS_UNIT_TREE = SYS_SERVER_PATH + "/sysOrg/sys_orgBusinessUnitTree.jsp";
    /**
     * 组织架构：事业部门配置-新增
     */
    public final static String STR_SYSTEM_ORG_BUSINESS_UNIT_ADD = SYS_SERVER_PATH + "/sysOrg/sys_orgBusinessUnitAdd.jsp";
    /**
     * 组织架构：事业部门配置-修改
     */
    public final static String STR_SYSTEM_ORG_BUSINESS_UNIT_UPT = SYS_SERVER_PATH + "/sysOrg/sys_orgBusinessUnitUpdate.jsp";
    /**
     * 组织架构：工厂配置
     */
    public final static String STR_SYSTEM_ORG_FACTORY_CONF = SYS_SERVER_PATH + "/sysOrg/sys_orgFactoryConf.jsp";
    /**
     * 组织架构：工厂配置-TREE
     */
    public final static String STR_SYSTEM_ORG_FACTORY_TREE = SYS_SERVER_PATH + "/sysOrg/sys_orgFactoryTree.jsp";
    /**
     * 组织架构：工厂配置-新增
     */
    public final static String STR_SYSTEM_ORG_FACTORY_ADD = SYS_SERVER_PATH + "/sysOrg/sys_orgFactoryAdd.jsp";
    /**
     * 组织架构：工厂配置-修改
     */
    public final static String STR_SYSTEM_ORG_FACTORY_UPT = SYS_SERVER_PATH + "/sysOrg/sys_orgFactoryUpdate.jsp";

    /**
     * 组织架构：库位配置
     */
    public final static String STR_SYSTEM_ORG_LOCATION_CONF = SYS_SERVER_PATH + "/sysOrg/sys_orgLocationConf.jsp";
    /**
     * 组织架构：库位配置-TREE
     */
    public final static String STR_SYSTEM_ORG_LOCATION_TREE = SYS_SERVER_PATH + "/sysOrg/sys_orgLocationTree.jsp";
    /**
     * 组织架构：库位配置-新增
     */
    public final static String STR_SYSTEM_ORG_LOCATION_ADD = SYS_SERVER_PATH + "/sysOrg/sys_orgLocationAdd.jsp";
    /**
     * 组织架构：库位配置-修改
     */
    public final static String STR_SYSTEM_ORG_LOCATION_UPT = SYS_SERVER_PATH + "/sysOrg/sys_orgLocationUpdate.jsp";

    /**
     * 组织架构：货仓配置
     */
    public final static String STR_SYSTEM_ORG_WAREHOUSE_CONF = SYS_SERVER_PATH + "/sysOrg/sys_orgWarehouseConf.jsp";
    /**
     * 组织架构：货仓配置-TREE
     */
    public final static String STR_SYSTEM_ORG_WAREHOUSE_TREE = SYS_SERVER_PATH + "/sysOrg/sys_orgWarehouseTree.jsp";
    /**
     * 组织架构：货仓配置-新增
     */
    public final static String STR_SYSTEM_ORG_WAREHOUSE_ADD = SYS_SERVER_PATH + "/sysOrg/sys_orgWarehouseAdd.jsp";
    /**
     * 组织架构：货仓配置-修改
     */
    public final static String STR_SYSTEM_ORG_WAREHOUSE_UPT = SYS_SERVER_PATH + "/sysOrg/sys_orgWarehouseUpdate.jsp";
    /********************************************End 组织架构***************************************************/


    /********************************************Start弹窗管理***************************************************/
    /**
     *弹窗管理：公司架构
     */
    public final static String STR_SYSTEM_POPU_COMPANY_TREE = SYS_SERVER_PATH + "/sysPopu/sys_popuCompanyTree.jsp";
    /**
     *弹窗管理：门户列表
     */
    public final static String STR_SYSTEM_POPU_PORTAL_TREE = SYS_SERVER_PATH + "/sysPopu/sys_popuPortalTree.jsp";


    /**
     *弹窗管理：流程名称（可視化圖）
     */
    public final static String STR_SYSTEM_POPU_FLOW_GRAPH = SYS_SERVER_PATH + "/sysPopu/sys_popuWorkFlow.jsp";
    /**
     *弹窗管理：流程模塊
     */
    public final static String STR_SYSTEM_POPU_FLOW_MODULE_TREE = SYS_SERVER_PATH + "/sysPopu/sys_popuFlowModuleTree.jsp";
    /**
     *弹窗管理：流程節點
     */
    public final static String STR_SYSTEM_POPU_FLOW_NODE_TREE = SYS_SERVER_PATH + "/sysPopu/sys_popuFlowNodeTree.jsp";
    /********************************************End 弹窗管理***************************************************/

}
