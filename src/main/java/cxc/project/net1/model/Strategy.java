package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;



@TableBind(tableName = "StrategyTable")
public class Strategy extends Model<Strategy>{
	public static final Strategy dao=new Strategy();
}
