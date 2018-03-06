--
-- PostgreSQL database dump
--

-- Started on 2012-02-23 15:53:10

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 266
-- Name: enum_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_action_id_seq', 6, true);


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 268
-- Name: enum_audience_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_audience_id_seq', 5, true);


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 272
-- Name: enum_class2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_class2_id_seq', 37, true);


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 270
-- Name: enum_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_class_id_seq', 8, true);


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 274
-- Name: enum_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_countries_id_seq', 280, true);


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 276
-- Name: enum_domaine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_domaine_id_seq', 19, true);


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 278
-- Name: enum_format_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_format_id_seq', 3, true);


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 280
-- Name: enum_function_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_function_id_seq', 12, true);


--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 283
-- Name: enum_genre_audiovisual_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_genre_audiovisual_id_seq', 5, true);


--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 284
-- Name: enum_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_genre_id_seq', 20, true);


--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 286
-- Name: enum_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_language_id_seq', 11, true);


--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 290
-- Name: enum_lieu2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_lieu2_id_seq', 132, true);


--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 291
-- Name: enum_lieu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_lieu_id_seq', 7, true);


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 293
-- Name: enum_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_media_id_seq', 3, true);


--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 295
-- Name: enum_medium_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_medium_id_seq', 10, true);


--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 298
-- Name: enum_organization2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_organization2_id_seq', 33, true);


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 299
-- Name: enum_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_organization_id_seq', 6, true);


--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 302
-- Name: enum_personne2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_personne2_id_seq', 23, true);


--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 303
-- Name: enum_personne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_personne_id_seq', 16, true);


--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 305
-- Name: enum_pointzoom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_pointzoom_id_seq', 6, true);


--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 307
-- Name: enum_profession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_profession_id_seq', 6, true);


--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 310
-- Name: enum_public2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_public2_id_seq', 21, true);


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 311
-- Name: enum_public_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_public_id_seq', 5, true);


--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 313
-- Name: enum_scoring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_scoring_id_seq', 5, true);


--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 315
-- Name: enum_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_sector_id_seq', 2, true);


--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 317
-- Name: enum_sublanguage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_sublanguage_id_seq', 11, true);


--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 320
-- Name: enum_theme2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_theme2_id_seq', 43, true);


--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 321
-- Name: enum_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_theme_id_seq', 8, true);


--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 323
-- Name: enum_type1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_type1_id_seq', 18, true);


--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 325
-- Name: enum_type2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enum_type2_id_seq', 14, true);


--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 169
-- Name: extra_components_panel_idcomp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('extra_components_panel_idcomp_seq', 29, true);


--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 170
-- Name: fields_idfield_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fields_idfield_seq', 117, true);


--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 179
-- Name: kb_items_type_idtype_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kb_items_type_idtype_seq', 4, true);


--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 183
-- Name: locales_idlocale_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('locales_idlocale_seq', 185, true);


--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 189
-- Name: menus_elements_idmenu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menus_elements_idmenu_seq', 79, true);


--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 195
-- Name: p_field_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('p_field_category_id_seq', 27, true);


--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 204
-- Name: programs_fields_group_fields_idfgroup_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('programs_fields_group_fields_idfgroup_seq', 109, true);


--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 205
-- Name: programs_fields_group_idgroup_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('programs_fields_group_idgroup_seq', 17, true);


--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 237
-- Name: services_types_idtype_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('services_types_idtype_seq', 6, true);
SELECT pg_catalog.setval('ressources_access_idaccess_seq', 1, true);


--
-- TOC entry 2429 (class 0 OID 63434)
-- Dependencies: 265
-- Data for Name: enum_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_action VALUES (2, 'question', 3, NULL);
INSERT INTO enum_action VALUES (3, 'réponse', 3, NULL);
INSERT INTO enum_action VALUES (4, 'commentaire', 3, NULL);
INSERT INTO enum_action VALUES (1, 'exposé', 3, NULL);


--
-- TOC entry 2430 (class 0 OID 63442)
-- Dependencies: 267
-- Data for Name: enum_audience; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_audience VALUES (2, NULL, 0, 'Grand public');
INSERT INTO enum_audience VALUES (1, NULL, 0, 'Professionnels');
INSERT INTO enum_audience VALUES (4, NULL, 0, 'Experts');
INSERT INTO enum_audience VALUES (5, NULL, 0, 'Agents');


--
-- TOC entry 2431 (class 0 OID 63450)
-- Dependencies: 269
-- Data for Name: enum_class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_class VALUES (1, 'personne', 0, NULL);
INSERT INTO enum_class VALUES (2, 'organisation', 0, NULL);
INSERT INTO enum_class VALUES (3, 'action', 0, NULL);
INSERT INTO enum_class VALUES (5, 'lieu', 0, NULL);
INSERT INTO enum_class VALUES (6, 'document', 0, NULL);
INSERT INTO enum_class VALUES (7, 'statistiques', 0, NULL);
INSERT INTO enum_class VALUES (4, 'notation', 0, NULL);


--
-- TOC entry 2432 (class 0 OID 63458)
-- Dependencies: 271
-- Data for Name: enum_class2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_class2 VALUES (11, 'excellent', 4, NULL);
INSERT INTO enum_class2 VALUES (12, 'bon', 4, NULL);
INSERT INTO enum_class2 VALUES (13, 'moyen', 4, NULL);
INSERT INTO enum_class2 VALUES (14, 'question', 3, NULL);
INSERT INTO enum_class2 VALUES (16, 'réponse', 3, NULL);
INSERT INTO enum_class2 VALUES (17, 'commentaire', 3, NULL);
INSERT INTO enum_class2 VALUES (19, 'médiocre', 4, NULL);
INSERT INTO enum_class2 VALUES (20, 'mauvais', 4, NULL);
INSERT INTO enum_class2 VALUES (15, 'exposé', 3, NULL);
INSERT INTO enum_class2 VALUES (21, 'presentation', 6, NULL);
INSERT INTO enum_class2 VALUES (22, 'text', 6, NULL);
INSERT INTO enum_class2 VALUES (23, 'video', 6, NULL);
INSERT INTO enum_class2 VALUES (24, 'audio', 6, NULL);
INSERT INTO enum_class2 VALUES (25, 'administration publique', 2, NULL);
INSERT INTO enum_class2 VALUES (27, 'société de droit privé', 2, NULL);
INSERT INTO enum_class2 VALUES (28, 'membre d''un gouvernement', 1, NULL);
INSERT INTO enum_class2 VALUES (29, 'fonctionnaire', 1, NULL);
INSERT INTO enum_class2 VALUES (30, 'journaliste', 1, NULL);
INSERT INTO enum_class2 VALUES (31, 'expert', 1, NULL);
INSERT INTO enum_class2 VALUES (32, 'membre de la société civile', 1, NULL);
INSERT INTO enum_class2 VALUES (33, 'privé', 5, NULL);
INSERT INTO enum_class2 VALUES (34, 'public', 5, NULL);
INSERT INTO enum_class2 VALUES (35, 'public', 5, NULL);
INSERT INTO enum_class2 VALUES (26, 'non gouvernemental', 2, NULL);
INSERT INTO enum_class2 VALUES (36, 'source publique', 7, NULL);
INSERT INTO enum_class2 VALUES (37, 'source privée', 7, NULL);


