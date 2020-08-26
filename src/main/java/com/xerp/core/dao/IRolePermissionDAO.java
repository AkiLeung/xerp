package com.xerp.core.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.RolePermission;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：角色模块 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IRolePermissionDAO {

    /**
     * 查询所有
     * @param
     * @param pager 分頁信息 roleCode String roleCode,
     * @return List<RolePermission>
     */
    List<RolePermission> listData(PageModel pager);

    /**
     * 統計個數
     * @param  roleCode
     * @return int 統計個數
     */
    int listCount(String roleCode);

    /**
     * 只查询一个，常用于检查
     * @param roleCode
     * @param permissionCode
     * @return int 統計個數
     */
    int listByCode(String roleCode,String permissionCode);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of RolePermission
     * @return int 影響行數
     */
    int insertData(RolePermission entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
