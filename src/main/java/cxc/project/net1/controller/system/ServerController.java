package cxc.project.net1.controller.system;

import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresRoles;

import jodd.util.StringUtil;

import com.alibaba.fastjson.JSON;
import com.jfinal.ext.route.ControllerBind;

import cxc.project.net1.controller.BaseController;
import cxc.project.net1.model.web.Message;
import cxc.project.net1.service.system.ServerService;

@ControllerBind(controllerKey="/system/server")
@RequiresRoles("admin")
public class ServerController extends BaseController {
	@Override
	public void index() {
	   Map<String,Object> tmap = ServerService.getServerCofing();
	   if(tmap!=null){
		setAttr("s1", tmap.get("commandport"));
		setAttr("s2", tmap.get("dataport"));
		setAttr("s3", "");
	   }else{
		   setAttr("errorinfo", "没有服务器配置，请检查或重新配置。");
	   }
		render("../../system/server/form.html");
	}
	
	public void dosave(){
		Message tmsg  = new Message();	
		 String tcommandport = getPara("commandport") ;
		 String tdataport = getPara("dataport") ;
		 String texitpwd = getPara("exitpwd") ;
		 if(StringUtil.isNotBlank(tcommandport)
				 &&StringUtil.isNotBlank(tdataport)
				 &&StringUtil.isNotBlank(texitpwd)){
			  if(ServerService.setServerCofing(tdataport, tcommandport, texitpwd)){
				  tmsg.setSuccess(true);					  
			  }else{
				  tmsg.setSuccess(false);
				  tmsg.setMsg("配置时出现错误,保存失败。");
			  }
		 }else{
			 tmsg.setMsg("存在配置尚未填写，不能保存。");
		 }
		 renderText(JSON.toJSONString(tmsg));
	}
	
}
