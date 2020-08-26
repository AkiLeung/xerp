package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：工廠
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class Factory extends BaseEntity {

    private static final long serialVersionUID = 8809598712753577544L;

    private String uuid;

    private String companyUuid;

    private String factoryCode;

    private String factoryName;

    private String address;

    private int sort;

    private String status;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
