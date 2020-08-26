package com.xerp.core.service;

import com.xerp.core.entity.SysInfo;

/**
 * 功能说明：系统信息
 *
 * @author Joseph
 * @date 20181108
 */
public interface ISysInfoService {

    /**
     * 只查询一个，常用于修改
     *
     * @return SysInfo 用戶信息
     */
    SysInfo listByDefault();

    /**
     * 增加，用实体作为参数
     *
     * @param entity of SysInfo
     * @return int 影響行數
     */
    int insertData(SysInfo entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of SysInfo
     * @return int 影響行數
     */
    int updateData(SysInfo entity);
}

