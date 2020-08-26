package com.xerp.core.shiro.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.util.UUID;

/**
 * @author Joseph.L
 * @date 2019-09-07
 * @description
 */
public class ShiroUtil {

    /**
     * 获取当前SESSION
     */
    public static Session getSession() {
        try {
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession(false);
            if (session == null) {
                session = subject.getSession();
            }
            if (session != null) {
                return session;
            }
        } catch (InvalidSessionException e) {
        }
        return null;
    }

    /**
     * 生成32的随机盐值
     */
    public static String createSalt() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 加盐加密
     *
     * @param password  原始密码
     * @param saltValue 盐值
     */
    public static String credentialSalt(String password, String saltValue) {
        String SimpleHash = new SimpleHash("MD5", password, saltValue, 1024).toString();
        return SimpleHash;
    }

    /**
     * 主方法：测试用
     */
    public static void main(String[] args) {
        String password = "123456789";
        String salt = "admin";
        Object result = credentialSalt(password, salt);
        System.out.println(result);
        //SysInfo.out.println(createSalt());
    }
}
