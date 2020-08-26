package com.xerp.core.service.impl;

import com.xerp.core.dao.IDepartmentDAO;
import com.xerp.core.entity.Department;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：部門 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class DepartmentServiceImpl implements IDepartmentService {

    @Autowired
    IDepartmentDAO daoObject;

    @Override
    public List<Department> listData() {
        return daoObject.listData();
    }

    @Override
    public List<Department> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<Department> listByParentUuid(String parentUuid) {
        return daoObject.listByParentUuid(parentUuid);
    }

    @Override
    public List<Department> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(Department entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(Department entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int deleteData(String uuid) {
        return daoObject.deleteData(uuid);
    }

    @Override
    public int deleteDataBatch(String[] uuids) {
        int int_delete = 0;
        for (int i = 0; i < uuids.length; i++) {
            int_delete = int_delete + daoObject.deleteData(uuids[i]);
        }
        return int_delete;
    }

    @Override
    public List<TreeNode> departmentZTree(String parentUuid) {
        List<TreeNode> TreeNode = daoObject.departmentZTree(parentUuid);
        return TreeNode;
    }
}
