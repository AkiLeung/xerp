package com.xerp.core.service;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.ScheduleJob;

import java.util.List;

/**
 * 功能说明：单号配置接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IScheduleJobService {

    /**
     * 查询所有
     * @param pager  分页信息
     * @return List<ScheduleJob>
     */
    List<ScheduleJob> listData(PageModel pager);

    /**
     * 統計個數
     * @return int 統計個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return ScheduleJob
     */
    List<ScheduleJob> listByUuid(String uuid);

    /**
     * 增加，用实体作为参数
     * @param entity of ScheduleJob
     * @return int 影響行數
     */
    int insertData(ScheduleJob entity);

    /**
     * 修改，用实体作为参数
     * @param entity of ScheduleJob
     * @return int 影響行數
     */
    int updateData(ScheduleJob entity);

    /**
     * 按uuid删除
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 批量删除
     * @param Uuids
     * @return int 影響行數
     */
    int deleteDataBatch(String[] Uuids);
}
