package com.xerp.core.dao;

import com.xerp.core.entity.FlowName;
import com.xerp.core.entity.PageModel;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * 功能說明：流程名稱 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IFlowNameDAO {

    /**
     * 查询所有
     * @param pager 分頁信息
     * @return List<FlowName>
     */
    List<FlowName> listData(PageModel pager);

    /**
     * 統計個數
     * @param
     * @return int 統計個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return FlowName
     */
    List<FlowName>  listByUuid(String uuid);

    /**
     * 校驗CODE重複
     *
     * @param code
     * @return FlowName
     */
    List<FlowName>  listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of FlowName
     * @return int 影響行數
     */
    int insertData(FlowName entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of FlowName
     * @return int 影響行數
     */
    int updateData(FlowName entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
