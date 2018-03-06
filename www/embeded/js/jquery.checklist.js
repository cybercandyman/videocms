/*
 * Facebox (for jQuery)
 * version: 1 (02/04/2009)
 * @requires jQuery v1.2 or later
 * Copyright 2009 Cyril HOLZER [ cyril.holzer@gmail.com ]
 */

(function($){  

$.checkList = {
	settings:{
		classNameContainer:"checkListContainer",
		classNameContainerList:"checkListContainerList",
		classNameContainerListItem:"checkListContainerListItem",
		classNameContainerListItemLabel:"checkListContainerListItemLabel",
		classNameContainerListItemInput:"checkListContainerListItemInput",
		click:function(){
			if($(this).parent().hasClass("selected"))
				$(this).parent().removeClass( "selected" );
					else
				$(this).parent().addClass( "selected" );
		}
	}
};

$.fn.checkList = function(settings){

	if (settings) $.extend($.checkList.settings, settings);
	$(this).each(function(){
		$container = $('<div/>').attr('class', $.checkList.settings.classNameContainer);
		$liste = $("<ul/>").appendTo($container).attr('class', $.checkList.settings.classNameContainerList); 
		$select = $(this);
		$select.css("display","none");
		$select.children().each(function(){
			 $li = $("<li/>").attr('class', $.checkList.settings.classNameContainerListItem); 
			 $li.html( 
				$("<label/>").attr('class', $.checkList.settings.classNameContainerListItemLabel).html( 
					$("<input type='checkbox'/>").attr('class', $.checkList.settings.classNameContainerListItemInput).attr("name",$select.attr("name")).attr("value",$(this).val()).click(
						$.checkList.settings.click
					).attr("checked", $(this).attr("selected")?"checked":"" )				
				 ).append( $(this).text() )
			).appendTo( $liste );
			
			if($(this).attr("selected")){
				$label = $li.children("label");
				$label.addClass("selected");
			}
		});
		$(this).before($container).remove();
		return $container.jScrollPane();
	});
	
} 
})(jQuery);  


