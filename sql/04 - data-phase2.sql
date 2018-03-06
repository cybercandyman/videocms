--
-- PostgreSQL database dump
--

-- Started on 2012-02-23 16:20:30

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 326
-- Name: panes_idpane_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('panes_idpane_seq', 48, true);


--
-- TOC entry 2364 (class 0 OID 155704)
-- Dependencies: 327
-- Data for Name: panes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO panes VALUES (1, 'default', 'fields', 1, '1', '', '1');
INSERT INTO panes VALUES (2, 'more description', 'fields', 1, '1', '', '2');
INSERT INTO panes VALUES (3, 'rights', 'fields', 1, '1', '', '3');
INSERT INTO panes VALUES (46, 'Level1', 'fields', 1, '5', NULL, '1');
INSERT INTO panes VALUES (47, 'Level2', 'fields', 1, '5', NULL, '2');
INSERT INTO panes VALUES (48, 'Level3', 'fields', 1, '5', NULL, '3');


-- Completed on 2012-02-23 16:20:30

--
-- PostgreSQL database dump complete
--

