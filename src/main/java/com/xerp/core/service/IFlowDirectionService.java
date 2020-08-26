package com.xerp.core.service;

import com.xerp.core.entity.FlowDirection;

import java.util.List;

/**
 * 功能说明：流向接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IFlowDirectionService {

    /**
     * 查询所有 流向
     * @param flowUuid  流程UUID
     * @param nodeUuid  節點UUID
     * @return List<FlowDirection>
     */
    List<FlowDirection> listData(String flowUuid, String nodeUuid);

    /**
     * 統計個數
     * @param flowUuid  流程UUID
     * @param nodeUuid  節點UUID
     * @return int 影響行數
     */
    int listCount(String flowUuid, String nodeUuid);

    /**
     * 只查询一个，常用于修改
     * @param uuid 流向
     * @return List<FlowDirection>
     */
    List<FlowDirection> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<FlowDirection>
     */
    List<FlowDirection> listByCode(String code);

    /**
     * 只查询流程下的流向
     * @param flowUuid 流程UUID
     * @return List<FlowDirection>
     */
    List<FlowDirection> listByFlowUuid(String flowUuid);

    /**
     * 增加，用实体作为参数
     * @param entity of FlowDirection
     * @return int 影響行數
     */
    int insertData(FlowDirection entity);

    /**
     * 修改，用实体作为参数
     * @param entity of FlowDirection
     * @return int 影響行數
     */
    int updateData(FlowDirection entity);

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