--
-- TOC entry 2433 (class 0 OID 63466)
-- Dependencies: 273
-- Data for Name: enum_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_countries VALUES (1, NULL, NULL, 'LIBCOG');
INSERT INTO enum_countries VALUES (2, NULL, NULL, 'FRANCE');
INSERT INTO enum_countries VALUES (3, NULL, NULL, 'GUADELOUPE');
INSERT INTO enum_countries VALUES (4, NULL, NULL, 'GUYANE');
INSERT INTO enum_countries VALUES (5, NULL, NULL, 'MARTINIQUE');
INSERT INTO enum_countries VALUES (6, NULL, NULL, 'NOUVELLE-CALEDONIE');
INSERT INTO enum_countries VALUES (7, NULL, NULL, 'POLYNESIE FRANCAISE');
INSERT INTO enum_countries VALUES (8, NULL, NULL, 'LA REUNION');
INSERT INTO enum_countries VALUES (9, NULL, NULL, 'SAINT-PIERRE-ET-MIQUELON');
INSERT INTO enum_countries VALUES (10, NULL, NULL, 'TERRES AUSTRALES FRANCAISES');
INSERT INTO enum_countries VALUES (11, NULL, NULL, 'WALLIS-ET-FUTUNA');
INSERT INTO enum_countries VALUES (12, NULL, NULL, 'MAYOTTE');
INSERT INTO enum_countries VALUES (13, NULL, NULL, 'SAINT-BARTHELEMY');
INSERT INTO enum_countries VALUES (14, NULL, NULL, 'SAINT-MARTIN');
INSERT INTO enum_countries VALUES (15, NULL, NULL, 'ÀLE CLIPPERTON');
INSERT INTO enum_countries VALUES (16, NULL, NULL, 'DANEMARK');
INSERT INTO enum_countries VALUES (17, NULL, NULL, 'FEROE (ILES)');
INSERT INTO enum_countries VALUES (18, NULL, NULL, 'ISLANDE');
INSERT INTO enum_countries VALUES (19, NULL, NULL, 'BOUVET (ILE)');
INSERT INTO enum_countries VALUES (20, NULL, NULL, 'NORVEGE');
INSERT INTO enum_countries VALUES (21, NULL, NULL, 'SVALBARD et ILE JAN MAYEN');
INSERT INTO enum_countries VALUES (22, NULL, NULL, 'SUEDE');
INSERT INTO enum_countries VALUES (23, NULL, NULL, 'FINLANDE');
INSERT INTO enum_countries VALUES (24, NULL, NULL, 'ESTONIE');
INSERT INTO enum_countries VALUES (25, NULL, NULL, 'LETTONIE');
INSERT INTO enum_countries VALUES (26, NULL, NULL, 'LITUANIE');
INSERT INTO enum_countries VALUES (27, NULL, NULL, 'ALLEMAGNE');
INSERT INTO enum_countries VALUES (28, NULL, NULL, 'AUTRICHE');
INSERT INTO enum_countries VALUES (29, NULL, NULL, 'BULGARIE');
INSERT INTO enum_countries VALUES (30, NULL, NULL, 'HONGRIE');
INSERT INTO enum_countries VALUES (31, NULL, NULL, 'LIECHTENSTEIN');
INSERT INTO enum_countries VALUES (32, NULL, NULL, 'ROUMANIE');
INSERT INTO enum_countries VALUES (33, NULL, NULL, 'TCHECOSLOVAQUIE');
INSERT INTO enum_countries VALUES (34, NULL, NULL, 'TCHEQUE (REPUBLIQUE)');
INSERT INTO enum_countries VALUES (35, NULL, NULL, 'SLOVAQUIE');
INSERT INTO enum_countries VALUES (36, NULL, NULL, 'BOSNIE-HERZEGOVINE');
INSERT INTO enum_countries VALUES (37, NULL, NULL, 'CROATIE');
INSERT INTO enum_countries VALUES (38, NULL, NULL, 'MONTENEGRO');
INSERT INTO enum_countries VALUES (39, NULL, NULL, 'SERBIE');
INSERT INTO enum_countries VALUES (40, NULL, NULL, 'POLOGNE');
INSERT INTO enum_countries VALUES (41, NULL, NULL, 'RUSSIE');
INSERT INTO enum_countries VALUES (42, NULL, NULL, 'TURQUIE D''EUROPE');
INSERT INTO enum_countries VALUES (43, NULL, NULL, 'ALBANIE');
INSERT INTO enum_countries VALUES (44, NULL, NULL, 'GRECE');
INSERT INTO enum_countries VALUES (45, NULL, NULL, 'ITALIE');
INSERT INTO enum_countries VALUES (46, NULL, NULL, 'SAINT-MARIN');
INSERT INTO enum_countries VALUES (47, NULL, NULL, 'VATICAN, ou SAINT-SIEGE');
INSERT INTO enum_countries VALUES (48, NULL, NULL, 'ANDORRE');
INSERT INTO enum_countries VALUES (49, NULL, NULL, 'BELGIQUE');
INSERT INTO enum_countries VALUES (50, NULL, NULL, 'ROYAUME-UNI');
INSERT INTO enum_countries VALUES (51, NULL, NULL, 'JERSEY');
INSERT INTO enum_countries VALUES (52, NULL, NULL, 'GUERNESEY');
INSERT INTO enum_countries VALUES (53, NULL, NULL, 'MAN (ILE)');
INSERT INTO enum_countries VALUES (54, NULL, NULL, 'GIBRALTAR');
INSERT INTO enum_countries VALUES (55, NULL, NULL, 'ESPAGNE');
INSERT INTO enum_countries VALUES (56, NULL, NULL, 'PAYS-BAS');
INSERT INTO enum_countries VALUES (57, NULL, NULL, 'IRLANDE, ou EIRE');
INSERT INTO enum_countries VALUES (58, NULL, NULL, 'LUXEMBOURG');
INSERT INTO enum_countries VALUES (59, NULL, NULL, 'MONACO');
INSERT INTO enum_countries VALUES (60, NULL, NULL, 'PORTUGAL');
INSERT INTO enum_countries VALUES (61, NULL, NULL, 'SUISSE');
INSERT INTO enum_countries VALUES (62, NULL, NULL, 'REPUBLIQUE DEMOCRATIQUE ALLEMANDE');
INSERT INTO enum_countries VALUES (63, NULL, NULL, 'REPUBLIQUE FEDERALE D''ALLEMAGNE');
INSERT INTO enum_countries VALUES (64, NULL, NULL, 'MALTE');
INSERT INTO enum_countries VALUES (65, NULL, NULL, 'SLOVENIE');
INSERT INTO enum_countries VALUES (66, NULL, NULL, 'BIELORUSSIE');
INSERT INTO enum_countries VALUES (67, NULL, NULL, 'MOLDAVIE');
INSERT INTO enum_countries VALUES (68, NULL, NULL, 'UKRAINE');
INSERT INTO enum_countries VALUES (69, NULL, NULL, 'EX-REPUBLIQUE YOUGOSLAVE DE MACEDOINE');
INSERT INTO enum_countries VALUES (70, NULL, NULL, 'KOSOVO');
INSERT INTO enum_countries VALUES (71, NULL, NULL, 'ARABIE SAOUDITE');
INSERT INTO enum_countries VALUES (72, NULL, NULL, 'YEMEN (REPUBLIQUE ARABE DU)');
INSERT INTO enum_countries VALUES (73, NULL, NULL, 'IRAQ');
INSERT INTO enum_countries VALUES (74, NULL, NULL, 'IRAN');
INSERT INTO enum_countries VALUES (75, NULL, NULL, 'LIBAN');
INSERT INTO enum_countries VALUES (76, NULL, NULL, 'SYRIE');
INSERT INTO enum_countries VALUES (77, NULL, NULL, 'ISRAEL');
INSERT INTO enum_countries VALUES (78, NULL, NULL, 'TURQUIE');
INSERT INTO enum_countries VALUES (79, NULL, NULL, 'SIBERIE');
INSERT INTO enum_countries VALUES (80, NULL, NULL, 'TURKESTAN RUSSE');
INSERT INTO enum_countries VALUES (81, NULL, NULL, 'KAMTCHATKA');
INSERT INTO enum_countries VALUES (82, NULL, NULL, 'AFGHANISTAN');
INSERT INTO enum_countries VALUES (83, NULL, NULL, 'PAKISTAN');
INSERT INTO enum_countries VALUES (84, NULL, NULL, 'BHOUTAN');
INSERT INTO enum_countries VALUES (85, NULL, NULL, 'NEPAL');
INSERT INTO enum_countries VALUES (86, NULL, NULL, 'CHINE');
INSERT INTO enum_countries VALUES (87, NULL, NULL, 'JAPON');
INSERT INTO enum_countries VALUES (88, NULL, NULL, 'MANDCHOURIE');
INSERT INTO enum_countries VALUES (89, NULL, NULL, 'THAILANDE');
INSERT INTO enum_countries VALUES (90, NULL, NULL, 'PHILIPPINES');
INSERT INTO enum_countries VALUES (91, NULL, NULL, 'POSSESSIONS BRITANNIQUES AU PROCHE-ORIENT');
INSERT INTO enum_countries VALUES (92, NULL, NULL, 'JORDANIE');
INSERT INTO enum_countries VALUES (93, NULL, NULL, 'GOA');
INSERT INTO enum_countries VALUES (94, NULL, NULL, 'INDE');
INSERT INTO enum_countries VALUES (95, NULL, NULL, 'BIRMANIE');
INSERT INTO enum_countries VALUES (96, NULL, NULL, 'BRUNEI');
INSERT INTO enum_countries VALUES (97, NULL, NULL, 'SINGAPOUR');
INSERT INTO enum_countries VALUES (98, NULL, NULL, 'MALAISIE');
INSERT INTO enum_countries VALUES (99, NULL, NULL, 'ETATS MALAIS NON FEDERES');
INSERT INTO enum_countries VALUES (100, NULL, NULL, 'MALDIVES');
INSERT INTO enum_countries VALUES (101, NULL, NULL, 'HONG-KONG');
INSERT INTO enum_countries VALUES (102, NULL, NULL, 'INDONESIE');
INSERT INTO enum_countries VALUES (103, NULL, NULL, 'MACAO');
INSERT INTO enum_countries VALUES (104, NULL, NULL, 'YEMEN DEMOCRATIQUE');
INSERT INTO enum_countries VALUES (105, NULL, NULL, 'CAMBODGE');
INSERT INTO enum_countries VALUES (106, NULL, NULL, 'SRI LANKA');
INSERT INTO enum_countries VALUES (107, NULL, NULL, 'TAIWAN');
INSERT INTO enum_countries VALUES (108, NULL, NULL, 'COREE');
INSERT INTO enum_countries VALUES (109, NULL, NULL, 'COREE (REPUBLIQUE POPULAIRE DEMOCRATIQUE DE)');
INSERT INTO enum_countries VALUES (110, NULL, NULL, 'COREE (REPUBLIQUE DE)');
INSERT INTO enum_countries VALUES (111, NULL, NULL, 'KOWEIT');
INSERT INTO enum_countries VALUES (112, NULL, NULL, 'LAOS');
INSERT INTO enum_countries VALUES (113, NULL, NULL, 'MONGOLIE');
INSERT INTO enum_countries VALUES (114, NULL, NULL, 'VIET NAM');
INSERT INTO enum_countries VALUES (115, NULL, NULL, 'VIET NAM DU NORD');
INSERT INTO enum_countries VALUES (116, NULL, NULL, 'VIET NAM DU SUD');
INSERT INTO enum_countries VALUES (117, NULL, NULL, 'BANGLADESH');
INSERT INTO enum_countries VALUES (118, NULL, NULL, 'EMIRATS ARABES UNIS');
INSERT INTO enum_countries VALUES (119, NULL, NULL, 'QATAR');
INSERT INTO enum_countries VALUES (120, NULL, NULL, 'BAHREIN');
INSERT INTO enum_countries VALUES (121, NULL, NULL, 'OMAN');
INSERT INTO enum_countries VALUES (122, NULL, NULL, 'YEMEN');
INSERT INTO enum_countries VALUES (123, NULL, NULL, 'ARMENIE');
INSERT INTO enum_countries VALUES (124, NULL, NULL, 'AZERBAIDJAN');
INSERT INTO enum_countries VALUES (125, NULL, NULL, 'CHYPRE');
INSERT INTO enum_countries VALUES (126, NULL, NULL, 'GEORGIE');
INSERT INTO enum_countries VALUES (127, NULL, NULL, 'KAZAKHSTAN');
INSERT INTO enum_countries VALUES (128, NULL, NULL, 'KIRGHIZISTAN');
INSERT INTO enum_countries VALUES (129, NULL, NULL, 'OUZBEKISTAN');
INSERT INTO enum_countries VALUES (130, NULL, NULL, 'TADJIKISTAN');
INSERT INTO enum_countries VALUES (131, NULL, NULL, 'TURKMENISTAN');
INSERT INTO enum_countries VALUES (132, NULL, NULL, 'PALESTINE');
INSERT INTO enum_countries VALUES (133, NULL, NULL, 'TIMOR ORIENTAL');
INSERT INTO enum_countries VALUES (134, NULL, NULL, 'EGYPTE');
INSERT INTO enum_countries VALUES (135, NULL, NULL, 'LIBERIA');
INSERT INTO enum_countries VALUES (136, NULL, NULL, 'AFRIQUE DU SUD');
INSERT INTO enum_countries VALUES (137, NULL, NULL, 'GAMBIE');
INSERT INTO enum_countries VALUES (138, NULL, NULL, 'CAMEROUN ET TOGO');
INSERT INTO enum_countries VALUES (139, NULL, NULL, 'SAINTE-HELENE');
INSERT INTO enum_countries VALUES (140, NULL, NULL, 'SOUDAN ANGLO-EGYPTIEN, KENYA, OUGANDA');
INSERT INTO enum_countries VALUES (141, NULL, NULL, 'OCEAN INDIEN (TERRITOIRE BRITANNIQUE DE L'')');
INSERT INTO enum_countries VALUES (142, NULL, NULL, 'ZANZIBAR');
INSERT INTO enum_countries VALUES (143, NULL, NULL, 'TANZANIE');
INSERT INTO enum_countries VALUES (144, NULL, NULL, 'ZIMBABWE');
INSERT INTO enum_countries VALUES (145, NULL, NULL, 'NAMIBIE');
INSERT INTO enum_countries VALUES (146, NULL, NULL, 'CONGO (REPUBLIQUE DEMOCRATIQUE)');
INSERT INTO enum_countries VALUES (147, NULL, NULL, 'CANARIES (ILES)');
INSERT INTO enum_countries VALUES (148, NULL, NULL, 'PRESIDES');
INSERT INTO enum_countries VALUES (149, NULL, NULL, 'PROVINCES ESPAGNOLES D''AFRIQUE');
INSERT INTO enum_countries VALUES (150, NULL, NULL, 'GUINEE EQUATORIALE');
INSERT INTO enum_countries VALUES (151, NULL, NULL, 'ETHIOPIE');
INSERT INTO enum_countries VALUES (152, NULL, NULL, 'LIBYE');
INSERT INTO enum_countries VALUES (153, NULL, NULL, 'ERYTHREE');
INSERT INTO enum_countries VALUES (154, NULL, NULL, 'SOMALIE');
INSERT INTO enum_countries VALUES (155, NULL, NULL, 'ACORES, MADERE');
INSERT INTO enum_countries VALUES (156, NULL, NULL, 'ILES PORTUGAISES DE L''OCEAN INDIEN');
INSERT INTO enum_countries VALUES (157, NULL, NULL, 'BURUNDI');
INSERT INTO enum_countries VALUES (158, NULL, NULL, 'CAMEROUN');
INSERT INTO enum_countries VALUES (159, NULL, NULL, 'CENTRAFRICAINE (REPUBLIQUE)');
INSERT INTO enum_countries VALUES (160, NULL, NULL, 'CONGO');
INSERT INTO enum_countries VALUES (161, NULL, NULL, 'TANGER');
INSERT INTO enum_countries VALUES (162, NULL, NULL, 'COTE D''IVOIRE');
INSERT INTO enum_countries VALUES (163, NULL, NULL, 'BENIN');
INSERT INTO enum_countries VALUES (164, NULL, NULL, 'GABON');
INSERT INTO enum_countries VALUES (165, NULL, NULL, 'GHANA');
INSERT INTO enum_countries VALUES (166, NULL, NULL, 'GUINEE');
INSERT INTO enum_countries VALUES (167, NULL, NULL, 'BURKINA');
INSERT INTO enum_countries VALUES (168, NULL, NULL, 'KENYA');
INSERT INTO enum_countries VALUES (169, NULL, NULL, 'MADAGASCAR');
INSERT INTO enum_countries VALUES (170, NULL, NULL, 'MALAWI');
INSERT INTO enum_countries VALUES (171, NULL, NULL, 'MALI');
INSERT INTO enum_countries VALUES (172, NULL, NULL, 'MAURITANIE');
INSERT INTO enum_countries VALUES (173, NULL, NULL, 'NIGER');
INSERT INTO enum_countries VALUES (174, NULL, NULL, 'NIGERIA');
INSERT INTO enum_countries VALUES (175, NULL, NULL, 'OUGANDA');
INSERT INTO enum_countries VALUES (176, NULL, NULL, 'RWANDA');
INSERT INTO enum_countries VALUES (177, NULL, NULL, 'SENEGAL');
INSERT INTO enum_countries VALUES (178, NULL, NULL, 'SIERRA LEONE');
INSERT INTO enum_countries VALUES (179, NULL, NULL, 'SOUDAN');
INSERT INTO enum_countries VALUES (180, NULL, NULL, 'TCHAD');
INSERT INTO enum_countries VALUES (181, NULL, NULL, 'TOGO');
INSERT INTO enum_countries VALUES (182, NULL, NULL, 'ZAMBIE');
INSERT INTO enum_countries VALUES (183, NULL, NULL, 'BOTSWANA');
INSERT INTO enum_countries VALUES (184, NULL, NULL, 'LESOTHO');
INSERT INTO enum_countries VALUES (185, NULL, NULL, 'MAROC');
INSERT INTO enum_countries VALUES (186, NULL, NULL, 'TUNISIE');
INSERT INTO enum_countries VALUES (187, NULL, NULL, 'ALGERIE');
INSERT INTO enum_countries VALUES (188, NULL, NULL, 'SAHARA OCCIDENTAL');
INSERT INTO enum_countries VALUES (189, NULL, NULL, 'MAURICE');
INSERT INTO enum_countries VALUES (190, NULL, NULL, 'SWAZILAND');
INSERT INTO enum_countries VALUES (191, NULL, NULL, 'GUINEE-BISSAU');
INSERT INTO enum_countries VALUES (192, NULL, NULL, 'MOZAMBIQUE');
INSERT INTO enum_countries VALUES (193, NULL, NULL, 'SAO TOME-ET-PRINCIPE');
INSERT INTO enum_countries VALUES (194, NULL, NULL, 'ANGOLA');
INSERT INTO enum_countries VALUES (195, NULL, NULL, 'CAP-VERT');
INSERT INTO enum_countries VALUES (196, NULL, NULL, 'COMORES');
INSERT INTO enum_countries VALUES (197, NULL, NULL, 'SEYCHELLES');
INSERT INTO enum_countries VALUES (198, NULL, NULL, 'DJIBOUTI');
INSERT INTO enum_countries VALUES (199, NULL, NULL, 'CANADA');
INSERT INTO enum_countries VALUES (200, NULL, NULL, 'TERRE-NEUVE');
INSERT INTO enum_countries VALUES (201, NULL, NULL, 'LABRADOR');
INSERT INTO enum_countries VALUES (202, NULL, NULL, 'ALASKA');
INSERT INTO enum_countries VALUES (203, NULL, NULL, 'ETATS-UNIS');
INSERT INTO enum_countries VALUES (204, NULL, NULL, 'MEXIQUE');
INSERT INTO enum_countries VALUES (205, NULL, NULL, 'COSTA RICA');
INSERT INTO enum_countries VALUES (206, NULL, NULL, 'CUBA');
INSERT INTO enum_countries VALUES (207, NULL, NULL, 'DOMINICAINE (REPUBLIQUE)');
INSERT INTO enum_countries VALUES (208, NULL, NULL, 'GUATEMALA');
INSERT INTO enum_countries VALUES (209, NULL, NULL, 'HAITI');
INSERT INTO enum_countries VALUES (210, NULL, NULL, 'HONDURAS');
INSERT INTO enum_countries VALUES (211, NULL, NULL, 'NICARAGUA');
INSERT INTO enum_countries VALUES (212, NULL, NULL, 'PANAMA');
INSERT INTO enum_countries VALUES (213, NULL, NULL, 'EL SALVADOR');
INSERT INTO enum_countries VALUES (214, NULL, NULL, 'ARGENTINE');
INSERT INTO enum_countries VALUES (215, NULL, NULL, 'BRESIL');
INSERT INTO enum_countries VALUES (216, NULL, NULL, 'CHILI');
INSERT INTO enum_countries VALUES (217, NULL, NULL, 'BOLIVIE');
INSERT INTO enum_countries VALUES (218, NULL, NULL, 'COLOMBIE');
INSERT INTO enum_countries VALUES (219, NULL, NULL, 'EQUATEUR');
INSERT INTO enum_countries VALUES (220, NULL, NULL, 'PARAGUAY');
INSERT INTO enum_countries VALUES (221, NULL, NULL, 'PEROU');
INSERT INTO enum_countries VALUES (222, NULL, NULL, 'URUGUAY');
INSERT INTO enum_countries VALUES (223, NULL, NULL, 'VENEZUELA');
INSERT INTO enum_countries VALUES (224, NULL, NULL, 'ANGUILLA');
INSERT INTO enum_countries VALUES (225, NULL, NULL, 'BERMUDES');
INSERT INTO enum_countries VALUES (226, NULL, NULL, 'CAIMANES (ILES)');
INSERT INTO enum_countries VALUES (227, NULL, NULL, 'MONTSERRAT');
INSERT INTO enum_countries VALUES (228, NULL, NULL, 'TERRITOIRES DU ROYAUME-UNI AUX ANTILLES');
INSERT INTO enum_countries VALUES (229, NULL, NULL, 'TURKS ET CAIQUES (ILES)');
INSERT INTO enum_countries VALUES (230, NULL, NULL, 'VIERGES BRITANNIQUES (ILES)');
INSERT INTO enum_countries VALUES (231, NULL, NULL, 'JAMAIQUE');
INSERT INTO enum_countries VALUES (232, NULL, NULL, 'MALOUINES, OU FALKLAND (ILES)');
INSERT INTO enum_countries VALUES (233, NULL, NULL, 'TERR. DU ROYAUME-UNI DANS L''ATLANTIQUE SUD');
INSERT INTO enum_countries VALUES (234, NULL, NULL, 'GEORGIE DU SUD ET LES ILES SANDWICH DU SUD');
INSERT INTO enum_countries VALUES (235, NULL, NULL, 'GUYANA');
INSERT INTO enum_countries VALUES (236, NULL, NULL, 'BELIZE');
INSERT INTO enum_countries VALUES (237, NULL, NULL, 'GROENLAND');
INSERT INTO enum_countries VALUES (238, NULL, NULL, 'ANTILLES NEERLANDAISES');
INSERT INTO enum_countries VALUES (239, NULL, NULL, 'ARUBA');
INSERT INTO enum_countries VALUES (240, NULL, NULL, 'TERRITOIRE DES PAYS-BAS');
INSERT INTO enum_countries VALUES (241, NULL, NULL, 'PORTO RICO');
INSERT INTO enum_countries VALUES (242, NULL, NULL, 'TERR. DES ETATS-UNIS D''AMERIQUE EN AMERIQUE');
INSERT INTO enum_countries VALUES (243, NULL, NULL, 'VIERGES DES ETATS-UNIS (ILES)');
INSERT INTO enum_countries VALUES (244, NULL, NULL, 'TRINITE-ET-TOBAGO');
INSERT INTO enum_countries VALUES (245, NULL, NULL, 'BARBADE');
INSERT INTO enum_countries VALUES (246, NULL, NULL, 'GRENADE');
INSERT INTO enum_countries VALUES (247, NULL, NULL, 'BAHAMAS');
INSERT INTO enum_countries VALUES (248, NULL, NULL, 'SURINAME');
INSERT INTO enum_countries VALUES (249, NULL, NULL, 'DOMINIQUE');
INSERT INTO enum_countries VALUES (250, NULL, NULL, 'SAINTE-LUCIE');
INSERT INTO enum_countries VALUES (251, NULL, NULL, 'SAINT-VINCENT-ET-LES GRENADINES');
INSERT INTO enum_countries VALUES (252, NULL, NULL, 'ANTIGUA-ET-BARBUDA');
INSERT INTO enum_countries VALUES (253, NULL, NULL, 'SAINT-CHRISTOPHE-ET-NIEVES');
INSERT INTO enum_countries VALUES (254, NULL, NULL, 'AUSTRALIE');
INSERT INTO enum_countries VALUES (255, NULL, NULL, 'CHRISTMAS (ILE)');
INSERT INTO enum_countries VALUES (256, NULL, NULL, 'COCOS ou KEELING (ILES)');
INSERT INTO enum_countries VALUES (257, NULL, NULL, 'HEARD ET MACDONALD (ILES)');
INSERT INTO enum_countries VALUES (258, NULL, NULL, 'NORFOLK (ILE)');
INSERT INTO enum_countries VALUES (259, NULL, NULL, 'COOK (ILES)');
INSERT INTO enum_countries VALUES (260, NULL, NULL, 'NIUE');
INSERT INTO enum_countries VALUES (261, NULL, NULL, 'NOUVELLE-ZELANDE');
INSERT INTO enum_countries VALUES (262, NULL, NULL, 'TOKELAU');
INSERT INTO enum_countries VALUES (263, NULL, NULL, 'PITCAIRN (ILE)');
INSERT INTO enum_countries VALUES (264, NULL, NULL, 'HAWAII (ILES)');
INSERT INTO enum_countries VALUES (265, NULL, NULL, 'GUAM');
INSERT INTO enum_countries VALUES (266, NULL, NULL, 'MARIANNES DU NORD (ILES)');
INSERT INTO enum_countries VALUES (267, NULL, NULL, 'SAMOA AMERICAINES');
INSERT INTO enum_countries VALUES (268, NULL, NULL, 'TERR. DES ETATS-UNIS D''AMERIQUE EN OCEANIE');
INSERT INTO enum_countries VALUES (269, NULL, NULL, 'SAMOA OCCIDENTALES');
INSERT INTO enum_countries VALUES (270, NULL, NULL, 'NAURU');
INSERT INTO enum_countries VALUES (271, NULL, NULL, 'FIDJI');
INSERT INTO enum_countries VALUES (272, NULL, NULL, 'TONGA');
INSERT INTO enum_countries VALUES (273, NULL, NULL, 'PAPOUASIE-NOUVELLE-GUINEE');
INSERT INTO enum_countries VALUES (274, NULL, NULL, 'TUVALU');
INSERT INTO enum_countries VALUES (275, NULL, NULL, 'SALOMON (ILES)');
INSERT INTO enum_countries VALUES (276, NULL, NULL, 'KIRIBATI');
INSERT INTO enum_countries VALUES (277, NULL, NULL, 'VANUATU');
INSERT INTO enum_countries VALUES (278, NULL, NULL, 'MARSHALL (ILES)');
INSERT INTO enum_countries VALUES (279, NULL, NULL, 'MICRONESIE (ETATS FEDERES DE)');
INSERT INTO enum_countries VALUES (280, NULL, NULL, 'PALAOS (ILES)');


