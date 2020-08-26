package com.xerp.core.service;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.RoleUser;

import java.util.List;

/**
 * 功能说明：角色模块
 *
 * @author Joseph
 * @date 20181108
 */
public interface IRoleUserService {

    /**
     * 查询所有
     * @param pager 分頁信息
     * @return List<RoleUser>
     */
    List<RoleUser> listData(PageModel pager);

    /**
     * 統計個數
     * @param roleCode
     * @return int 統計個數
     */
    int listCount(String roleCode);

    /**
     * 統計個數
     * @param roleCode
     * @param userCode
     * @return int 統計個數
     */
    int listByCode(String roleCode,String userCode);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of RoleUser
     * @return int 影響行數
     */
    int insertData(RoleUser entity);

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
