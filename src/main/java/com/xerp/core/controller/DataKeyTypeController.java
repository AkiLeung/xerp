package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.DataKeyType;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IDataKeyTypeService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


/**
 * 功能说明：後台配置-數據字典 CURD+頁面跳轉
 *
 * @author Joseph
 * @date 20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysConfig/dataType")
public class DataKeyTypeController extends BaseController {

    /**
     * 视图模型
     */
    private ModelAndView modelAndView = super.modelAndView;

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private IDataKeyTypeService serviceObject;

    /**
     * 功能说明：樹結構分層
     * 修改说明：
     *
     * @return String ajax JSON格式
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getListZTree.action")
    @ResponseBody
    public String getListZTree(HttpServletResponse response, HttpServletRequest request) throws Exception {
        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        try {
            nodeList = serviceObject.dataKeyTypeZTree();
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //設置節點基礎信息
        nodeList = StringUtils.modifyNode(nodeList,
                ConfigConst.STR_SYSTEM_ROOT_NODE_ID, "", "dataType", "true");

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
    @RequestMapping(value = "listByTypeCode.action")
    public @ResponseBody
    String listByTypeCode(@RequestParam(value = "code") String code,
                                 HttpServletResponse response) {
        JSONObject jsonObject = null;
        try {
            //獲取指定的數據對象到JSON
            DataKeyType entityObject = serviceObject.listByTypeCode(code);
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
    public @ResponseBody
    String listByCode(@RequestParam(value = "code") String code,
                             HttpServletResponse response) {
        try {
            //獲取指定的數據對象到JSON
            JSONObject result = new JSONObject();
            List<DataKeyType> entityObject = serviceObject.listByCode(code);
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
    public String saveData(@RequestBody String strJson,
                           HttpServletResponse response) {
        try {
            //獲取頁面傳輸的String Json
            JSONObject jsonData = JSONObject.parseObject(strJson);
            //獲取網頁狀態
            String webStatus = jsonData.getString("ws");
            //操作對象
            DataKeyType entityObject = new DataKeyType();
            //uuid
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());
            } else if (webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                entityObject.setUuid(jsonData.getString("uuid"));
            }
            entityObject.setStatus(jsonData.getString("status"));
            entityObject.setTypeCode(jsonData.getString("typeCode"));
            entityObject.setTypeName(jsonData.getString("typeName"));
            entityObject.setSort(Integer.valueOf(jsonData.getString("sort")));

            //判斷網頁狀態執行不同的方法
            int int_return = 0;
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                int_return = serviceObject.insertData(entityObject);
            } else if (webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                int_return = serviceObject.updateData(entityObject);
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
     * 功能说明：刪除数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "deleteDataByTypeCode.action", method = RequestMethod.POST)
    @ResponseBody
    public String deleteData(@RequestParam(value = "typeCode") String typeCode,
                             HttpServletResponse response) {
        try {
            JSONObject result = new JSONObject();
            //刪除結果
            int int_return = 0;
            int_return = serviceObject.deleteDataByTypeCode(typeCode);
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
     * 功能说明：顯示頁面-新增
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181209
     */
    @RequestMapping(value = "gotoAddPage.action")
    public ModelAndView gotoAddPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_DATA_KEY_TYPE_ADD);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 功能说明：顯示頁面-修改
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181209
     */
    @RequestMapping(value = "gotoUptPage.action")
    public ModelAndView gotoUptPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_DATA_KEY_TYPE_UPT);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
