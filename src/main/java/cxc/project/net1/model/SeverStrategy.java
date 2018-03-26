package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;


@TableBind(tableName = "SeverStrategyTable")
public class SeverStrategy extends Model<SeverStrategy> {
	public static final SeverStrategy dao=new SeverStrategy();
}
