package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：事業部
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class Business extends BaseEntity {

    private static final long serialVersionUID = 6714399041585517439L;

    private String uuid;

    private String businessCode;

    private String businessName;

    private String supervisorCode;

    private String supervisorName;

    private String comment;

    private int sort;

    private String status;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
