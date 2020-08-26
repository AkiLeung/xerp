package com.xerp.core.shiro.realm;

import com.xerp.common.utils.StringUtils;
import com.xerp.core.entity.User;
import com.xerp.core.service.IShiroService;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author Joseph.L
 * @date 2019-09-02
 * @description 用户验证域
 */
@Log4j2
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private IShiroService shiroService;

    /**
     * 授权的回调方法
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        if (principals == null) {
            throw new AuthorizationException("principals should not be null");
        }
        //获得權限对象
        //1.根据用户user->  2.获取角色code List<String> ->  3.根据角色code获取权限 List<String>
        User user = (User) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        //获取permission
        if (user != null) {
            List<String> listRoles = shiroService.getUserRolesByUserCode(user.getUserCode());
            for (String userRole : listRoles) {
                List<String> listPermissions = shiroService.getRolePermissionsByRoleCode(userRole);
                if (listPermissions.size() != 0) {
                    for (String permission : listPermissions) {
                        //集合 默認權限列表不重複，並且借用Shiro持久化原理節省查詢
                        if (!StringUtils.isEmpty(permission)) {
                            authorizationInfo.addStringPermission(permission);
                        }
                    }
                }
            }
        }
        return authorizationInfo;
    }

    /**
     * 认证的回调方法
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String userCode = (String) token.getPrincipal();
        token.isRememberMe();
        User user = shiroService.getUserByUserCode(userCode);
        if (user == null) {
            // 没找到帐号
            throw new UnknownAccountException();
        }
        //用户
        Object principal = user;
        //密码
        Object credentials = user.getPassword();
        //盐值
        ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
        AuthenticationInfo authenticationInfo;
        try {
            //进行密码匹配
            authenticationInfo = new SimpleAuthenticationInfo(
                    principal,
                    credentials,
                    credentialsSalt,
                    getName());
            return authenticationInfo;
        } catch (AuthenticationException aex) {
            log.error("Class: UserRealm 異常：" + aex.toString());
        }
        return null;
    }
}
