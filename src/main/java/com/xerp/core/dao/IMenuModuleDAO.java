package com.xerp.core.dao;

import com.xerp.core.entity.MenuModule;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：菜單模塊 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IMenuModuleDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
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
     * 校驗CODE是否重複
     *
     * @param code
     * @return MenuModule
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
     * 樹結構
     *
     * @return List<TreeNode>
     */
    List<TreeNode> menuModuleListZTree();
}
