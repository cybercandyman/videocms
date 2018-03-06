Ext.define('AM.view.instances.List', {
	extend : 'Ext.grid.GridPanel',
	alias : [ 'widget.instancesList' ],
	
	store : 'Instances',
	loadMask : true,
	multiSelect : true,
	loadMask : true,
	autoLoad : false,
	viewConfig:{
		
	},
	createGridButton:function(value, id,state, record){					
		/* new Ext.Button({
	            text: value	  ,	      
	            ,handler : function(btn, e) {
	                // do whatever you want here
	            }
	        }).render(document.body, id);*/
	},
	initComponent : function() {
		// Ext.data.StoreManager.lookup(this.getStore()).load();
		this.columns = [
				{
					text : 'Resource',
					sortable : true,
					dataIndex : 'subject',
					flex : 1
				},
				{
					text : 'label',
					sortable : true,
					dataIndex : 'label',
					flex : 2
				}/*
				{
					xtype:'actioncolumn',
					header : 'Favoris',
					align : 'center',
					dataIndex : 'subject',
					items: [{
			                icon: BASE_URL + "themes/system/pics/critical.gif",  // Use a URL in the icon config
			                tooltip: 'Edit',
			                handler: function(grid, rowIndex, colIndex) {
			                   this.icon = BASE_URL + "themes/system/pics/cut.png";
			                }
			        }],
					renderer : function(value, id, r) {							
	         
					}
				}*/ ];
		this.bbar = Ext.create('Ext.PagingToolbar', {
			store : "Instances",
			id : 'PaneStorePaging',
			displayInfo : true,
			displayMsg : APPLOCALIZATION.explorer['DisplayNumOfNum'] ,
			emptyMsg :  APPLOCALIZATION.explorer['NothingToDisplay']
		});

		var me = this;

		me.tbar = [
				
				{
					xtype : 'textfield',
					name : 'searchField',
					id : 'searchField',
					hideLabel : true,
					width : 200
				},
				{
					xtype : 'button',
					text : APPLOCALIZATION.explorer['filter'],
					tooltip : 'filter',
					handler : function() {
						var proxy = this.getStore("Instances").getProxy();
						if (proxy.extraParams.concept != undefined) {
							proxy.extraParams.fulltext = Ext.getCmp("searchField").getValue();
							this.getStore("Instances").loadPage(1);
							console.log(proxy.extraParams);
						}
					},
					scope : me
				}, {
					xtype : 'button',
					text : APPLOCALIZATION.explorer['reset'],
					tooltip : 'reset',
					handler : function() {
						var proxy = this.getStore("Instances").getProxy();
						Ext.getCmp("searchField").setValue("");
						proxy.extraParams.fulltext = "";
						this.getStore("Instances").loadPage(1);
					},
					scope : me
				} ];

		this.callParent(arguments);
	},
	listeners : {
		render : function(v) {

			var el = Ext.get(v.getEl().id);
			v.dragZone = Ext.create('Ext.dd.DragZone', v.getEl(), {
				ddGroup : 'semobject',
				getDragData : function(e) {
					
					var sourceEl = e.getTarget(".x-grid-cell-inner",10), d;
					if (sourceEl) {
						d = sourceEl.cloneNode(true);
						d.id = Ext.id();
						return v.dragData = {
							sourceEl : sourceEl,
							repairXY : Ext.fly(sourceEl).getXY(),
							ddel : d,
							originalid : v.getEl().id,
							records : v.getSelectionModel().getSelection()
						};
					}
				},
				getRepairXY : function() {
					return this.dragData.repairXY;
				}
			});
		}
	}



});

