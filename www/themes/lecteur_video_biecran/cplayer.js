(function($){

	$.fn.silverlight = function(options){	
		var defaults = {
			events:{
				stateChange:function(){},
				chapterChange:function(){},
				playlistChange:function(){},
				reload:function(){},
				ready:function(){}
			}	
		};
		var opts = $.extend(defaults, options);	
       
		function controller (objectReference,events){		
			this.date = new Date();	
			this.events = events;
			this.svlObject = objectReference;				
			this.svlObject.Content.SilverlightApp.stateChange = events.stateChange;
			this.svlObject.Content.SilverlightApp.chapterChange = events.chapterChange;
			this.svlObject.Content.SilverlightApp.playlistChange = events.playlistChange;
			this.svlObject.Content.SilverlightApp.ready = events.ready;
			this.svlObject.Content.SilverlightApp.reload = events.reload;
				
			this.setEvent = function(event_type,fn){
				try{
					this.svlObject.Content.SilverlightApp[event_type] = fn;
					this.events[event_type]= fn;
				}
				catch(error){
					
				}
				
			}
			this.getEvent = function(event_type){return this.svlObject.Content.SilverlightApp[event_type];}
			
			/**
			@desc Get current position of the current media
			@return string
			*/
			this.getCurrentPosition = function() { return this.svlObject.Content.SilverlightApp.getCurrentPosition();};	        
			/**
			@desc Get current source of the current media
			@return string
			*/
			this.getSource = function () { return this.svlObject.Content.SilverlightApp.getSource(); };
			/**
			 @desc Get current stretch mode 
			 @return string
			*/
			this.getStretch = function () {return this.svlObject.Content.SilverlightApp.getStretch();};
			/**
			@desc Get current state : Cf mediaElement state
			@return string
			*/
			this.getCurrentState = function () { return this.svlObject.Content.SilverlightApp.getCurrentState();};
			/**
			@desc Set the audio stream index
			@param int index
			@return void
			*/
		   this.setAudioStreamIndex = function (index) {this.svlObject.Content.SilverlightApp.setAudioStreamIndex(index);};
		   /**
		   @desc Set position in the video
		   @param string timestamp "00:00:00"
		   @return void
		   */
		   this.setPositionWithTimeCode = function (timestamp) { this.svlObject.Content.SilverlightApp.setPositionWithTimeCode(timestamp);};
		   /**
		   @desc Start the mediaElement
		   @return void
		   */
		   this.startPausePlaying = function () {this.svlObject.Content.SilverlightApp.startPausePlaying(); };
		   /**
		   @desc Stop the mediaElement
		   @return void
		   */
		   this.stopPlaying = function () {this.svlObject.Content.SilverlightApp.stopPlaying();};	
		   /**
		   @desc Start the mediaElement
		   @return void
		   */
		   this.startPlaying = function () {this.svlObject.Content.SilverlightApp.startPlaying();};
		   /**
		   @desc Pause the mediaElement
		   @return void
		   */
		   this.pausePlaying = function () {this.svlObject.Content.SilverlightApp.pausePlaying();};
		   /**
		   @desc Go to the next program/step
		   @return void
		   */	       
		   this.nextStep =  function () {this.svlObject.Content.SilverlightApp.nextStep();};
		   /**
		   @desc Go to the previous program/step
		   @return void
		   */
		   this.previousStep = function () {this.svlObject.Content.SilverlightApp.previousStep();};
		   /**
		   @desc Go to the next chapter
		   @return void
		   */
		   this.nextChapter = function () {this.svlObject.Content.SilverlightApp.nextChapter();};
		   /**
		   @desc Go to the previous chapter
		   @return void
		   */
		   this.previousChapter = function () {this.svlObject.Content.SilverlightApp.previousChapter();};
		   /**
		   @desc Get audio volume
		   @return string
		   */
		   this.getVolume = function () {return this.svlObject.Content.SilverlightApp.getVolume();};
		   /**
		   @desc Set audio volume
		   @param double value
		   @return void
		   */
		   this.setVolume = function (value) {this.svlObject.Content.SilverlightApp.setVolume(value);};
		   /**
		   @desc Load the ressource into the player
		   @return void
		   */
		   this.loadFromXML = function (value) {this.svlObject.Content.SilverlightApp.loadFromXML(value);};
		   /**
		   @desc Set playlist index
		   @param double value
		   @return void
		   */
		   this.setPlaylistIndex = function(value){ this.svlObject.Content.SilverlightApp.setPlaylistIndex(value);};
		   /**
		   @desc Set chapter index
		   @param double value
		   @return void
		   */
		   this.setChapterIndex = function(idchapter,idplaylist){ this.svlObject.Content.SilverlightApp.setChapterIndex(idchapter,idplaylist);};
		   /**
		   @desc Return the current playlist index
		   @param 
		   @return string
		   */
		   this.getPlaylistIndex = function(){ return this.svlObject.Content.SilverlightApp.getPlaylistIndex();};
		   /**
		   @desc Return the current chapter index
		   @param 
		   @return string
		   */
		   this.getChapterIndex = function(){ return this.svlObject.Content.SilverlightApp.getChapterIndex();};
		   /**
		   @desc forward the video for x seconds
		   @param 
		   @return int
		   */
		   this.forwardBy = function(intSeconds){  this.svlObject.Content.SilverlightApp.forwardBy(intSeconds);};
		   /**
		   @desc rewind the video for x seconds
		   @param 
		   @return int
		   */
		   this.rewindBy = function(intSeconds){  this.svlObject.Content.SilverlightApp.rewindBy(intSeconds);};
		   /**
		   @desc set position in the video with double (seconds)
		   @param 
		   @return int
		   */
		   this.setPositionWithDouble = function(intSeconds){  this.svlObject.Content.SilverlightApp.setPositionWithDouble(intSeconds);};
		   /**
		   @desc seek the video with double (seconds)
		   @param 
		   @return string
		   */
		   this.seekToTimeByDouble = function(intSeconds){  this.svlObject.Content.SilverlightApp.seekToTimeByDouble(intSeconds);};
		   /**
		   @desc seek the video with timecode, optionaly a delta if events occurs to often 	  
		   @param 
		   @return string
		   */
		   this.seekToTimeByTimecode = function(timecode,delta){  this.svlObject.Content.SilverlightApp.seekToTimeByTimeCode(timecode,delta);};
			/**
			@desc Reload the current Resource
			@return string
			*/
			this.reloadCurrent = function(autoplay) { return this.svlObject.Content.SilverlightApp.reloadCurrent(autoplay);};	
			/**
			@desc Set buttons visibility
			@return string
			*/
			this.setButtonsVisibility = function(visibility) {try{	this.svlObject.Content.SilverlightApp.setButtonsVisibility(visibility);}catch(error){return error;}	};	
	};
	
	   return 	 new controller( $(this).get(0) ,opts.events);		
	};	
})(jQuery);  
	


       

			
			
			
			
			
        
			  