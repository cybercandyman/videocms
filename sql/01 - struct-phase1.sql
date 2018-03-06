--
-- PostgreSQL database dump
--

-- Started on 2012-02-23 15:46:56

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1109 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 140 (class 1259 OID 60940)
-- Dependencies: 2447 6
-- Name: productions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE productions (
    idproduction integer NOT NULL,
    idorganization bigint NOT NULL,
    idgroup bigint NOT NULL,
    name character varying NOT NULL,
    pathdownload character varying NOT NULL,
    key text NOT NULL,
    pathstreaming_qt character varying,
    pathstreaming_rm character varying,
    pathstreaming_wm character varying,
    pathpictures character varying NOT NULL,
    pathcomponent character varying NOT NULL,
    textbandeau character varying NOT NULL,
    textwatermark text,
    textcopyright text,
    defaultwebcodec character varying,
    defaultidperiode character varying,
    dureegratuitemax integer,
    logocatalogue character varying,
    depositdirectory character varying,
    streamdirectory character varying,
    date_of_creation date,
    date_of_closure date,
    email character varying,
    menu smallint,
    streamercode integer,
    alias character varying,
    isdeleted integer DEFAULT 0 NOT NULL,
    idservice bigint,
    idprofil bigint,
    email2 character varying,
    mobilephone character varying,
    phonenumber2 character varying,
    organization character varying,
    organization_details character varying,
    title character varying,
    work character varying,
    notes character varying,
    picture character varying
);


ALTER TABLE public.productions OWNER TO postgres;

--
-- TOC entry 141 (class 1259 OID 60947)
-- Dependencies: 2449 2450 6
-- Name: publications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE publications (
    idpublication integer NOT NULL,
    idorganization bigint NOT NULL,
    key character varying NOT NULL,
    name character varying NOT NULL,
    alias character varying NOT NULL,
    pathcomponent character varying NOT NULL,
    state smallint,
    description text,
    url character varying,
    menu smallint,
    date_of_creation date,
    idproduction bigint DEFAULT 0,
    isdeleted integer DEFAULT 0,
    email character varying,
    idservice bigint,
    email2 character varying,
    mobilephone character varying,
    phonenumber2 character varying,
    organization character varying,
    organization_details character varying,
    title character varying,
    work character varying,
    notes character varying,
    picture character varying
);


ALTER TABLE public.publications OWNER TO postgres;

--
-- TOC entry 142 (class 1259 OID 60955)
-- Dependencies: 2452 2453 6
-- Name: ressources_access; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ressources_access (
    iduser bigint NOT NULL,
    idcomponent bigint DEFAULT 0 NOT NULL,
    level smallint,
    state integer,
    authorization_type integer DEFAULT 0,
    idacces integer NOT NULL,
    module character varying,
    ressource bigint
);


ALTER TABLE public.ressources_access OWNER TO postgres;

--
-- TOC entry 143 (class 1259 OID 60963)
-- Dependencies: 2455 6
-- Name: services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services (
    idservice integer NOT NULL,
    name character varying,
    isdeleted integer DEFAULT 0,
    menu integer,
    key character varying,
    email character varying,
    email2 character varying,
    mobilephone character varying,
    phonenumber2 character varying,
    organization character varying,
    organization_details character varying,
    title character varying,
    work character varying,
    notes character varying,
    picture character varying
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 144 (class 1259 OID 60970)
-- Dependencies: 6
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    iduser integer NOT NULL,
    idgroup bigint,
    name character varying,
    firstname character varying,
    email character varying,
    phonenumber character varying,
    faxnumber character varying,
    adress1 text,
    adress2 text,
    city text,
    postalcode character varying,
    ulogin character varying,
    upassword character varying,
    lastconnection timestamp without time zone,
    state smallint,
    userkey character varying,
    lang character varying,
    secretquestion character varying,
    secretresponse character varying,
    email2 character varying,
    mobilephone character varying,
    phonenumber2 character varying,
    organization character varying,
    organization_details character varying,
    title character varying,
    work character varying,
    notes text,
    picture character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 145 (class 1259 OID 60976)
-- Dependencies: 2249 6
-- Name: access; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW access AS
    SELECT ressources_access.iduser, ressources_access.idcomponent, ressources_access.level, ressources_access.state, ressources_access.authorization_type, ressources_access.idacces, ressources_access.module, ressources_access.ressource, users.state AS userstate, CASE ressources_access.module WHEN 'prod'::text THEN productions.key WHEN 'pub'::text THEN (publications.key)::text ELSE NULL::text END AS key, CASE ressources_access.module WHEN 'prod'::text THEN productions.isdeleted WHEN 'pub'::text THEN publications.isdeleted WHEN 'ser'::text THEN services.isdeleted ELSE NULL::integer END AS isdeleted FROM ((((ressources_access LEFT JOIN users ON ((ressources_access.iduser = users.iduser))) LEFT JOIN productions ON (((ressources_access.ressource = productions.idproduction) AND ((ressources_access.module)::text = 'prod'::text)))) LEFT JOIN publications ON (((ressources_access.ressource = publications.idpublication) AND ((ressources_access.module)::text = 'pub'::text)))) LEFT JOIN services ON (((ressources_access.ressource = services.idservice) AND ((ressources_access.module)::text = 'ser'::text))));


ALTER TABLE public.access OWNER TO postgres;

--
-- TOC entry 146 (class 1259 OID 60981)
-- Dependencies: 6
-- Name: kb_rub; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kb_rub (
    id integer NOT NULL,
    title character varying,
    idparent bigint,
    idkb bigint
);


ALTER TABLE public.kb_rub OWNER TO postgres;

--
-- TOC entry 147 (class 1259 OID 60987)
-- Dependencies: 6 146
-- Name: bc_rub_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bc_rub_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.bc_rub_id_seq OWNER TO postgres;

--
-- TOC entry 2749 (class 0 OID 0)
-- Dependencies: 147
-- Name: bc_rub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bc_rub_id_seq OWNED BY kb_rub.id;


--
-- TOC entry 148 (class 1259 OID 60989)
-- Dependencies: 2459 2460 2461 2462 6
-- Name: billings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE billings (
    idbilling integer NOT NULL,
    idrate character varying DEFAULT 1 NOT NULL,
    idproduction bigint NOT NULL,
    bytes_streamed bigint DEFAULT 0,
    bytes_stored bigint DEFAULT 0,
    libelle_discount character varying,
    amount_discount character varying,
    rate_discount character varying,
    libelle_rate_discount character varying,
    billing_status character varying DEFAULT 0,
    date character varying,
    frozen_total character varying
);


ALTER TABLE public.billings OWNER TO postgres;

--
-- TOC entry 149 (class 1259 OID 60999)
-- Dependencies: 148 6
-- Name: billings_idbilling_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billings_idbilling_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.billings_idbilling_seq OWNER TO postgres;

--
-- TOC entry 2750 (class 0 OID 0)
-- Dependencies: 149
-- Name: billings_idbilling_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billings_idbilling_seq OWNED BY billings.idbilling;


--
-- TOC entry 150 (class 1259 OID 61001)
-- Dependencies: 6
-- Name: billings_others; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE billings_others (
    idbillingother integer NOT NULL,
    idbilling bigint NOT NULL,
    libelle text,
    amount text,
    type character varying
);


ALTER TABLE public.billings_others OWNER TO postgres;

--
-- TOC entry 151 (class 1259 OID 61007)
-- Dependencies: 6 150
-- Name: billings_others_idbillingother_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billings_others_idbillingother_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.billings_others_idbillingother_seq OWNER TO postgres;

--
-- TOC entry 2751 (class 0 OID 0)
-- Dependencies: 151
-- Name: billings_others_idbillingother_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billings_others_idbillingother_seq OWNED BY billings_others.idbillingother;


--
-- TOC entry 152 (class 1259 OID 61009)
-- Dependencies: 2465 6
-- Name: chapters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE chapters (
    id integer NOT NULL,
    idprog integer,
    idplaylist integer DEFAULT 0,
    url character varying(128),
    tcin character varying(128),
    file character varying(128),
    picture character varying(128)
);


ALTER TABLE public.chapters OWNER TO postgres;

--
-- TOC entry 153 (class 1259 OID 61016)
-- Dependencies: 6 152
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.chapters_id_seq OWNER TO postgres;

--
-- TOC entry 2752 (class 0 OID 0)
-- Dependencies: 153
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE chapters_id_seq OWNED BY chapters.id;


--
-- TOC entry 154 (class 1259 OID 61018)
-- Dependencies: 2467 6
-- Name: chapters_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE chapters_translations (
    idchapter integer NOT NULL,
    id bigint,
    idfgroup bigint NOT NULL,
    value text,
    idview integer DEFAULT 0,
    textsearchable_index_col tsvector
);


ALTER TABLE public.chapters_translations OWNER TO postgres;

--
-- TOC entry 155 (class 1259 OID 61025)
-- Dependencies: 6
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE playlists (
    idplaylist integer NOT NULL,
    idpublication bigint NOT NULL,
    title character varying,
    description text,
    picture character varying,
    groupname character varying,
    key character varying,
    idview integer,
    state character varying
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- TOC entry 156 (class 1259 OID 61031)
-- Dependencies: 2469 2470 6
-- Name: programs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs (
    idprog integer NOT NULL,
    idprog_programs_extract integer,
    idproduction bigint NOT NULL,
    idextfilm character varying(128),
    keyprog character varying(128) NOT NULL,
    duration character varying(128),
    date date,
    tcin character varying(128),
    tcout character varying(128),
    state character varying,
    type_extract character varying,
    viewof integer,
    idpublication integer DEFAULT 0,
    idprog_programs_of integer DEFAULT 0
);


ALTER TABLE public.programs OWNER TO postgres;

--
-- TOC entry 157 (class 1259 OID 61039)
-- Dependencies: 2472 6
-- Name: programs_fields; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs_fields (
    idfield integer NOT NULL,
    title character varying(255),
    type character varying(128),
    table_ref character varying(128),
    parent character varying,
    mask character varying,
    default_value text,
    help text,
    is_editable integer DEFAULT 2,
    category character varying,
    indexable boolean,
    code character varying
);


ALTER TABLE public.programs_fields OWNER TO postgres;

--
-- TOC entry 158 (class 1259 OID 61046)
-- Dependencies: 2474 6
-- Name: programs_fields_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs_fields_group (
    idgroup integer NOT NULL,
    name text,
    category character varying,
    system_gcv boolean,
    is_editable boolean DEFAULT true
);


ALTER TABLE public.programs_fields_group OWNER TO postgres;

--
-- TOC entry 159 (class 1259 OID 61053)
-- Dependencies: 6
-- Name: programs_fields_group_fields; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs_fields_group_fields (
    idfield bigint NOT NULL,
    idgroup bigint NOT NULL,
    idfgroup integer NOT NULL,
    order_ext integer,
    cat character varying
);


ALTER TABLE public.programs_fields_group_fields OWNER TO postgres;

--
-- TOC entry 160 (class 1259 OID 61059)
-- Dependencies: 2250 6
-- Name: chaptersview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW chaptersview AS
    SELECT DISTINCT c.id, c.idprog, c.idplaylist, ct.idfgroup, ct.value, p.state, p.idproduction, p.idpublication, pf.idfield, pf.title, pf.type, pf.table_ref, pf.parent, pf.mask, pf.default_value, pf.help, pf.is_editable, pf.category, pf.indexable, pf.code, playlists.key AS playlistkey, p.keyprog, poff.keyprog AS fromkeyprog, ct.textsearchable_index_col FROM ((((((((chapters c LEFT JOIN programs p ON ((c.idprog = p.idprog))) LEFT JOIN productions prod ON ((p.idproduction = prod.idproduction))) LEFT JOIN chapters_translations ct ON ((c.id = ct.idchapter))) LEFT JOIN programs_fields_group_fields pfgf ON ((ct.idfgroup = pfgf.idfgroup))) LEFT JOIN programs_fields_group pfg ON ((pfgf.idgroup = pfg.idgroup))) LEFT JOIN programs_fields pf ON ((pf.idfield = pfgf.idfield))) LEFT JOIN playlists ON ((c.idplaylist = playlists.idplaylist))) LEFT JOIN programs poff ON ((p.idprog_programs_of = poff.idprog))) WHERE ((p.state)::text = 'ACTIVATED'::text);


ALTER TABLE public.chaptersview OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 61064)
-- Dependencies: 6
-- Name: components; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE components (
    idcomponent integer NOT NULL,
    name character varying,
    url text,
    moduletype character varying,
    controller character varying,
    action character varying,
    parameters character varying,
    route character varying
);


ALTER TABLE public.components OWNER TO postgres;

--
-- TOC entry 162 (class 1259 OID 61070)
-- Dependencies: 161 6
-- Name: components_idcomponent_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE components_idcomponent_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.components_idcomponent_seq OWNER TO postgres;

--
-- TOC entry 2753 (class 0 OID 0)
-- Dependencies: 162
-- Name: components_idcomponent_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE components_idcomponent_seq OWNED BY components.idcomponent;


--
-- TOC entry 163 (class 1259 OID 61072)
-- Dependencies: 6
-- Name: encoding_formats; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE encoding_formats (
    idformat integer NOT NULL,
    title character varying,
    command character varying,
    outputstring character varying,
    coder character varying,
    rate character varying,
    height character varying,
    width character varying
);


ALTER TABLE public.encoding_formats OWNER TO postgres;

--
-- TOC entry 164 (class 1259 OID 61078)
-- Dependencies: 163 6
-- Name: encoding_formats_idformat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE encoding_formats_idformat_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.encoding_formats_idformat_seq OWNER TO postgres;

--
-- TOC entry 2754 (class 0 OID 0)
-- Dependencies: 164
-- Name: encoding_formats_idformat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE encoding_formats_idformat_seq OWNED BY encoding_formats.idformat;


--
-- TOC entry 165 (class 1259 OID 61080)
-- Dependencies: 6
-- Name: encoding_profils; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE encoding_profils (
    idprofil integer NOT NULL,
    title character varying
);


ALTER TABLE public.encoding_profils OWNER TO postgres;

--
-- TOC entry 166 (class 1259 OID 61086)
-- Dependencies: 6
-- Name: encoding_profils_formats; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE encoding_profils_formats (
    idprofil integer,
    idformat integer
);


ALTER TABLE public.encoding_profils_formats OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 61089)
-- Dependencies: 165 6
-- Name: encoding_profils_idprofil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE encoding_profils_idprofil_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.encoding_profils_idprofil_seq OWNER TO postgres;

