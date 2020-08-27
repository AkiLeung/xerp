package com.xerp.core.service.impl;

import com.xerp.core.dao.IBillNumberDAO;
import com.xerp.core.entity.BillNumber;
import com.xerp.core.entity.PageModel;
import com.xerp.core.service.IBillNumberService;
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
public class BillNumberServiceImpl implements IBillNumberService {

    @Autowired
    IBillNumberDAO daoObject;

    @Override
    public List<BillNumber> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public List<BillNumber> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<BillNumber> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(BillNumber entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(BillNumber entity) {
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
