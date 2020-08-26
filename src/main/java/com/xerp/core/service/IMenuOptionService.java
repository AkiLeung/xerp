package com.xerp.core.service;

import com.xerp.core.entity.MenuOption;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：菜單接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IMenuOptionService {

    /**
     * 查询所有
     * @return List<MenuOption>
     */
    List<MenuOption> listData();

    /**
     * 查询執行父關係下的操作
     * @param parentUuid
     * @return List<MenuOption>
     */
    List<MenuOption> listByParentUuid(String parentUuid);

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return MenuOptionInfo
     */
    MenuOption listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<MenuOption>
     */
    List<MenuOption> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of MenuOption
     * @return int 影響行數
     */
    int insertData(MenuOption entity);

    /**
     * 修改，用实体作为参数
     * @param entity of MenuOption
     * @return int 影響行數
     */
    int updateData(MenuOption entity);

    /**
     * 按uuid删除
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 批量删除
     * @param uuids
     * @return int 影響行數
     */
    int deleteDataBatch(String[] uuids);

    /**
     * 樹結構
     * @param parentUuid
     * @return List<TreeNode>
     */
    List<TreeNode> menuOptionZTree(String parentUuid);
}
