package com.xerp.core.service.impl;

import com.xerp.common.utils.StringUtils;
import com.xerp.core.dao.IBillNumberDAO;
import com.xerp.core.entity.BillNumber;
import com.xerp.core.entity.PageModel;
import com.xerp.core.service.IBillNumberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
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

    @Override
    @Transactional(rollbackFor = Exception.class)
    public BillNumber generateBillNumber(String moduleCode) {
        BillNumber targetNumber = null;
        //设置日期格式
        SimpleDateFormat dateFormat;
        Date date = new Date();
        //获取当前号码
        BillNumber currentNumber = daoObject.queryCurrentNumber(moduleCode);
        if (null != currentNumber) {
            if ("" == currentNumber.getIncrementRange()) {
                //永久持续递增
                currentNumber.setCurrentRange("");
                //号码默认:+1
                currentNumber.setCurrentValue(currentNumber.getCurrentValue() + 1);
            } else {
                //按年/月/日条件递增
                dateFormat = new java.text.SimpleDateFormat(currentNumber.getIncrementRange());
                if (dateFormat.format(date).equals(currentNumber.getCurrentRange())) {
                    //范围内自递增
                    currentNumber.setCurrentValue(currentNumber.getCurrentValue() + 1);
                } else {
                    //范围外重新赋值
                    currentNumber.setCurrentRange(dateFormat.format(date));
                    currentNumber.setCurrentValue(1);
                }
            }
        }
        //更新时间
        currentNumber.setUpdatedDatetime(StringUtils.getDatetime());
        //更新到下一个号码
        int update = daoObject.updateCurrentNumber(currentNumber);
        //获取更新后的号码
        if (update > 0) {
            targetNumber = currentNumber;
            return targetNumber;
        }
        return null;
    }
}