--
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 167
-- Name: encoding_profils_idprofil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE encoding_profils_idprofil_seq OWNED BY encoding_profils.idprofil;


--
-- TOC entry 265 (class 1259 OID 63434)
-- Dependencies: 6
-- Name: enum_action; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_action (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_action OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 63440)
-- Dependencies: 6 265
-- Name: enum_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_action_id_seq OWNER TO postgres;

--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 266
-- Name: enum_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_action_id_seq OWNED BY enum_action.id;


--
-- TOC entry 267 (class 1259 OID 63442)
-- Dependencies: 6
-- Name: enum_audience; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_audience (
    id integer NOT NULL,
    ref_text integer,
    parent integer,
    libelle character varying
);


ALTER TABLE public.enum_audience OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 63448)
-- Dependencies: 6 267
-- Name: enum_audience_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_audience_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_audience_id_seq OWNER TO postgres;

--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 268
-- Name: enum_audience_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_audience_id_seq OWNED BY enum_audience.id;


--
-- TOC entry 269 (class 1259 OID 63450)
-- Dependencies: 6
-- Name: enum_class; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_class (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_class OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 63458)
-- Dependencies: 6
-- Name: enum_class2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_class2 (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_class2 OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 63464)
-- Dependencies: 6 271
-- Name: enum_class2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_class2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_class2_id_seq OWNER TO postgres;

--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 272
-- Name: enum_class2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_class2_id_seq OWNED BY enum_class2.id;


--
-- TOC entry 270 (class 1259 OID 63456)
-- Dependencies: 269 6
-- Name: enum_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_class_id_seq OWNER TO postgres;

--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 270
-- Name: enum_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_class_id_seq OWNED BY enum_class.id;


--
-- TOC entry 273 (class 1259 OID 63466)
-- Dependencies: 6
-- Name: enum_countries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_countries (
    id integer NOT NULL,
    ref_text integer,
    parent integer,
    libelle character varying
);


ALTER TABLE public.enum_countries OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 63472)
-- Dependencies: 6 273
-- Name: enum_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_countries_id_seq OWNER TO postgres;

--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 274
-- Name: enum_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_countries_id_seq OWNED BY enum_countries.id;


--
-- TOC entry 275 (class 1259 OID 63474)
-- Dependencies: 6
-- Name: enum_domaine; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_domaine (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_domaine OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 63480)
-- Dependencies: 275 6
-- Name: enum_domaine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_domaine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_domaine_id_seq OWNER TO postgres;

--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 276
-- Name: enum_domaine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_domaine_id_seq OWNED BY enum_domaine.id;


--
-- TOC entry 277 (class 1259 OID 63482)
-- Dependencies: 6
-- Name: enum_format; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_format (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_format OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 63488)
-- Dependencies: 6 277
-- Name: enum_format_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_format_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_format_id_seq OWNER TO postgres;

--
-- TOC entry 2762 (class 0 OID 0)
-- Dependencies: 278
-- Name: enum_format_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_format_id_seq OWNED BY enum_format.id;


--
-- TOC entry 279 (class 1259 OID 63490)
-- Dependencies: 6
-- Name: enum_function; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_function (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_function OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 63496)
-- Dependencies: 6 279
-- Name: enum_function_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_function_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_function_id_seq OWNER TO postgres;

--
-- TOC entry 2763 (class 0 OID 0)
-- Dependencies: 280
-- Name: enum_function_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_function_id_seq OWNED BY enum_function.id;


--
-- TOC entry 281 (class 1259 OID 63498)
-- Dependencies: 6
-- Name: enum_genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_genre (
    id integer NOT NULL,
    ref_text integer,
    parent integer,
    libelle character varying
);


ALTER TABLE public.enum_genre OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 63504)
-- Dependencies: 6
-- Name: enum_genre_audiovisual; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_genre_audiovisual (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_genre_audiovisual OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 63510)
-- Dependencies: 6 282
-- Name: enum_genre_audiovisual_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_genre_audiovisual_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_genre_audiovisual_id_seq OWNER TO postgres;

--
-- TOC entry 2764 (class 0 OID 0)
-- Dependencies: 283
-- Name: enum_genre_audiovisual_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_genre_audiovisual_id_seq OWNED BY enum_genre_audiovisual.id;


--
-- TOC entry 284 (class 1259 OID 63512)
-- Dependencies: 281 6
-- Name: enum_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_genre_id_seq OWNER TO postgres;

--
-- TOC entry 2765 (class 0 OID 0)
-- Dependencies: 284
-- Name: enum_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_genre_id_seq OWNED BY enum_genre.id;


--
-- TOC entry 285 (class 1259 OID 63514)
-- Dependencies: 6
-- Name: enum_language; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_language (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_language OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 63520)
-- Dependencies: 6 285
-- Name: enum_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_language_id_seq OWNER TO postgres;

--
-- TOC entry 2766 (class 0 OID 0)
-- Dependencies: 286
-- Name: enum_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_language_id_seq OWNED BY enum_language.id;


--
-- TOC entry 287 (class 1259 OID 63522)
-- Dependencies: 6
-- Name: enum_lcid; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_lcid (
    lcid integer,
    ref_text integer,
    parent integer,
    libelle character varying
);


ALTER TABLE public.enum_lcid OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 63528)
-- Dependencies: 6
-- Name: enum_lieu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_lieu (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_lieu OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 63534)
-- Dependencies: 6
-- Name: enum_lieu2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_lieu2 (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_lieu2 OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 63540)
-- Dependencies: 6 289
-- Name: enum_lieu2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_lieu2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_lieu2_id_seq OWNER TO postgres;

--
-- TOC entry 2767 (class 0 OID 0)
-- Dependencies: 290
-- Name: enum_lieu2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_lieu2_id_seq OWNED BY enum_lieu2.id;


--
-- TOC entry 291 (class 1259 OID 63542)
-- Dependencies: 288 6
-- Name: enum_lieu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_lieu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_lieu_id_seq OWNER TO postgres;

--
-- TOC entry 2768 (class 0 OID 0)
-- Dependencies: 291
-- Name: enum_lieu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_lieu_id_seq OWNED BY enum_lieu.id;


--
-- TOC entry 292 (class 1259 OID 63544)
-- Dependencies: 6
-- Name: enum_media; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_media (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_media OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 63550)
-- Dependencies: 292 6
-- Name: enum_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_media_id_seq OWNER TO postgres;

--
-- TOC entry 2769 (class 0 OID 0)
-- Dependencies: 293
-- Name: enum_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_media_id_seq OWNED BY enum_media.id;


--
-- TOC entry 294 (class 1259 OID 63552)
-- Dependencies: 6
-- Name: enum_medium; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_medium (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_medium OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 63558)
-- Dependencies: 294 6
-- Name: enum_medium_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_medium_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_medium_id_seq OWNER TO postgres;

--
-- TOC entry 2770 (class 0 OID 0)
-- Dependencies: 295
-- Name: enum_medium_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_medium_id_seq OWNED BY enum_medium.id;


--
-- TOC entry 296 (class 1259 OID 63560)
-- Dependencies: 6
-- Name: enum_organization; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_organization (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_organization OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 63566)
-- Dependencies: 6
-- Name: enum_organization2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_organization2 (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_organization2 OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 63572)
-- Dependencies: 6 297
-- Name: enum_organization2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_organization2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_organization2_id_seq OWNER TO postgres;

--
-- TOC entry 2771 (class 0 OID 0)
-- Dependencies: 298
-- Name: enum_organization2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_organization2_id_seq OWNED BY enum_organization2.id;


--
-- TOC entry 299 (class 1259 OID 63574)
-- Dependencies: 296 6
-- Name: enum_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_organization_id_seq OWNER TO postgres;

--
-- TOC entry 2772 (class 0 OID 0)
-- Dependencies: 299
-- Name: enum_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_organization_id_seq OWNED BY enum_organization.id;


--
-- TOC entry 300 (class 1259 OID 63576)
-- Dependencies: 6
-- Name: enum_personne; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_personne (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_personne OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 63582)
-- Dependencies: 6
-- Name: enum_personne2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_personne2 (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_personne2 OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 63588)
-- Dependencies: 6 301
-- Name: enum_personne2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_personne2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_personne2_id_seq OWNER TO postgres;

--
-- TOC entry 2773 (class 0 OID 0)
-- Dependencies: 302
-- Name: enum_personne2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_personne2_id_seq OWNED BY enum_personne2.id;


--
-- TOC entry 303 (class 1259 OID 63590)
-- Dependencies: 300 6
-- Name: enum_personne_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_personne_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_personne_id_seq OWNER TO postgres;

--
-- TOC entry 2774 (class 0 OID 0)
-- Dependencies: 303
-- Name: enum_personne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_personne_id_seq OWNED BY enum_personne.id;


--
-- TOC entry 304 (class 1259 OID 63592)
-- Dependencies: 6
-- Name: enum_pointzoom; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_pointzoom (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_pointzoom OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 63598)
-- Dependencies: 304 6
-- Name: enum_pointzoom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_pointzoom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_pointzoom_id_seq OWNER TO postgres;

--
-- TOC entry 2775 (class 0 OID 0)
-- Dependencies: 305
-- Name: enum_pointzoom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_pointzoom_id_seq OWNED BY enum_pointzoom.id;


--
-- TOC entry 306 (class 1259 OID 63600)
-- Dependencies: 6
-- Name: enum_profession; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_profession (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_profession OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 63606)
-- Dependencies: 6 306
-- Name: enum_profession_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_profession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_profession_id_seq OWNER TO postgres;

--
-- TOC entry 2776 (class 0 OID 0)
-- Dependencies: 307
-- Name: enum_profession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_profession_id_seq OWNED BY enum_profession.id;


--
-- TOC entry 308 (class 1259 OID 63608)
-- Dependencies: 6
-- Name: enum_public; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_public (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_public OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 63614)
-- Dependencies: 6
-- Name: enum_public2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_public2 (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_public2 OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 63620)
-- Dependencies: 6 309
-- Name: enum_public2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_public2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_public2_id_seq OWNER TO postgres;

--
-- TOC entry 2777 (class 0 OID 0)
-- Dependencies: 310
-- Name: enum_public2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_public2_id_seq OWNED BY enum_public2.id;


--
-- TOC entry 311 (class 1259 OID 63622)
-- Dependencies: 6 308
-- Name: enum_public_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_public_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_public_id_seq OWNER TO postgres;

--
-- TOC entry 2778 (class 0 OID 0)
-- Dependencies: 311
-- Name: enum_public_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_public_id_seq OWNED BY enum_public.id;


--
-- TOC entry 312 (class 1259 OID 63624)
-- Dependencies: 6
-- Name: enum_scoring; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_scoring (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_scoring OWNER TO postgres;

--
-- TOC entry 313 (class 1259 OID 63630)
-- Dependencies: 6 312
-- Name: enum_scoring_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_scoring_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_scoring_id_seq OWNER TO postgres;

--
-- TOC entry 2779 (class 0 OID 0)
-- Dependencies: 313
-- Name: enum_scoring_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_scoring_id_seq OWNED BY enum_scoring.id;


--
-- TOC entry 314 (class 1259 OID 63632)
-- Dependencies: 6
-- Name: enum_sector; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_sector (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_sector OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 63638)
-- Dependencies: 314 6
-- Name: enum_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_sector_id_seq OWNER TO postgres;

--
-- TOC entry 2780 (class 0 OID 0)
-- Dependencies: 315
-- Name: enum_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_sector_id_seq OWNED BY enum_sector.id;


--
-- TOC entry 316 (class 1259 OID 63640)
-- Dependencies: 6
-- Name: enum_sublanguage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_sublanguage (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_sublanguage OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 63646)
-- Dependencies: 316 6
-- Name: enum_sublanguage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_sublanguage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_sublanguage_id_seq OWNER TO postgres;

--
-- TOC entry 2781 (class 0 OID 0)
-- Dependencies: 317
-- Name: enum_sublanguage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_sublanguage_id_seq OWNED BY enum_sublanguage.id;


--
-- TOC entry 318 (class 1259 OID 63648)
-- Dependencies: 6
-- Name: enum_theme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_theme (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_theme OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 63654)
-- Dependencies: 6
-- Name: enum_theme2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_theme2 (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_theme2 OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 63660)
-- Dependencies: 6 319
-- Name: enum_theme2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_theme2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_theme2_id_seq OWNER TO postgres;

--
-- TOC entry 2782 (class 0 OID 0)
-- Dependencies: 320
-- Name: enum_theme2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_theme2_id_seq OWNED BY enum_theme2.id;


--
-- TOC entry 321 (class 1259 OID 63662)
-- Dependencies: 6 318
-- Name: enum_theme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_theme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_theme_id_seq OWNER TO postgres;

--
-- TOC entry 2783 (class 0 OID 0)
-- Dependencies: 321
-- Name: enum_theme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_theme_id_seq OWNED BY enum_theme.id;


--
-- TOC entry 322 (class 1259 OID 63664)
-- Dependencies: 6
-- Name: enum_type1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_type1 (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_type1 OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 63670)
-- Dependencies: 6 322
-- Name: enum_type1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_type1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_type1_id_seq OWNER TO postgres;

--
-- TOC entry 2784 (class 0 OID 0)
-- Dependencies: 323
-- Name: enum_type1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_type1_id_seq OWNED BY enum_type1.id;


--
-- TOC entry 324 (class 1259 OID 63672)
-- Dependencies: 6
-- Name: enum_type2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enum_type2 (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.enum_type2 OWNER TO postgres;

--
-- TOC entry 325 (class 1259 OID 63678)
-- Dependencies: 6 324
-- Name: enum_type2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enum_type2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.enum_type2_id_seq OWNER TO postgres;

--
-- TOC entry 2785 (class 0 OID 0)
-- Dependencies: 325
-- Name: enum_type2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enum_type2_id_seq OWNED BY enum_type2.id;


--
-- TOC entry 168 (class 1259 OID 61273)
-- Dependencies: 6
-- Name: extra_components_panel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE extra_components_panel (
    idcomp integer NOT NULL,
    title character varying,
    install_date character varying,
    type character varying,
    classname character varying,
    version character varying,
    manifest text,
    path character varying
);


ALTER TABLE public.extra_components_panel OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 61279)
-- Dependencies: 6 168
-- Name: extra_components_panel_idcomp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE extra_components_panel_idcomp_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.extra_components_panel_idcomp_seq OWNER TO postgres;

--
-- TOC entry 2786 (class 0 OID 0)
-- Dependencies: 169
-- Name: extra_components_panel_idcomp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE extra_components_panel_idcomp_seq OWNED BY extra_components_panel.idcomp;


--
-- TOC entry 170 (class 1259 OID 61281)
-- Dependencies: 157 6
-- Name: fields_idfield_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fields_idfield_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.fields_idfield_seq OWNER TO postgres;

--
-- TOC entry 2787 (class 0 OID 0)
-- Dependencies: 170
-- Name: fields_idfield_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fields_idfield_seq OWNED BY programs_fields.idfield;


--
-- TOC entry 171 (class 1259 OID 61283)
-- Dependencies: 6
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    idgroup integer NOT NULL,
    idproduction bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    type character varying,
    code character varying
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 61289)
-- Dependencies: 6 171
-- Name: groups_idgroup_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_idgroup_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.groups_idgroup_seq OWNER TO postgres;

