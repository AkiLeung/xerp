package com.xerp.core.service.impl;

import com.xerp.core.dao.ISysInfoDAO;
import com.xerp.core.entity.SysInfo;
import com.xerp.core.service.ISysInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 功能说明：用戶POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class SysInfoServiceImpl implements ISysInfoService {

    @Autowired
    private ISysInfoDAO daoObject;

    @Override
    public SysInfo listByDefault() {
        return daoObject.listByDefault();
    }

    @Override
    public int insertData(SysInfo entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(SysInfo entity) {
        return daoObject.updateData(entity);
    }

}
