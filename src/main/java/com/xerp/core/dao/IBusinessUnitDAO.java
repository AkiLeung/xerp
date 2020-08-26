package com.xerp.core.dao;

import com.xerp.core.entity.BusinessUnit;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：事業部部門 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IBusinessUnitDAO {

    /**
     * 查询所有
     *
     * @return List<BusinessUnit>
     */
    List<BusinessUnit> listData();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return List<BusinessUnit>
     */
    List<BusinessUnit> listByUuid(String uuid);

    /**
     * 按父UUID查詢
     *
     * @param parentUuid
     * @return List<BusinessUnit>
     */
    List<BusinessUnit> listByParentUuid(String parentUuid);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of BusinessUnit
     * @return int 影響行數
     */
    int insertData(BusinessUnit entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of BusinessUnit
     * @return int 影響行數
     */
    int updateData(BusinessUnit entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 樹結構
     *
     * @param parentUuid
     * @return List<TreeNode>
     */
    List<TreeNode> businessUnitZTree(String parentUuid);
}
