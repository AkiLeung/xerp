package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.Department;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.entity.User;
import com.xerp.core.service.IDepartmentService;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Author By Joseph
 * @Date:20181108 用於: 部門 CURD + 跳轉
 */
@Log4j2
@RestController
@RequestMapping(value = "sysOrg/department")
public class DepartmentController extends BaseController {

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private IDepartmentService serviceObject;

    /**
     * 用於遞歸獲取所有下級部門（包括自身）
     */
    private Set<String> uuidSet = new HashSet<String>();

    /**
     * 功能说明：获取数据by uuid
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "listByUuid.action")
    public @ResponseBody
    String listByUuid(@RequestParam(value = "uuid") String uuid,
                     HttpServletResponse response) {
        JSONArray jsonArray = null;
        try {
            //獲取指定的數據對象到JSON
            List<Department> entityObject = serviceObject.listByUuid(uuid);
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
            List<Department> entityObject = serviceObject.listByCode(code);
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
        try {
            //獲取頁面傳輸的String Json
            JSONObject jsonData = JSONObject.parseObject(strJson);
            //獲取網頁狀態
            String str_webStatus = jsonData.getString("ws");
            //操作對象
            Department entityObject = new Department();
            //uuid
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());
            } else if (str_webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                entityObject.setUuid(jsonData.getString("uuid"));
            }
            entityObject.setParentUuid(jsonData.getString("parentUuid"));
            entityObject.setStatus(jsonData.getString("status"));
            entityObject.setDepartmentCode(jsonData.getString("departmentCode"));
            entityObject.setDepartmentName(jsonData.getString("departmentName"));
            entityObject.setSupervisorCode(jsonData.getString("supervisorCode"));
            entityObject.setSupervisorName(jsonData.getString("supervisorName"));
            entityObject.setIcon("");
            entityObject.setSort(Integer.valueOf(jsonData.getString("sort")));
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setCreatedBy(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
            }
            entityObject.setModifiedBy(currentUser.getUserName());
            entityObject.setModifiedDatetime(StringUtils.getDatetime());

            //判斷網頁狀態執行不同的方法
            int int_return = 0;
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                int_return = serviceObject.insertData(entityObject);
            } else if (str_webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                int_return = serviceObject.updateData(entityObject);
            }
            //返回狀態
            JSONObject result = new JSONObject();
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
     * 功能说明：刪除公司
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
        //捕捉頁面返回的UUID
        String[] strUuids = uuids.split(",");
        //清空Set集合
        uuidSet.clear();
        try {
            //獲取所有下層的部門UUID
            for (String uuid : strUuids) {
                uuidSet.add(uuid);
                //遞歸獲取數據
                getSubDepartment(uuid);
            }
            //把所有UUID轉換成字符串數組
            String[] strAllUuids = new String[uuidSet.size() + 1];
            int index = 0;
            for (String uuid : uuidSet) {
                strAllUuids[index] = uuid;
                index = index + 1;
            }
            //執行批量刪除
            int int_return = serviceObject.deleteDataBatch(strAllUuids);
            //返回狀態
            JSONObject result = new JSONObject();
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
     * 功能说明：遞歸函數用於獲取所有下層的部門UUID
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    private void getSubDepartment(String uuid) {
        try {
            //上層的uuid作為下層的parent_uuid查詢條件
            List<Department> entityObject = serviceObject.listByParentUuid(uuid);
            //只要查詢有結果就不斷遞歸查直到最底層
            if (entityObject.size() > 0) {
                for (Department entity : entityObject) {
                    //此處使用set類型，add結果不重複
                    uuidSet.add(entity.getUuid());
                    getSubDepartment(entity.getUuid());
                }
            }
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
    }

    /**
     * 功能说明：部門樹結構分層
     * 修改说明：
     *
     * @return String ajax JSON格式
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "getAsyncZTree.action")
    @ResponseBody
    public String getAsyncZTree(HttpServletResponse response, HttpServletRequest request, String id) throws Exception {
        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        try {
            nodeList = serviceObject.departmentZTree(id);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //設置節點基礎信息
        nodeList = StringUtils.modifyNode(nodeList,
                ConfigConst.STR_SYSTEM_ROOT_NODE_ID, "", "department", "true");

        List<TreeNode> subNode;
        for (TreeNode node : nodeList) {
            subNode = serviceObject.departmentZTree(node.getId());
            if (subNode.size() > 0) {
                node.setIsParent("true");
            } else {
                node.setIsParent("false");
            }
        }

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
     * @date 20181119
     */
    @RequestMapping(value = "gotoTreePage.action")
    public ModelAndView gotoTreePage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_DEPARTMENT_TREE);
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
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_DEPARTMENT_ADD);
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
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_ORG_DEPARTMENT_UPT);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
