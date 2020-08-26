package com.xerp.core.service.impl;

import com.xerp.core.dao.IWarehouseDAO;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.entity.Warehouse;
import com.xerp.core.service.IWarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：貨倉操作POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class WarehouseServiceImpl implements IWarehouseService {

    @Autowired
    IWarehouseDAO daoObject;

    @Override
    public List<Warehouse> listData() {
        return daoObject.listData();
    }

    @Override
    public List<Warehouse> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<Warehouse> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(Warehouse entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(Warehouse entity) {
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
    public List<TreeNode> warehouseZTree(String parentUuid) {
        List<TreeNode> TreeNode = daoObject.warehouseZTree(parentUuid);
        return TreeNode;
    }
}
