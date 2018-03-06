/*
 * VideoInfos (for jQuery)
 * version: 1 (13/01/2010)
 * @requires jQuery v1.2 or later
 * Copyright 2010 Cyril HOLZER [ cyril.holzer@gmail.com ]
 */

(function($){  

	var videoFilesToChek; // LIFO
	var videoFilesAnalysed = new Array();
	var slObject;
	var threadRunning = false;
	var currentFile ;
	var timeout;

	Silverlight.isInstalled = function(version)
	{
	    if (version == undefined)
	        version = null;
	        
	    var isVersionSupported = false;
	    var container = null;

	    try
	    {
	        var control = null;
	        var tryNS = false;

	        if (window.ActiveXObject)
	        {
	            try
	            {
	                control = new ActiveXObject('AgControl.AgControl');
	                if (version === null)
	                {
	                    isVersionSupported = true;
	                }
	                else if (control.IsVersionSupported(version))
	                {
	                    isVersionSupported = true;
	                }
	                control = null;
	            }
	            catch (e)
	            {
	                tryNS = true;
	            }
	        }
	        else
	        {
	            tryNS = true;
	        }
	        if (tryNS)
	        {
	            var plugin = navigator.plugins["Silverlight Plug-In"];
	            if (plugin)
	            {
	                if (version === null)
	                {
	                    isVersionSupported = true;
	                }
	                else
	                {
	                    var actualVer = plugin.description;
	                    if (actualVer === "1.0.30226.2")
	                        actualVer = "2.0.30226.2";
	                    var actualVerArray = actualVer.split(".");
	                    while (actualVerArray.length > 3)
	                    {
	                        actualVerArray.pop();
	                    }
	                    while (actualVerArray.length < 4)
	                    {
	                        actualVerArray.push(0);
	                    }
	                    var reqVerArray = version.split(".");
	                    while (reqVerArray.length > 4)
	                    {
	                        reqVerArray.pop();
	                    }

	                    var requiredVersionPart;
	                    var actualVersionPart;
	                    var index = 0;


	                    do
	                    {
	                        requiredVersionPart = parseInt(reqVerArray[index]);
	                        actualVersionPart = parseInt(actualVerArray[index]);
	                        index++;
	                    }
	                    while (index < reqVerArray.length && requiredVersionPart === actualVersionPart);

	                    if (requiredVersionPart <= actualVersionPart && !isNaN(requiredVersionPart))
	                    {
	                        isVersionSupported = true;
	                    }
	                }
	            }
	        }
	    }
	    catch (e)
	    {
	        isVersionSupported = false;
	    }
	    
	    return isVersionSupported;
	};
	
	function fileinfo(){
		
		var filename = "";
		var mms = "";
		var queueState = ""; // DONE - RUNNING - QUEUED
		var status = ""; // SUCCESS - FAILED
		var duration = "";
		var resolution = "";
		var ratio = "";
		var audioStreamCount = "";
	}
	
	$.videoInfos = function(files,options){		
			
			var options = $.extend($.videoInfos.defaults,options);
			if(!Silverlight.isInstalled()){
				$.videoInfos.defaults.threadCompleted(false);
				return;
			}
			videoFilesToChek = files;
			var init = function (){
		    	$("body").append('<div id="silverlightVideoContent">'+ options.embedSilverlight +'</div>');
		    	slObject =  threadRunning = currentFile= null;
		    	videoFilesAnalysed = new Array();
		    };
		    
		    init.call();
	};
	$.videoInfos.defaults  = {			
			embedSilverlight:'<object data="data:application/x-silverlight-2," type="application/x-silverlight-2" width="0" height="0"  id="SlObj">'+
			'<param name="source" value="'+ BASE_URL +'embeded/silverlight/editVideo.xap"/>'+		
			'<param name="onload" value="$.videoInfos.loaded" />'+			  
			'<param name="onerror" value="$.videoInfos.error" />'+			  
			'<param name="enableHtmlAccess" value="true" />'+		  
			'<param name="background" value="black" />'+
			'<param name="minRuntimeVersion" value="3.0.40624.0" />'+
			'<param name="autoUpgrade" value="true" />'+
			'<param name="enableGPUAcceleration" value="true"/>'+
			'<a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=3.0.40624.0" style="text-decoration:none">'+
			'<img src="http://go.microsoft.com/fwlink/?LinkId=108181" alt="Get Microsoft Silverlight" style="border-style:none"/>'+
			'</a>'+
			'</object>'	,
			threadCompleted:function(eventArgs){
				return eventArgs;
			}
	};
	function processFiles(){		
		timeout = setTimeout(processFiles,1000);
		thread();
	};	
	function  thread(){
		
		if(!threadRunning){
			if(videoFilesToChek.length>0){				
				threadRunning = true;
				var mms =  videoFilesToChek.pop();				
				slObject.Content.SilverlightApp.loadVideo(mms);
				currentFile = new fileinfo();
				currentFile.mms = mms;
				currentFile.queueState = "RUNNING";
			}
			else{
				
				// FIN DE LA TACHE
				clearTimeout(timeout);
				$("#silverlightVideoContent").remove();
				$.videoInfos.defaults.threadCompleted(videoFilesAnalysed ); 
			}
		}
	};
	function stockFile(){
		videoFilesAnalysed.push(currentFile);
	}	
	function formatDuration(duration){
		return substr(0,8);		
	}
	$.videoInfos.mediaOpened = function(resolution,duration,audiostreamcount,ratio){
		// Si méthode appelé sans que le thread soit initialisé à partir du plugin, on ne gére pas le retour
		if(threadRunning){
			threadRunning = false;
			currentFile.queueState = "DONE";
			currentFile.status = "SUCCESS";
			currentFile.resolution = resolution;
			currentFile.duration = duration.substr(0,8);
			currentFile.audioStreamCount = audiostreamcount;
			currentFile.ratio = ratio;
			stockFile();
		}else{
			try{					
				$(document).trigger("sl_media_loaded");
			}catch(Exception){}
		}
	};
	$.videoInfos.mediaFailed = function(Exception){
		
		if(slObject !== undefined){
			
			threadRunning = false;
			currentFile.queueState = "DONE";
			currentFile.status = "FAILED";
			stockFile();
		}
	};
	$.videoInfos.error = function()
	{
		alert('error');
	};
	$.videoInfos.loaded = function()
	{
		
		slObject = $("#SlObj").get(0);
		if(slObject !== undefined)
		processFiles();
	};
	$.videoInfos.screenShot = function(stringBase64Encoded,timecode) {
			$.ajax({
				
			  type: "POST",
			  url: BASE_URL + "tools/filemanager/savescreenshot",
			  data: ({pictureEncoded : stringBase64Encoded,timecode:timecode,filename:$(".filename",currentElement).html()}),
			  dataType:"xml",
			  success: function (responseXML){													
				var message =  $('message',responseXML ).text();
					if( $('status', responseXML).text() == "true"){
						alert("saved");											
					}else{
						alert(message);
					} 
				}
			});
	}
})(jQuery);  