--
-- TOC entry 2434 (class 0 OID 63474)
-- Dependencies: 275
-- Data for Name: enum_domaine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_domaine VALUES (1, 'Agriculture', NULL, '');
INSERT INTO enum_domaine VALUES (3, 'Communication', NULL, '');
INSERT INTO enum_domaine VALUES (4, 'Culture', NULL, '');
INSERT INTO enum_domaine VALUES (5, 'Défense', NULL, '');
INSERT INTO enum_domaine VALUES (7, 'Education', NULL, '');
INSERT INTO enum_domaine VALUES (8, 'Emploi', NULL, '');
INSERT INTO enum_domaine VALUES (9, 'Environnement', NULL, '');
INSERT INTO enum_domaine VALUES (10, 'Etat', NULL, '');
INSERT INTO enum_domaine VALUES (11, 'Europe', NULL, '');
INSERT INTO enum_domaine VALUES (12, 'Justice', NULL, '');
INSERT INTO enum_domaine VALUES (14, 'Santé', NULL, '');
INSERT INTO enum_domaine VALUES (15, 'Sécurité', NULL, '');
INSERT INTO enum_domaine VALUES (17, 'Société', NULL, '');
INSERT INTO enum_domaine VALUES (18, 'Sport', NULL, '');
INSERT INTO enum_domaine VALUES (13, 'Politique étrangère', NULL, '');
INSERT INTO enum_domaine VALUES (16, 'Social', NULL, '');
INSERT INTO enum_domaine VALUES (2, 'Aménagement du territoire', NULL, '');
INSERT INTO enum_domaine VALUES (6, 'Economie et Finances', 0, '');


--
-- TOC entry 2435 (class 0 OID 63482)
-- Dependencies: 277
-- Data for Name: enum_format; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_format VALUES (1, 'PAL', 0, NULL);
INSERT INTO enum_format VALUES (2, 'NTSC', 0, NULL);
INSERT INTO enum_format VALUES (3, 'SECAM', 0, NULL);


--
-- TOC entry 2436 (class 0 OID 63490)
-- Dependencies: 279
-- Data for Name: enum_function; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_function VALUES (1, 'Actor', 0, NULL);
INSERT INTO enum_function VALUES (2, 'Anchor', 0, NULL);
INSERT INTO enum_function VALUES (3, 'Candidate', 0, NULL);
INSERT INTO enum_function VALUES (4, 'Costume', 0, NULL);
INSERT INTO enum_function VALUES (5, 'Director', 0, NULL);
INSERT INTO enum_function VALUES (6, 'Editing', 0, NULL);
INSERT INTO enum_function VALUES (7, 'Journalist', 0, NULL);
INSERT INTO enum_function VALUES (8, 'Music', 0, NULL);
INSERT INTO enum_function VALUES (9, 'Producer', 0, NULL);
INSERT INTO enum_function VALUES (10, 'Scenarist', 0, NULL);
INSERT INTO enum_function VALUES (11, 'Set', 0, NULL);
INSERT INTO enum_function VALUES (12, 'Special effects', 0, NULL);


--
-- TOC entry 2437 (class 0 OID 63498)
-- Dependencies: 281
-- Data for Name: enum_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_genre VALUES (3, NULL, 0, 'Conférence de presse');
INSERT INTO enum_genre VALUES (2, NULL, 0, 'Conférence');
INSERT INTO enum_genre VALUES (4, NULL, 0, 'Cérémonie');
INSERT INTO enum_genre VALUES (6, NULL, 0, 'Promotion');
INSERT INTO enum_genre VALUES (7, NULL, 0, 'Séminaire');
INSERT INTO enum_genre VALUES (8, NULL, 0, 'Interview');
INSERT INTO enum_genre VALUES (9, NULL, 0, 'Publicité');
INSERT INTO enum_genre VALUES (10, NULL, 0, 'Journal');
INSERT INTO enum_genre VALUES (11, NULL, 0, 'Magazine');
INSERT INTO enum_genre VALUES (12, NULL, 0, 'Documentaire');
INSERT INTO enum_genre VALUES (13, NULL, 0, 'Fiction');
INSERT INTO enum_genre VALUES (15, NULL, 0, 'Colloque');
INSERT INTO enum_genre VALUES (16, NULL, 0, 'Cours');
INSERT INTO enum_genre VALUES (17, NULL, 0, 'Débat');
INSERT INTO enum_genre VALUES (18, NULL, 0, 'Déclaration');
INSERT INTO enum_genre VALUES (19, NULL, 0, 'Didacticiel');
INSERT INTO enum_genre VALUES (20, NULL, 0, 'Reportage');


--
-- TOC entry 2438 (class 0 OID 63504)
-- Dependencies: 282
-- Data for Name: enum_genre_audiovisual; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_genre_audiovisual VALUES (1, 'journal', 0, NULL);
INSERT INTO enum_genre_audiovisual VALUES (2, 'magazine', 0, NULL);
INSERT INTO enum_genre_audiovisual VALUES (3, 'fiction', 0, NULL);
INSERT INTO enum_genre_audiovisual VALUES (4, 'plateau', 0, NULL);
INSERT INTO enum_genre_audiovisual VALUES (5, 'reportage', 0, NULL);


--
-- TOC entry 2439 (class 0 OID 63514)
-- Dependencies: 285
-- Data for Name: enum_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_language VALUES (1, 'Arabe - classique', 0, NULL);
INSERT INTO enum_language VALUES (2, 'Français', 0, NULL);
INSERT INTO enum_language VALUES (3, 'Anglais', 0, NULL);
INSERT INTO enum_language VALUES (4, 'Allemand', 0, NULL);
INSERT INTO enum_language VALUES (5, 'Hindi', 0, NULL);
INSERT INTO enum_language VALUES (6, 'Italien', 0, NULL);
INSERT INTO enum_language VALUES (7, 'Japonais', 0, NULL);
INSERT INTO enum_language VALUES (8, 'Russe', 0, NULL);
INSERT INTO enum_language VALUES (9, 'Espagnol', 0, NULL);
INSERT INTO enum_language VALUES (10, 'Chinois - Mandarin', 0, NULL);
INSERT INTO enum_language VALUES (11, 'aucune sélection', 0, NULL);


--
-- TOC entry 2440 (class 0 OID 63522)
-- Dependencies: 287
-- Data for Name: enum_lcid; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_lcid VALUES (1025, NULL, NULL, 'Arabic');
INSERT INTO enum_lcid VALUES (1026, NULL, NULL, 'Bulgarian');
INSERT INTO enum_lcid VALUES (1027, NULL, NULL, 'Catalan');
INSERT INTO enum_lcid VALUES (1028, NULL, NULL, 'Chinese (Traditional)');
INSERT INTO enum_lcid VALUES (1029, NULL, NULL, 'Czech');
INSERT INTO enum_lcid VALUES (1030, NULL, NULL, 'Danish');
INSERT INTO enum_lcid VALUES (1031, NULL, NULL, 'German');
INSERT INTO enum_lcid VALUES (1032, NULL, NULL, 'Greek');
INSERT INTO enum_lcid VALUES (1033, NULL, NULL, 'English (U.S.)');
INSERT INTO enum_lcid VALUES (1034, NULL, NULL, 'Spanish (Traditional)');
INSERT INTO enum_lcid VALUES (1035, NULL, NULL, 'Finnish');
INSERT INTO enum_lcid VALUES (1036, NULL, NULL, 'French');
INSERT INTO enum_lcid VALUES (1037, NULL, NULL, 'Hebrew');
INSERT INTO enum_lcid VALUES (1038, NULL, NULL, 'Hungarian');
INSERT INTO enum_lcid VALUES (1039, NULL, NULL, 'Icelandic');
INSERT INTO enum_lcid VALUES (1040, NULL, NULL, 'Italian');
INSERT INTO enum_lcid VALUES (1041, NULL, NULL, 'Japanese');
INSERT INTO enum_lcid VALUES (1042, NULL, NULL, 'Korean');
INSERT INTO enum_lcid VALUES (1043, NULL, NULL, 'Dutch');
INSERT INTO enum_lcid VALUES (1044, NULL, NULL, 'Norwegian Bokmal');
INSERT INTO enum_lcid VALUES (1045, NULL, NULL, 'Polish');
INSERT INTO enum_lcid VALUES (1046, NULL, NULL, 'Portuguese (Brazil)');
INSERT INTO enum_lcid VALUES (1048, NULL, NULL, 'Romanian');
INSERT INTO enum_lcid VALUES (1049, NULL, NULL, 'Russian');
INSERT INTO enum_lcid VALUES (1050, NULL, NULL, 'Croatian');
INSERT INTO enum_lcid VALUES (1051, NULL, NULL, 'Slovak');
INSERT INTO enum_lcid VALUES (1052, NULL, NULL, 'Albanian');
INSERT INTO enum_lcid VALUES (1053, NULL, NULL, 'Swedish');
INSERT INTO enum_lcid VALUES (1054, NULL, NULL, 'Thai');
INSERT INTO enum_lcid VALUES (1055, NULL, NULL, 'Turkish');
INSERT INTO enum_lcid VALUES (1056, NULL, NULL, 'Urdu');
INSERT INTO enum_lcid VALUES (1057, NULL, NULL, 'Indonesian');
INSERT INTO enum_lcid VALUES (1058, NULL, NULL, 'Ukrainian');
INSERT INTO enum_lcid VALUES (1059, NULL, NULL, 'Belarusian');
INSERT INTO enum_lcid VALUES (1060, NULL, NULL, 'Slovenian');
INSERT INTO enum_lcid VALUES (1061, NULL, NULL, 'Estonian');
INSERT INTO enum_lcid VALUES (1062, NULL, NULL, 'Latvian');
INSERT INTO enum_lcid VALUES (1063, NULL, NULL, 'Lithuanian');
INSERT INTO enum_lcid VALUES (1065, NULL, NULL, 'Farsi');
INSERT INTO enum_lcid VALUES (1066, NULL, NULL, 'Vietnamese');
INSERT INTO enum_lcid VALUES (1067, NULL, NULL, 'Armenian *');
INSERT INTO enum_lcid VALUES (1068, NULL, NULL, 'Azeri (Latin)');
INSERT INTO enum_lcid VALUES (1069, NULL, NULL, 'Basque');
INSERT INTO enum_lcid VALUES (1071, NULL, NULL, 'Macedonian (FYROM)');
INSERT INTO enum_lcid VALUES (1078, NULL, NULL, 'Afrikaans');
INSERT INTO enum_lcid VALUES (1079, NULL, NULL, 'Georgian *');
INSERT INTO enum_lcid VALUES (1080, NULL, NULL, 'Faeroese');
INSERT INTO enum_lcid VALUES (1081, NULL, NULL, 'Hindi');
INSERT INTO enum_lcid VALUES (1086, NULL, NULL, 'Malay');
INSERT INTO enum_lcid VALUES (1087, NULL, NULL, 'Kazakh');
INSERT INTO enum_lcid VALUES (1089, NULL, NULL, 'Swahili');
INSERT INTO enum_lcid VALUES (1091, NULL, NULL, 'Uzbek (Latin)');
INSERT INTO enum_lcid VALUES (1092, NULL, NULL, 'Tatar');
INSERT INTO enum_lcid VALUES (1093, NULL, NULL, 'Bengali');
INSERT INTO enum_lcid VALUES (1094, NULL, NULL, 'Punjabi');
INSERT INTO enum_lcid VALUES (1095, NULL, NULL, 'Gujarati');
INSERT INTO enum_lcid VALUES (1096, NULL, NULL, 'Oriya');
INSERT INTO enum_lcid VALUES (1097, NULL, NULL, 'Tamil');
INSERT INTO enum_lcid VALUES (1098, NULL, NULL, 'Telugu');
INSERT INTO enum_lcid VALUES (1099, NULL, NULL, 'Kannada');
INSERT INTO enum_lcid VALUES (1100, NULL, NULL, 'Malayalam');
INSERT INTO enum_lcid VALUES (1101, NULL, NULL, 'Assamese');
INSERT INTO enum_lcid VALUES (1102, NULL, NULL, 'Marathi');
INSERT INTO enum_lcid VALUES (1103, NULL, NULL, 'Sanskrit');
INSERT INTO enum_lcid VALUES (1111, NULL, NULL, 'Konkani');
INSERT INTO enum_lcid VALUES (1112, NULL, NULL, 'Manipuri');
INSERT INTO enum_lcid VALUES (1113, NULL, NULL, 'Sindhi');
INSERT INTO enum_lcid VALUES (1120, NULL, NULL, 'Kashmiri');
INSERT INTO enum_lcid VALUES (1121, NULL, NULL, 'Nepali');
INSERT INTO enum_lcid VALUES (1122, NULL, NULL, 'Frisian');
INSERT INTO enum_lcid VALUES (2052, NULL, NULL, 'Chinese (Simplified)');
INSERT INTO enum_lcid VALUES (2055, NULL, NULL, 'German (Swiss)');
INSERT INTO enum_lcid VALUES (2057, NULL, NULL, 'English (U.K.)');
INSERT INTO enum_lcid VALUES (2068, NULL, NULL, 'Norwegian Nynorsk');
INSERT INTO enum_lcid VALUES (2070, NULL, NULL, 'Portuguese (Portugal)');
INSERT INTO enum_lcid VALUES (2074, NULL, NULL, 'Serbian (Latin)');
INSERT INTO enum_lcid VALUES (2087, NULL, NULL, 'Lithuanian (Classic)');
INSERT INTO enum_lcid VALUES (2092, NULL, NULL, 'Azeri (Cyrillic)');
INSERT INTO enum_lcid VALUES (2115, NULL, NULL, 'Uzbek (Cyrillic)');
INSERT INTO enum_lcid VALUES (3079, NULL, NULL, 'German (Austrian)');
INSERT INTO enum_lcid VALUES (3081, NULL, NULL, 'English (Australian)');
INSERT INTO enum_lcid VALUES (3082, NULL, NULL, 'Spanish');
INSERT INTO enum_lcid VALUES (3084, NULL, NULL, 'Original version');
INSERT INTO enum_lcid VALUES (3098, NULL, NULL, 'Serbian (Cyrillic)');
INSERT INTO enum_lcid VALUES (4105, NULL, NULL, 'English (Canadian)');


--
-- TOC entry 2441 (class 0 OID 63528)
-- Dependencies: 288
-- Data for Name: enum_lieu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_lieu VALUES (1, 'France', 1, '');
INSERT INTO enum_lieu VALUES (2, 'Europe', 2, '');
INSERT INTO enum_lieu VALUES (3, 'Afrique', 3, '');
INSERT INTO enum_lieu VALUES (4, 'Amériques ', 4, '');
INSERT INTO enum_lieu VALUES (5, 'Asie', 5, '');
INSERT INTO enum_lieu VALUES (6, 'Océanie', 6, '');
INSERT INTO enum_lieu VALUES (7, 'Monde', 7, '');


