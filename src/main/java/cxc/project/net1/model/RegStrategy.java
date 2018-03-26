package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;


@TableBind(tableName = "RegStrategyTable",pkName="regno")
public class RegStrategy extends Model<RegStrategy> {
	public static final RegStrategy dao=new RegStrategy();
}