--
-- TOC entry 2788 (class 0 OID 0)
-- Dependencies: 172
-- Name: groups_idgroup_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_idgroup_seq OWNED BY groups.idgroup;


--
-- TOC entry 173 (class 1259 OID 61291)
-- Dependencies: 6
-- Name: groups_programs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups_programs (
    idgroup bigint NOT NULL,
    idprog integer NOT NULL,
    listorder bigint
);


ALTER TABLE public.groups_programs OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 61294)
-- Dependencies: 6
-- Name: kb_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kb_items (
    id integer NOT NULL,
    title character varying,
    kb_rub_id bigint,
    idtype integer
);


ALTER TABLE public.kb_items OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 61300)
-- Dependencies: 6 174
-- Name: kb_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kb_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.kb_items_id_seq OWNER TO postgres;

--
-- TOC entry 2789 (class 0 OID 0)
-- Dependencies: 175
-- Name: kb_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kb_items_id_seq OWNED BY kb_items.id;


--
-- TOC entry 176 (class 1259 OID 61302)
-- Dependencies: 6
-- Name: kb_items_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kb_items_translations (
    iditem integer NOT NULL,
    id bigint,
    idfgroup bigint NOT NULL,
    value text,
    textsearchable_index_col tsvector
);


ALTER TABLE public.kb_items_translations OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 61308)
-- Dependencies: 2484 6
-- Name: kb_items_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kb_items_type (
    idtype integer NOT NULL,
    title character varying,
    idgroup integer,
    visible integer DEFAULT 1
);


ALTER TABLE public.kb_items_type OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 61314)
-- Dependencies: 2251 6
-- Name: kb_items_type_group; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW kb_items_type_group AS
    SELECT kb_items_type.idtype, kb_items_type.title, kb_items_type.idgroup, programs_fields_group.name, programs_fields_group.category, programs_fields_group.system_gcv, programs_fields_group.is_editable, kb_items_type.visible FROM kb_items_type, programs_fields_group WHERE (kb_items_type.idgroup = programs_fields_group.idgroup) ORDER BY kb_items_type.title;


ALTER TABLE public.kb_items_type_group OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 61318)
-- Dependencies: 6 177
-- Name: kb_items_type_idtype_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kb_items_type_idtype_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.kb_items_type_idtype_seq OWNER TO postgres;

--
-- TOC entry 2790 (class 0 OID 0)
-- Dependencies: 179
-- Name: kb_items_type_idtype_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kb_items_type_idtype_seq OWNED BY kb_items_type.idtype;


--
-- TOC entry 180 (class 1259 OID 61320)
-- Dependencies: 6
-- Name: knowledge_base; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE knowledge_base (
    idkb integer NOT NULL,
    title character varying,
    idowner bigint,
    typeowner character varying
);


ALTER TABLE public.knowledge_base OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 61326)
-- Dependencies: 6 180
-- Name: knowledge_base_idkb_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE knowledge_base_idkb_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.knowledge_base_idkb_seq OWNER TO postgres;

--
-- TOC entry 2791 (class 0 OID 0)
-- Dependencies: 181
-- Name: knowledge_base_idkb_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE knowledge_base_idkb_seq OWNED BY knowledge_base.idkb;


--
-- TOC entry 182 (class 1259 OID 61328)
-- Dependencies: 6
-- Name: locales; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE locales (
    idlocale integer NOT NULL,
    code character varying,
    libelle character varying
);


ALTER TABLE public.locales OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 61334)
-- Dependencies: 182 6
-- Name: locales_idlocale_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE locales_idlocale_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.locales_idlocale_seq OWNER TO postgres;

--
-- TOC entry 2792 (class 0 OID 0)
-- Dependencies: 183
-- Name: locales_idlocale_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE locales_idlocale_seq OWNED BY locales.idlocale;


--
-- TOC entry 184 (class 1259 OID 61336)
-- Dependencies: 2487 2488 2489 2490 6
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE logs (
    idlog integer NOT NULL,
    statutimport smallint DEFAULT (0)::smallint NOT NULL,
    idproduction smallint,
    idpublication smallint,
    idvisionnage bigint,
    iduser bigint,
    idversion bigint,
    cip text,
    date date,
    "time" time without time zone DEFAULT '00:00:00'::time without time zone NOT NULL,
    cdns text,
    csuristem text,
    cstarttime timestamp(6) without time zone,
    xduration bigint DEFAULT 0,
    crate bigint,
    cstatus bigint DEFAULT (0)::smallint,
    cplayerid text,
    cplayerversion text,
    cplayerlanguage text,
    csuseragent text,
    csreferer text,
    chostexe text,
    chostexever text,
    cos text,
    cosversion text,
    ccpu text,
    filelength bigint,
    filesize bigint,
    avgbandwidth bigint,
    protocol text,
    transport text,
    audiocodec text,
    videocodec text,
    channelurl text,
    scbytes bigint,
    cbytes bigint,
    spktssent bigint,
    cpktsreceived bigint,
    cpktslostclient bigint,
    cpktslostnet bigint,
    cpktslostcontnet integer,
    cresendreqs bigint,
    cpktsrecoveredecc bigint,
    cpktsrecoveredresent bigint,
    cbuffercount bigint,
    ctotalbuffertime bigint,
    cquality bigint,
    sip character varying(255),
    sdns character varying(255),
    stotalclients character varying(255),
    scpuutil text,
    csusername text,
    ssessionid text,
    scontentpath text,
    csmedianame text,
    cmaxbandwidth text,
    csmediarole text,
    sproxied text,
    csurl text,
    idprog bigint
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 61346)
-- Dependencies: 184 6
-- Name: logs_idlog_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logs_idlog_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.logs_idlog_seq OWNER TO postgres;

--
-- TOC entry 2793 (class 0 OID 0)
-- Dependencies: 185
-- Name: logs_idlog_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logs_idlog_seq OWNED BY logs.idlog;


--
-- TOC entry 186 (class 1259 OID 61348)
-- Dependencies: 6
-- Name: masters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE masters (
    idmaster integer NOT NULL,
    title character varying,
    duration character varying,
    format character varying,
    encoding character varying,
    comments text,
    languages character varying
);


ALTER TABLE public.masters OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 61354)
-- Dependencies: 6 186
-- Name: masters_idmaster_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE masters_idmaster_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.masters_idmaster_seq OWNER TO postgres;

--
-- TOC entry 2794 (class 0 OID 0)
-- Dependencies: 187
-- Name: masters_idmaster_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE masters_idmaster_seq OWNED BY masters.idmaster;


--
-- TOC entry 188 (class 1259 OID 61356)
-- Dependencies: 6
-- Name: menus_elements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menus_elements (
    idcomponent bigint NOT NULL,
    title character varying(128),
    idmenu integer NOT NULL,
    url character varying
);


ALTER TABLE public.menus_elements OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 61362)
-- Dependencies: 6 188
-- Name: menus_elements_idmenu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menus_elements_idmenu_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.menus_elements_idmenu_seq OWNER TO postgres;

--
-- TOC entry 2795 (class 0 OID 0)
-- Dependencies: 189
-- Name: menus_elements_idmenu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menus_elements_idmenu_seq OWNED BY menus_elements.idmenu;


--
-- TOC entry 190 (class 1259 OID 61364)
-- Dependencies: 6
-- Name: organizations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE organizations (
    idorganization integer NOT NULL,
    society character varying(255),
    adress1 text,
    adress2 text,
    postalcode character varying(128),
    city character varying(255),
    country integer,
    phonenumber character varying(128),
    faxnumber character varying(128),
    email text,
    alias character varying,
    picture character varying,
    siret character varying,
    tvaintra character varying,
    email2 character varying,
    phonenumber2 character varying,
    domaine character varying,
    notes text
);


ALTER TABLE public.organizations OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 61370)
-- Dependencies: 6
-- Name: organizations_contacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE organizations_contacts (
    idcontact integer NOT NULL,
    idorganization bigint NOT NULL,
    name character varying(255),
    firstname character varying(255),
    adress1 text,
    adress2 text,
    postalcode character varying(128),
    city text,
    country integer,
    phonenumber character varying(128),
    faxnumber character varying(128),
    email character varying(255)
);


ALTER TABLE public.organizations_contacts OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 61376)
-- Dependencies: 6 191
-- Name: organizations_contacts_idcontact_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE organizations_contacts_idcontact_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.organizations_contacts_idcontact_seq OWNER TO postgres;

--
-- TOC entry 2796 (class 0 OID 0)
-- Dependencies: 192
-- Name: organizations_contacts_idcontact_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE organizations_contacts_idcontact_seq OWNED BY organizations_contacts.idcontact;


--
-- TOC entry 193 (class 1259 OID 61378)
-- Dependencies: 6 190
-- Name: organizations_idorganization_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE organizations_idorganization_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.organizations_idorganization_seq OWNER TO postgres;

--
-- TOC entry 2797 (class 0 OID 0)
-- Dependencies: 193
-- Name: organizations_idorganization_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE organizations_idorganization_seq OWNED BY organizations.idorganization;


--
-- TOC entry 194 (class 1259 OID 61380)
-- Dependencies: 6
-- Name: p_field_category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE p_field_category (
    value character varying(255),
    id integer NOT NULL
);


ALTER TABLE public.p_field_category OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 61383)
-- Dependencies: 6 194
-- Name: p_field_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE p_field_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.p_field_category_id_seq OWNER TO postgres;

--
-- TOC entry 2798 (class 0 OID 0)
-- Dependencies: 195
-- Name: p_field_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE p_field_category_id_seq OWNED BY p_field_category.id;


--
-- TOC entry 196 (class 1259 OID 61385)
-- Dependencies: 6 155
-- Name: playlists_idplaylist_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE playlists_idplaylist_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.playlists_idplaylist_seq OWNER TO postgres;

--
-- TOC entry 2799 (class 0 OID 0)
-- Dependencies: 196
-- Name: playlists_idplaylist_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE playlists_idplaylist_seq OWNED BY playlists.idplaylist;


--
-- TOC entry 197 (class 1259 OID 61387)
-- Dependencies: 6
-- Name: playlists_programs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE playlists_programs (
    idplaylist integer NOT NULL,
    idprog integer NOT NULL,
    listorder integer NOT NULL
);


ALTER TABLE public.playlists_programs OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 61390)
-- Dependencies: 6
-- Name: productions_fields_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE productions_fields_group (
    idproduction integer NOT NULL,
    idgroup integer NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.productions_fields_group OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 61393)
-- Dependencies: 6 140
-- Name: productions_idproduction_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE productions_idproduction_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.productions_idproduction_seq OWNER TO postgres;

--
-- TOC entry 2800 (class 0 OID 0)
-- Dependencies: 199
-- Name: productions_idproduction_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE productions_idproduction_seq OWNED BY productions.idproduction;


--
-- TOC entry 200 (class 1259 OID 61395)
-- Dependencies: 2497 2498 6
-- Name: productions_menus_elements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE productions_menus_elements (
    idproduction bigint NOT NULL,
    idmenu bigint NOT NULL,
    menu_order integer,
    idparent integer DEFAULT 0,
    iduser bigint DEFAULT 0
);


ALTER TABLE public.productions_menus_elements OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 61399)
-- Dependencies: 6
-- Name: productions_publications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE productions_publications (
    idproduction bigint NOT NULL,
    idpublication bigint NOT NULL
);


ALTER TABLE public.productions_publications OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 61402)
-- Dependencies: 6
-- Name: productions_rate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE productions_rate (
    idrate character(32) NOT NULL,
    idproduction bigint NOT NULL,
    idperiode character(32) NOT NULL,
    starttime character(32),
    endtime character(32),
    status character(32)
);


ALTER TABLE public.productions_rate OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 62007)
-- Dependencies: 6
-- Name: programs_credits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs_credits (
    idcredit integer NOT NULL,
    value character varying,
    idfunction integer,
    idprog bigint
);


