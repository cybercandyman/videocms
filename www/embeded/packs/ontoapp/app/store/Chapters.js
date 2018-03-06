Ext.define('AM.store.Chapters', {
	extend : 'Ext.data.Store',
	model : 'AM.model.ChapterObject',
	storeId : 'Chapters',
	autoSync : true,
	autoLoad : false,
	proxy : {
		type : 'ajax',
		reader : {
			type : 'json',
			root : 'results.results.bindings'
		},
		/**
		 * PATCH 4.1.1 Store does not send array data to api destroy	
		 */
		batchOrder:"destroy,create,update",
		api : {
			update : BASE_URL + 'prod/chapters/updatesemantics/format/json',
			create : BASE_URL + 'prod/chapters/addsemanticobject/format/json',
			destroy : BASE_URL + 'prod/chapters/delsemantics/format/json',
			read : BASE_URL + 'prod/chapters/getsemantics/format/json'
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
			var proxy = store.getProxy();
			for ( var i = 0; i < records.length; i++) {
				records[i].phantom = true;
			}
		},
		beforesync : function(opts, eopts) {
					
		}

	}
});
