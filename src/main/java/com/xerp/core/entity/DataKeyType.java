package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

/**
 * 功能說明：數據字典：類型
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class DataKeyType extends BaseEntity {

    private static final long serialVersionUID = 8717612672126504029L;

    private String uuid;

    private String status;

    private String typeCode;

    private String typeName;

    private int sort;
}
