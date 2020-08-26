package com.xerp.core.service;

import com.xerp.core.entity.FlowNode;
import com.xerp.core.entity.TreeNode;

import java.util.List;

/**
 * 功能说明：流程節點接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IFlowNodeService {

    /**
     * 查询所有
     * @param flowUuid  流程UUID
     * @return List<FlowNode>
     */
    List<FlowNode> listData(String flowUuid);

    /**
     * 統計個數
     * @param flowUuid  流程UUID
     * @return int 統計個數
     */
    int listCount(String flowUuid);

    /**
     * 只查询一个，常用于修改
     * @param uuid
     * @return List<FlowNode>
     */
    List<FlowNode> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     * @param code
     * @return List<FlowNode>
     */
    List<FlowNode> listByCode(String code);

    /**
     * 增加，用实体作为参数
     * @param entity of FlowNode
     * @return int 影響行數
     */
    int insertData(FlowNode entity);

    /**
     * 修改，用实体作为参数
     * @param entity of FlowNode
     * @return int 影響行數
     */
    int updateData(FlowNode entity);

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

    /**
     * 樹結構
     * @param flow_uuid
     * @return int 影響行數
     */
    List<TreeNode> flowNodeZTree(String flowUuid);
}
