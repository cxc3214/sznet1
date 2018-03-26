/**
 * 
 */
(function ($) {
	var u1 =$.util.hostPath , u2 = $.util.currentUri,u3 = u2.replace(u1,"");
	$(function(){
		var layout = $("#mainLayout");
		$.util.exec(function () {
			 layout.removeClass("hidden").layout("resize");
		});
		var leftbar = $("#lefbar");
		leftbar.find("a").each(function(i){
			var herf = $(this).attr("href");
			if($.string.contains(herf,u3)){
				if($(this).parent().is("li")){
					$(this).parent().addClass("active");
				}else{
					$(this).addClass("active");
				}
				return false;
			}			
		});
	});
})(jQuery);