ALTER TABLE public.programs_credits OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 62005)
-- Dependencies: 264 6
-- Name: programs_credits_idcredit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE programs_credits_idcredit_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.programs_credits_idcredit_seq OWNER TO postgres;

--
-- TOC entry 2801 (class 0 OID 0)
-- Dependencies: 263
-- Name: programs_credits_idcredit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE programs_credits_idcredit_seq OWNED BY programs_credits.idcredit;


--
-- TOC entry 203 (class 1259 OID 61405)
-- Dependencies: 6
-- Name: programs_extracts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs_extracts (
    idprog bigint,
    ord integer,
    groupname character varying,
    idprog_programs_extract bigint
);


ALTER TABLE public.programs_extracts OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 61411)
-- Dependencies: 6 159
-- Name: programs_fields_group_fields_idfgroup_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE programs_fields_group_fields_idfgroup_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.programs_fields_group_fields_idfgroup_seq OWNER TO postgres;

--
-- TOC entry 2802 (class 0 OID 0)
-- Dependencies: 204
-- Name: programs_fields_group_fields_idfgroup_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE programs_fields_group_fields_idfgroup_seq OWNED BY programs_fields_group_fields.idfgroup;


--
-- TOC entry 205 (class 1259 OID 61413)
-- Dependencies: 6 158
-- Name: programs_fields_group_idgroup_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE programs_fields_group_idgroup_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.programs_fields_group_idgroup_seq OWNER TO postgres;

--
-- TOC entry 2803 (class 0 OID 0)
-- Dependencies: 205
-- Name: programs_fields_group_idgroup_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE programs_fields_group_idgroup_seq OWNED BY programs_fields_group.idgroup;


--
-- TOC entry 206 (class 1259 OID 61415)
-- Dependencies: 6 156
-- Name: programs_idprog_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE programs_idprog_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.programs_idprog_seq OWNER TO postgres;

--
-- TOC entry 2804 (class 0 OID 0)
-- Dependencies: 206
-- Name: programs_idprog_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE programs_idprog_seq OWNED BY programs.idprog;


--
-- TOC entry 207 (class 1259 OID 61417)
-- Dependencies: 6
-- Name: programs_pictures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs_pictures (
    idpicture integer NOT NULL,
    uri character varying,
    idprog bigint,
    usage character varying
);


ALTER TABLE public.programs_pictures OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 61423)
-- Dependencies: 6 207
-- Name: programs_pictures_idpicture_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE programs_pictures_idpicture_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.programs_pictures_idpicture_seq OWNER TO postgres;

--
-- TOC entry 2805 (class 0 OID 0)
-- Dependencies: 208
-- Name: programs_pictures_idpicture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE programs_pictures_idpicture_seq OWNED BY programs_pictures.idpicture;


--
-- TOC entry 209 (class 1259 OID 61425)
-- Dependencies: 6
-- Name: programs_publications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs_publications (
    idprog integer NOT NULL,
    idpublication bigint NOT NULL,
    starttime date,
    endtime date,
    state character varying,
    progshot text,
    notification character varying
);


ALTER TABLE public.programs_publications OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 61431)
-- Dependencies: 2252 6
-- Name: programs_publications_state; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW programs_publications_state AS
    SELECT pp.idprog, pp.idpublication, pp.starttime, pp.endtime, pp.state, p.state AS programstate, pp.progshot, pp.notification FROM (programs_publications pp LEFT JOIN programs p ON ((pp.idprog = p.idprog)));


ALTER TABLE public.programs_publications_state OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 61435)
-- Dependencies: 2500 6
-- Name: programs_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs_translations (
    idprog integer NOT NULL,
    id bigint,
    idfgroup bigint NOT NULL,
    value text,
    idview integer DEFAULT 0 NOT NULL,
    textsearchable_index_col tsvector
);


ALTER TABLE public.programs_translations OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 61442)
-- Dependencies: 6
-- Name: programs_versions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE programs_versions (
    idprog integer NOT NULL,
    idversion bigint NOT NULL
);


ALTER TABLE public.programs_versions OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 61445)
-- Dependencies: 2253 6
-- Name: programsview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW programsview AS
    SELECT DISTINCT p.idprog, p.idprog_programs_extract, p.idproduction, p.idextfilm, p.keyprog, p.duration, p.date, p.tcin, p.tcout, p.state, p.type_extract, p.viewof, p.idpublication, p.idprog_programs_of, pf.idfield, pf.title, pf.type, pf.table_ref, pf.parent, pf.mask, pf.default_value, pf.help, pf.is_editable, pf.category, pf.indexable, pf.code, pt.value, pt.idview, p2.state AS programstate, pt.textsearchable_index_col, prod.alias FROM ((((((programs p LEFT JOIN productions prod ON ((p.idproduction = prod.idproduction))) LEFT JOIN programs_fields_group pfg ON ((prod.idgroup = pfg.idgroup))) LEFT JOIN programs_fields_group_fields pfgf ON ((pfg.idgroup = pfgf.idgroup))) LEFT JOIN programs_fields pf ON ((pfgf.idfield = pf.idfield))) LEFT JOIN programs_translations pt ON (((pt.idfgroup = pfgf.idfgroup) AND (pt.idprog = p.idprog)))) LEFT JOIN programs p2 ON ((p.idprog_programs_of = p2.idprog))) WHERE (((p.state)::text = 'ACTIVATED'::text) AND (prod.isdeleted = 0)) ORDER BY p.idprog;


ALTER TABLE public.programsview OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 61450)
-- Dependencies: 6
-- Name: publications_identifications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE publications_identifications (
    pubkey character varying,
    key character varying,
    type character varying,
    mode character varying
);


ALTER TABLE public.publications_identifications OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 61456)
-- Dependencies: 141 6
-- Name: publications_idpublication_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE publications_idpublication_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.publications_idpublication_seq OWNER TO postgres;

--
-- TOC entry 2806 (class 0 OID 0)
-- Dependencies: 215
-- Name: publications_idpublication_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE publications_idpublication_seq OWNED BY publications.idpublication;


--
-- TOC entry 216 (class 1259 OID 61458)
-- Dependencies: 2501 2502 6
-- Name: publications_menus_elements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE publications_menus_elements (
    idpublication bigint NOT NULL,
    idmenu bigint NOT NULL,
    menu_order integer,
    idparent integer DEFAULT 0,
    iduser bigint DEFAULT 0
);


ALTER TABLE public.publications_menus_elements OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 61462)
-- Dependencies: 2503 6
-- Name: publications_views; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE publications_views (
    idview integer NOT NULL,
    idpublication bigint NOT NULL,
    viewname character varying,
    viewcode character varying,
    locale character varying,
    editable integer DEFAULT 1
);


ALTER TABLE public.publications_views OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 61469)
-- Dependencies: 6
-- Name: rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rates (
    idrate character varying NOT NULL,
    vatrate character varying,
    currency character varying,
    gb_stored character varying,
    gb_streamed character varying
);


ALTER TABLE public.rates OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 61475)
-- Dependencies: 142 6
-- Name: ressources_access_idaccess_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ressources_access_idaccess_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ressources_access_idaccess_seq OWNER TO postgres;

--
-- TOC entry 2807 (class 0 OID 0)
-- Dependencies: 219
-- Name: ressources_access_idaccess_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ressources_access_idaccess_seq OWNED BY ressources_access.idacces;


--
-- TOC entry 220 (class 1259 OID 61477)
-- Dependencies: 143 6
-- Name: services_idservice_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_idservice_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_idservice_seq OWNER TO postgres;

--
-- TOC entry 2808 (class 0 OID 0)
-- Dependencies: 220
-- Name: services_idservice_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_idservice_seq OWNED BY services.idservice;


--
-- TOC entry 221 (class 1259 OID 61479)
-- Dependencies: 2505 2506 6
-- Name: services_menus_elements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_menus_elements (
    idservice bigint NOT NULL,
    idmenu bigint NOT NULL,
    menu_order integer,
    idparent integer DEFAULT 0,
    iduser bigint DEFAULT 0
);


ALTER TABLE public.services_menus_elements OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 61483)
-- Dependencies: 6
-- Name: services_orders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_orders (
    idorder integer NOT NULL,
    idprog bigint NOT NULL,
    keyprog character varying,
    idressource bigint,
    date_of_creation date,
    desireddate date,
    source_file character varying,
    status character varying,
    abort_demand boolean,
    delivery_date date,
    enclosed boolean,
    account character varying,
    idservice bigint
);


ALTER TABLE public.services_orders OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 61489)
-- Dependencies: 6
-- Name: services_orders_chapitrage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_orders_chapitrage (
    idchapitrage integer NOT NULL,
    idorderline bigint,
    chapitrage_file character varying,
    comments character varying,
    capture_miniature boolean,
    status character varying
);


ALTER TABLE public.services_orders_chapitrage OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 61495)
-- Dependencies: 6 223
-- Name: services_orders_chapitrage_idchapitrage_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_orders_chapitrage_idchapitrage_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_orders_chapitrage_idchapitrage_seq OWNER TO postgres;

--
-- TOC entry 2809 (class 0 OID 0)
-- Dependencies: 224
-- Name: services_orders_chapitrage_idchapitrage_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_orders_chapitrage_idchapitrage_seq OWNED BY services_orders_chapitrage.idchapitrage;


--
-- TOC entry 225 (class 1259 OID 61497)
-- Dependencies: 6
-- Name: services_orders_encoding; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_orders_encoding (
    idencoding bigint NOT NULL,
    idorderline bigint,
    status character varying,
    comments character varying
);


ALTER TABLE public.services_orders_encoding OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 61503)
-- Dependencies: 6 225
-- Name: services_orders_encoding_idencoding_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_orders_encoding_idencoding_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_orders_encoding_idencoding_seq OWNER TO postgres;

--
-- TOC entry 2810 (class 0 OID 0)
-- Dependencies: 226
-- Name: services_orders_encoding_idencoding_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_orders_encoding_idencoding_seq OWNED BY services_orders_encoding.idencoding;


--
-- TOC entry 227 (class 1259 OID 61505)
-- Dependencies: 222 6
-- Name: services_orders_idorder_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_orders_idorder_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_orders_idorder_seq OWNER TO postgres;

--
-- TOC entry 2811 (class 0 OID 0)
-- Dependencies: 227
-- Name: services_orders_idorder_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_orders_idorder_seq OWNED BY services_orders.idorder;


--
-- TOC entry 228 (class 1259 OID 61507)
-- Dependencies: 6
-- Name: services_orders_lines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_orders_lines (
    idorderline integer NOT NULL,
    idorder bigint,
    idtype bigint
);


ALTER TABLE public.services_orders_lines OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 61510)
-- Dependencies: 228 6
-- Name: services_orders_lines_idorderline_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_orders_lines_idorderline_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_orders_lines_idorderline_seq OWNER TO postgres;

--
-- TOC entry 2812 (class 0 OID 0)
-- Dependencies: 229
-- Name: services_orders_lines_idorderline_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_orders_lines_idorderline_seq OWNED BY services_orders_lines.idorderline;


--
-- TOC entry 230 (class 1259 OID 61512)
-- Dependencies: 6
-- Name: services_orders_subtitling; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_orders_subtitling (
    idsubtitling integer NOT NULL,
    idorderline bigint,
    font character varying,
    font_size integer,
    font_color character varying,
    language character varying,
    status character varying,
    justification character varying,
    comments character varying
);


ALTER TABLE public.services_orders_subtitling OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 61518)
-- Dependencies: 6 230
-- Name: services_orders_subtitling_idsubtitling_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_orders_subtitling_idsubtitling_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_orders_subtitling_idsubtitling_seq OWNER TO postgres;

--
-- TOC entry 2813 (class 0 OID 0)
-- Dependencies: 231
-- Name: services_orders_subtitling_idsubtitling_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_orders_subtitling_idsubtitling_seq OWNED BY services_orders_subtitling.idsubtitling;


--
-- TOC entry 232 (class 1259 OID 61520)
-- Dependencies: 6
-- Name: services_orders_translation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_orders_translation (
    idtranslation integer NOT NULL,
    idorderline bigint,
    language character varying,
    status character varying,
    comments character varying
);


ALTER TABLE public.services_orders_translation OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 61526)
-- Dependencies: 6 232
-- Name: services_orders_translation_idtranslation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_orders_translation_idtranslation_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_orders_translation_idtranslation_seq OWNER TO postgres;

--
-- TOC entry 2814 (class 0 OID 0)
-- Dependencies: 233
-- Name: services_orders_translation_idtranslation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_orders_translation_idtranslation_seq OWNED BY services_orders_translation.idtranslation;


--
-- TOC entry 234 (class 1259 OID 61528)
-- Dependencies: 6
-- Name: services_orders_watermarking; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_orders_watermarking (
    idwatermarking integer NOT NULL,
    idorderline bigint,
    text character varying,
    font character varying,
    font_size integer,
    font_color character varying,
    image_file character varying,
    orientation integer,
    "position" character varying,
    mosaic boolean,
    opacity integer,
    comments character varying,
    status character varying
);


ALTER TABLE public.services_orders_watermarking OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 61534)
-- Dependencies: 234 6
-- Name: services_orders_watermarking_idwatermarking_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_orders_watermarking_idwatermarking_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_orders_watermarking_idwatermarking_seq OWNER TO postgres;

--
-- TOC entry 2815 (class 0 OID 0)
-- Dependencies: 235
-- Name: services_orders_watermarking_idwatermarking_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_orders_watermarking_idwatermarking_seq OWNED BY services_orders_watermarking.idwatermarking;


--
-- TOC entry 236 (class 1259 OID 61536)
-- Dependencies: 6
-- Name: services_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_types (
    idtype integer NOT NULL,
    title character varying,
    description text
);


ALTER TABLE public.services_types OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 61542)
-- Dependencies: 6 236
-- Name: services_types_idtype_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_types_idtype_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.services_types_idtype_seq OWNER TO postgres;

