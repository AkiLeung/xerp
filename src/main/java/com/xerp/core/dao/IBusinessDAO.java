package com.xerp.core.dao;

import com.xerp.core.entity.Business;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：事業部 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IBusinessDAO {

    /**
     * 查询所有
     *
     * @return List<Business>
     */
    List<Business> listData(PageModel pager);


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
     * @return List<Business>
     */
    List<Business> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<Business>
     */
    List<Business> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Business
     * @return int 影響行數
     */
    int insertData(Business entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Business
     * @return int 影響行數
     */
    int updateData(Business entity);

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
    List<TreeNode> businessListZTree();

    /**
     * 樹結構
     *
     * @return List<TreeNode>
     */
    List<TreeNode> businessListZTreeByUuid(String uuid);

}
