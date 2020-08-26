package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.User;
import com.xerp.core.service.IUserService;
import com.xerp.core.shiro.realm.ShiroUtil;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 功能说明：用戶 CURD+跳轉
 *
 * @Author By Joseph
 * @Date:20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysConfig/user")
public class UserController extends BaseController {

    /**
     * 视图模型
     */
    private ModelAndView modelAndView = super.modelAndView;

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private IUserService userService;

    /**
     * 功能说明：获取数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "listData.action")
    @ResponseBody
    public String listData(HttpServletResponse response,
                           HttpServletRequest request) {
        try {
            String search = request.getParameter("search");
            PageModel pager;
            Integer listCount = userService.listCount(search);
            pager = StringUtils.getPager(request, listCount);
            if (!StringUtils.isEmpty(search)) {
                pager.setCondition01(search);
            }
            List<User> userList = userService.listData(pager);
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(userList));
            StringUtils.writePager(response, listCount, jsonArray);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：获取数据by uuid
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "listByUuid.action")
    @ResponseBody
    public String listByUuid(@RequestParam(value = "uuid") String uuid,
                             HttpServletResponse response) {
        JSONObject jsonObject = null;
        try {
            //獲取指定的數據對象到JSON
            User entityObject = userService.listByUuid(uuid);
            jsonObject = JSONObject.parseObject(JSON.toJSONString(entityObject));
            StringUtils.write(response, jsonObject);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        //返回狀態
        if (jsonObject != null) {
            return ConfigConst.STR_AJAX_SUCCESS;
        } else {
            return ConfigConst.STR_AJAX_ERROR;
        }
    }

    /**
     * 功能说明：获取数据by Code
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "listByCode.action")
    @ResponseBody
    public String listByCode(@RequestParam(value = "user_code") String user_code,
                             HttpServletResponse response) {
        try {
            //獲取指定的數據對象到JSON
            JSONObject result = new JSONObject();
            List<User> entityObject = userService.listByCode(user_code);
            if (entityObject.size() > 0) {
                result.put(ConfigConst.STR_AJAX_SUCCESS, true);
            } else {
                result.put(ConfigConst.STR_AJAX_ERROR, false);
            }
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：保存数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "saveData.action", method = RequestMethod.POST)
    @ResponseBody
    public String saveData(HttpServletRequest request) {
        //获取当前用户
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        //影響行數
        int int_return = 0;
        try {
            //獲取網頁狀態
            String webStatus = request.getParameter("ws");
            //操作對象
            User entityObject = new User();
            //uuid
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());
            } else if (webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                entityObject.setUuid(request.getParameter("uuid"));
            }
            entityObject.setStatus(request.getParameter("status"));
            entityObject.setUserCode(request.getParameter("userCode"));
            entityObject.setUserName(request.getParameter("userName"));
            entityObject.setUserType(request.getParameter("userType"));
            //只有新建的时候处理用户密码
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                String salt = ShiroUtil.createSalt();
                String credential = ShiroUtil.credentialSalt(request.getParameter("password"), salt);
                entityObject.setPassword(credential);
                entityObject.setSalt(salt);
            }
            entityObject.setPortalUuid(request.getParameter("portalUuid"));
            entityObject.setTheme(request.getParameter("theme"));
            entityObject.setLanguage(request.getParameter("language"));
            entityObject.setValidFrom(request.getParameter("validFrom"));
            entityObject.setValidTo(request.getParameter("validTo"));
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setCreatedBy(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
            }
            entityObject.setModifiedBy(currentUser.getUserName());
            entityObject.setModifiedDatetime(StringUtils.getDatetime());

            //判斷網頁狀態執行不同的方法
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                int_return = userService.insertData(entityObject);
            } else if (webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                int_return = userService.updateData(entityObject);
            }
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        //返回狀態
        if (int_return > 0) {
            return ConfigConst.STR_AJAX_SUCCESS;
        } else {
            return ConfigConst.STR_AJAX_ERROR;
        }
    }

    /**
     * 功能说明：修改密码
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "updatePassword.action", method = RequestMethod.POST)
    @ResponseBody
    public String updatePassword(HttpServletRequest request) {
        //获取当前用户
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        //影響行數
        int int_return = 0;
        try {
            String salt = ShiroUtil.createSalt();
            String credential = ShiroUtil.credentialSalt(request.getParameter("password"), salt);
            //操作對象
            User entityObject = new User();
            entityObject.setUuid(request.getParameter("uuid"));
            entityObject.setPassword(credential);
            entityObject.setSalt(salt);
            entityObject.setModifiedBy(currentUser.getUserName());
            entityObject.setModifiedDatetime(StringUtils.getDatetime());

            //判斷網頁狀態執行不同的方法
            int_return = userService.updatePassword(entityObject);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        //返回狀態
        if (int_return > 0) {
            return ConfigConst.STR_AJAX_SUCCESS;
        } else {
            return ConfigConst.STR_AJAX_ERROR;
        }
    }

    /**
     * 功能说明：删除数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "deleteData.action", method = RequestMethod.POST)
    @ResponseBody
    public String deleteData(@RequestParam(value = "uuids") String uuids,
                             HttpServletResponse response) {
        JSONObject result = new JSONObject();
        int int_return = 0;
        try {
            String[] arrayIds = uuids.split(",");
            int_return = userService.deleteDataBatch(arrayIds);
            //返回狀態
            if (int_return > 0) {
                result.put(ConfigConst.STR_AJAX_SUCCESS, true);
            } else {
                result.put(ConfigConst.STR_AJAX_ERROR, false);
            }
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：顯示頁面
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "gotoAddPage.action")
    public ModelAndView gotoAddPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_USER_ADD);
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
    @RequestMapping(value = "gotoUpdatePage.action")
    public ModelAndView gotoUpdatePage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_USER_UPT);
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
    @RequestMapping(value = "gotoPasswordPage.action")
    public ModelAndView gotoPasswordPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_USER_PSW);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

}
