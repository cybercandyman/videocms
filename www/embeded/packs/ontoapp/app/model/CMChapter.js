Ext.define('AM.model.CMChapter', {
    extend: 'AM.data.MyModel', 
    idProperty : 'UID',
    fields: [         
             {name: 'title',  	     type: 'string'},     
             {name: 'attributes_id',  mapping:'attributes.id',   type: 'string'},   
             {name: 'attributes_rel', mapping:'attributes.rel',  type: 'string'},   
             {name: 'data_title', mapping:'data.title',   type: 'string'}  , 
             {name: 'data_href', mapping:'data.href',     type: 'string'}  ,
             {name:'leaf',
            	 convert:function(value,record){
          	    		var tmp ;
             	  		switch(record.get('attributes_rel')){
	             	  		case "category" : tmp = false; break;
	     	           	  	case "item" :tmp = true; break;
	     	           	  	default:tmp = false;break;
             	  		} 
             	  		return tmp;             	  	 
            	 } 
             },
             {name:'iconCls',
            	 convert:function(value,record){    
             	  		return record.get('attributes_rel');             	  	 
            	 } 
             }
         ]      
});