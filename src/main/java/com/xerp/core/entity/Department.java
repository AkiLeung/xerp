package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：部門
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class Department extends BaseEntity {

    private static final long serialVersionUID = -8467618436534581906L;

    private String uuid;

    private String parentUuid;

    private String departmentCode;

    private String departmentName;

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
