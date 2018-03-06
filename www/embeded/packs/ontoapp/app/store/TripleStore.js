Ext.define('AM.store.TripleStore', {
    extend: 'Ext.data.Store',
    model: 'AM.model.Triplet',
    storeId:'TripleStore', 
    autoSync:false,
    proxy: {	 
    	type: 'ajax',   
    	extraParams:{},
        reader: {
            type: 'json',
            root: 'rows',
            successProperty: 'success'
        },
    	api:{    		    	
    		//read    :BASE_URL + 'sadmin/ontology/getinstances/format/json'
	    },
    },
    folderSort: true
});