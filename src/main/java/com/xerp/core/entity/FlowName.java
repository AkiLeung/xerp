package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：流程
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class FlowName extends BaseEntity {

    private static final long serialVersionUID = -8794827176162617015L;

    private String uuid;

    private String moduleCode;

    private String status;

    private String flowCode;

    private String flowName;

    private String flowVersion;

    private String comment;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
