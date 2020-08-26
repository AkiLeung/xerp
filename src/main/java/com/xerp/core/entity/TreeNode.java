package com.xerp.core.entity;

import com.xerp.base.BaseEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.cache.annotation.Cacheable;

import javax.persistence.Entity;

/**
 * 功能说明：JavaBean 用于ZTree
 * 修改说明：
 *
 * @author JOSEPH.L
 * @version 1.0
 * @Date 2018-11-14
 */
@Entity
@Data
@Cacheable
public class TreeNode extends BaseEntity {

    private static final long serialVersionUID = 5331043534987192255L;

    private String id;

    private String pid;

    private String name;

    private String isOpen;

    private String isParent;

    private String iconSkin;

    private String code;

    private String sort;

    private String status;

    private String menuType;

    private String leftPath;

    private String mainPath;
}
