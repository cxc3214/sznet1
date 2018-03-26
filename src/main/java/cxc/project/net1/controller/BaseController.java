package cxc.project.net1.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.jfinal.core.Controller;

import cxc.project.net1.service.shiro.ShiroUser;

public abstract class BaseController extends Controller {
	
	public abstract void index();
	
	@Override
	public void renderFreeMarker(String view) {
		setPageAttributes();
		super.renderFreeMarker(view);
	}

	@Override
	public void render(String view) {
		setPageAttributes();
		super.render(view);
	}

	/**
	 * 获取数据源索引index的map
	 */
	private void setPageAttributes() {
		this.setAttr("ctx", this.getRequest().getContextPath());
		this.setAttr("uri", this.getRequest().getRequestURI());
	}
	
	protected  ShiroUser getShiroUser(){
		Subject currentUser = SecurityUtils.getSubject();
		ShiroUser tuser  = new ShiroUser();
		try {
			tuser = (ShiroUser)currentUser.getSession().getAttribute("c_user");			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return tuser;
	}

}
