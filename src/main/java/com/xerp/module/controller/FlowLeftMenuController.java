package com.xerp.module.controller;

import com.xerp.base.BaseController;
import com.xerp.common.consts.UrlPathConst;
import lombok.extern.slf4j.Slf4j;
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
@RequestMapping(value = "flwLeftMenu")
public class FlowLeftMenuController extends BaseController {

    /**
     * 功能说明：请假流程-菜单
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "flwVacation/LeftMenu.action")
    public ModelAndView configMenu() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_MENU);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：请假流程-主界面
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
//    @RequestMapping(value = "configPanel.action")
//    public ModelAndView configPanel() {
//        modelAndView = new ModelAndView();
//        try {
//            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_MAIN);
//        } catch (Exception ex) {
//            modelAndView.addObject("errorMessage", ex.toString());
//            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
//        }
//        return modelAndView;
//    }

}
