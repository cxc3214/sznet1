package cxc.project.net1.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Model;


@TableBind(tableName = "Users")
public class User extends Model<User> {
	public static final User dao=new User();
}
