package com.xerp.core.dao;

import com.xerp.core.entity.FlowDirection;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：流向 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IFlowDirectionDAO {

    /**
     * 查询所有
     *
     * @param flowUuid 流程UUID
     * @param nodeUuid 環節UUID
     * @return List<FlowDirection>
     */
    List<FlowDirection> listData(String flowUuid, String nodeUuid);

    /**
     * 共計個數
     *
     * @param flowUuid 流程UUID
     * @param nodeUuid 環節UUID
     * @return int 統計個數
     */
    int listCount(String flowUuid, String nodeUuid);

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return List<FlowDirection>
     */
    List<FlowDirection>  listByUuid(String uuid);

    /**
     * 校驗CODE重複
     * @param code
     * @return List<FlowDirection>
     */
    List<FlowDirection>  listByCode(String code);

    /**
     * 按流程ID查詢所有流程
     *
     * @param flow_uuid
     * @return List<FlowDirection>
     */
    List<FlowDirection>  listByFlowUuid(String flow_uuid);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of FlowDirection
     * @return int 影響行數
     */
    int insertData(FlowDirection entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of FlowDirection
     * @return int 影響行數
     */
    int updateData(FlowDirection entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
