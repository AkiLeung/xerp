package com.xerp.core.dao;

import com.xerp.core.entity.ComLanguage;
import com.xerp.core.entity.PageModel;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：流程模塊 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IComLanguageDAO {

    /**
     * 查询所有
     * @param pager 分頁信息
     * @return List<ComLanguage>
     */
    List<ComLanguage> listData(PageModel pager);

    /**
     * 查询所有
     * @param userCode 用户账号
     * @return List<ComLanguage>
     */
    List<ComLanguage> listDataToFlowSubmit(String userCode);

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
     * @return ComLanguage
     */
    List<ComLanguage> listByUuid(String uuid);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of ComLanguage
     * @return int 影響行數
     */
    int insertData(ComLanguage entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of ComLanguage
     * @return int 影響行數
     */
    int updateData(ComLanguage entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
