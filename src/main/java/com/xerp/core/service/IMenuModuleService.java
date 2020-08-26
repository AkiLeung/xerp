package com.xerp.core.service;

import com.xerp.core.entity.MenuModule;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：菜單模塊接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IMenuModuleService {

    /**
     * 查询所有
     *
     * @param pager 分頁
     * @return List<MenuModule>
     */
    List<MenuModule> listData(PageModel pager);

    /**
     * 查询所有
     *
     * @return List<MenuModule>
     */
    List<MenuModule> listData();

    /**
     * 統計個數
     *
     * @return int 統計個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return MenuModule
     */
    MenuModule listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<MenuModule>
     */
    List<MenuModule> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of MenuModule
     * @return int 影響行數
     */
    int insertData(MenuModule entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of MenuModule
     * @return int 影響行數
     */
    int updateData(MenuModule entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 批量删除
     *
     * @param uuids
     * @return int 影響行數
     */
    int deleteDataBatch(String[] uuids);

    /**
     * 樹結構
     *
     * @return List<TreeNode>
     */
    List<TreeNode> menuModuleListZTree();
}
