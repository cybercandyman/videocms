/**
 * --------------------------------------------------------------------
 * jQuery-Plugin "popup"
 * Version: 1.0 18-11-2008
 * by Cyril HOLZER
 *                      
 *
 * Copyright (c) 2008 Cyril HOLZER
 * Licensed under GPL (http://www.opensource.org/licenses/gpl-license.php)
 *
 * 
 * $(".popup").popup({width:1024,height:768});    
 * --------------------------------------------------------------------
 */
(function($) {
    $.fn.popup = function(options) {
        var opts = $.extend({}, $.fn.popup.defaults, options);
        $(this).click(function(){
           
            if(opts.url != undefined)
                var url = opts.url;
            else
                var url = $(this).attr("href");
                
            var moreopt = "";
            if(opts.center){
                var top=(screen.height-opts.height)/2;
                var left=(screen.width- opts.width)/2;
                moreopt = ",top="+top+",left="+left;
            }
            document.open(url,opts.titre,"width=" + opts.width + ",height="+ opts.height +",dependent" + moreopt);
            return false;
        });
    };
    $.fn.popup.defaults = {
		center: true,
		width:  640,
		height: 480,
		titre:""
    };
})(jQuery);