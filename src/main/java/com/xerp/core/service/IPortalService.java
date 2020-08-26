package com.xerp.core.service;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Portal;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：門戶接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IPortalService {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<PortalInfo>
     */
    List<Portal> listData(PageModel pager);

    /**
     * 統計個數
     *
     * @return List<PortalInfo>
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return Portal
     */
    Portal listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<Portal>
     */
    List<Portal> listByCode(String code);

    /**
     * 樹結構(不分層)
     * @return List<TreeNode>
     */
    List<TreeNode> listZTree();


    /**
     * 增加，用实体作为参数
     *
     * @param entity of Portal
     * @return int 影響行數
     */
    int insertData(Portal entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Portal
     * @return int 影響行數
     */
    int updateData(Portal entity);

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
}

