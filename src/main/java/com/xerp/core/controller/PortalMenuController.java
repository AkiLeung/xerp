package com.xerp.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xerp.base.BaseController;
import com.xerp.common.consts.ConfigConst;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.*;
import com.xerp.core.service.IMenuModuleService;
import com.xerp.core.service.IMenuOptionService;
import com.xerp.core.service.IPortalMenuService;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 功能說明：門戶菜單 CURD + 跳轉
 *
 * @Author By Joseph
 * @Date:20181108
 */
@Log4j2
@RestController
@RequestMapping(value = "sysConfig/portalMenu")
public class PortalMenuController extends BaseController {

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private IPortalMenuService serviceObject;

    @Autowired
    private IMenuModuleService menuModuleInfoService;

    @Autowired
    private IMenuOptionService menuOptionInfoService;

    /**
     * 用於遞歸獲取所有下級部門（包括自身）
     */
    private Set<String> uuidSet = new HashSet<String>();

    /**
     * 功能说明：获取数据 by portal uuid
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "listZTree.action")
    @ResponseBody
    public String listZTree(HttpServletResponse response,
                           HttpServletRequest request) {
        List<TreeNode> nodeList;
        try {
            String portalUuid = request.getParameter("portalUuid");
            nodeList = serviceObject.portalMenuZTree(portalUuid);

            //設置節點基礎信息
            nodeList = StringUtils.modifyNode(nodeList, "", "", "", "");

            JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(nodeList));
            StringUtils.write(response, jsonArray);
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
        //獲取指定的數據對象到JSON
        try {
            PortalMenu entityObject = serviceObject.listByUuid(uuid);
            JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(entityObject));
            StringUtils.write(response, jsonObject);
            //返回狀態
            if (jsonObject != null) {
                return ConfigConst.STR_AJAX_SUCCESS;
            } else {
                return ConfigConst.STR_AJAX_ERROR;
            }
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
        return null;
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
            List<PortalMenu> entityObject = serviceObject.listByCode(code);
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
     * 功能说明：拷貝門戶菜單
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "copyStandardMenu.action", method = RequestMethod.POST)
    @ResponseBody
    public String copyStandardMenu(HttpServletResponse response,
                                   HttpServletRequest request) throws Exception {
        //获取当前用户
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        String moduleUuid;
        String portalUuid = request.getParameter("portalUuid");
        List<MenuModule> listModule = menuModuleInfoService.listData();
        //循環每一個模塊拷貝對應的所有功能菜單
        int int_return = 0;
        String parentUuid;
        PortalMenu entityObject;
        for (MenuModule module : listModule) {
            moduleUuid = module.getUuid();
            entityObject = new PortalMenu();
            parentUuid = StringUtils.createUUID();
            entityObject.setUuid(parentUuid);
            entityObject.setParentUuid("");
            entityObject.setPortalUuid(portalUuid);
            entityObject.setMenuUuid(module.getUuid());
            entityObject.setStatus(module.getStatus());
            entityObject.setMenuType(ConfigConst.STR_PORTAL_MENU_MODULE);
            entityObject.setMenuCode(module.getModuleCode());
            entityObject.setMenuName(module.getModuleName());
            entityObject.setLeftPath("");
            entityObject.setMainPath("");
            entityObject.setIcon("");
            entityObject.setComment("");
            entityObject.setSort(Integer.valueOf(module.getSort()));
            entityObject.setCreatedBy(currentUser.getUserName());
            entityObject.setCreatedDatetime(StringUtils.getDatetime());
            entityObject.setModifiedBy(currentUser.getUserName());
            entityObject.setModifiedDatetime(StringUtils.getDatetime());
            //判斷網頁狀態執行不同的方法
            int_return += serviceObject.insertData(entityObject);

            //查找模塊下對應的操作
            List<MenuOption> listOption = menuOptionInfoService.listByParentUuid(moduleUuid);
            for (MenuOption option : listOption) {
                entityObject = new PortalMenu();
                entityObject.setUuid(StringUtils.createUUID());
                entityObject.setParentUuid(parentUuid);
                entityObject.setPortalUuid(portalUuid);
                entityObject.setMenuUuid(option.getUuid());
                entityObject.setStatus(option.getStatus());
                entityObject.setMenuType(ConfigConst.STR_PORTAL_MENU_OPTION);
                entityObject.setMenuCode(option.getMenuCode());
                entityObject.setMenuName(option.getMenuName());
                entityObject.setLeftPath(option.getLeftPath());
                entityObject.setMainPath(option.getMainPath());
                entityObject.setIcon("");
                entityObject.setComment("");
                entityObject.setSort(Integer.valueOf(option.getSort()));
                entityObject.setCreatedBy(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
                entityObject.setModifiedBy(currentUser.getUserName());
                entityObject.setModifiedDatetime(StringUtils.getDatetime());
                //判斷網頁狀態執行不同的方法
                int_return += serviceObject.insertData(entityObject);
            }
        }
        JSONObject result = new JSONObject();
        //返回狀態
        if (int_return > 0) {
            result.put(ConfigConst.STR_AJAX_SUCCESS, true);
        } else {
            result.put(ConfigConst.STR_AJAX_ERROR, false);
        }
        StringUtils.write(response, result);
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
        //获取当前用户
        User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
        int int_return = 0;
        try {
            //循環創建:菜單 & 模塊
            JSONObject myjObject = JSONObject.parseObject(strJson);
            //操作對象
            PortalMenu entityObject = new PortalMenu();
            String str_webStatus = myjObject.getString("ws");
            //uuid
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setUuid(StringUtils.createUUID());
            } else if (str_webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
                entityObject.setUuid(myjObject.getString("uuid"));
            }
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setParentUuid(myjObject.getString("parentUuid"));
                entityObject.setPortalUuid(myjObject.getString("portalUuid"));
                entityObject.setMenuUuid(myjObject.getString("menuUuid"));
                entityObject.setMenuType(myjObject.getString("menuType"));
            }
            entityObject.setStatus(myjObject.getString("status"));
            entityObject.setMenuCode(myjObject.getString("menuCode"));
            entityObject.setMenuName(myjObject.getString("menuName"));
            entityObject.setLeftPath(myjObject.getString("leftPath"));
            entityObject.setMainPath(myjObject.getString("mainPath"));
            entityObject.setIcon(myjObject.getString("icon"));
            entityObject.setComment(myjObject.getString("comment"));
            entityObject.setSort(Integer.valueOf(myjObject.getString("sort")));
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                entityObject.setCreatedBy(currentUser.getUserName());
                entityObject.setCreatedDatetime(StringUtils.getDatetime());
            }
            entityObject.setModifiedBy(currentUser.getUserName());
            entityObject.setModifiedDatetime(StringUtils.getDatetime());
            //判斷網頁狀態執行不同的方法
            if (str_webStatus.equals(ConfigConst.STR_WS_CREATE)) {
                int_return = serviceObject.insertData(entityObject);
            } else if (str_webStatus.equals(ConfigConst.STR_WS_UPDATE)) {
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
            log.error(ex.toString());
        }
        return null;
    }

    /**
     * 功能说明：刪除門戶-菜單
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
        int int_return ;
        try {
            String[] strUuids = uuids.split(",");
            //清空Set集合
            uuidSet.clear();
            //獲取所有下層的部門UUID
            for (String uuid : strUuids) {
                uuidSet.add(uuid);
                //遞歸獲取數據
                getSubPortalMenu(uuid);
            }
            //把所有UUID轉換成字符串數組
            String[] strAllUuids = new String[uuidSet.size() + 1];
            int index = 0;
            for (String uuid : uuidSet) {
                strAllUuids[index] = uuid;
                index = index + 1;
            }
            int_return = serviceObject.deleteDataBatch(strAllUuids);
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
     * 功能说明：遞歸函數用於獲取所有下層的菜單UUID
     * 修改说明：
     *
     * @return String ajax
     * @author Joseph
     * @date 20181108
     */
    private void getSubPortalMenu(String uuid) {
        try {
            //上層的uuid作為下層的parent_uuid查詢條件
            List<PortalMenu> entityObject = serviceObject.listByParentUuid(uuid);
            //只要查詢有結果就不斷遞歸查直到最底層
            if (entityObject.size() > 0) {
                for (PortalMenu entity : entityObject) {
                    //此處使用set類型，add結果不重複
                    uuidSet.add(entity.getUuid());
                    getSubPortalMenu(entity.getUuid());
                }
            }
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
        }
    }

    /**
     * 功能说明：顯示頁面
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181119
     */
    @RequestMapping(value = "configuration.action")
    public ModelAndView configuration() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_PORTAL_MENU);
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
    @RequestMapping(value = "gotoTreePage.action")
    public ModelAndView gotoTreePage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_PORTAL_MENU_TREE);
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
     * @date 20181122
     */
    @RequestMapping(value = "gotoModuleConfPage.action")
    public ModelAndView gotoModuleConfPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_PORTAL_MENU_MODULE_CONF);
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
     * @date 20181122
     */
    @RequestMapping(value = "gotoUptPage.action")
    public ModelAndView gotoOptionUptPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_PORTAL_MENU_UPT);
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
     * @date 20181122
     */
    @RequestMapping(value = "gotoOptionConfPage.action")
    public ModelAndView gotoOptionConfPage() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_CONFIG_PORTAL_MENU_OPTION_CONF);
        } catch (Exception ex) {
            log.error("XERP Exception:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }
}
