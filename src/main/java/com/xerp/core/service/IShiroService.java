package com.xerp.core.service;

import com.xerp.core.entity.User;

import java.util.List;

/**
 * 功能说明：用戶接口
 *
 * @author Joseph
 * @date 20190904
 */
public interface IShiroService {

    /**
     * 根据用户名查找用户
     *
     * @param userCode
     * @return
     */
    User getUserByUserCode(String userCode);


    /**
     * 根据用户名查找用户
     *
     * @param userCode
     * @return
     */
    List<String> getUserRolesByUserCode(String userCode);


    /**
     * 根据角色名查找权限
     *
     * @param roleCode
     * @return
     */
    List<String> getRolePermissionsByRoleCode(String roleCode);
}
