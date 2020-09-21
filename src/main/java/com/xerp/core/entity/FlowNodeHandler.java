package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：流程節點-办理人
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Data
@Entity
public class FlowNodeHandler extends BaseEntity {

    private static final long serialVersionUID = 6288456245447677701L;

    private String uuid;

    private String nodeUuid;

    private String handlerCode;

    private String handlerName;

}
