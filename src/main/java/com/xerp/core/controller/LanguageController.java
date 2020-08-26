package com.xerp.core.controller;

import com.xerp.common.consts.UrlPathConst;
import com.xerp.base.BaseController;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * @author Joseph.L
 * @date 2019-04-27
 * @description login
 */
@RestController
@Log4j2
public class LanguageController extends BaseController {

    /**
     * 视图模型
     */
    private ModelAndView modelAndView = super.modelAndView;

    @Autowired
    private LocaleResolver localeResolver;

    @RequestMapping("{code}.action")
    public ModelAndView changeLanguage(@PathVariable("code") String code, HttpServletResponse response, HttpServletRequest request) {
        Locale locale = null;
        if ("zh".equals(code)) {
            locale = new Locale(code, "CN");
        } else if ("en".equals(code)) {
            locale = new Locale(code, "US");
        }
        localeResolver.setLocale(request, response, locale);
        modelAndView = new ModelAndView();
        modelAndView.setViewName(UrlPathConst.STR_SYSTEM_LOGIN_PAGE);
        return modelAndView;
    }

}
