package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;



@TableBind(tableName = "Client")
public class Client extends Model<Client>{
	public static final Client dao=new Client();
}
