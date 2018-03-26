(function($,undefined){
	var _ctx = $("meta[name='ctx']").attr("content");
	 $(function(){
		var datagrid = $("#datagrid"),searchform = $("#searchform"),btnsearch=$("#btnsearch");	
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
	 });
})(jQuery);