package com.xerp.core.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：用戶 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IUserDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<User>
     */
    List<User> listData(PageModel pager);

    /**
     * 查询所有
     *
     * @return int 影響行數
     */
    int listCount(String search);

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return User
     */
    User listByUuid(String uuid);

    /**
     * 校驗CODE是否重複
     *
     * @param code
     * @return List<User>
     */
    List<User> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of UserI
     * @return int 影響行數
     */
    int insertData(User entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of User
     * @return int 影響行數
     */
    int updateData(User entity);

    /**
     * 修改密码
     *
     * @param entity of User
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
}
