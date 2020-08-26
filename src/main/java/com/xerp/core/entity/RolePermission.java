package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import org.springframework.cache.annotation.Cacheable;

import javax.persistence.Entity;

/**
 * 功能說明：角色权限
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
@Cacheable
public class RolePermission extends BaseEntity {

    private static final long serialVersionUID = -5830996113663861507L;

    private String uuid;

    private String roleCode;

    private String permissionCode;

    private String permissionName;

    private String permissionUrl;

    private String createdBy;

    private String createdDatetime;
}
