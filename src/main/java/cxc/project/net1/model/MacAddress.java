package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;


@TableBind(tableName = "MacAddressTable",pkName="macno")
public class MacAddress extends Model<MacAddress> {
	public static final MacAddress dao=new MacAddress();
}
