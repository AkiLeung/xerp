package com.xerp.core.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.Portal;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：門戶 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IPortalDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<PortalInfo>
     */
    List<Portal> listData(PageModel pager);

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
     * @return Portal
     */
    Portal listByUuid(String uuid);

    /**
     * 樹結構 列表
     *
     * @return List<TreeNode>
     */
    List<TreeNode> listZTree();

    /**
     * 校驗CODE是否重複
     *
     * @param code
     * @return List<Portal>
     */
    List<Portal> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Portal
     * @return int 影響行數
     */
    int insertData(Portal entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Portal
     * @return int 影響行數
     */
    int updateData(Portal entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

}
