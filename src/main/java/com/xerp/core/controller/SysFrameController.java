package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.entity.User;
import com.xerp.core.service.IPortalMenuService;
import com.xerp.core.service.IUserService;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能說明: 主页面映射路径
 * @Author By Joseph
 * @Date:20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysFrame")
public class SysFrameController extends BaseController {

    @Autowired
    private IUserService iUserService;

    @Autowired
    private IPortalMenuService iPortalMenuService;


    /**
     * 功能说明：系统框架-左菜单
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "leftMenu.action")
    public ModelAndView leftMenu() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_LEFT_PAGE);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：系统框架-左菜单-操作
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "menuOption.action")
    public ModelAndView menuOption() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_LEFT_OPTION_PAGE);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：系统框架-工作台
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "workDesk.action")
    public ModelAndView workDesk() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_WORK_DESK_PAGE);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：前台用戶菜單
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping("portalUserMenuZTree.action")
    @ResponseBody
    public String portalUserMenuZTree(HttpServletResponse response) throws Exception {
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        try {
            String portalUuid = iUserService.listByUuid(currentUser.getUuid()).getPortalUuid();
            nodeList = iPortalMenuService.portalMenuZTree(portalUuid);
        } catch (Exception ex) {
            System.out.println("XERP Exception:" + ex.toString());
            log.error("XERP Exception:" + ex.toString());
        }

        //處理ZTREE基礎:父子圖標
        for (TreeNode node : nodeList) {
            if (node.getIsParent().equals(ConfigConst.STR_PORTAL_MENU_MODULE)) {
                node.setIsParent("true");
            }
            if (node.getIsParent().equals(ConfigConst.STR_PORTAL_MENU_OPTION)) {
                node.setIsParent("false");
            }
        }
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
        StringUtils.write(response, jsonArray);
        return null;
    }

    @RequestMapping("asyncGetNodes.action")
    @ResponseBody
    public List<TreeNode> asyncGetNodes(HttpServletResponse response, String id, String pid, String name) throws Exception {
        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        Thread.sleep(100);
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
        StringUtils.write(response, jsonArray);
        return null;
    }
}
