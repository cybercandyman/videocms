Ext.define('AM.store.Concepts', {
    extend: 'Ext.data.TreeStore',
    model: 'AM.model.Concept',
    storeId:'Concepts',
    nodeParam:'node',	
    proxy: {	 
    	type: 'ajax',   
        reader: {
            type: 'json',
            root: 'results',
            successProperty: 'success' ,
            listeners:{
    	    	exception : function (reader,response,error,eopts){    	    		
    	    	}
    	    }
        },
    	api:{
    		read    :BASE_URL + 'tools/semantic/sparql/format/json'
	    }	
    },
    listeners:{
    	beforeload:function(store,operation,eopts){    
    		
    	},
    	load : function ( store, node, records, successful, eOpts ){
    		
    	},
    	beforeexpand:function(node, eOpts ){
    		
    		this.getProxy().extraParams.subject = node.get("subject");
    	}
    	
    },
    folderSort: true
});

