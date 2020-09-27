package com.xerp.core.service.impl;

import com.xerp.core.dao.IComLanguageDAO;
import com.xerp.core.entity.ComLanguage;
import com.xerp.core.entity.PageModel;
import com.xerp.core.service.IComLanguageService;
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
public class ComLanguageServiceImpl implements IComLanguageService {

    @Autowired
    IComLanguageDAO daoObject;

    @Override
    public List<ComLanguage> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public List<ComLanguage> listDataToFlowSubmit(String userCode) {
        return daoObject.listDataToFlowSubmit(userCode);
    }


    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public List<ComLanguage> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }


    @Override
    public int insertData(ComLanguage entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(ComLanguage entity) {
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
