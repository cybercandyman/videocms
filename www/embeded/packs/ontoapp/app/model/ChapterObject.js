Ext.define('AM.model.ChapterObject', {
    extend: 'AM.data.MyModel',
    fields: [        	
 			 {name: 'idbase',     type: 'string'},
             {name: 'subject',   type: 'string'},
             {name: 'predicate',     type: 'string'},
             {name: 'object',     type: 'string'},
             {name: 'subject_type',     type: 'string'},
             {name: 'object_type',     type: 'string'},
             {name: 'predicate_type',     type: 'string'},
             {name: 'label',     type: 'string'},
             {name: 'classlabel',    type: 'string'},
             {name: 'type',type: 'string'},
             {name: 'annotation',     type: 'string'},
             {name: 'classlabeltmp',   convert:function(value,record){            	 
            	 if(typeof(record["raw"])   != "undefined" && typeof(record["raw"]["classlabel"]) != "undefined"){
            		 record.set("classlabel",record["raw"]["classlabel"]["value"]);
            		 return record["raw"]["classlabel"]["value"];
            	 }else
            		 return "";
            	
             }, type: 'string'},
             {name: 'labeltmp',   convert:function(value,record){            	 
            	 if(typeof(record["raw"])   != "undefined" && typeof(record["raw"]["label"]) != "undefined"){
            		 record.set("label",record["raw"]["label"]["value"]);
            		 return record["raw"]["label"]["value"];
            	 }else
            		 return "";
            	
             }, type: 'string'},
             
             {name: 'subjecttmp',   convert:function(value,record){            	 
            	 if(typeof(record["raw"])   != "undefined" && typeof(record["raw"]["subject"]) != "undefined"){
            		 record.set("subject",record["raw"]["subject"]["value"]);
            		 return record["raw"]["subject"]["value"];
            	 }else
            		 return "";
            	
             }, type: 'string'},
             
             {name: 'annotationtmp',   convert:function(value,record){            	 
            	 if(typeof(record["raw"])   != "undefined" && typeof(record["raw"]["annotation"]) != "undefined"){
            		 record.set("annotation",record["raw"]["annotation"]["value"]);
            		 return record["raw"]["annotation"]["value"];
            	 }else
            		 return "";
            	
             }, type: 'string'},
             {name: 'typetmp',   convert:function(value,record){            	 
            	 if(typeof(record["raw"])   != "undefined" && typeof(record["raw"]["type"]) != "undefined"){
            		 record.set("type",record["raw"]["type"]["value"]);
            		 return record["raw"]["type"]["value"];
            	 }else
            		 return "";
            	
             }, type: 'string'}
             
             
         ]         
});