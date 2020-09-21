package com.xerp.core.service.impl;

import com.xerp.core.dao.IFlowNodeHandlerDAO;
import com.xerp.core.entity.FlowNodeHandler;
import com.xerp.core.service.IFlowNodeHandlerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：流程節點 POJO
 *
 * @author Joseph
 * @date 20200908
 */
@Service
public class FlowNodeHandlerServiceImpl implements IFlowNodeHandlerService {

    @Autowired
    IFlowNodeHandlerDAO daoObject;

    @Override
    public List<FlowNodeHandler> listData(String nodeUuid) {
        return daoObject.listData(nodeUuid);
    }

    @Override
    public int listCount(String nodeUuid) {
        return daoObject.listCount(nodeUuid);
    }

    @Override
    public List<FlowNodeHandler> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public int insertData(FlowNodeHandler entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(FlowNodeHandler entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int deleteDataByUuid(String uuid) {
        return daoObject.deleteDataByUuid(uuid);
    }

    @Override
    public int deleteDataBatchByUuid(String[] uuids) {
        int int_delete = 0;
        for (int i = 0; i < uuids.length; i++) {
            int_delete = int_delete + daoObject.deleteDataByUuid(uuids[i]);
        }
        return int_delete;
    }

    @Override
    public int deleteDataByNodeUuid(String nodeUuid) {
        return daoObject.deleteDataByNodeUuid(nodeUuid);
    }

}
