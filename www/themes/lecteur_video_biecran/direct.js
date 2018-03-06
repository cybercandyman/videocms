(function($){  

var chapterTpl = null;	
var tpl = null;
var primaryChapters = null;
$.directgcv = function(options){

	var options = $.extend($.directgcv.defaults,options);	
	eventSilverlight = $.directgcv.defaults.silverlight.getEvent ("reload");
	
	checkUpdates();
	setInterval(checkUpdates,$.directgcv.defaults.interval);
	chapterTpl = '<tpl for=".">'+
    '<div class="blocChapitre chapter_0_{idchapter}" data="{idplaylist:0,idchapter:{idchapter},timecode:\'00:00:00\'}" id="chapter_0_{idchapter}" >'+
        '<div class="blocImage">'+
    		'<tpl if="picture != \'\'">'+                                            	
                 '<a href="javascript:void(0)"><img width="32" height="32" src="{picture}"></a>'+
              '</tpl>'+
                            	'<div class="pictos" >'+
              						'<tpl if="file != \'\'">'+                                                          	
                            			'<div class="pictoFunc file">'+
                            					'<a target="_blank" href="{file}" >'+
                            						'<img width="13" height="14"  src="' + $.directgcv.defaults.BASE_URL + 'tools/templates/richplayer/images/picto-pdf.gif">'+
                                           		'</a>'+
                            			'</div>'+
	                                 '</tpl>'+
	                                 '<tpl if="urltitle != \'\'">'+                                                  		
                            			'<div class="pictoFunc url">'+
                            				'<a target="_blank" href="{url}" title="{urltitle}">'+
                            					'<img width="13" height="14"  src="'+ $.directgcv.defaults.BASE_URL +'tools/templates/richplayer/images/picto-web.gif">'+                                            			
                            				'</a>'+
                            			'</div>'+
                            		'</tpl>'+
                            	'</div>'+
                            '</div>'+                                        
                            '<div class="blocDescription">'+                                            	
                            	'<div>'+
                            		'<span class="chapter" >'+
                            	    	'<a href="javascript:void(0)" class="libelle">{title}</a>'+
                            	    '</span>'+
                            	    '&nbsp;<em></em>'+
                            	'</div>'+
                            	'<div>'+
                            		'<span class="qtip" title="{description}">{description}'+                                            			
                            		 '</span>'+
                            	'</div>'+
                            '</div>'+
                            '<div class="clear"></div>'+
					'</div>'+
		'</tpl>';
	tpl = new Ext.XTemplate(chapterTpl);
	tpl.compile();
};

$.directgcv.defaults  = {		
		publicationKey:"",programKey:"",biecran:false,BASE_URL:"",silverlight:null,interval:5000,
		onRefresh:function(content){},
		onChange:function(content){},
		onChapterChange:function(chaptersHTML,currentIDChapter){},
		onPanelChange:function(args){},
		onLanguageChange:function(language){},
		onMMSChange:function(mms){}
};

var eventSilverlight = null;
var direct = {
		lastupdate : "",
		mms : "",
		lang : "",
		title : "",
		picture : "",
		state : "false"	,
		current_panel_content : ""
};

var precedenteState;
var reloadwithautoplay;
function checkUpdates(){
	jQuery.ajax({
		type:"get",
		url:BASE_URL + "rest/direct/" + $.directgcv.defaults.publicationKey + "/id/" + $.directgcv.defaults.programKey + "?format=json",
		success:function(content){	
			$.directgcv.defaults.onRefresh(content);
			if(content.informations == undefined)return;
			 // Anti démarrage
			 if(direct.state == content.informations.isactive && content.informations.isactive == 'false' ){				 
				 return;
			 }					 
			 // Direct information has changed
			 if( content.informations.lastupdate != direct.lastupdate ){
				 if(direct.state != content.informations.isactive  ){				 				 
					 if(content.informations.isactive == 'true'){							 
						 if(content.informations.current.panel.id > 0){
							 reloadwithautoplay = content.informations.current.panel.description.type > 1 ? true:false; 
						 }else{
							 reloadwithautoplay = true;
						 }							 
						 $.directgcv.defaults.silverlight.setEvent ("reload",function(){});		
						 //$.directgcv.defaults.silverlight.setEvent("ready",function(){ setTimeout('$.directgcv.defaults.silverlight.setButtonsVisibility("1001100111111")',0);	 $.directgcv.defaults.silverlight.startPlaying(); });					 
						 reloadPlayer(reloadwithautoplay);
						 oldmms = direct.mms = content.informations.current.mms;
						 oldlanguages = direct.lang = content.informations.current.lcid;	
					 	}
					 else{									
						 //$.directgcv.defaults.silverlight.setEvent("ready",function(){setTimeout('$.directgcv.defaults.silverlight.setButtonsVisibility("1011110111111")',0)});
						 					
						 $.directgcv.defaults.silverlight.setEvent ("reload",function(){});	
						 reloadPlayer(false);
						 removePanel();
						 oldmms = direct.mms = content.informations.current.mms;
						 oldlanguages = direct.lang = content.informations.current.lcid;	
					 }					 
				 }
				 				 
				 $.directgcv.defaults.onChange(content); 				 
				 var oldmms = direct.mms;
				 var oldlanguages = direct.lang;				 				 
				 direct.lastupdate = content.informations.lastupdate; 
				 direct.mms = content.informations.current.mms;
				 direct.title = content.informations.program.title;
				 direct.synopsis = content.informations.program.synopsis;
				 direct.picture = content.informations.program.picture;				 
				 direct.state =  content.informations.isactive;					 
				 direct.lang =  content.informations.current.lcid;	
				 				 
				 if( oldmms != direct.mms || oldlanguages != direct.lang   ){					 
					 if(oldmms != direct.mms)
						 $.directgcv.defaults.onMMSChange( direct.mms);
					 else
						$.directgcv.defaults.onLanguageChange( direct.lang);					
					 if(content.informations.current.panel.id > 0){
						 reloadwithautoplay = content.informations.current.panel.description.type > 1 ? true:false;
					 }else{
						 reloadwithautoplay = true;
					 }				
					 reloadPlayer(reloadwithautoplay);
				 }	
				 
				 if($.directgcv.defaults.biecran ){		
					 
						 $("#zoneTitrePlaylist").html(direct.title);
					 	 defaultState = '<img src="'+ direct.picture +'" width="600px" height="450px"/>';				
						 var newcontent = tpl.applyTemplate(content.informations.chapters.chapter);
						 if(primaryChapters == null)primaryChapters = $("#contenuDynamique").html();
						 
						 if($("#contenuDynamique").html() != newcontent){
							 $.directgcv.defaults.onChapterChange(newcontent,content.informations.isactive == 'true' ? content.informations.current.chapter : 0);
						 }								 						 
						 /**
						 * Panel
						 */
						 if(parseInt (content.informations.current.panel.id) > 0 && content.informations.isactive == 'true'){
							 if(direct.current_panel_content != content.informations.current.panel.description.content){								 
								 switch(parseInt(content.informations.current.panel.description.type)){
								 	case 1 : setDirectPanel(content.informations.current.panel.description.content);						 		
								 		break;
								 	case 2 : setSlide(content.informations.current.panel.description.content);						 		
							 		break;
								 	default:removePanel();break;
								 } 
								 direct.current_panel_content = content.informations.current.panel.description.content;  		
								 $.directgcv.defaults.onPanelChange(content); 
							 }
						 }else{
							 removePanel();
							 if(content.informations.isactive == 'true'){
								 goPlay();
							 }
						 }					
				 }				 
			 }			 
		}		
	});		
}

function goPlay(){
	 if(directpanel == false){
		 $.directgcv.defaults.silverlight.startPlaying();
	 }else{
		 directpanel = false;
		 if(direct.state == 'true'){
			 reloadPlayer(true);
		 }else{
			 reloadPlayer(false);	
		 }
	 }
}
function reloadPlayer(autoplay){	
	
	 $.directgcv.defaults.silverlight.reloadCurrent(autoplay);			 
}

function setSlide(slideUri){	
	if(slideUri != ""){
		var content = '<iframe src="'+slideUri+'" width="100%" height="100%" border="0" frameborder="0" marginwidth="0" marginheight="0"></iframe>' ;
		$("#frame").html(content);
	}   
	removePanel();
	goPlay();
}

var directpanel = false;
function removePanel(){		
	jQuery("#directpanel").remove();
	$("#silverlightControl").attr("height",240);
	$("#silverlightControl").attr("width",425);
	direct.current_panel_content = ""; 	
}
function setDirectPanel(content){
	removePanel();
	directpanel = true;
	$.directgcv.defaults.silverlight.stopPlaying();
	$("#silverlightControl").attr("height",1);
	$("#silverlightControl").attr("width",1);
	jQuery(".player.bloc").append("<div id='directpanel'>" + content + "</div>");	
	// alert(content.informations.current.panel.description.content);
}
})(jQuery);  
