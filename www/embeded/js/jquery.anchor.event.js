/**
 * @author cyril holzer
 * Monitor anchor event 
 * Exemple :
 
$.anchor(function(anchor){
	alert("l'anchor a changé ! : " + anchor);
});

*/

(function($) {
	
	$.anchor = function(func){		
		if ("onhashchange" in window) // event supported?
	    {
	        window.onhashchange = function ()
	        {
	            hashChanged(window.location.hash,func);
	        }
	    }
	    else // event not supported:
	    {
	        var storedHash = window.location.hash;
	        window.setInterval(function ()
	        {
	            if (window.location.hash != storedHash)
	            {
	                storedHash = window.location.hash;
	                hashChanged(storedHash,func);
	            }
	        }, 100);
	    }
		if($.anchor.trigger_onload){
			if(window.location.hash.length > 0){
				hashChanged(window.location.hash,func);
			}
		}
		
	};
	
	/**
	 * Remove the first hash character : #
	 */
	
	$.anchor.removehash  = true;
	/**
	 * If user come with a link containing a hash, event will be trigger
	 */
	$.anchor.trigger_onload = true;
	
	
	
	function hashChanged(hash,func){		
		if($.anchor.removehash){
			var  reg=new  RegExp("#", "g");
			hash = hash.replace(reg,"")	;
		}
		if ($.isFunction(func)) func.call($(this),hash);				
	}
	


	
})(jQuery);