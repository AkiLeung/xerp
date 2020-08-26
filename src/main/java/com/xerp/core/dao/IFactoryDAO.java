package com.xerp.core.dao;

import com.xerp.core.entity.Factory;
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
public interface IFactoryDAO {

    /**
     * 查询所有
     *
     * @return List<Factory>
     */
    List<Factory> listData();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return List<Factory>
     */
    List<Factory> listByUuid(String uuid);

    /**
     * 檢驗CODE是否重複
     *
     * @param code
     * @return List<Factory>
     */
    List<Factory> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Factory
     * @return int 影響行數
     */
    int insertData(Factory entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Factory
     * @return int 影響行數
     */
    int updateData(Factory entity);

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
     * @param parentUuid
     * @return List<TreeNode>
     */
    List<TreeNode> factoryZTree(String parentUuid);

    /**
     * 樹結構 工廠列表
     *
     * @return List<TreeNode>
     */
    List<TreeNode> companyFactoryZTree();
}
