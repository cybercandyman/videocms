Ext.application({
    name: 'AM',
    appFolder: site.BASE_URL + 'embeded/packs/ontoapp/app',
    requires: [ 'AM.util.registry'    ],
    controllers: ['CMChapters'],    
    launch: function() {
        Ext.create('Ext.panel.Panel', { 	        
	    		border:0,	    	
	    		width:400,
	    		height:200,
	    		layout:{
	    			type:'fit',
	    			align:'stretch'
	    		},
	    		renderTo:'chaptermanager',
	            items: [	                          
	                  {
		                	 xtype:'cmchaptersList',		          
		                	 flex:1
		              }  
	            ]	        	
        });        
    }
});
