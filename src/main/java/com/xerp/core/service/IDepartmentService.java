package com.xerp.core.service;

import com.xerp.core.entity.Department;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：部門接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IDepartmentService {

    /**
     * 查询所有
     * @return  List<Department>
     */
    List<Department> listData();

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return List<Department>
     */
    List<Department> listByUuid(String uuid);

    /**
     * 查詢當前部門及旗下所有子部門
     * @param parent_uuid
     * @return List<Department>
     */
    List<Department> listByParentUuid(String parent_uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<Department>
     */
    List<Department> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of Department
     * @return int 影響行數
     */
    int insertData(Department entity);

    /**
     * 修改，用实体作为参数
     * @param entity of Department
     * @return int 影響行數
     */
    int updateData(Department entity);

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
    List<TreeNode> departmentZTree(String parentUuid);

}

