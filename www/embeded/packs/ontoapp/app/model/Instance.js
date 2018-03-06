Ext.define('AM.model.Instance', {
    extend: 'Ext.data.Model',
    fields: [
 			 {name: 'id',   mapping:"subject.value",  type: 'string'},
             {name: 'subject',  mapping:"subject.value",   type: 'string'},
             {name: 'predicate',     type: 'string'},
             {name: 'object',     type: 'string'},
             {name: 'subject_type',     type: 'string'},
             {name: 'object_type',     type: 'string'},
             {name: 'predicate_type',     type: 'string'},
             {name: 'label',type: 'string'},
             {name: 'classlabel',   type: 'string'},             
             {name: 'labeltmp',   convert:function(value,record){            	 
            	 if(typeof(record["raw"])   != "undefined" && typeof(record["raw"]["label"]) != "undefined"){
            		 record.set("label",record["raw"]["label"]["value"]);
            		 return record["raw"]["label"]["value"];
            	 }else
            		 return "";            	
             }, type: 'string'},             
             {name: 'classlabeltmp',   convert:function(value,record){            	 
            	 if(typeof(record["raw"])   != "undefined" && typeof(record["raw"]["classlabel"]) != "undefined"){
            		 record.set("classlabel",record["raw"]["classlabel"]["value"]);
            		 return record["raw"]["classlabel"]["value"];
            	 }else
            		 return "";            	
             }, type: 'string'},
             {name: 'type',    
            	 convert:function(value,record){
            	 		return AM.util.registry.current_node;        	  	 
            	 } ,type: 'string'}
         ]
         
});