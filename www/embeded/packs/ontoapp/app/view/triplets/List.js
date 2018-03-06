Ext.define('AM.view.triplets.List', {
	extend : 'Ext.grid.GridPanel',
	alias : [ 'widget.tripletsList' ],
	title : 'Triplets',
	store : 'TripleStore',	
	viewConfig : {		
		listeners : {
			drop : function(node, data, dropRec, dropPosition) {			
			},
			beforedrop : function(node, data, overModel, dropPosition,dropFunction, eOpts) {		
			}
		}
	},
	initComponent : function() {
		// Ext.data.StoreManager.lookup(this.getStore()).load();
		this.columns = [ {
			text : 'Subject',
			sortable : true,			
			flex : 1
		}, {
			text : 'Predicate',
			sortable : true,			
			flex : 2
		},{
			text : 'Object',
			sortable : true,			
			flex : 2
		} ];
		this.callParent(arguments);
	}
});