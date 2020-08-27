package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：流程模塊
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class BillNumber extends BaseEntity {

    private static final long serialVersionUID = -8795151562165158753L;

    private String uuid;

    private String status;

    private String moduleCode;

    private String moduleName;

    private String preNumWord;

    private String incrementRange;

    private int defaultLength;

    private String currentRange;

    private int currentValue;

    private String createdDatetime;

    private String  updatedDatetime;

}
