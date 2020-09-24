package com.xerp.core.service;

import com.xerp.core.entity.BillNumber;
import com.xerp.core.entity.ComLanguage;
import com.xerp.core.entity.PageModel;

import java.util.List;

/**
 * 功能说明：单号配置接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IComLanguageService {

    /**
     * 查询所有
     * @param pager  分页信息
     * @return List<ComLanguage>
     */
    List<ComLanguage> listData(PageModel pager);

    /**
     * 查询所有
     * @param userCode 用户账号
     * @return List<ComLanguage>
     */
    List<ComLanguage> listDataByUserCode(String userCode);

    /**
     * 查询所有
     * @param userCode 用户账号
     * @return List<ComLanguage>
     */
    List<ComLanguage> listDataToFlowSubmit(String userCode);

    /**
     * 統計個數
     * @return int 統計個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return ComLanguage
     */
    List<ComLanguage> listByUuid(String uuid);

    /**
     * 增加，用实体作为参数
     * @param entity of ComLanguage
     * @return int 影響行數
     */
    int insertData(ComLanguage entity);

    /**
     * 修改，用实体作为参数
     * @param entity of ComLanguage
     * @return int 影響行數
     */
    int updateData(ComLanguage entity);

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