--
-- TOC entry 2816 (class 0 OID 0)
-- Dependencies: 237
-- Name: services_types_idtype_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_types_idtype_seq OWNED BY services_types.idtype;


--
-- TOC entry 238 (class 1259 OID 61544)
-- Dependencies: 6
-- Name: services_types_selected; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services_types_selected (
    idservice bigint,
    idtype bigint
);


ALTER TABLE public.services_types_selected OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 61547)
-- Dependencies: 6
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tasks (
    idtask integer NOT NULL,
    type character varying,
    querytime character varying,
    starttime character varying,
    endtime character varying,
    command character varying,
    comments character varying,
    state character varying
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 61553)
-- Dependencies: 6 239
-- Name: tasks_idtask_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasks_idtask_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tasks_idtask_seq OWNER TO postgres;

--
-- TOC entry 2817 (class 0 OID 0)
-- Dependencies: 240
-- Name: tasks_idtask_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasks_idtask_seq OWNED BY tasks.idtask;


--
-- TOC entry 241 (class 1259 OID 61555)
-- Dependencies: 2516 2517 2518 6
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE themes (
    id integer NOT NULL,
    folder character varying,
    ressource_type character varying,
    idpublication integer,
    idview integer DEFAULT 0,
    ressource2 bigint DEFAULT 0,
    ressource character varying DEFAULT 0
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 61564)
-- Dependencies: 6 241
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.themes_id_seq OWNER TO postgres;

--
-- TOC entry 2818 (class 0 OID 0)
-- Dependencies: 242
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE themes_id_seq OWNED BY themes.id;


--
-- TOC entry 243 (class 1259 OID 61566)
-- Dependencies: 6
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tokens (
    idtoken integer NOT NULL,
    token text,
    key character varying,
    "time" bigint
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 61572)
-- Dependencies: 6 243
-- Name: tokens_idtoken_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tokens_idtoken_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tokens_idtoken_seq OWNER TO postgres;

--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 244
-- Name: tokens_idtoken_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tokens_idtoken_seq OWNED BY tokens.idtoken;


--
-- TOC entry 245 (class 1259 OID 61574)
-- Dependencies: 6
-- Name: translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE translations (
    id integer NOT NULL,
    value text,
    column_title character varying(128),
    lang character varying(128),
    table_name character varying(128),
    ref_num integer,
    ref_alpha character varying
);


ALTER TABLE public.translations OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 61580)
-- Dependencies: 245 6
-- Name: traduction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE traduction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.traduction_id_seq OWNER TO postgres;

--
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 246
-- Name: traduction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE traduction_id_seq OWNED BY translations.id;


--
-- TOC entry 247 (class 1259 OID 61582)
-- Dependencies: 6
-- Name: users_environment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_environment (
    iduser bigint NOT NULL,
    dataname character varying NOT NULL,
    datavalue text
);


ALTER TABLE public.users_environment OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 61588)
-- Dependencies: 6
-- Name: users_fields; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_fields (
    idfield integer NOT NULL,
    title character varying(128),
    type character varying(128),
    table_ref character varying(128)
);


ALTER TABLE public.users_fields OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 61591)
-- Dependencies: 6
-- Name: users_fields_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_fields_group (
    idgroup integer NOT NULL,
    name text
);


ALTER TABLE public.users_fields_group OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 61597)
-- Dependencies: 6
-- Name: users_fields_group_fields; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_fields_group_fields (
    idfield bigint NOT NULL,
    idgroup bigint NOT NULL
);


ALTER TABLE public.users_fields_group_fields OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 61600)
-- Dependencies: 6 249
-- Name: users_fields_group_idgroup_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_fields_group_idgroup_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_fields_group_idgroup_seq OWNER TO postgres;

--
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 251
-- Name: users_fields_group_idgroup_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_fields_group_idgroup_seq OWNED BY users_fields_group.idgroup;


--
-- TOC entry 252 (class 1259 OID 61602)
-- Dependencies: 6 248
-- Name: users_fields_idfield_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_fields_idfield_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_fields_idfield_seq OWNER TO postgres;

--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 252
-- Name: users_fields_idfield_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_fields_idfield_seq OWNED BY users_fields.idfield;


--
-- TOC entry 253 (class 1259 OID 61604)
-- Dependencies: 6
-- Name: users_fields_value; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_fields_value (
    idfield bigint NOT NULL,
    iduser bigint NOT NULL,
    value text
);


ALTER TABLE public.users_fields_value OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 61610)
-- Dependencies: 6 144
-- Name: users_iduser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_iduser_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_iduser_seq OWNER TO postgres;

--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 254
-- Name: users_iduser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_iduser_seq OWNED BY users.iduser;


--
-- TOC entry 255 (class 1259 OID 61612)
-- Dependencies: 6
-- Name: users_reset; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_reset (
    email character varying NOT NULL,
    key character varying
);


ALTER TABLE public.users_reset OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 61618)
-- Dependencies: 6
-- Name: versions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE versions (
    idversion integer NOT NULL,
    filename character varying,
    codec character varying(128),
    filesize bigint,
    rate character varying,
    duration time without time zone,
    state integer,
    is_deleted integer,
    date_of_upload date,
    date_of_deletion date,
    uri character varying,
    lcid character varying,
    resolution character varying,
    ratio character varying
);


ALTER TABLE public.versions OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 61624)
-- Dependencies: 6 256
-- Name: versions_idversion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE versions_idversion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.versions_idversion_seq OWNER TO postgres;

--
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 257
-- Name: versions_idversion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE versions_idversion_seq OWNED BY versions.idversion;


--
-- TOC entry 258 (class 1259 OID 61626)
-- Dependencies: 6
-- Name: videoratio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE videoratio (
    id integer NOT NULL,
    libelle text,
    parent smallint,
    ref_text character varying(255)
);


ALTER TABLE public.videoratio OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 61632)
-- Dependencies: 6 258
-- Name: videoratio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE videoratio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.videoratio_id_seq OWNER TO postgres;

--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 259
-- Name: videoratio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE videoratio_id_seq OWNED BY videoratio.id;


--
-- TOC entry 260 (class 1259 OID 61634)
-- Dependencies: 2254 6
-- Name: view1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view1 AS
    SELECT DISTINCT p.idprog, p.idprog_programs_extract, pt.idview, p.idproduction, p.idextfilm, p.keyprog, p.duration, p.date, p.tcin, p.tcout, p.state, p.type_extract, pt.id AS idvalue, pt.value, pf.idfield, pf.title, pf.type, pf.table_ref, pf.parent, pf.mask, pf.default_value, pf.help, pf.is_editable, pf.indexable, pf.code, pfg.idgroup, pfg.name, pfg.category, pfg.system_gcv, p.viewof, p.idpublication, p.idprog_programs_of, p2.state AS programstate FROM (((((programs p LEFT JOIN programs_translations pt ON ((pt.idprog = p.idprog))) LEFT JOIN programs_fields_group_fields pfgf ON ((pfgf.idfgroup = pt.idfgroup))) LEFT JOIN programs_fields pf ON ((pf.idfield = pfgf.idfield))) LEFT JOIN programs_fields_group pfg ON ((pfgf.idgroup = pfg.idgroup))) LEFT JOIN programs p2 ON ((p.idprog_programs_of = p2.idprog))) WHERE ((p.state)::text = 'ACTIVATED'::text) ORDER BY p.idprog;


ALTER TABLE public.view1 OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 61639)
-- Dependencies: 2255 6
-- Name: view2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view2 AS
    SELECT DISTINCT view1.idprog, view1.idprog_programs_extract, view1.idview, view1.idproduction, view1.idextfilm, view1.keyprog, view1.duration, view1.date, view1.tcin, view1.tcout, view1.state, view1.type_extract, array_agg(view1.value) AS "values", array_agg(view1.type) AS type, array_agg(view1.title) AS title, array_agg(view1.table_ref) AS table_ref, array_agg(view1.parent) AS parent, array_agg(view1.mask) AS mask, array_agg(view1.default_value) AS default_value, array_agg(view1.help) AS help, array_agg(view1.indexable) AS indexable, array_agg(view1.code) AS code, array_agg(view1.idgroup) AS idgroup, array_agg(view1.name) AS groupname, array_agg(view1.system_gcv) AS system_gcv, array_agg(view1.is_editable) AS is_editable FROM view1 GROUP BY view1.idprog, view1.idprog_programs_extract, view1.idview, view1.idproduction, view1.idextfilm, view1.keyprog, view1.duration, view1.date, view1.tcin, view1.tcout, view1.state, view1.type_extract;


ALTER TABLE public.view2 OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 61644)
-- Dependencies: 6 217
-- Name: views_idview_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE views_idview_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.views_idview_seq OWNER TO postgres;

--
-- TOC entry 2826 (class 0 OID 0)
-- Dependencies: 262
-- Name: views_idview_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE views_idview_seq OWNED BY publications_views.idview;


--
-- TOC entry 2463 (class 2604 OID 61646)
-- Dependencies: 149 148
-- Name: idbilling; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE billings ALTER COLUMN idbilling SET DEFAULT nextval('billings_idbilling_seq'::regclass);


--
-- TOC entry 2464 (class 2604 OID 61647)
-- Dependencies: 151 150
-- Name: idbillingother; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE billings_others ALTER COLUMN idbillingother SET DEFAULT nextval('billings_others_idbillingother_seq'::regclass);


--
-- TOC entry 2466 (class 2604 OID 61648)
-- Dependencies: 153 152
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE chapters ALTER COLUMN id SET DEFAULT nextval('chapters_id_seq'::regclass);


--
-- TOC entry 2477 (class 2604 OID 61649)
-- Dependencies: 162 161
-- Name: idcomponent; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE components ALTER COLUMN idcomponent SET DEFAULT nextval('components_idcomponent_seq'::regclass);


--
-- TOC entry 2478 (class 2604 OID 61650)
-- Dependencies: 164 163
-- Name: idformat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE encoding_formats ALTER COLUMN idformat SET DEFAULT nextval('encoding_formats_idformat_seq'::regclass);


--
-- TOC entry 2479 (class 2604 OID 61651)
-- Dependencies: 167 165
-- Name: idprofil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE encoding_profils ALTER COLUMN idprofil SET DEFAULT nextval('encoding_profils_idprofil_seq'::regclass);


--
-- TOC entry 2527 (class 2604 OID 73028)
-- Dependencies: 266 265
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_action ALTER COLUMN id SET DEFAULT nextval('enum_action_id_seq'::regclass);


--
-- TOC entry 2528 (class 2604 OID 73029)
-- Dependencies: 268 267
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_audience ALTER COLUMN id SET DEFAULT nextval('enum_audience_id_seq'::regclass);


--
-- TOC entry 2529 (class 2604 OID 73030)
-- Dependencies: 270 269
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_class ALTER COLUMN id SET DEFAULT nextval('enum_class_id_seq'::regclass);


--
-- TOC entry 2530 (class 2604 OID 73031)
-- Dependencies: 272 271
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_class2 ALTER COLUMN id SET DEFAULT nextval('enum_class2_id_seq'::regclass);


--
-- TOC entry 2531 (class 2604 OID 73032)
-- Dependencies: 274 273
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_countries ALTER COLUMN id SET DEFAULT nextval('enum_countries_id_seq'::regclass);


--
-- TOC entry 2532 (class 2604 OID 73033)
-- Dependencies: 276 275
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_domaine ALTER COLUMN id SET DEFAULT nextval('enum_domaine_id_seq'::regclass);


--
-- TOC entry 2533 (class 2604 OID 73034)
-- Dependencies: 278 277
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_format ALTER COLUMN id SET DEFAULT nextval('enum_format_id_seq'::regclass);


--
-- TOC entry 2534 (class 2604 OID 73035)
-- Dependencies: 280 279
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_function ALTER COLUMN id SET DEFAULT nextval('enum_function_id_seq'::regclass);


--
-- TOC entry 2535 (class 2604 OID 73036)
-- Dependencies: 284 281
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_genre ALTER COLUMN id SET DEFAULT nextval('enum_genre_id_seq'::regclass);


--
-- TOC entry 2536 (class 2604 OID 73037)
-- Dependencies: 283 282
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_genre_audiovisual ALTER COLUMN id SET DEFAULT nextval('enum_genre_audiovisual_id_seq'::regclass);


--
-- TOC entry 2537 (class 2604 OID 73038)
-- Dependencies: 286 285
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_language ALTER COLUMN id SET DEFAULT nextval('enum_language_id_seq'::regclass);


--
-- TOC entry 2538 (class 2604 OID 73039)
-- Dependencies: 291 288
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_lieu ALTER COLUMN id SET DEFAULT nextval('enum_lieu_id_seq'::regclass);


--
-- TOC entry 2539 (class 2604 OID 73040)
-- Dependencies: 290 289
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_lieu2 ALTER COLUMN id SET DEFAULT nextval('enum_lieu2_id_seq'::regclass);


--
-- TOC entry 2540 (class 2604 OID 73041)
-- Dependencies: 293 292
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_media ALTER COLUMN id SET DEFAULT nextval('enum_media_id_seq'::regclass);


--
-- TOC entry 2541 (class 2604 OID 73042)
-- Dependencies: 295 294
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_medium ALTER COLUMN id SET DEFAULT nextval('enum_medium_id_seq'::regclass);


--
-- TOC entry 2542 (class 2604 OID 73043)
-- Dependencies: 299 296
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_organization ALTER COLUMN id SET DEFAULT nextval('enum_organization_id_seq'::regclass);


--
-- TOC entry 2543 (class 2604 OID 73044)
-- Dependencies: 298 297
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_organization2 ALTER COLUMN id SET DEFAULT nextval('enum_organization2_id_seq'::regclass);


--
-- TOC entry 2544 (class 2604 OID 73045)
-- Dependencies: 303 300
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_personne ALTER COLUMN id SET DEFAULT nextval('enum_personne_id_seq'::regclass);