--
-- TOC entry 2442 (class 0 OID 63534)
-- Dependencies: 289
-- Data for Name: enum_lieu2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_lieu2 VALUES (1, 'Alsace', 1, '');
INSERT INTO enum_lieu2 VALUES (2, 'Aquitaine', 1, '');
INSERT INTO enum_lieu2 VALUES (130, 'Australie', 6, '');
INSERT INTO enum_lieu2 VALUES (131, 'Nouvelle Zélande', 6, '');
INSERT INTO enum_lieu2 VALUES (132, 'Océanie - Autres Etats', 6, '');
INSERT INTO enum_lieu2 VALUES (3, 'Auvergne', 1, '');
INSERT INTO enum_lieu2 VALUES (4, 'Basse Normandie', 1, '');
INSERT INTO enum_lieu2 VALUES (5, 'Bassin Parisien', 1, '');
INSERT INTO enum_lieu2 VALUES (6, 'Bourgogne', 1, '');
INSERT INTO enum_lieu2 VALUES (7, 'Bretagne', 1, '');
INSERT INTO enum_lieu2 VALUES (9, 'Corse', 1, '');
INSERT INTO enum_lieu2 VALUES (10, 'Département d''Outre Mer', 1, '');
INSERT INTO enum_lieu2 VALUES (11, 'Franche Comté', 1, '');
INSERT INTO enum_lieu2 VALUES (12, 'Haute Normandie', 1, '');
INSERT INTO enum_lieu2 VALUES (13, 'Ile de France', 1, '');
INSERT INTO enum_lieu2 VALUES (14, 'Languedoc Roussillon', 1, '');
INSERT INTO enum_lieu2 VALUES (15, 'Limousin', 1, '');
INSERT INTO enum_lieu2 VALUES (16, 'Lorraine', 1, '');
INSERT INTO enum_lieu2 VALUES (17, 'Mayotte', 1, '');
INSERT INTO enum_lieu2 VALUES (18, 'Midi Pyrénnée', 1, '');
INSERT INTO enum_lieu2 VALUES (19, 'Nord Pas de Calais', 1, '');
INSERT INTO enum_lieu2 VALUES (20, 'Pays de la Loire', 1, '');
INSERT INTO enum_lieu2 VALUES (21, 'Picardie', 1, '');
INSERT INTO enum_lieu2 VALUES (22, 'Poitou Charentes', 1, '');
INSERT INTO enum_lieu2 VALUES (23, 'Provence Alpes Côte d''Azur', 1, '');
INSERT INTO enum_lieu2 VALUES (24, 'Région Centre', 1, '');
INSERT INTO enum_lieu2 VALUES (25, 'Rhône Alpes', 1, '');
INSERT INTO enum_lieu2 VALUES (26, 'Saint Pierre et Miquelon', 1, '');
INSERT INTO enum_lieu2 VALUES (27, 'Territoire d''Outre Mer', 1, '');
INSERT INTO enum_lieu2 VALUES (28, 'Albanie', 2, '');
INSERT INTO enum_lieu2 VALUES (29, 'Allemagne', 2, '');
INSERT INTO enum_lieu2 VALUES (30, 'Andorre', 2, '');
INSERT INTO enum_lieu2 VALUES (31, 'Arménie', 2, '');
INSERT INTO enum_lieu2 VALUES (32, 'Autriche', 2, '');
INSERT INTO enum_lieu2 VALUES (33, 'Azerbaïdjan', 2, '');
INSERT INTO enum_lieu2 VALUES (34, 'Belgique', 2, '');
INSERT INTO enum_lieu2 VALUES (35, 'Biélorussie', 2, '');
INSERT INTO enum_lieu2 VALUES (36, 'Bulgarie', 2, '');
INSERT INTO enum_lieu2 VALUES (37, 'Chypre', 2, '');
INSERT INTO enum_lieu2 VALUES (38, 'Croatie', 2, '');
INSERT INTO enum_lieu2 VALUES (39, 'Danemark', 2, '');
INSERT INTO enum_lieu2 VALUES (40, 'Espagne', 2, '');
INSERT INTO enum_lieu2 VALUES (41, 'Estonie', 2, '');
INSERT INTO enum_lieu2 VALUES (42, 'Europe Centrale', 2, '');
INSERT INTO enum_lieu2 VALUES (43, 'Europe du Nord', 2, '');
INSERT INTO enum_lieu2 VALUES (44, 'Pays Baltes', 2, '');
INSERT INTO enum_lieu2 VALUES (45, 'Pays Scandinaves', 2, '');
INSERT INTO enum_lieu2 VALUES (46, 'Europe du Sud', 2, '');
INSERT INTO enum_lieu2 VALUES (47, 'Europe Occidentale', 2, '');
INSERT INTO enum_lieu2 VALUES (48, 'Europe Orientale', 2, '');
INSERT INTO enum_lieu2 VALUES (49, 'Ex RDA', 2, '');
INSERT INTO enum_lieu2 VALUES (50, 'Ex RFA', 2, '');
INSERT INTO enum_lieu2 VALUES (51, 'Ex URSS', 2, '');
INSERT INTO enum_lieu2 VALUES (52, 'Ex Yougoslavie', 2, '');
INSERT INTO enum_lieu2 VALUES (53, 'Finlande', 2, '');
INSERT INTO enum_lieu2 VALUES (54, 'Georgie', 2, '');
INSERT INTO enum_lieu2 VALUES (55, 'Grece', 2, '');
INSERT INTO enum_lieu2 VALUES (56, 'Hongrie', 2, '');
INSERT INTO enum_lieu2 VALUES (57, 'Irlande', 2, '');
INSERT INTO enum_lieu2 VALUES (58, 'Islande', 2, '');
INSERT INTO enum_lieu2 VALUES (59, 'Italie', 2, '');
INSERT INTO enum_lieu2 VALUES (60, 'Kazakhstan', 2, '');
INSERT INTO enum_lieu2 VALUES (61, 'Kirghizistan', 2, '');
INSERT INTO enum_lieu2 VALUES (62, 'Lettonie', 2, '');
INSERT INTO enum_lieu2 VALUES (63, 'Liechtenstein', 2, '');
INSERT INTO enum_lieu2 VALUES (64, 'Lituanie', 2, '');
INSERT INTO enum_lieu2 VALUES (65, 'Luxembourg', 2, '');
INSERT INTO enum_lieu2 VALUES (66, 'Macédoine', 2, '');
INSERT INTO enum_lieu2 VALUES (67, 'Malte', 2, '');
INSERT INTO enum_lieu2 VALUES (68, 'Moldavie', 2, '');
INSERT INTO enum_lieu2 VALUES (69, 'Monténégro', 2, '');
INSERT INTO enum_lieu2 VALUES (70, 'Norvège', 2, '');
INSERT INTO enum_lieu2 VALUES (71, 'Ouzbékistan', 2, '');
INSERT INTO enum_lieu2 VALUES (72, 'Pays Bas', 2, '');
INSERT INTO enum_lieu2 VALUES (73, 'Pologne', 2, '');
INSERT INTO enum_lieu2 VALUES (74, 'Portugal', 2, '');
INSERT INTO enum_lieu2 VALUES (75, 'RDA', 2, '');
INSERT INTO enum_lieu2 VALUES (76, 'République Tcheque', 2, '');
INSERT INTO enum_lieu2 VALUES (77, 'RFA', 2, '');
INSERT INTO enum_lieu2 VALUES (78, 'Roumanie', 2, '');
INSERT INTO enum_lieu2 VALUES (79, 'Royaume Uni', 2, '');
INSERT INTO enum_lieu2 VALUES (80, 'Russie', 2, '');
INSERT INTO enum_lieu2 VALUES (81, 'Saint Marin', 2, '');
INSERT INTO enum_lieu2 VALUES (82, 'Serbie', 2, '');
INSERT INTO enum_lieu2 VALUES (83, 'Slovaquie', 2, '');
INSERT INTO enum_lieu2 VALUES (84, 'Slovénie', 2, '');
INSERT INTO enum_lieu2 VALUES (85, 'Suéde', 2, '');
INSERT INTO enum_lieu2 VALUES (86, 'Suisse', 2, '');
INSERT INTO enum_lieu2 VALUES (87, 'Tadjikistan', 2, '');
INSERT INTO enum_lieu2 VALUES (88, 'Tchécoslovaquie', 2, '');
INSERT INTO enum_lieu2 VALUES (89, 'Turkménistan', 2, '');
INSERT INTO enum_lieu2 VALUES (90, 'Turquie', 2, '');
INSERT INTO enum_lieu2 VALUES (91, 'Ukraine', 2, '');
INSERT INTO enum_lieu2 VALUES (92, 'URSS', 2, '');
INSERT INTO enum_lieu2 VALUES (93, 'Vatican', 2, '');
INSERT INTO enum_lieu2 VALUES (94, 'Yougoslavie', 2, '');
INSERT INTO enum_lieu2 VALUES (95, 'Afrique Anglophone', 3, '');
INSERT INTO enum_lieu2 VALUES (96, 'Afrique Arabophone', 3, '');
INSERT INTO enum_lieu2 VALUES (97, 'Afrique Australe', 3, '');
INSERT INTO enum_lieu2 VALUES (98, 'Afrique Centrale ', 3, '');
INSERT INTO enum_lieu2 VALUES (99, 'Afrique du Nord', 3, '');
INSERT INTO enum_lieu2 VALUES (100, 'Afrique du Sud', 3, '');
INSERT INTO enum_lieu2 VALUES (101, 'Afrique Francophone', 3, '');
INSERT INTO enum_lieu2 VALUES (102, 'Afrique Lusophone', 3, '');
INSERT INTO enum_lieu2 VALUES (103, 'Afrique Occidentale', 3, '');
INSERT INTO enum_lieu2 VALUES (104, 'Afrique Orientale', 3, '');
INSERT INTO enum_lieu2 VALUES (105, 'Afrique Subsaharienne', 3, '');
INSERT INTO enum_lieu2 VALUES (106, 'Amérique Centrale', 4, '');
INSERT INTO enum_lieu2 VALUES (107, 'Amérique du Nord', 4, '');
INSERT INTO enum_lieu2 VALUES (108, 'Amérique du Sud', 4, '');
INSERT INTO enum_lieu2 VALUES (109, 'Amérique Latine ', 4, '');
INSERT INTO enum_lieu2 VALUES (110, 'Etats Unis', 4, '');
INSERT INTO enum_lieu2 VALUES (111, 'Canada', 4, '');
INSERT INTO enum_lieu2 VALUES (112, 'Mexique', 4, '');
INSERT INTO enum_lieu2 VALUES (113, 'Brésil', 4, '');
INSERT INTO enum_lieu2 VALUES (114, 'Arabie Saoudite', 5, '');
INSERT INTO enum_lieu2 VALUES (115, 'Asie Centrale', 5, '');
INSERT INTO enum_lieu2 VALUES (116, 'Asie du Sud Est', 5, '');
INSERT INTO enum_lieu2 VALUES (117, 'Chine', 5, '');
INSERT INTO enum_lieu2 VALUES (118, 'Extreme Orient', 5, '');
INSERT INTO enum_lieu2 VALUES (119, 'Inde', 5, '');
INSERT INTO enum_lieu2 VALUES (120, 'Indonésie', 5, '');
INSERT INTO enum_lieu2 VALUES (121, 'Irak', 5, '');
INSERT INTO enum_lieu2 VALUES (122, 'Iran', 5, '');
INSERT INTO enum_lieu2 VALUES (123, 'Israël', 5, '');
INSERT INTO enum_lieu2 VALUES (124, 'Japon', 5, '');
INSERT INTO enum_lieu2 VALUES (125, 'Jordanie', 5, '');
INSERT INTO enum_lieu2 VALUES (126, 'Moyen Orient', 5, '');
INSERT INTO enum_lieu2 VALUES (127, 'Pakistan', 5, '');
INSERT INTO enum_lieu2 VALUES (128, 'Penninsule Arabique', 5, '');
INSERT INTO enum_lieu2 VALUES (129, 'Philippines', 5, '');
INSERT INTO enum_lieu2 VALUES (8, 'Champagne Ardennes', 1, '');


--
-- TOC entry 2443 (class 0 OID 63544)
-- Dependencies: 292
-- Data for Name: enum_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_media VALUES (1, 'audio', 0, NULL);
INSERT INTO enum_media VALUES (3, 'audio vidéo', 0, NULL);
INSERT INTO enum_media VALUES (2, 'vidéo', 0, NULL);


--
-- TOC entry 2444 (class 0 OID 63552)
-- Dependencies: 294
-- Data for Name: enum_medium; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_medium VALUES (1, 'DVD', 0, NULL);
INSERT INTO enum_medium VALUES (2, 'TV  gratuite', 0, NULL);
INSERT INTO enum_medium VALUES (3, 'TV payante', 0, NULL);
INSERT INTO enum_medium VALUES (4, 'Internet', 0, NULL);
INSERT INTO enum_medium VALUES (5, 'Salle', 0, NULL);
INSERT INTO enum_medium VALUES (6, 'Telephonie mobile', 0, NULL);
INSERT INTO enum_medium VALUES (7, 'Tablette', 0, NULL);
INSERT INTO enum_medium VALUES (8, 'VaD', 0, NULL);
INSERT INTO enum_medium VALUES (9, 'Radio', 0, NULL);


--
-- TOC entry 2445 (class 0 OID 63560)
-- Dependencies: 296
-- Data for Name: enum_organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_organization VALUES (1, 'Ministere de l''economie, de l''industrie et de l''emploi', NULL, '');
INSERT INTO enum_organization VALUES (3, 'Secrétariat d''état chargé de l''emploi', NULL, '');
INSERT INTO enum_organization VALUES (4, 'Secrétariat d''état chargé de l''industrie et de la consommation', NULL, '');
INSERT INTO enum_organization VALUES (5, 'Secrétariat d''état chargé du commerce, de l''artisanat, des petites et moyennes entreprises, du tourisme et des services', NULL, '');
INSERT INTO enum_organization VALUES (6, 'Secrétariat chargé de la fonction publique', NULL, '');
INSERT INTO enum_organization VALUES (2, 'Ministere du budget, des comptes publics et de la réforme de l''Etat', 0, '');


--
-- TOC entry 2446 (class 0 OID 63566)
-- Dependencies: 297
-- Data for Name: enum_organization2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_organization2 VALUES (3, 'AIFE', NULL, '');
INSERT INTO enum_organization2 VALUES (4, 'APIE', NULL, '');
INSERT INTO enum_organization2 VALUES (5, 'ATSCAF', NULL, '');
INSERT INTO enum_organization2 VALUES (6, 'BC', NULL, '');
INSERT INTO enum_organization2 VALUES (7, 'CBCM', NULL, '');
INSERT INTO enum_organization2 VALUES (8, 'CGEFI', NULL, '');
INSERT INTO enum_organization2 VALUES (9, 'CGIET', NULL, '');
INSERT INTO enum_organization2 VALUES (10, 'CGTI', NULL, '');
INSERT INTO enum_organization2 VALUES (11, 'DAJ', NULL, '');
INSERT INTO enum_organization2 VALUES (12, 'DB', NULL, '');
INSERT INTO enum_organization2 VALUES (13, 'DGAFP', NULL, '');
INSERT INTO enum_organization2 VALUES (14, 'DGCCRF', NULL, '');
INSERT INTO enum_organization2 VALUES (15, 'DGCIS', NULL, '');
INSERT INTO enum_organization2 VALUES (16, 'DGDDI', NULL, '');
INSERT INTO enum_organization2 VALUES (17, 'DGE', NULL, '');
INSERT INTO enum_organization2 VALUES (18, 'DGEFP', NULL, '');
INSERT INTO enum_organization2 VALUES (19, 'DGEMP', NULL, '');
INSERT INTO enum_organization2 VALUES (20, 'DGFIP', NULL, '');
INSERT INTO enum_organization2 VALUES (21, 'DGME', NULL, '');
INSERT INTO enum_organization2 VALUES (23, 'DPAEP', NULL, '');
INSERT INTO enum_organization2 VALUES (24, 'DSS', NULL, '');
INSERT INTO enum_organization2 VALUES (25, 'DT', NULL, '');
INSERT INTO enum_organization2 VALUES (26, 'HFDS', NULL, '');
INSERT INTO enum_organization2 VALUES (27, 'IGPDE', NULL, '');
INSERT INTO enum_organization2 VALUES (28, 'INSEE', NULL, '');
INSERT INTO enum_organization2 VALUES (30, 'SGAE', NULL, '');
INSERT INTO enum_organization2 VALUES (31, 'SIRCOM', NULL, '');
INSERT INTO enum_organization2 VALUES (32, 'SP', NULL, '');
INSERT INTO enum_organization2 VALUES (33, 'TRACFIN', NULL, '');
INSERT INTO enum_organization2 VALUES (22, 'DGTPE', 1, '');
INSERT INTO enum_organization2 VALUES (29, 'SG', 1, '');


--
-- TOC entry 2447 (class 0 OID 63576)
-- Dependencies: 300
-- Data for Name: enum_personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_personne VALUES (7, 'prise de vue', 0, NULL);
INSERT INTO enum_personne VALUES (8, 'montage', 0, NULL);
INSERT INTO enum_personne VALUES (9, 'effets spéciaux', 0, NULL);
INSERT INTO enum_personne VALUES (10, 'son', 0, NULL);
INSERT INTO enum_personne VALUES (11, 'musique', 0, NULL);
INSERT INTO enum_personne VALUES (12, 'documentation', 0, NULL);
INSERT INTO enum_personne VALUES (6, 'réalisation', 0, NULL);
INSERT INTO enum_personne VALUES (5, 'création', 0, NULL);
INSERT INTO enum_personne VALUES (13, 'production', 0, NULL);
INSERT INTO enum_personne VALUES (14, 'traduction', 0, NULL);
INSERT INTO enum_personne VALUES (15, 'interprétariat', 0, NULL);
INSERT INTO enum_personne VALUES (16, 'moyens techniques', 0, NULL);


