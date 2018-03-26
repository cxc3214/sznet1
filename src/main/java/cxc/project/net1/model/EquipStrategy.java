package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;


@TableBind(tableName = "EquipStrategyTable",pkName="equipno")
public class EquipStrategy extends Model<EquipStrategy> {
	public static final EquipStrategy dao=new EquipStrategy();
}
