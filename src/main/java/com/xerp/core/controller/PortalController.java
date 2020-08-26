package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Portal;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.entity.User;
import com.xerp.core.service.IPortalService;
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
 * @Author By Joseph
 * @Date:20181108
 * 用於: 門戶 CURD + 跳轉
 * */
@Log4j2
@RestController
@RequestMapping(value = "sysConfig/portal")
public class PortalController extends BaseController {

    /**Service操作對象 自動註解*/
    @Autowired
    private IPortalService serviceObject;

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
    public String listData(HttpServletResponse response, HttpServletRequest request) {
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
            List<Portal> entityObject = serviceObject.listData(pager);
            JSONObject result = new JSONObject();
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(entityObject));
            result.put("rows", jsonArray);
            result.put("total", pager.getTotal());
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error(ex.toString());
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
            Portal entityObject = serviceObject.listByUuid(uuid);
            jsonObject = JSONObject.parseObject(JSON.toJSONString(entityObject));
            StringUtils.write(response, jsonObject);
        } catch (Exception ex) {
            log.error(ex.toString());
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
    public String listByCode(@RequestParam(value = "code") String code,
                               HttpServletResponse response) {
        try {
            //獲取指定的數據對象到JSON
            JSONObject result = new JSONObject();
            List<Portal> entityObject = serviceObject.listByCode(code);
            if (entityObject.size() > 0) {
                result.put(ConfigConst.STR_AJAX_SUCCESS, true);
            } else {
                result.put(ConfigConst.STR_AJAX_ERROR, false);
            }
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error(ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：门户樹結構不分層
     * 修改说明：
     *
     * @return String ajax JSON格式
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "listZTree.action")
    @ResponseBody
    public String listZTree(HttpServletResponse response) throws Exception {
        List<TreeNode> nodeList = new ArrayList<TreeNode>();
        try {
            nodeList = serviceObject.listZTree();
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }

        //設置節點基礎信息
        nodeList = StringUtils.modifyNode(nodeList,
                ConfigConst.STR_SYSTEM_ROOT_NODE_ID, "", "portal", "false");

        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
        StringUtils.write(response, jsonArray);
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
        int int_return = 0;
        try {
            //獲取網頁狀態
            String webStatus = request.getParameter("ws");
            //操作對象
            Portal entityObject = new Portal();
            //uuid
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());
            } else if (webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                entityObject.setUuid(request.getParameter("uuid"));
            }
            entityObject.setStatus(request.getParameter("status"));
            entityObject.setPortalCode(request.getParameter("portalCode"));
            entityObject.setPortalName(request.getParameter("portalName"));
            entityObject.setComment(request.getParameter("comment"));
            entityObject.setSort(Integer.valueOf(request.getParameter("sort")));
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setCreatedBy(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
            }
            entityObject.setModifiedBy(currentUser.getUserName());
            entityObject.setModifiedDatetime(StringUtils.getDatetime());

            //判斷網頁狀態執行不同的方法
            if (webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                int_return = serviceObject.insertData(entityObject);
            } else if (webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                int_return = serviceObject.updateData(entityObject);
            }
        } catch (Exception ex) {
            log.error(ex.toString());
        }
        //返回狀態
        if (int_return > 0) {
            return ConfigConst.STR_AJAX_SUCCESS;
        } else {
            return ConfigConst.STR_AJAX_ERROR;
        }
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
        int int_return = 0;
        try {
            String arrUuids[] = uuids.split(",");
            int_return = serviceObject.deleteDataBatch(arrUuids);
            //返回狀態
            if (int_return > 0) {
                result.put(ConfigConst.STR_AJAX_SUCCESS, true);
            } else {
                result.put(ConfigConst.STR_AJAX_ERROR, false);
            }
            StringUtils.write(response, result);
        } catch (Exception ex) {
            log.error(ex.toString());
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
    @RequestMapping(value = "gotoConfPage.action")
    public ModelAndView gotoConfPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_PORTAL_CONF);
        } catch (Exception ex) {
            log.error(ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
