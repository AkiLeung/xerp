package com.xerp.core.dao;

import com.xerp.core.entity.BillNumber;
import com.xerp.core.entity.PageModel;
import com.xerp.core.entity.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能說明：流程模塊 DAO
 *
 * @author Joseph.L
 * @version 2018-11-15
 */
@Repository
public interface IBillNumberDAO {

    /**
     * 查询所有
     *
     * @param pager 分頁信息
     * @return List<BillNumber>
     */
    List<BillNumber> listData(PageModel pager);

    /**
     * 統計個數
     *
     * @return int 統計個數
     */
    int listCount();

    /**
     * 只查询一个，常用于修改
     *
     * @param uuid
     * @return BillNumber
     */
    List<BillNumber> listByUuid(String uuid);

    /**
     * 只查询一个，常用于校驗
     *
     * @param code
     * @return List<BillNumber>
     */
    List<BillNumber> listByCode(String code);

    /**
     * 增加，用实体作为参数
     *
     * @param entity of BillNumber
     * @return int 影響行數
     */
    int insertData(BillNumber entity);

    /**
     * 修改，用实体作为参数
     *
     * @param entity of BillNumber
     * @return int 影響行數
     */
    int updateData(BillNumber entity);

    /**
     * 按uuid删除
     *
     * @param uuid
     * @return int 影響行數
     */
    int deleteData(String uuid);


    /**
     * 查询当前最后的号码
     *
     * @param moduleCode
     * @return BillNumber
     */
    BillNumber queryCurrentNumber(String moduleCode);

    /**
     * 更新数据
     * 更新字段：current_range current_value updated_datetime
     * @param billNumber
     * @return int 影响行数
     * **/
    int updateCurrentNumber(BillNumber billNumber);

}
