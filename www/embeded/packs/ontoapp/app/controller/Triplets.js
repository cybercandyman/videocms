Ext.define('AM.controller.Triplets', {
    extend: 'Ext.app.Controller',
    stores: ['TripleStore'],
    models: ['Triplet'],
    views: ['triplets.List','triplets.Surface'],
    init: function() {
        
    }

});