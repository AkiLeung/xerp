package com.xerp.core.dao;

import com.xerp.core.entity.PortalMenu;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * 功能說明：門戶菜單 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IPortalMenuDAO {

    /**
     * 查询所有
     *
     * @param portalUuid 門戶ID
     * @return List<PortalMenu>
     */
    List<PortalMenu> listData(String portalUuid);

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return PortalMenu
     */
    PortalMenu listByUuid(String uuid);

    /**
     * 查询所有
     *
     * @param parentUuid 父鍵
     * @return List<PortalMenu>
     */
    List<PortalMenu> listByParentUuid(String parentUuid);

    /**
     * 校驗CODE是否重複
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
     * 樹結構
     *
     * @param portalUuid
     * @return List<TreeNode>
     */
    List<TreeNode> portalMenuZTree(String portalUuid);

}
