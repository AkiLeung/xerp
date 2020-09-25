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
public class Opinions extends BaseEntity {

    private static final long serialVersionUID = -7612875431459383167L;

    private String uuid;

    private String docUuid;

    private String userCode;

    private String userName;

    private String flowFrmNodeName;

    private String flowTgtNodeName;

    private String opinions;

    private String createdDatetime;

}
