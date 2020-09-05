package com.xerp.core.service;

import com.xerp.core.entity.BusinessUnit;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：事業部門接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IBusinessUnitService {

    /**
     * 查询所有
     * @return List<BusinessUnit>
     */
    List<BusinessUnit> listData();

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return List<BusinessUnit>
     */
    List<BusinessUnit> listByUuid(String uuid);

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return List<BusinessUnit>
     */
    List<BusinessUnit> listByCode(String uuid);


    /**
     * 查詢當前事業部及旗下所有部門
     * @param parentUuid
     * @return List<BusinessUnit>
     */
    List<BusinessUnit> listByParentUuid(String parentUuid);

    /**
     * 增加，用实体作为参数
     * @param entity of BusinessUnit
     * @return int 影響行數
     */
    int insertData(BusinessUnit entity);

    /**
     * 修改，用实体作为参数
     * @param entity of BusinessUnit
     * @return int 影響行數
     */
    int updateData(BusinessUnit entity);

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
    List<TreeNode> businessUnitZTree(String parentUuid);
}