--
-- TOC entry 2448 (class 0 OID 63582)
-- Dependencies: 301
-- Data for Name: enum_personne2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_personne2 VALUES (1, 'auteur 1', 1, '');
INSERT INTO enum_personne2 VALUES (2, 'auteur 2', 1, '');
INSERT INTO enum_personne2 VALUES (3, 'réalisateur', 1, '');
INSERT INTO enum_personne2 VALUES (4, 'autre 1', 1, '');
INSERT INTO enum_personne2 VALUES (5, 'autre 2', 1, '');
INSERT INTO enum_personne2 VALUES (6, 'principal 1', 2, '');
INSERT INTO enum_personne2 VALUES (7, 'principal 2', 2, '');
INSERT INTO enum_personne2 VALUES (8, 'principal 3', 2, '');
INSERT INTO enum_personne2 VALUES (9, 'secondaire 1', 2, '');
INSERT INTO enum_personne2 VALUES (10, 'secondaire 2', 2, '');
INSERT INTO enum_personne2 VALUES (11, 'secondaire 3', 2, '');
INSERT INTO enum_personne2 VALUES (12, 'principal 1', 3, '');
INSERT INTO enum_personne2 VALUES (13, 'principal 2', 3, '');
INSERT INTO enum_personne2 VALUES (14, 'principal 3', 3, '');
INSERT INTO enum_personne2 VALUES (15, 'secondaire 1', 3, '');
INSERT INTO enum_personne2 VALUES (16, 'secondaire 2', 3, '');
INSERT INTO enum_personne2 VALUES (17, 'secondaire 3', 3, '');
INSERT INTO enum_personne2 VALUES (18, 'principal 1', 4, '');
INSERT INTO enum_personne2 VALUES (19, 'principal 2', 4, '');
INSERT INTO enum_personne2 VALUES (20, 'principal 3', 4, '');
INSERT INTO enum_personne2 VALUES (21, 'secondaire 1', 4, '');
INSERT INTO enum_personne2 VALUES (22, 'secondaire 2', 4, '');
INSERT INTO enum_personne2 VALUES (23, 'secondaire 3', 4, '');
INSERT INTO enum_personne2 VALUES (1, 'auteur 1', 1, '');
INSERT INTO enum_personne2 VALUES (2, 'auteur 2', 1, '');
INSERT INTO enum_personne2 VALUES (3, 'réalisateur', 1, '');
INSERT INTO enum_personne2 VALUES (4, 'autre 1', 1, '');
INSERT INTO enum_personne2 VALUES (5, 'autre 2', 1, '');
INSERT INTO enum_personne2 VALUES (6, 'principal 1', 2, '');
INSERT INTO enum_personne2 VALUES (7, 'principal 2', 2, '');
INSERT INTO enum_personne2 VALUES (8, 'principal 3', 2, '');
INSERT INTO enum_personne2 VALUES (9, 'secondaire 1', 2, '');
INSERT INTO enum_personne2 VALUES (10, 'secondaire 2', 2, '');
INSERT INTO enum_personne2 VALUES (11, 'secondaire 3', 2, '');
INSERT INTO enum_personne2 VALUES (12, 'principal 1', 3, '');
INSERT INTO enum_personne2 VALUES (13, 'principal 2', 3, '');
INSERT INTO enum_personne2 VALUES (14, 'principal 3', 3, '');
INSERT INTO enum_personne2 VALUES (15, 'secondaire 1', 3, '');
INSERT INTO enum_personne2 VALUES (16, 'secondaire 2', 3, '');
INSERT INTO enum_personne2 VALUES (17, 'secondaire 3', 3, '');
INSERT INTO enum_personne2 VALUES (18, 'principal 1', 4, '');
INSERT INTO enum_personne2 VALUES (19, 'principal 2', 4, '');
INSERT INTO enum_personne2 VALUES (20, 'principal 3', 4, '');
INSERT INTO enum_personne2 VALUES (21, 'secondaire 1', 4, '');
INSERT INTO enum_personne2 VALUES (22, 'secondaire 2', 4, '');
INSERT INTO enum_personne2 VALUES (23, 'secondaire 3', 4, '');


--
-- TOC entry 2449 (class 0 OID 63592)
-- Dependencies: 304
-- Data for Name: enum_pointzoom; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_pointzoom VALUES (1, 'Actualités', NULL, NULL);
INSERT INTO enum_pointzoom VALUES (2, 'Economie', NULL, NULL);
INSERT INTO enum_pointzoom VALUES (3, 'Carrière', NULL, NULL);
INSERT INTO enum_pointzoom VALUES (4, 'Pratique', NULL, NULL);
INSERT INTO enum_pointzoom VALUES (5, 'Culture', NULL, NULL);
INSERT INTO enum_pointzoom VALUES (6, 'Devises', NULL, NULL);


--
-- TOC entry 2450 (class 0 OID 63600)
-- Dependencies: 306
-- Data for Name: enum_profession; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_profession VALUES (1, 'informatique', 0, NULL);
INSERT INTO enum_profession VALUES (2, 'communication', 0, NULL);
INSERT INTO enum_profession VALUES (3, 'audiovisuel', 0, NULL);
INSERT INTO enum_profession VALUES (4, 'droit', 0, NULL);
INSERT INTO enum_profession VALUES (5, 'ressources humaines', 0, NULL);
INSERT INTO enum_profession VALUES (6, 'expertise sectorielle', 0, NULL);


--
-- TOC entry 2451 (class 0 OID 63608)
-- Dependencies: 308
-- Data for Name: enum_public; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_public VALUES (3, 'Europe', NULL, '');
INSERT INTO enum_public VALUES (1, 'Agents Ministères financiers', 0, '');
INSERT INTO enum_public VALUES (4, 'Grand public Monde', 0, '');
INSERT INTO enum_public VALUES (2, 'Grand public France', 0, '');


--
-- TOC entry 2452 (class 0 OID 63614)
-- Dependencies: 309
-- Data for Name: enum_public2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_public2 VALUES (1, 'Ministre & Directeurs', 1, '');
INSERT INTO enum_public2 VALUES (2, 'Administration Centrale - tous', 1, '');
INSERT INTO enum_public2 VALUES (3, 'Services Déconcentrés - tous', 1, '');
INSERT INTO enum_public2 VALUES (4, 'Minefi - tous', 1, '');
INSERT INTO enum_public2 VALUES (5, 'Grand Public - jeunes', 2, '');
INSERT INTO enum_public2 VALUES (6, 'Grand Public - actifs', 2, '');
INSERT INTO enum_public2 VALUES (7, 'Grand Public - sans emploi', 2, '');
INSERT INTO enum_public2 VALUES (8, 'Grand Public - retraités', 2, '');
INSERT INTO enum_public2 VALUES (9, 'Grand Public - tous', 2, '');
INSERT INTO enum_public2 VALUES (10, 'Collectivités locales - Régions', 2, '');
INSERT INTO enum_public2 VALUES (11, 'Collectivités locales - Départements', 2, '');
INSERT INTO enum_public2 VALUES (12, 'Collectivités locales - Villes', 2, '');
INSERT INTO enum_public2 VALUES (13, 'Collectivités locales - toutes', 2, '');
INSERT INTO enum_public2 VALUES (14, 'Entreprises - grandes', 2, '');
INSERT INTO enum_public2 VALUES (15, 'Entreprises - PME', 2, '');
INSERT INTO enum_public2 VALUES (16, 'Entreprises - professions libérales', 2, '');
INSERT INTO enum_public2 VALUES (17, 'Entreprises - commerce & artisanat', 2, '');
INSERT INTO enum_public2 VALUES (18, 'Entreprises - toutes', 2, '');
INSERT INTO enum_public2 VALUES (19, 'Institutions Europe', 3, '');
INSERT INTO enum_public2 VALUES (20, 'Institutions Régionales (hors Europe)', 3, '');
INSERT INTO enum_public2 VALUES (21, 'Institutions Monde', 3, '');


--
-- TOC entry 2453 (class 0 OID 63624)
-- Dependencies: 312
-- Data for Name: enum_scoring; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_scoring VALUES (1, 'excellent', 4, NULL);
INSERT INTO enum_scoring VALUES (2, 'bon', 4, NULL);
INSERT INTO enum_scoring VALUES (3, 'moyen', 4, NULL);
INSERT INTO enum_scoring VALUES (4, 'médiocre', 4, NULL);
INSERT INTO enum_scoring VALUES (5, 'mauvais', 4, NULL);


--
-- TOC entry 2454 (class 0 OID 63632)
-- Dependencies: 314
-- Data for Name: enum_sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_sector VALUES (1, 'commercial', 0, NULL);
INSERT INTO enum_sector VALUES (2, 'non commercial', 0, NULL);


--
-- TOC entry 2455 (class 0 OID 63640)
-- Dependencies: 316
-- Data for Name: enum_sublanguage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_sublanguage VALUES (1, 'Arabe - classique', 0, NULL);
INSERT INTO enum_sublanguage VALUES (2, 'Français', 0, NULL);
INSERT INTO enum_sublanguage VALUES (3, 'Anglais', 0, NULL);
INSERT INTO enum_sublanguage VALUES (4, 'Allemand', 0, NULL);
INSERT INTO enum_sublanguage VALUES (5, 'Hindi', 0, NULL);
INSERT INTO enum_sublanguage VALUES (6, 'Italien', 0, NULL);
INSERT INTO enum_sublanguage VALUES (7, 'Japonais', 0, NULL);
INSERT INTO enum_sublanguage VALUES (8, 'Russe', 0, NULL);
INSERT INTO enum_sublanguage VALUES (9, 'Espagnol', 0, NULL);
INSERT INTO enum_sublanguage VALUES (10, 'Chinois - Mandarin', 0, NULL);
INSERT INTO enum_sublanguage VALUES (11, 'aucune sélection', 0, NULL);


--
-- TOC entry 2456 (class 0 OID 63648)
-- Dependencies: 318
-- Data for Name: enum_theme; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_theme VALUES (3, 'Environnement économique et social', NULL, '');
INSERT INTO enum_theme VALUES (1, 'Environnement juridique et institutionnel', NULL, '');
INSERT INTO enum_theme VALUES (8, 'Environnement professionel', NULL, '');
INSERT INTO enum_theme VALUES (5, 'Environnement culturel et sociétal', NULL, '');
INSERT INTO enum_theme VALUES (2, 'Finances publiques', NULL, '');
INSERT INTO enum_theme VALUES (4, 'Questions Financières', NULL, '');
INSERT INTO enum_theme VALUES (6, 'Questions internationales', NULL, '');
INSERT INTO enum_theme VALUES (7, 'Union européenne', NULL, '');


--
-- TOC entry 2457 (class 0 OID 63654)
-- Dependencies: 319
-- Data for Name: enum_theme2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_theme2 VALUES (9, 'Régulation de la consommation', 3, '');
INSERT INTO enum_theme2 VALUES (43, 'Revenu', 3, '');
INSERT INTO enum_theme2 VALUES (30, 'Santé', 3, '');
INSERT INTO enum_theme2 VALUES (1, 'Droit', 1, '');
INSERT INTO enum_theme2 VALUES (3, 'Gestion du secteur public', 1, '');
INSERT INTO enum_theme2 VALUES (2, 'Organisation administrative et politique', 1, '');
INSERT INTO enum_theme2 VALUES (39, 'Entreprise', 8, '');
INSERT INTO enum_theme2 VALUES (40, 'Formation professionnelle', 8, '');
INSERT INTO enum_theme2 VALUES (41, 'Gestion de l''information', 8, '');
INSERT INTO enum_theme2 VALUES (42, 'Technologie de l''information et de la communication', 8, '');
INSERT INTO enum_theme2 VALUES (4, 'Budget', 2, '');
INSERT INTO enum_theme2 VALUES (6, 'Domaine de l''Etat', 2, '');
INSERT INTO enum_theme2 VALUES (5, 'Fiscalité', 2, '');
INSERT INTO enum_theme2 VALUES (17, 'Crédit', 4, '');
INSERT INTO enum_theme2 VALUES (18, 'Epargne', 4, '');
INSERT INTO enum_theme2 VALUES (21, 'Service financier', 4, '');
INSERT INTO enum_theme2 VALUES (23, 'Système financier', 4, '');
INSERT INTO enum_theme2 VALUES (22, 'Moyen de paiement', 4, '');
INSERT INTO enum_theme2 VALUES (20, 'Monnaie', 4, '');
INSERT INTO enum_theme2 VALUES (19, 'Marché des capitaux', 4, '');
INSERT INTO enum_theme2 VALUES (24, 'Culture', 5, '');
INSERT INTO enum_theme2 VALUES (25, 'Enseignement', 5, '');
INSERT INTO enum_theme2 VALUES (27, 'Population', 5, '');
INSERT INTO enum_theme2 VALUES (31, 'Société', 5, '');
INSERT INTO enum_theme2 VALUES (33, 'Economie internationale', 6, '');
INSERT INTO enum_theme2 VALUES (32, 'Finances Internationales', 6, '');
INSERT INTO enum_theme2 VALUES (34, 'Relations internationales', 6, '');
INSERT INTO enum_theme2 VALUES (35, 'Construction européenne', 7, '');
INSERT INTO enum_theme2 VALUES (36, 'Droit communautaire', 7, '');
INSERT INTO enum_theme2 VALUES (37, 'Organisation communautaire', 7, '');
INSERT INTO enum_theme2 VALUES (10, 'Agriculture', 3, '');
INSERT INTO enum_theme2 VALUES (16, 'Aménagement du territoire', 3, '');
INSERT INTO enum_theme2 VALUES (8, 'Commerce extérieur', 3, '');
INSERT INTO enum_theme2 VALUES (7, 'Economie', 3, '');
INSERT INTO enum_theme2 VALUES (15, 'Emploi', 3, '');
INSERT INTO enum_theme2 VALUES (13, 'Energie et matières premières', 3, '');
INSERT INTO enum_theme2 VALUES (14, 'Environnement', 3, '');
INSERT INTO enum_theme2 VALUES (12, 'Politique industrielle', 3, '');
INSERT INTO enum_theme2 VALUES (11, 'Transport', 3, '');
INSERT INTO enum_theme2 VALUES (38, 'Politique communautaire', 7, '');


--
-- TOC entry 2458 (class 0 OID 63664)
-- Dependencies: 322
-- Data for Name: enum_type1; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_type1 VALUES (1, 'Agriculture', 0, '');
INSERT INTO enum_type1 VALUES (2, 'Aménagement du territoire', 0, '');
INSERT INTO enum_type1 VALUES (3, 'Communication', 0, '');
INSERT INTO enum_type1 VALUES (4, 'Culture', 0, '');
INSERT INTO enum_type1 VALUES (5, 'Défense', 0, NULL);
INSERT INTO enum_type1 VALUES (6, 'Economie et Finances', 0, NULL);
INSERT INTO enum_type1 VALUES (7, 'Education', 0, NULL);
INSERT INTO enum_type1 VALUES (8, 'Emploi', 0, NULL);
INSERT INTO enum_type1 VALUES (9, 'Environnement', 0, NULL);
INSERT INTO enum_type1 VALUES (10, 'Etat', 0, NULL);
INSERT INTO enum_type1 VALUES (11, 'Europe', 0, NULL);
INSERT INTO enum_type1 VALUES (12, 'Justice', 0, NULL);
INSERT INTO enum_type1 VALUES (16, 'Social', 0, NULL);
INSERT INTO enum_type1 VALUES (18, 'Sport', 0, NULL);
INSERT INTO enum_type1 VALUES (13, 'Politique étrangére', 0, NULL);
INSERT INTO enum_type1 VALUES (14, 'Santé', 0, NULL);
INSERT INTO enum_type1 VALUES (15, 'Sécurité', 0, NULL);
INSERT INTO enum_type1 VALUES (17, 'Société', 0, NULL);


--
-- TOC entry 2459 (class 0 OID 63672)
-- Dependencies: 324
-- Data for Name: enum_type2; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enum_type2 VALUES (3, 'Emploi', 6, '');
INSERT INTO enum_type2 VALUES (2, 'Industrie', 6, '');
INSERT INTO enum_type2 VALUES (1, 'Economie', 6, '');
INSERT INTO enum_type2 VALUES (6, 'Réforme de l''Etat', 6, '');
INSERT INTO enum_type2 VALUES (5, 'Comptes publics', 6, '');
INSERT INTO enum_type2 VALUES (4, 'Budget', 6, '');


--
-- TOC entry 2419 (class 0 OID 61273)
-- Dependencies: 168
-- Data for Name: extra_components_panel; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2420 (class 0 OID 61308)
-- Dependencies: 177
-- Data for Name: kb_items_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO kb_items_type VALUES (1, 'chapters', 5, 1);
INSERT INTO kb_items_type VALUES (3, 'objects', 16, 0);