--
-- TOC entry 2545 (class 2604 OID 73046)
-- Dependencies: 302 301
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_personne2 ALTER COLUMN id SET DEFAULT nextval('enum_personne2_id_seq'::regclass);


--
-- TOC entry 2546 (class 2604 OID 73047)
-- Dependencies: 305 304
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_pointzoom ALTER COLUMN id SET DEFAULT nextval('enum_pointzoom_id_seq'::regclass);


--
-- TOC entry 2547 (class 2604 OID 73048)
-- Dependencies: 307 306
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_profession ALTER COLUMN id SET DEFAULT nextval('enum_profession_id_seq'::regclass);


--
-- TOC entry 2548 (class 2604 OID 73049)
-- Dependencies: 311 308
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_public ALTER COLUMN id SET DEFAULT nextval('enum_public_id_seq'::regclass);


--
-- TOC entry 2549 (class 2604 OID 73050)
-- Dependencies: 310 309
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_public2 ALTER COLUMN id SET DEFAULT nextval('enum_public2_id_seq'::regclass);


--
-- TOC entry 2550 (class 2604 OID 73051)
-- Dependencies: 313 312
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_scoring ALTER COLUMN id SET DEFAULT nextval('enum_scoring_id_seq'::regclass);


--
-- TOC entry 2551 (class 2604 OID 73052)
-- Dependencies: 315 314
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_sector ALTER COLUMN id SET DEFAULT nextval('enum_sector_id_seq'::regclass);


--
-- TOC entry 2552 (class 2604 OID 73053)
-- Dependencies: 317 316
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_sublanguage ALTER COLUMN id SET DEFAULT nextval('enum_sublanguage_id_seq'::regclass);


--
-- TOC entry 2553 (class 2604 OID 73054)
-- Dependencies: 321 318
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_theme ALTER COLUMN id SET DEFAULT nextval('enum_theme_id_seq'::regclass);


--
-- TOC entry 2554 (class 2604 OID 73055)
-- Dependencies: 320 319
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_theme2 ALTER COLUMN id SET DEFAULT nextval('enum_theme2_id_seq'::regclass);


--
-- TOC entry 2555 (class 2604 OID 73056)
-- Dependencies: 323 322
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_type1 ALTER COLUMN id SET DEFAULT nextval('enum_type1_id_seq'::regclass);


--
-- TOC entry 2556 (class 2604 OID 73057)
-- Dependencies: 325 324
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE enum_type2 ALTER COLUMN id SET DEFAULT nextval('enum_type2_id_seq'::regclass);


--
-- TOC entry 2480 (class 2604 OID 61674)
-- Dependencies: 169 168
-- Name: idcomp; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE extra_components_panel ALTER COLUMN idcomp SET DEFAULT nextval('extra_components_panel_idcomp_seq'::regclass);


--
-- TOC entry 2481 (class 2604 OID 61675)
-- Dependencies: 172 171
-- Name: idgroup; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE groups ALTER COLUMN idgroup SET DEFAULT nextval('groups_idgroup_seq'::regclass);


--
-- TOC entry 2482 (class 2604 OID 61676)
-- Dependencies: 175 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE kb_items ALTER COLUMN id SET DEFAULT nextval('kb_items_id_seq'::regclass);


--
-- TOC entry 2483 (class 2604 OID 61677)
-- Dependencies: 179 177
-- Name: idtype; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE kb_items_type ALTER COLUMN idtype SET DEFAULT nextval('kb_items_type_idtype_seq'::regclass);


--
-- TOC entry 2458 (class 2604 OID 61678)
-- Dependencies: 147 146
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE kb_rub ALTER COLUMN id SET DEFAULT nextval('bc_rub_id_seq'::regclass);


--
-- TOC entry 2485 (class 2604 OID 61679)
-- Dependencies: 181 180
-- Name: idkb; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE knowledge_base ALTER COLUMN idkb SET DEFAULT nextval('knowledge_base_idkb_seq'::regclass);


--
-- TOC entry 2486 (class 2604 OID 61680)
-- Dependencies: 183 182
-- Name: idlocale; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE locales ALTER COLUMN idlocale SET DEFAULT nextval('locales_idlocale_seq'::regclass);


--
-- TOC entry 2491 (class 2604 OID 61681)
-- Dependencies: 185 184
-- Name: idlog; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE logs ALTER COLUMN idlog SET DEFAULT nextval('logs_idlog_seq'::regclass);


--
-- TOC entry 2492 (class 2604 OID 61682)
-- Dependencies: 187 186
-- Name: idmaster; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE masters ALTER COLUMN idmaster SET DEFAULT nextval('masters_idmaster_seq'::regclass);


--
-- TOC entry 2493 (class 2604 OID 61683)
-- Dependencies: 189 188
-- Name: idmenu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE menus_elements ALTER COLUMN idmenu SET DEFAULT nextval('menus_elements_idmenu_seq'::regclass);


--
-- TOC entry 2494 (class 2604 OID 61684)
-- Dependencies: 193 190
-- Name: idorganization; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE organizations ALTER COLUMN idorganization SET DEFAULT nextval('organizations_idorganization_seq'::regclass);


--
-- TOC entry 2495 (class 2604 OID 61685)
-- Dependencies: 192 191
-- Name: idcontact; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE organizations_contacts ALTER COLUMN idcontact SET DEFAULT nextval('organizations_contacts_idcontact_seq'::regclass);


--
-- TOC entry 2496 (class 2604 OID 61686)
-- Dependencies: 195 194
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE p_field_category ALTER COLUMN id SET DEFAULT nextval('p_field_category_id_seq'::regclass);


--
-- TOC entry 2468 (class 2604 OID 61687)
-- Dependencies: 196 155
-- Name: idplaylist; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE playlists ALTER COLUMN idplaylist SET DEFAULT nextval('playlists_idplaylist_seq'::regclass);


--
-- TOC entry 2448 (class 2604 OID 61688)
-- Dependencies: 199 140
-- Name: idproduction; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE productions ALTER COLUMN idproduction SET DEFAULT nextval('productions_idproduction_seq'::regclass);


--
-- TOC entry 2471 (class 2604 OID 61689)
-- Dependencies: 206 156
-- Name: idprog; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE programs ALTER COLUMN idprog SET DEFAULT nextval('programs_idprog_seq'::regclass);


--
-- TOC entry 2526 (class 2604 OID 62010)
-- Dependencies: 263 264 264
-- Name: idcredit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE programs_credits ALTER COLUMN idcredit SET DEFAULT nextval('programs_credits_idcredit_seq'::regclass);


--
-- TOC entry 2473 (class 2604 OID 61690)
-- Dependencies: 170 157
-- Name: idfield; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE programs_fields ALTER COLUMN idfield SET DEFAULT nextval('fields_idfield_seq'::regclass);


--
-- TOC entry 2475 (class 2604 OID 61691)
-- Dependencies: 205 158
-- Name: idgroup; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE programs_fields_group ALTER COLUMN idgroup SET DEFAULT nextval('programs_fields_group_idgroup_seq'::regclass);


--
-- TOC entry 2476 (class 2604 OID 61692)
-- Dependencies: 204 159
-- Name: idfgroup; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE programs_fields_group_fields ALTER COLUMN idfgroup SET DEFAULT nextval('programs_fields_group_fields_idfgroup_seq'::regclass);


--
-- TOC entry 2499 (class 2604 OID 61693)
-- Dependencies: 208 207
-- Name: idpicture; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE programs_pictures ALTER COLUMN idpicture SET DEFAULT nextval('programs_pictures_idpicture_seq'::regclass);


--
-- TOC entry 2451 (class 2604 OID 61694)
-- Dependencies: 215 141
-- Name: idpublication; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE publications ALTER COLUMN idpublication SET DEFAULT nextval('publications_idpublication_seq'::regclass);


--
-- TOC entry 2504 (class 2604 OID 61695)
-- Dependencies: 262 217
-- Name: idview; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE publications_views ALTER COLUMN idview SET DEFAULT nextval('views_idview_seq'::regclass);


--
-- TOC entry 2454 (class 2604 OID 61696)
-- Dependencies: 219 142
-- Name: idacces; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ressources_access ALTER COLUMN idacces SET DEFAULT nextval('ressources_access_idaccess_seq'::regclass);


--
-- TOC entry 2456 (class 2604 OID 61697)
-- Dependencies: 220 143
-- Name: idservice; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE services ALTER COLUMN idservice SET DEFAULT nextval('services_idservice_seq'::regclass);


--
-- TOC entry 2507 (class 2604 OID 61698)
-- Dependencies: 227 222
-- Name: idorder; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE services_orders ALTER COLUMN idorder SET DEFAULT nextval('services_orders_idorder_seq'::regclass);


--
-- TOC entry 2508 (class 2604 OID 61699)
-- Dependencies: 224 223
-- Name: idchapitrage; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE services_orders_chapitrage ALTER COLUMN idchapitrage SET DEFAULT nextval('services_orders_chapitrage_idchapitrage_seq'::regclass);


--
-- TOC entry 2509 (class 2604 OID 61700)
-- Dependencies: 226 225
-- Name: idencoding; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE services_orders_encoding ALTER COLUMN idencoding SET DEFAULT nextval('services_orders_encoding_idencoding_seq'::regclass);


--
-- TOC entry 2510 (class 2604 OID 61701)
-- Dependencies: 229 228
-- Name: idorderline; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE services_orders_lines ALTER COLUMN idorderline SET DEFAULT nextval('services_orders_lines_idorderline_seq'::regclass);


--
-- TOC entry 2511 (class 2604 OID 61702)
-- Dependencies: 231 230
-- Name: idsubtitling; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE services_orders_subtitling ALTER COLUMN idsubtitling SET DEFAULT nextval('services_orders_subtitling_idsubtitling_seq'::regclass);


--
-- TOC entry 2512 (class 2604 OID 61703)
-- Dependencies: 233 232
-- Name: idtranslation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE services_orders_translation ALTER COLUMN idtranslation SET DEFAULT nextval('services_orders_translation_idtranslation_seq'::regclass);


--
-- TOC entry 2513 (class 2604 OID 61704)
-- Dependencies: 235 234
-- Name: idwatermarking; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE services_orders_watermarking ALTER COLUMN idwatermarking SET DEFAULT nextval('services_orders_watermarking_idwatermarking_seq'::regclass);


--
-- TOC entry 2514 (class 2604 OID 61705)
-- Dependencies: 237 236
-- Name: idtype; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE services_types ALTER COLUMN idtype SET DEFAULT nextval('services_types_idtype_seq'::regclass);


--
-- TOC entry 2515 (class 2604 OID 61706)
-- Dependencies: 240 239
-- Name: idtask; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tasks ALTER COLUMN idtask SET DEFAULT nextval('tasks_idtask_seq'::regclass);


--
-- TOC entry 2519 (class 2604 OID 61707)
-- Dependencies: 242 241
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE themes ALTER COLUMN id SET DEFAULT nextval('themes_id_seq'::regclass);


--
-- TOC entry 2520 (class 2604 OID 61708)
-- Dependencies: 244 243
-- Name: idtoken; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tokens ALTER COLUMN idtoken SET DEFAULT nextval('tokens_idtoken_seq'::regclass);


--
-- TOC entry 2521 (class 2604 OID 61709)
-- Dependencies: 246 245
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE translations ALTER COLUMN id SET DEFAULT nextval('traduction_id_seq'::regclass);


--
-- TOC entry 2457 (class 2604 OID 61710)
-- Dependencies: 254 144
-- Name: iduser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE users ALTER COLUMN iduser SET DEFAULT nextval('users_iduser_seq'::regclass);


--
-- TOC entry 2522 (class 2604 OID 61711)
-- Dependencies: 252 248
-- Name: idfield; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE users_fields ALTER COLUMN idfield SET DEFAULT nextval('users_fields_idfield_seq'::regclass);


--
-- TOC entry 2523 (class 2604 OID 61712)
-- Dependencies: 251 249
-- Name: idgroup; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE users_fields_group ALTER COLUMN idgroup SET DEFAULT nextval('users_fields_group_idgroup_seq'::regclass);


--
-- TOC entry 2524 (class 2604 OID 61713)
-- Dependencies: 257 256
-- Name: idversion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE versions ALTER COLUMN idversion SET DEFAULT nextval('versions_idversion_seq'::regclass);


--
-- TOC entry 2525 (class 2604 OID 61714)
-- Dependencies: 259 258
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE videoratio ALTER COLUMN id SET DEFAULT nextval('videoratio_id_seq'::regclass);


--
-- TOC entry 2605 (class 2606 OID 61716)
-- Dependencies: 163 163
-- Name: encoding_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY encoding_formats
    ADD CONSTRAINT encoding_formats_pkey PRIMARY KEY (idformat);


--
-- TOC entry 2607 (class 2606 OID 61718)
-- Dependencies: 165 165
-- Name: encoding_profils_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY encoding_profils
    ADD CONSTRAINT encoding_profils_pkey PRIMARY KEY (idprofil);


--
-- TOC entry 2624 (class 2606 OID 61730)
-- Dependencies: 184 184
-- Name: logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2578 (class 2606 OID 61732)
-- Dependencies: 148 148
-- Name: pk_billings; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY billings
    ADD CONSTRAINT pk_billings PRIMARY KEY (idbilling);


--
-- TOC entry 2581 (class 2606 OID 61734)
-- Dependencies: 150 150
-- Name: pk_billings_others; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY billings_others
    ADD CONSTRAINT pk_billings_others PRIMARY KEY (idbillingother);


--
-- TOC entry 2585 (class 2606 OID 61736)
-- Dependencies: 152 152
-- Name: pk_chapters; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY chapters
    ADD CONSTRAINT pk_chapters PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 61738)
-- Dependencies: 161 161
-- Name: pk_components; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY components
    ADD CONSTRAINT pk_components PRIMARY KEY (idcomponent);


--
-- TOC entry 2609 (class 2606 OID 61740)
-- Dependencies: 168 168
-- Name: pk_extra_components_panel; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY extra_components_panel
    ADD CONSTRAINT pk_extra_components_panel PRIMARY KEY (idcomp);


