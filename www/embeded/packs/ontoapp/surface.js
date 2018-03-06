Ext.application({
    name: 'AM',
    appFolder: site.BASE_URL + 'embeded/packs/ontoapp/app',
    controllers: [
                  'Surface'
              ],
    launch: function() {
        Ext.create('Ext.panel.Panel', {        	
        		xtype:'panel',	  
	        	layout:{
	    			 type:'fit'
	    		},   
	    		border:0,
	    		width:400,
	    		height:400,
	    		renderTo:'surface',
	            items: {xtype:'surface'}	            
        });
    }
});