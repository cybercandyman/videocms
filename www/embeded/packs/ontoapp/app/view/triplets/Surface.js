var objectTemplate = new Ext.XTemplate(  '<tpl for=".">',
    	            '<div style="margin-bottom: 10px;" class="thumb-wrap">',
    	            'id:{data.id}',    	            
    	          '</div>',
    	      '</tpl>');
function dropObject(panel){
		    			
	var formPanelDropTargetEl =  panel.body.dom;    	    			
	var formPanelDropTarget = Ext.create('Ext.dd.DropTarget', formPanelDropTargetEl, {
		ddGroup: 'firstGridDDGroup',
	    notifyEnter: function(ddSource, e, data) {
	    		console.log("enter on drop zone");
	    },
	    notifyDrop  : function(ddSource, e, data){
	    	var selectedRecord = ddSource.dragData.records[0];
	        // Reference the record (single selection) for readability
	        console.log(selectedRecord);
	        panel.update(selectedRecord);
	        return true;
	    }
	});
}

Ext.define('AM.view.triplets.Surface', {
    extend:'Ext.panel.Panel',
    alias : [ 'widget.tripletsSurface' ],   
    layout:{    	
    	type:'hbox',
    	align:'stretch'
    },
    border:1,
    rbar:[{ xtype: 'button', text: 'Button 1',
    	  listeners: {
    	        click: {    	            
    	            fn: function(){     	            	
    	            	var bool = true;
    	            	var mess = "";
    	            	if(Ext.getCmp("subjectPanel").data == undefined || Ext.getCmp("subjectPanel").data.get("id") == ""){
    	            		bool = false;
    	            		mess += txt_SubjectIsMissing + "\n";
    	            	}
    	            	if(Ext.getCmp("predicatePanel").data == undefined || Ext.getCmp("predicatePanel").data.get("id") == ""){
    	            		bool = false;
    	            		mess += "predicate is missing\n";
    	            	}
    	            	if(Ext.getCmp("objectPanel").data == undefined || Ext.getCmp("objectPanel").data.get("id") == ""){
    	            		bool = false;
    	            		mess += "Object is missing\n";
    	            	}
    	            	if(!bool)alert(mess);
    	            	
    	            }
    	        }
    	  }
    }],
	items:[
	    {		    	
	    	xtype:'panel',	 
	    	flex:1,    	
	    	border:1,
    	    bodyStyle: {
    	        background: '#ffc'    	       
    	    },
    	    title:'subject',
    	    id:'subjectPanel',
    	    tpl:objectTemplate,
    	    bodyCls:'areaDropObject',    	     
    	    listeners:{
    	    	render:{
    	    		fn: function(panel){ 
    	    			dropObject(panel);
    	    		}
    	    	}
    	    }
	    },
	    {		    	
	    	xtype:'panel',	 
	    	flex:1,   
	    	title:'predicate',
	    	id:'predicatePanel',
	    	border:1,
    	    bodyStyle: {
    	        background: '#ffc'    	       
    	    },
    	    tpl:objectTemplate,
    	    bodyCls:'areaDropObject',    	     
    	    listeners:{
    	    	render:{
    	    		fn: function(panel){ 
    	    			dropObject(panel);
    	    		}
    	    	}
    	    }
	    },
	    {		    	
	    	xtype:'panel',	 
	    	flex:1,  
	    	title:'object',
	    	id:'objectPanel',
	    	border:1,
    	    bodyStyle: {
    	        background: '#ffc'    	       
    	    },
    	    tpl:objectTemplate,
    	    bodyCls:'areaDropObject',    	     
    	    listeners:{
    	    	render:{
    	    		fn: function(panel){ 
    	    			dropObject(panel);
    	    		}
    	    	}
    	    }
	    }
	]
    
});