package com.xerp.module.service.impl;

import com.xerp.core.dao.IBillNumberDAO;
import com.xerp.core.entity.PageModel;
import com.xerp.module.dao.IVacationDAO;
import com.xerp.module.entity.Vacation;
import com.xerp.module.service.IVacationService;
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
public class VacationServiceImpl implements IVacationService {

    @Autowired
    IVacationDAO daoObject;

    @Override
    public List<Vacation> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public List<Vacation> listDataToHandler(PageModel pager) {
        return daoObject.listDataToHandler(pager);
    }

    @Override
    public List<Vacation> listDataToMyApply(PageModel pager) {
        return daoObject.listDataToMyApply(pager);
    }

    @Override
    public List<Vacation> listDataToAllApply(PageModel pager) {
        return daoObject.listDataToAllApply(pager);
    }

    @Override
    public List<Vacation> listDataToUnFinish(PageModel pager) {
        return daoObject.listDataToUnFinish(pager);
    }

    @Override
    public List<Vacation> listDataToIsFinish(PageModel pager) {
        return daoObject.listDataToIsFinish(pager);
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public int listCountToHandler(String curUserCode) {
        return daoObject.listCountToHandler(curUserCode);
    }

    @Override
    public int listCountToMyApply(String curUserCode) {
        return daoObject.listCountToMyApply(curUserCode);
    }

    @Override
    public int listCountToAllApply() {
        return daoObject.listCountToAllApply();
    }

    @Override
    public int listCountToUnFinish() {
        return daoObject.listCountToUnFinish();
    }

    @Override
    public int listCountToIsFinish() {
        return daoObject.listCountToIsFinish();
    }

    @Override
    public List<Vacation> listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public int insertData(Vacation entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(Vacation entity) {
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
