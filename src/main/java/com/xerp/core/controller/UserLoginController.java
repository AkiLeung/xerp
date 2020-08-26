package com.xerp.core.controller;

import com.xerp.base.BaseController;
import com.xerp.common.consts.UrlPathConst;
import com.xerp.core.entity.User;
import com.xerp.scheduler.TestJob;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

import static org.quartz.JobBuilder.newJob;
import static org.quartz.SimpleScheduleBuilder.simpleSchedule;
import static org.quartz.TriggerBuilder.newTrigger;

/**
 * @author Joseph.L
 * @date 2019-09-03
 * @description 用户登录
 */
@Log4j2
@RestController
public class UserLoginController extends BaseController {

//    @RequestMapping("test04.action")
//    @ResponseBody
//    public void test04() throws Exception {
//        // 创建scheduler
//        Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
//
//        // 创建JobDetail
//        JobDetail jobDetail = JobBuilder.newJob((Class<? extends Job>) Class.forName("com.xerp.scheduler.TestJob")).withIdentity("jobTest", "group2").build();
//
//        // 指定时间触发，每隔2s执行一次，重复20次
//        Trigger trigger2 = newTrigger()
//                .withIdentity("trigger2", "group1")
//                .startAt(new Date())
//                .withSchedule(simpleSchedule()
//                        .withIntervalInSeconds(2)
//                        .withRepeatCount(5))
//                .build();
//
//        scheduler.scheduleJob(jobDetail, trigger2);
//        scheduler.start();
//    }

    /**
     * 登录验证
     */
    @RequestMapping(value = "system.action")
    public ModelAndView systemLogin(HttpServletRequest request) {
        modelAndView = new ModelAndView();
        //獲取登錄頁面信息：用戶工號和密碼
        String ipAddress = getIpAddr(request);
        String userCode = request.getParameter("userCode");
        String password = request.getParameter("password");
        //主体,当前状态为没有认证的状态“未认证”
        Subject subject = SecurityUtils.getSubject();
        //當Session不為空的時候自動登錄
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        if (user != null) {
            log.info("User: " + user.getUserName() + " login system,From IP:" + ipAddress);
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_FRAME_PAGE);
            return modelAndView;
        }

        // 登录后存放进 shiro token
        UsernamePasswordToken token = new UsernamePasswordToken(userCode, password);
        try {
            //需要开始调用到Realm中
            subject.login(token);
            //使用subject调用securityManager,安全管理器调用Realm
            user = (User) subject.getPrincipal();
            log.info("User: " + user.getUserName() + " login System From IP:" + ipAddress);
            modelAndView.addObject("login", "true");
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_FRAME_PAGE);
        } catch (UnknownAccountException ex) {
            log.error(this.getClass().getName() + "-UnknownAccountException:" + ex.toString());
            modelAndView.addObject("login", "false");
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_LOGIN_PAGE);
        } catch (IncorrectCredentialsException ex) {
            log.error(this.getClass().getName() + "-IncorrectCredentialsException:" + ex.toString());
            modelAndView.addObject("login", "false");
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_LOGIN_PAGE);
        }
        return modelAndView;
    }

    /**
     * 注销登录
     */
    @RequestMapping("logout.action")
    public ModelAndView logout() {
        try {
            //获取当前用户
            Subject subject = SecurityUtils.getSubject();
            if (subject != null && subject.isAuthenticated()) {
                subject.logout();
            }
            return new ModelAndView(UrlPathConst.STR_SYSTEM_LOGIN_PAGE);
        } catch (Exception ex) {
            log.error(this.getClass().getName() + "-logout:" + ex.toString());
        }
        return new ModelAndView(UrlPathConst.STR_SYSTEM_LOGIN_PAGE);
    }

    /**
     * 功能说明：登錄頁面
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "login.action")
    public ModelAndView login(HttpServletResponse response, HttpServletRequest request) {
        modelAndView = new ModelAndView();
        //获取当前用户
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        //當Session不為空的時候自動登錄
        User user = (User) session.getAttribute("user");
        if (user != null && !user.getUserCode().equals("")) {
            modelAndView.setViewName(UrlPathConst.STR_SYSTEM_FRAME_PAGE);
            return modelAndView;
        }
        return new ModelAndView(UrlPathConst.STR_SYSTEM_LOGIN_PAGE);
    }

    /**
     * 功能说明：无权限
     * 修改说明：
     *
     * @return ModelAndView 頁面跳轉
     * @author Joseph
     * @date 20181108
     */
    @RequestMapping(value = "unAuthor.action")
    public ModelAndView unAuthor() {
        modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName(UrlPathConst.STR_COMMON_UNAUTH_PAGE);
        } catch (Exception ex) {
            log.error(this.getClass().getName() + "-unAuthor:" + ex.toString());
            modelAndView.addObject("errorMessage", ex.toString());
            modelAndView.setViewName(UrlPathConst.STR_COMMON_ERROR_PAGE);
        }
        return modelAndView;
    }

    /**
     * 获取客户端IP地址
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "X-Real-IP".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
