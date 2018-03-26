/**
 * 
 */

(function($,undefined){
	var _ctx =  $("meta[name='ctx']").attr("content")
	, formUrl= _ctx+"/system/user/form"
	, delUrl= _ctx+"/system/user/del"
	,pwdUrl =_ctx+"/system/user/pwd";
	
	$(function(){
		var datagrid = $("#datagrid"),searchform = $("#searchform"),btnsearch=$("#btnsearch")
			,btnadd = $("#btnadd"),btnedit = $("#btnedit"),btndel = $("#btndel");
		datagrid.datagrid({
			toolbar:'#querytoolbar',
			rownumbers : true,
			border:false,
			fitColumns:false,
			checkOnSelect:false,
			selectOnCheck:false,
			singleSelect:true,
			fit:true,
			pagination : true,
			pageSize : 10,
			pageList: [10,20,50,100],
			pageNumber : 1
		});
		
		window.openSetPwdWindow=function(idvalue){
			if(!idvalue||idvalue=="") {
				$.messager.show("操作提醒", "修改失败，请刷新重试。", "info", "topCenter");
				return false;
			}
			common.openurl(pwdUrl, {
				title:"修改密码",
				height:200,
				onLoad:function(){
					$.util.exec(function(){
						var _manform  = $("#editform");
						_manform.form("load",{id:idvalue});
					});
				}
			});
		};
		
		
		btnsearch.click(function(){			
			var _data = searchform.form("getData");
			datagrid.datagrid("load",_data);
		});
		btnadd.click(function(){
			common.openurl(formUrl, {
				title:"新建用户",
				height:320
			});
			
		});
		btnedit.click(function(){
			var _row  =  datagrid.datagrid("getSelected");
			if(_row){
				common.openurl(formUrl, {
					title : "修改用户",
					height: 320,
					onLoad:function(){
						$.util.exec(function(){
							var _manform  = $("#editform");
							_manform.form("load",_row);
							if(_row["type"]==0){
								var rolestr = _row["rolestr"]||"";
								var permissionval = [];
								var permissionarray = [8,4,2];
								for(var i = 2;i<5;i++){
									if(rolestr.charAt(i)=='0') permissionval.push(permissionarray[i-2]);
								}
							}
							$("input[name=permission]").val(permissionval);
						});
					}
				});				
			}else{
				$.messager.alert("提示","请先选择你需要修改的行！","info");
			}					
		});
		btndel.click(function(){
			var _rows  =  datagrid.datagrid("getChecked") ;
			if(_rows && _rows.length>0){
				$.messager.confirm('提示', '该操作不能还原,您确定要删除这些用户吗？', function(r){
					if (r){
						var ids  = $.map(_rows,function(n){
								return n["id"];						
						}).join(",");
						$.post(delUrl, { ids: ids },
						function(data){
								if(data["success"]){								
									datagrid.datagrid("reload");
								}						
						},"json");
						
					}else{
						
					}
				});
			}else{
				$.messager.alert("提示","请先勾选你需要删除的行！","info");
			}			
		});
	});
})(jQuery);