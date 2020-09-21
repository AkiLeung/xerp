package com.xerp.module.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.*;
import com.xerp.core.service.*;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能說明：用於:流程 CURD + 跳轉
 *
 * @Author By Joseph
 * @Date:20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "flowData")
public class FlowConfigurationController extends BaseController {

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
     * Service操作對象 自動註解:环节信息
     */
    @Autowired
    private IFlowNodeHandlerService flowNodeHandlerService;

    /**
     * Service操作對象 自動註解:流向信息
     */
    @Autowired
    private IFlowDirectionService flowDirectionService;

    /**
     * Service操作對象 自動註解:角色人员
     */
    @Autowired
    private IRoleUserService roleUserService;

    /**
     * 功能说明：获取数据by FlowCode
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getFlowByCode.action")
    @ResponseBody
    public String getFlowByCode(@RequestParam(value = "flowCode") String flowCode,
                                HttpServletResponse response) {

        JSONArray jsonArray = null;
        try {
            //獲取指定的數據對象到JSON
            List<FlowName> entityObject = flowNameService.listByCode(flowCode);
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
     * 功能说明：获取数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getNodesByFlowUuid.action")
    @ResponseBody
    public String getNodesByFlowUuid(HttpServletResponse response,
                                     HttpServletRequest request) {
        try {
            //流程uuid
            String flowUuid = request.getParameter("flowUuid");
            List<FlowNode> entityObject = flowNodeService.listData(flowUuid);
            JSONObject result = new JSONObject();
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            result.put("rows", jsonArray);
            result.put("total", entityObject.size());
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：获取数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getNodeByNodeUuid.action")
    @ResponseBody
    public String getNodeByNodeUuid(HttpServletResponse response,
                                    HttpServletRequest request) {
        try {
            //流程uuid
            String nodeUuid = request.getParameter("nodeUuid");
            List<FlowNode> entityObject = flowNodeService.listByUuid(nodeUuid);
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            StringUtils.write(response, jsonArray);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：获取数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getStartNodeByFlowUuid.action")
    @ResponseBody
    public String getStartNodeByFlowUuid(@RequestParam(value = "flowUuid") String flowUuid,
                                         HttpServletResponse response) {
        try {
            //流程uuid
            List<FlowNode> entityObject = flowNodeService.getStartNodeByFlowUuid(flowUuid);
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            StringUtils.write(response, jsonArray);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
    }


    /**
     * 功能说明：获取数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20201108
     */
    @RequestMapping(value = "flowDirection.action")
    @ResponseBody
    public String flowDirection(@RequestParam(value = "flowUuid") String flowUuid,
                                @RequestParam(value = "nodeUuid") String nodeUuid,
                                HttpServletResponse response) {
        try {
            List<FlowDirection> entityObject = flowDirectionService.listData(flowUuid, nodeUuid);
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            StringUtils.write(response, jsonArray);
        } catch (Exception ex) {
            log.error("XERP Exception：" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：获取数据-多人会签
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20201108
     */
    @RequestMapping(value = "flowMultipleHandlerByNode.action")
    @ResponseBody
    public String flowMultipleHandlerByNode(@RequestParam(value = "nodeUuid") String nodeUuid,
                                            HttpServletResponse response) {
        try {
            List<FlowNodeHandler> flowNodeHandlers = new ArrayList<FlowNodeHandler>();
            List<FlowNode> flowNodes = flowNodeService.listByUuid(nodeUuid);
            if (flowNodes != null) {
                FlowNode flowNode = flowNodes.get(0);
                FlowNodeHandler flowNodeHandler;
                //指定办理人
                if (flowNode.getHandlerCode() != null && !flowNode.getHandlerCode().trim().equals("")) {
                    flowNodeHandler = new FlowNodeHandler();
                    flowNodeHandler.setUuid(StringUtils.createUUID());
                    flowNodeHandler.setHandlerCode(flowNode.getHandlerCode());
                    flowNodeHandler.setHandlerName(flowNode.getHandlerName());
                    flowNodeHandlers.add(flowNodeHandler);
                }
            }

            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(flowNodeHandlers));
            StringUtils.write(response, jsonArray);
        } catch (Exception ex) {
            log.error("XERP Exception：" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：获取数据-独立办理人
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20201108
     */
    @RequestMapping(value = "flowSingleHandlerByNode.action")
    @ResponseBody
    public String flowSingleHandlerByNode(@RequestParam(value = "nodeUuid") String nodeUuid,
                                          HttpServletResponse response) {
        try {
            List<FlowNodeHandler> flowNodeHandlers = flowNodeHandlerService.listData(nodeUuid);
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(flowNodeHandlers));
            StringUtils.write(response, jsonArray);
        } catch (Exception ex) {
            log.error("XERP Exception：" + ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：获取数据-角色办理人
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20201108
     */
    @RequestMapping(value = "flowRoleHandlerByCode.action")
    @ResponseBody
    public String flowRoleHandlerByCode(@RequestParam(value = "roleCode") String roleCode,
                                        HttpServletResponse response) {
        try {
            List<FlowNodeHandler> flowNodeHandlers = new ArrayList<FlowNodeHandler>();
            List<RoleUser> roleUsers = roleUserService.listDataByCode(roleCode);
            if (roleUsers.size() > 0) {
                FlowNodeHandler flowNodeHandler;
                for (RoleUser roleUser : roleUsers) {
                    flowNodeHandler = new FlowNodeHandler();
                    flowNodeHandler.setUuid(StringUtils.createUUID());
                    flowNodeHandler.setHandlerCode(roleUser.getUserCode());
                    flowNodeHandler.setHandlerName(roleUser.getUserName());
                    flowNodeHandlers.add(flowNodeHandler);
                }
            }
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(flowNodeHandlers));
            StringUtils.write(response, jsonArray);
        } catch (Exception ex) {
            log.error("XERP Exception：" + ex.toString());
        }
        return null;
    }
}
