package com.xerp.core.service.impl;

import com.xerp.core.dao.IPermissionDAO;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Permission;
import com.xerp.core.service.IPermissionService;
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
public class PermissionServiceImpl implements IPermissionService {

    @Autowired
    IPermissionDAO daoObject;

    @Override
    public List<Permission> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount(PageModel pager) {
        return daoObject.listCount(pager);
    }

    @Override
    public List<Permission>  listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<Permission> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(Permission entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(Permission entity) {
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
}
