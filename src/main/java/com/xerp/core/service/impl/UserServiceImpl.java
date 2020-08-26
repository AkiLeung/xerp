package com.xerp.core.service.impl;

import com.xerp.core.dao.IUserDAO;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.User;
import com.xerp.core.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * 功能说明：用戶POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDAO daoObject;


    @Override
    public List<User> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount(String search) {
        return daoObject.listCount(search);
    }

    @Override
    public User listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<User> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(User entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(User entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int updatePassword(User entity) {
        return daoObject.updatePassword(entity);
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
