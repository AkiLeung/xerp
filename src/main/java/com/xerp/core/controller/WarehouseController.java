package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.entity.User;
import com.xerp.core.entity.Warehouse;
import com.xerp.core.service.IWarehouseService;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能说明：貨倉：CURD+跳轉
 * @Author By Joseph
 * @Date:20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysOrg/warehouse")
public class WarehouseController extends BaseController {
    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private IWarehouseService iWarehouseService;

    /**
     * 功能说明：樹結構分層
     * 修改说明：
     *
     * @return String ajax JSON格式
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getAsyncZTree.action")
    @ResponseBody
    public String getAsyncZTree(HttpServletResponse response, String id) throws Exception {
        List<TreeNode> nodeList = new ArrayList<TreeNode>();

        try {
            nodeList = iWarehouseService.warehouseZTree(id);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //設置節點基礎信息
        nodeList = StringUtils.modifyNode(nodeList,
                ConfigConst.STR_SYSTEM_ROOT_NODE_ID, "", "warehouse", "false");

        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
        StringUtils.write(response, jsonArray);
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
        JSONArray jsonArray = null;
        try {
            //獲取指定的數據對象到JSON
            List<Warehouse> entityObject = iWarehouseService.listByUuid(uuid);
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
     * 功能说明：获取数据by Code
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "listByCode.action")
    @ResponseBody
    public String listByCode(@RequestParam(value = "code") String code,
                            HttpServletResponse response) {
        //獲取指定的數據對象到JSON
        JSONObject result = new JSONObject();
        try {
            List<Warehouse> entityObject = iWarehouseService.listByCode(code);
            if (entityObject != null) {
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
    public String saveData(@RequestBody String strJson,
                           HttpServletResponse response, HttpServletRequest request) {
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        //影響行數
        int int_return = 0;
        try {
            //獲取頁面傳輸的String Json
            JSONObject jsonData = JSONObject.parseObject(strJson);
            //獲取網頁狀態
            String str_webStatus = jsonData.getString("ws");
            //操作對象
            Warehouse entityObject = new Warehouse();
            //uuid
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());
            } else if (str_webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                entityObject.setUuid(jsonData.getString("uuid"));
            }
            entityObject.setCompanyUuid(jsonData.getString("parentUuid"));
            entityObject.setWarehouseCode(jsonData.getString("warehouseCode"));
            entityObject.setWarehouseName(jsonData.getString("warehouseName"));
            entityObject.setAddress(jsonData.getString("address"));
            entityObject.setComment(jsonData.getString("comment"));
            entityObject.setSort(Integer.valueOf(jsonData.getString("sort")));
            entityObject.setStatus(jsonData.getString("status"));
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setCreatedBy(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
            }
            entityObject.setModifiedBy(currentUser.getUserName());
            entityObject.setModifiedDatetime(StringUtils.getDatetime());

            //判斷網頁狀態執行不同的方法
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                int_return = iWarehouseService.insertData(entityObject);
            } else if (str_webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                int_return = iWarehouseService.updateData(entityObject);
            }

            JSONObject result = new JSONObject();
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
     * 功能说明：刪除數據
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "deleteData.action", method = RequestMethod.POST)
    @ResponseBody
    public String deleteData(@RequestParam(value = "uuids") String uuids,
                             HttpServletResponse response, HttpServletRequest request) {
        JSONObject result = new JSONObject();
        int int_return = 0;
        try {
            String[] strUuids = uuids.split(",");
            int_return = iWarehouseService.deleteDataBatch(strUuids);
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
     * @date 20181119
     */
    @RequestMapping(value = "gotoTreePage.action")
    public ModelAndView gotoTreePage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_WAREHOUSE_TREE);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
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
     * @date 20181119
     */
    @RequestMapping(value = "gotoAddPage.action")
    public ModelAndView gotoAddPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_WAREHOUSE_ADD);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
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
     * @date 20181119
     */
    @RequestMapping(value = "gotoUptPage.action")
    public ModelAndView gotoUptPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_WAREHOUSE_UPT);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
