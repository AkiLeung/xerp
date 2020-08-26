package com.xerp.core.dao;

import com.xerp.core.entity.Location;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：工廠 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface ILocationDAO {

    /**
     * 查询所有
     *
     * @return List<Location>
     */
    List<Location> listData();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return List<Location>
     */
    List<Location> listByUuid(String uuid);

    /**
     * 檢驗CODE是否重複
     *
     * @param code
     * @return List<Location>
     */
    List<Location> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Location
     * @return int 影響行數
     */
    int insertData(Location entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Location
     * @return int 影響行數
     */
    int updateData(Location entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 樹結構
     *
     * @return List<TreeNode>
     */
    List<TreeNode> locationZTree();
}
