package cxc.project.net1.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;

import cxc.project.net1.utils.freemaker.HasAnyRolesFreeMarkerMethod;
import cxc.project.net1.utils.freemaker.HasRoleFreeMarkerMethod;

public class ShiroFreeMarkerInterceptor implements Interceptor  {

	@Override
	public void intercept(ActionInvocation ai) {
		// TODO Auto-generated method stub
		Controller c = ai.getController();
		c.setAttr("hasRole", new HasRoleFreeMarkerMethod());
		c.setAttr("hasAnyRoles", new HasAnyRolesFreeMarkerMethod());
//		c.setAttr("hasPermission", new HasPermissionFreeMarkerMethod());
//		c.setAttr("isAuthenticated", new AuthenticatedFreeMarkerMethod());
		// 执行正常逻辑
		ai.invoke();
	}
	
}
