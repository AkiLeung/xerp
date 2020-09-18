package com.xerp.module.service;

import com.xerp.module.entity.Vacation;
import com.xerp.core.entity.PageModel;

import java.util.List;

/**
 * 功能说明：单号配置接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IVacationService {

    /**
     * 查询所有
     * @param pager  分页信息
     * @return List<Vacation>
     */
    List<Vacation> listData(PageModel pager);

    /**
     * 查询所有
     * @param pager  分页信息
     * @return List<Vacation>
     */
    List<Vacation> listDataToHandler(PageModel pager);


    /**
     * 統計個數
     * @return int 統計個數
     */
    int listCount();

    /**
     * 統計個數
     * @param curHandlerNum
     * @return int 統計個數
     */
    int listCountToHandler(String curHandlerNum);

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return Vacation
     */
    List<Vacation> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<Vacation>
     */
    List<Vacation> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of Vacation
     * @return int 影響行數
     */
    int insertData(Vacation entity);

    /**
     * 修改，用实体作为参数
     * @param entity of Vacation
     * @return int 影響行數
     */
    int updateData(Vacation entity);

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
