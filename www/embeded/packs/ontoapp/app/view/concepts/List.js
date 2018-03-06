Ext.define('AM.view.concepts.List' ,{
    extend: 'Ext.tree.Panel',
    alias : ['widget.conceptsList'],
    id:'treeConcept',
   
    store: 'Concepts',
    rootVisible: false,
    loadMask: true,
    viewConfig:{
    	
    	listeners:{    		
        	render:function(view){
        		view.tip = Ext.create('Ext.tip.ToolTip', {
        	        target: view.el,          // The overall target element.
        	        delegate: view.itemSelector, // Each grid row causes its own seperate show and hide.
        	        trackMouse: true,         // Moving within the row should not hide the tip.
        	        renderTo: Ext.getBody(),  // Render immediately so that tip.body can be referenced prior to the first show.
        	        listeners: {              // Change content dynamically depending on which element triggered the show.
        	            beforeshow: function updateTipBody(tip) {
        	            	  tip.update( view.getRecord(tip.triggerElement).get('subject') );
        	            }
        	        }
        	    });

        	}
    	}
    	
    },
    listeners:{
    	itemclick:function(view,model,item,index,e,eopts){
    		try{    			
    			var Enode= view.getTreeStore().getNodeById(model.get('id'));      			
        		Enode.bubble(function(node){            		
        			if(node.get('type') == "root"){        				
            			AM.util.registry.current_node = node.get('subject');    			
            		}   
        		});
    		}
    		catch(exception){}    		
    	},
    	selectionchange:function(model,selected,eopts){
    		
    	}
    },
    initComponent: function() {
    	//Ext.data.StoreManager.lookup(this.getStore()).load();
        this.columns = [{
            xtype: 'treecolumn', //this is so we know which column will show the tree
            text: 'Resource',			         
            sortable: true,
            dataIndex: 'subject',
            flex:1,
            renderer: function(value){
            	 if(value.length  > 30  ){
            		 
            		 return value.substr(0,5) + "..." +  value.substr( (value.length - 25), 25);
            	 } else
            		 return value;
            }
            
        }       
        ];
        this.callParent(arguments);
    }
});