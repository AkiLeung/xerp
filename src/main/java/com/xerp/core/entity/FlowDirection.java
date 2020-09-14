package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

/**
 * 功能說明：流向
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Data
@Entity
public class FlowDirection extends BaseEntity {

    private static final long serialVersionUID = -8065573857105256413L;

    private String uuid;

    private String flowUuid;

    private String nodeUuid;

    private String directionType;

    private String directionCode;

    private String directionName;

    private String targetNodeUuid;

    private String targetNodeType;

    private String targetNodeCode;

    private String targetNodeName;

    private String gooflowType;

    private String gooflowM;

    private String gooflowAlt;

    private String comment;

    private int sort;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
