package com.xerp.module.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.module.entity.Opinions;
import com.xerp.module.entity.Vacation;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：流程模塊 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IOpinionsDAO {

    /**
     * 查询所有
     *
     * @param docUuid 文档字段
     * @return List<Opinions>
     */
    List<Opinions> listData(String docUuid);

    /**
     * 統計個數
     * @param docUuid 文档字段
     * @return int 統計個數
     */
    int listCount(String docUuid);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Opinions
     * @return int 影響行數
     */
    int insertData(Opinions entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
