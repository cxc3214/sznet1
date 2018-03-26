package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;

@TableBind(tableName = "SystemLog")
public class SystemLog extends Model<SystemLog> {
	public static final SystemLog dao = new SystemLog();
}
