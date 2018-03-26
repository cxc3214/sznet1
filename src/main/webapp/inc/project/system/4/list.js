/**
 * 
 */

(function($,undefined){
	var _ctx =  $("meta[name='ctx']").attr("content");
	
	$(function(){
		var datagrid = $("#datagrid")
		,searchform = $("#searchform"),btnsearch=$("#btnsearch"),btnactive=$("#btnactive");
		/*end var*/
		
		datagrid.datagrid({
			toolbar:'#querytoolbar',
			rownumbers : true,
			border:false,
			fitColumns:false,
			checkOnSelect:false,
			selectOnCheck:false,
			singleSelect:true,
			fit:true,
			pagination : true,
			pageSize : 10,
			pageList: [10,20,50,100],
			pageNumber : 1,
			columns:[[
		        {field:'nameid',title:'模块名称',width:180},
		        {field:'licensekey',title:'授权对象',width:220},
		        {field:'licensedpoint',title:'授权点数',width:80,align:'center',formatter:function(value,row,index){
		        	return  value+"授权";		        	
		        }},
		        {field:'state',title:'模块状态',width:60,align:'center',formatter:function(value,row,index){
		        	return (value==1)?"已激活":"未激活";		        	
		        }},
		        {field:'deadtime',title:'授权期限',width:160},
		        {field:'activetime',title:'激活时间',width:160}
		    ]]
		});	/*end grid*/
		
		btnsearch.click(function(){			
			var _data = searchform.form("getData");
			datagrid.datagrid("load",_data);
		}); /*end search btn*/
		
		btnactive.click(function(){
			alert("激活中....");
		});/*end acitve btn*/
		
	}); /*end $(function)*/
	
})(jQuery);