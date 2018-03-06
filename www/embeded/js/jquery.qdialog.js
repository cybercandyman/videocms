(function($) {
	$.qDialog = function(type,options){
		var $tmp = $("<div>"+ options.text +"</div>");
		$tmp.dialog(options);
		$tmp.("open");		
	}
})(jQuery);