package com.xerp.core.dao;

import com.xerp.core.entity.Company;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：公司 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface ICompanyDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<Company>
     */
    List<Company> listData(PageModel pager);

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
     * @return List<Company>
     */
    List<Company> listByUuid(String uuid);

    /**
     * 校驗CODE是否重複
     *
     * @param code
     * @return List<Company>
     */
    List<Company> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Company
     * @return int 影響行數
     */
    int insertData(Company entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Company
     * @return int 影響行數
     */
    int updateData(Company entity);

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
    List<TreeNode> companyZTree();

    /**
     * 樹結構 列表
     *
     * @return List<TreeNode>
     */
    List<TreeNode> companyListZTree();

    /**
     * 樹結構 工廠列表
     *
     * @return List<TreeNode>
     */
    List<TreeNode> companyFactoryZTree();

    /**
     * 樹結構 貨倉列表
     *
     * @return List<TreeNode>
     */
    List<TreeNode> companyWarehouseZTree();
}
