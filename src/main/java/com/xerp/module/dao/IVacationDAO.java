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
     * @param pager
     * @param pager 分頁信息
     * @return List<Vacation>
     */
    List<Vacation> listDataToHandler(PageModel pager);

    /**
     * 查询所有
     * @param pager
     * @param pager 分頁信息
     * @return List<Vacation>
     */
    List<Vacation> listDataToMyApply(PageModel pager);

    /**
     * 查询所有
     * @param pager
     * @param pager 分頁信息
     * @return List<Vacation>
     */
    List<Vacation> listDataToAllApply(PageModel pager);

    /**
     * 查询所有
     * @param pager
     * @param pager 分頁信息
     * @return List<Vacation>
     */
    List<Vacation> listDataToUnFinish(PageModel pager);

    /**
     * 查询所有
     * @param pager
     * @param pager 分頁信息
     * @return List<Vacation>
     */
    List<Vacation> listDataToIsFinish(PageModel pager);


    /**
     * 統計個數
     *
     * @return int 統計個數
     */
    int listCount();

    /**
     * 統計個數
     * @param curUserCode
     * @return int 統計個數
     */
    int listCountToHandler(String curUserCode);

    /**
     * 統計個數
     * @param curUserCode
     * @return int 統計個數
     */
    int listCountToMyApply(String curUserCode);

    /**
     * 統計個數
     *
     * @return int 統計個數
     */
    int listCountToAllApply();

    /**
     * 統計個數
     *
     * @return int 統計個數
     */
    int listCountToUnFinish();

    /**
     * 統計個數
     *
     * @return int 統計個數
     */
    int listCountToIsFinish();


    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return BillNumber
     */
    List<Vacation> listByUuid(String uuid);

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
     * 保存，用实体作为参数
     *
     * @param entity of Vacation
     * @return int 影響行數
     */
    int saveData(Vacation entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);
}
