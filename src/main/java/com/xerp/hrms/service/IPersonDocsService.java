package com.xerp.hrms.service;

import com.xerp.core.entity.PageModel;
import com.xerp.hrms.entity.PersonDocs;

import java.util.List;

/**
 * 功能说明：人事档案
 *
 * @author Joseph
 * @date 20181108
 */
public interface IPersonDocsService {

    /**
     * 查询所有
     * @param pager  分页信息
     * @return List<PersonDocs>
     */
    List<PersonDocs> listData(PageModel pager);

    /**
     * 統計個數
     * @return int 統計個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return PersonDocs
     */
    List<PersonDocs> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<PersonDocs>
     */
    List<PersonDocs> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of PersonDocs
     * @return int 影響行數
     */
    int insertData(PersonDocs entity);

    /**
     * 修改，用实体作为参数
     * @param entity of PersonDocs
     * @return int 影響行數
     */
    int updateData(PersonDocs entity);

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

}
