package com.xerp.hrms.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.hrms.entity.PersonDocs;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：流程模塊 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IPersonDocsDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<PersonDocs>
     */
    List<PersonDocs> listData(PageModel pager);

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
     * @return PersonDocs
     */
    List<PersonDocs> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<PersonDocs>
     */
    List<PersonDocs> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Vacation
     * @return int 影響行數
     */
    int insertData(PersonDocs entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Vacation
     * @return int 影響行數
     */
    int updateData(PersonDocs entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
