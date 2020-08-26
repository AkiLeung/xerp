package com.xerp.core.service;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.User;

import java.util.List;

/**
 * 功能说明：用戶接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IUserService {


    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<UserInfo>
     */
    List<User> listData(PageModel pager);

    /**
     * 查询所有
     *
     * @return int 返回行數
     */
    int listCount(String search);

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return UserInfo 用戶信息
     */
    User listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<UserInfo>
     */
    List<User> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of UserInfo
     * @return int 影響行數
     */
    int insertData(User entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of UserInfo
     * @return int 影響行數
     */
    int updateData(User entity);

    /**
     * 修改密码
     *
     * @param entity of UserInfo
     * @return int 影響行數
     */
    int updatePassword(User entity);

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

