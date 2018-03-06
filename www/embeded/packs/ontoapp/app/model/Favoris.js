Ext.define('AM.model.Favoris', {
    extend: 'Ext.data.Model',
    fields: [
 			 {name: 'id',     type: 'string'},
 			 {name: 'idbase',     type: 'string'},
             {name: 'subject',   type: 'string'},
             {name: 'predicate',     type: 'string'},
             {name: 'object',     type: 'string'},
             {name: 'subject_type',     type: 'string'},
             {name: 'object_type',     type: 'string'},
             {name: 'predicate_type',     type: 'string'},
             {name: 'label',     type: 'string'},
             {name: 'classlabel',    type: 'string'},
             {name: 'type',type: 'string'},
             {name: 'annotation',     type: 'string'}
         ]         
});