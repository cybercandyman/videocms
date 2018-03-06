Ext.define('AM.controller.Instances', {
    extend: 'Ext.app.Controller',
    stores: ['Instances'],
    models: ['Instance'],
    views: ['instances.List','instances.Object','favoris.List','surface.List','chapter.List'],
    init: function() {
        this.control({
        	 'instancesList': {
        		 itemdblclick: this.showObject                
            },'favorisList': {
        		 itemdblclick: this.showObject                
            },'#schmilblickview': {
        		 itemdblclick: this.showObject                
            },'chapter': {
            	itemdblclick: this.showObject                
            }
             
        });
    },
    showObject:function(view, record,  item,  index,  e,  eOpts){  
    	
    	var view = Ext.create('AM.view.instances.Object',{'objecturi':record.get('subject')});
    	view.show();
    }	
});