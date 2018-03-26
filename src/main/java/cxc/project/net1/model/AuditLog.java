package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;


@TableBind(tableName = "AuditLog")
public class AuditLog extends Model<AuditLog> {
	public static final AuditLog dao=new AuditLog();
}
