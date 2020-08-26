package com.xerp.core.service;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Permission;

import java.util.List;

/**
 * 功能说明：权限模块
 *
 * @author Joseph
 * @date 20181108
 */
public interface IPermissionService {

    /**
     * 查询所有
     *
     * @param pager 分頁
     * @return List<Permission>
     */
    List<Permission> listData(PageModel pager);


    /**
     * 統計個數
     *
     * @param pager 分頁
     * @return int 統計個數
     */
    int listCount(PageModel pager);

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return List<Permission>
     */
    List<Permission> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<Permission>
     */
    List<Permission> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of permission
     * @return int 影響行數
     */
    int insertData(Permission entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Permission
     * @return int 影響行數
     */
    int updateData(Permission entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 批量删除
     *
     * @param uuids
     * @return int 影響行數
     */
    int deleteDataBatch(String[] uuids);
    }
