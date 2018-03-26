package cxc.project.net1.controller;

import jodd.util.StringUtil;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import com.alibaba.fastjson.JSON;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.core.ActionKey;

import cxc.project.net1.model.web.Message;

@ControllerBind(controllerKey="/")
public class MainController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MainController.class);

	public void index(){
		redirect(getShiroUser().getIndexurl());
	}
	
	@ActionKey("/logout")
	public void logout(){
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser.isAuthenticated()){
			currentUser.logout();
		}
		redirect("/");
	}
	
	
	public void login(){
		render("login/login.html");
	}
	
	public void timeout(){
		renderHtml("登录超时，即将为您跳转至登录页！<script>window.location.href='"+ this.getRequest().getContextPath() +"/login'</script>");
	}
	
	public void loginaction(){
		Message tmsg = new Message();
		String tuser = getPara("username") ;
		String tpwd = getPara("password") ;
		if(!StringUtil.isBlank(tuser)){
	        UsernamePasswordToken token = new UsernamePasswordToken(tuser,tpwd);
	        try {	 
	        	Subject user = SecurityUtils.getSubject();
	            user.login(token);
	            tmsg.setSuccess(true);
	        }catch (Exception e) {
	        	tmsg.setSuccess(false);
				tmsg.setMsg("登录失败，请重新登录。");
	        	logger.error("登录失败错误信息:"+e);
	            token.clear();
	        }
		}
		renderText(JSON.toJSONString(tmsg));
	}
}
