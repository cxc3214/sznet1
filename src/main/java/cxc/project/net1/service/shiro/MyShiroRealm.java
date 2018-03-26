package cxc.project.net1.service.shiro;

import java.util.Arrays;

import org.apache.log4j.Logger;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;

import cxc.project.net1.service.system.UserService;

public class MyShiroRealm extends AuthorizingRealm {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MyShiroRealm.class);

	// 授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principalCollection) {
		// 因为非正常退出，即没有显式调用 SecurityUtils.getSubject().logout()
		// (可能是关闭浏览器，或超时)，但此时缓存依旧存在(principals)，所以会自己跑到授权方法里。
		if (!SecurityUtils.getSubject().isAuthenticated()) {
			doClearCache(principalCollection);
			SecurityUtils.getSubject().logout();
			return null;
		}
		ShiroUser shiroUser = (ShiroUser) principalCollection.getPrimaryPrincipal();
		String userId = shiroUser.getName();
		if (StringUtils.isBlank(userId)) {
			return null;
		}
		// 添加角色及权限信息
		SimpleAuthorizationInfo sazi = new SimpleAuthorizationInfo();
		try {
			shiroUser =UserService.getUserByName(userId);
			 sazi.addRoles(shiroUser.getRole());
//			 sazi.addStringPermissions( Arrays.asList(new String[] { "cxc1"}));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return sazi;
	}
	
	//认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		/*
		 * String pwd = new String(upToken.getPassword()); if
		 * (StringUtils.isNotBlank(pwd)) { pwd = DigestUtils.md5Hex(pwd); }
		 */
		// 调用业务方法

		ShiroUser user = null;
		String userName = upToken.getUsername();
		try {
			 user = UserService.getUserByName(userName);
		} catch (Exception e) {
			logger.trace(e.getMessage(), e);
			throw new AuthenticationException(e);
		}
		if (user != null) {
			// 要放在作用域中的东西，请在这里进行操作
			SecurityUtils.getSubject().getSession().setAttribute("c_user", user);
			
			AuthenticationInfo authinfo = new SimpleAuthenticationInfo(user, user.getPassword(), getName());
			return authinfo;
		}
		// 认证没有通过

		return null;
	}

}
