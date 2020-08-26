package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

/**
 * 功能說明：數據字典：數值
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class DataKeyValue extends BaseEntity {

    private static final long serialVersionUID = 2784975559208421113L;

    private String uuid;

    private String status;

    private String typeCode;

    private String keyCode;

    private String keyName;

    private String comment;

    private int sort;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
