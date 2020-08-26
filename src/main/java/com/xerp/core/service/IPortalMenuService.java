package com.xerp.core.service;

import com.xerp.core.entity.PortalMenu;
import com.xerp.core.entity.TreeNode;
import java.util.List;

/**
 * 功能说明：門戶菜單接口
 *
 * @author Joseph
 * @date 20181108
 */
public interface IPortalMenuService {

    /**
     * 查询所有
     *
     * @param portal_uuid 門戶uuid
     * @return List<PortalMenu>
     */
    List<PortalMenu> listData(String portal_uuid);

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return PortalMenuInfo
     */
    PortalMenu listByUuid(String uuid);

    /**
     * 查詢當前菜單及旗下所有子菜單
     *
     * @param parent_uuid
     * @return List<PortalMenu>
     */
    List<PortalMenu> listByParentUuid(String parent_uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<PortalMenu>
     */
    List<PortalMenu> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of PortalMenu
     * @return int 影響行數
     */
    int insertData(PortalMenu entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of PortalMenu
     * @return int 影響行數
     */
    int updateData(PortalMenu entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);

    /**
     * 批量删除
     *
     * @param uuids
     * @return int 影響行數
     */
    int deleteDataBatch(String[] uuids);

    /**
     * 樹結構(用戶默認的門戶菜單)
     *
     * @param portalUuid 門戶uuid
     * @return List<TreeNode>
     */
    List<TreeNode> portalMenuZTree(String portalUuid);

}
