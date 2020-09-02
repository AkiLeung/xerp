package com.xerp.core.service.impl;

import com.xerp.core.dao.IFlowNodeDAO;
import com.xerp.core.entity.FlowNode;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IFlowNodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：流程節點 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class FlowNodeServiceImpl implements IFlowNodeService {

    @Autowired
    IFlowNodeDAO daoObject;

    @Override
    public List<FlowNode> listData(String flowUuid) {
        return daoObject.listData(flowUuid);
    }

    @Override
    public int listCount(String flow_uuid) {
        return daoObject.listCount(flow_uuid);
    }

    @Override
    public List<FlowNode> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<FlowNode> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public List<FlowNode> getStartNodeByFlowUuid(String flowUuid){
        return daoObject.getStartNodeByFlowUuid(flowUuid);
    }

    @Override
    public int insertData(FlowNode entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(FlowNode entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int deleteData(String uuid) {
        return daoObject.deleteData(uuid);
    }

    @Override
    public int deleteDataBatch(String[] uuids) {
        int int_delete = 0;
        for (int i = 0; i < uuids.length; i++) {
            int_delete = int_delete + daoObject.deleteData(uuids[i]);
        }
        return int_delete;
    }

    @Override
    public List<TreeNode> flowNodeZTree(String flow_uuid) {
        List<TreeNode> treeNodes = daoObject.flowNodeZTree(flow_uuid);
        return treeNodes;
    }
}
