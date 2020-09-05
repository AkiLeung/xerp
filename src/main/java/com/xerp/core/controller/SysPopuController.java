package com.xerp.core.controller;

import com.xerp.base.BaseController;
import com.xerp.common.consts.UrlPathConst;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * 功能說明：用於 系统弹窗
 * @Author By Joseph
 * @Date:20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysPopu")
public class SysPopuController extends BaseController {

    /**
     * 功能说明：彈窗-公司
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    @RequestMapping(value = "companyTree.action")
    public ModelAndView companyTree() {
        modelAndView = new ModelAndView();
        try {
            String urlPath = UrlPathConst.STR_SYSTEM_POPU_COMPANY_TREE ;
            modelAndView.setViewName(urlPath);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：彈窗-部门
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    @RequestMapping(value = "departmentTree.action")
    public ModelAndView departmentTree() {
        modelAndView = new ModelAndView();
        try {
            String urlPath = UrlPathConst.STR_SYSTEM_POPU_DEPARTMENT_TREE ;
            modelAndView.setViewName(urlPath);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：彈窗-事业部
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    @RequestMapping(value = "businessTree.action")
    public ModelAndView businessTree() {
        modelAndView = new ModelAndView();
        try {
            String urlPath = UrlPathConst.STR_SYSTEM_POPU_BUSINESS_TREE ;
            modelAndView.setViewName(urlPath);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：彈窗-事业部-部门
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    @RequestMapping(value = "businessUnitTree.action")
    public ModelAndView businessUnitTree() {
        modelAndView = new ModelAndView();
        try {
            String urlPath = UrlPathConst.STR_SYSTEM_POPU_BUSINESS_UNIT_TREE ;
            modelAndView.setViewName(urlPath);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：彈窗-门户
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181115
     */
    @RequestMapping(value = "portalTree.action")
    public ModelAndView portalTree() {
        modelAndView = new ModelAndView();
        try {
            String urlPath = UrlPathConst.STR_SYSTEM_POPU_PORTAL_TREE ;
            modelAndView.setViewName(urlPath);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }


    /**
     * 功能说明：彈窗-流程模塊
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181210
     */
    @RequestMapping(value = "flowModuleTree.action")
    public ModelAndView flowModuleTree() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_POPU_FLOW_MODULE_TREE);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：彈窗-流程環節
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181210
     */
    @RequestMapping(value = "flowNodeTree.action")
    public ModelAndView flowNodeTree() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_POPU_FLOW_NODE_TREE);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：彈窗-可視化流程
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181209
     */
    @RequestMapping(value = "gotoFlowGraphPage.action")
    public ModelAndView gotoFlowGraphPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_POPU_FLOW_GRAPH);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
