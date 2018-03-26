package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;

@TableBind(tableName = "HIPSLog")
public class HIPSLog extends Model<HIPSLog> {
	public static final HIPSLog dao = new HIPSLog();
}
