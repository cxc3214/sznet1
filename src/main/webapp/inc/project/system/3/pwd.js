/**
 * 
 */
~function($){	
	var _ctx =  $("meta[name='ctx']").attr("content") ;
	$(function(){
		var _mainForm  = $("#editform") ;
		_mainForm.form({
			url: _ctx + "/system/user/setpwd",
			onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	
				}
				return isValid;
			},
			success: function(data){
				$.messager.progress('close');
				var _data = $.parseJSON(data);
				if(_data["success"]){
					$.messager.show("操作提醒", "设置成功。", "info", "topCenter");
					$("#_openWin").window("destroy");
				}else{
					$.messager.alert("出错了！",_data["msg"],"warning");
				}
			}
		});
		
		/**
		 * 保存
		 */
		$("#btnsave").click(function(){
			$.messager.progress();	
			_mainForm.submit();
			/**form 提交 end*/
		});
		$("#btncancel").click(function(){
			$("#_openWin").window("destroy");
		});
	});
	
}(jQuery);