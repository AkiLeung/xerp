package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：事業部部門
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class BusinessUnit extends BaseEntity {

    private static final long serialVersionUID = -1556608226621195146L;

    private String uuid;

    private String parentUuid;

    private String unitCode;

    private String unitName;

    private String supervisorCode;

    private String supervisorName;

    private String icon;

    private int sort;

    private String status;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
