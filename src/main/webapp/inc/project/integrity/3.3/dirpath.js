/**
 * 
 */
~function($){
	var _ctx = $("meta[name='ctx']").attr("content") ;
	$(function(){
		var _editarea = $("#dirtree-editarea"),_mainForm = $("#editform");
		var _ipaddress =$("input[name=appipaddress]",_mainForm).val();
		var _dirpathtree = $("#dirpathtree",_editarea).tree({
			url:_ctx+'/integrity/monitor/app/getDirpath?ip='+_ipaddress,
			fit:true,
			border:false
		});
		
		$("#btnchoose",_editarea).on("click",function(){
			var node = _dirpathtree.tree("getSelected")
			if(node&&node["id"]&&node["id"]!=""){
				$("input[name=appfilepath]",_mainForm).val(node["id"]);
				$("#_ipserverwindow").window("destroy");
			}else{
				$.messager.show("操作提醒", "请选择磁盘路径。", "info", "topCenter");
			}
		});
		
		$("#btncancel",_editarea).click(function(){
			$("#_ipserverwindow").window("destroy");
		});
	});
}(jQuery)