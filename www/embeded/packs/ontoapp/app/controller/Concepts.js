Ext.define('AM.controller.Concepts', {
    extend: 'Ext.app.Controller',
    stores: [ 'Concepts','Instances'],
    models: ['Concept','Instance'],
    views: ['concepts.List'],
    init: function() {
        this.control({
        	 'conceptsList': {
                itemclick: this.loadInstances               
            }
        });
        this.control({
            'viewport > panel': {
                render: this.onPanelRendered
            }
        });
    },
    loadInstances:function(self, store_record, html_element, node_index, event ){  
    	var proxy = this.getStore("Instances").getProxy();    
    	if(store_record.get('type') != "root" && proxy.extraParams.concept != store_record.get("subject")){
    		Ext.getCmp("searchField").setValue("");
    		proxy.extraParams.fulltext = "";	
        	proxy.extraParams.concept = store_record.get("subject");   
        	this.getStore("Instances").loadPage(1);	
    	}    	
    },
    onPanelRendered: function() {
       
    }
   
});