--
-- TOC entry 2595 (class 2606 OID 61742)
-- Dependencies: 157 157
-- Name: pk_fields; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programs_fields
    ADD CONSTRAINT pk_fields PRIMARY KEY (idfield);


--
-- TOC entry 2612 (class 2606 OID 61744)
-- Dependencies: 171 171
-- Name: pk_groups; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT pk_groups PRIMARY KEY (idgroup);


--
-- TOC entry 2616 (class 2606 OID 61746)
-- Dependencies: 173 173 173
-- Name: pk_groups_programs; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups_programs
    ADD CONSTRAINT pk_groups_programs PRIMARY KEY (idgroup, idprog);


--
-- TOC entry 2622 (class 2606 OID 61748)
-- Dependencies: 180 180
-- Name: pk_idkb; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY knowledge_base
    ADD CONSTRAINT pk_idkb PRIMARY KEY (idkb);


--
-- TOC entry 2620 (class 2606 OID 61750)
-- Dependencies: 177 177
-- Name: pk_kb_items_type; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kb_items_type
    ADD CONSTRAINT pk_kb_items_type PRIMARY KEY (idtype);


--
-- TOC entry 2574 (class 2606 OID 61752)
-- Dependencies: 146 146
-- Name: pk_kb_rub; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kb_rub
    ADD CONSTRAINT pk_kb_rub PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 61754)
-- Dependencies: 190 190
-- Name: pk_organizations; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT pk_organizations PRIMARY KEY (idorganization);


--
-- TOC entry 2630 (class 2606 OID 61756)
-- Dependencies: 191 191
-- Name: pk_organizations_contacts; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY organizations_contacts
    ADD CONSTRAINT pk_organizations_contacts PRIMARY KEY (idcontact);


--
-- TOC entry 2632 (class 2606 OID 61758)
-- Dependencies: 194 194
-- Name: pk_pfc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY p_field_category
    ADD CONSTRAINT pk_pfc PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 61760)
-- Dependencies: 155 155
-- Name: pk_playlists; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY playlists
    ADD CONSTRAINT pk_playlists PRIMARY KEY (idplaylist);


--
-- TOC entry 2560 (class 2606 OID 61764)
-- Dependencies: 140 140
-- Name: pk_productions; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productions
    ADD CONSTRAINT pk_productions PRIMARY KEY (idproduction);


--
-- TOC entry 2642 (class 2606 OID 61766)
-- Dependencies: 200 200 200
-- Name: pk_productions_menus_elements; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productions_menus_elements
    ADD CONSTRAINT pk_productions_menus_elements PRIMARY KEY (idproduction, idmenu);


--
-- TOC entry 2646 (class 2606 OID 61768)
-- Dependencies: 201 201 201
-- Name: pk_productions_publications; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productions_publications
    ADD CONSTRAINT pk_productions_publications PRIMARY KEY (idproduction, idpublication);


--
-- TOC entry 2650 (class 2606 OID 61770)
-- Dependencies: 202 202 202 202
-- Name: pk_productions_tarifs; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productions_rate
    ADD CONSTRAINT pk_productions_tarifs PRIMARY KEY (idrate, idproduction, idperiode);


--
-- TOC entry 2652 (class 2606 OID 61772)
-- Dependencies: 207 207
-- Name: pk_prog_pictures; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programs_pictures
    ADD CONSTRAINT pk_prog_pictures PRIMARY KEY (idpicture);


--
-- TOC entry 2593 (class 2606 OID 61774)
-- Dependencies: 156 156
-- Name: pk_programs; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT pk_programs PRIMARY KEY (idprog);


--
-- TOC entry 2597 (class 2606 OID 61776)
-- Dependencies: 158 158
-- Name: pk_programs_fields_group; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programs_fields_group
    ADD CONSTRAINT pk_programs_fields_group PRIMARY KEY (idgroup);


--
-- TOC entry 2601 (class 2606 OID 61778)
-- Dependencies: 159 159 159
-- Name: pk_programs_fields_group_fields; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programs_fields_group_fields
    ADD CONSTRAINT pk_programs_fields_group_fields PRIMARY KEY (idfield, idgroup);


--
-- TOC entry 2656 (class 2606 OID 61780)
-- Dependencies: 209 209 209
-- Name: pk_programs_publications; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programs_publications
    ADD CONSTRAINT pk_programs_publications PRIMARY KEY (idprog, idpublication);


--
-- TOC entry 2666 (class 2606 OID 61782)
-- Dependencies: 212 212 212
-- Name: pk_programs_versions; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programs_versions
    ADD CONSTRAINT pk_programs_versions PRIMARY KEY (idprog, idversion);


--
-- TOC entry 2563 (class 2606 OID 61784)
-- Dependencies: 141 141
-- Name: pk_publications; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT pk_publications PRIMARY KEY (idpublication);


--
-- TOC entry 2670 (class 2606 OID 61786)
-- Dependencies: 216 216 216
-- Name: pk_publications_menus_elements; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY publications_menus_elements
    ADD CONSTRAINT pk_publications_menus_elements PRIMARY KEY (idpublication, idmenu);


--
-- TOC entry 2618 (class 2606 OID 61788)
-- Dependencies: 174 174
-- Name: pk_rb_items; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kb_items
    ADD CONSTRAINT pk_rb_items PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 61790)
-- Dependencies: 142 142
-- Name: pk_ressources_access; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ressources_access
    ADD CONSTRAINT pk_ressources_access PRIMARY KEY (idacces);


--
-- TOC entry 2569 (class 2606 OID 61792)
-- Dependencies: 143 143
-- Name: pk_services; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT pk_services PRIMARY KEY (idservice);


--
-- TOC entry 2677 (class 2606 OID 61794)
-- Dependencies: 221 221 221
-- Name: pk_services_menus_elements; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services_menus_elements
    ADD CONSTRAINT pk_services_menus_elements PRIMARY KEY (idservice, idmenu);


--
-- TOC entry 2679 (class 2606 OID 61796)
-- Dependencies: 222 222
-- Name: pk_services_orders; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services_orders
    ADD CONSTRAINT pk_services_orders PRIMARY KEY (idorder);


--
-- TOC entry 2681 (class 2606 OID 61798)
-- Dependencies: 223 223
-- Name: pk_services_orders_chapitrage; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services_orders_chapitrage
    ADD CONSTRAINT pk_services_orders_chapitrage PRIMARY KEY (idchapitrage);


--
-- TOC entry 2683 (class 2606 OID 61800)
-- Dependencies: 225 225
-- Name: pk_services_orders_encoding; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services_orders_encoding
    ADD CONSTRAINT pk_services_orders_encoding PRIMARY KEY (idencoding);


--
-- TOC entry 2685 (class 2606 OID 61802)
-- Dependencies: 228 228
-- Name: pk_services_orders_lines; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services_orders_lines
    ADD CONSTRAINT pk_services_orders_lines PRIMARY KEY (idorderline);


--
-- TOC entry 2687 (class 2606 OID 61804)
-- Dependencies: 230 230
-- Name: pk_services_orders_subtitling; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services_orders_subtitling
    ADD CONSTRAINT pk_services_orders_subtitling PRIMARY KEY (idsubtitling);


--
-- TOC entry 2689 (class 2606 OID 61806)
-- Dependencies: 232 232
-- Name: pk_services_orders_translation; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services_orders_translation
    ADD CONSTRAINT pk_services_orders_translation PRIMARY KEY (idtranslation);


--
-- TOC entry 2691 (class 2606 OID 61808)
-- Dependencies: 234 234
-- Name: pk_services_orders_watermarking; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services_orders_watermarking
    ADD CONSTRAINT pk_services_orders_watermarking PRIMARY KEY (idwatermarking);


--
-- TOC entry 2693 (class 2606 OID 61810)
-- Dependencies: 236 236
-- Name: pk_services_type; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services_types
    ADD CONSTRAINT pk_services_type PRIMARY KEY (idtype);


--
-- TOC entry 2675 (class 2606 OID 61812)
-- Dependencies: 218 218
-- Name: pk_tarifs; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rates
    ADD CONSTRAINT pk_tarifs PRIMARY KEY (idrate);


--
-- TOC entry 2697 (class 2606 OID 61814)
-- Dependencies: 241 241
-- Name: pk_themes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY themes
    ADD CONSTRAINT pk_themes PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 61816)
-- Dependencies: 245 245
-- Name: pk_traduction; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT pk_traduction PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 61818)
-- Dependencies: 144 144
-- Name: pk_users; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT pk_users PRIMARY KEY (iduser);


--
-- TOC entry 2701 (class 2606 OID 61820)
-- Dependencies: 247 247 247
-- Name: pk_users_envir; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_environment
    ADD CONSTRAINT pk_users_envir PRIMARY KEY (iduser, dataname);


--
-- TOC entry 2703 (class 2606 OID 61822)
-- Dependencies: 248 248
-- Name: pk_users_fields; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_fields
    ADD CONSTRAINT pk_users_fields PRIMARY KEY (idfield);


--
-- TOC entry 2705 (class 2606 OID 61824)
-- Dependencies: 249 249
-- Name: pk_users_fields_group; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_fields_group
    ADD CONSTRAINT pk_users_fields_group PRIMARY KEY (idgroup);


--
-- TOC entry 2709 (class 2606 OID 61826)
-- Dependencies: 250 250 250
-- Name: pk_users_fields_group_fields; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_fields_group_fields
    ADD CONSTRAINT pk_users_fields_group_fields PRIMARY KEY (idfield, idgroup);


--
-- TOC entry 2713 (class 2606 OID 61828)
-- Dependencies: 253 253 253
-- Name: pk_users_fields_value; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_fields_value
    ADD CONSTRAINT pk_users_fields_value PRIMARY KEY (idfield, iduser);


--
-- TOC entry 2715 (class 2606 OID 61830)
-- Dependencies: 255 255
-- Name: pk_users_reset; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_reset
    ADD CONSTRAINT pk_users_reset PRIMARY KEY (email);


--
-- TOC entry 2717 (class 2606 OID 61832)
-- Dependencies: 256 256
-- Name: pk_versions; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT pk_versions PRIMARY KEY (idversion);


--
-- TOC entry 2673 (class 2606 OID 61834)
-- Dependencies: 217 217
-- Name: pk_views; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY publications_views
    ADD CONSTRAINT pk_views PRIMARY KEY (idview);


--
-- TOC entry 2636 (class 2606 OID 62163)
-- Dependencies: 197 197 197 197
-- Name: playlists_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY playlists_programs
    ADD CONSTRAINT playlists_programs_pkey PRIMARY KEY (idplaylist, idprog, listorder);


--
-- TOC entry 2638 (class 2606 OID 61836)
-- Dependencies: 198 198 198 198
-- Name: productions_fields_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productions_fields_group
    ADD CONSTRAINT productions_fields_group_pkey PRIMARY KEY (idproduction, "order", idgroup);


--
-- TOC entry 2719 (class 2606 OID 62015)
-- Dependencies: 264 264
-- Name: programs_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programs_credits
    ADD CONSTRAINT programs_credits_pkey PRIMARY KEY (idcredit);


--
-- TOC entry 2661 (class 2606 OID 61995)
-- Dependencies: 211 211 211 211
-- Name: programs_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programs_translations
    ADD CONSTRAINT programs_translations_pkey PRIMARY KEY (idprog, idfgroup, idview);


--
-- TOC entry 2695 (class 2606 OID 61838)
-- Dependencies: 239 239
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (idtask);


--
-- TOC entry 2579 (class 1259 OID 61839)
-- Dependencies: 150
-- Name: i_fk_billings_others_billings; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_billings_others_billings ON billings_others USING btree (idbilling);


--
-- TOC entry 2575 (class 1259 OID 61840)
-- Dependencies: 148
-- Name: i_fk_billings_productions; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_billings_productions ON billings USING btree (idproduction);


--
-- TOC entry 2576 (class 1259 OID 61841)
-- Dependencies: 148
-- Name: i_fk_billings_tarifs; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_billings_tarifs ON billings USING btree (idrate);


--
-- TOC entry 2582 (class 1259 OID 61842)
-- Dependencies: 152
-- Name: i_fk_chapters_playlists; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_chapters_playlists ON chapters USING btree (idplaylist);


--
-- TOC entry 2583 (class 1259 OID 61843)
-- Dependencies: 152
-- Name: i_fk_chapters_programs; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_chapters_programs ON chapters USING btree (idprog);


--
-- TOC entry 2610 (class 1259 OID 61844)
-- Dependencies: 171
-- Name: i_fk_groups_productions; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_groups_productions ON groups USING btree (idproduction);


--
-- TOC entry 2613 (class 1259 OID 61845)
-- Dependencies: 173
-- Name: i_fk_groups_programs_groups; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_groups_programs_groups ON groups_programs USING btree (idgroup);


--
-- TOC entry 2614 (class 1259 OID 61846)
-- Dependencies: 173
-- Name: i_fk_groups_programs_programs; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_groups_programs_programs ON groups_programs USING btree (idprog);


--
-- TOC entry 2625 (class 1259 OID 61847)
-- Dependencies: 188
-- Name: i_fk_menus_elements_components; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_menus_elements_components ON menus_elements USING btree (idcomponent);


--
-- TOC entry 2628 (class 1259 OID 61848)
-- Dependencies: 191
-- Name: i_fk_organizations_contacts_or; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_organizations_contacts_or ON organizations_contacts USING btree (idorganization);


--
-- TOC entry 2633 (class 1259 OID 61849)
-- Dependencies: 197
-- Name: i_fk_playlists_programs_playli; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_playlists_programs_playli ON playlists_programs USING btree (idplaylist);


--
-- TOC entry 2634 (class 1259 OID 61850)
-- Dependencies: 197
-- Name: i_fk_playlists_programs_progra; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_playlists_programs_progra ON playlists_programs USING btree (idprog);


