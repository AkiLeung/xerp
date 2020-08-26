package com.xerp.core.service;

import com.xerp.core.entity.DataKeyType;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：數據字典類型接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IDataKeyTypeService {

    /**
     * 查询所有
     * @return List<DataKeyType>
     */
    List<DataKeyType> listData();

    /**
     * 只查询一个，常用于修改
     * @param code
     * @return DataKeyType
     */
    DataKeyType listByTypeCode(String code);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<DataKeyType>
     */
    List<DataKeyType> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of DataKeyType
     * @return int 影響行數
     */
    int insertData(DataKeyType entity);

    /**
     * 修改，用实体作为参数
     * @param entity of DataKeyType
     * @return int 影響行數
     */
    int updateData(DataKeyType entity);

    /**
     * 按uuid删除
     * @param typeCode
     * @return int 影響行數
     */
    int deleteDataByTypeCode(String typeCode);

    /**
     * 樹結構
     * @return List<TreeNode>
     */
    List<TreeNode> dataKeyTypeZTree();
}

