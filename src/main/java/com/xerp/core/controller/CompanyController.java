package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.Company;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.entity.User;
import com.xerp.core.service.ICompanyService;
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
 * 功能说明：公司 CURD + 跳轉
 *
 * @author Joseph
 * @date 20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysOrg/company")
public class CompanyController extends BaseController {
    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private ICompanyService serviceObject;

    /**
     * 功能说明：获取数据
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    //@RequiresPermissions(value = {AuthCodeConst.SYS_CONFIG_ADMIN + AuthCodeConst.SYS_AUTH_ALL})
    @RequestMapping(value = "listData.action")
    @ResponseBody
    public String listData(HttpServletResponse response,
                           HttpServletRequest request) {
        //日志记录
        log.info(this.getClass().getName() + "-" + Thread.currentThread().getStackTrace()[1].getMethodName());
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
            pager.setTotal(serviceObject.listCount());

            //查詢數據
            List<Company> entityObject = serviceObject.listData(pager);
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
            List<Company> entityObject = serviceObject.listByUuid(uuid);
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
        try {
            //獲取指定的數據對象到JSON
            JSONObject result = new JSONObject();
            List<Company> entityObject = serviceObject.listByCode(code);
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
    @RequestMapping(value = "saveData.action", produces = "application/json", method = RequestMethod.POST)
    @ResponseBody
    public String saveData(@RequestBody String strJson,
                           HttpServletResponse response) {
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        //影響行數
        int returnRow = 0;
        try {
            //獲取頁面傳輸的String Json
            JSONObject jsonData = JSONObject.parseObject(strJson);
            //獲取網頁狀態
            String webStatus = jsonData.getString("ws");
            //操作對象
            Company entityObject = new Company();
            //uuid
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());
            } else if (webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                entityObject.setUuid(jsonData.getString("uuid"));
            }
            entityObject.setParentUuid(jsonData.getString("parentUuid"));
            entityObject.setCompanyCode(jsonData.getString("companyCode"));
            entityObject.setCompanyName(jsonData.getString("companyName"));
            entityObject.setAddress(jsonData.getString("address"));
            entityObject.setCity(jsonData.getString("city"));
            entityObject.setCountry(jsonData.getString("country"));
            entityObject.setLanguage(jsonData.getString("language"));
            entityObject.setTelephone(jsonData.getString("telephone"));
            entityObject.setFaxNumber(jsonData.getString("faxNumber"));
            entityObject.setEmail(jsonData.getString("email"));
            entityObject.setSupervisorCode(jsonData.getString("supervisorCode"));
            entityObject.setSupervisorName(jsonData.getString("supervisorName"));
            entityObject.setComment(jsonData.getString("comment"));
            entityObject.setFactory(jsonData.getString("factory"));
            entityObject.setWarehouse(jsonData.getString("warehouse"));
            entityObject.setSort(Integer.valueOf(jsonData.getString("sort")));
            entityObject.setStatus(jsonData.getString("status"));
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setCreatedBy(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
            }
            entityObject.setModifiedBy(currentUser.getUserName());
            entityObject.setModifiedDatetime(StringUtils.getDatetime());

            //判斷網頁狀態執行不同的方法
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                returnRow = serviceObject.insertData(entityObject);
            } else if (webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                returnRow = serviceObject.updateData(entityObject);
            }
            //返回狀態
            JSONObject result = new JSONObject();
            if (returnRow > 0) {
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
        try {
            JSONObject result = new JSONObject();
            int int_return = 0;
            String[] strUuids = uuids.split(",");
            int_return = serviceObject.deleteDataBatch(strUuids);
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
     * 功能说明：公司樹結構分層
     * 修改说明：
     *
     * @return String ajax JSON格式
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getZTree.action")
    @ResponseBody
    public String getZTree(HttpServletResponse response, HttpServletRequest request) throws Exception {

        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        try {
            nodeList = serviceObject.companyZTree();
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //設置節點基礎信息
        nodeList = StringUtils.modifyNode(nodeList, "", "", "company", "");

        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
        StringUtils.write(response, jsonArray);
        return null;
    }


    /**
     * 功能说明：公司樹結構不分層
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
            nodeList = serviceObject.companyListZTree();
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //設置節點基礎信息
        nodeList = StringUtils.modifyNode(nodeList,
                ConfigConst.STR_SYSTEM_ROOT_NODE_ID, "", "company", "true");

        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
        StringUtils.write(response, jsonArray);
        return null;
    }

    /**
     * 功能说明：公司樹結構不分層
     * 修改说明：
     *
     * @return String ajax JSON格式
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getListZTreeByUuid.action")
    @ResponseBody
    public String getListZTreeByCmpUuid(HttpServletResponse response,
                                        HttpServletRequest request) throws Exception {
        String cmpUuid = request.getParameter("cmpUuid");
        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        try {
            nodeList = serviceObject.companyListZTreeByUuid(cmpUuid);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //設置節點基礎信息
        nodeList = StringUtils.modifyNode(nodeList,
                ConfigConst.STR_SYSTEM_ROOT_NODE_ID, "", "company", "true");

        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
        StringUtils.write(response, jsonArray);
        return null;
    }

    /**
     * 功能说明：公司樹結構不分層-启用工厂
     * 修改说明：
     *
     * @return String ajax JSON格式
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getListFactoryZTree.action")
    @ResponseBody
    public String getListFactoryZTree(HttpServletResponse response,
                                      HttpServletRequest request) throws Exception {
        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        try {
            nodeList = serviceObject.companyFactoryZTree();
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //設置節點基礎信息
        nodeList = StringUtils.modifyNode(nodeList,
                ConfigConst.STR_SYSTEM_ROOT_NODE_ID, "", "company", "true");

        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
        StringUtils.write(response, jsonArray);
        return null;
    }

    /**
     * 功能说明：公司樹結構不分層-启用貨倉
     * 修改说明：
     *
     * @return String ajax JSON格式
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getListWarehouseZTree.action")
    @ResponseBody
    public String getListWarehouseZTree(HttpServletResponse response, HttpServletRequest request) throws Exception {

        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        try {
            nodeList = serviceObject.companyWarehouseZTree();
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //設置節點基礎信息
        nodeList = StringUtils.modifyNode(nodeList,
                ConfigConst.STR_SYSTEM_ROOT_NODE_ID, "", "company", "true");

        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
        StringUtils.write(response, jsonArray);
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
    @RequestMapping(value = "gotoConfPage.action")
    public ModelAndView gotoConfPage(HttpServletRequest request) {
        try {
            String webStatus = request.getParameter("ws");
            modelAndView = new ModelAndView();
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_COMPANY_CONF + "?ws=" + webStatus);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
