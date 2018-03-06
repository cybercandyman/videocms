delete from chapters_translations;
delete from chapters;
delete from groups_programs;
delete from groups;
delete from playlists_programs;
delete from programs_versions;
delete from programs_publications;
delete from programs_translations;
delete from programs_extracts;
delete from programs_pictures;
delete from programs;
--delete from users;
--delete from ressources_access;
delete from billings;
delete from billings_others;
delete from kb_items_translations;
delete from kb_items;
delete from kb_rub;
delete from knowledge_base;
delete from masters;
delete from productions_publications;
delete from playlists_programs;
delete from playlists;
delete from publications_views;
delete from publications;
delete from productions;
delete from organizations;
delete from organizations_contacts;
delete from productions_rate;
delete from publications_identifications;
delete from services;
delete from tokens;
delete from versions;
delete from encoding_formats;
delete from encoding_profils;
delete from encoding_profils_formats;
delete from logs;
delete from tasks;
delete from services_types_selected;
delete from services_orders;
delete from services_orders_chapitrage;
delete from services_orders_encoding;
delete from services_orders_lines;
delete from services_orders_subtitling;
delete from services_orders_translation;
delete from services_orders_watermarking;
delete from themes;
--INSERT INTO users (iduser, idgroup, name, firstname, email, phonenumber, faxnumber, adress1, adress2, city, postalcode, ulogin, upassword, lastconnection, state, userkey, lang, secretquestion, secretresponse) VALUES ( 1,0, '', '', '', '', '', '', '', '', '', 'administrateur', '19ad89bc3e3c9d7ef68b89523eff1987', NULL, 1, '6b3f0354e74163385d03', NULL, NULL, NULL);
--INSERT INTO ressources_access (iduser, idcomponent, level, state, authorization_type, idacces, module, ressource) VALUES (1, 0, 0, 1, 0, 1, 'sadmin', 1);
--select max(id) from enum_audience
--select setval('enum_audience_id_seq',3)
--select max(id) from enum_countries;
--select setval('enum_countries_id_seq',280);
--select max(id) from enum_lieu;
--select setval('enum_lieu_id_seq',7);
--select max(id) from enum_lieu2;
--select setval('enum_lieu2_id_seq',132);
--select max(id) from enum_organization;
--select setval('enum_organization_id_seq',6);
--select max(id) from enum_organization2;
--select setval('enum_organization2_id_seq',33);
--select max(id) from enum_personne;
--select setval('enum_personne_id_seq',4);
--select max(id) from enum_personne2;
--select setval('enum_personne_id_seq',23);
--select max(id) from  enum_public;
--select setval('enum_public_id_seq',4);
--select max(id) from  enum_public2;
--select setval('enum_public_id_seq',21);
--select max(id) from  enum_theme;
--select setval('enum_theme_id_seq',8);
--select max(id) from  enum_theme2;
--select setval('enum_theme2_id_seq',43);
select setval('chapters_id_seq',1);
select setval('encoding_formats_idformat_seq',1);
select setval('encoding_profils_idprofil_seq',1);
select setval('kb_items_id_seq',1);
select setval('knowledge_base_idkb_seq',1);
select setval('logs_idlog_seq',1);
select setval('playlists_idplaylist_seq',1);
select setval('productions_idproduction_seq',1);
select setval('programs_pictures_idpicture_seq',1);
select setval('publications_idpublication_seq',1);
select setval('ressources_access_idaccess_seq',1);
select setval('services_idservice_seq',1);
select setval('tasks_idtask_seq',1);
select setval('tokens_idtoken_seq',1);
select setval('versions_idversion_seq',1);
select setval('views_idview_seq',1);
select setval('programs_idprog_seq',1);

