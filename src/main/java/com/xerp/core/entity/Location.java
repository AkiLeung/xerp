package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：库位
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class Location extends BaseEntity {

    private static final long serialVersionUID = 1820887135447166064L;

    private String uuid;

    private String factoryUuid;

    private String locationCode;

    private String locationName;

    private String comment;

    private int sort;

    private String status;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
