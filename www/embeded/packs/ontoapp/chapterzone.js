Ext.application({
    name: 'AM',
    appFolder: site.BASE_URL + 'embeded/packs/ontoapp/app',
    controllers: [
                  'Chapter'
              ],
    launch: function() {
        Ext.create('Ext.panel.Panel', {        	
        		xtype:'panel',	        	
	    		border:0,
	    		height:120,
	    		minHeight:120,
	    		id:'ExtChapterZone',
	    		stateful:true,
	    		title: APPLOCALIZATION.chapterzone['LinkedObjects'],
	    		collapsible:true	,
	    		collapsed:true,
            	collapseDirection : 'top',
	    		layout:{
	    			 type:'fit'
	    		},   
	    	
	    		renderTo:'chaptersem',
	            items: {xtype:'chapter',flex:1}	            	        	
        });
    }
});