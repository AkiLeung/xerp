package com.xerp.core.service;

import com.xerp.core.entity.BillNumber;
import com.xerp.core.entity.PageModel;

import java.util.List;

/**
 * 功能说明：单号配置接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IBillNumberService {

    /**
     * 查询所有
     * @param pager  分頁嘻嘻
     * @return List<BillNumber>
     */
    List<BillNumber> listData(PageModel pager);

    /**
     * 統計個數
     * @return int 統計個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return BillNumber
     */
    List<BillNumber> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<BillNumber>
     */
    List<BillNumber> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of BillNumber
     * @return int 影響行數
     */
    int insertData(BillNumber entity);

    /**
     * 修改，用实体作为参数
     * @param entity of BillNumber
     * @return int 影響行數
     */
    int updateData(BillNumber entity);

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
