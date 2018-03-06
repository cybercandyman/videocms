Ext.define('AM.view.favoris.List', {
	extend : 'Ext.grid.GridPanel',
	alias : [ 'widget.favorisList' ],
	title : 'Favoris',
	store : 'Favoris',	
	viewConfig : {
		listeners : {
			drop : function(node, data, dropRec, dropPosition) {			
			},
			beforedrop : function(node, data, overModel, dropPosition,dropFunction, eOpts) {
				var store = Ext.data.StoreManager.lookup(this.getStore());		
				var final_records = [];
			    nrecords = data.records.length;
			    for(var i=0;i<nrecords;i++)
			    {
			    	  var record = data.records[i];
			    	  var found = false;
				      store.each(function(row){
				        	if (row.get("id") == record.get("id"))
					        {
					            found = true;					            
					        }
				        });					       
				      if(!found){
				    	  final_records.push(record);
				      }
			    }
			    data.records = final_records;					    						    				
			}
		}
	},
	initComponent : function() {
		// Ext.data.StoreManager.lookup(this.getStore()).load();
		this.columns = [ {
			text : 'Resource',
			sortable : true,
			dataIndex : 'subject',
			flex : 1
		}, {
			text : 'libelle',
			sortable : true,
			dataIndex : 'label',
			flex : 2
		}, {
			text : 'class',
			sortable : true,
			dataIndex : 'classlabel',
			flex : 1
		}, {
			text : 'type',
			sortable : true,
			dataIndex : 'type',
			flex : 1
		} ,
		
		{
			text: APPLOCALIZATION.explorer['Actions'],
        	menuDisabled:true,
    	    xtype:'actioncolumn',
    	    align:'center',
    	    items: [{
        	    tooltip: APPLOCALIZATION.explorer['Delete'],        		
            	icon:BASE_URL + "themes/liquid/css/layout/site/tables/action4.gif",		            	    		            	  
            	handler: function(grid, rowIndex, colIndex) {	
            		 grid.getStore().removeAt(rowIndex);
            		 
            	}
    	    }]
		}
		];
		this.callParent(arguments);
	},
	listeners : {
		render:function(v){
			
		}
	}
});