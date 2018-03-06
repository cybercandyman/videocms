Ext.define('AM.store.CMChapters', {
	extend : 'Ext.data.TreeStore',
	model : 'AM.model.CMChapter',
	storeId : 'CMChapters',
	autoSync : true,
	autoLoad : false,	
    nodeParam:'node',	
    root: {
        expanded: false,
        title: "My Root",
        attributes_rel : 'root'
    },    
    sortOnLoad:true,
    sorters:[{property:'title',direction:'ASC'}],
	proxy : {
		type : 'ajax',
		reader : {
			type : 'json'
		},
		extraParams : {NODE_ID:null},
		api : {		
			read : BASE_URL + 'tools/virtualmanager/getnode',
			create  :  BASE_URL + 'tools/virtualmanager/createnode',
			update  :  BASE_URL + 'tools/virtualmanager/renamenode',
			destroy : BASE_URL + 'tools/virtualmanager/removenode'
		},
		listeners : {
		}
	},
	listeners : {
		datachanged : function(store, opts) {
		},
		update : function(store) {
		},
		write : function(writed) {
		},
		add : function(store, records, index, opts) {					
		},
		beforesync:function(opts,eopts){
		}
		
	}
});
