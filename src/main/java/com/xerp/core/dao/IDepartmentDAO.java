package com.xerp.core.dao;

import com.xerp.core.entity.Department;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * 功能說明：部門 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IDepartmentDAO {

    /**
     * 查询所有
     *
     * @return List<Department>
     */
    List<Department> listData();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return Department
     */
    List<Department> listByUuid(String uuid);

    /**
     * 按父UUID查詢
     *
     * @param parent_uuid
     * @return List<Department>
     */
    List<Department> listByParentUuid(String parent_uuid);

    /**
     * 檢驗CODE重複
     *
     * @param code
     * @return List<Department>
     */
    List<Department> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Department
     * @return int 影響行數
     */
    int insertData(Department entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Department
     * @return int 影響行數
     */
    int updateData(Department entity);

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
     * @param parent_uuid
     * @return List<TreeNode>
     */
    List<TreeNode> departmentZTree(String parent_uuid);
}
