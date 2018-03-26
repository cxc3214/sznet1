/**
 * 
 */
~function($){	
	var _ctx = $("meta[name='ctx']").attr("content") ;
	$(function(){
		/**
		 * 定义变量
		 */
		var _editarea = $("#editarea");
		var _ip1 = $("#ipaddress1",_editarea),_mac1 = $("#ipmac1",_editarea)
		,_ip2 = $("#ipaddress2",_editarea),_mac2 = $("#ipmac2",_editarea)
		,_ip3 = $("#ipaddress3",_editarea),_mac3 = $("#ipmac3",_editarea)
		,_areaselect = $("#areaselect",_editarea)
		,_areaaddbtn=$("#areabtnadd",_editarea)
		,_areabtnedit=$("#areabtnedit",_editarea)
		,_areabtndel=$("#areabtndel",_editarea);		
		
		var _mainForm  = $("#editform");
		var _ipstrategycontent=$("input[name=ipstrategycontent]",_mainForm) ;
		/**
		 * 编辑区域
		 */
		//function()
		//console.info(_ip1);
		function getValues(){
			var rearray = [];
			var vals =[_ip1.val(),_mac1.val(),_ip2.val(),_mac2.val(),_ip3.val(),_mac3.val()];
			//IP范围
			if(vals[0]||vals[1]||vals[2]||vals[3]){				
				if(vals[0]!=""&&_ip1.validatebox("isValid")&&vals[1]!=""
					&&vals[2]!=""&&_ip2.validatebox("isValid")&&vals[1]!=""){
					rearray.push(vals[0]+"/"+vals[1]+"~"+vals[2]+"/"+vals[3]);
				}			
			}
			//ip地址
			if(vals[4]||vals[5]){
				if(vals[4]!=""&&_ip3.validatebox("isValid")&&vals[5]!=""){
					rearray.push(vals[4]+"/"+vals[5]);
				}
			}
			return rearray;
		}
		function clearEditArea(){
			_ip1.val("");_mac1.val("");
			_ip2.val("");_mac2.val("");
			_ip3.val("");_mac3.val("");
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
					_ipstrategycontent.val(array3.join(";"));
					clearEditArea();
				}
			}else{
				$.messager.show("操作提醒", "请填写正确的IP或IP范围。", "info", "topCenter");
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
						_ipstrategycontent.val(array3.join(";"));
						clearEditArea();
					}
				}else{
					$.messager.show("操作提醒", "请填写正确的IP或IP范围。", "info", "topCenter");
				}
			}else{
				$.messager.show("操作提醒", "请先选中一条需要修改的数据。", "info", "topCenter");
			}
		});
		//删除编辑区
		_areabtndel.click(function(){
			_areaselect.find("option:selected").remove();
			_ipstrategycontent.val(getSlectValues().join(";"));
		});
		_areaselect.change(function(){
			clearEditArea();
			var sels = $(this).find("option:selected");
			if(sels.length>=1){
				var _txt = $(sels[0]).text();
				if(_txt.indexOf("~")>=0){
					var _arr1 = _txt.split("~");
					var _arr2 = _arr1[0].split("/");
					var _arr3 = _arr1[1].split("/");
					_ip1.val(_arr2[0]);_mac1.val(_arr2[1]||"");
					_ip2.val(_arr3[0]);_mac2.val(_arr3[1]||"");
				}else{
					var _arr1 = _txt.split("/");
					_ip3.val(_arr1[0]);_mac3.val(_arr1[1]||"");
				}				
			}
		});
		/**
		 * 表单操作
		 */
		$("#btnsave").click(function(){
			$.messager.progress();	
			_mainForm.form('submit', {
				url: _ctx + "/integrity/monitor/ip/doform",
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