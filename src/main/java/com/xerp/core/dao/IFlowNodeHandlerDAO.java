package com.xerp.core.dao;

import com.xerp.core.entity.FlowNode;
import com.xerp.core.entity.FlowNodeHandler;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：流程環節 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IFlowNodeHandlerDAO {

    /**
     * 查询所有
     *
     * @param nodeUuid 节点UUID
     * @return List<FlowNodeHandler>
     */
    List<FlowNodeHandler> listData(String nodeUuid);

    /**
     * 統計個數
     *
     * @param nodeUuid 节点UUID
     * @return int 統計個數
     */
    int listCount(String nodeUuid);

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return List<FlowNodeHandler>
     */
    List<FlowNodeHandler>  listByUuid(String uuid);


    /**
     * 增加，用实体作为参数
     *
     * @param entity of FlowNodeHandler
     * @return int 影響行數
     */
    int insertData(FlowNodeHandler entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of FlowNodeHandler
     * @return int 影響行數
     */
    int updateData(FlowNodeHandler entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteDataByUuid(String uuid);

    /**
     * 按uuid删除
     *
     * @param nodeUuid
     * @return int 影響行數
     */
    int deleteDataByNodeUuid(String nodeUuid);
}
