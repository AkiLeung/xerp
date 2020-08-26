package com.xerp.core.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：角色模块 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IRoleDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<Role>
     */
    List<Role> listData(PageModel pager);

    /**
     * 查询所有
     *
     * @return List<Role>
     */
    List<Role> listData();

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
     * @return List<Role>
     */
    List<Role> listByUuid(String uuid);

    /**
     * 校驗CODE是否重複
     *
     * @param code
     * @return MenuModule
     */
    List<Role> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Role
     * @return int 影響行數
     */
    int insertData(Role entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Role
     * @return int 影響行數
     */
    int updateData(Role entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
    }
