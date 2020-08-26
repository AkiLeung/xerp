package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

/**
 * 功能說明：流程模塊
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class FlowModule extends BaseEntity {

    private static final long serialVersionUID = 7870216515065285858L;

    private String uuid;

    private String status;

    private String moduleCode;

    private String moduleName;

    private String comment;

    private String sort;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
