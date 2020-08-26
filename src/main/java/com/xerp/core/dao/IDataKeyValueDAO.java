package com.xerp.core.dao;

import com.xerp.core.entity.DataKeyValue;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * 功能說明：數據值 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IDataKeyValueDAO {

    /**
     * 查询所有
     *
     * @return List<DataKeyValue>
     */
    List<DataKeyValue> listData();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return DataKeyValue
     */
    DataKeyValue listByUuid(String uuid);

    /**
     *c 按類型查詢
     *
     * @param typeCode
     * @return List<DataKeyValue>
     */
    List<DataKeyValue> listByDataType(String typeCode);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of DataKeyValue
     * @return int 影響行數
     */
    int insertData(DataKeyValue entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of DataKeyValue
     * @return int 影響行數
     */
    int updateData(DataKeyValue entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 按uuid删除 按類型
     *
     * @param typeCode
     * @return int 影響行數
     */
    int deleteDataByTypeCode(String typeCode);

    /**
     * 樹結構
     *
     * @param parentUuid
     * @return List<TreeNode>
     */
    List<TreeNode> dataKeyValueZTree(String parentUuid);
}
