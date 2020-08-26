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
public class SysInfo extends BaseEntity {

    private static final long serialVersionUID = -5266991052772239311L;

    private String uuid;

    private String sysName;

    private String sysMotto;

    private String createdBy;

    private String createdDatetime;

    private String modifiedBy;

    private String modifiedDatetime;
}
