package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * 功能說明：常用语言
 *
 * @author Joseph.L
 * @version 2018-11-14
 */
@Entity
@Data
public class ComLanguage extends BaseEntity {

    private static final long serialVersionUID = 8070783543311754065L;

    private String uuid;

    private String type;

    private String userCode;

    private String opinions;

    private int sort;
}
