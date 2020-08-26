package com.xerp.core.service.impl;

import com.xerp.core.dao.IFactoryDAO;
import com.xerp.core.entity.Factory;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IFactoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：工廠 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class FactoryServiceImpl implements IFactoryService {

    @Autowired
    IFactoryDAO daoObject;

    @Override
    public List<Factory> listData() {
        return daoObject.listData();
    }

    @Override
    public List<Factory>  listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<Factory> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(Factory entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(Factory entity) {
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
    public List<TreeNode> factoryZTree(String parentUuid) {
        List<TreeNode> TreeNode = daoObject.factoryZTree(parentUuid);
        return TreeNode;
    }

    @Override
    public List<TreeNode> companyFactoryZTree() {
        List<TreeNode> TreeNode = daoObject.companyFactoryZTree();
        return TreeNode;
    }
}
