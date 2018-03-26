package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;

@TableBind(tableName = "IPAddressTable",pkName="ipno")
public class IPAddress extends Model<IPAddress> {
	public static final IPAddress dao = new IPAddress();
}
