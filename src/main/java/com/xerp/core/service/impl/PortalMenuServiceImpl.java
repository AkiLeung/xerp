package com.xerp.core.service.impl;

import com.xerp.core.dao.IMenuOptionDAO;
import com.xerp.core.dao.IPortalMenuDAO;
import com.xerp.core.entity.PortalMenu;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IPortalMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * 功能说明：門戶菜單 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class PortalMenuServiceImpl implements IPortalMenuService {

    @Autowired
    IPortalMenuDAO daoObject;

    @Autowired
    IMenuOptionDAO daoObjectMenu;

    @Override
    public List<PortalMenu> listData(String portalUuid) {
        return daoObject.listData(portalUuid);
    }

    @Override
    public PortalMenu listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<PortalMenu> listByParentUuid(String parent_uuid) {
        return daoObject.listByParentUuid(parent_uuid);
    }

    @Override
    public List<PortalMenu> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(PortalMenu entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(PortalMenu entity) {
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
    public List<TreeNode> portalMenuZTree(String portal_uuid) {
        List<TreeNode> zTreeModel = daoObject.portalMenuZTree(portal_uuid);
        return zTreeModel;
    }
}
