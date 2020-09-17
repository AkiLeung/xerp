package com.xerp.module.dao;

import com.xerp.core.entity.PageModel;
import com.xerp.module.entity.Vacation;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：流程模塊 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IVacationDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<Vacation>
     */
    List<Vacation> listData(PageModel pager);

    /**
     * 查询所有
     * @param curHandlerNum
     * @param pager 分頁信息
     * @return List<Vacation>
     */
    List<Vacation> listDataToHandler(String curHandlerNum,PageModel pager);

    /**
     * 統計個數
     *
     * @return int 統計個數
     */
    int listCount();

    /**
     * 統計個數
     * @param curHandlerNum
     * @return int 統計個數
     */
    int listCountToHandler(String curHandlerNum);

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return BillNumber
     */
    List<Vacation> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<Vacation>
     */
    List<Vacation> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of Vacation
     * @return int 影響行數
     */
    int insertData(Vacation entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of Vacation
     * @return int 影響行數
     */
    int updateData(Vacation entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
