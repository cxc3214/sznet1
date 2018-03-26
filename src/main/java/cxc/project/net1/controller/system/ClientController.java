package cxc.project.net1.controller.system;

import org.apache.shiro.authz.annotation.RequiresRoles;

import com.alibaba.fastjson.JSON;
import com.jfinal.ext.plugin.sqlinxml.SqlKit;
import com.jfinal.ext.route.ControllerBind;

import cxc.project.net1.controller.BaseController;
import cxc.project.net1.model.Client;
import cxc.project.net1.model.web.Message;
import cxc.project.net1.service.system.ClientService;

@ControllerBind(controllerKey="/system/client")
@RequiresRoles("admin")
public class ClientController extends BaseController {
	@Override
	public void index() {
		// TODO Auto-generated method stub
		render("../../system/client/list.html");
	}
	
	public void getClient(){
		renderJson(ClientService.getClients());
	}
	
	public void save(){
		Message tmsg  = new Message();
		try {
			Client tclient = new Client();
			tclient.setAttrs(ClientService.covertMapToRecord(getParaMap()).getColumns());
			tclient.update();
			tmsg.setSuccess(true);
		} catch (Exception e) {
			tmsg.setSuccess(false);
			tmsg.setMsg(e.getMessage());
		}
		renderText(JSON.toJSONString(tmsg));
	}
}
