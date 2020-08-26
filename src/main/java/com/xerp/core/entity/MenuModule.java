package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

/**
 * 功能說明：菜單模塊
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class MenuModule extends BaseEntity {

    private static final long serialVersionUID = -7975347286891629737L;

    private String uuid;

    private String status;

    private String moduleCode;

    private String moduleName;

    private String moduleIcons;

    private String comment;

    private int sort;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
