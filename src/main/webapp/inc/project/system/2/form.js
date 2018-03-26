/**
 * 
 */
~function($){	
	var _ctx = $("meta[name='ctx']").attr("content") ;
	$(function(){
		var _mainForm  = $("#editform") ;
		$("#btnsave").click(function(){
			$.messager.progress();	
			_mainForm.form('submit', {
				url: _ctx + "/system/authorize/doform",
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
					var _id = $("input[name=id]",_mainForm).val();
					if(_data["success"]){
						if (_id == "") {
							$.messager.confirm('操作提醒','保存成功，是否继续添加授权信息？', function(r) {
								if (r) {
									_mainForm.form('reset');
								} else {
									$("#_openWin").window("destroy");
								}
							});
						} else {
							$.messager.show("操作提醒", "修改成功。", "info", "topCenter");
						}
						$('#datagrid').datagrid("reload");
					}else{
						$.messager.alert("出错了！",_data["msg"],"warning");
					}
				}
			});
			
		});
		$("#btncancel").click(function(){
			$("#_openWin").window("destroy");
		});
		
	})
}(jQuery)