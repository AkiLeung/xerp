package com.xerp.core.service;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.SysLog;

import java.util.List;

/**
 * 功能说明：日志接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface ISysLogService{

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<SysLog>
     */
    List<SysLog> listData(PageModel pager);

    /**
     * 查询所有
     *
     * @return int 返回行數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     *
     * @param logId
     * @return SysLog 用戶信息
     */
    SysLog listByLogId(String logId);

}

