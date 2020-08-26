package com.xerp.core.service.impl;

import com.xerp.core.dao.IMenuOptionDAO;
import com.xerp.core.entity.MenuOption;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IMenuOptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * 功能说明：菜單 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class MenuOptionServiceImpl implements IMenuOptionService {

    @Autowired
    IMenuOptionDAO daoObject;

    @Override
    public List<MenuOption> listData() {
        return daoObject.listData();
    }

    @Override
    public List<MenuOption> listByParentUuid(String parentUuid) {
        return daoObject.listByParentUuid(parentUuid);
    }

    @Override
    public MenuOption listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<MenuOption> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(MenuOption entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(MenuOption entity) {
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
    public List<TreeNode> menuOptionZTree(String parentUuid) {
        List<TreeNode> TreeNode = daoObject.menuOptionZTree(parentUuid);
        return TreeNode;
    }

}
