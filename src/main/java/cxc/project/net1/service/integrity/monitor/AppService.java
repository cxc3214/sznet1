package cxc.project.net1.service.integrity.monitor;

import java.util.Map;

import jodd.typeconverter.Convert;
import jodd.util.StringUtil;

import com.jfinal.ext.plugin.sqlinxml.SqlKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import cxc.project.net1.model.AppStrategy;
import cxc.project.net1.model.web.DataGrid;
import cxc.project.net1.service.BaseService;

public class AppService extends BaseService  {
	public static DataGrid getApps(Map prams){
		DataGrid tdg = new DataGrid();
		Record trec =covertMapToRecord(prams); 
		int page = Convert.toIntValue(trec.get("page"), 1) ;// 当前页
		int rows =Convert.toIntValue(trec.get("rows"), 10) ;// 每页显示记录数
		String sort =Convert.toString(trec.get("sort"), null)  ;// 排序字段名
		String order =Convert.toString(trec.get("order"), "asc")  ;// 排序字段名
		String condtion  = convertSearchMapToSql("integrity.monitor.app", prams);
		//拼凑order by
		String torderby = convertToSqlOrderBy(sort,order);
		if(!StringUtil.isBlank(torderby)){
			condtion += " order by"+ torderby;
		}
		String[] tsqlary = StringUtil.split(SqlKit.sql("integrity.monitor.findApp.pageSql"), "{|}"); 
		Page<AppStrategy> tpages =  AppStrategy.dao.paginate(page, rows,tsqlary[0], tsqlary[1]+" where 1=1 "+ condtion);
		tdg.setTotal(Convert.toLong(tpages.getTotalRow()));
		tdg.setRows(tpages.getList());
		return tdg ;
	}
}
