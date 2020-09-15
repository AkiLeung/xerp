package com.xerp.module.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.User;
import com.xerp.module.entity.Vacation;
import com.xerp.module.service.IVacationService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 功能說明: 主页面映射路径
 *
 * @Author By Joseph
 * @Date:20181108
 */
@Slf4j
@RestController
@RequestMapping(value = "vacation")
public class FlowVacationController extends BaseController {

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private IVacationService vacationService;


    /**
     * 功能说明：请假流程-菜单
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "leftMenu.action")
    public ModelAndView leftMenu() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_LEFT_MENU);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：请假流程-起草
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "mainForm.action")
    public ModelAndView mainForm() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_MAIN_FORM);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：请假流程-待处理
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "toHandleList.action")
    public ModelAndView toHandleList() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_TO_HANDLE);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }


    /**
     * 功能说明：获取数据by uuid
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getDataByUuid.action")
    @ResponseBody
    public String getDataByUuid(@RequestParam(value = "uuid") String uuid,
                                HttpServletResponse response) {
        JSONArray jsonArray = null;
        try {
            //獲取指定的數據對象到JSON
            List<Vacation> entityObject = vacationService.listByUuid(uuid);
            jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            StringUtils.write(response, jsonArray);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //返回狀態
        if (jsonArray != null) {
            return ConfigConst.STR_AJAX_SUCCESS;
        } else {
            return ConfigConst.STR_AJAX_ERROR;
        }
    }

    /**
     * 功能说明：保存数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "draftDocument.action")
    public ModelAndView draftDocument(HttpServletResponse response,
                                      HttpServletRequest request) {
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        try {
            //獲取頁面傳輸的String Json
//            JSONObject jsonData = JSONObject.parseObject(strJson);
            //獲取網頁狀態
            String webStatus = ConfigConst.STR_WS_CREATE; //jsonData.getString("ws");
//            //流程编码
//            String flowCode = jsonData.getString("flowCode");
            //操作對象
            Vacation entityObject = new Vacation();
            //uuid
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());
                entityObject.setBillNumber("草稿");
                entityObject.setSubject("请假流程");
                entityObject.setMessage("");
                entityObject.setFlowUuid("1");
                entityObject.setFlowName("2");
                entityObject.setFlowNodeUuid("3");
                entityObject.setFlowNodeType("4");
                entityObject.setFlowNodeNum("5");
                entityObject.setFlowNodeNam("6");
                entityObject.setFlowCreatorNum(currentUser.getUserCode());
                entityObject.setFlowCreatorNam(currentUser.getUserName());
                entityObject.setCurHandlerNum(currentUser.getUserCode());
                entityObject.setCurHandlerNam(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
                entityObject.setUpdatedDatetime(StringUtils.getDatetime());
            }
            //判斷網頁狀態執行不同的方法
            int intReturn = 0;
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                intReturn = vacationService.insertData(entityObject);
            }
            System.out.println("新增结果：" + intReturn);
            //返回狀態
            //if (intReturn > 0) {
            modelAndView = new ModelAndView();
            modelAndView.addObject("docUuid", entityObject.getUuid());
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_MAIN_FORM);
            //}
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return modelAndView;
    }

    /**
     * 功能说明：保存数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "saveDocument.action", method = RequestMethod.POST)
    @ResponseBody
    public String saveDocument(@RequestBody String strJson,
                               HttpServletResponse response,
                               HttpServletRequest request) {
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        try {
            //獲取頁面傳輸的String Json
            JSONObject jsonData = JSONObject.parseObject(strJson);
            //獲取網頁狀態
            String webStatus = jsonData.getString("ws");

            //操作對象
            Vacation entityObject = new Vacation();
            //uuid
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());

            } else if (webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                entityObject.setUuid(jsonData.getString("uuid"));
            }
//            entityObject.setParentUuid(jsonData.getString("parentUuid"));
//            entityObject.setStatus(jsonData.getString("status"));
//            entityObject.setUnitCode(jsonData.getString("unitCode"));
//            entityObject.setUnitName(jsonData.getString("unitName"));
//            entityObject.setSupervisorCode(jsonData.getString("supervisorCode"));
//            entityObject.setSupervisorName(jsonData.getString("supervisorName"));
//            entityObject.setIcon("");
//            entityObject.setSort(Integer.valueOf(jsonData.getString("sort")));
//            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
//                entityObject.setCreatedBy(currentUser.getUserName());
//                entityObject.setCreatedDatetime(StringUtils.getDatetime());
//            }
//            entityObject.setModifiedBy(currentUser.getUserName());
//            entityObject.setModifiedDatetime(StringUtils.getDatetime());
//
//            //判斷網頁狀態執行不同的方法
            int intReturn = 0;
//            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
//                int_return = vacationService.insertData(entityObject);
//            } else if (str_webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
//                int_return = vacationService.updateData(entityObject);
//            }

            JSONObject result = new JSONObject();
            //返回狀態
            if (intReturn > 0) {
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


}
