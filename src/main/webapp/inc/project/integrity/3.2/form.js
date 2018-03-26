/** 
 *  mac 地址管理form 页面
 */
~function($){	
	var _ctx = $("meta[name='ctx']").attr("content") ;
	$(function(){
		/**
		 * 定义变量
		 */
		var _editarea = $("#editarea");
		var _mac1 = $("#macaddress1",_editarea)

		,_areaselect = $("#areaselect",_editarea)
		,_areaaddbtn=$("#areabtnadd",_editarea)
		,_areabtnedit=$("#areabtnedit",_editarea)
		,_areabtndel=$("#areabtndel",_editarea);		
		
		var _mainForm  = $("#editform");
		var _macstrategycontent=$("input[name=macstrategycontent]",_mainForm) ;
		/**
		 * 编辑区域
		 */
		//function()
		//console.info(_ip1);
		function getValues(){
			var rearray = [];
			if(_mac1.validatebox("isValid")&&_mac1.val()!=""){
				rearray.push(_mac1.val());
			}
			return rearray;
		}
		function clearEditArea(){
			_mac1.val("");
		}
		function getSlectValues(){
			return	$.map(	_areaselect.find("option"), function(val, key) {
				return $(val).text();
			});
		}
		//新增编辑区
		_areaaddbtn.click(function(){
			var array1 = getSlectValues();
			var array2 = getValues();
			if(array2.length>0){
				var flag = true ;
				$.each(array2,function(key, val){
					if($.inArray(val,array1)>=0){
						$.messager.show("操作提醒", val+"已经存在", "info", "topCenter");
						flag =false;
						return false;
					}
				});
				if(flag){
					_areaselect.empty();
					var array3 = $.merge(array1,array2);
					$.each(array3,function( key,val){
						_areaselect.append($("<option>"+val+"</option>"));
					});					
					_macstrategycontent.val(array3.join(";"));
					clearEditArea();
				}
			}else{
				$.messager.show("操作提醒", "请填写正确的mac地址。", "info", "topCenter");
			}
		});
		//修改编辑区
		_areabtnedit.click(function(){	
			var array1 = getSlectValues();
			var array2 = getValues();
			var sels = _areaselect.find("option:selected");
			if(sels.length==1){
				array1 = $.grep(array1, function(n,i){
					  return n !=sels.text();
				});
				if(array2.length>0){
					var flag = true ;
					$.each(array2,function(key, val){
						if($.inArray(val,array1)>=0){
							$.messager.show("操作提醒", val+"已经存在", "info", "topCenter");
							flag =false;
							return false;
						}
					});
					if(flag){
						var array3 = $.merge(array1,array2);
						sels.replaceWith("<option>"+array2[0]+"</option>");
						_macstrategycontent.val(array3.join(";"));
						clearEditArea();
					}
				}else{
					$.messager.show("操作提醒", "请填写正确的mac地址。", "info", "topCenter");
				}
			}else{
				$.messager.show("操作提醒", "请先选中一条需要修改的数据。", "info", "topCenter");
			}
		});
		//删除编辑区
		_areabtndel.click(function(){
			_areaselect.find("option:selected").remove();
			_macstrategycontent.val(getSlectValues().join(";"));
		});
		_areaselect.change(function(){
			clearEditArea();
			var sels = $(this).find("option:selected");
			if(sels.length>=1){
				var _txt = $(sels[0]).text();
				_mac1.val(_txt);		
			}
		});
		/**
		 * 表单操作
		 */
		$("#btnsave").click(function(){
			$.messager.progress();	
			_mainForm.form('submit', {
				url: _ctx + "/integrity/monitor/mac/doform",
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
					var _id = $("input[name=ipno]",_mainForm).val();
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