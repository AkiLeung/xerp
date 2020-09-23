package com.xerp.module.service.impl;

import com.xerp.module.dao.IOpinionsDAO;
import com.xerp.module.entity.Opinions;
import com.xerp.module.service.IOpinionsService;
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
public class OpinionsServiceImpl implements IOpinionsService {

    @Autowired
    IOpinionsDAO daoObject;

    @Override
    public List<Opinions> listData(String docUuid) {
        return daoObject.listData(docUuid);
    }

    @Override
    public int listCount(String docUuid) {
        return daoObject.listCount(docUuid);
    }

    @Override
    public int insertData(Opinions entity) {
        return daoObject.insertData(entity);
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
