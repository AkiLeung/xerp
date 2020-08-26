package com.xerp.core.service.impl;

import com.xerp.core.dao.IRoleDAO;
import com.xerp.core.dao.IRolePermissionDAO;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Role;
import com.xerp.core.entity.RolePermission;
import com.xerp.core.service.IRolePermissionService;
import com.xerp.core.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：菜單模塊 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class RolePermissionServiceImpl implements IRolePermissionService {

    @Autowired
    IRolePermissionDAO daoObject;

    @Override
    public List<RolePermission> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount(String roleCode) {
        return daoObject.listCount(roleCode);
    }

    @Override
    public int listByCode(String roleCode,String permissionCode) {
        return daoObject.listByCode(roleCode,permissionCode);
    }

    @Override
    public int insertData(RolePermission entity) {
        return daoObject.insertData(entity);
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
}
