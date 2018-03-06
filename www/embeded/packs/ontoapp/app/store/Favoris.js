Ext.define('AM.store.Favoris', {
    extend: 'Ext.data.Store',
    model: 'AM.model.Favoris',
    storeId:'Favoris',   
    autoSync: true,
    autoLoad: true,
    proxy: {	 
    	type: 'ajax',
    	reader: {
             type: 'json',
             root: 'results',
             successProperty: 'success' 
    	},
    	api:{
    		create  : BASE_URL + 'tools/semantic/updatefavoris',
    		update	: BASE_URL + 'tools/semantic/updatefavoris',
    		destroy : BASE_URL + 'tools/semantic/deletefavoris',
    		read    : BASE_URL + 'tools/semantic/favoris'
	    },
	    listeners:{
	    	exception:function(){
	    		console.log("EXCEPTION CAPTURED");
	    	}
	    }
    },
    listeners:{
    	datachanged:function(store,opts){	
    	   	
    	},
    	update:function(store){ 	
    		
    	},
    	write:function(writed){
    		
    	},
    	add:function(store,records,index,opts){
    		/*
    		for(var i=0;i<records.length;i++)
		    {    	   
    	    	records[i].setDirty();
		    }    		
    		store.sync();
    		store.load();
    		*/
    	}
	}
});
/*
Ext.data.Store.override({
	  mySync: function(options) {
	    if (Ext.isObject(options)) {
	      this.on("write", function(store, operation) {
	        if (Ext.isDefined(options.scope)) {
	          options.callback.call(options.scope);
	        } else {
	          options.callback.call(this);
	        }
	        store.un("write", options.callback);
	      });
	    }
	    this.sync();
	  }
});*/