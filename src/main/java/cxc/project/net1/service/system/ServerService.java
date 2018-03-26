package cxc.project.net1.service.system;

import java.util.HashMap;
import java.util.Map;

import cxc.project.net1.message.Const;
import cxc.project.net1.message.MessageService;
import cxc.project.net1.message.structure.ServerConfig;
import cxc.project.net1.service.BaseService;

public class ServerService extends BaseService  {
	public static Map<String,Object> getServerCofing(){
		Map<String,Object> tmap = new HashMap<String, Object>();
		try {			
			MessageService tmsgser = new MessageService(0) ;
			ServerConfig sc = tmsgser.sendMessage(Const.MessageType.ForGetConfig, null);
			tmap.put("commandport", sc.readField("dwCommandPort"));
			tmap.put("dataport", sc.readField("dwDataPort"));
		} catch (Exception e) {
			tmap= null ;
		}
		return tmap;
	}
	
	public static boolean setServerCofing(String dataport,String commandport,String password){
		boolean rebool = true;
		try {
			ServerConfig sc = new ServerConfig(Integer.parseInt(dataport),Integer.parseInt(commandport), password.toCharArray());
			MessageService tmsgser = new MessageService(0) ;
			tmsgser.sendMessage(Const.MessageType.ForChangeConfig,sc);
		} catch (Exception e) {
			rebool = false;
		}
		return rebool;
	}
}