--
-- TOC entry 2421 (class 0 OID 61328)
-- Dependencies: 182
-- Data for Name: locales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO locales VALUES (1, 'aa', 'Afar');
INSERT INTO locales VALUES (2, 'ab', 'Abkhazian');
INSERT INTO locales VALUES (3, 'af', 'Afrikaans');
INSERT INTO locales VALUES (4, 'ak', 'Akan');
INSERT INTO locales VALUES (5, 'sq', 'Albanian');
INSERT INTO locales VALUES (6, 'am', 'Amharic');
INSERT INTO locales VALUES (7, 'ar', 'Arabic');
INSERT INTO locales VALUES (8, 'an', 'Aragonese');
INSERT INTO locales VALUES (9, 'hy', 'Armenian');
INSERT INTO locales VALUES (10, 'as', 'Assamese');
INSERT INTO locales VALUES (11, 'av', 'Avaric');
INSERT INTO locales VALUES (12, 'ae', 'Avestan');
INSERT INTO locales VALUES (13, 'ay', 'Aymara');
INSERT INTO locales VALUES (14, 'az', 'Azerbaijani');
INSERT INTO locales VALUES (15, 'ba', 'Bashkir');
INSERT INTO locales VALUES (16, 'bm', 'Bambara');
INSERT INTO locales VALUES (17, 'eu', 'Basque');
INSERT INTO locales VALUES (18, 'be', 'Belarusian');
INSERT INTO locales VALUES (19, 'bn', 'Bengali');
INSERT INTO locales VALUES (20, 'bh', 'Bihari');
INSERT INTO locales VALUES (21, 'bi', 'Bislama');
INSERT INTO locales VALUES (22, 'bs', 'Bosnian');
INSERT INTO locales VALUES (23, 'br', 'Breton');
INSERT INTO locales VALUES (24, 'bg', 'Bulgarian');
INSERT INTO locales VALUES (25, 'my', 'Burmese');
INSERT INTO locales VALUES (26, 'ca', 'Catalan; Valencian');
INSERT INTO locales VALUES (27, 'ch', 'Chamorro');
INSERT INTO locales VALUES (28, 'ce', 'Chechen');
INSERT INTO locales VALUES (29, 'zh', 'Chinese');
INSERT INTO locales VALUES (30, 'cu', 'Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic');
INSERT INTO locales VALUES (31, 'cv', 'Chuvash');
INSERT INTO locales VALUES (32, 'kw', 'Cornish');
INSERT INTO locales VALUES (33, 'co', 'Corsican');
INSERT INTO locales VALUES (34, 'cr', 'Cree');
INSERT INTO locales VALUES (35, 'cs', 'Czech');
INSERT INTO locales VALUES (36, 'da', 'Danish');
INSERT INTO locales VALUES (37, 'dv', 'Divehi; Dhivehi; Maldivian');
INSERT INTO locales VALUES (38, 'nl', 'Dutch; Flemish');
INSERT INTO locales VALUES (39, 'dz', 'Dzongkha');
INSERT INTO locales VALUES (40, 'en', 'English');
INSERT INTO locales VALUES (41, 'eo', 'Esperanto');
INSERT INTO locales VALUES (42, 'et', 'Estonian');
INSERT INTO locales VALUES (43, 'ee', 'Ewe');
INSERT INTO locales VALUES (44, 'fo', 'Faroese');
INSERT INTO locales VALUES (45, 'fj', 'Fijian');
INSERT INTO locales VALUES (46, 'fi', 'Finnish');
INSERT INTO locales VALUES (47, 'fr', 'French');
INSERT INTO locales VALUES (48, 'fy', 'Western Frisian');
INSERT INTO locales VALUES (49, 'ff', 'Fulah');
INSERT INTO locales VALUES (50, 'ka', 'Georgian');
INSERT INTO locales VALUES (51, 'de', 'German');
INSERT INTO locales VALUES (52, 'gd', 'Gaelic; Scottish Gaelic');
INSERT INTO locales VALUES (53, 'ga', 'Irish');
INSERT INTO locales VALUES (54, 'gl', 'Galician');
INSERT INTO locales VALUES (55, 'gv', 'Manx');
INSERT INTO locales VALUES (56, 'el', 'Greek, Modern (1453-)');
INSERT INTO locales VALUES (57, 'gn', 'Guarani');
INSERT INTO locales VALUES (58, 'gu', 'Gujarati');
INSERT INTO locales VALUES (59, 'ht', 'Haitian; Haitian Creole');
INSERT INTO locales VALUES (60, 'ha', 'Hausa');
INSERT INTO locales VALUES (61, 'he', 'Hebrew');
INSERT INTO locales VALUES (62, 'hz', 'Herero');
INSERT INTO locales VALUES (63, 'hi', 'Hindi');
INSERT INTO locales VALUES (64, 'ho', 'Hiri Motu');
INSERT INTO locales VALUES (65, 'hr', 'Croatian');
INSERT INTO locales VALUES (66, 'hu', 'Hungarian');
INSERT INTO locales VALUES (67, 'ig', 'Igbo');
INSERT INTO locales VALUES (68, 'is', 'Icelandic');
INSERT INTO locales VALUES (69, 'io', 'Ido');
INSERT INTO locales VALUES (70, 'ii', 'Sichuan Yi; Nuosu');
INSERT INTO locales VALUES (71, 'iu', 'Inuktitut');
INSERT INTO locales VALUES (72, 'ie', 'Interlingue; Occidental');
INSERT INTO locales VALUES (73, 'ia', 'Interlingua (International Auxiliary Language Association)');
INSERT INTO locales VALUES (74, 'id', 'Indonesian');
INSERT INTO locales VALUES (75, 'ik', 'Inupiaq');
INSERT INTO locales VALUES (76, 'it', 'Italian');
INSERT INTO locales VALUES (77, 'jv', 'Javanese');
INSERT INTO locales VALUES (78, 'ja', 'Japanese');
INSERT INTO locales VALUES (79, 'kl', 'Kalaallisut; Greenlandic');
INSERT INTO locales VALUES (80, 'kn', 'Kannada');
INSERT INTO locales VALUES (81, 'ks', 'Kashmiri');
INSERT INTO locales VALUES (82, 'kr', 'Kanuri');
INSERT INTO locales VALUES (83, 'kk', 'Kazakh');
INSERT INTO locales VALUES (84, 'km', 'Central Khmer');
INSERT INTO locales VALUES (85, 'ki', 'Kikuyu; Gikuyu');
INSERT INTO locales VALUES (86, 'rw', 'Kinyarwanda');
INSERT INTO locales VALUES (87, 'ky', 'Kirghiz; Kyrgyz');
INSERT INTO locales VALUES (88, 'kv', 'Komi');
INSERT INTO locales VALUES (89, 'kg', 'Kongo');
INSERT INTO locales VALUES (90, 'ko', 'Korean');
INSERT INTO locales VALUES (91, 'kj', 'Kuanyama; Kwanyama');
INSERT INTO locales VALUES (92, 'ku', 'Kurdish');
INSERT INTO locales VALUES (93, 'lo', 'Lao');
INSERT INTO locales VALUES (94, 'la', 'Latin');
INSERT INTO locales VALUES (95, 'lv', 'Latvian');
INSERT INTO locales VALUES (96, 'li', 'Limburgan; Limburger; Limburgish');
INSERT INTO locales VALUES (97, 'ln', 'Lingala');
INSERT INTO locales VALUES (98, 'lt', 'Lithuanian');
INSERT INTO locales VALUES (99, 'lb', 'Luxembourgish; Letzeburgesch');
INSERT INTO locales VALUES (100, 'lu', 'Luba-Katanga');
INSERT INTO locales VALUES (101, 'lg', 'Ganda');
INSERT INTO locales VALUES (102, 'mk', 'Macedonian');
INSERT INTO locales VALUES (103, 'mh', 'Marshallese');
INSERT INTO locales VALUES (104, 'ml', 'Malayalam');
INSERT INTO locales VALUES (105, 'mi', 'Maori');
INSERT INTO locales VALUES (106, 'mr', 'Marathi');
INSERT INTO locales VALUES (107, 'ms', 'Malay');
INSERT INTO locales VALUES (108, 'mg', 'Malagasy');
INSERT INTO locales VALUES (109, 'mt', 'Maltese');
INSERT INTO locales VALUES (110, 'mn', 'Mongolian');
INSERT INTO locales VALUES (111, 'na', 'Nauru');
INSERT INTO locales VALUES (112, 'nv', 'Navajo; Navaho');
INSERT INTO locales VALUES (113, 'nr', 'Ndebele, South; South Ndebele');
INSERT INTO locales VALUES (114, 'nd', 'Ndebele, North; North Ndebele');
INSERT INTO locales VALUES (115, 'ng', 'Ndonga');
INSERT INTO locales VALUES (116, 'ne', 'Nepali');
INSERT INTO locales VALUES (117, 'nn', 'Norwegian Nynorsk; Nynorsk, Norwegian');
INSERT INTO locales VALUES (118, 'nb', 'Bokmål, Norwegian; Norwegian Bokmål');
INSERT INTO locales VALUES (119, 'no', 'Norwegian');
INSERT INTO locales VALUES (120, 'ny', 'Chichewa; Chewa; Nyanja');
INSERT INTO locales VALUES (121, 'oc', 'Occitan (post 1500); Provençal');
INSERT INTO locales VALUES (122, 'oj', 'Ojibwa');
INSERT INTO locales VALUES (123, 'or', 'Oriya');
INSERT INTO locales VALUES (124, 'om', 'Oromo');
INSERT INTO locales VALUES (125, 'os', 'Ossetian; Ossetic');
INSERT INTO locales VALUES (126, 'pa', 'Panjabi; Punjabi');
INSERT INTO locales VALUES (127, 'fa', 'Persian');
INSERT INTO locales VALUES (128, 'pi', 'Pali');
INSERT INTO locales VALUES (129, 'pl', 'Polish');
INSERT INTO locales VALUES (130, 'pt', 'Portuguese');
INSERT INTO locales VALUES (131, 'ps', 'Pushto; Pashto');
INSERT INTO locales VALUES (132, 'qu', 'Quechua');
INSERT INTO locales VALUES (133, 'rm', 'Romansh');
INSERT INTO locales VALUES (134, 'ro', 'Romanian; Moldavian; Moldovan');
INSERT INTO locales VALUES (135, 'rn', 'Rundi');
INSERT INTO locales VALUES (136, 'ru', 'Russian');
INSERT INTO locales VALUES (137, 'sg', 'Sango');
INSERT INTO locales VALUES (138, 'sa', 'Sanskrit');
INSERT INTO locales VALUES (139, 'si', 'Sinhala; Sinhalese');
INSERT INTO locales VALUES (140, 'sk', 'Slovak');
INSERT INTO locales VALUES (141, 'sl', 'Slovenian');
INSERT INTO locales VALUES (142, 'se', 'Northern Sami');
INSERT INTO locales VALUES (143, 'sm', 'Samoan');
INSERT INTO locales VALUES (144, 'sn', 'Shona');
INSERT INTO locales VALUES (145, 'sd', 'Sindhi');
INSERT INTO locales VALUES (146, 'so', 'Somali');
INSERT INTO locales VALUES (147, 'st', 'Sotho, Southern');
INSERT INTO locales VALUES (148, 'es', 'Spanish; Castilian');
INSERT INTO locales VALUES (149, 'sc', 'Sardinian');
INSERT INTO locales VALUES (150, 'sr', 'Serbian');
INSERT INTO locales VALUES (151, 'ss', 'Swati');
INSERT INTO locales VALUES (152, 'su', 'Sundanese');
INSERT INTO locales VALUES (153, 'sw', 'Swahili');
INSERT INTO locales VALUES (154, 'sv', 'Swedish');
INSERT INTO locales VALUES (155, 'ty', 'Tahitian');
INSERT INTO locales VALUES (156, 'ta', 'Tamil');
INSERT INTO locales VALUES (157, 'tt', 'Tatar');
INSERT INTO locales VALUES (158, 'te', 'Telugu');
INSERT INTO locales VALUES (159, 'tg', 'Tajik');
INSERT INTO locales VALUES (160, 'tl', 'Tagalog');
INSERT INTO locales VALUES (161, 'th', 'Thai');
INSERT INTO locales VALUES (162, 'bo', 'Tibetan');
INSERT INTO locales VALUES (163, 'ti', 'Tigrinya');
INSERT INTO locales VALUES (164, 'to', 'Tonga (Tonga Islands)');
INSERT INTO locales VALUES (165, 'tn', 'Tswana');
INSERT INTO locales VALUES (166, 'ts', 'Tsonga');
INSERT INTO locales VALUES (167, 'tk', 'Turkmen');
INSERT INTO locales VALUES (168, 'tr', 'Turkish');
INSERT INTO locales VALUES (169, 'tw', 'Twi');
INSERT INTO locales VALUES (170, 'ug', 'Uighur; Uyghur');
INSERT INTO locales VALUES (171, 'uk', 'Ukrainian');
INSERT INTO locales VALUES (172, 'ur', 'Urdu');
INSERT INTO locales VALUES (173, 'uz', 'Uzbek');
INSERT INTO locales VALUES (174, 've', 'Venda');
INSERT INTO locales VALUES (175, 'vi', 'Vietnamese');
INSERT INTO locales VALUES (176, 'vo', 'Volapük');
INSERT INTO locales VALUES (177, 'cy', 'Welsh');
INSERT INTO locales VALUES (178, 'wa', 'Walloon');
INSERT INTO locales VALUES (179, 'wo', 'Wolof');
INSERT INTO locales VALUES (180, 'xh', 'Xhosa');
INSERT INTO locales VALUES (181, 'yi', 'Yiddish');
INSERT INTO locales VALUES (182, 'yo', 'Yoruba');
INSERT INTO locales VALUES (183, 'za', 'Zhuang; Chuang');
INSERT INTO locales VALUES (184, 'zu', 'Zulu');


--
-- TOC entry 2422 (class 0 OID 61356)
-- Dependencies: 188
-- Data for Name: menus_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO menus_elements VALUES (10, 'List of programs', 42, '');
INSERT INTO menus_elements VALUES (0, 'Programs', 40, '#');
INSERT INTO menus_elements VALUES (0, 'Group', 45, '#');
INSERT INTO menus_elements VALUES (15, 'List of group', 47, '');
INSERT INTO menus_elements VALUES (17, 'List of programs', 48, '');
INSERT INTO menus_elements VALUES (0, 'Tools', 49, '#');
INSERT INTO menus_elements VALUES (18, 'Views', 50, '');
INSERT INTO menus_elements VALUES (16, 'Create group', 46, '');
INSERT INTO menus_elements VALUES (20, 'Template editing', 52, '');
INSERT INTO menus_elements VALUES (0, 'Integration', 54, '#');
INSERT INTO menus_elements VALUES (26, 'Create playlist', 59, '');
INSERT INTO menus_elements VALUES (25, 'List of playlists', 60, '');
INSERT INTO menus_elements VALUES (0, 'Playlist', 58, '#');
INSERT INTO menus_elements VALUES (27, 'Videolist integration', 61, '');
INSERT INTO menus_elements VALUES (28, 'Orders', 62, '');
INSERT INTO menus_elements VALUES (29, 'Template allocation', 63, '');
INSERT INTO menus_elements VALUES (30, 'Publish', 64, '');
INSERT INTO menus_elements VALUES (32, 'Explorer', 66, '');
INSERT INTO menus_elements VALUES (33, 'Explorer', 67, '');
INSERT INTO menus_elements VALUES (36, 'Quick matching', 68, '');
INSERT INTO menus_elements VALUES (37, 'Users', 69, '');
INSERT INTO menus_elements VALUES (38, 'Home', 70, '');
INSERT INTO menus_elements VALUES (39, 'Home', 71, '');
INSERT INTO menus_elements VALUES (44, 'Import', 77, '');
INSERT INTO menus_elements VALUES (45, 'Billings list', 78, '');
INSERT INTO menus_elements VALUES (14, 'Create program', 1, '');
INSERT INTO menus_elements VALUES (0, 'Videolist', 2, '#');
INSERT INTO menus_elements VALUES (0, 'Statistics', 74, '#');
INSERT INTO menus_elements VALUES (43, 'Statistics per production', 76, '');
INSERT INTO menus_elements VALUES (40, 'Statistics per publication', 72, '');
INSERT INTO menus_elements VALUES (41, 'Statistics per program', 73, '');
INSERT INTO menus_elements VALUES (42, 'Statistics per program', 75, '');
INSERT INTO menus_elements VALUES (34, 'Chapters manager', 53, '');
INSERT INTO menus_elements VALUES (35, 'Chapters manager', 65, '');


