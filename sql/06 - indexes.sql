CREATE INDEX kb_items_translations_idx on kb_items_translations(iditem,idfgroup);
CREATE INDEX kb_items_idx on kb_items(idtype,kb_rub_id);
CREATE INDEX knowledge_base_idx on knowledge_base(idowner,typeowner);
CREATE INDEX kb_rub_idx on kb_rub(id);
CREATE INDEX kb_rub_idx2 on kb_rub(idparent,idkb);

CREATE TABLE websemantic_favoris
(
  id serial NOT NULL,
  "type" character varying,
  ressource character varying,
  iduser integer,
  data text,
  CONSTRAINT websemantic_favoris_pkey PRIMARY KEY (id)
);


CREATE INDEX index_websemfav
  ON websemantic_favoris
  USING btree
  (ressource, type);
  
  
CREATE TABLE websemantic_urimapping
(
  id serial NOT NULL,
  agent character varying,
  concept character varying,
  event character varying,
  "object" character varying,
  place character varying,
  "time" character varying,
  ressource integer,
  module character varying,
  CONSTRAINT websemantic_urimapping_pkey PRIMARY KEY (id)
);

CREATE TABLE websemantic_class
(
  classuri character varying NOT NULL,
  resource integer,
  propertieuri character varying,
  fieldcode character varying
);