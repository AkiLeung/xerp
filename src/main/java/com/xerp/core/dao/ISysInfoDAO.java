package com.xerp.core.dao;

import com.xerp.core.entity.SysInfo;
import org.springframework.stereotype.Repository;

/**
 * 功能說明：用戶 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface ISysInfoDAO {

    /**
     * 只查默认询一个
     *
     * @return SysInfo
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
