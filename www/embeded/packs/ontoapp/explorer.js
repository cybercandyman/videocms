
Ext.application({
    name: 'AM',
    appFolder: site.BASE_URL + 'embeded/packs/ontoapp/app',
    controllers: ['Concepts','Instances','Favoris','Triplets','Surface','Chapter'],
    requires: [ 'AM.util.registry'    ],    
    launch: function() {
        Ext.create('Ext.panel.Panel', {
        		layout:{type:'hbox',  align: 'stretch'},
	    		border:0,	    	
	    		height:300,
	    		minHeight:300,
	    		id:'ExtSemExplorer',
	    		renderTo:'mainexplorer',
	    		title: APPLOCALIZATION.explorer['OntologyTools'],
	    		collapsible:true	,
	    		collapsed:true,
            	collapseDirection : 'top',
            	stateful:true,
	            items: [	                          
	                    {	                    	
	                    	xtype:'panel',	  
	                    	stateful:true,
	                    	flex:2  ,	                    	
	                    	border:1,
	                    	collapsible:true	,
	                    	collapseDirection : 'left',
	                    	title : APPLOCALIZATION.explorer['Explorer'],
	                    	layout:{
	                    		  align:'stretch',
	                    		  type:'hbox',	                    		  
	                    	},
	                    	items : [
	                    	   { xtype: 'conceptsList', flex:1},{                    	
	                        	xtype: 'instancesList',	                        	
	                            flex:2  		        
	                        }]                    	
	                    },
	                    {	                    	
	                    	xtype:'surface',
	                    	stateful:true,
	                    	flex:1,	                    	
	                    	collapsible:false,
	                    	collapseDirection : 'right',	                    	
	                    	collapsed:false
	                    }
	            ]	        	
        });
    }
});

/*
var prefix = {},
values = [];

Ext.Object.each(Ext.ClassManager.maps.aliasToName,function(key,value){
var px = key.split(".")[0];

if(!prefix[px]){
	prefix[px] = px;
	values.push(px);
}
});
console.log(values);
*/