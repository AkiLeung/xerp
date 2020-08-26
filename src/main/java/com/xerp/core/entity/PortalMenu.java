package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import org.springframework.cache.annotation.Cacheable;

import javax.persistence.Entity;

/**
 * 功能說明：門戶菜單
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
@Cacheable
public class PortalMenu extends BaseEntity {

    private static final long serialVersionUID = -2248698503398341656L;

    private String uuid;

    private String parentUuid;

    private String portalUuid;

    private String menuUuid;

    private String status;

    private String menuType;

    private String menuCode;

    private String menuName;

    private String leftPath;

    private String mainPath;

    private String icon;

    private String comment;

    private int sort;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
