package com.xerp.core.dao;

import com.xerp.core.entity.MenuOption;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：菜單操作 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IMenuOptionDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<MenuOption>
     */
    List<MenuOption> listData(PageModel pager);

    /**
     * 查询所有
     *
     * @return List<MenuOption>
     */
    List<MenuOption> listData();

    /**
     * 按父鍵查詢
     *
     * @param parentUuid
     * @return  List<MenuOption>
     */
    List<MenuOption> listByParentUuid(String parentUuid);

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
     * @return MenuOption
     */
    MenuOption listByUuid(String uuid);

    /**
     * 校驗CODE是否重複
     *
     * @param code
     * @return MenuOption
     */
    List<MenuOption> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of MenuOption
     * @return int 影響行數
     */
    int insertData(MenuOption entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of MenuModuleInfo
     * @return int 影響行數
     */
    int updateData(MenuOption entity);

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
     * @param parentUuid
     * @return List<TreeNode>
     */
    List<TreeNode> menuOptionZTree(String parentUuid);
}
