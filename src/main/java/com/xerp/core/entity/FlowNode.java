package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：流程節點
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Data
@Entity
public class FlowNode extends BaseEntity {

    private static final long serialVersionUID = 1640867713767768585L;

    private String uuid;

    private String flowUuid;

    private String status;

    private int nodeCode;

    private String nodeName;

    private String nodeType;

    private String gooflowType;

    private String gooflowLeft;

    private String gooflowTop;

    private String gooflowWidth;

    private String gooflowHeight;

    private String gooflowAlt;

    private String comment;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
