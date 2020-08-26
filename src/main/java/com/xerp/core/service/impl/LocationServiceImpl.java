package com.xerp.core.service.impl;

import com.xerp.core.dao.IFactoryDAO;
import com.xerp.core.dao.ILocationDAO;
import com.xerp.core.entity.Factory;
import com.xerp.core.entity.Location;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IFactoryService;
import com.xerp.core.service.ILocationService;
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
public class LocationServiceImpl implements ILocationService {

    @Autowired
    ILocationDAO daoObject;

    @Override
    public List<Location> listData() {
        return daoObject.listData();
    }

    @Override
    public List<Location>  listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<Location> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(Location entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(Location entity) {
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
    public List<TreeNode> locationZTree() {
        List<TreeNode> TreeNode = daoObject.locationZTree();
        return TreeNode;
    }
}
