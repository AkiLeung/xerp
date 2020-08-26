package com.xerp.core.service.impl;

import com.xerp.core.dao.IFlowModuleDAO;
import com.xerp.core.entity.FlowModule;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IFlowModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：流程模塊 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class FlowModuleServiceImpl implements IFlowModuleService {

    @Autowired
    IFlowModuleDAO daoObject;

    @Override
    public List<FlowModule> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public List<FlowModule> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<FlowModule> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(FlowModule entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(FlowModule entity) {
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
    public List<TreeNode> flowModuleZTree() {
        List<TreeNode> treeNodes = daoObject.flowModuleZTree();
        return treeNodes;
    }
}
