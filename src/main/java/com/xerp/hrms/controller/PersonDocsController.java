package com.xerp.hrms.controller;

import com.xerp.hrms.service.IPersonDocsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: JOSEPH.L
 * @date: 2020/9/3 1:40
 * @description:
 * @version: 1.0
 */
@Slf4j
@RestController
@RequestMapping(value = "hrms/personDocs")
public class PersonDocsController {

    /**
     * Service操作對象 自動註解
     */
    @Autowired
    private IPersonDocsService serviceObject;


}
