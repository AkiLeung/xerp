package com.xerp.core.service;

import com.xerp.core.entity.TreeNode;
import com.xerp.core.entity.Warehouse;

import java.util.List;

/**
 * 功能说明：貨倉接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IWarehouseService {

    /**
     * 查询所有
     * @return List<Warehouse>
     */
    List<Warehouse> listData();

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return List<Warehouse>
     */
    List<Warehouse> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<Warehouse>
     */
    List<Warehouse> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of Warehouse
     * @return int 影響行數
     */
    int insertData(Warehouse entity);

    /**
     * 修改，用实体作为参数
     * @param entity of Warehouse
     * @return int 影響行數
     */
    int updateData(Warehouse entity);

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
    List<TreeNode> warehouseZTree(String parentUuid);
}

