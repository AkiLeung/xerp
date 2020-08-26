package com.xerp.core.service.impl;

import com.xerp.core.dao.IFlowDirectionDAO;
import com.xerp.core.entity.FlowDirection;
import com.xerp.core.service.IFlowDirectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：流向 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class FlowDirectionServiceImpl implements IFlowDirectionService {

    @Autowired
    IFlowDirectionDAO daoObject;

    @Override
    public List<FlowDirection> listData(String flowUuid, String nodeUuid) {
        return daoObject.listData(flowUuid,nodeUuid);
    }

    @Override
    public int listCount(String flowUuid,String nodeUuid) {
        return daoObject.listCount(flowUuid,nodeUuid);
    }

    @Override
    public List<FlowDirection>  listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<FlowDirection> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public List<FlowDirection> listByFlowUuid(String flowUuid){
        return daoObject.listByFlowUuid(flowUuid);
    }

    @Override
    public int insertData(FlowDirection entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(FlowDirection entity) {
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
}
