package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：权限
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class Permission extends BaseEntity {

    private static final long serialVersionUID = -4273051242859286088L;

    private String uuid;

    private String permissionCode;

    private String permissionName;

    private String permissionUrl;

    private String type;

    private String icon;

    private String status;

    private String comment;

}
