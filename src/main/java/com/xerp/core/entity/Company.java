package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：公司
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class Company extends BaseEntity {

    private static final long serialVersionUID = 1563029019065590371L;

    private String uuid;

    private String parentUuid;

    private String parentName;

    private String companyCode;

    private String companyName;

    private String address;

    private String city;

    private String country;

    private String language;

    private String telephone;

    private String faxNumber;

    private String email;

    private String supervisorCode;

    private String supervisorName;

    private String comment;

    private String factory;

    private String warehouse;

    private int sort;

    private String status;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
