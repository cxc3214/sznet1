/**
 * 
 */

(function($,undefined){
	var _ctx = $("meta[name='ctx']").attr("content")
	, getClientsUrl = _ctx+"/system/client/getClient"
	, saveUrl= _ctx+"/system/client/save";
	
	$(function(){
		var thistree = $("#thistree"),editform = $("#editform"),btnrefresh=$("#btn-refresh"),btnsave =$("#btn-save");
		editform.form({
			url :saveUrl ,
			onSubmit : function() {
				return $(this).form('validate');//对数据进行格式化
			},
			success : function(data) {
				var reobj = $.parseJSON(data);
				if(reobj["success"]){
					thistree.tree("reload");
					$.messager.show("操作提醒", "保存成功。", "info", "topCenter");
					editform.form("clear");
				}else{
					$.messager.show("操作提醒", reobj["msg"], "error", "topCenter");
				}
			} 
		});
		thistree.tree({
			url:getClientsUrl
			,onSelect: function(node){
				if(node){
					if(node["children"]){
						thistree.tree("select",{id:""});
						return false;
					}else{
						editform.form("load",node);
					}					
				}
			}
		});
		btnsave.click(function(){
			editform.submit();	
		});
		btnrefresh.click(function(){			
			thistree.tree("reload");
		});
	});
})(jQuery);