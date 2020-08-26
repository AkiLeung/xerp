package com.xerp.core.dao;

import com.xerp.core.entity.DataKeyType;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：數據類型 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IDataKeyTypeDAO {

    /**
     * 查询所有
     *
     * @return List<DataKeyType>
     */
    List<DataKeyType> listData();

    /**
     * 校驗類型編碼CODE是否重複
     *
     * @param code
     * @return DataKeyType
     */
    DataKeyType listByTypeCode(String code);

    /**
     * 校驗編碼CODE是否重複
     *
     * @param code
     * @return DataKeyType
     */
    List<DataKeyType> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of DataKeyType
     * @return int 影響行數
     */
    int insertData(DataKeyType entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of DataKeyType
     * @return int 影響行數
     */
    int updateData(DataKeyType entity);

    /**
     * 按uuid删除
     *
     * @param typeCode
     * @return int 影響行數
     */
    int deleteDataByTypeCode(String typeCode);

    /**
     * 樹結構
     *
     * @return List<TreeNode>
     */
    List<TreeNode> dataKeyTypeZTree();
}
