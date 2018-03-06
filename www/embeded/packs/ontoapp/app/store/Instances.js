Ext.define('AM.store.Instances', {
    extend: 'Ext.data.Store',
    model: 'AM.model.Instance',
    storeId:'Instances', 
    autoSync:false,
    remoteSort: true,
    pageSize: 50,
    proxy: {	 
    	type: 'ajax',   
    	extraParams:{},
        reader: {
            type: 'json',
            root: 'results.results.bindings',
            totalProperty: 'totalCount',
            successProperty: 'success'
        },
        simpleSortMode: true,
    	api:{    		    	
    		read    :BASE_URL + 'tools/semantic/getinstances/format/json'
	    },
    },
    folderSort: true
});