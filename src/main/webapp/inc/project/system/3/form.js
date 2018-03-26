/**
 * 
 */
~function($){	
	var _ctx =  $("meta[name='ctx']").attr("content") ;
	$(function(){
		var _mainForm  = $("#editform") ;
		/**
		 * 用户类型变化处理
		 */
		function doControl1(_val){
			if($.util.equals(_val,1)){
				$("input[name=permission]").each(function(){					
					this.checked=true;
					$(this).click(function() {
						this.checked = !this.checked;
					});
				});
			}else{
				$("input[name=permission]").unbind("click").removeAttr("checked");
			}
		}
		
		$("#c-type").change(function(){
			var value = $(this).val();
			doControl1(value);
		});
		
		
		_mainForm.form({
			url: _ctx + "/system/user/doform",
			onLoadSuccess:function(data){
				if(data&&data["type"]){
					doControl1(data["type"] );
				}
			},		
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
						$.messager.confirm('操作提醒','保存成功，是否继续添加用户？', function(r) {
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