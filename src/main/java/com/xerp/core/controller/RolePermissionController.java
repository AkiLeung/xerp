package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.RolePermission;
import com.xerp.core.entity.User;
import com.xerp.core.service.IRolePermissionService;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 功能說明：用於:角色模塊
 *
 * @Author By Joseph
 * @Date:20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysConfig/rolePermission")
public class RolePermissionController extends BaseController {

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private IRolePermissionService serviceObject;

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
    public String listData(@RequestParam(value = "roleCode") String roleCode,
                           HttpServletResponse response,
                           HttpServletRequest request) {
        //查詢數據
        try {
            Integer listCount = serviceObject.listCount(roleCode);
            PageModel pager = StringUtils.getPager(request, listCount);
            pager.setCondition01(roleCode);
            List<RolePermission> dataList = serviceObject.listData(pager);
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(dataList));
            StringUtils.writePager(response, listCount, jsonArray);
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
        //影響行數
        int returnRow = 0;
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        JSONObject result = new JSONObject();
        try {
            //獲取頁面傳輸的String Json
            JSONObject jsonData = JSONObject.parseObject(strJson);
            String roleCode = jsonData.getString("roleCode");
            String[] permissionCodes = jsonData.getString("permissionCodes").split(",");
            //循环插入数据
            int check = 0;
            for (int i = 0; i < permissionCodes.length; i++) {
                check = serviceObject.listByCode(roleCode,permissionCodes[i]);
                if(check == 0) {
                    //操作對象
                    RolePermission entityObject = new RolePermission();
                    entityObject.setUuid(StringUtils.createUUID());
                    entityObject.setRoleCode(roleCode);
                    entityObject.setPermissionCode(permissionCodes[i]);
                    entityObject.setCreatedBy(currentUser.getUserName());
                    entityObject.setCreatedDatetime(StringUtils.getDatetime());
                    returnRow = +serviceObject.insertData(entityObject);
                }
            }
            //返回狀態
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
        JSONObject result = new JSONObject();
        int intReturn;
        try {
            String[] strUuids = uuids.split(",");
            intReturn = serviceObject.deleteDataBatch(strUuids);
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
     * 功能说明：顯示頁面
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181119
     */
    @RequestMapping(value = "gotoAssignPage.action")
    public ModelAndView gotoConfPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_ROLE_PERMISSION_ASSIGN);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
