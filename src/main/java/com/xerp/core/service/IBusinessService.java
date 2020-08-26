package com.xerp.core.service;

import com.xerp.core.entity.Business;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：事業部接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IBusinessService {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<Business>
     */
    List<Business> listData(PageModel pager);

    /**
     * 統計個數
     * @return int統計的記錄個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return Business
     */
    List<Business> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<Business>
     */
    List<Business> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of Business
     * @return int 影響行數
     */
    int insertData(Business entity);

    /**
     * 修改，用实体作为参数
     * @param entity of BusinessInfo
     * @return int 影響行數
     */
    int updateData(Business entity);

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
     * 事业部樹結構
     * @return TreeNode
     */
    List<TreeNode> businessListZTree();

}

