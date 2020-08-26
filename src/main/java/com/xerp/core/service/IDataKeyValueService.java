package com.xerp.core.service;

import com.xerp.core.entity.DataKeyValue;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：數據字典接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IDataKeyValueService {

    /**
     * 查询所有
     * @return  List<DataKeyValue>
     */
    List<DataKeyValue> listData();

    /**
     * 查询页面
     * @param typeCode
     * @return List<DataKeyValue>
     */
    List<DataKeyValue> listByDataType(String typeCode);

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return DataKeyValue
     */
    DataKeyValue listByUuid(String uuid);

    /**
     * 增加，用实体作为参数
     * @param entity of DataKeyValue
     * @return int 影響行數
     */
    int insertData(DataKeyValue entity);

    /**
     * 修改，用实体作为参数
     * @param entity of DataKeyValue
     * @return int 影響行數
     */
    int updateData(DataKeyValue entity);

    /**
     * 按uuid删除
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 删除 type
     * @param typeCode
     * @return int 影響行數
     */
    int deleteDataByTypeCode(String typeCode);

    /**
     * 樹結構
     * @param parentUuid
     * @return List<TreeNode>
     */
    List<TreeNode> dataKeyValueZTree(String parentUuid);
}

