package cxc.project.net1.controller.integrity.monitor;

import com.jfinal.ext.route.ControllerBind;

import cxc.project.net1.controller.BaseController;
import cxc.project.net1.service.system.ClientService;

@ControllerBind(controllerKey = "/integrity/monitor/com")
public class CommonContoller extends BaseController {

	@Override
	public void index() {
		// TODO Auto-generated method stub
		
	}
	public void server(){
		render("../../../integrity/monitor/common/server.html");
	}
	public void getServer(){
		renderJson(ClientService.getServer()); 
	}
}
