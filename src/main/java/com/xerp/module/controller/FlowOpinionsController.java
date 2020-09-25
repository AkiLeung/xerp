package com.xerp.module.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.User;
import com.xerp.module.entity.Opinions;
import com.xerp.module.service.IOpinionsService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
@RequestMapping(value = "opinions")
public class FlowOpinionsController extends BaseController {

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private IOpinionsService opinionsService;

    /**
     * 功能说明：获取数据by uuid
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "listDataByDocUuid.action")
    @ResponseBody
    public String listDataByDocUuid(@RequestParam(value = "docUuid") String docUuid,
                                HttpServletResponse response) {
        JSONArray jsonArray = null;
        try {
            //獲取指定的數據對象到JSON
            List<Opinions> entityObject = opinionsService.listData(docUuid);
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
     * 功能说明：保存办理意见
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "saveOpinions.action", method = RequestMethod.POST)
    @ResponseBody
    public String saveOpinions(@RequestBody String strJson,
                                 HttpServletResponse response) {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        try {
            //獲取頁面傳輸的String Json
            JSONObject jsonData = JSONObject.parseObject(strJson);
            //操作對象
            Opinions entityObject = new Opinions();
            //uuid
            entityObject.setUuid(StringUtils.createUUID());
            entityObject.setDocUuid(jsonData.getString("docUuid"));
            entityObject.setUserCode(user.getUserCode());
            entityObject.setUserName(user.getUserName());
            entityObject.setFlowFrmNodeName(jsonData.getString("flowFrmNodeName"));
            entityObject.setFlowTgtNodeName(jsonData.getString("flowTgtNodeName"));
            entityObject.setOpinions(jsonData.getString("opinions"));
            entityObject.setCreatedDatetime(StringUtils.getDatetime());
            int intReturn = opinionsService.insertData(entityObject);
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

}
