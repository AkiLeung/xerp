package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.cache.annotation.Cacheable;

import javax.persistence.Entity;

/**
 * 功能說明：門戶
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
@Cacheable
public class Portal extends BaseEntity {

    private static final long serialVersionUID = -5263994557219902388L;

    private String uuid;

    private String portalCode;

    private String portalName;

    private String comment;

    private int sort;

    private String status;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
