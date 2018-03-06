Ext.require(['Ext.app.EventBus','Ext.view.DragZone','Ext.dd.DragZone'],
	 function() {
	 Ext.override(Ext.view.DragZone, {
		 onValidDrop: function(target, e, id) {
		
			 this.hideProxy();
		        if(this.afterValidDrop){
		            /**
		             * An empty function by default, but provided so that you can perform a custom action
		             * after a valid drop has occurred by providing an implementation.
		             * @param {Object} target The target DD
		             * @param {Event} e The event object
		             * @param {String} id The id of the dropped element
		             * @method afterValidDrop
		             */
		            this.afterValidDrop(target, e, id);
		        }
			 // focus the view that the node was dropped onto so that keynav will be enabled.
		
			 } 
	 });

	 Ext.override(Ext.dd.DragZone, {
		
	 });
	 
			
	        Ext.override(Ext.app.EventBus, {
	            /**
	             * Override to bind the mask to our store.
	             * Not great, but simple.
	             * See: http://www.sencha.com/forum/showthread.php?198680-ext-4.1-Load-mask-on-grid-gone
	             */
	        	constructor: function() {
	        	    var
	        	        me = this,
	        	        // This gets installed as an override for fireEvent on Ext.Component
	        	        // but only once.  Any additional EventBus instances will leverage the
	        	        // original delegate and register its own dispatcher on it.  fireEvent
	        	        // will then call all dispatchers.  This was done this way to retain
	        	        // encapsulation to more easily support the implementation of a destroy
	        	        // method for applications, later (TODO).
	        	        getDelegate = function() {
	        	            var
	        	                // EventBus registry
	        	                _dispatchers = [],
	        	                // The delegate method
	        	                _fireEvent = function _$eventbus(ev) {
	        	                    var me=this, args=arguments, rtn, frtn;
	        	                    if (Ext.util.Observable.prototype.fireEvent.apply(this, arguments) !== false) {
	        	                        Ext.Array.forEach(_dispatchers, function(bus) {
	        	                            frtn = bus.dispatch.call(bus, ev, me, args);
	        	                            if (frtn === false) rtn = false;
	        	                        });
	        	                        return rtn;
	        	                    }
	        	                    return false;
	        	                }
	        	            ;
	        	            // Identify delegate to prevent multiple overrides
	        	            _fireEvent.eventbus = true;
	        	            // EventBus registry API
	        	            _fireEvent.add = function(comp) {
	        	                _dispatchers.push(comp);
	        	            };
	        	            return _fireEvent;
	        	        },
	        	        // By default, pick up existing fireEvent
	        	        delegate = Ext.Component.prototype.fireEvent
	        	    ;
	        	    this.mixins.observable.constructor.call(this);
	        	    this.bus = {};

	        	    // Check if delegate has been previously installed
	        	    // If not, the install it
	        	    if (!delegate.eventbus) {
	        	        delegate = getDelegate();
	        	        Ext.override(Ext.Component, {
	        	            fireEvent: delegate
	        	        });
	        	    }
	        	    // Register self
	        	    delegate.add(me);
	        	}
	        });
	    }
);

var cp = new Ext.state.CookieProvider({
    path: "/",
    expires: new Date(new Date().getTime()+(1000*60*60*24*30))
 });
 Ext.state.Manager.setProvider(cp);







