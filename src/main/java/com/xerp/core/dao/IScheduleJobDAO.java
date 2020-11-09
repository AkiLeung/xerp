package com.xerp.core.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.ScheduleJob;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：定时代理 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IScheduleJobDAO {

    /**
     * 查询所有
     * @param pager 分頁信息
     * @return List<ScheduleJob>
     */
    List<ScheduleJob> listData(PageModel pager);

    /**
     * 統計個數
     *
     * @return int 統計個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuids
     * @return ScheduleJob
     */
    List<ScheduleJob> listByUuid(String uuids);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of ScheduleJob
     * @return int 影響行數
     */
    int insertData(ScheduleJob entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of ScheduleJob
     * @return int 影響行數
     */
    int updateData(ScheduleJob entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
