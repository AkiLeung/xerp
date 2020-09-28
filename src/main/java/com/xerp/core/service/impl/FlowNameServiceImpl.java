package com.xerp.core.service.impl;

import com.xerp.common.utils.StringUtils;
import com.xerp.core.dao.IFlowNameDAO;
import com.xerp.core.entity.FlowName;
import com.xerp.core.entity.PageModel;
import com.xerp.core.service.IFlowNameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：流程 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class FlowNameServiceImpl implements IFlowNameService {

    @Autowired
    IFlowNameDAO daoObject;

    @Override
    public List<FlowName> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public List<FlowName> listByUuid(String uuid) {
        if (StringUtils.isEmpty(uuid)) {
            return null;
        }
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<FlowName> listByCode(String code) {
        if (StringUtils.isEmpty(code)) {
            return null;
        }
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(FlowName entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(FlowName entity) {
        return daoObject.updateData(entity);
    }

    @Override
    public int deleteData(String uuid) {
        if (StringUtils.isEmpty(uuid)) {
            return 0;
        }
        return daoObject.deleteData(uuid);
    }

    @Override
    public int deleteDataBatch(String[] uuids) {
        int delete = 0;
        for (int i = 0; i < uuids.length; i++) {
            delete = delete + daoObject.deleteData(uuids[i]);
        }
        return delete;
    }
}