--
-- TOC entry 2423 (class 0 OID 61380)
-- Dependencies: 194
-- Data for Name: p_field_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO p_field_category VALUES ('A', 1);
INSERT INTO p_field_category VALUES ('B', 2);
INSERT INTO p_field_category VALUES ('C', 3);
INSERT INTO p_field_category VALUES ('D', 4);
INSERT INTO p_field_category VALUES ('E', 5);
INSERT INTO p_field_category VALUES ('F', 6);
INSERT INTO p_field_category VALUES ('G', 7);
INSERT INTO p_field_category VALUES ('H', 8);
INSERT INTO p_field_category VALUES ('I', 9);
INSERT INTO p_field_category VALUES ('J', 10);
INSERT INTO p_field_category VALUES ('K', 11);
INSERT INTO p_field_category VALUES ('L', 12);
INSERT INTO p_field_category VALUES ('M', 13);
INSERT INTO p_field_category VALUES ('N', 14);
INSERT INTO p_field_category VALUES ('O', 15);
INSERT INTO p_field_category VALUES ('P', 16);
INSERT INTO p_field_category VALUES ('Q', 17);
INSERT INTO p_field_category VALUES ('R', 18);
INSERT INTO p_field_category VALUES ('S', 19);
INSERT INTO p_field_category VALUES ('T', 20);
INSERT INTO p_field_category VALUES ('U', 21);
INSERT INTO p_field_category VALUES ('V', 22);
INSERT INTO p_field_category VALUES ('W', 23);
INSERT INTO p_field_category VALUES ('X', 24);
INSERT INTO p_field_category VALUES ('Y', 25);
INSERT INTO p_field_category VALUES ('Z', 26);


--
-- TOC entry 2424 (class 0 OID 61390)
-- Dependencies: 198
-- Data for Name: productions_fields_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2425 (class 0 OID 61395)
-- Dependencies: 200
-- Data for Name: productions_menus_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO productions_menus_elements VALUES (60, 40, 0, NULL, 0);
INSERT INTO productions_menus_elements VALUES (60, 1, 0, 40, 0);
INSERT INTO productions_menus_elements VALUES (60, 42, 1, 40, 0);
INSERT INTO productions_menus_elements VALUES (60, 74, 1, NULL, 0);
INSERT INTO productions_menus_elements VALUES (60, 73, 0, 74, 0);
INSERT INTO productions_menus_elements VALUES (60, 72, 1, 74, 0);
INSERT INTO productions_menus_elements VALUES (0, 70, 0, NULL, 0);
INSERT INTO productions_menus_elements VALUES (0, 40, 1, NULL, 0);
INSERT INTO productions_menus_elements VALUES (0, 1, 0, 40, 0);
INSERT INTO productions_menus_elements VALUES (0, 42, 1, 40, 0);
INSERT INTO productions_menus_elements VALUES (0, 68, 2, 40, 0);
INSERT INTO productions_menus_elements VALUES (0, 46, 3, 40, 0);
INSERT INTO productions_menus_elements VALUES (0, 47, 4, 40, 0);
INSERT INTO productions_menus_elements VALUES (0, 49, 2, NULL, 0);
INSERT INTO productions_menus_elements VALUES (0, 66, 0, 49, 0);
INSERT INTO productions_menus_elements VALUES (0, 64, 1, 49, 0);
INSERT INTO productions_menus_elements VALUES (0, 53, 2, 49, 0);
INSERT INTO productions_menus_elements VALUES (0, 77, 3, 49, 0);
INSERT INTO productions_menus_elements VALUES (0, 78, 4, 49, 0);
INSERT INTO productions_menus_elements VALUES (0, 74, 3, NULL, 0);
INSERT INTO productions_menus_elements VALUES (0, 72, 0, 74, 0);
INSERT INTO productions_menus_elements VALUES (0, 73, 1, 74, 0);


--
-- TOC entry 2416 (class 0 OID 61039)
-- Dependencies: 157
-- Data for Name: programs_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO programs_fields VALUES (1, 'title', 'TEXT', NULL, NULL, '', '', NULL, 1, NULL, false, 'title');
INSERT INTO programs_fields VALUES (22, 'copyright', 'COMPLEXBOOLEAN', NULL, NULL, '', '', NULL, 2, NULL, false, 'copyright');
INSERT INTO programs_fields VALUES (13, 'fullversion', 'BOOLEAN', NULL, NULL, '', '', NULL, 2, NULL, false, 'fullversion');
INSERT INTO programs_fields VALUES (29, 'picture', 'PICTURE', NULL, NULL, '', '', NULL, 1, NULL, false, 'picture');
INSERT INTO programs_fields VALUES (2, 'synopsis', 'TEXTAREA', NULL, NULL, '', '', NULL, 1, NULL, false, 'synopsis');
INSERT INTO programs_fields VALUES (3, 'audience', 'ENUM', 'enum_audience', NULL, '', '', NULL, 1, NULL, false, 'audience');
INSERT INTO programs_fields VALUES (23, 'date', 'DATE', NULL, NULL, '', '', NULL, 1, NULL, false, 'date');
INSERT INTO programs_fields VALUES (27, 'description', 'TEXTAREA', NULL, NULL, '', '', NULL, 1, NULL, false, 'description');
INSERT INTO programs_fields VALUES (64, 'video ratio', 'ENUM', 'videoratio', '', '', '', NULL, 2, NULL, false, 'videoratio');
INSERT INTO programs_fields VALUES (65, 'idext', 'TEXT', NULL, NULL, '', '', NULL, 2, NULL, false, 'idext');
INSERT INTO programs_fields VALUES (66, 'language', 'ENUM', 'enum_language', '', '', '', NULL, 2, NULL, false, 'language');
INSERT INTO programs_fields VALUES (68, 'subtitles language', 'ENUM', 'enum_sublanguage', '', '', '', NULL, 2, NULL, false, 'sublanguage');
INSERT INTO programs_fields VALUES (69, 'organization', 'ENUM', 'enum_organization', '', '', '', NULL, 2, NULL, false, 'organization');
INSERT INTO programs_fields VALUES (71, 'theme', 'ENUM', 'enum_theme', '', '', '', NULL, 2, NULL, false, 'theme');
INSERT INTO programs_fields VALUES (72, 'theme details', 'ENUM', 'enum_theme2', 'theme', '', '', NULL, 2, NULL, false, 'theme2');
INSERT INTO programs_fields VALUES (76, 'media', 'ENUM', 'enum_media', '', '', '', NULL, 2, NULL, false, 'media');
INSERT INTO programs_fields VALUES (59, 'format', 'ENUM', 'enum_format', '', '', '', NULL, 2, NULL, false, 'format');
INSERT INTO programs_fields VALUES (80, 'public', 'ENUM', 'enum_public', '', '', '', NULL, 2, NULL, false, 'public');
INSERT INTO programs_fields VALUES (81, 'public details', 'ENUM', 'enum_public2', 'public', '', '', NULL, 2, NULL, false, 'public2');
INSERT INTO programs_fields VALUES (82, 'personne', 'ENUM', 'enum_personne', '', '', '', NULL, 2, NULL, false, 'personne');
INSERT INTO programs_fields VALUES (83, 'personne details', 'ENUM', 'enum_personne2', 'personne', '', '', NULL, 2, NULL, false, 'personne2');
INSERT INTO programs_fields VALUES (86, 'flv', 'TEXT', NULL, NULL, '', '', NULL, 2, NULL, false, 'flv');
INSERT INTO programs_fields VALUES (87, 'mp4', 'TEXT', NULL, NULL, '', '', NULL, 2, NULL, false, 'mp4');
INSERT INTO programs_fields VALUES (88, 'salle', 'TEXT', NULL, NULL, '', '', NULL, 2, NULL, false, 'salle');
INSERT INTO programs_fields VALUES (91, 'tags', 'TEXT', NULL, NULL, '', '', NULL, 2, NULL, false, 'tags');
INSERT INTO programs_fields VALUES (92, 'pointzoom', 'ENUM', 'enum_pointzoom', '', '', '', NULL, 2, NULL, false, 'pointzoom');
INSERT INTO programs_fields VALUES (97, 'function', 'ENUM', 'enum_function', '', '', '', '', 2, NULL, false, 'function');
INSERT INTO programs_fields VALUES (74, 'lieu details', 'ENUM', 'enum_lieu2', 'lieu', '', '', '', 2, NULL, false, 'lieu2');
INSERT INTO programs_fields VALUES (84, 'type 1', 'ENUM', 'enum_type1', '', '', '', '', 2, NULL, false, 'type1');
INSERT INTO programs_fields VALUES (30, 'file', 'FILE', NULL, NULL, '', '', '', 1, NULL, false, 'file');
INSERT INTO programs_fields VALUES (98, 'credits', 'TEXTAREA', NULL, NULL, '', 'enum_personne', '', 1, NULL, false, 'credits');
INSERT INTO programs_fields VALUES (85, 'type 2', 'ENUM', 'enum_type2', 'type1', '', '', '', 2, NULL, false, 'type2');
INSERT INTO programs_fields VALUES (96, 'transcription', 'TEXTAREA', NULL, NULL, '', '', '', 2, NULL, false, 'transcription');
INSERT INTO programs_fields VALUES (102, 'action', 'ENUM', 'enum_action', 'class', '', '', '', 2, NULL, false, 'action');
INSERT INTO programs_fields VALUES (103, 'subclass', 'ENUM', 'enum_class2', 'class', '', '', '', 2, NULL, false, 'class2');
INSERT INTO programs_fields VALUES (104, 'scoring', 'ENUM', 'enum_scoring', 'class', '', '', '', 2, NULL, false, 'scoring');
INSERT INTO programs_fields VALUES (105, 'file 2', 'FILE', NULL, NULL, '', '', '', 2, NULL, false, 'file2');
INSERT INTO programs_fields VALUES (106, 'url 2', 'TEXT', NULL, NULL, '', '', '', 2, NULL, false, 'url2');
INSERT INTO programs_fields VALUES (107, 'url 2 title', 'TEXT', NULL, NULL, '', '', '', 2, NULL, false, 'url2title');
INSERT INTO programs_fields VALUES (108, 'statistics', 'FILE', NULL, NULL, '', '', '', 2, NULL, false, 'statistics');
INSERT INTO programs_fields VALUES (109, 'timecode out', 'TEXT', NULL, NULL, '', '', '', 2, NULL, false, 'timecodeout');
INSERT INTO programs_fields VALUES (110, 'period (end)', 'DATE', NULL, NULL, '', '', '', 2, NULL, false, 'period_end');
INSERT INTO programs_fields VALUES (70, 'organization details', 'ENUM', 'enum_organization2', 'organization', '', '', NULL, 2, NULL, false, 'organization2');
INSERT INTO programs_fields VALUES (111, 'profession', 'ENUMMULTI', 'enum_profession', '', '', '', '', 2, NULL, false, 'profession');
INSERT INTO programs_fields VALUES (25, 'url 1', 'TEXT', NULL, NULL, '', '', '', 1, NULL, false, 'url');
INSERT INTO programs_fields VALUES (26, 'url title 1', 'TEXT', NULL, NULL, '', '', '', 1, NULL, false, 'urltitle');
INSERT INTO programs_fields VALUES (24, 'timecode in', 'TEXT', NULL, NULL, '99:59:59.99', '00:00:00.00', '', 1, NULL, false, 'timecode');
INSERT INTO programs_fields VALUES (75, 'period (start)', 'DATE', NULL, NULL, '', '', '', 2, NULL, false, 'periode');
INSERT INTO programs_fields VALUES (112, 'sector', 'ENUMMULTI', 'enum_sector', '', '', '', '', 2, NULL, false, 'sector');
INSERT INTO programs_fields VALUES (78, 'domain', 'ENUM', 'enum_domaine', '', '', '', '', 2, NULL, false, 'domaine');
INSERT INTO programs_fields VALUES (4, 'genre', 'ENUM', 'enum_genre', NULL, '', '', '', 1, NULL, false, 'genre');
INSERT INTO programs_fields VALUES (90, 'chapô', 'TEXTAREA', NULL, NULL, '', '', '', 2, NULL, false, 'chapo');
INSERT INTO programs_fields VALUES (73, 'lieu', 'ENUM', 'enum_lieu', '', '', '', '', 2, NULL, false, 'lieu');
INSERT INTO programs_fields VALUES (113, 'medium', 'ENUMMULTI', 'enum_medium', '', '', '', '', 2, NULL, false, 'medium');
INSERT INTO programs_fields VALUES (114, 'class', 'ENUM', 'enum_class', '', '', '', '', 2, NULL, false, 'class');
INSERT INTO programs_fields VALUES (115, 'remark', 'TEXTAREA', NULL, NULL, '', '', '', 2, NULL, false, 'remark');
INSERT INTO programs_fields VALUES (116, 'genre audiovisual', 'ENUM', 'enum_genre_audiovisual', '', '', '', '', 2, NULL, false, 'genre_audiovisual');
INSERT INTO programs_fields VALUES (79, 'droits', 'TEXT', 'enum_droits', '', '', '', NULL, 2, NULL, false, 'droits');
INSERT INTO programs_fields VALUES (33, 'duration', 'TEXT', NULL, NULL, '99:59:59', '00:00:00', '', 1, NULL, false, 'duration');


--
-- TOC entry 2417 (class 0 OID 61046)
-- Dependencies: 158
-- Data for Name: programs_fields_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO programs_fields_group VALUES (1, 'default', NULL, true, true);
INSERT INTO programs_fields_group VALUES (16, 'objects', NULL, NULL, true);
INSERT INTO programs_fields_group VALUES (5, 'chapters', NULL, true, true);


--
-- TOC entry 2418 (class 0 OID 61053)
-- Dependencies: 159
-- Data for Name: programs_fields_group_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO programs_fields_group_fields VALUES (23, 2, 32, 0, NULL);
INSERT INTO programs_fields_group_fields VALUES (1, 2, 33, 1, NULL);
INSERT INTO programs_fields_group_fields VALUES (3, 2, 34, 2, NULL);
INSERT INTO programs_fields_group_fields VALUES (1, 1, 1, 0, '1');
INSERT INTO programs_fields_group_fields VALUES (65, 1, 49, 1, '1');
INSERT INTO programs_fields_group_fields VALUES (23, 1, 10, 2, '1');
INSERT INTO programs_fields_group_fields VALUES (4, 1, 4, 3, '1');
INSERT INTO programs_fields_group_fields VALUES (2, 1, 5, 4, '1');
INSERT INTO programs_fields_group_fields VALUES (3, 1, 3, 5, '1');
INSERT INTO programs_fields_group_fields VALUES (33, 1, 26, 6, '1');
INSERT INTO programs_fields_group_fields VALUES (66, 1, 50, 7, '1');
INSERT INTO programs_fields_group_fields VALUES (68, 1, 51, 8, '1');
INSERT INTO programs_fields_group_fields VALUES (96, 1, 75, 9, '1');
INSERT INTO programs_fields_group_fields VALUES (91, 1, 67, 10, '1');
INSERT INTO programs_fields_group_fields VALUES (90, 1, 71, 11, '1');
INSERT INTO programs_fields_group_fields VALUES (76, 1, 62, 12, '1');
INSERT INTO programs_fields_group_fields VALUES (84, 1, 60, 13, '1');
INSERT INTO programs_fields_group_fields VALUES (85, 1, 61, 14, '1');
INSERT INTO programs_fields_group_fields VALUES (98, 1, 78, 15, '1');
INSERT INTO programs_fields_group_fields VALUES (26, 1, 80, 16, '1');
INSERT INTO programs_fields_group_fields VALUES (64, 1, 81, 17, '1');
INSERT INTO programs_fields_group_fields VALUES (71, 1, 54, 18, '2');
INSERT INTO programs_fields_group_fields VALUES (72, 1, 55, 19, '2');
INSERT INTO programs_fields_group_fields VALUES (69, 1, 56, 20, '2');
INSERT INTO programs_fields_group_fields VALUES (3, 3, 84, 0, '1');
INSERT INTO programs_fields_group_fields VALUES (70, 1, 57, 21, '2');
INSERT INTO programs_fields_group_fields VALUES (87, 1, 69, 22, '2');
INSERT INTO programs_fields_group_fields VALUES (86, 1, 70, 23, '2');
INSERT INTO programs_fields_group_fields VALUES (92, 1, 72, 24, '2');
INSERT INTO programs_fields_group_fields VALUES (113, 1, 90, 25, '3');
INSERT INTO programs_fields_group_fields VALUES (112, 1, 87, 26, '3');
INSERT INTO programs_fields_group_fields VALUES (75, 1, 58, 27, '3');
INSERT INTO programs_fields_group_fields VALUES (110, 1, 88, 28, '3');
INSERT INTO programs_fields_group_fields VALUES (73, 1, 52, 29, '3');
INSERT INTO programs_fields_group_fields VALUES (74, 1, 53, 30, '3');
INSERT INTO programs_fields_group_fields VALUES (115, 1, 89, 31, '3');
INSERT INTO programs_fields_group_fields VALUES (26, 6, 76, 0, '1');
INSERT INTO programs_fields_group_fields VALUES (25, 6, 77, 1, '1');
INSERT INTO programs_fields_group_fields VALUES (114, 5, 91, 0, '1');
INSERT INTO programs_fields_group_fields VALUES (103, 5, 92, 1, '1');
INSERT INTO programs_fields_group_fields VALUES (1, 5, 13, 2, '1');
INSERT INTO programs_fields_group_fields VALUES (29, 5, 21, 3, '1');
INSERT INTO programs_fields_group_fields VALUES (24, 5, 15, 4, '1');
INSERT INTO programs_fields_group_fields VALUES (27, 5, 14, 5, '2');
INSERT INTO programs_fields_group_fields VALUES (114, 16, 96, 0, '1');
INSERT INTO programs_fields_group_fields VALUES (1, 16, 97, 1, '1');
INSERT INTO programs_fields_group_fields VALUES (29, 16, 98, 2, '1');
INSERT INTO programs_fields_group_fields VALUES (24, 16, 99, 3, '1');
INSERT INTO programs_fields_group_fields VALUES (27, 16, 100, 4, '2');
INSERT INTO programs_fields_group_fields VALUES (91, 16, 101, 5, '2');
INSERT INTO programs_fields_group_fields VALUES (23, 16, 102, 6, '2');
INSERT INTO programs_fields_group_fields VALUES (30, 16, 103, 7, '3');
INSERT INTO programs_fields_group_fields VALUES (105, 16, 104, 8, '3');
INSERT INTO programs_fields_group_fields VALUES (25, 16, 105, 9, '3');
INSERT INTO programs_fields_group_fields VALUES (91, 5, 93, 6, '2');
INSERT INTO programs_fields_group_fields VALUES (30, 5, 20, 7, '3');
INSERT INTO programs_fields_group_fields VALUES (25, 5, 16, 8, '3');
INSERT INTO programs_fields_group_fields VALUES (26, 5, 17, 9, '3');
INSERT INTO programs_fields_group_fields VALUES (106, 5, 94, 10, '3');
INSERT INTO programs_fields_group_fields VALUES (107, 5, 95, 11, '3');
INSERT INTO programs_fields_group_fields VALUES (26, 16, 106, 10, '3');
INSERT INTO programs_fields_group_fields VALUES (106, 16, 107, 11, '3');
INSERT INTO programs_fields_group_fields VALUES (107, 16, 108, 12, '3');


