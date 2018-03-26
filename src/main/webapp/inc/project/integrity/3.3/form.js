/**
 * 
 */
~function($){	
	var _ctx = $("meta[name='ctx']").attr("content") ;

	$(function(){
		/**
		 * 定义变量
		 */
		var _mainForm = $("#editform");
		
		/**
		 * 选择事件
		 */
		$("#btn-chooseip",_mainForm).click(function(){
			common.openurl(_ctx + "/integrity/monitor/app/server",{
				winid :"_ipserverwindow",
				title :"选择服务器",
				width : 380,
				height: 300,
				maximizable:false,
				collapsible:false
			})			
		});
		$("#btn-choosepath",_mainForm).click(function(){
			if($("input[name=appipaddress]",_mainForm).validatebox("isValid")){
				common.openurl(_ctx + "/integrity/monitor/app/dirpath",{
					winid :"_ipserverwindow",
					title :"选择磁盘路径",
					width : 380,
					height: 300,
					maximizable:false,
					collapsible:false
				})	
			}else{
				$.messager.show("提示", "请填写正确的服务器IP。", "info", "topCenter");
			}
		});
		
		/**
		 * 表单操作
		 */
		$("#btnsave").click(function(){
			$.messager.progress();	
			_mainForm.form('submit', {
				url: _ctx + "/integrity/monitor/app/doform",
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
					var _id = $("input[name=appno]",_mainForm).val();
					if(_data["success"]){
						if (_id == "") {
							$.messager.confirm('操作提醒','保存成功，是否继续添加信息？', function(r) {
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