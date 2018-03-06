 Ext.define('AM.data.MyModel', {
     extend: 'Ext.data.Model',
     idgen: {
         type: 'sequential',
         seed: 1000,
         prefix: 'ID_'
     }
 });
 