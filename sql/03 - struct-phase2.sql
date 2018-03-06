CREATE SEQUENCE public.direct_iddirect_seq
  INCREMENT 1 MINVALUE 1
  MAXVALUE 9223372036854775807 START 1
  CACHE 1;

CREATE SEQUENCE public.enum_classe2_id_seq
  INCREMENT 1 MINVALUE 1
  MAXVALUE 9223372036854775807 START 1
  CACHE 1;

ALTER SEQUENCE public.enum_classe2_id_seq RESTART WITH 38;

CREATE SEQUENCE public.message_id_seq
  INCREMENT 1 MINVALUE 1
  MAXVALUE 9223372036854775807 START 1
  CACHE 1;

ALTER SEQUENCE public.message_id_seq RESTART WITH 16;

CREATE SEQUENCE public.panes_idpane_seq
  INCREMENT 1 MINVALUE 1
  MAXVALUE 9223372036854775807 START 1
  CACHE 1;

ALTER SEQUENCE public.panes_idpane_seq RESTART WITH 49;

ALTER TABLE public.chapters
  ADD COLUMN "ord" INTEGER;

ALTER TABLE public.chapters
  ALTER COLUMN "ord" SET DEFAULT 0;

ALTER TABLE public.chapters
  ADD COLUMN "state" INTEGER;

ALTER TABLE public.chapters
  ALTER COLUMN "state" SET DEFAULT 0;

ALTER TABLE public.programs
  ADD COLUMN "direct" INTEGER;

ALTER TABLE public.programs
  ALTER COLUMN "direct" SET DEFAULT 0;

ALTER TABLE public.programs_fields_group_fields
  ADD COLUMN "cat2" VARCHAR;


CREATE TABLE "public"."direct" (
  "iddirect" INTEGER DEFAULT nextval('direct_iddirect_seq'::regclass) NOT NULL, 
  "idprog" BIGINT, 
  "mms" VARCHAR, 
  "timeend" DATE, 
   "current_panel" integer,
  "current_chapter" integer,
  "lastupdate" bigint,
  "lang" VARCHAR,
  CONSTRAINT "direct_pkey" PRIMARY KEY(iddirect)
) WITHOUT OIDS;

CREATE TABLE "public"."message" (
  "id" INTEGER NOT NULL, 
  "name" VARCHAR(50) NOT NULL, 
  "userid" INTEGER NOT NULL, 
  "date" DATE, 
  "message" TEXT NOT NULL, 
  CONSTRAINT "message_pkey" PRIMARY KEY(id)
) WITHOUT OIDS;

CREATE TABLE "public"."panes" (
  "idpane" INTEGER DEFAULT nextval('panes_idpane_seq'::regclass) NOT NULL, 
  "title" VARCHAR(255), 
  "content_type" VARCHAR, 
  "publication_state" INTEGER, 
  "content" TEXT, 
  "applicable_environnement" TEXT, 
  "code" VARCHAR, 
  CONSTRAINT "panes_pkey" PRIMARY KEY(idpane)
) WITHOUT OIDS;

DROP VIEW "public"."chaptersview";

CREATE VIEW "public"."chaptersview" (
    id,
    idprog,
    idplaylist,
    idfgroup,
    value,
    state,
    idproduction,
    idpublication,
    idfield,
    title,
    type,
    table_ref,
    parent,
    mask,
    default_value,
    help,
    is_editable,
    category,
    indexable,
    code,
    playlistkey,
    keyprog,
    fromkeyprog,
    textsearchable_index_col,
    direct)
AS
 SELECT DISTINCT c.id, c.idprog, c.idplaylist, ct.idfgroup, ct.value, p.state, p.idproduction, p.idpublication, pf.idfield, pf.title, pf.type, pf.table_ref, pf.parent, pf.mask, pf.default_value, pf.help, pf.is_editable, pf.category, pf.indexable, pf.code, playlists.key AS playlistkey, p.keyprog, poff.keyprog AS fromkeyprog, ct.textsearchable_index_col, p.direct
   FROM chapters c
   LEFT JOIN programs p ON c.idprog = p.idprog
   LEFT JOIN productions prod ON p.idproduction = prod.idproduction
   LEFT JOIN chapters_translations ct ON c.id = ct.idchapter
   LEFT JOIN programs_fields_group_fields pfgf ON ct.idfgroup = pfgf.idfgroup
   LEFT JOIN programs_fields_group pfg ON pfgf.idgroup = pfg.idgroup
   LEFT JOIN programs_fields pf ON pf.idfield = pfgf.idfield
   LEFT JOIN playlists ON c.idplaylist = playlists.idplaylist
   LEFT JOIN programs poff ON p.idprog_programs_of = poff.idprog
  WHERE p.state::text = 'ACTIVATED'::text;


