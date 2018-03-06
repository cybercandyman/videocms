Ext.define('AM.store.Surfaces', {
    extend: 'Ext.data.Store',
    model: 'AM.model.Instance',
    storeId:'Surfaces', 
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