// create closure
/**
 * @author cyril holzer
 * Populate cascading select
 * @param selectorLinkedTo id of the parent of the selected select
 * @param bddtable is table to get ajax data
 */
(function ($) {
  var originalVal = $.fn.val;
  $.fn.val = function(value) {
	$return =  originalVal.call(this, value);
    if (typeof value != 'undefined') {
    //	this.trigger("change");
    }
    return $return;
  };
})(jQuery);


(function($) {	
	$.fn.linkedtoselect =  function(selectorLinkedTo,bddtable) {
		return this.each(function() {
			var selected = false;				
			var selector = this;			
			
			$(selectorLinkedTo).change(function(event,nextValue){		
		
				var currentValue = $(selectorLinkedTo).val() >= 0 ? $(selectorLinkedTo).val() : 0;
				
				if(nextValue != "undefined" && nextValue != null){
					selected = nextValue;
				}
			
				/**
				 * Fix BUG IE 7.0
				 */
				if(jQuery.browser.msie && jQuery.browser.version == "7.0"){
					var currentwidth = $(selector).css("width");
				}
				
				var timestamp = new Date().getTime();
				$(selector).html(' <option value="0">...</option>');
				 if(jQuery.browser.msie && jQuery.browser.version == "7.0"){
						$(selector).css("width",currentwidth);
				 }	
				  
				$.ajax({
					method:'post',
					url: BASE_URL + 'tools/ajax/list?t='+timestamp,
					data:{table:bddtable,filter:currentValue},
					success:function(data){
						
						 $(selector).html(' ');
						  $.each(data, function(key,val) {							  
							  $("<option value=\""+val.key+"\">" + val.value +"</option>").appendTo( $(selector) );
			              });
						  if(jQuery.browser.msie && jQuery.browser.version == "7.0"){
							$(selector).css("width",currentwidth);
						  }							 						
						  if(selected){
							  
							  $(selector).val(selected);
							  //selected = false;
						  }	
						  $(selector).trigger("change");	
					},
					dataType:"json"
				});
				/**
				 * Alert select linked to selector to cascade change
				 */
				
			});
			/**
			 * If initilization encouter a value, this value is saved to be reaffect when ajax is successfull. Use once time at initialization
			 */
			if( $(selectorLinkedTo).val()>0 ){
				selected = $("option:selected",this).val();				
				$(selectorLinkedTo).trigger("change");				
			}else{
				$(selector).html(' ');
			}
		});
	};
// end of closure
})(jQuery);