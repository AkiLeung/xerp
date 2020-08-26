package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.SysInfo;
import com.xerp.core.entity.User;
import com.xerp.core.service.ISysInfoService;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 功能说明：系统信息维护
 *
 * @Author By Joseph
 * @Date:20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysConfig/sysInfo")
public class SysInfoController extends BaseController {

    /**
     * 视图模型
     */
    private ModelAndView modelAndView = super.modelAndView;

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private ISysInfoService serviceObject;

    /**
     * 功能说明：获取数据by uuid
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "listByDefault.action")
    @ResponseBody
    public String listByDefault(HttpServletResponse response) {
        JSONObject jsonObject = null;
        try {
            //獲取指定的數據對象到JSON
            SysInfo entityObject = serviceObject.listByDefault();
            if(entityObject==null){
                entityObject = new SysInfo();
                entityObject.setSysName("System Name..");
                entityObject.setSysMotto("Company Motto..");
            }
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
        //当前用户
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        //影響行數
        int int_return = 0;
        try {
            //獲取網頁狀態
            String uuid = request.getParameter("uuid");
            //操作對象
            SysInfo entityObject = new SysInfo();
            //uuid
            if (StringUtils.isEmpty(uuid)) {
                entityObject.setUuid(StringUtils.createUUID());
            } else {
                entityObject.setUuid(uuid);
            }
            entityObject.setSysName(request.getParameter("sysName"));
            entityObject.setSysMotto(request.getParameter("sysMotto"));
            if (StringUtils.isEmpty(uuid)) {
                entityObject.setCreatedBy(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
            }
            entityObject.setModifiedBy(currentUser.getUserName());
            entityObject.setModifiedDatetime(StringUtils.getDatetime());

            //判斷網頁狀態執行不同的方法
            if (StringUtils.isEmpty(uuid)) {
                int_return = serviceObject.insertData(entityObject);
            } else {
                int_return = serviceObject.updateData(entityObject);
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
}
