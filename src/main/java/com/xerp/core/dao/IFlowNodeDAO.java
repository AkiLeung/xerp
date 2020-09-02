package com.xerp.core.dao;

import com.xerp.core.entity.FlowNode;
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
public interface IFlowNodeDAO {

    /**
     * 查询所有
     *
     * @param flowUuid 流程UUID
     * @return List<FlowNode>
     */
    List<FlowNode> listData(String flowUuid);

    /**
     * 統計個數
     *
     * @param flowUuid 流程UUID
     * @return int 統計個數
     */
    int listCount(String flowUuid);

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return List<FlowNode>
     */
    List<FlowNode>  listByUuid(String uuid);

    /**
     * 校驗CODE重複
     *
     * @param code
     * @return List<FlowNode>
     */
    List<FlowNode> listByCode(String code);

    /**
     * 樹結構
     *
     * @param flowUuid
     * @return int 影響行數
     */
    List<TreeNode> flowNodeZTree(String flowUuid);

    /**
     * 获取指定环节
     *
     * @param flowUuid
     * @return List<FlowNode>
     */
    List<FlowNode> getStartNodeByFlowUuid(String flowUuid);


    /**
     * 增加，用实体作为参数
     *
     * @param entity of FlowNode
     * @return int 影響行數
     */
    int insertData(FlowNode entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of FlowNode
     * @return int 影響行數
     */
    int updateData(FlowNode entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);


}
