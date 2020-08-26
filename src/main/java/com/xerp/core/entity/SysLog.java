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
public class SysLog extends BaseEntity {

    private static final long serialVersionUID = 3054161787067602346L;

    private String logId;

    private String logFile;

    private String logClass;

    private String logMethod;

    private String logLine;

    private String logThread;

    private String logLevel;

    private String logMessage;

    private String createdDatetime;
}
