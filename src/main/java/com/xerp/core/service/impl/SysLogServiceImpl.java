package com.xerp.core.service.impl;

import com.xerp.core.dao.ISysLogDAO;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.SysLog;
import com.xerp.core.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：日志POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class SysLogServiceImpl implements ISysLogService  {

    @Autowired
    private ISysLogDAO daoObject;


    @Override
    public List<SysLog> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public SysLog listByLogId(String uuid) {
        return daoObject.listByLogId(uuid);
    }

}
