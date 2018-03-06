var objSemTpl = new Ext.XTemplate(
		'<tpl for=".">',
		'<div class="thumb-wrap" id="{subject}">',
		'<div class="delete"><img src="{[ BASE_URL + "themes/liquid/css/layout/site/tables/action4.gif"  ]}" /></div>',
		'<div class="itempic object {type} {classlabel}"></div>',
		'<span class="x-editable">{label}</span></div>', '</tpl>',
		'<div class="x-clear"></div>');

function initializeItemDragZone(v) {
	v.dragZone = new Ext.dd.DragZone(v.getEl(), {
		ddGroup : 'semobject',
		getDragData : function(e) {
			var sourceEl = e.getTarget(v.itemSelector, 10);
			if (sourceEl) {
				d = sourceEl.cloneNode(true);
				d.id = Ext.id();
				return v.dragData = {
					sourceEl : sourceEl,
					repairXY : Ext.fly(sourceEl).getXY(),
					ddel : d,
					records : new Array(v.getRecord(sourceEl))
				}
			}
		},
		getRepairXY : function() {
			return this.dragData.repairXY;
		}
	});
	v.dropZone = Ext.create('Ext.dd.DropZone', v.el, {
		ddGroup : 'semobject',
		getTargetFromEvent : function(e) {
			return e.getTarget(".x-component");
		},
		onNodeOver : function(target, dd, e, data) {
			return Ext.dd.DropZone.prototype.dropAllowed;
		},
		onNodeDrop : function(target, dd, e, data) {		
			if(typeof(data.records) != "undefined"){
				var store = v.getStore();
				var final_records = [];
			nrecords = data.records.length;
			for ( var i = 0; i < nrecords; i++) {
				var record = data.records[i];
				var found = false;
				store.each(function(row) {
					if (row.get("subject") == record.get("subject")) {
						found = true;
					}
				});
				if (!found) {
					record.phantom = true;
					record.setDirty();
					final_records.push(record);
				}
			}
			store.add(final_records);
			data.records = final_records;
			}
		}
	});
}
Ext.define('Ext.multisort.SortButton', {
    extend: 'Ext.button.Button',
    alias : 'widget.sortbutton',    
    config: {
        direction: "ASC",
        dataIndex: undefined
    },
    
    constructor: function(config) {
        this.addEvents(
            /**
             * @event changeDirection
             * Fired whenever the user clicks this button to change its direction
             * @param {String} direction The new direction (ASC or DESC)
             */
            'changeDirection'
        );
        
        this.initConfig(config);
        
        this.callParent(arguments);
    },
    
    handler: function() {
        this.toggleDirection();
    },
    
    /**
     * Updates the new direction of this button
     * @param {String} direction The new direction
     */
    updateDirection: function(direction) {
        this.setIconCls('direction-' + direction.toLowerCase());
        this.fireEvent('changeDirection', direction);
    },
    
    /**
     * Toggles between ASC and DESC directions
     */
    toggleDirection: function() {
        this.setDirection(Ext.String.toggle(this.direction, "ASC", "DESC"));
    }
});

Ext.define('AM.view.surface.List', {
	extend : 'Ext.panel.Panel',
	alias : [ 'widget.surface' ],
	layout:{type:'fit'},	
	initComponent:function(){
		
		 this.tbar = Ext.create('Ext.toolbar.Toolbar', {
	            plugins : Ext.create('Ext.ux.BoxReorderer', {
	                listeners: {
	                    scope: this,
	                    drop: this.updateStoreSorters
	                }
	            }),
	            defaults: {
	                listeners: {
	                    scope: this,
	                    changeDirection: this.updateStoreSorters
	                }
	            },
	            items: [{
	                xtype: 'tbtext',
	                text: APPLOCALIZATION.surface['SortOnTheseFields'] + ' :',
	                reorderable: false
	            }, {
	                xtype: 'sortbutton',
	                text : 'Type',
	                dataIndex: 'type'
	            }, {
	                xtype: 'sortbutton',
	                text : 'Label',
	                dataIndex: 'label'
	            },{
	                xtype: 'sortbutton',
	                text : 'Class',
	                dataIndex: 'classlabel'
	            }]
	        });
		 
		this.callParent();       
		this.updateStoreSorters();		
	},	
	
	title : 'Favoris',
	items:[{
		xtype:'dataview',	    	
		id:'schmilblickview',
       /* plugins: [Ext.create('Ext.ux.DataView.Animated')],*/
    	flex:1,
    	autoScroll:true,
    	store : 'Favoris',
    	tpl : objSemTpl,
    	overItemCls : 'x-item-over',
    	itemSelector : 'div.thumb-wrap',
    	emptyText : APPLOCALIZATION.surface['NothingToDisplay'],    	
    	listeners : {
    		afterrender : function(cmp) {
    			initializeItemDragZone(cmp);
    			cmp.getEl().on('click', function(event, target) {
    				var id = Ext.get(target).parent().getAttribute('id');
    				cmp.getStore().remove(cmp.getStore().getById(id));
    			}, null, {
    				delegate : 'div.delete'
    			});
    		},
    		render:function(view){
        		view.tip = Ext.create('Ext.tip.ToolTip', {
        	        target: view.el,          // The overall target element.
        	        delegate: view.itemSelector, // Each grid row causes its own seperate show and hide.
        	        trackMouse: true,         // Moving within the row should not hide the tip.
        	        renderTo: Ext.getBody(),  // Render immediately so that tip.body can be referenced prior to the first show.
        	        listeners: {              // Change content dynamically depending on which element triggered the show.
        	            beforeshow: function updateTipBody(tip) {
        	            	  //tip.update( view.getRecord(tip.triggerElement).get('subject') );
        	            	  tip.update( view.getRecord(tip.triggerElement).get('label')  );
        	            	
        	            }
        	        }
        	    });
        	}
    	}
	}],
    /**
     * Returns the array of Ext.util.Sorters defined by the current toolbar button order
     * @return {Array} The sorters
     */
    getSorters: function() {
        var buttons = this.query('toolbar sortbutton'),
            sorters = [];
        Ext.Array.each(buttons, function(button) {
            sorters.push({
                property : button.getDataIndex(),
                direction: button.getDirection()
            });
        });
        
        return sorters;
    },
    /**
     * @private
     * Updates the DataView's Store's sorters based on the current Toolbar button configuration
     */
    updateStoreSorters: function() {
        var sorters = this.getSorters(),
        view = this.down('dataview');
        view.store.sort(sorters);
    }
});
