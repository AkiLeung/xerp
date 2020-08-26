package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：角色
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class Role extends BaseEntity {

    private static final long serialVersionUID = -727776635862155456L;

    private String uuid;

    private String roleCode;

    private String roleName;

    private String status;

    private String comment;

}
