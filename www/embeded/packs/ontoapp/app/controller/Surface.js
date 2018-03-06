Ext.define('AM.controller.Surface', {
    extend: 'Ext.app.Controller',
    stores: ['Surfaces','Favoris'],
    models: ['Instance','Favoris'],
    views: ['surface.List'],
    init: function() {
        
    }
});