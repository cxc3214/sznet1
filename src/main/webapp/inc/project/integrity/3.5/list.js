(function($,undefined){
	var _ctx = $("meta[name='ctx']").attr("content")
	, formUrl= _ctx+"/integrity/monitor/equ/form"
	, delUrl= _ctx+"/integrity/monitor/equ/del";
	 $(function(){
		var datagrid = $("#datagrid"),searchform = $("#searchform"),btnsearch=$("#btnsearch")
			,btnadd = $("#btnadd"),btnedit = $("#btnedit"),btndel = $("#btndel");	
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
			pageNumber : 1
		});
		btnsearch.click(function(){			
			var _data = searchform.form("getData");
			datagrid.datagrid("load",_data);
		});
		btnadd.click(function(){
			common.openurl(formUrl, {
				title:"新建：策略对象 - 设备对象配置",
				width:520,
				height:300
			});
			
		});
		btnedit.click(function(){
			var _row  =  datagrid.datagrid("getSelected");
			if(_row){
				common.openurl(formUrl, {
					title : "修改：策略对象 - 设备对象配置",
					width:520,
					height:300,
					onLoad:function(){
						$.util.exec(function(){
							var _mainForm  = $("#editform");
							_mainForm.form("load",_row);
						});
					}
				});		
			}else{
				$.messager.alert("提示","请先选择你需要修改的行！","info");
			}					
		});
		btndel.click(function(){
			var _rows  =  datagrid.datagrid("getChecked") ;
			if(_rows && _rows.length>0){
				$.messager.confirm('提示', '该操作不能还原,您确定要删除这些数据吗？', function(r){
					if (r){
						var ids  = $.map(_rows,function(n){
								return n["equipno"];						
						}).join(",");
						$.post(delUrl, { ids: ids },
						function(data){
								if(data["success"]){								
									datagrid.datagrid("reload");
								}						
						},"json");
						
					}else{
						
					}
				});
			}else{
				$.messager.alert("提示","请先勾选你需要删除的行！","info");
			}
			
		});
	 });
})(jQuery);