--
-- TOC entry 2426 (class 0 OID 61458)
-- Dependencies: 216
-- Data for Name: publications_menus_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO publications_menus_elements VALUES (0, 71, 0, NULL, 0);
INSERT INTO publications_menus_elements VALUES (0, 40, 1, NULL, 0);
INSERT INTO publications_menus_elements VALUES (0, 48, 0, 40, 0);
INSERT INTO publications_menus_elements VALUES (0, 2, 2, NULL, 0);
INSERT INTO publications_menus_elements VALUES (0, 61, 0, 2, 0);
INSERT INTO publications_menus_elements VALUES (0, 58, 3, NULL, 0);
INSERT INTO publications_menus_elements VALUES (0, 59, 0, 58, 0);
INSERT INTO publications_menus_elements VALUES (0, 60, 1, 58, 0);
INSERT INTO publications_menus_elements VALUES (0, 49, 4, NULL, 0);
INSERT INTO publications_menus_elements VALUES (0, 67, 0, 49, 0);
INSERT INTO publications_menus_elements VALUES (0, 52, 1, 49, 0);
INSERT INTO publications_menus_elements VALUES (0, 63, 2, 49, 0);
INSERT INTO publications_menus_elements VALUES (0, 50, 3, 49, 0);
INSERT INTO publications_menus_elements VALUES (0, 65, 4, 49, 0);
INSERT INTO publications_menus_elements VALUES (0, 69, 5, 49, 0);
INSERT INTO publications_menus_elements VALUES (0, 74, 5, NULL, 0);
INSERT INTO publications_menus_elements VALUES (0, 75, 0, 74, 0);
INSERT INTO publications_menus_elements VALUES (0, 76, 1, 74, 0);


--
-- TOC entry 2427 (class 0 OID 61479)
-- Dependencies: 221
-- Data for Name: services_menus_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO services_menus_elements VALUES (0, 62, 0, NULL, 0);


--
-- TOC entry 2428 (class 0 OID 61536)
-- Dependencies: 236
-- Data for Name: services_types; Type: TABLE DATA; Schema: public; Owner: postgres
--


SELECT pg_catalog.setval('components_idcomponent_seq', 49, true);
INSERT INTO components VALUES (14, 'create program', '', 'prod', 'program', 'create', '', NULL);
INSERT INTO components VALUES (15, 'group of program', '', 'prod', 'group', 'list', '', NULL);
INSERT INTO components VALUES (16, 'create group of program', '', 'prod', 'group', 'create', '', NULL);
INSERT INTO components VALUES (17, 'list of program', '', 'pub', 'stock', 'programslist', '', NULL);
INSERT INTO components VALUES (18, 'views', '', 'pub', 'tools', 'views', '', NULL);
INSERT INTO components VALUES (21, 'virtual manager', '', 'tools', 'virtualmanager', 'index', '', NULL);
INSERT INTO components VALUES (25, 'playlist list', '', 'pub', 'playlist', 'list', '', NULL);
INSERT INTO components VALUES (26, 'create playlist', '', 'pub', 'playlist', 'create', '', NULL);
INSERT INTO components VALUES (27, 'video list integration', '', 'pub', 'integration', 'videolist', '', NULL);
INSERT INTO components VALUES (28, 'Orders', '', 'ser', 'orders', 'list', '', NULL);
INSERT INTO components VALUES (29, 'affect theme', '', 'pub', 'integration', 'affecttheme', '', NULL);
INSERT INTO components VALUES (30, 'publish', '', 'prod', 'pub', 'list', '', NULL);
INSERT INTO components VALUES (20, 'templates', '', 'pub', 'tools', 'templates', '', NULL);
INSERT INTO components VALUES (31, 'templates', '', 'prod', 'tools', 'templates', '', NULL);
INSERT INTO components VALUES (34, 'vmanager', '', 'prod', 'tools', 'vmanager', '', NULL);
INSERT INTO components VALUES (35, 'vmanager', '', 'pub', 'tools', 'vmanager', '', NULL);
INSERT INTO components VALUES (32, 'explorer', '', 'prod', 'tools', 'explorer', 'layout=standard', NULL);
INSERT INTO components VALUES (33, 'explorer', '', 'pub', 'tools', 'explorer', 'layout=standard', NULL);
INSERT INTO components VALUES (36, 'quickmatch', '', 'prod', 'program', 'create2', '', NULL);
INSERT INTO components VALUES (37, 'users', '', 'pub', 'users', 'list', '', NULL);
INSERT INTO components VALUES (38, 'Home', '', 'prod', 'index', 'index', '', NULL);
INSERT INTO components VALUES (39, 'Home', '', 'pub', 'index', 'index', '', NULL);
INSERT INTO components VALUES (40, 'stats publications', '', 'prod', 'stats', 'publications', '', NULL);
INSERT INTO components VALUES (41, 'stats programs', '', 'prod', 'stats', 'programs', '', NULL);
INSERT INTO components VALUES (42, 'stats publication', '', 'pub', 'stats', 'publication', '', NULL);
INSERT INTO components VALUES (10, 'list of program', '', 'prod', 'program', 'programslist', '', NULL);
INSERT INTO components VALUES (43, 'stats per production', '', 'pub', 'stats', 'productions', '', NULL);
INSERT INTO components VALUES (44, 'import', '', 'prod', 'data', 'import', '', NULL);
INSERT INTO components VALUES (45, 'Billings list', '', 'prod', 'billings', 'list', '', NULL);
INSERT INTO components VALUES (48, 'Champ de test', '', '', '', '', '', NULL);


INSERT INTO services_types VALUES (2, 'Encoding', NULL);
INSERT INTO services_types VALUES (3, 'Subtitling', NULL);
INSERT INTO services_types VALUES (4, 'Translation', NULL);
INSERT INTO services_types VALUES (5, 'Watermarking', NULL);
INSERT INTO services_types VALUES (1, 'Chaptering', NULL);

INSERT INTO users_fields_group VALUES (0, 'none');
INSERT INTO users (iduser, idgroup, name, firstname, email, phonenumber, faxnumber, adress1, adress2, city, postalcode, ulogin, upassword, lastconnection, state, userkey, lang, secretquestion, secretresponse) VALUES ( 1,0, '', '', '', '', '', '', '', '', '', 'administrateur', '19ad89bc3e3c9d7ef68b89523eff1987', NULL, 1, '6b3f0354e74163385d03', NULL, NULL, NULL);
INSERT INTO ressources_access (iduser, idcomponent, level, state, authorization_type, idacces, module, ressource) VALUES (1, 0, 0, 1, 0, 1, 'sadmin', 1);
-- Completed on 2012-02-23 15:53:11
SELECT pg_catalog.setval('users_iduser_seq',2,true);
--
-- PostgreSQL database dump complete
--


SELECT pg_catalog.setval('traduction_id_seq', 78, true);


--
-- TOC entry 2342 (class 0 OID 61574)
-- Dependencies: 245
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO translations VALUES (1, 'trad1', 'libelle', 'fr', 'enum_level3', 1, NULL);
INSERT INTO translations VALUES (7, 'Liste des factures', 'title', 'fr', 'menus_elements', 78, NULL);
INSERT INTO translations VALUES (8, 'Créer un groupe', 'title', 'fr', 'menus_elements', 46, NULL);
INSERT INTO translations VALUES (9, 'Créer un programme', 'title', 'fr', 'menus_elements', 1, NULL);
INSERT INTO translations VALUES (10, 'Créer une playlist', 'title', 'fr', 'menus_elements', 59, NULL);
INSERT INTO translations VALUES (11, 'Explorateur', 'title', 'fr', 'menus_elements', 67, NULL);
INSERT INTO translations VALUES (12, 'Explorateur', 'title', 'fr', 'menus_elements', 66, NULL);
INSERT INTO translations VALUES (13, 'Groupe', 'title', 'fr', 'menus_elements', 45, NULL);
INSERT INTO translations VALUES (14, 'Accueil', 'title', 'fr', 'menus_elements', 71, NULL);
INSERT INTO translations VALUES (15, 'Importer', 'title', 'fr', 'menus_elements', 77, NULL);
INSERT INTO translations VALUES (16, 'Intégration', 'title', 'fr', 'menus_elements', 54, NULL);
INSERT INTO translations VALUES (17, 'Liste des groupes', 'title', 'fr', 'menus_elements', 47, NULL);
INSERT INTO translations VALUES (18, 'Liste des playlists', 'title', 'fr', 'menus_elements', 60, NULL);
INSERT INTO translations VALUES (19, 'Vidéoliste', 'title', 'fr', 'menus_elements', 2, NULL);
INSERT INTO translations VALUES (20, 'Programmes', 'title', 'fr', 'menus_elements', 40, NULL);
INSERT INTO translations VALUES (21, 'Liste des programmes', 'title', 'fr', 'menus_elements', 48, NULL);
INSERT INTO translations VALUES (22, 'Outils', 'title', 'fr', 'menus_elements', 49, NULL);
INSERT INTO translations VALUES (23, 'Vues', 'title', 'fr', 'menus_elements', 50, NULL);
INSERT INTO translations VALUES (24, 'Edition de template', 'title', 'fr', 'menus_elements', 52, NULL);
INSERT INTO translations VALUES (25, 'Intégration vidéoliste', 'title', 'fr', 'menus_elements', 61, NULL);
INSERT INTO translations VALUES (27, 'Commandes', 'title', 'fr', 'menus_elements', 62, NULL);
INSERT INTO translations VALUES (28, 'Affectation des templates', 'title', 'fr', 'menus_elements', 63, NULL);
INSERT INTO translations VALUES (29, 'Publier', 'title', 'fr', 'menus_elements', 64, NULL);
INSERT INTO translations VALUES (30, 'Utilisateurs', 'title', 'fr', 'menus_elements', 69, NULL);
INSERT INTO translations VALUES (31, 'Accueil', 'title', 'fr', 'menus_elements', 70, NULL);
INSERT INTO translations VALUES (32, 'Statistiques par publication', 'title', 'fr', 'menus_elements', 72, NULL);
INSERT INTO translations VALUES (33, 'Statistiques par programme', 'title', 'fr', 'menus_elements', 73, NULL);
INSERT INTO translations VALUES (34, 'Statistiques', 'title', 'fr', 'menus_elements', 74, NULL);
INSERT INTO translations VALUES (35, 'Statistiques par programme', 'title', 'fr', 'menus_elements', 75, NULL);
INSERT INTO translations VALUES (36, 'Statistiques par production', 'title', 'fr', 'menus_elements', 76, NULL);
INSERT INTO translations VALUES (37, 'Liste des programmes', 'title', 'fr', 'menus_elements', 42, NULL);
INSERT INTO translations VALUES (38, 'crédits', 'title', 'fr', 'programs_fields', 98, NULL);
INSERT INTO translations VALUES (39, 'domaine', 'title', 'fr', 'programs_fields', 84, NULL);
INSERT INTO translations VALUES (40, 'durée', 'title', 'fr', 'programs_fields', 33, NULL);
INSERT INTO translations VALUES (41, 'fonction', 'title', 'fr', 'programs_fields', 97, NULL);
INSERT INTO translations VALUES (42, 'Institutionnel', 'title', 'fr', 'programs_fields', 4, NULL);
INSERT INTO translations VALUES (43, 'signal', 'title', 'fr', 'programs_fields', 76, NULL);
INSERT INTO translations VALUES (44, 'Institutionnal', 'title', 'en', 'programs_fields', 4, NULL);
INSERT INTO translations VALUES (45, 'organisation', 'title', 'fr', 'programs_fields', 69, NULL);
INSERT INTO translations VALUES (46, 'organisation details', 'title', 'fr', 'programs_fields', 70, NULL);
INSERT INTO translations VALUES (47, 'période (début)', 'title', 'fr', 'programs_fields', 75, NULL);
INSERT INTO translations VALUES (48, 'image', 'title', 'fr', 'programs_fields', 29, NULL);
INSERT INTO translations VALUES (49, 'personne', 'title', 'fr', 'programs_fields', 82, NULL);
INSERT INTO translations VALUES (50, 'person', 'title', 'en', 'programs_fields', 82, NULL);
INSERT INTO translations VALUES (51, 'personne details', 'title', 'fr', 'programs_fields', 83, NULL);
INSERT INTO translations VALUES (52, 'person details', 'title', 'en', 'programs_fields', 83, NULL);
INSERT INTO translations VALUES (56, 'subdomain', 'title', 'en', 'programs_fields', 85, NULL);
INSERT INTO translations VALUES (55, 'sous-domaine', 'title', 'fr', 'programs_fields', 85, NULL);
INSERT INTO translations VALUES (58, 'room', 'title', 'en', 'programs_fields', 88, NULL);
INSERT INTO translations VALUES (59, 'url titre 1', 'title', 'fr', 'programs_fields', 26, NULL);
INSERT INTO translations VALUES (60, 'place', 'title', 'en', 'programs_fields', 73, NULL);
INSERT INTO translations VALUES (61, 'place details', 'title', 'en', 'programs_fields', 74, NULL);
INSERT INTO translations VALUES (62, 'domaine', 'title', 'fr', 'programs_fields', 78, NULL);
INSERT INTO translations VALUES (63, 'sous-classe objet', 'title', 'fr', 'programs_fields', 103, NULL);
INSERT INTO translations VALUES (64, 'notation', 'title', 'fr', 'programs_fields', 104, NULL);
INSERT INTO translations VALUES (54, 'repertory 1', 'title', 'en', 'programs_fields', 30, NULL);
INSERT INTO translations VALUES (53, 'répertoire 1', 'title', 'fr', 'programs_fields', 30, NULL);
INSERT INTO translations VALUES (65, 'répertoire 2', 'title', 'fr', 'programs_fields', 105, NULL);
INSERT INTO translations VALUES (66, 'repertory 2', 'title', 'en', 'programs_fields', 105, NULL);
INSERT INTO translations VALUES (67, 'url 2 titre', 'title', 'fr', 'programs_fields', 107, NULL);
INSERT INTO translations VALUES (68, 'statistiques', 'title', 'fr', 'programs_fields', 108, NULL);
INSERT INTO translations VALUES (69, 'période (fin)', 'title', 'fr', 'programs_fields', 110, NULL);
INSERT INTO translations VALUES (70, 'secteur', 'title', 'fr', 'programs_fields', 112, NULL);
INSERT INTO translations VALUES (71, 'support', 'title', 'fr', 'programs_fields', 113, NULL);
INSERT INTO translations VALUES (72, 'classe', 'title', 'fr', 'programs_fields', 114, NULL);
INSERT INTO translations VALUES (73, 'remarque', 'title', 'fr', 'programs_fields', 115, NULL);
INSERT INTO translations VALUES (74, 'audiovisuel', 'title', 'fr', 'programs_fields', 116, NULL);
INSERT INTO translations VALUES (76, 'Gestionnaire de chapitre', 'title', 'fr', 'menus_elements', 53, NULL);
INSERT INTO translations VALUES (77, 'Gestionnaire de chapitre', 'title', 'fr', 'menus_elements', 65, NULL);