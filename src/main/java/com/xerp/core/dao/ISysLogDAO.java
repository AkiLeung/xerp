package com.xerp.core.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.SysLog;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：日志 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface ISysLogDAO {

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
     * @return int 影響行數
     */
    int listCount();

    /**
     * 只查询一个，用于查看明细
     *
     * @param uuid
     * @return SysInfo
     */
    SysLog listByLogId(String uuid);
}
