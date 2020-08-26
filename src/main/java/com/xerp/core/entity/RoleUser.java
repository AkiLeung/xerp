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
public class RoleUser extends BaseEntity {

    private static final long serialVersionUID = 6600508086853903070L;

    private String uuid;

    private String roleCode;

    private String userCode;

    private String userName;

    private String createdBy;

    private String createdDatetime;
}
