package com.xerp.hrms.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

/**
 * @author: JOSEPH.L
 * @date: 2020/9/1 16:36
 * @description:
 * @version: 1.0
 */
@Entity
@Data
public class PersonDocs extends BaseEntity {

    private static final long serialVersionUID = 235166760393552036L;

    private String uuid;

    private String personCode;
    private String personName1;
    private String personName2;
    private String personName3;
    private String identityType;
    private String identityNumber;
    private String sex;
    private String country;
    private String region;
    private String city;
    private String address;
    private String jobPosition;
    private String cellphone;
    private String email;
    private String joinDate;
    private String cmpUuid;
    private String depUuid;
    private String status;

}