--
-- TOC entry 2587 (class 1259 OID 61851)
-- Dependencies: 155
-- Name: i_fk_playlists_publications; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_playlists_publications ON playlists USING btree (idpublication);


--
-- TOC entry 2639 (class 1259 OID 61852)
-- Dependencies: 200
-- Name: i_fk_productions_menus_elemen1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_productions_menus_elemen1 ON productions_menus_elements USING btree (idmenu);


--
-- TOC entry 2640 (class 1259 OID 61853)
-- Dependencies: 200
-- Name: i_fk_productions_menus_element; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_productions_menus_element ON productions_menus_elements USING btree (idproduction);


--
-- TOC entry 2557 (class 1259 OID 61854)
-- Dependencies: 140
-- Name: i_fk_productions_organizations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_productions_organizations ON productions USING btree (idorganization);


--
-- TOC entry 2558 (class 1259 OID 61855)
-- Dependencies: 140
-- Name: i_fk_productions_programs_fiel; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_productions_programs_fiel ON productions USING btree (idgroup);


--
-- TOC entry 2643 (class 1259 OID 61856)
-- Dependencies: 201
-- Name: i_fk_productions_publications1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_productions_publications1 ON productions_publications USING btree (idpublication);


--
-- TOC entry 2644 (class 1259 OID 61857)
-- Dependencies: 201
-- Name: i_fk_productions_publications_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_productions_publications_ ON productions_publications USING btree (idproduction);


--
-- TOC entry 2647 (class 1259 OID 61858)
-- Dependencies: 202
-- Name: i_fk_productions_tarifs_produc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_productions_tarifs_produc ON productions_rate USING btree (idproduction);


--
-- TOC entry 2648 (class 1259 OID 61859)
-- Dependencies: 202
-- Name: i_fk_productions_tarifs_tarifs; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_productions_tarifs_tarifs ON productions_rate USING btree (idrate);


--
-- TOC entry 2598 (class 1259 OID 61860)
-- Dependencies: 159
-- Name: i_fk_programs_fields_group_fi1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_fields_group_fi1 ON programs_fields_group_fields USING btree (idgroup);


--
-- TOC entry 2599 (class 1259 OID 61861)
-- Dependencies: 159
-- Name: i_fk_programs_fields_group_fie; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_fields_group_fie ON programs_fields_group_fields USING btree (idfield);


--
-- TOC entry 2590 (class 1259 OID 61862)
-- Dependencies: 156
-- Name: i_fk_programs_productions; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_productions ON programs USING btree (idproduction);


--
-- TOC entry 2591 (class 1259 OID 61863)
-- Dependencies: 156
-- Name: i_fk_programs_programs; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_programs ON programs USING btree (idprog_programs_extract);


--
-- TOC entry 2653 (class 1259 OID 61864)
-- Dependencies: 209
-- Name: i_fk_programs_publications_pro; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_publications_pro ON programs_publications USING btree (idprog);


--
-- TOC entry 2654 (class 1259 OID 61865)
-- Dependencies: 209
-- Name: i_fk_programs_publications_pub; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_publications_pub ON programs_publications USING btree (idpublication);


--
-- TOC entry 2657 (class 1259 OID 61866)
-- Dependencies: 211
-- Name: i_fk_programs_traduction_field; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_traduction_field ON programs_translations USING btree (idfgroup);


--
-- TOC entry 2658 (class 1259 OID 61867)
-- Dependencies: 211
-- Name: i_fk_programs_traduction_progr; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_traduction_progr ON programs_translations USING btree (idprog);


--
-- TOC entry 2659 (class 1259 OID 61868)
-- Dependencies: 211
-- Name: i_fk_programs_traduction_tradu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_traduction_tradu ON programs_translations USING btree (id);


--
-- TOC entry 2663 (class 1259 OID 61869)
-- Dependencies: 212
-- Name: i_fk_programs_versions_program; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_versions_program ON programs_versions USING btree (idprog);


--
-- TOC entry 2664 (class 1259 OID 61870)
-- Dependencies: 212
-- Name: i_fk_programs_versions_version; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_programs_versions_version ON programs_versions USING btree (idversion);


--
-- TOC entry 2667 (class 1259 OID 61871)
-- Dependencies: 216
-- Name: i_fk_publications_menus_eleme1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_publications_menus_eleme1 ON publications_menus_elements USING btree (idmenu);


--
-- TOC entry 2668 (class 1259 OID 61872)
-- Dependencies: 216
-- Name: i_fk_publications_menus_elemen; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_publications_menus_elemen ON publications_menus_elements USING btree (idpublication);


--
-- TOC entry 2561 (class 1259 OID 61873)
-- Dependencies: 141
-- Name: i_fk_publications_organization; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_publications_organization ON publications USING btree (idorganization);


--
-- TOC entry 2564 (class 1259 OID 61874)
-- Dependencies: 142
-- Name: i_fk_ressources_access_compone; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_ressources_access_compone ON ressources_access USING btree (idcomponent);


--
-- TOC entry 2565 (class 1259 OID 61875)
-- Dependencies: 142
-- Name: i_fk_ressources_access_users; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_ressources_access_users ON ressources_access USING btree (iduser);


--
-- TOC entry 2706 (class 1259 OID 61876)
-- Dependencies: 250
-- Name: i_fk_users_fields_group_field1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_users_fields_group_field1 ON users_fields_group_fields USING btree (idgroup);


--
-- TOC entry 2707 (class 1259 OID 61877)
-- Dependencies: 250
-- Name: i_fk_users_fields_group_fields; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_users_fields_group_fields ON users_fields_group_fields USING btree (idfield);


--
-- TOC entry 2710 (class 1259 OID 61878)
-- Dependencies: 253
-- Name: i_fk_users_fields_value_users; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_users_fields_value_users ON users_fields_value USING btree (iduser);


--
-- TOC entry 2711 (class 1259 OID 61879)
-- Dependencies: 253
-- Name: i_fk_users_fields_value_users_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_users_fields_value_users_ ON users_fields_value USING btree (idfield);


--
-- TOC entry 2570 (class 1259 OID 61880)
-- Dependencies: 144
-- Name: i_fk_users_users_fields_group; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_users_users_fields_group ON users USING btree (idgroup);


--
-- TOC entry 2671 (class 1259 OID 61881)
-- Dependencies: 217
-- Name: i_fk_views_publications; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_views_publications ON publications_views USING btree (idpublication);


--
-- TOC entry 2586 (class 1259 OID 61882)
-- Dependencies: 154
-- Name: textsearch2_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX textsearch2_idx ON chapters_translations USING gin (textsearchable_index_col);


--
-- TOC entry 2662 (class 1259 OID 61883)
-- Dependencies: 211
-- Name: textsearch_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX textsearch_idx ON programs_translations USING gin (textsearchable_index_col);


--
-- TOC entry 2743 (class 2620 OID 61991)
-- Dependencies: 211
-- Name: tsvectorupdate; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tsvectorupdate
    BEFORE INSERT OR UPDATE ON programs_translations
    FOR EACH ROW
    EXECUTE PROCEDURE tsvector_update_trigger('textsearchable_index_col', 'pg_catalog.french', 'value');


--
-- TOC entry 2741 (class 2620 OID 61992)
-- Dependencies: 154
-- Name: tsvectorupdate_chapters; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tsvectorupdate_chapters
    BEFORE INSERT OR UPDATE ON chapters_translations
    FOR EACH ROW
    EXECUTE PROCEDURE tsvector_update_trigger('textsearchable_index_col', 'pg_catalog.french', 'value');


--
-- TOC entry 2742 (class 2620 OID 61993)
-- Dependencies: 176
-- Name: tsvectorupdate_kb; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tsvectorupdate_kb
    BEFORE INSERT OR UPDATE ON kb_items_translations
    FOR EACH ROW
    EXECUTE PROCEDURE tsvector_update_trigger('textsearchable_index_col', 'pg_catalog.french', 'value');


--
-- TOC entry 2726 (class 2606 OID 61884)
-- Dependencies: 150 2577 148
-- Name: fk_billings_others_billings; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billings_others
    ADD CONSTRAINT fk_billings_others_billings FOREIGN KEY (idbilling) REFERENCES billings(idbilling);


--
-- TOC entry 2724 (class 2606 OID 61889)
-- Dependencies: 140 148 2559
-- Name: fk_billings_productions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billings
    ADD CONSTRAINT fk_billings_productions FOREIGN KEY (idproduction) REFERENCES productions(idproduction);


--
-- TOC entry 2725 (class 2606 OID 61894)
-- Dependencies: 218 2674 148
-- Name: fk_billings_tarifs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billings
    ADD CONSTRAINT fk_billings_tarifs FOREIGN KEY (idrate) REFERENCES rates(idrate);


--
-- TOC entry 2728 (class 2606 OID 61899)
-- Dependencies: 171 140 2559
-- Name: fk_groups_productions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT fk_groups_productions FOREIGN KEY (idproduction) REFERENCES productions(idproduction);


--
-- TOC entry 2729 (class 2606 OID 61904)
-- Dependencies: 2611 171 173
-- Name: fk_groups_programs_groups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_programs
    ADD CONSTRAINT fk_groups_programs_groups FOREIGN KEY (idgroup) REFERENCES groups(idgroup);


--
-- TOC entry 2730 (class 2606 OID 61909)
-- Dependencies: 2592 173 156
-- Name: fk_groups_programs_programs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_programs
    ADD CONSTRAINT fk_groups_programs_programs FOREIGN KEY (idprog) REFERENCES programs(idprog);


--
-- TOC entry 2731 (class 2606 OID 61914)
-- Dependencies: 2626 190 191
-- Name: fk_organizations_contacts_organi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY organizations_contacts
    ADD CONSTRAINT fk_organizations_contacts_organi FOREIGN KEY (idorganization) REFERENCES organizations(idorganization);


--
-- TOC entry 2727 (class 2606 OID 61919)
-- Dependencies: 141 2562 155
-- Name: fk_playlists_publications; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY playlists
    ADD CONSTRAINT fk_playlists_publications FOREIGN KEY (idpublication) REFERENCES publications(idpublication);


--
-- TOC entry 2720 (class 2606 OID 61924)
-- Dependencies: 140 190 2626
-- Name: fk_productions_organizations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productions
    ADD CONSTRAINT fk_productions_organizations FOREIGN KEY (idorganization) REFERENCES organizations(idorganization);


--
-- TOC entry 2721 (class 2606 OID 61929)
-- Dependencies: 2596 140 158
-- Name: fk_productions_programs_fields_g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productions
    ADD CONSTRAINT fk_productions_programs_fields_g FOREIGN KEY (idgroup) REFERENCES programs_fields_group(idgroup);


--
-- TOC entry 2732 (class 2606 OID 61934)
-- Dependencies: 201 2559 140
-- Name: fk_productions_publications_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productions_publications
    ADD CONSTRAINT fk_productions_publications_prod FOREIGN KEY (idproduction) REFERENCES productions(idproduction);


--
-- TOC entry 2733 (class 2606 OID 61939)
-- Dependencies: 201 2562 141
-- Name: fk_productions_publications_publ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productions_publications
    ADD CONSTRAINT fk_productions_publications_publ FOREIGN KEY (idpublication) REFERENCES publications(idpublication);


--
-- TOC entry 2734 (class 2606 OID 61944)
-- Dependencies: 2559 202 140
-- Name: fk_productions_tarifs_production; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productions_rate
    ADD CONSTRAINT fk_productions_tarifs_production FOREIGN KEY (idproduction) REFERENCES productions(idproduction);


--
-- TOC entry 2735 (class 2606 OID 61949)
-- Dependencies: 2674 202 218
-- Name: fk_productions_tarifs_tarifs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productions_rate
    ADD CONSTRAINT fk_productions_tarifs_tarifs FOREIGN KEY (idrate) REFERENCES rates(idrate);


--
-- TOC entry 2722 (class 2606 OID 61954)
-- Dependencies: 190 141 2626
-- Name: fk_publications_organizations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT fk_publications_organizations FOREIGN KEY (idorganization) REFERENCES organizations(idorganization);


--
-- TOC entry 2737 (class 2606 OID 61959)
-- Dependencies: 2704 250 249
-- Name: fk_users_fields_group_fields_us1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_fields_group_fields
    ADD CONSTRAINT fk_users_fields_group_fields_us1 FOREIGN KEY (idgroup) REFERENCES users_fields_group(idgroup);


--
-- TOC entry 2738 (class 2606 OID 61964)
-- Dependencies: 2702 250 248
-- Name: fk_users_fields_group_fields_use; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_fields_group_fields
    ADD CONSTRAINT fk_users_fields_group_fields_use FOREIGN KEY (idfield) REFERENCES users_fields(idfield);


--
-- TOC entry 2739 (class 2606 OID 61969)
-- Dependencies: 2571 144 253
-- Name: fk_users_fields_value_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_fields_value
    ADD CONSTRAINT fk_users_fields_value_users FOREIGN KEY (iduser) REFERENCES users(iduser);


--
-- TOC entry 2740 (class 2606 OID 61974)
-- Dependencies: 248 253 2702
-- Name: fk_users_fields_value_users_fiel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_fields_value
    ADD CONSTRAINT fk_users_fields_value_users_fiel FOREIGN KEY (idfield) REFERENCES users_fields(idfield);


--
-- TOC entry 2723 (class 2606 OID 61979)
-- Dependencies: 2704 144 249
-- Name: fk_users_users_fields_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_users_fields_group FOREIGN KEY (idgroup) REFERENCES users_fields_group(idgroup);


--
-- TOC entry 2736 (class 2606 OID 61984)
-- Dependencies: 2562 217 141
-- Name: fk_views_publications; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publications_views
    ADD CONSTRAINT fk_views_publications FOREIGN KEY (idpublication) REFERENCES publications(idpublication);


--
-- TOC entry 2748 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-02-23 15:46:57

--
-- PostgreSQL database dump complete
--

