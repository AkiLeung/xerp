package com.xerp.core.service.impl;

import com.xerp.core.entity.DataKeyType;
import com.xerp.core.service.IDataKeyTypeService;
import com.xerp.core.dao.IDataKeyTypeDAO;
import com.xerp.core.entity.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataKeyTypeServiceImpl implements IDataKeyTypeService {

    @Autowired
    IDataKeyTypeDAO daoObject;

    @Override
    public List<DataKeyType> listData() {
        return daoObject.listData();
    }

    @Override
    public List<DataKeyType> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public DataKeyType listByTypeCode(String code) {
        return daoObject.listByTypeCode(code);
    }

    @Override
    public int insertData(DataKeyType entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(DataKeyType entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int deleteDataByTypeCode(String typeCode) {
        return daoObject.deleteDataByTypeCode(typeCode);
    }

    @Override
    public List<TreeNode> dataKeyTypeZTree() {
        List<TreeNode> TreeNode = daoObject.dataKeyTypeZTree();
        return TreeNode;
    }

}
