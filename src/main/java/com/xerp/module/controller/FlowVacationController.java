package com.xerp.module.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.FlowName;
import com.xerp.core.entity.FlowNode;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.User;
import com.xerp.core.service.IBillNumberService;
import com.xerp.core.service.IFlowNameService;
import com.xerp.core.service.IFlowNodeService;
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
     * Service操作對象 单号
     */
    @Autowired
    private IBillNumberService billNumberService;

    /**
     * Service操作對象 自動註解:流程信息
     */
    @Autowired
    private IFlowNameService flowNameService;

    /**
     * Service操作對象 自動註解:环节信息
     */
    @Autowired
    private IFlowNodeService flowNodeService;

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
    public ModelAndView mainForm(HttpServletRequest request) {
        modelAndView = new ModelAndView();
        try {
            //流程编码
            String docUuid = request.getParameter("uuid");
            String flowCode = request.getParameter("flowCode");
            modelAndView.addObject("docUuid", docUuid);
            modelAndView.addObject("flowCode", flowCode);
            modelAndView.addObject("ws", ConfigConst.STR_WS_UPDATE);
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_MAIN_FORM);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：请假流程-待处理页面
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
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_TO_HANDLE_LIST);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：获取数据--待处理页面
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "listDataToHandler.action")
    @ResponseBody
    public String listDataToHandler(HttpServletResponse response,
                                    HttpServletRequest request) {
        try {
            User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
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
            pager.setTotal(vacationService.listCountToHandler(currentUser.getUserCode()));
            pager.setCondition01(currentUser.getUserCode());
            //查詢數據
            List<Vacation> entityObject = vacationService.listDataToHandler(pager);
            JSONObject result = new JSONObject();
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            result.put("rows", jsonArray);
            result.put("total", pager.getTotal());
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：请假流程-我的申请
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "toMyApplyList.action")
    public ModelAndView toMyApplyList() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_MY_APPLY_LIST);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：获取数据--待处理页面
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "listDataToMyApply.action")
    @ResponseBody
    public String listDataToMyApply(HttpServletResponse response,
                                    HttpServletRequest request) {
        try {
            User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
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
            pager.setTotal(vacationService.listCountToMyApply(currentUser.getUserCode()));
            pager.setCondition01(currentUser.getUserCode());
            //查詢數據
            List<Vacation> entityObject = vacationService.listDataToMyApply(pager);
            JSONObject result = new JSONObject();
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            result.put("rows", jsonArray);
            result.put("total", pager.getTotal());
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：请假流程-所有申请
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "toAllApplyList.action")
    public ModelAndView toAllApplyList() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_ALL_APPLY_LIST);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：获取数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "listDataToAllApply.action")
    @ResponseBody
    public String listDataToAllApply(HttpServletResponse response,
                                  HttpServletRequest request) {
        try {
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
            pager.setTotal(vacationService.listCountToAllApply());
            //查詢數據
            List<Vacation> entityObject = vacationService.listDataToAllApply(pager);
            JSONObject result = new JSONObject();
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            result.put("rows", jsonArray);
            result.put("total", pager.getTotal());
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }


    /**
     * 功能说明：请假流程-未完成
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "toUnFinishList.action")
    public ModelAndView toUnFinishList() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_UN_FINISH_LIST);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：获取数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "listDataToUnFinish.action")
    @ResponseBody
    public String listDataToUnFinish(HttpServletResponse response,
                                     HttpServletRequest request) {
        try {
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
            pager.setTotal(vacationService.listCountToUnFinish());
            //查詢數據
            List<Vacation> entityObject = vacationService.listDataToUnFinish(pager);
            JSONObject result = new JSONObject();
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            result.put("rows", jsonArray);
            result.put("total", pager.getTotal());
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：请假流程-已完成
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "toIsFinishList.action")
    public ModelAndView toIsFinishList() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_IS_FINISH_LIST);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：获取数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "listDataToIsFinish.action")
    @ResponseBody
    public String listDataToIsFinish(HttpServletResponse response,
                                     HttpServletRequest request) {
        try {
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
            pager.setTotal(vacationService.listCountToIsFinish());
            //查詢數據
            List<Vacation> entityObject = vacationService.listDataToIsFinish(pager);
            JSONObject result = new JSONObject();
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            result.put("rows", jsonArray);
            result.put("total", pager.getTotal());
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：请假流程-数据维护01
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20200826
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_USER_TYPE_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "dataTest01.action")
    public ModelAndView dataTest01() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_DATA_TEST01_LIST);
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
    public ModelAndView draftDocument(HttpServletRequest request) {
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        try {
            //獲取網頁狀態
            String webStatus = request.getParameter("ws");
            //流程编码
            String flowCode = request.getParameter("flowCode");
            List<FlowName> arrFList = flowNameService.listByCode(flowCode);

            //操作對象
            Vacation entityObject = new Vacation();
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());
                entityObject.setBillNumber("");
                FlowName flowName = arrFList.get(0);
                entityObject.setFlowUuid(flowName.getUuid());
                entityObject.setFlowName(flowName.getFlowName());
                entityObject.setSubject(flowName.getFlowName());
                List<FlowNode> arrNList = flowNodeService.getStartNodeByFlowUuid(flowName.getUuid());
                FlowNode flowNode = arrNList.get(0);
                entityObject.setFlowNodeUuid(flowNode.getUuid());
                entityObject.setFlowNodeType(flowNode.getNodeType());
                entityObject.setFlowNodeCode(flowNode.getNodeCode());
                entityObject.setFlowNodeName(flowNode.getNodeName());
                entityObject.setFlowCreatorCode(currentUser.getUserCode());
                entityObject.setFlowCreatorName(currentUser.getUserName());
                entityObject.setCurHandlerCode(currentUser.getUserCode());
                entityObject.setCurHandlerName(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
                entityObject.setUpdatedDatetime(StringUtils.getDatetime());
            }
            //判斷網頁狀態執行不同的方法
            int intReturn = 0;
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                intReturn = vacationService.insertData(entityObject);
            }
            //返回狀態
            if (intReturn > 0) {
                modelAndView = new ModelAndView();
                modelAndView.addObject("docUuid", entityObject.getUuid());
                modelAndView.addObject("flowCode", flowCode);
                modelAndView.addObject("ws", ConfigConst.STR_WS_UPDATE);
                modelAndView.setViewName(UrlPathConst.STR_FLOW_VACATION_MAIN_FORM);
            }
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return modelAndView;
    }

    /**
     * 功能说明：提交流程
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "submitFlowData.action", method = RequestMethod.POST)
    @ResponseBody
    public String submitFlowData(@RequestBody String strJson,
                                 HttpServletResponse response) {
        try {
            //獲取頁面傳輸的String Json
            JSONObject jsonData = JSONObject.parseObject(strJson);
            //操作對象
            Vacation entityObject = new Vacation();
            //uuid
            entityObject.setUuid(jsonData.getString("uuid"));
            String curFlowNodeType = jsonData.getString("flowNodeTypeC");
            String tagFlowNodeType = jsonData.getString("flowNodeTypeN");
            String billNumber = jsonData.getString("billNumber");
            if (!tagFlowNodeType.equals(curFlowNodeType) && StringUtils.isEmpty(billNumber) ) {
                //当前是起草环节提高，并且单号为空才创建新单号，反之
                if (tagFlowNodeType.equals(ConfigConst.STR_FLOW_TASK_NUM)
                        ||  tagFlowNodeType.equals(ConfigConst.STR_FLOW_NODE_NUM)) {
                    billNumber = billNumberService.generateBillNumber("HR-FLW-000001");
                    entityObject.setBillNumber(billNumber);
                }
            } else {
                entityObject.setMessage(billNumber);
            }
            entityObject.setMessage(jsonData.getString("message"));
            //流程控制参数
            entityObject.setFlowNodeUuid(jsonData.getString("flowNodeUuid"));
            entityObject.setFlowNodeType(jsonData.getString("flowNodeTypeN"));
            entityObject.setFlowNodeCode(Integer.valueOf(jsonData.getString("flowNodeCode")));
            entityObject.setFlowNodeName(jsonData.getString("flowNodeName"));
            entityObject.setCurHandlerCode(jsonData.getString("curHandlerCode"));
            entityObject.setCurHandlerName(jsonData.getString("curHandlerName"));
            entityObject.setUpdatedDatetime(StringUtils.getDatetime());

            int intReturn = vacationService.updateData(entityObject);
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


    /**
     * 功能说明：刪除数据
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
        int int_return;
        try {
            String[] strUuids = uuids.split(",");
            int_return = vacationService.deleteDataBatch(strUuids);
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
}
