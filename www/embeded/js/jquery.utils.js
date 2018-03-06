/**
 * --------------------------------------------------------------------
 * jQuery-Plugin "getMouseCoord"
 * Version: 1.0 18-11-2008
 * by Cyril HOLZER
 *                      
 *
 * Copyright (c) 2008 Cyril HOLZER
 * Licensed under GPL (http://www.opensource.org/licenses/gpl-license.php)
 *
 * 
 * $().getMouseX();
 * $().getMouseY();
 * --------------------------------------------------------------------
 */

(function($) {
    var posx =0;
    var posy =0;
    $.fn.getMouseCoord = function(e) {
         var pageCoords = "( " + e.pageX + ", " + e.pageY + " )";
         var clientCoords = "( " + e.clientX + ", " + e.clientY + " )";
         posx = e.clientX;
         posy = e.clientY;
    };
    $.fn.getMouseX = function (){return posx};
    $.fn.getMouseY = function (){return posy};
    $(document).mousemove($.fn.getMouseCoord);
     
    $.fn.findPosition = function(obj) {
	   var curleft = curtop = 0;
	   if (obj.offsetParent) {
	       do {
			curleft += obj.offsetLeft;
			curtop += obj.offsetTop;
			} while (obj = obj.offsetParent);
	   }
	   
	   return [curleft,curtop];

    };
  
})(jQuery);

(function($){$.fn.lavaLamp=function(o){o=$.extend({fx:"linear",speed:500,click:function(){}},o||{});return this.each(function(){var b=$(this),noop=function(){},$back=$('<li class="back"><div class="left"></div></li>').appendTo(b),$li=$("li",this),curr=$("li.current",this)[0]||$($li[0]).addClass("current")[0];$li.not(".back").hover(function(){move(this)},noop);$(this).hover(noop,function(){move(curr)});$li.click(function(e){setCurr(this);return o.click.apply(this,[e,this])});setCurr(curr);function setCurr(a){$back.css({"left":a.offsetLeft+"px","width":a.offsetWidth+"px"});curr=a};function move(a){$back.each(function(){$(this).dequeue("fx")}).animate({width:a.offsetWidth,left:a.offsetLeft},o.speed,o.fx)}})}})(jQuery);
/*
$("ul.headMenu").lavaLamp(
		{
			fx: "backout", 
			speed: 700
		});
*/