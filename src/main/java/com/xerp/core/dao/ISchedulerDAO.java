package com.xerp.core.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Schedule;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：定时代理 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface ISchedulerDAO {

    /**
     * 查询所有
     * @param pager 分頁信息
     * @return List<Schedule>
     */
    List<Schedule> listData(PageModel pager);

    /**
     * 統計個數
     *
     * @return int 統計個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return Schedule
     */
    List<Schedule> listByUuid(String uuid);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Schedule
     * @return int 影響行數
     */
    int insertData(Schedule entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Schedule
     * @return int 影響行數
     */
    int updateData(Schedule entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
