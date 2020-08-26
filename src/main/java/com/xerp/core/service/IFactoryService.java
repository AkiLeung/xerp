package com.xerp.core.service;

import com.xerp.core.entity.Factory;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：工廠接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IFactoryService {

    /**
     * 查询所有
     *
     * @return List<Factory>
     */
    List<Factory> listData();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return List<Factory>
     */
    List<Factory> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<Factory>
     */
    List<Factory> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Factory
     * @return int 影響行數
     */
    int insertData(Factory entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Factory
     * @return int 影響行數
     */
    int updateData(Factory entity);

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
     * @param parentUuid
     * @return List<TreeNode>
     */
    List<TreeNode> factoryZTree(String parentUuid);


    /**
     * 公司樹結構(不分層)
     * @return List<TreeNode>
     */
    List<TreeNode> companyFactoryZTree();
}

