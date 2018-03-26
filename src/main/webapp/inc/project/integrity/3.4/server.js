/**
 * 
 */
~function($){
	var _ctx = $("meta[name='ctx']").attr("content") ;
	$(function(){
		var _editarea = $("#server-editarea"),_mainForm = $("#editform");
		
		var _datagrid = $("#choose-datagrid",_editarea).datagrid({
			
			
		});
		
		$("#btnchoose",_editarea).on("click",function(){
			var trecord = _datagrid.datagrid("getSelected");
			if(trecord&&trecord["ip"]){
				$("input[name=regipaddress]",_mainForm).val(trecord["ip"]);
				$("#_ipserverwindow").window("destroy");
			}else{
				$.messager.show("操作提醒", "请选择服务器。", "info", "topCenter");
			}
		});
		$("#btncancel",_editarea).click(function(){
			$("#_ipserverwindow").window("destroy");
		});
	});
}(jQuery)