DROP VIEW "public"."programsview";

CREATE VIEW "public"."programsview" (
    idprog,
    idprog_programs_extract,
    idproduction,
    idextfilm,
    keyprog,
    duration,
    date,
    tcin,
    tcout,
    state,
    type_extract,
    viewof,
    idpublication,
    idprog_programs_of,
    idfield,
    title,
    type,
    table_ref,
    parent,
    mask,
    default_value,
    help,
    is_editable,
    category,
    indexable,
    code,
    value,
    idview,
    programstate,
    textsearchable_index_col,
    alias,
    direct)
AS
 SELECT DISTINCT p.idprog, p.idprog_programs_extract, p.idproduction, p.idextfilm, p.keyprog, p.duration, p.date, p.tcin, p.tcout, p.state, p.type_extract, p.viewof, p.idpublication, p.idprog_programs_of, pf.idfield, pf.title, pf.type, pf.table_ref, pf.parent, pf.mask, pf.default_value, pf.help, pf.is_editable, pf.category, pf.indexable, pf.code, pt.value, pt.idview, p2.state AS programstate, pt.textsearchable_index_col, prod.alias, p2.direct
   FROM programs p
   LEFT JOIN productions prod ON p.idproduction = prod.idproduction
   LEFT JOIN programs_fields_group pfg ON prod.idgroup = pfg.idgroup
   LEFT JOIN programs_fields_group_fields pfgf ON pfg.idgroup = pfgf.idgroup
   LEFT JOIN programs_fields pf ON pfgf.idfield = pf.idfield
   LEFT JOIN programs_translations pt ON pt.idfgroup = pfgf.idfgroup AND pt.idprog = p.idprog
   LEFT JOIN programs p2 ON p.idprog_programs_of = p2.idprog
  WHERE p.state::text = 'ACTIVATED'::text AND prod.isdeleted = 0
  ORDER BY p.idprog;


  
  -- Table: panes

-- DROP TABLE panes;

CREATE TABLE programs_panes
(
  idpane serial NOT NULL,
  title character varying(255),
  content_type character varying,
  publication_state integer,
  pane_content text,
  applicable_environnement text,
  code character varying,
    idproduction bigint,
  idpublication bigint,
  CONSTRAINT programs_panes_pkey PRIMARY KEY (idpane)
);

drop index i_fk_programs_fields_group_fi1;
drop index i_fk_programs_fields_group_fie;
drop index i_fk_programs_traduction_field;
drop index i_fk_programs_traduction_tradu;
drop index i_fk_programs_traduction_progr;
drop index i_fk_programs_publications_pro;
drop index i_fk_programs_publications_pub;
drop index i_fk_publications_menus_eleme1;
drop index i_fk_publications_menus_elemen;
drop index i_fk_productions_menus_elemen1;
drop index i_fk_productions_menus_element;
CREATE INDEX programs_fields_group_fields_idx on programs_fields_group_fields(idfield,idgroup);
CREATE INDEX chapters_translations_idx1 on chapters_translations(idfgroup,idchapter);
CREATE INDEX programs_translations_idx1 on programs_translations(idfgroup,idprog);
CREATE INDEX translations_idx1 on translations(column_title,table_name,lang);
CREATE INDEX programs_publications_idx1 on programs_publications(idprog,idpublication);
CREATE INDEX direct_idx1 on direct(idprog);
CREATE INDEX publications_menus_elements_idx1 on publications_menus_elements(idpublication,iduser);
CREATE INDEX productions_menus_elements_idx1 on productions_menus_elements(idproduction,iduser);
