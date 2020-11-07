package com.xerp.core.service.impl;

import com.xerp.core.dao.IScheduleJobDAO;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.ScheduleJob;
import com.xerp.core.service.IScheduleJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：流程模塊 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class ScheduleJobServiceImpl implements IScheduleJobService {

    @Autowired
    IScheduleJobDAO daoObject;

    @Override
    public List<ScheduleJob> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public List<ScheduleJob> listByJobId(String jobId) {
        return daoObject.listByJobId(jobId);
    }


    @Override
    public int insertData(ScheduleJob entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(ScheduleJob entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int deleteData(String uuid) {
        return daoObject.deleteData(uuid);
    }

    @Override
    public int deleteDataBatch(String[] jobIds) {
        int int_delete = 0;
        for (int i = 0; i < jobIds.length; i++) {
            int_delete = int_delete + daoObject.deleteData(jobIds[i]);
        }
        return int_delete;
    }
}
