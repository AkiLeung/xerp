package com.xerp.core.service.impl;

import com.xerp.core.dao.IRoleUserDAO;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.RoleUser;
import com.xerp.core.service.IRoleUserService;
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
public class RoleUserServiceImpl implements IRoleUserService {

    @Autowired
    IRoleUserDAO daoObject;

    @Override
    public List<RoleUser> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public List<RoleUser> listDataByCode(String roleCode) {
        return daoObject.listDataByCode(roleCode);
    }

    @Override
    public int listCount(String roleCode) {
        return daoObject.listCount(roleCode);
    }

    @Override
    public int listByCode(String roleCode,String userCode) {
        return daoObject.listByCode(roleCode,userCode);
    }

    @Override
    public int insertData(RoleUser entity) {
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
