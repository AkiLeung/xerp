package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：菜戶
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class Warehouse extends BaseEntity {

    private static final long serialVersionUID = 1405857628182591767L;

    private String uuid;

    private String companyUuid;

    private String warehouseCode;

    private String warehouseName;

    private String address;

    private String comment;

    private int sort;

    private String status;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
