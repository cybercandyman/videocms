var objSemTpl = new Ext.XTemplate(
		'<tpl for=".">',
		'<div class="thumb-wrap" id="{subject}">',
		'<div class="delete"><img src="{[ BASE_URL + "themes/liquid/css/layout/site/tables/action4.gif"  ]}" /></div>',
		'<div class="itempic object {type} {classlabel}"></div>',
		'<span class="x-editable">{label}</span></div>', '</tpl>',
		'<div class="x-clear"></div>');

function initializeDropZone(v) {
	v.dropZone = new Ext.dd.DropZone(v.getEl(), {
		ddGroup : 'semobject',
		getTargetFromEvent : function(e) {
			return e.getTarget(".x-component");
		},
		onNodeOver : function(target, dd, e, data) {			
			return Ext.dd.DropZone.prototype.dropAllowed;
		},
		onNodeDrop : function(target, dd, e, data) {

			var record =  data.records[0].data
			var nobject = new AM.model.Favoris(record);			
			Ext.data.StoreManager.lookup('Chapters').add(nobject);
			return true;
		}
	});
}
Ext.define('AM.view.chapter.List', {
	extend : 'Ext.view.View',
	alias : [ 'widget.chapter' ],
	title : 'Chapters',
	store : 'Chapters',
	tpl : objSemTpl,
	autoScroll:true,
	flex : 1,
	overItemCls : 'x-item-over',
	itemSelector : 'div.thumb-wrap',
	emptyText : APPLOCALIZATION.surface['NothingToDisplay'],
	renderSelectors : {},
	plugins : [],
	initComponent : function() {
		this.callParent(arguments);
	},
	listeners : {
		afterrender : function(v) {
			initializeDropZone(v);

			v.getEl().on('click', function(event, target) {
				var id = Ext.get(target).parent().getAttribute('id');
				v.getStore().removeAt(v.getStore().findExact("subject", id));
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
});