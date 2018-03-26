package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;


@TableBind(tableName = "Module")
public class Modules extends Model<Modules> {
	public static final Modules dao=new Modules();
}
