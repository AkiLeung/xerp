package com.xerp.core.controller;

import com.xerp.base.BaseController;
import com.xerp.common.consts.AuthCodeConst;
import com.xerp.common.consts.UrlPathConst;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * 功能說明: 主页面映射路径
 *
 * @Author By Joseph
 * @Date:20181108
 */
@Slf4j
@RestController
@RequestMapping(value = "sysConfig")
public class SysConfigController extends BaseController {

    /**
     * 功能说明：后台配置-菜单
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "configMenu.action")
    public ModelAndView configMenu() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_MENU);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：后台配置-主界面
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "configPanel.action")
    public ModelAndView configPanel() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_MAIN);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：后台配置-用户
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "user/configuration.action")
    public ModelAndView configUser() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_USER);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }


    /**
     * 功能说明：后台配置-權限管理
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20190215
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "permission/configuration.action")
    public ModelAndView configAuthorityCode() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_USER_PERMISSION);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }


    /**
     * 功能说明：后台配置-角色
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "role/configuration.action")
    public ModelAndView configRole() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_ROLE);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }



    /**
     * 功能说明：后台配置-门户
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "portal/configuration.action")
    public ModelAndView configPortal() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_PORTAL);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：后台配置-流程模块
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
//    @RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "flowModule/configuration.action")
    public ModelAndView configFlowModule() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_FLOW_MODULE);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：后台配置-流程名称
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
//    @RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "flowName/configuration.action")
    public ModelAndView configFlowName() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_FLOW_NAME);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：后台配置-菜单模块
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "menuModule/configuration.action")
    public ModelAndView configMenuModule() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_MENU_MODULE);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：后台配置-菜单操作
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "menuOption/configuration.action")
    public ModelAndView configMenuOption() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_MENU_OPTION_CONF);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：后台配置-数据字段
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "keyValue/configuration.action")
    public ModelAndView configKeyValue() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_DATA_KEY_VALUE);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：顯示頁面
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181108
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "sysLog/configuration.action")
    public ModelAndView gotoConfPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_SYSTEM_LOG);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：后台配置-系统信息
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "sysInfo/configuration.action")
    public ModelAndView configSystem() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_SYSTEM_INFO);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
