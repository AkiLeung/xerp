package com.xerp.module.service;

import com.xerp.core.entity.PageModel;
import com.xerp.module.entity.Opinions;
import com.xerp.module.entity.Vacation;

import java.util.List;

/**
 * 功能说明：单号配置接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IOpinionsService {

    /**
     * 查询所有
     * @param docUuid  文档ID
     * @return List<Opinions>
     */
    List<Opinions> listData(String docUuid);

    /**
     * 統計個數
     * @param docUuid  文档ID
     * @return int 統計個數
     */
    int listCount(String docUuid);

    /**
     * 增加，用实体作为参数
     * @param entity of Opinions
     * @return int 影響行數
     */
    int insertData(Opinions entity);

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
