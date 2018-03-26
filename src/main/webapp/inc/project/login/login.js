(function($, undefined) {
	var _ctx = $("meta[name='ctx']").attr("content");
	$(function() {
			var _form = $("#login-form");
			function submitForm() {
				if(_form.form('validate')){
					$.ajax({
						type : "POST",
						dataType:"json",
						data : _form.serialize(),
						url: _ctx+"/loginaction",
						success : function(data) {
/*							var rx = /<body[^>]*>([\s\S]+?)<\/body>/i ;
							var m = rx.exec(msg);
							if (m) {
								m = m[1];
								$("div#errordiv").html($(m).find("div#errordiv").html());
							}*/
							if(data["success"]){
								window.location.href= _ctx;
								$("div#errordiv").hide();
							}else{
								$("div#errordiv").show();
								$("div#errordiv").show().find("span").html(data["msg"]||"");
							}
						}
					});
				}
			}
			$("#btn-login").bind("click",function() {
					submitForm();
				});
			$("body").bind('keyup', function(event) {
				if (event.keyCode == 13) {
					submitForm();
				}
			});
		})
})(jQuery);