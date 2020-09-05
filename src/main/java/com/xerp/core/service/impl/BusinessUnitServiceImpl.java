package com.xerp.core.service.impl;

import com.xerp.core.dao.IBusinessUnitDAO;
import com.xerp.core.entity.BusinessUnit;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IBusinessUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：事業部門 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class BusinessUnitServiceImpl implements IBusinessUnitService {

    @Autowired
    IBusinessUnitDAO daoObject;

    @Override
    public List<BusinessUnit> listData() {
        return daoObject.listData();
    }

    @Override
    public List<BusinessUnit> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<BusinessUnit> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public List<BusinessUnit> listByParentUuid(String parentUuid) {
        return daoObject.listByParentUuid(parentUuid);
    }

    @Override
    public int insertData(BusinessUnit entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(BusinessUnit entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int deleteData(String uuid) {
        return daoObject.deleteData(uuid);
    }

    @Override
    public int deleteDataBatch(String[] uuids) {
        int deleteCount = 0;
        for (int i = 0; i < uuids.length; i++) {
            deleteCount = deleteCount + daoObject.deleteData(uuids[i]);
        }
        return deleteCount;
    }

    @Override
    public List<TreeNode> businessUnitZTree(String parentUuid) {
        List<TreeNode> TreeNode = daoObject.businessUnitZTree(parentUuid);
        return TreeNode;
    }
}
