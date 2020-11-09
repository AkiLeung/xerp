package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import org.springframework.cache.annotation.Cacheable;

import javax.persistence.Entity;

/**
 * @author Joseph.L
 * @date 2019-11-04
 * @description 定时任务器
 */
@Entity
@Data
@Cacheable
public class ScheduleJob extends BaseEntity {

    private static final long serialVersionUID = 6794278233339581395L;

    /**
     * 这个类用于展示定时的任务，同时作用于定时任务的恢复、删除、中止；
     **/
    private String uuid;

    /**
     * 任务类的全限定类名
     */
    private String jobClass;

    /**
     * 任务组名
     */
    private String jobGroup;

    /**
     * 任务名
     */
    private String jobName;

    /**
     * 任务触发器名
     */
    private String triggerName;

    /**
     * 任务触发器组名
     */
    private String triggerGroup;

    /**
     * 时间表达式
     */
    private String cronExpr;

    /**
     * 任务状态
     */
    private Integer status;

    /**
     * 删除标识
     */
    private Integer deleteFlag;

    /**
     * 任务开始时间
     */
    private String startTime;

    /**
     * 创建时间
     */
    private String createdTime;

    /**
     * 修改时间
     */
    private String updatedTime;
}
