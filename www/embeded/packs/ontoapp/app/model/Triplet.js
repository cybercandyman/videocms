Ext.define('AM.model.Triplet', {
    extend: 'Ext.data.Model',
    fields: [
             'subject_uri','predicate_uri','object_uri',
             'subject_libelle','predicate_libelle','object_libelle'             
            ]
});