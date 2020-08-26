package com.xerp.core.service.impl;

import com.xerp.core.dao.IMenuModuleDAO;
import com.xerp.core.entity.MenuModule;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import com.xerp.core.service.IMenuModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能说明：菜單模塊 POJO
 *
 * @author Joseph
 * @date 20181108
 */
@Service
public class MenuModuleServiceImpl implements IMenuModuleService {

    @Autowired
    IMenuModuleDAO daoObject;

    @Override
    public List<MenuModule> listData(PageModel pager) {
        return daoObject.listData(pager);
    }

    @Override
    public List<MenuModule> listData() {
        return daoObject.listData();
    }

    @Override
    public int listCount() {
        return daoObject.listCount();
    }

    @Override
    public MenuModule listByUuid(String uuid) {
        return daoObject.listByUuid(uuid);
    }

    @Override
    public List<MenuModule> listByCode(String code) {
        return daoObject.listByCode(code);
    }

    @Override
    public int insertData(MenuModule entity) {
        return daoObject.insertData(entity);
    }

    @Override
    public int updateData(MenuModule entity) {
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
    public List<TreeNode> menuModuleListZTree() {
        List<TreeNode> TreeNode = daoObject.menuModuleListZTree();
        return TreeNode;
    }
}
