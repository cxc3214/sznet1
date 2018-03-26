/**
 * 
 */
~function($){	
	var _ctx = $("meta[name='ctx']").attr("content") ;
	$(function(){
		var _saveform  = $("#saveform");
		
		_saveform.form({
			url: _ctx + "/system/server/dosave",
			onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	
				}
				return isValid;
			},
			success: function(data){
				console.info(data);
				$.messager.progress('close');
				var _data = $.parseJSON(data);
				if(_data["success"]){
					$.messager.show("操作提醒", "应用成功。", "info", "topCenter");
				}else{
					$.messager.alert("出错了！",_data["msg"],"warning");
				}
			}
		});
		
		$("#btnedit").click(function(){			
			_saveform.submit();
			$.messager.progress();	
			/**form 提交 end*/
		});
	})
}(jQuery)