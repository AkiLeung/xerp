package com.xerp.hrms.service.impl;

import com.xerp.core.entity.PageModel;
import com.xerp.hrms.service.IPersonDocsService;
import com.xerp.hrms.dao.IPersonDocsDAO;
import com.xerp.hrms.entity.PersonDocs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：人事模块 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class PersionDocsServiceImpl implements IPersonDocsService {

    @Autowired
    IPersonDocsDAO daoObject;

    @Override
    public List<PersonDocs> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public List<PersonDocs> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<PersonDocs> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(PersonDocs entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(PersonDocs entity) {
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
