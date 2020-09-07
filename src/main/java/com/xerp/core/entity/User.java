package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.cache.annotation.Cacheable;

import javax.persistence.Entity;

/**
 * @author Joseph.L
 * @date 2019-09-02
 * @description
 */
@Entity
@Data
@Cacheable
public class User extends BaseEntity {

    private static final long serialVersionUID = 8714560248831178768L;

    private String uuid;

    private String hrUuid;

    private String userCode;

    private String userName;

    private String userType;

    private String password;

    private String salt;

    private String status;

    private String theme;

    private String portalUuid;

    private String cmpUuid;

    private String depUuid;

    private String busUuid;

    private String busUnitUuid;

    private String validFrom;

    private String validTo;

    private String language;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
