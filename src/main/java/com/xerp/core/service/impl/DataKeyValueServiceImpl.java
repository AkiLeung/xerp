package com.xerp.core.service.impl;

import com.xerp.core.dao.IDataKeyValueDAO;
import com.xerp.core.entity.DataKeyValue;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IDataKeyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：數據字典類型 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class DataKeyValueServiceImpl implements IDataKeyValueService {

    @Autowired
    IDataKeyValueDAO daoObject;

    @Override
    public List<DataKeyValue> listData() {
        return daoObject.listData();
    }

    @Override
    public List<DataKeyValue> listByDataType(String typeCode) {
        return daoObject.listByDataType(typeCode);
    }

    @Override
    public DataKeyValue listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public int insertData(DataKeyValue entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(DataKeyValue entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int deleteData(String uuid) {
        return daoObject.deleteData(uuid);
    }

    @Override
    public int deleteDataByTypeCode(String typeCode) {
        return daoObject.deleteDataByTypeCode(typeCode);
    }

    @Override
    public List<TreeNode> dataKeyValueZTree(String parentUuid) {
        List<TreeNode> TreeNode = daoObject.dataKeyValueZTree(parentUuid);
        return TreeNode;
    }
}
