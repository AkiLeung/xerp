package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.SysLog;
import com.xerp.core.service.ISysLogService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 功能说明：日志 CURD+跳轉
 *
 * @Author By Joseph
 * @Date:20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysConfig/sysLog")
public class SysLogController extends BaseController {

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private ISysLogService sysLogService;

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
    public String listData(HttpServletResponse response,
                           HttpServletRequest request) {
        try {
            Integer listCount = sysLogService.listCount();
            PageModel pager = StringUtils.getPager(request,listCount);
            List<SysLog> logList  = sysLogService.listData(pager);
            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(logList));
            StringUtils.writePager(response, listCount,jsonArray);
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
    @RequestMapping(value = "getByLogId.action")
    @ResponseBody
    public String listByUuid(@RequestParam(value = "logId") String logId,
                             HttpServletResponse response) {
        JSONObject jsonObject = null;
        try {
            //獲取指定的數據對象到JSON
            SysLog entityObject = sysLogService.listByLogId(logId);
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
     * 功能说明：顯示頁面
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "gotoDetailPage.action")
    public ModelAndView gotoConfPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_SYSTEM_DETAIL);
        } catch (Exception ex) {
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
