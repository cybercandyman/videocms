Ext.define('AM.view.instances.Object' ,{
    extend: 'Ext.window.Window',
    alias : ['widget.instancesObject'],
    title : 'Object', 
    height:400,
    width:600,
    objecturi:'',
    autoScroll:true,

    
    initComponent: function() {
    	var mywindow = this;
    	mywindow.title =  this.objecturi;
    	//Ext.data.StoreManager.lookup(this.getStore()).load();    
    	 Ext.Ajax.request({
 		    url: BASE_URL + 'tools/semantic/objectdescription',
 		    params: { 		        
 		    	'objecturi' : this.objecturi
 		    },
 		    success: function(response){
 		    	mywindow.update( response.responseText);
 		    }
 		});    

        this.callParent(arguments);
    }
});