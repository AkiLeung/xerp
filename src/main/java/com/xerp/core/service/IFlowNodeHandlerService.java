package com.xerp.core.service;

import com.xerp.core.entity.FlowNode;
import com.xerp.core.entity.FlowNodeHandler;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：流程節點接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IFlowNodeHandlerService {

    /**
     * 查询所有
     * @param nodeUuid  流程UUID
     * @return List<FlowNodeHandler>
     */
    List<FlowNodeHandler> listData(String nodeUuid);

    /**
     * 統計個數
     * @param nodeUuid  流程UUID
     * @return int 統計個數
     */
    int listCount(String nodeUuid);

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return List<FlowNodeHandler>
     */
    List<FlowNodeHandler> listByUuid(String uuid);

    /**
     * 增加，用实体作为参数
     * @param entity of FlowNodeHandler
     * @return int 影響行數
     */
    int insertData(FlowNodeHandler entity);

    /**
     * 修改，用实体作为参数
     * @param entity of FlowNodeHandler
     * @return int 影響行數
     */
    int updateData(FlowNodeHandler entity);

    /**
     * 按uuid删除
     * @param uuid
     * @return int 影響行數
     */
    int deleteDataByUuid(String uuid);

    /**
     * 批量删除
     * @param uuids
     * @return int 影響行數
     */
    int deleteDataBatchByUuid(String[] uuids);

    /**
     * 按uuid删除
     * @param nodeUuid
     * @return int 影響行數
     */
    int deleteDataByNodeUuid(String nodeUuid);
}
