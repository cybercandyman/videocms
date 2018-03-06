
Ext.define('AM.model.Concept', {
    extend: 'AM.data.MyModel',        
    fields: [

             {name: 'subject',   mapping: "subject.value",  type: 'string'},          
             {name: 'label',     type: 'string'},                     
             {name: 'type',     type: 'string'},                        
             {name: 'labeltmp',   convert:function(value,record){            	 
            	 if(typeof(record["raw"])   != "undefined" && typeof(record["raw"]["label"]) != "undefined"){
            		 record.set("label",record["raw"]["label"]["value"]);
            		 return record["raw"]["label"]["value"];
            	 }else
            		 return "";
            	
             }, type: 'string'},                         
             {name:'leaf',
            	 convert:function(value,record){
          	    		var tmp ;
             	  		switch(record.get('type')){
	             	  		case "root" : tmp = false; break;
	     	           	  	case "group" :tmp = false; break;
	     	           	  	default:tmp = false;break;
             	  		} 
             	  		return tmp;             	  	 
            	 } 
             },
             {name:'iconCls',
            	 convert:function(value,record){    
             	  		return record.get('type');             	  	 
            	 } 
             }
         ]
});