package com.xerp.core.service;

import com.xerp.core.entity.Company;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：公司接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface ICompanyService {

    /**
     * 查询所有
     * @param pager 分頁信息
     * @return List<Company>
     */
    List<Company> listData(PageModel pager);

    /**
     * 統計個數
     * @return int統計的記錄個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return List<Company>
     */
    List<Company> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<Company>
     */
    List<Company> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of CompanyInfo
     * @return int 影響行數
     */
    int insertData(Company entity);

    /**
     * 修改，用实体作为参数
     * @param entity of CompanyInfo
     * @return int 影響行數
     */
    int updateData(Company entity);

    /**
     * 按uuid删除
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 批量删除
     * @param uuids
     * @return int 影響行數
     */
    int deleteDataBatch(String[] uuids);

    /**
     * 公司樹結構
     * @return List<TreeNode>
     */
    List<TreeNode> companyZTree();

    /**
     * 公司樹結構(不分層)
     * @return List<TreeNode>
     */
    List<TreeNode> companyListZTree();

    /**
     * 获取指定的公司樹結構
     * @return List<TreeNode>
     */
    List<TreeNode> companyListZTreeByUuid(String uuid);

    /**
     * 公司樹結構(不分層)
     * @return List<TreeNode>
     */
    List<TreeNode> companyFactoryZTree();

    /**
     * 公司樹結構(不分層)
     * @return List<TreeNode>
     */
    List<TreeNode> companyWarehouseZTree();
}

