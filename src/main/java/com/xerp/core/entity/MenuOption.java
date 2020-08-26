package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

/**
 * 功能說明：菜單操作
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class MenuOption extends BaseEntity {

    private static final long serialVersionUID = 2814816444854861637L;

    private String uuid;

    private String parentUuid;

    private String status;

    private String menuCode;

    private String menuName;

    private String unfold;

    private String leftPath;

    private String mainPath;

    private String comment;

    private int sort;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
