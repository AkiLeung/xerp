package com.xerp.core.service.impl;

import com.xerp.core.dao.IBusinessDAO;
import com.xerp.core.entity.Business;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IBusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：事業部 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class BusinessServiceImpl implements IBusinessService {

    @Autowired
    IBusinessDAO daoObject;

    @Override
    public List<Business> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public List<Business> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public List<Business> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public int insertData(Business entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(Business entity) {
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
    public List<TreeNode> businessListZTree() {
        List<TreeNode> TreeNode = daoObject.businessListZTree();
        return TreeNode;
    }
}
