package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;


@TableBind(tableName = "ReportCenterTable")
public class ReportCenter extends Model<ReportCenter> {
	public static final ReportCenter dao=new ReportCenter();
}
