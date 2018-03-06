var mnuContext = new Ext.menu.Menu({
    items: [{
        id: 'do-rename',
        text: APPLOCALIZATION.chaptermanager['Rename']
    },{
        id: 'do-delete',
        text: APPLOCALIZATION.chaptermanager['Delete']
    },{
        id: 'do-cc',
        text: APPLOCALIZATION.chaptermanager['CreateCategory']
    },{
        id: 'do-co',
        text: APPLOCALIZATION.chaptermanager['CreateObject']
    },{
        id: 'do-eo',
        text: APPLOCALIZATION.chaptermanager['EditObject']
    }],
    listeners: {
        click: function(menu,item,e,opts) {
        
            switch (item.id) {
                case 'do-rename':                
                	this.renamePopup();
                    break;
                case 'do-delete':
                	this.deletePopup();
                    break;
                case 'do-cc':
                	this.createCategoryPopup();
                    break;
                case 'do-co':
                	this.createItemPopup();
                    break;
                case 'do-eo':
                	this.editItemPopup();
                    break;
            }
        }
    },
    setState:function(type){
    
    	if(type == "category" || type =="root"){
    		this.items.get("do-eo").disable();
    		this.items.get("do-cc").enable() ;
    		this.items.get("do-co").enable();
    	}else {
    		this.items.get("do-eo").enable();
    		this.items.get("do-cc").disable() ;
    		this.items.get("do-co").disable() ;
    	}
    },
    editItemPopup:function(){
    	openEditDialogKbItem(AM.util.registry.nodeselected.get('id')); 
    },
    createItemPopup : function(){
    	AM.util.registry.nodetocreate = "item";
    	Ext.MessageBox.prompt(APPLOCALIZATION.chaptermanager['ItemCreation'], APPLOCALIZATION.chaptermanager['PleaseEnterYourLabel'], this.createNode);
    	
    },
    createCategoryPopup : function(){
    	AM.util.registry.nodetocreate = "category";
    	Ext.MessageBox.prompt(APPLOCALIZATION.chaptermanager['CategoryCreation'], APPLOCALIZATION.chaptermanager['PleaseEnterYourLabel'], this.createNode);
    },
    createNode : function(buttonId,newVal){
    
    	if(buttonId == "cancel")return;    	
    	 Ext.Ajax.request({
 		    url:   BASE_URL + 'tools/virtualmanager/createnode',
 		    method: 'POST',
 		    params: {
 		        idparent: AM.util.registry.nodeselected.get('id'),
 		        title : newVal,
 		        type:AM.util.registry.nodetocreate
 		    },
 		    success: function(response){ 		    	
 		        var resp =(new Function("return " + response.responseText))();
		        
 		        var newNode = new AM.model.CMChapter(resp);
 		        if(AM.util.registry.nodeselected.isExpanded()){
 		        	AM.util.registry.nodeselected.appendChild(newNode);
 		        }
 		       	
 		    }
 		});    
    },
    renamePopup : function(){    	
    	Ext.MessageBox.prompt(APPLOCALIZATION.chaptermanager['RenameItemCategory'], APPLOCALIZATION.chaptermanager['PleaseEnterYourLabel'], this.renameNode,this,false,AM.util.registry.nodeselected.get("title"));
    } ,
    deletePopup:function(){
    	Ext.MessageBox.confirm(APPLOCALIZATION.chaptermanager['Confirmation'],APPLOCALIZATION.chaptermanager['DoYouConfirmDeletion'],this.deleteNode);
    },
    renameNode:function(buttonId,newVal){
    	
    	Ext.data.StoreManager.lookup('CMChapters').getProxy().extraParams.NEWPARENT_ID = 0;
    	
    	if(buttonId == "cancel")return;
    	AM.util.registry.nodeselected.set("title",newVal);    	
    },
    deleteNode:function(buttonId,newVal){

    	if(buttonId == "no")return;    	     	
    	var node = Ext.data.StoreManager.lookup('CMChapters').getNodeById(AM.util.registry.nodeselected.get('UID'));    	
    	node.remove();
    
    }
});

Ext.define('AM.view.cmchapters.List' ,{
    extend: 'Ext.tree.Panel',
    alias : ['widget.cmchaptersList'],
    store: 'CMChapters',
    id:'treeChapter',  
    viewConfig: {
    	
        plugins: {
        	ptype: 'treeviewdragdrop',
        	ddGroup:'DDZoneChapter',
        	dragDrop:function(){

        	}
        },
        listeners: {        	
        	beforedrop:function(  node,  data, overModel,  dropPosition,  dropHandler,  eOpts ){  
        		Ext.data.StoreManager.lookup('CMChapters').getProxy().extraParams.NEWPARENT_ID = overModel.get('id');        		
        	}     ,
        	drop:function(  node,  data,  overModel,  dropPosition,  eOpts ){
        		Ext.getCmp('treeChapter').fireEvent("pddalc",new Object());
        	}
        	
        }
       
    },
    listeners:{
    	itemclick:function(view,model,item,index,e,eopts){
    		
    	},
    	selectionchange:function(selmodel,selected,eopts){
    		this.getStore().getProxy().extraParams.NODE_ID = selected[0].get('id');
    	},
    	itemcontextmenu: function(grid, record, item,index,event,opts){
    		event.stopEvent();
    		AM.util.registry.nodeselected = record;
    		mnuContext.setState(record.get("attributes_rel"));    		
    	    mnuContext.showAt(event.xy);
    	},

    	beforeitemexpand:function(node,eOpts){
    		this.getStore().getProxy().extraParams.NODE_ID = node.get('id');
    		return true;
    	},
    	render:function(v){
    		v.addEvents("pddalc");
    		/*
    		 this.dragZone = new Ext.dd.DragZone(v.getEl(), {
    			 	ddGroup:'DDZoneChapter',
//    		      On receipt of a mousedown event, see if it is within a DataView node.
//    		      Return a drag data object if so.
    		        getDragData: function(e) {

//    		          Use the DataView's own itemSelector (a mandatory property) to
//    		          test if the mousedown is within one of the DataView's nodes.
    		            var sourceEl = e.getTarget(v.itemSelector, 10);

//    		          If the mousedown is within a DataView node, clone the node to produce
//    		          a ddel element for use by the drag proxy. Also add application data
//    		          to the returned data object.
    		            if (sourceEl) {
    		            	
    		                d = jQuery("<div>mon nouveau div</div>").get(0);    		                
    		                d.id = Ext.id();
    		                return {
    		                    ddel: d,
    		                    sourceEl: sourceEl,
    		                    repairXY: Ext.fly(sourceEl).getXY(),
    		                    sourceStore: v.store    		                   
    		                }
    		            }
    		        },
    		        onDragDrop : function( e,  id ){
    		        	console.log("waza");
    					console.log(e);
    					console.log(id);
    					if(id == "dropZone"){
    						this.hideProxy();
    					}
    		        },

//    		      Provide coordinates for the proxy to slide back to on failed drag.
//    		      This is the original XY coordinates of the draggable element captured
//    		      in the getDragData method.
    		        getRepairXY: function() {
    		            return this.dragData.repairXY;
    		        }
    		    });
*/
    		 
    	}
    },
    initComponent: function() {
    	//Ext.data.StoreManager.lookup(this.getStore()).load();
        this.columns = [{
            xtype: 'treecolumn', //this is so we know which column will show the tree
            text: APPLOCALIZATION.chaptermanager['Title'],			         
            sortable: true,
            dataIndex: 'title',
            flex:1
        }/*,{
        	text:'id',
        	dataIndex:'id'}*/
        ];
        this.callParent(arguments);
    }
});