package com.xerp.module.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * @author: JOSEPH.L
 * @date: 2020/9/1 16:36
 * @description:
 * @version: 1.0
 */
@Entity
@Data
public class Vacation extends BaseEntity {

    private static final long serialVersionUID = -9190771323957836829L;

    private String uuid;

    private String billNumber;

    private String subject;

    private String message;

    private String flowUuid;

    private String flowName;

    private String flowNodeUuid;

    private String flowNodeType;

    private int flowNodeNum;

    private String flowNodeNam;

    private String flowCreatorNum;

    private String flowCreatorNam;

    private String curHandlerNum;

    private String curHandlerNam;

    private String createdDatetime;

    private String updatedDatetime;

}
