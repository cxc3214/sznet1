/**
 * 
 */

$.util.namespace("common");
common.openurl= function(url, pram) {
		var _opt = {
			winid:"_openWin",
			width : 600,
			height : 400,
			collapsible : false,
			minimizable : false,
			modal : true,
			href : url,
			ishidden : false
		};
		_opt = $.extend(_opt, pram);
		if (!_opt.ishidden) {
			_opt = $.extend(_opt, {
				onClose : function() {
					$(this).window("destroy");
				}
			});
		}
		var _win = $("<div id='"+_opt["winid"]+"'></div>").window(
				_opt);
		if (_opt.isMaxed)
			_win.window("maximize");
	};