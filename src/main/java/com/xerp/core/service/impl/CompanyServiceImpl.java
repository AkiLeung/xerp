package com.xerp.core.service.impl;

import com.xerp.core.dao.ICompanyDAO;
import com.xerp.core.entity.Company;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.ICompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：公司 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class CompanyServiceImpl implements ICompanyService {

    @Autowired
    ICompanyDAO daoObject;

    @Override
    public List<Company> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public List<Company> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<Company> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(Company entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(Company entity) {
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
    public List<TreeNode> companyZTree() {
        List<TreeNode> TreeNode = daoObject.companyZTree();
        return TreeNode;
    }

    @Override
    public List<TreeNode> companyListZTree() {
        List<TreeNode> TreeNode = daoObject.companyListZTree();
        return TreeNode;
    }

    @Override
    public List<TreeNode> companyFactoryZTree() {
        List<TreeNode> TreeNode = daoObject.companyFactoryZTree();
        return TreeNode;
    }

    @Override
    public List<TreeNode> companyWarehouseZTree() {
        List<TreeNode> TreeNode = daoObject.companyWarehouseZTree();
        return TreeNode;
    }
}
