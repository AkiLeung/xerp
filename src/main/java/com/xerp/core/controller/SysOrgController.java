package com.xerp.core.controller;

import com.xerp.base.BaseController;
import com.xerp.common.consts.AuthCodeConst;
import com.xerp.common.consts.UrlPathConst;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
@RequestMapping(value = "sysOrg")
public class SysOrgController extends BaseController {

    /**
     * 功能说明：组织架构-菜单
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "orgMenu.action")
    public ModelAndView orgMenu() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_MENU);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：组织架构-主界面
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "orgPanel.action")
    public ModelAndView orgPanel() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_MAIN);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：组织架构-公司
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "company/configuration.action")
    public ModelAndView configCompany() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_COMPANY_LIST);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：组织架构-部门
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "department/configuration.action")
    public ModelAndView configDepartment() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_DEPARTMENT_CONF);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：组织架构-事业部
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "business/configuration.action")
    public ModelAndView configBusiness() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_BUSINESS_LIST);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：组织架构-事业部门
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "businessUnit/configuration.action")
    public ModelAndView configBusinessUnit() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_BUSINESS_UNIT_CONF);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }


    /**
     * 功能说明：组织架构-工厂
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "factory/configuration.action")
    public ModelAndView configFactory() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_FACTORY_CONF);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：组织架构-库位
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "location/configuration.action")
    public ModelAndView configLocation() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_LOCATION_CONF);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：组织架构-货仓
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "warehouse/configuration.action")
    public ModelAndView configWarehouse() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_WAREHOUSE_CONF);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
