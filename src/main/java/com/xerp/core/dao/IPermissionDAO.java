package com.xerp.core.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Permission;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：权限模块 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IPermissionDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
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
     * 校驗CODE是否重複
     *
     * @param code
     * @return MenuModule
     */
    List<Permission> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Permission
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
    }
