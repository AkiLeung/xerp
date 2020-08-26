package com.xerp.core.service.impl;

import com.xerp.core.dao.IPortalDAO;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Portal;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IPortalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：門戶 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class PortalServiceImpl implements IPortalService {

    @Autowired
    IPortalDAO daoObject;

    @Override
    public List<Portal> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public Portal listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<Portal> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public List<TreeNode> listZTree() {
        List<TreeNode> TreeNode = daoObject.listZTree();
        return TreeNode;
    }

    @Override
    public int insertData(Portal entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(Portal entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int deleteData(String uuid) {
        return daoObject.deleteData(uuid);
    }

    @Override
    public int deleteDataBatch(String[] uuids) {
        int delete = 0;
        for (int i = 0; i < uuids.length; i++) {
            delete = delete + daoObject.deleteData(uuids[i]);
        }
        return delete;
    }
}
