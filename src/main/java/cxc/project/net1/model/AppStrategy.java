package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;


@TableBind(tableName = "AppStrategyTable",pkName="appno")
public class AppStrategy extends Model<AppStrategy> {
	public static final AppStrategy dao=new AppStrategy();
}
