--
-- PostgreSQL database dump
--

-- Started on 2012-12-20 12:24:05 IST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2546 (class 0 OID 0)
-- Dependencies: 163
-- Name: agencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('agencies_id_seq', 3, true);


--
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 181
-- Name: agency_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('agency_stores_id_seq', 1, false);


--
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 151
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('appointments_id_seq', 2, true);


--
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 209
-- Name: approvers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('approvers_id_seq', 1, false);


--
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 255
-- Name: building_asset_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('building_asset_types_id_seq', 74, true);


--
-- TOC entry 2551 (class 0 OID 0)
-- Dependencies: 177
-- Name: categories_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_departments_id_seq', 1, false);


--
-- TOC entry 2552 (class 0 OID 0)
-- Dependencies: 165
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 8, true);


--
-- TOC entry 2553 (class 0 OID 0)
-- Dependencies: 147
-- Name: classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('classifications_id_seq', 27, true);


--
-- TOC entry 2554 (class 0 OID 0)
-- Dependencies: 157
-- Name: cms_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cms_pages_id_seq', 1, false);


--
-- TOC entry 2555 (class 0 OID 0)
-- Dependencies: 253
-- Name: complaint_building_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('complaint_building_assets_id_seq', 1, false);


--
-- TOC entry 2556 (class 0 OID 0)
-- Dependencies: 261
-- Name: complaint_computers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('complaint_computers_id_seq', 1, false);


--
-- TOC entry 2557 (class 0 OID 0)
-- Dependencies: 259
-- Name: complaint_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('complaint_types_id_seq', 5, true);


--
-- TOC entry 2558 (class 0 OID 0)
-- Dependencies: 189
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conversations_id_seq', 1, false);


--
-- TOC entry 2559 (class 0 OID 0)
-- Dependencies: 251
-- Name: damage_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('damage_types_id_seq', 6, true);


--
-- TOC entry 2560 (class 0 OID 0)
-- Dependencies: 271
-- Name: declaration_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('declaration_properties_id_seq', 1, false);


--
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 143
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('departments_id_seq', 6, true);


--
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 193
-- Name: drivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('drivers_id_seq', 11, true);


--
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 269
-- Name: emergency_references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('emergency_references_id_seq', 1, false);


--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 205
-- Name: equipment_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipment_categories_id_seq', 23, true);


--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 201
-- Name: facilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facilities_id_seq', 1, false);


--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 217
-- Name: facility_ict_agencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facility_ict_agencies_id_seq', 1, false);


--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 215
-- Name: facility_ict_hardwares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facility_ict_hardwares_id_seq', 7, true);


--
-- TOC entry 2568 (class 0 OID 0)
-- Dependencies: 219
-- Name: facility_ict_servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facility_ict_servers_id_seq', 2, true);


--
-- TOC entry 2569 (class 0 OID 0)
-- Dependencies: 221
-- Name: facility_ict_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facility_ict_services_id_seq', 76, true);


--
-- TOC entry 2570 (class 0 OID 0)
-- Dependencies: 213
-- Name: facility_ict_softwares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facility_ict_softwares_id_seq', 11, true);


--
-- TOC entry 2571 (class 0 OID 0)
-- Dependencies: 223
-- Name: facility_ict_wirings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facility_ict_wirings_id_seq', 28, true);


--
-- TOC entry 2572 (class 0 OID 0)
-- Dependencies: 243
-- Name: facility_icts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facility_icts_id_seq', 6, true);


--
-- TOC entry 2573 (class 0 OID 0)
-- Dependencies: 237
-- Name: ict_firewall_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ict_firewall_services_id_seq', 1, false);


--
-- TOC entry 2574 (class 0 OID 0)
-- Dependencies: 235
-- Name: ict_firewalls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ict_firewalls_id_seq', 1, false);


--
-- TOC entry 2575 (class 0 OID 0)
-- Dependencies: 249
-- Name: ict_hardware_booked_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ict_hardware_booked_statuses_id_seq', 1, false);


--
-- TOC entry 2576 (class 0 OID 0)
-- Dependencies: 247
-- Name: ict_hardware_booked_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ict_hardware_booked_users_id_seq', 1, false);


--
-- TOC entry 2577 (class 0 OID 0)
-- Dependencies: 245
-- Name: ict_hardware_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ict_hardware_bookings_id_seq', 1, false);


--
-- TOC entry 2578 (class 0 OID 0)
-- Dependencies: 229
-- Name: ict_network_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ict_network_points_id_seq', 1, false);


--
-- TOC entry 2579 (class 0 OID 0)
-- Dependencies: 233
-- Name: ict_system_accesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ict_system_accesses_id_seq', 1, false);


--
-- TOC entry 2580 (class 0 OID 0)
-- Dependencies: 231
-- Name: ict_vpns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ict_vpns_id_seq', 1, false);


--
-- TOC entry 2581 (class 0 OID 0)
-- Dependencies: 179
-- Name: message_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('message_comments_id_seq', 1, false);


--
-- TOC entry 2582 (class 0 OID 0)
-- Dependencies: 171
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messages_id_seq', 1, false);


--
-- TOC entry 2583 (class 0 OID 0)
-- Dependencies: 267
-- Name: outstations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('outstations_id_seq', 1, false);


--
-- TOC entry 2584 (class 0 OID 0)
-- Dependencies: 211
-- Name: requisition_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requisition_types_id_seq', 6, true);


--
-- TOC entry 2585 (class 0 OID 0)
-- Dependencies: 185
-- Name: resource_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_bookings_id_seq', 1, false);


--
-- TOC entry 2586 (class 0 OID 0)
-- Dependencies: 207
-- Name: resource_ict_equipment_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_ict_equipment_bookings_id_seq', 1, false);


--
-- TOC entry 2587 (class 0 OID 0)
-- Dependencies: 183
-- Name: resource_managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_managers_id_seq', 1, false);


--
-- TOC entry 2588 (class 0 OID 0)
-- Dependencies: 227
-- Name: resource_requisitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_requisitions_id_seq', 1, false);


--
-- TOC entry 2589 (class 0 OID 0)
-- Dependencies: 203
-- Name: resource_room_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_room_bookings_id_seq', 1, false);


--
-- TOC entry 2590 (class 0 OID 0)
-- Dependencies: 191
-- Name: resource_transportation_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_transportation_bookings_id_seq', 1, false);


--
-- TOC entry 2591 (class 0 OID 0)
-- Dependencies: 175
-- Name: resource_vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_vendors_id_seq', 1, false);


--
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 169
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resources_id_seq', 1, false);


--
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 161
-- Name: role_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_memberships_id_seq', 27, true);


--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 159
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 5, true);


--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 199
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rooms_id_seq', 1, false);


--
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 145
-- Name: service_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('service_levels_id_seq', 4, true);


--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 149
-- Name: service_standards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('service_standards_id_seq', 6, true);


--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 263
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('settings_id_seq', 1, false);


--
-- TOC entry 2599 (class 0 OID 0)
-- Dependencies: 241
-- Name: software_installation_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('software_installation_details_id_seq', 1, false);


--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 239
-- Name: software_installations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('software_installations_id_seq', 1, false);


--
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 155
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('states_id_seq', 16, true);


--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 167
-- Name: sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sub_categories_id_seq', 106, true);


--
-- TOC entry 2603 (class 0 OID 0)
-- Dependencies: 225
-- Name: system_accesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('system_accesses_id_seq', 18, true);


--
-- TOC entry 2604 (class 0 OID 0)
-- Dependencies: 257
-- Name: system_model_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('system_model_types_id_seq', 117, true);


--
-- TOC entry 2605 (class 0 OID 0)
-- Dependencies: 153
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('units_id_seq', 1, false);


--
-- TOC entry 2606 (class 0 OID 0)
-- Dependencies: 265
-- Name: user_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_services_id_seq', 1, false);


--
-- TOC entry 2607 (class 0 OID 0)
-- Dependencies: 141
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 26, true);


--
-- TOC entry 2608 (class 0 OID 0)
-- Dependencies: 195
-- Name: vehicle_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicle_types_id_seq', 6, true);


--
-- TOC entry 2609 (class 0 OID 0)
-- Dependencies: 197
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicles_id_seq', 16, true);


--
-- TOC entry 2610 (class 0 OID 0)
-- Dependencies: 187
-- Name: vendor_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vendor_stores_id_seq', 1, false);


--
-- TOC entry 2611 (class 0 OID 0)
-- Dependencies: 173
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vendors_id_seq', 4, true);


--
-- TOC entry 2489 (class 0 OID 27285)
-- Dependencies: 164
-- Data for Name: agencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agencies (id, name, user_id, address, telephone_number, fax_number, is_active, deleted, created_at, updated_at) FROM stdin;
1	Agency_one	\N	Agency One	012-345-1111	\N	t	f	2012-12-20 06:34:11.581531	2012-12-20 06:34:11.581531
2	Agency_two	\N	Agency Two	012-345-2222	\N	t	f	2012-12-20 06:34:11.606749	2012-12-20 06:34:11.606749
3	Agency_three	\N	Agency Two	012-345-3333	\N	t	f	2012-12-20 06:34:11.614772	2012-12-20 06:34:11.614772
\.


--
-- TOC entry 2498 (class 0 OID 27388)
-- Dependencies: 182
-- Data for Name: agency_stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agency_stores (id, agency_id, category_id, sub_category_id, driver_id, resource_type, resource_id, quantity, serial_no, uom, booked, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2483 (class 0 OID 27220)
-- Dependencies: 152
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY appointments (id, name, created_at, updated_at) FROM stdin;
1	Lantikan Terus	2012-12-20 06:34:00.594578	2012-12-20 06:34:00.594578
2	Kenaikan Pangkat Secara Lantikan (KPSL)	2012-12-20 06:34:00.647211	2012-12-20 06:34:00.647211
\.


--
-- TOC entry 2512 (class 0 OID 27550)
-- Dependencies: 210
-- Data for Name: approvers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY approvers (id, user_id, department_id, is_active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2535 (class 0 OID 27792)
-- Dependencies: 256
-- Data for Name: building_asset_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY building_asset_types (id, name, parent_type_id, created_at, updated_at) FROM stdin;
4	Meja\n	\N	2012-12-20 06:34:20.755812	2012-12-20 06:34:20.755812
5	Kerusi\n	\N	2012-12-20 06:34:20.764109	2012-12-20 06:34:20.764109
7	Kipas\n	\N	2012-12-20 06:34:20.780763	2012-12-20 06:34:20.780763
8	Televisyen\n	\N	2012-12-20 06:34:20.789115	2012-12-20 06:34:20.789115
9	Sistem PA\n	\N	2012-12-20 06:34:20.797457	2012-12-20 06:34:20.797457
10	Pintu\n	\N	2012-12-20 06:34:20.805935	2012-12-20 06:34:20.805935
12	Paip\n	\N	2012-12-20 06:34:20.822444	2012-12-20 06:34:20.822444
13	Mesin Perakam Waktu\n	\N	2012-12-20 06:34:20.830779	2012-12-20 06:34:20.830779
16	Iris (Sistem Kawalan Pintu)\n	\N	2012-12-20 06:34:20.855762	2012-12-20 06:34:20.855762
18	Peralatan Tandas\n	\N	2012-12-20 06:34:20.872422	2012-12-20 06:34:20.872422
19	Tingkap\n	\N	2012-12-20 06:34:20.880731	2012-12-20 06:34:20.880731
20	Almari/Kabinet\n	\N	2012-12-20 06:34:20.889072	2012-12-20 06:34:20.889072
22	Pintu-Tombol Pintu\n	\N	2012-12-20 06:34:20.905738	2012-12-20 06:34:20.905738
23	Paip-Paip Tandas\n	\N	2012-12-20 06:34:20.914077	2012-12-20 06:34:20.914077
24	Tandas (Flush Tandas)\n	\N	2012-12-20 06:34:20.922413	2012-12-20 06:34:20.922413
25	Tandas (Paip)\n	\N	2012-12-20 06:34:20.930721	2012-12-20 06:34:20.930721
26	Tandas (Penutup Tandas)\n	\N	2012-12-20 06:34:20.939065	2012-12-20 06:34:20.939065
27	Tiada Bekalan Elektrik\n	\N	2012-12-20 06:34:20.947386	2012-12-20 06:34:20.947386
28	Penghawa Dingin (Tidak Sejuk)\n	\N	2012-12-20 06:34:20.95573	2012-12-20 06:34:20.95573
29	Penghawa Dingin (Bocor)\n	\N	2012-12-20 06:34:20.964043	2012-12-20 06:34:20.964043
30	Penghawa Dingin (Tidak Berfungsi)\n	\N	2012-12-20 06:34:20.972397	2012-12-20 06:34:20.972397
31	Lampu (Terbakar)\n	\N	2012-12-20 06:34:20.980709	2012-12-20 06:34:20.980709
32	Lampu (Tidak Berfungsi)\n	\N	2012-12-20 06:34:20.989052	2012-12-20 06:34:20.989052
33	Lampu (Berkelip)\n	\N	2012-12-20 06:34:20.997491	2012-12-20 06:34:20.997491
36	Harta Modal\n	\N	2012-12-20 06:34:21.02247	2012-12-20 06:34:21.02247
37	Inventori\n	\N	2012-12-20 06:34:21.030773	2012-12-20 06:34:21.030773
38	Kereta\n	\N	2012-12-20 06:34:21.039109	2012-12-20 06:34:21.039109
39	Lain-lain Inventori\n	\N	2012-12-20 06:34:21.047423	2012-12-20 06:34:21.047423
41	Luar Bangunan\n	\N	2012-12-20 06:34:21.064083	2012-12-20 06:34:21.064083
42	Dalam Bangunan\n	\N	2012-12-20 06:34:21.072436	2012-12-20 06:34:21.072436
43	Lain-lain\n	\N	2012-12-20 06:34:21.080745	2012-12-20 06:34:21.080745
44	Tong Sampah\n	\N	2012-12-20 06:34:21.089087	2012-12-20 06:34:21.089087
45	Longkang\n	\N	2012-12-20 06:34:21.097445	2012-12-20 06:34:21.097445
46	Pasu Bunga\n	\N	2012-12-20 06:34:21.105763	2012-12-20 06:34:21.105763
47	Tempat Kenderaan\n	\N	2012-12-20 06:34:21.114062	2012-12-20 06:34:21.114062
48	Kawasan Padang\n	\N	2012-12-20 06:34:21.122418	2012-12-20 06:34:21.122418
49	Syiling\n	\N	2012-12-20 06:34:21.130722	2012-12-20 06:34:21.130722
50	Laluan Susur Gajah\n	\N	2012-12-20 06:34:21.13907	2012-12-20 06:34:21.13907
51	Bumbung\n	\N	2012-12-20 06:34:21.147384	2012-12-20 06:34:21.147384
52	Karpet\n	\N	2012-12-20 06:34:21.155728	2012-12-20 06:34:21.155728
53	Tong Sampah\n	\N	2012-12-20 06:34:21.164043	2012-12-20 06:34:21.164043
54	Telefon\n	\N	2012-12-20 06:34:21.172404	2012-12-20 06:34:21.172404
55	Kerusi\n	\N	2012-12-20 06:34:21.180713	2012-12-20 06:34:21.180713
56	Dinding\n	\N	2012-12-20 06:34:21.189054	2012-12-20 06:34:21.189054
57	Cermin Tingkap\n	\N	2012-12-20 06:34:21.197373	2012-12-20 06:34:21.197373
58	Cermin Pintu/Dinding\n	\N	2012-12-20 06:34:21.205746	2012-12-20 06:34:21.205746
59	Lantai\n	\N	2012-12-20 06:34:21.214027	2012-12-20 06:34:21.214027
60	Pintu\n	\N	2012-12-20 06:34:21.22239	2012-12-20 06:34:21.22239
61	Sinki\n	\N	2012-12-20 06:34:21.2307	2012-12-20 06:34:21.2307
62	Mangkuk Tandas\n	\N	2012-12-20 06:34:21.239025	2012-12-20 06:34:21.239025
63	Kipas\n	\N	2012-12-20 06:34:21.247357	2012-12-20 06:34:21.247357
64	Tingkap\n	\N	2012-12-20 06:34:21.255681	2012-12-20 06:34:21.255681
65	Cermin\n	\N	2012-12-20 06:34:21.264031	2012-12-20 06:34:21.264031
66	Senitizer Bin\n	\N	2012-12-20 06:34:21.272353	2012-12-20 06:34:21.272353
67	Syiling\n	\N	2012-12-20 06:34:21.280678	2012-12-20 06:34:21.280678
68	Tempat wuduk\n	\N	2012-12-20 06:34:21.289006	2012-12-20 06:34:21.289006
69	Tandas\n	\N	2012-12-20 06:34:21.297368	2012-12-20 06:34:21.297368
70	Kerusi Tetamu\n	\N	2012-12-20 06:34:21.305667	2012-12-20 06:34:21.305667
71	Testing 1\n	\N	2012-12-20 06:34:21.314011	2012-12-20 06:34:21.314011
72	Testing 2\n	\N	2012-12-20 06:34:21.322337	2012-12-20 06:34:21.322337
73	Testing 3\n	\N	2012-12-20 06:34:21.330834	2012-12-20 06:34:21.330834
74	Testing 4\n	\N	2012-12-20 06:34:21.339074	2012-12-20 06:34:21.339074
1	Building\n	1	2012-12-20 06:34:20.670435	2012-12-20 06:34:20.670435
2	Mechanical\n	2	2012-12-20 06:34:20.73933	2012-12-20 06:34:20.73933
3	Electrical\n	2	2012-12-20 06:34:20.747528	2012-12-20 06:34:20.747528
11	Telefon\n	3	2012-12-20 06:34:20.814201	2012-12-20 06:34:20.814201
14	Lampu\n	3	2012-12-20 06:34:20.839093	2012-12-20 06:34:20.839093
15	Soket Elektrik\n	3	2012-12-20 06:34:20.847455	2012-12-20 06:34:20.847455
17	Lift\n	2	2012-12-20 06:34:20.864097	2012-12-20 06:34:20.864097
21	Suis Elektrik\n	3	2012-12-20 06:34:20.897374	2012-12-20 06:34:20.897374
6	Penghawa Dingin\n	2	2012-12-20 06:34:20.772462	2012-12-20 06:34:20.772462
34	Asset\n	1	2012-12-20 06:34:21.005792	2012-12-20 06:34:21.005792
35	Civil\n	2	2012-12-20 06:34:21.0141	2012-12-20 06:34:21.0141
40	Cleanliness\n	1	2012-12-20 06:34:21.055773	2012-12-20 06:34:21.055773
\.


--
-- TOC entry 2490 (class 0 OID 27298)
-- Dependencies: 166
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, name, is_active, deleted, created_at, updated_at) FROM stdin;
1	Stationery Item	t	f	2012-12-20 06:34:16.747974	2012-12-20 06:34:16.747974
2	Computer Hardware and Accessories	t	f	2012-12-20 06:34:16.7636	2012-12-20 06:34:16.7636
3	Computer Software	t	f	2012-12-20 06:34:16.771666	2012-12-20 06:34:16.771666
4	Communications	t	f	2012-12-20 06:34:16.779984	2012-12-20 06:34:16.779984
5	Office Furniture and Equipment	t	f	2012-12-20 06:34:16.7883	2012-12-20 06:34:16.7883
6	Room	t	f	2012-12-20 06:34:16.796628	2012-12-20 06:34:16.796628
7	Transportation	t	f	2012-12-20 06:34:16.804934	2012-12-20 06:34:16.804934
8	ICT Equipment	t	f	2012-12-20 06:34:16.8134	2012-12-20 06:34:16.8134
\.


--
-- TOC entry 2496 (class 0 OID 27368)
-- Dependencies: 178
-- Data for Name: categories_departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories_departments (id, category_id, department_id, is_active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2481 (class 0 OID 27201)
-- Dependencies: 148
-- Data for Name: classifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY classifications (id, code, title, created_at, updated_at) FROM stdin;
1	A	Pengangkutan	2012-12-20 06:34:00.260124	2012-12-20 06:34:00.260124
2	B	Bakat dan Seni	2012-12-20 06:34:00.312655	2012-12-20 06:34:00.312655
3	C	Sains	2012-12-20 06:34:00.313667	2012-12-20 06:34:00.313667
4	D	Pendidikan	2012-12-20 06:34:00.314584	2012-12-20 06:34:00.314584
5	E	Ekonomi	2012-12-20 06:34:00.315471	2012-12-20 06:34:00.315471
6	F	Sistem Maklumat	2012-12-20 06:34:00.316369	2012-12-20 06:34:00.316369
7	G	Pertanian	2012-12-20 06:34:00.31726	2012-12-20 06:34:00.31726
8	J	Kejuruteraan	2012-12-20 06:34:00.318156	2012-12-20 06:34:00.318156
9	K	Keselamatan dan Pertahanan Awam	2012-12-20 06:34:00.319043	2012-12-20 06:34:00.319043
10	L	Perundangan dan Kehakiman	2012-12-20 06:34:00.319935	2012-12-20 06:34:00.319935
11	M	Tadbir dan Diplomatik	2012-12-20 06:34:00.32084	2012-12-20 06:34:00.32084
12	N	Pentadbiran dan Sokongan	2012-12-20 06:34:00.321728	2012-12-20 06:34:00.321728
13	Q	Penyelidikan dan Pembangunan	2012-12-20 06:34:00.322607	2012-12-20 06:34:00.322607
14	R	Mahir/Separuh Mahir/Tidak Mahir	2012-12-20 06:34:00.323501	2012-12-20 06:34:00.323501
15	S	Sosial	2012-12-20 06:34:00.324396	2012-12-20 06:34:00.324396
16	U	Perubatan dan Kesihatan	2012-12-20 06:34:00.325275	2012-12-20 06:34:00.325275
17	W	Kewangan	2012-12-20 06:34:00.326148	2012-12-20 06:34:00.326148
18	X	Penguatkuasaan Maritim	2012-12-20 06:34:00.327018	2012-12-20 06:34:00.327018
19	Y	Polis	2012-12-20 06:34:00.327889	2012-12-20 06:34:00.327889
20	Z	Angkatan Tentera Malaysia	2012-12-20 06:34:00.328779	2012-12-20 06:34:00.328779
21	JUSA	JUSA	2012-12-20 06:34:00.32973	2012-12-20 06:34:00.32973
22	FT	Sistem Maklumat	2012-12-20 06:34:00.330628	2012-12-20 06:34:00.330628
23	NP	Pentadbiran dan Sokongan	2012-12-20 06:34:00.331501	2012-12-20 06:34:00.331501
24	NT	Pentadbiran dan Sokongan	2012-12-20 06:34:00.332385	2012-12-20 06:34:00.332385
25	LS	Perundangan dan Kehakiman Syariah	2012-12-20 06:34:00.33326	2012-12-20 06:34:00.33326
26	DG	Perkhidmatan Pendidikan Siswazah	2012-12-20 06:34:00.334134	2012-12-20 06:34:00.334134
27	DGA	Perkhidmatan Pendidikan Lepasan Diploma	2012-12-20 06:34:00.335002	2012-12-20 06:34:00.335002
\.


--
-- TOC entry 2486 (class 0 OID 27252)
-- Dependencies: 158
-- Data for Name: cms_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cms_pages (id, title, attachement, content, location, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2534 (class 0 OID 27777)
-- Dependencies: 254
-- Data for Name: complaint_building_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY complaint_building_assets (id, building_asset_type_id, user_id, department_id, type_id, item_id, location, serial_no, reason, repair_action, spare_part_action, action_taken, given_date, receipt_date, comments, vendor_id, status, forward_to, remarks, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2538 (class 0 OID 27816)
-- Dependencies: 262
-- Data for Name: complaint_computers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY complaint_computers (id, complaint_type_id, system_access_id, system_model_type_id, user_id, department_id, serial_no, reason, action_taken, given_date, receipt_date, comments, vendor_id, status, forward_to, remarks, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2537 (class 0 OID 27808)
-- Dependencies: 260
-- Data for Name: complaint_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY complaint_types (id, name, created_at, updated_at) FROM stdin;
1	Hardware\n	2012-12-20 06:34:22.437688	2012-12-20 06:34:22.437688
2	System\n	2012-12-20 06:34:22.464242	2012-12-20 06:34:22.464242
3	Network\n	2012-12-20 06:34:22.472403	2012-12-20 06:34:22.472403
4	Application\n	2012-12-20 06:34:22.480716	2012-12-20 06:34:22.480716
5	Other\n	2012-12-20 06:34:22.48902	2012-12-20 06:34:22.48902
\.


--
-- TOC entry 2502 (class 0 OID 27434)
-- Dependencies: 190
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conversations (id, from_userid, to_userid, content, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2533 (class 0 OID 27769)
-- Dependencies: 252
-- Data for Name: damage_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY damage_types (id, name, parent_type_id, building_asset_type_id, created_at, updated_at) FROM stdin;
1	Building	0	1	2012-12-20 06:34:20.570536	2012-12-20 06:34:20.570536
2	Asset	0	34	2012-12-20 06:34:20.597735	2012-12-20 06:34:20.597735
3	Cleanliness	0	40	2012-12-20 06:34:20.605978	2012-12-20 06:34:20.605978
4	Mechanical	1	2	2012-12-20 06:34:20.614215	2012-12-20 06:34:20.614215
5	Electrical	1	3	2012-12-20 06:34:20.622554	2012-12-20 06:34:20.622554
6	Civil	1	35	2012-12-20 06:34:20.630866	2012-12-20 06:34:20.630866
\.


--
-- TOC entry 2543 (class 0 OID 27870)
-- Dependencies: 272
-- Data for Name: declaration_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY declaration_properties (id, user_id, property_file, property_year, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2479 (class 0 OID 27180)
-- Dependencies: 144
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY departments (id, name, agency_id, address, telephone_number, fax_number, order_by, is_active, deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Jabatan Ketua Menteri Melaka	1	Dept One	012-345-4444	\N	\N	t	f	\N	\N	2012-12-20 06:34:11.709806	2012-12-20 06:34:11.709806
2	Jabatan Mufti Negeri Melaka	1	Dept Two	012-345-5555	\N	\N	t	f	\N	\N	2012-12-20 06:34:11.723375	2012-12-20 06:34:11.723375
3	Jabatan Agama Islam Melaka	2	Dept Three	012-345-6666	\N	\N	t	f	\N	\N	2012-12-20 06:34:11.731401	2012-12-20 06:34:11.731401
4	Jabatan Kerja Raya Melaka	2	Dept Four	012-345-7777	\N	\N	t	f	\N	\N	2012-12-20 06:34:11.739736	2012-12-20 06:34:11.739736
5	Jabatan Pertanian Negeri Melaka	3	Dept Five	012-345-8888	\N	\N	t	f	\N	\N	2012-12-20 06:34:11.748061	2012-12-20 06:34:11.748061
6	Jabatan Kebajikan Masyarakat	3	Dept Six	012-345-9999	\N	\N	t	f	\N	\N	2012-12-20 06:34:11.756381	2012-12-20 06:34:11.756381
\.


--
-- TOC entry 2504 (class 0 OID 27458)
-- Dependencies: 194
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY drivers (id, registration_id, name, telephone_number, is_active, deleted, informed, already_assigned, created_at, updated_at) FROM stdin;
1	60	RAMLI BIN AHMAD	012 6412622\n	t	f	f	f	2012-12-20 06:34:11.156389	2012-12-20 06:34:11.156389
2	15	MD ZANI BIN AHMAD	012 3634731\n	t	f	f	f	2012-12-20 06:34:11.181088	2012-12-20 06:34:11.181088
3	57	RAHMAT BIN RAHMAN	013 6117140\n	t	f	f	f	2012-12-20 06:34:11.18925	2012-12-20 06:34:11.18925
4	68	AZWAN PSM	013 6123437\n	t	f	f	f	2012-12-20 06:34:11.197648	2012-12-20 06:34:11.197648
5	66	RAMLY BIN RAHIM	017 6412258\n	t	f	f	f	2012-12-20 06:34:11.206126	2012-12-20 06:34:11.206126
6	69	khalidmd hasan	012 6524387\n	t	f	f	f	2012-12-20 06:34:11.214288	2012-12-20 06:34:11.214288
7	58	KHALID BIN MD HASAN	012 6524387\n	t	f	f	f	2012-12-20 06:34:11.222644	2012-12-20 06:34:11.222644
8	67	YAKOP BIN MOHD	017 6679633\n	t	f	f	f	2012-12-20 06:34:11.230941	2012-12-20 06:34:11.230941
9	70	RAMLI RAHIM	0176412258\n	t	f	f	f	2012-12-20 06:34:11.239265	2012-12-20 06:34:11.239265
10	44	KARIM BIN ABU SAMAH	012 6374589\n	t	f	f	f	2012-12-20 06:34:11.289711	2012-12-20 06:34:11.289711
11	46	MD ISAM BIN MD YASAN	013 6363550	t	f	f	f	2012-12-20 06:34:11.297834	2012-12-20 06:34:11.297834
\.


--
-- TOC entry 2542 (class 0 OID 27859)
-- Dependencies: 270
-- Data for Name: emergency_references; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY emergency_references (id, name, address, phone_no, relation, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2510 (class 0 OID 27528)
-- Dependencies: 206
-- Data for Name: equipment_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equipment_categories (id, name, is_active, created_at, updated_at) FROM stdin;
1	Notebook\n	t	2012-12-20 06:34:18.108086	2012-12-20 06:34:18.108086
2	LCD Projector\n	t	2012-12-20 06:34:18.129465	2012-12-20 06:34:18.129465
3	Laser Pointer\n	t	2012-12-20 06:34:18.137659	2012-12-20 06:34:18.137659
4	Pegawai Teknikal\n	t	2012-12-20 06:34:18.145916	2012-12-20 06:34:18.145916
5	White Screen\n	t	2012-12-20 06:34:18.154261	2012-12-20 06:34:18.154261
6	VGA Cable 1.8 meter\n	t	2012-12-20 06:34:18.162569	2012-12-20 06:34:18.162569
7	Network Cable 3m\n	t	2012-12-20 06:34:18.170916	2012-12-20 06:34:18.170916
8	Network Cable 5m\n	t	2012-12-20 06:34:18.179232	2012-12-20 06:34:18.179232
9	Network Cable 10m\n	t	2012-12-20 06:34:18.187588	2012-12-20 06:34:18.187588
10	VGA Cable 5 meter\n	t	2012-12-20 06:34:18.195891	2012-12-20 06:34:18.195891
11	VGA Cable 10 meter\n	t	2012-12-20 06:34:18.204355	2012-12-20 06:34:18.204355
12	Power Cable\n	t	2012-12-20 06:34:18.212669	2012-12-20 06:34:18.212669
13	Extension Wire \n	t	2012-12-20 06:34:18.221022	2012-12-20 06:34:18.221022
14	VGA Cable 20 meter\n	t	2012-12-20 06:34:18.229336	2012-12-20 06:34:18.229336
15	Scanner\n	t	2012-12-20 06:34:18.237678	2012-12-20 06:34:18.237678
16	pendrive(8GB)\n	t	2012-12-20 06:34:18.245983	2012-12-20 06:34:18.245983
17	PROBLEM\n	t	2012-12-20 06:34:18.254314	2012-12-20 06:34:18.254314
18	LCD Wide Screen 10x8\n	t	2012-12-20 06:34:18.262651	2012-12-20 06:34:18.262651
19	Projector Besar\n	t	2012-12-20 06:34:18.270975	2012-12-20 06:34:18.270975
20	TV\n	t	2012-12-20 06:34:18.27931	2012-12-20 06:34:18.27931
21	SPLITER \n	t	2012-12-20 06:34:18.287634	2012-12-20 06:34:18.287634
22	FOOT PEDAL\n	t	2012-12-20 06:34:18.295979	2012-12-20 06:34:18.295979
23	NOTEBOOK SUKMA\n	t	2012-12-20 06:34:18.304301	2012-12-20 06:34:18.304301
\.


--
-- TOC entry 2508 (class 0 OID 27505)
-- Dependencies: 202
-- Data for Name: facilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facilities (id, resource_type, sub_category_id, vehicle_id, resource_id, ict_id, name, total_qty, is_active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2516 (class 0 OID 27588)
-- Dependencies: 218
-- Data for Name: facility_ict_agencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facility_ict_agencies (id, name, is_active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2515 (class 0 OID 27578)
-- Dependencies: 216
-- Data for Name: facility_ict_hardwares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facility_ict_hardwares (id, name, is_active, deleted, created_at, updated_at) FROM stdin;
1	Switch\n	t	f	2012-12-20 06:34:19.923653	2012-12-20 06:34:19.923653
2	24 port\n	t	f	2012-12-20 06:34:19.960487	2012-12-20 06:34:19.960487
3	48 port\n	t	f	2012-12-20 06:34:19.981219	2012-12-20 06:34:19.981219
4	Patch Panel\n	t	f	2012-12-20 06:34:19.996786	2012-12-20 06:34:19.996786
5	Patch Cord\n	t	f	2012-12-20 06:34:20.014653	2012-12-20 06:34:20.014653
6	2.5 meter\n	t	f	2012-12-20 06:34:20.02265	2012-12-20 06:34:20.02265
7	> 2.5 meter\n	t	f	2012-12-20 06:34:20.030938	2012-12-20 06:34:20.030938
\.


--
-- TOC entry 2517 (class 0 OID 27598)
-- Dependencies: 220
-- Data for Name: facility_ict_servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facility_ict_servers (id, name, ip, is_active, deleted, created_at, updated_at) FROM stdin;
1	Tun Razak 1	172.10.10.172	f	f	2012-12-20 06:34:20.178916	2012-12-20 06:34:20.178916
2	Tun Razak 2	172.10.10.173	f	f	2012-12-20 06:34:20.206207	2012-12-20 06:34:20.206207
\.


--
-- TOC entry 2518 (class 0 OID 27611)
-- Dependencies: 222
-- Data for Name: facility_ict_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facility_ict_services (id, name, port, is_active, deleted, created_at, updated_at) FROM stdin;
1	AFS3	TCP/7000-7009 UDP/7000-7009\n	t	f	2012-12-20 06:34:18.932369	2012-12-20 06:34:18.932369
2	AOL	TCP/5190-5194\n	t	f	2012-12-20 06:34:18.954437	2012-12-20 06:34:18.954437
3	BGP	TCP/179\n	t	f	2012-12-20 06:34:18.962689	2012-12-20 06:34:18.962689
4	CVSPSERVER	TCP/2401 UDP/2401\n	t	f	2012-12-20 06:34:18.970923	2012-12-20 06:34:18.970923
5	DCE-RPC	TCP/135 UDP/135\n	t	f	2012-12-20 06:34:18.979274	2012-12-20 06:34:18.979274
6	DHCP	UDP/67-68\n	t	f	2012-12-20 06:34:18.987577	2012-12-20 06:34:18.987577
7	DHCP6	UDP/546	t	f	2012-12-20 06:34:18.995926	2012-12-20 06:34:18.995926
8	DNS	TCP/53 UDP/53\n	t	f	2012-12-20 06:34:19.00441	2012-12-20 06:34:19.00441
9	ESP	IP/50\n	t	f	2012-12-20 06:34:19.012651	2012-12-20 06:34:19.012651
10	FINGER	TCP/79\n	t	f	2012-12-20 06:34:19.020901	2012-12-20 06:34:19.020901
11	FTP	TCP/21\n	t	f	2012-12-20 06:34:19.029245	2012-12-20 06:34:19.029245
12	FTP_GET	TCP/21\n	t	f	2012-12-20 06:34:19.03755	2012-12-20 06:34:19.03755
13	FTP_PUT	TCP/21\n	t	f	2012-12-20 06:34:19.045901	2012-12-20 06:34:19.045901
14	GOPHER	TCP/70\n	t	f	2012-12-20 06:34:19.054242	2012-12-20 06:34:19.054242
15	GRE	IP/47\n	t	f	2012-12-20 06:34:19.062555	2012-12-20 06:34:19.062555
16	H323	TCP/1720-1503 UDP/1719\n	t	f	2012-12-20 06:34:19.070868	2012-12-20 06:34:19.070868
17	HTTP	TCP/80\n	t	f	2012-12-20 06:34:19.079223	2012-12-20 06:34:19.079223
18	HTTPS	TCP/443\n	t	f	2012-12-20 06:34:19.087544	2012-12-20 06:34:19.087544
19	ICMP_ANY	ICMP/ANY\n	t	f	2012-12-20 06:34:19.095978	2012-12-20 06:34:19.095978
20	IKE	UDP/500	t	f	2012-12-20 06:34:19.104289	2012-12-20 06:34:19.104289
21	IMAP	TCP/143\n	t	f	2012-12-20 06:34:19.112634	2012-12-20 06:34:19.112634
22	IMAPS	TCP/993\n	t	f	2012-12-20 06:34:19.120943	2012-12-20 06:34:19.120943
23	INFO_ADDRESS	ICMP/17\n	t	f	2012-12-20 06:34:19.129266	2012-12-20 06:34:19.129266
24	INFO_REQUEST	ICMP/15\n	t	f	2012-12-20 06:34:19.137614	2012-12-20 06:34:19.137614
25	IRC	TCP/6660-6669\n	t	f	2012-12-20 06:34:19.145931	2012-12-20 06:34:19.145931
26	Internet-Locator-Service	TCP/389\n	t	f	2012-12-20 06:34:19.154269	2012-12-20 06:34:19.154269
27	L2TP	TCP/1701 UDP/1701\n	t	f	2012-12-20 06:34:19.162581	2012-12-20 06:34:19.162581
28	LDAP	TCP/389\n	t	f	2012-12-20 06:34:19.170929	2012-12-20 06:34:19.170929
29	MGCP	UDP/2427-2727\n	t	f	2012-12-20 06:34:19.179261	2012-12-20 06:34:19.179261
30	MS-SQL	TCP/1433-1434\n	t	f	2012-12-20 06:34:19.187914	2012-12-20 06:34:19.187914
31	MYSQL	TCP/3306\n	t	f	2012-12-20 06:34:19.26259	2012-12-20 06:34:19.26259
32	NFS"	TCP/111-2049 UDP/111-2049\n	t	f	2012-12-20 06:34:19.270898	2012-12-20 06:34:19.270898
33	NNTP	TCP/119\n	t	f	2012-12-20 06:34:19.279218	2012-12-20 06:34:19.279218
34	NTP	TCP/123 UDP/123\n	t	f	2012-12-20 06:34:19.287561	2012-12-20 06:34:19.287561
35	NetMeeting	TCP/1720\n	t	f	2012-12-20 06:34:19.295869	2012-12-20 06:34:19.295869
36	ONC-RPC	TCP/111 UDP/111\n	t	f	2012-12-20 06:34:19.304212	2012-12-20 06:34:19.304212
37	OSPF	IP/89\n	t	f	2012-12-20 06:34:19.312542	2012-12-20 06:34:19.312542
38	PC-Anywhere	TCP/5631 UDP/5632\n	t	f	2012-12-20 06:34:19.320919	2012-12-20 06:34:19.320919
39	PING	ICMP/8\n	t	f	2012-12-20 06:34:19.329198	2012-12-20 06:34:19.329198
40	POP3	TCP/110\n	t	f	2012-12-20 06:34:19.337542	2012-12-20 06:34:19.337542
41	POP3S	TCP/995\n	t	f	2012-12-20 06:34:19.345815	2012-12-20 06:34:19.345815
42	PPTP	IP/47 TCP/1723\n	t	f	2012-12-20 06:34:19.354195	2012-12-20 06:34:19.354195
43	QUAKE	UDP/26000-27000-27910-27960\n	t	f	2012-12-20 06:34:19.362519	2012-12-20 06:34:19.362519
44	RADIUS	UDP/1812-1813\n	t	f	2012-12-20 06:34:19.370857	2012-12-20 06:34:19.370857
45	RAUDIO	UDP/7070\n	t	f	2012-12-20 06:34:19.379184	2012-12-20 06:34:19.379184
46	RDP	TCP/3389\n	t	f	2012-12-20 06:34:19.387515	2012-12-20 06:34:19.387515
47	REXEC	TCP/512\n	t	f	2012-12-20 06:34:19.395845	2012-12-20 06:34:19.395845
48	RIP	UDP/520\n	t	f	2012-12-20 06:34:19.404132	2012-12-20 06:34:19.404132
49	RLOGIN	TCP/513\n	t	f	2012-12-20 06:34:19.412507	2012-12-20 06:34:19.412507
50	RSH	TCP/514\n	t	f	2012-12-20 06:34:19.420839	2012-12-20 06:34:19.420839
51	RTSP	TCP/554-7070-8554 UDP/554\n	t	f	2012-12-20 06:34:19.42916	2012-12-20 06:34:19.42916
52	SAMBA	TCP/139\n	t	f	2012-12-20 06:34:19.437483	2012-12-20 06:34:19.437483
53	SCCP	TCP/2000\n	t	f	2012-12-20 06:34:19.44583	2012-12-20 06:34:19.44583
54	SIP	UDP/5060\n	t	f	2012-12-20 06:34:19.454144	2012-12-20 06:34:19.454144
55	SIP-MSNmessenger	TCP/1863\n	t	f	2012-12-20 06:34:19.462492	2012-12-20 06:34:19.462492
56	SMTP	TCP/25\n	t	f	2012-12-20 06:34:19.470846	2012-12-20 06:34:19.470846
57	SMTPS	TCP/465\n	t	f	2012-12-20 06:34:19.479164	2012-12-20 06:34:19.479164
58	SNMP	TCP/161-162 UDP/161-162\n	t	f	2012-12-20 06:34:19.487664	2012-12-20 06:34:19.487664
59	SOCKS	TCP/1080 UDP/1080\n	t	f	2012-12-20 06:34:19.49593	2012-12-20 06:34:19.49593
60	SQUID	TCP/3128\n	t	f	2012-12-20 06:34:19.504358	2012-12-20 06:34:19.504358
61	SSH	TCP/22\n	t	f	2012-12-20 06:34:19.523414	2012-12-20 06:34:19.523414
62	SYSLOG	UDP/514\n	t	f	2012-12-20 06:34:19.537772	2012-12-20 06:34:19.537772
63	TALK	UDP/517-518\n	t	f	2012-12-20 06:34:19.557628	2012-12-20 06:34:19.557628
64	TCP	TCP/0-65535\n	t	f	2012-12-20 06:34:19.570913	2012-12-20 06:34:19.570913
65	TELNET	TCP/23\n	t	f	2012-12-20 06:34:19.579283	2012-12-20 06:34:19.579283
66	TFTP	UDP/69\n	t	f	2012-12-20 06:34:19.587748	2012-12-20 06:34:19.587748
67	TIMESTAMP	ICMP/13\n	t	f	2012-12-20 06:34:19.605289	2012-12-20 06:34:19.605289
68	TRACEROUTE	TCP/33434 UDP/33434\n	t	f	2012-12-20 06:34:19.625266	2012-12-20 06:34:19.625266
69	UDP	UDP/0-65535\n	t	f	2012-12-20 06:34:19.692291	2012-12-20 06:34:19.692291
70	UUCP	TCP/540\n	t	f	2012-12-20 06:34:19.722101	2012-12-20 06:34:19.722101
71	VDOLIVE	TCP/7000-7010\n	t	f	2012-12-20 06:34:19.738961	2012-12-20 06:34:19.738961
72	VNC	TCP/5900\n	t	f	2012-12-20 06:34:19.755447	2012-12-20 06:34:19.755447
73	WAIS	TCP/210\n	t	f	2012-12-20 06:34:19.772936	2012-12-20 06:34:19.772936
74	WINFRAME	TCP/1494\n	t	f	2012-12-20 06:34:19.789185	2012-12-20 06:34:19.789185
75	WINS	TCP/1512 UDP/1512\n	t	f	2012-12-20 06:34:19.806823	2012-12-20 06:34:19.806823
76	X-WINDOWS	TCP/6000-6063\n	t	f	2012-12-20 06:34:19.832621	2012-12-20 06:34:19.832621
\.


--
-- TOC entry 2514 (class 0 OID 27568)
-- Dependencies: 214
-- Data for Name: facility_ict_softwares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facility_ict_softwares (id, name, is_active, deleted, created_at, updated_at) FROM stdin;
1	Microsoft office 2003\n	t	f	2012-12-20 06:34:18.482876	2012-12-20 06:34:18.482876
2	Microsoft Office 2007\n	t	f	2012-12-20 06:34:18.504484	2012-12-20 06:34:18.504484
3	Microsoft Office 2010\n	t	f	2012-12-20 06:34:18.512688	2012-12-20 06:34:18.512688
4	Open Office 3.3.0\n	t	f	2012-12-20 06:34:18.520958	2012-12-20 06:34:18.520958
5	Dewan Eja\n	t	f	2012-12-20 06:34:18.529278	2012-12-20 06:34:18.529278
6	Adobe Reader\n	t	f	2012-12-20 06:34:18.537619	2012-12-20 06:34:18.537619
7	Winrar/Winzip\n	t	f	2012-12-20 06:34:18.545928	2012-12-20 06:34:18.545928
8	Adobe Photoshop 7\n	t	f	2012-12-20 06:34:18.554272	2012-12-20 06:34:18.554272
9	Microsoft Publisher 2003\n	t	f	2012-12-20 06:34:18.562593	2012-12-20 06:34:18.562593
10	Antivirus Avira antivir Personal\n	t	f	2012-12-20 06:34:18.570928	2012-12-20 06:34:18.570928
11	Antivirus Trendmicro\n	t	f	2012-12-20 06:34:18.579236	2012-12-20 06:34:18.579236
\.


--
-- TOC entry 2519 (class 0 OID 27624)
-- Dependencies: 224
-- Data for Name: facility_ict_wirings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facility_ict_wirings (id, name, is_active, deleted, created_at, updated_at) FROM stdin;
1	Blok A Lvl 01 ( Computer Room )\n	t	f	2012-12-20 06:34:18.599517	2012-12-20 06:34:18.599517
2	Blok A Lvl 03 ( IT Store )\n	t	f	2012-12-20 06:34:18.621254	2012-12-20 06:34:18.621254
3	Blok A Lvl 04 ( Roof Stairs )\n	t	f	2012-12-20 06:34:18.629255	2012-12-20 06:34:18.629255
4	Blok B Lvl Gnd ( SDO-GITN )\n	t	f	2012-12-20 06:34:18.637579	2012-12-20 06:34:18.637579
5	Blok B Lvl 01 ( Bendahari )\n	t	f	2012-12-20 06:34:18.645896	2012-12-20 06:34:18.645896
6	Blok B Lvl 03 ( Tabung Amanah )\n	t	f	2012-12-20 06:34:18.654235	2012-12-20 06:34:18.654235
7	BANQUET Front\n	t	f	2012-12-20 06:34:18.662694	2012-12-20 06:34:18.662694
8	BANQUET REAR\n	t	f	2012-12-20 06:34:18.670968	2012-12-20 06:34:18.670968
9	Pejabat TYT\n	t	f	2012-12-20 06:34:18.679278	2012-12-20 06:34:18.679278
10	Bilik Latihan\n	t	f	2012-12-20 06:34:18.687629	2012-12-20 06:34:18.687629
11	B.Baru Gnd Flr\n	t	f	2012-12-20 06:34:18.695943	2012-12-20 06:34:18.695943
12	B.Baru First Flr\n	t	f	2012-12-20 06:34:18.704289	2012-12-20 06:34:18.704289
13	B.Baru Second Flr\n	t	f	2012-12-20 06:34:18.712615	2012-12-20 06:34:18.712615
14	B.Baru Third Flr\n	t	f	2012-12-20 06:34:18.72095	2012-12-20 06:34:18.72095
15	B.Baru Fourth Flr\n	t	f	2012-12-20 06:34:18.72926	2012-12-20 06:34:18.72926
16	B.Baru Fifth Flr\n	t	f	2012-12-20 06:34:18.737617	2012-12-20 06:34:18.737617
17	WismaGND_Flr_A\n	t	f	2012-12-20 06:34:18.745956	2012-12-20 06:34:18.745956
18	WismaGND_Flr_B\n	t	f	2012-12-20 06:34:18.754278	2012-12-20 06:34:18.754278
19	Wisma1st_Flr_A\n	t	f	2012-12-20 06:34:18.762584	2012-12-20 06:34:18.762584
20	Wisma1st_Flr_B\n	t	f	2012-12-20 06:34:18.770935	2012-12-20 06:34:18.770935
21	Wisma2nd_Flr\n	t	f	2012-12-20 06:34:18.779248	2012-12-20 06:34:18.779248
22	Wisma3rd_Flr\n	t	f	2012-12-20 06:34:18.787589	2012-12-20 06:34:18.787589
23	Wisma4rd_Flr\n	t	f	2012-12-20 06:34:18.795915	2012-12-20 06:34:18.795915
24	Wisma5th_flr\n	t	f	2012-12-20 06:34:18.804263	2012-12-20 06:34:18.804263
25	WismaServerStack_01\n	t	f	2012-12-20 06:34:18.812655	2012-12-20 06:34:18.812655
26	Bilik Bertapa\n	t	f	2012-12-20 06:34:18.820928	2012-12-20 06:34:18.820928
27	Bilik Bertapa Bangunan Baru\n	t	f	2012-12-20 06:34:18.829235	2012-12-20 06:34:18.829235
28	test bangunan baru\n	t	f	2012-12-20 06:34:18.837556	2012-12-20 06:34:18.837556
\.


--
-- TOC entry 2529 (class 0 OID 27732)
-- Dependencies: 244
-- Data for Name: facility_icts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facility_icts (id, name, is_active, deleted, created_at, updated_at) FROM stdin;
1	Network Point\n	t	f	2012-12-20 06:34:20.482813	2012-12-20 06:34:20.482813
2	Buka Port Firewall\n	t	f	2012-12-20 06:34:20.506026	2012-12-20 06:34:20.506026
3	VPN\n	t	f	2012-12-20 06:34:20.514146	2012-12-20 06:34:20.514146
4	Peralatan Komputer (Komputer, Pengimbas & Pencetak)\n	t	f	2012-12-20 06:34:20.522467	2012-12-20 06:34:20.522467
5	Instalasi Perisian\n	t	f	2012-12-20 06:34:20.530761	2012-12-20 06:34:20.530761
6	Sistem Akses (Username & Password)\n	t	f	2012-12-20 06:34:20.539287	2012-12-20 06:34:20.539287
\.


--
-- TOC entry 2526 (class 0 OID 27702)
-- Dependencies: 238
-- Data for Name: ict_firewall_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ict_firewall_services (id, ict_firewall_id, facility_ict_service_id, one_way, approved, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2525 (class 0 OID 27691)
-- Dependencies: 236
-- Data for Name: ict_firewalls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ict_firewalls (id, requisition_type_id, source_ip, destination_ip, requested_from_date, requested_to_date, justification, user_id, department_id, remarks, status, incharge_person, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2532 (class 0 OID 27758)
-- Dependencies: 250
-- Data for Name: ict_hardware_booked_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ict_hardware_booked_statuses (id, ict_hardware_booking_id, ict_hardware_booked_user_id, status, approver_id, officer_id, remarks, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2531 (class 0 OID 27750)
-- Dependencies: 248
-- Data for Name: ict_hardware_booked_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ict_hardware_booked_users (id, user_id, ict_hardware_booking_id, is_replacement, pc, printer, scanner, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2530 (class 0 OID 27742)
-- Dependencies: 246
-- Data for Name: ict_hardware_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ict_hardware_bookings (id, booker_id, facility_ict_id, application_category, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2522 (class 0 OID 27656)
-- Dependencies: 230
-- Data for Name: ict_network_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ict_network_points (id, requisition_type_id, justification, location, quantity, user_id, department_id, hardware_id, type_id, center_id, hardware_quantity, work_status, notes, remarks, ict_network_attachment, status, person_incharge, recommendation_type, installation_info, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2524 (class 0 OID 27679)
-- Dependencies: 234
-- Data for Name: ict_system_accesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ict_system_accesses (id, requisition_type_id, user_id, department_id, system_access_id, system_access_attachment, status, forward_to, remarks, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2523 (class 0 OID 27667)
-- Dependencies: 232
-- Data for Name: ict_vpns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ict_vpns (id, requisition_type_id, user_id, department_id, from_date, to_date, justification, system_access_id, vpn_attachment, note, status, forward_to, remarks, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2497 (class 0 OID 27377)
-- Dependencies: 180
-- Data for Name: message_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY message_comments (id, comments, message_id, commenter_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2493 (class 0 OID 27333)
-- Dependencies: 172
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messages (id, subject, message, sender, message_type, agency_id, department_id, unit_id, attachment, file_content_type, file_size, is_sticky_message, deleted, send_to_dept_admins, send_to_unit_admins, created_at, updated_at, sent_to_all_dept_admins) FROM stdin;
\.


--
-- TOC entry 2541 (class 0 OID 27848)
-- Dependencies: 268
-- Data for Name: outstations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY outstations (id, is_out_of_state, is_official, placename, state, country, from_date, to_date, user_id, purpose, total_expenditure, cause_spending, attachment, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2513 (class 0 OID 27559)
-- Dependencies: 212
-- Data for Name: requisition_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requisition_types (id, name, is_active, created_at, updated_at) FROM stdin;
1	Network Point\n	t	2012-12-20 06:34:18.386031	2012-12-20 06:34:18.386031
2	Buka Port Firewall\n	t	2012-12-20 06:34:18.412953	2012-12-20 06:34:18.412953
3	VPN\n	t	2012-12-20 06:34:18.420997	2012-12-20 06:34:18.420997
4	Peralatan Komputer (Komputer, Pengimbas & Pencetak)\n	t	2012-12-20 06:34:18.429312	2012-12-20 06:34:18.429312
5	Instalasi Perisian\n	t	2012-12-20 06:34:18.437614	2012-12-20 06:34:18.437614
6	Sistem Akses (Username & Password)\n	t	2012-12-20 06:34:18.445965	2012-12-20 06:34:18.445965
\.


--
-- TOC entry 2500 (class 0 OID 27410)
-- Dependencies: 186
-- Data for Name: resource_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource_bookings (id, category_id, sub_category_id, user_id, department_id, resource_id, agency_store_id, attachment, purpose, description, quantity, requested_from_date, requested_to_date, request_processed_date, return_date, status, user_returned_status, priority_booking, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2511 (class 0 OID 27537)
-- Dependencies: 208
-- Data for Name: resource_ict_equipment_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource_ict_equipment_bookings (id, sub_category_id, agency_store_id, department_id, purpose, location, requested_from_date, requested_to_date, need_officer, user_id, officer_id, approver_id, meeting_start_time, meeting_end_time, approved_date, declined_date, returned_date, processed_date, user_returned_status, acknowledged_date, notes, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2499 (class 0 OID 27400)
-- Dependencies: 184
-- Data for Name: resource_managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource_managers (id, agency_id, resource_id, quantity, serial_no, uom, is_active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2521 (class 0 OID 27645)
-- Dependencies: 228
-- Data for Name: resource_requisitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource_requisitions (id, requisition_type_id, justification, location, quantity, user_id, remarks, person_incharge, recommendation, notes, installation_info, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2509 (class 0 OID 27517)
-- Dependencies: 204
-- Data for Name: resource_room_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource_room_bookings (id, sub_category_id, resource_id, agency_store_id, user_id, department_id, requested_from_date, requested_to_date, user_returned_status, room_capacity, purpose, remarks, room_attachment, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2503 (class 0 OID 27445)
-- Dependencies: 192
-- Data for Name: resource_transportation_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource_transportation_bookings (id, purpose, state, city, location, number_of_passengers, pick_up_place, requester_id, attachment, status, remarks, approver_id, requested_from_date, requested_to_date, request_processed_date, request_returned_date, agency_store_id, sub_category_id, driver_id, department_id, resource_returned_from_user, send_sms_to_driver, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2495 (class 0 OID 27360)
-- Dependencies: 176
-- Data for Name: resource_vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource_vendors (id, resource_id, vendor_id, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2492 (class 0 OID 27319)
-- Dependencies: 170
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resources (id, name, category_id, sub_category_id, status, resource_type, resource_no, location, vehicle_model, capacity, description, brand_model, is_returnable, is_facilty_avail, created_by, is_active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2488 (class 0 OID 27273)
-- Dependencies: 162
-- Data for Name: role_memberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role_memberships (id, role_id, user_id, department_id, unit_id, designation, default_dept, status, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	1	\N	\N	\N	f	A	\N	\N	2012-12-20 06:34:12.100818	2012-12-20 06:34:12.100818
2	5	2	1	\N	\N	t	A	\N	\N	2012-12-20 06:34:12.278404	2012-12-20 06:34:12.278404
3	5	3	3	\N	\N	t	A	\N	\N	2012-12-20 06:34:12.44483	2012-12-20 06:34:12.44483
4	2	4	1	\N	\N	t	A	\N	\N	2012-12-20 06:34:12.657624	2012-12-20 06:34:12.657624
5	2	\N	2	\N	\N	t	A	\N	\N	2012-12-20 06:34:12.879887	2012-12-20 06:34:12.879887
6	2	5	3	\N	\N	t	A	\N	\N	2012-12-20 06:34:13.045018	2012-12-20 06:34:13.045018
7	2	6	4	\N	\N	t	A	\N	\N	2012-12-20 06:34:13.211487	2012-12-20 06:34:13.211487
8	2	7	5	\N	\N	t	A	\N	\N	2012-12-20 06:34:13.378085	2012-12-20 06:34:13.378085
9	2	8	6	\N	\N	t	A	\N	\N	2012-12-20 06:34:13.544625	2012-12-20 06:34:13.544625
10	3	9	1	\N	\N	t	A	\N	\N	2012-12-20 06:34:13.711186	2012-12-20 06:34:13.711186
11	3	10	1	\N	\N	t	A	\N	\N	2012-12-20 06:34:13.877769	2012-12-20 06:34:13.877769
12	3	11	1	\N	\N	t	A	\N	\N	2012-12-20 06:34:14.044422	2012-12-20 06:34:14.044422
13	3	12	2	\N	\N	t	A	\N	\N	2012-12-20 06:34:14.318667	2012-12-20 06:34:14.318667
14	3	13	2	\N	\N	t	A	\N	\N	2012-12-20 06:34:14.486403	2012-12-20 06:34:14.486403
15	3	14	2	\N	\N	t	A	\N	\N	2012-12-20 06:34:14.652864	2012-12-20 06:34:14.652864
16	3	15	3	\N	\N	t	A	\N	\N	2012-12-20 06:34:14.819651	2012-12-20 06:34:14.819651
17	3	16	3	\N	\N	t	A	\N	\N	2012-12-20 06:34:14.98601	2012-12-20 06:34:14.98601
18	3	17	3	\N	\N	t	A	\N	\N	2012-12-20 06:34:15.152773	2012-12-20 06:34:15.152773
19	3	18	4	\N	\N	t	A	\N	\N	2012-12-20 06:34:15.319303	2012-12-20 06:34:15.319303
20	3	19	4	\N	\N	t	A	\N	\N	2012-12-20 06:34:15.485871	2012-12-20 06:34:15.485871
21	3	20	4	\N	\N	t	A	\N	\N	2012-12-20 06:34:15.652411	2012-12-20 06:34:15.652411
22	3	21	5	\N	\N	t	A	\N	\N	2012-12-20 06:34:15.81911	2012-12-20 06:34:15.81911
23	3	22	5	\N	\N	t	A	\N	\N	2012-12-20 06:34:15.985591	2012-12-20 06:34:15.985591
24	3	23	5	\N	\N	t	A	\N	\N	2012-12-20 06:34:16.202682	2012-12-20 06:34:16.202682
25	3	24	6	\N	\N	t	A	\N	\N	2012-12-20 06:34:16.369303	2012-12-20 06:34:16.369303
26	3	25	6	\N	\N	t	A	\N	\N	2012-12-20 06:34:16.535795	2012-12-20 06:34:16.535795
27	3	26	6	\N	\N	t	A	\N	\N	2012-12-20 06:34:16.702414	2012-12-20 06:34:16.702414
\.


--
-- TOC entry 2487 (class 0 OID 27263)
-- Dependencies: 160
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, is_active, deleted, created_at, updated_at) FROM stdin;
1	Super Admin	t	f	2012-12-20 06:34:11.413857	2012-12-20 06:34:11.413857
2	Department Admin	t	f	2012-12-20 06:34:11.431118	2012-12-20 06:34:11.431118
3	Department User	t	f	2012-12-20 06:34:11.439125	2012-12-20 06:34:11.439125
4	Unit Admin	t	f	2012-12-20 06:34:11.447482	2012-12-20 06:34:11.447482
5	Resource Manager	t	f	2012-12-20 06:34:11.455759	2012-12-20 06:34:11.455759
\.


--
-- TOC entry 2507 (class 0 OID 27493)
-- Dependencies: 200
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rooms (id, name, location, extension_no, is_active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2477 (class 0 OID 27153)
-- Dependencies: 140
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20120919111125
20120925120120
20120926101727
20120926101847
20120926101943
20120926102005
20120926102736
20120926102810
20120928100621
20120930093559
20121019100446
20121019105325
20121031044903
20121031044942
20121102125914
20121105061836
20121105063029
20121105090634
20121105132845
20121106090000
20121106133748
20121107073923
20121107111105
20121108054659
20121109085904
20121109101605
20121118112829
20121120052054
20121120065127
20121120065148
20121122181600
20121122181947
20121122200738
20121130071234
20121130094132
20121202133719
20121203182021
20121203182215
20121203182251
20121203182315
20121203182351
20121203182630
20121203182652
20121203182719
20121204022414
20121205132905
20121206054931
20121206054949
20121206061548
20121206062331
20121206074049
20121206120104
20121208120353
20121208154223
20121208193832
20121208194000
20121209105852
20121209132024
20121209134023
20121209184418
20121209184632
20121209190555
20121210115813
20121214092924
20121217090342
20121217091707
20121217135104
\.


--
-- TOC entry 2480 (class 0 OID 27193)
-- Dependencies: 146
-- Data for Name: service_levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_levels (id, stage, created_at, updated_at) FROM stdin;
1	Kumpulan Pengurusan Tertinggi	2012-12-20 06:34:00.058284	2012-12-20 06:34:00.058284
2	Kumpulan Pengurusan dan Professional	2012-12-20 06:34:00.067409	2012-12-20 06:34:00.067409
3	Kumpulan Sokongan I	2012-12-20 06:34:00.068311	2012-12-20 06:34:00.068311
4	Kumpulan Sokongan II	2012-12-20 06:34:00.069133	2012-12-20 06:34:00.069133
\.


--
-- TOC entry 2482 (class 0 OID 27212)
-- Dependencies: 150
-- Data for Name: service_standards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_standards (id, name, created_at, updated_at) FROM stdin;
1	Dalam Tempoh Percubaan	2012-12-20 06:34:00.456491	2012-12-20 06:34:00.456491
2	Tetap	2012-12-20 06:34:00.465672	2012-12-20 06:34:00.465672
3	Kontrak	2012-12-20 06:34:00.466576	2012-12-20 06:34:00.466576
4	Sambilan	2012-12-20 06:34:00.467409	2012-12-20 06:34:00.467409
5	Pinjaman	2012-12-20 06:34:00.468207	2012-12-20 06:34:00.468207
6	Sementara	2012-12-20 06:34:00.468987	2012-12-20 06:34:00.468987
\.


--
-- TOC entry 2539 (class 0 OID 27829)
-- Dependencies: 264
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY settings (id, timeline, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2528 (class 0 OID 27721)
-- Dependencies: 242
-- Data for Name: software_installation_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY software_installation_details (id, software_installation_id, user_id, department_id, name, "position", grade, approve_status, remarks, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2527 (class 0 OID 27710)
-- Dependencies: 240
-- Data for Name: software_installations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY software_installations (id, facility_ict_software_id, requisition_type_id, status, software_attachment, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2485 (class 0 OID 27241)
-- Dependencies: 156
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY states (id, name, code, tel_code, created_at, updated_at) FROM stdin;
1	Selangor	10	+603\n	2012-12-20 06:34:10.972704	2012-12-20 06:34:10.972704
2	WP Kuala Lumpur	14	+603\n	2012-12-20 06:34:10.997713	2012-12-20 06:34:10.997713
3	Kelantan	3	+609\n	2012-12-20 06:34:11.00595	2012-12-20 06:34:11.00595
4	Pahang	6	+609\n	2012-12-20 06:34:11.014189	2012-12-20 06:34:11.014189
5	Kedah	2	+604\n	2012-12-20 06:34:11.022535	2012-12-20 06:34:11.022535
6	Negeri Sembilan	5	+606\n	2012-12-20 06:34:11.030849	2012-12-20 06:34:11.030849
7	Melaka	4	+606\n	2012-12-20 06:34:11.039192	2012-12-20 06:34:11.039192
8	Sabah	12	+6088\n	2012-12-20 06:34:11.047506	2012-12-20 06:34:11.047506
9	Sarawak	13	+6087\n	2012-12-20 06:34:11.055853	2012-12-20 06:34:11.055853
10	Johor	1	+607\n	2012-12-20 06:34:11.064187	2012-12-20 06:34:11.064187
11	WP Putrajaya	16	+603\n	2012-12-20 06:34:11.072514	2012-12-20 06:34:11.072514
12	WP Labuan	15	+6088\n	2012-12-20 06:34:11.080825	2012-12-20 06:34:11.080825
13	Perak	8	+605\n	2012-12-20 06:34:11.089207	2012-12-20 06:34:11.089207
14	Pulau Pinang	7	+604\n	2012-12-20 06:34:11.09749	2012-12-20 06:34:11.09749
15	Perlis	9	+604\n	2012-12-20 06:34:11.105829	2012-12-20 06:34:11.105829
16	Terengganu	11	+609\n	2012-12-20 06:34:11.114195	2012-12-20 06:34:11.114195
\.


--
-- TOC entry 2491 (class 0 OID 27308)
-- Dependencies: 168
-- Data for Name: sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sub_categories (id, name, category_id, is_active, is_available, deleted, created_at, updated_at) FROM stdin;
1	Pencil	1	t	f	f	2012-12-20 06:34:16.897558	2012-12-20 06:34:16.897558
2	Paper Weight	1	t	f	f	2012-12-20 06:34:16.91361	2012-12-20 06:34:16.91361
3	Register Book	1	t	f	f	2012-12-20 06:34:16.921714	2012-12-20 06:34:16.921714
4	Stapler (small & big)	1	t	f	f	2012-12-20 06:34:16.929995	2012-12-20 06:34:16.929995
5	Stapler Pin (small & big)	1	t	f	f	2012-12-20 06:34:16.938358	2012-12-20 06:34:16.938358
6	Stamp Pad	1	t	f	f	2012-12-20 06:34:16.94664	2012-12-20 06:34:16.94664
7	Stamp Pad Ink	1	t	f	f	2012-12-20 06:34:16.954993	2012-12-20 06:34:16.954993
8	Pen	1	t	f	f	2012-12-20 06:34:16.963286	2012-12-20 06:34:16.963286
9	File Folder	1	t	f	f	2012-12-20 06:34:16.971658	2012-12-20 06:34:16.971658
10	Gum	1	t	f	f	2012-12-20 06:34:16.979955	2012-12-20 06:34:16.979955
11	Permanent Marker	1	t	f	f	2012-12-20 06:34:16.988327	2012-12-20 06:34:16.988327
12	Hand Book	1	t	f	f	2012-12-20 06:34:16.996618	2012-12-20 06:34:16.996618
13	Envelope(small)	1	t	f	f	2012-12-20 06:34:17.004989	2012-12-20 06:34:17.004989
14	Envelope(large)	1	t	f	f	2012-12-20 06:34:17.013339	2012-12-20 06:34:17.013339
15	Sealing Wax	1	t	f	f	2012-12-20 06:34:17.021613	2012-12-20 06:34:17.021613
16	Brown Cover(A4 size)	1	t	f	f	2012-12-20 06:34:17.029932	2012-12-20 06:34:17.029932
17	White Paper(A4 size)	1	t	f	f	2012-12-20 06:34:17.038292	2012-12-20 06:34:17.038292
18	Double Punch	1	t	f	f	2012-12-20 06:34:17.046591	2012-12-20 06:34:17.046591
19	White Board and Duster	1	t	f	f	2012-12-20 06:34:17.05498	2012-12-20 06:34:17.05498
20	Calculator	1	t	f	f	2012-12-20 06:34:17.063375	2012-12-20 06:34:17.063375
21	Trace Paper	1	t	f	f	2012-12-20 06:34:17.071709	2012-12-20 06:34:17.071709
22	Cash Book	1	t	f	f	2012-12-20 06:34:17.07999	2012-12-20 06:34:17.07999
23	Desktop computer and monitor	2	t	f	f	2012-12-20 06:34:17.088489	2012-12-20 06:34:17.088489
24	Keyboard and Mouse	2	t	f	f	2012-12-20 06:34:17.096688	2012-12-20 06:34:17.096688
25	Printer	2	t	f	f	2012-12-20 06:34:17.105438	2012-12-20 06:34:17.105438
26	Modem	2	t	f	f	2012-12-20 06:34:17.113633	2012-12-20 06:34:17.113633
27	Notebook Computer	2	t	f	f	2012-12-20 06:34:17.121826	2012-12-20 06:34:17.121826
28	CD Writer	2	t	f	f	2012-12-20 06:34:17.130024	2012-12-20 06:34:17.130024
29	PowerPoint Projector	2	t	f	f	2012-12-20 06:34:17.138323	2012-12-20 06:34:17.138323
30	Digital Camera	2	t	f	f	2012-12-20 06:34:17.146697	2012-12-20 06:34:17.146697
31	Handheld Organizer	2	t	f	f	2012-12-20 06:34:17.154981	2012-12-20 06:34:17.154981
32	Surge Protector	2	t	f	f	2012-12-20 06:34:17.163345	2012-12-20 06:34:17.163345
33	Computer Locks	2	t	f	f	2012-12-20 06:34:17.171641	2012-12-20 06:34:17.171641
34	Scanner	2	t	f	f	2012-12-20 06:34:17.179993	2012-12-20 06:34:17.179993
35	Laptop	2	t	f	f	2012-12-20 06:34:17.188301	2012-12-20 06:34:17.188301
36	Word Processing Software	3	t	f	f	2012-12-20 06:34:17.196698	2012-12-20 06:34:17.196698
37	Virus protection Software	3	t	f	f	2012-12-20 06:34:17.204994	2012-12-20 06:34:17.204994
38	Accounting Software	3	t	f	f	2012-12-20 06:34:17.213335	2012-12-20 06:34:17.213335
39	Desktop Publishing Software	3	t	f	f	2012-12-20 06:34:17.222052	2012-12-20 06:34:17.222052
40	Contact Management Software	3	t	f	f	2012-12-20 06:34:17.230039	2012-12-20 06:34:17.230039
41	Website Building and Maintenance Software	3	t	f	f	2012-12-20 06:34:17.238318	2012-12-20 06:34:17.238318
42	Payment Processing Software	3	t	f	f	2012-12-20 06:34:17.246712	2012-12-20 06:34:17.246712
43	E-commerce Software	3	t	f	f	2012-12-20 06:34:17.25498	2012-12-20 06:34:17.25498
44	Inventory Management Software	3	t	f	f	2012-12-20 06:34:17.263332	2012-12-20 06:34:17.263332
45	Telephone Line	4	t	f	f	2012-12-20 06:34:17.271629	2012-12-20 06:34:17.271629
46	Internet Connection	4	t	f	f	2012-12-20 06:34:17.279987	2012-12-20 06:34:17.279987
47	Toll-free Line	4	t	f	f	2012-12-20 06:34:17.288686	2012-12-20 06:34:17.288686
48	Desk Telephone	4	t	f	f	2012-12-20 06:34:17.296926	2012-12-20 06:34:17.296926
49	Fax Machine	4	t	f	f	2012-12-20 06:34:17.305146	2012-12-20 06:34:17.305146
50	Cordless Telephone	4	t	f	f	2012-12-20 06:34:17.313357	2012-12-20 06:34:17.313357
51	Answering Machine/Service	4	t	f	f	2012-12-20 06:34:17.321623	2012-12-20 06:34:17.321623
52	Cordless Headset	4	t	f	f	2012-12-20 06:34:17.329998	2012-12-20 06:34:17.329998
53	Speakerphone	4	t	f	f	2012-12-20 06:34:17.338271	2012-12-20 06:34:17.338271
54	Pager	4	t	f	f	2012-12-20 06:34:17.346665	2012-12-20 06:34:17.346665
55	Tape Recorder	4	t	f	f	2012-12-20 06:34:17.354939	2012-12-20 06:34:17.354939
56	Cellular Telephone with Internet Features	4	t	f	f	2012-12-20 06:34:17.363292	2012-12-20 06:34:17.363292
57	Desk	5	t	f	f	2012-12-20 06:34:17.371605	2012-12-20 06:34:17.371605
58	Comfortable Chair	5	t	f	f	2012-12-20 06:34:17.380121	2012-12-20 06:34:17.380121
59	File Cabinets	5	t	f	f	2012-12-20 06:34:17.388787	2012-12-20 06:34:17.388787
60	Overhead and Work Lighting	5	t	f	f	2012-12-20 06:34:17.397254	2012-12-20 06:34:17.397254
61	Client Seating	5	t	f	f	2012-12-20 06:34:17.405234	2012-12-20 06:34:17.405234
62	Fireproof Safe	5	t	f	f	2012-12-20 06:34:17.413405	2012-12-20 06:34:17.413405
63	Desktop and Pocket Calculators	5	t	f	f	2012-12-20 06:34:17.421724	2012-12-20 06:34:17.421724
64	Bookcases	5	t	f	f	2012-12-20 06:34:17.430059	2012-12-20 06:34:17.430059
65	Postage Meter	5	t	f	f	2012-12-20 06:34:17.438398	2012-12-20 06:34:17.438398
66	Worktable(s)	5	t	f	f	2012-12-20 06:34:17.446693	2012-12-20 06:34:17.446693
67	Office Decorations	5	t	f	f	2012-12-20 06:34:17.455255	2012-12-20 06:34:17.455255
68	Wall Whiteboard and Markers	5	t	f	f	2012-12-20 06:34:17.463363	2012-12-20 06:34:17.463363
69	Photocopier	5	t	f	f	2012-12-20 06:34:17.471711	2012-12-20 06:34:17.471711
70	Wastebasket	5	t	f	f	2012-12-20 06:34:17.480017	2012-12-20 06:34:17.480017
71	Recycling Bin	5	t	f	f	2012-12-20 06:34:17.488394	2012-12-20 06:34:17.488394
72	Alarm System	5	t	f	f	2012-12-20 06:34:17.496675	2012-12-20 06:34:17.496675
73	Fire Extinguisher	5	t	f	f	2012-12-20 06:34:17.505053	2012-12-20 06:34:17.505053
74	First-aid Kit	5	t	f	f	2012-12-20 06:34:17.513346	2012-12-20 06:34:17.513346
75	Conference room	6	t	f	f	2012-12-20 06:34:17.521724	2012-12-20 06:34:17.521724
76	Prayer room	6	t	f	f	2012-12-20 06:34:17.530029	2012-12-20 06:34:17.530029
77	Dining room	6	t	f	f	2012-12-20 06:34:17.538772	2012-12-20 06:34:17.538772
78	Party hall	6	t	f	f	2012-12-20 06:34:17.546737	2012-12-20 06:34:17.546737
79	Kerata	7	t	f	f	2012-12-20 06:34:17.555445	2012-12-20 06:34:17.555445
80	Van	7	t	f	f	2012-12-20 06:34:17.563414	2012-12-20 06:34:17.563414
81	MPV	7	t	f	f	2012-12-20 06:34:17.571749	2012-12-20 06:34:17.571749
82	4WD	7	t	f	f	2012-12-20 06:34:17.580279	2012-12-20 06:34:17.580279
83	Bas	7	t	f	f	2012-12-20 06:34:17.588719	2012-12-20 06:34:17.588719
84	Lori	7	t	f	f	2012-12-20 06:34:17.596724	2012-12-20 06:34:17.596724
85	Notebook	8	t	f	f	2012-12-20 06:34:17.621106	2012-12-20 06:34:17.621106
86	LCD Projector	8	t	f	f	2012-12-20 06:34:17.638432	2012-12-20 06:34:17.638432
87	Laser Pointer	8	t	f	f	2012-12-20 06:34:17.663381	2012-12-20 06:34:17.663381
88	Pegawai Teknikal	8	t	f	f	2012-12-20 06:34:17.671695	2012-12-20 06:34:17.671695
89	White Screen	8	t	f	f	2012-12-20 06:34:17.679983	2012-12-20 06:34:17.679983
90	VGA Cable 1.8 meter	8	t	f	f	2012-12-20 06:34:17.688315	2012-12-20 06:34:17.688315
91	Network Cable 3m	8	t	f	f	2012-12-20 06:34:17.696661	2012-12-20 06:34:17.696661
92	Network Cable 5m	8	t	f	f	2012-12-20 06:34:17.70497	2012-12-20 06:34:17.70497
93	Network Cable 10m	8	t	f	f	2012-12-20 06:34:17.713329	2012-12-20 06:34:17.713329
94	VGA Cable 5 meter	8	t	f	f	2012-12-20 06:34:17.721631	2012-12-20 06:34:17.721631
95	VGA Cable 10 meter	8	t	f	f	2012-12-20 06:34:17.729999	2012-12-20 06:34:17.729999
96	Power Cable	8	t	f	f	2012-12-20 06:34:17.738296	2012-12-20 06:34:17.738296
97	Extension Wire	8	t	f	f	2012-12-20 06:34:17.746692	2012-12-20 06:34:17.746692
98	VGA Cable 20 meter	8	t	f	f	2012-12-20 06:34:17.755041	2012-12-20 06:34:17.755041
99	pendrive(8GB)	8	t	f	f	2012-12-20 06:34:17.765461	2012-12-20 06:34:17.765461
100	PROBLEM	8	t	f	f	2012-12-20 06:34:17.7717	2012-12-20 06:34:17.7717
101	LCD Wide Screen 10x8	8	t	f	f	2012-12-20 06:34:17.780073	2012-12-20 06:34:17.780073
102	Projector Besar	8	t	f	f	2012-12-20 06:34:17.788391	2012-12-20 06:34:17.788391
103	TV	8	t	f	f	2012-12-20 06:34:17.796726	2012-12-20 06:34:17.796726
104	SPLITER	8	t	f	f	2012-12-20 06:34:17.805299	2012-12-20 06:34:17.805299
105	FOOT PEDAL	8	t	f	f	2012-12-20 06:34:17.813524	2012-12-20 06:34:17.813524
106	NOTEBOOK SUKMA	8	t	f	f	2012-12-20 06:34:17.821738	2012-12-20 06:34:17.821738
\.


--
-- TOC entry 2520 (class 0 OID 27634)
-- Dependencies: 226
-- Data for Name: system_accesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY system_accesses (id, name, is_active, complaint_type_id, created_at, updated_at) FROM stdin;
1	Sistem EIMM\n	t	\N	2012-12-20 06:34:20.241833	2012-12-20 06:34:20.241833
4	Sistem Rangkaian\n	t	\N	2012-12-20 06:34:20.280914	2012-12-20 06:34:20.280914
6	Sistem GOE-EGDMS\n	t	\N	2012-12-20 06:34:20.297533	2012-12-20 06:34:20.297533
7	Sistem E-SEWA\n	t	\N	2012-12-20 06:34:20.305842	2012-12-20 06:34:20.305842
8	Sistem SISPEN\n	t	\N	2012-12-20 06:34:20.314183	2012-12-20 06:34:20.314183
9	Sistem PINGAT\n	t	\N	2012-12-20 06:34:20.322514	2012-12-20 06:34:20.322514
10	Sistem IRIS\n	t	\N	2012-12-20 06:34:20.330838	2012-12-20 06:34:20.330838
11	Sis. Pertanyaan Online Penyata Sewa Bangunan Kjaan\n	t	\N	2012-12-20 06:34:20.339199	2012-12-20 06:34:20.339199
12	MacGDI\n	t	\N	2012-12-20 06:34:20.347484	2012-12-20 06:34:20.347484
13	Sistem E-MMKN\n	t	\N	2012-12-20 06:34:20.35582	2012-12-20 06:34:20.35582
14	Sistem E-DUN\n	t	\N	2012-12-20 06:34:20.364139	2012-12-20 06:34:20.364139
16	Lain-Lain Sistem\n	t	\N	2012-12-20 06:34:20.38081	2012-12-20 06:34:20.38081
5	Sistem E-mel\n	t	4	2012-12-20 06:34:20.289188	2012-12-20 06:34:20.289188
2	Sistem Inventori & Aksesori BPTM\n	t	2	2012-12-20 06:34:20.264416	2012-12-20 06:34:20.264416
3	Sistem Intranet\n	t	2	2012-12-20 06:34:20.27258	2012-12-20 06:34:20.27258
15	Laman Web Melaka\n	t	\N	2012-12-20 06:34:20.372499	2012-12-20 06:34:20.372499
17	Sistem e-PBT\n	t	\N	2012-12-20 06:34:20.389155	2012-12-20 06:34:20.389155
18	Sistem Pemantauan Projek\n	t	4	2012-12-20 06:34:20.397467	2012-12-20 06:34:20.397467
\.


--
-- TOC entry 2536 (class 0 OID 27800)
-- Dependencies: 258
-- Data for Name: system_model_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY system_model_types (id, name, system_access_id, created_at, updated_at) FROM stdin;
1	NEC\n	\N	2012-12-20 06:34:21.371086	2012-12-20 06:34:21.371086
3	HP Vectra VL400\n	\N	2012-12-20 06:34:21.405892	2012-12-20 06:34:21.405892
4	HP Brio\n	\N	2012-12-20 06:34:21.414077	2012-12-20 06:34:21.414077
5	Acer Veriton 5500G\n	\N	2012-12-20 06:34:21.422373	2012-12-20 06:34:21.422373
6	IBM Net Vista\n	\N	2012-12-20 06:34:21.430715	2012-12-20 06:34:21.430715
7	IBM Think Centre\n	\N	2012-12-20 06:34:21.439042	2012-12-20 06:34:21.439042
8	HP Compaq DX2000\n	\N	2012-12-20 06:34:21.447364	2012-12-20 06:34:21.447364
9	HP Compaq DC5100\n	\N	2012-12-20 06:34:21.455685	2012-12-20 06:34:21.455685
10	Lain-lain CPU\n	\N	2012-12-20 06:34:21.464025	2012-12-20 06:34:21.464025
11	NEC\n	\N	2012-12-20 06:34:21.472356	2012-12-20 06:34:21.472356
13	HP Monitor\n	\N	2012-12-20 06:34:21.489008	2012-12-20 06:34:21.489008
14	Acer Veriton AC501\n	\N	2012-12-20 06:34:21.497349	2012-12-20 06:34:21.497349
15	IBM Monitor\n	\N	2012-12-20 06:34:21.505716	2012-12-20 06:34:21.505716
16	IBM Think Center E54\n	\N	2012-12-20 06:34:21.514024	2012-12-20 06:34:21.514024
17	HP Compaq 1740\n	\N	2012-12-20 06:34:21.522331	2012-12-20 06:34:21.522331
18	Lain-lain Monitor\n	\N	2012-12-20 06:34:21.53067	2012-12-20 06:34:21.53067
19	HP LaserJet 6L\n	\N	2012-12-20 06:34:21.538997	2012-12-20 06:34:21.538997
20	HP LaserJet 1100\n	\N	2012-12-20 06:34:21.547324	2012-12-20 06:34:21.547324
21	HP LaserJet 1010\n	\N	2012-12-20 06:34:21.555671	2012-12-20 06:34:21.555671
22	HP LaserJet 1200\n	\N	2012-12-20 06:34:21.563978	2012-12-20 06:34:21.563978
23	HP LaserJet 1300\n	\N	2012-12-20 06:34:21.57234	2012-12-20 06:34:21.57234
24	HP LaserJet 1300N\n	\N	2012-12-20 06:34:21.580655	2012-12-20 06:34:21.580655
25	HP LaserJet 1320\n	\N	2012-12-20 06:34:21.589036	2012-12-20 06:34:21.589036
26	HP LaserJet 2100N\n	\N	2012-12-20 06:34:21.597298	2012-12-20 06:34:21.597298
27	HP LaserJet 3050\n	\N	2012-12-20 06:34:21.605651	2012-12-20 06:34:21.605651
28	HP LaserJet 4000N\n	\N	2012-12-20 06:34:21.613961	2012-12-20 06:34:21.613961
29	HP LaserJet 4050\n	\N	2012-12-20 06:34:21.622313	2012-12-20 06:34:21.622313
30	HP LaserJet 4600\n	\N	2012-12-20 06:34:21.630627	2012-12-20 06:34:21.630627
31	HP LaserJet 4500\n	\N	2012-12-20 06:34:21.638985	2012-12-20 06:34:21.638985
32	HP LaserJet 5000\n	\N	2012-12-20 06:34:21.647286	2012-12-20 06:34:21.647286
33	HP LaserJet 5100\n	\N	2012-12-20 06:34:21.655636	2012-12-20 06:34:21.655636
34	HP LaserJet 5500DFN\n	\N	2012-12-20 06:34:21.66395	2012-12-20 06:34:21.66395
35	HP LaserJet 8850DN\n	\N	2012-12-20 06:34:21.672302	2012-12-20 06:34:21.672302
36	Epson LQ2180\n	\N	2012-12-20 06:34:21.68062	2012-12-20 06:34:21.68062
37	Epson AFX 5000+\n	\N	2012-12-20 06:34:21.688938	2012-12-20 06:34:21.688938
38	Epson 5900L\n	\N	2012-12-20 06:34:21.697425	2012-12-20 06:34:21.697425
39	Lain-lain Printer\n	\N	2012-12-20 06:34:21.705731	2012-12-20 06:34:21.705731
40	Epson 1640\n	\N	2012-12-20 06:34:21.714047	2012-12-20 06:34:21.714047
41	Lain-lain Scanner\n	\N	2012-12-20 06:34:21.722394	2012-12-20 06:34:21.722394
42	Lain-Lain Kerosakan Sistem EIMM\n	\N	2012-12-20 06:34:21.730708	2012-12-20 06:34:21.730708
47	Lain-lain Kerosakan Sistem Inventori & Aksesori\n	\N	2012-12-20 06:34:21.772386	2012-12-20 06:34:21.772386
48	Modul Senarai Mel\n	\N	2012-12-20 06:34:21.780674	2012-12-20 06:34:21.780674
49	Modul Aduan Kerosakan Komputer\n	\N	2012-12-20 06:34:21.789069	2012-12-20 06:34:21.789069
50	Modul Pinjaman Peralatan Komputer\n	\N	2012-12-20 06:34:21.797354	2012-12-20 06:34:21.797354
51	Modul Tempahan Bilik Mesyuarat\n	\N	2012-12-20 06:34:21.805697	2012-12-20 06:34:21.805697
52	Modul Pengurusan Pekeliling/Arahan Pentadbiran/Garis Panduan\n	\N	2012-12-20 06:34:21.814084	2012-12-20 06:34:21.814084
53	Modul Iklan Jawatan Kosong\n	\N	2012-12-20 06:34:21.822395	2012-12-20 06:34:21.822395
54	Modul Pengurusan Maklumat\n	\N	2012-12-20 06:34:21.830682	2012-12-20 06:34:21.830682
55	Lain-lain Kerosakan Sistem Intranet\n	\N	2012-12-20 06:34:21.839013	2012-12-20 06:34:21.839013
56	Lain-Lain Kerosakan Internet\n	\N	2012-12-20 06:34:21.847349	2012-12-20 06:34:21.847349
58	Lain-lain Kerosakan Sistem GOE-EGDMS\n	\N	2012-12-20 06:34:21.864009	2012-12-20 06:34:21.864009
59	Lain-lain Kerosakan Laman Web\n	\N	2012-12-20 06:34:21.872343	2012-12-20 06:34:21.872343
60	Notis\n	\N	2012-12-20 06:34:21.880641	2012-12-20 06:34:21.880641
61	Aduan\n	\N	2012-12-20 06:34:21.888993	2012-12-20 06:34:21.888993
62	Ketua Jabatan\n	\N	2012-12-20 06:34:21.897337	2012-12-20 06:34:21.897337
63	Lain-lain Kerosakan Sistem E-MMKN\n	\N	2012-12-20 06:34:21.905663	2012-12-20 06:34:21.905663
64	Risalat AM\n	\N	2012-12-20 06:34:21.913999	2012-12-20 06:34:21.913999
65	Risalat Tanah\n	\N	2012-12-20 06:34:21.92232	2012-12-20 06:34:21.92232
66	Agenda\n	\N	2012-12-20 06:34:21.930666	2012-12-20 06:34:21.930666
67	Minit\n	\N	2012-12-20 06:34:21.93898	2012-12-20 06:34:21.93898
68	Lain-lain Kerosakan Sistem E-DUN\n	\N	2012-12-20 06:34:21.947327	2012-12-20 06:34:21.947327
69	Lain-lain Kerosakan MacGDI\n	\N	2012-12-20 06:34:21.955638	2012-12-20 06:34:21.955638
70	Lain-lain Kerosakan Sistem Pertanyaan Online Sewa Bangunan Kerajaan\n	\N	2012-12-20 06:34:21.963982	2012-12-20 06:34:21.963982
71	Lain-lain Kerosakan Sistem IRIS\n	\N	2012-12-20 06:34:21.972304	2012-12-20 06:34:21.972304
72	Lain-lain Kerosakan Sistem PINGAT\n	\N	2012-12-20 06:34:21.980648	2012-12-20 06:34:21.980648
73	Lain-lain Kerosakan Sistem SISPEN\n	\N	2012-12-20 06:34:21.988965	2012-12-20 06:34:21.988965
74	Lain-lain Kerosakan Sistem E-SEWA\n	\N	2012-12-20 06:34:21.997307	2012-12-20 06:34:21.997307
75	Lain-lain Model/Modul Sistem\n	\N	2012-12-20 06:34:22.005795	2012-12-20 06:34:22.005795
100	Windows 7\n	\N	2012-12-20 06:34:22.26398	2012-12-20 06:34:22.26398
101	Windows Vista\n	\N	2012-12-20 06:34:22.27233	2012-12-20 06:34:22.27233
102	Windows XP\n	\N	2012-12-20 06:34:22.28064	2012-12-20 06:34:22.28064
103	Lain-lain Versi Windows\n	\N	2012-12-20 06:34:22.288983	2012-12-20 06:34:22.288983
104	Microsoft Word\n	\N	2012-12-20 06:34:22.297294	2012-12-20 06:34:22.297294
105	Microsoft PowerPoint\n	\N	2012-12-20 06:34:22.305643	2012-12-20 06:34:22.305643
106	Microsoft Excel\n	\N	2012-12-20 06:34:22.313954	2012-12-20 06:34:22.313954
108	Lain-lain Perisian Microsoft Office\n	\N	2012-12-20 06:34:22.330611	2012-12-20 06:34:22.330611
109	Writer\n	\N	2012-12-20 06:34:22.338958	2012-12-20 06:34:22.338958
110	Calc\n	\N	2012-12-20 06:34:22.347281	2012-12-20 06:34:22.347281
111	Impress\n	\N	2012-12-20 06:34:22.355625	2012-12-20 06:34:22.355625
112	Lain-lain Perisian Open Office\n	\N	2012-12-20 06:34:22.363936	2012-12-20 06:34:22.363936
44	Modul Aksesori Keluar\n	2	2012-12-20 06:34:21.747388	2012-12-20 06:34:21.747388
46	Modul Inventori Keluar\n	2	2012-12-20 06:34:21.76403	2012-12-20 06:34:21.76403
57	E-mail Outlook\n	5	2012-12-20 06:34:21.855672	2012-12-20 06:34:21.855672
107	Emel (Microsoft Outlook)\n	5	2012-12-20 06:34:22.322301	2012-12-20 06:34:22.322301
113	E-Mel MyXchange\n	5	2012-12-20 06:34:22.37228	2012-12-20 06:34:22.37228
2	Gateway\n	4	2012-12-20 06:34:21.397592	2012-12-20 06:34:21.397592
12	Gateway EV500\n	4	2012-12-20 06:34:21.480693	2012-12-20 06:34:21.480693
76	Sistem Penilaian (SPNL)\n	17	2012-12-20 06:34:22.014149	2012-12-20 06:34:22.014149
77	Sistem Taksiran (STKN)\n	17	2012-12-20 06:34:22.022402	2012-12-20 06:34:22.022402
79	Sistem Kompaun (SKPK)\n	17	2012-12-20 06:34:22.039026	2012-12-20 06:34:22.039026
80	Sistem Sewaan (SSWN)\n	17	2012-12-20 06:34:22.047375	2012-12-20 06:34:22.047375
81	Sistem Pelesenan (SPLN)\n	17	2012-12-20 06:34:22.05569	2012-12-20 06:34:22.05569
82	Sistem Terimaan Pelbagai (SSWN)\n	17	2012-12-20 06:34:22.064024	2012-12-20 06:34:22.064024
83	Sistem Lejar Am (SSLA)\n	17	2012-12-20 06:34:22.072353	2012-12-20 06:34:22.072353
84	Sistem Jernal (SNJL)\n	17	2012-12-20 06:34:22.080695	2012-12-20 06:34:22.080695
85	Sistem Belanjawan (SSBN)\n	17	2012-12-20 06:34:22.089007	2012-12-20 06:34:22.089007
86	Sistem Akaun Kena Bayar (SAKB)\n	17	2012-12-20 06:34:22.097395	2012-12-20 06:34:22.097395
88	Sistem Pinjaman (SSPJ)\n	17	2012-12-20 06:34:22.114015	2012-12-20 06:34:22.114015
89	Sistem Pelaburan (SSPB)\n	17	2012-12-20 06:34:22.122337	2012-12-20 06:34:22.122337
95	Sistem Aduan (SABB)\n	17	2012-12-20 06:34:22.222423	2012-12-20 06:34:22.222423
96	Sistem ID Pelanggan (SIDP)\n	17	2012-12-20 06:34:22.230724	2012-12-20 06:34:22.230724
94	Sistem Bangunan (SBGN)\n	17	2012-12-20 06:34:22.21426	2012-12-20 06:34:22.21426
93	Sistem Kebenaran Merancang (SSKM)\n	17	2012-12-20 06:34:22.155658	2012-12-20 06:34:22.155658
92	Sistem Penutupan Hujung Tahun (YEND)\n	17	2012-12-20 06:34:22.14732	2012-12-20 06:34:22.14732
91	Sistem Pengurusan Harta (SSHT)\n	17	2012-12-20 06:34:22.138991	2012-12-20 06:34:22.138991
90	Sistem Pengurusan Wang Tunai (SSPT)\n	17	2012-12-20 06:34:22.130672	2012-12-20 06:34:22.130672
97	Modul Permohonan Kursus\n	3	2012-12-20 06:34:22.23903	2012-12-20 06:34:22.23903
99	Modul Permohonan Akaun Domain dan Emel\n	3	2012-12-20 06:34:22.255679	2012-12-20 06:34:22.255679
114	Lain-lain Modul Testing 1\n	\N	2012-12-20 06:34:22.380603	2012-12-20 06:34:22.380603
115	Lain-lain Modul Testing 2\n	\N	2012-12-20 06:34:22.389174	2012-12-20 06:34:22.389174
116	Lain-lain Modul Testing 3\n	\N	2012-12-20 06:34:22.397391	2012-12-20 06:34:22.397391
43	Modul Aksesori Masuk\n	2	2012-12-20 06:34:21.739052	2012-12-20 06:34:21.739052
45	Modul Inventori Masuk\n	2	2012-12-20 06:34:21.755716	2012-12-20 06:34:21.755716
78	Sistem Kutipan (SKTN)\n	17	2012-12-20 06:34:22.030711	2012-12-20 06:34:22.030711
87	Sistem Personelia dan Gaji (SSPG)\n	17	2012-12-20 06:34:22.105678	2012-12-20 06:34:22.105678
98	Modul Permohonan Peperiksaan PTK\n	3	2012-12-20 06:34:22.247337	2012-12-20 06:34:22.247337
117	Lain-lain Modul Sistem Pemantauan Projek\n	18	2012-12-20 06:34:22.405727	2012-12-20 06:34:22.405727
\.


--
-- TOC entry 2484 (class 0 OID 27228)
-- Dependencies: 154
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY units (id, name, department_id, address, telephone_number, fax_number, order_by, is_active, deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2540 (class 0 OID 27837)
-- Dependencies: 266
-- Data for Name: user_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_services (id, user_id, office_address, postal_code, city, state, office_number, office_fax, email, recent_salary, salary_scale1, salary_scale2, service_level_id, classification_id, grade_id, service_standard_id, appointment_id, "position", official_position, first_appointment_to_public_service, first_appointment_to_present_position, promotion_to_present_grade, confirmation_date, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2478 (class 0 OID 27159)
-- Dependencies: 142
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, ic_number, first_name, last_name, username, substantive_post_id, gender, address, city, zipcode, state, contact_phone, contact_mobile, fax_number, date_of_join, date_of_birth, created_by, updated_by, avatar, avatar_updated_at, status, login_status, deleted, activation_code, activated_at, widget_one, widget_two, profile_status, marital_status, hp_number, child, created_at, updated_at) FROM stdin;
1	manivannan.s@openwavecomp.in	$2a$10$T8F3lNTPkN4cALegl85duu419zfsCQCXgtzLBylVxxmoQGgB7vepy	\N	\N	\N	1	2012-12-20 06:34:12.005631	2012-12-19 06:34:12.00566	\N	\N	123456781234	openwave	superadmin	Mani	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:12.00553	t	t	f	\N	\N	\N	2012-12-20 06:34:11.990529	2012-12-20 06:34:12.008026
2	sathisht@openwavecomp.in	$2a$10$a6y8kHxOhViaSIcbr/HZgOHVgF8DuyQWfiu.cSjy7sCcWfJu9C4AS	\N	\N	\N	1	2012-12-20 06:34:12.263939	2012-12-19 06:34:12.263969	\N	\N	123456780001	James	Franklin	James	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:12.263864	t	t	f	\N	\N	\N	2012-12-20 06:34:12.253776	2012-12-20 06:34:12.266113
3	sathish@openwavecomp.in	$2a$10$WtoiWBUyyuF6Mi47.XU04eLkqIvdwHLbvS4YZTZiZhEsV5TTtnraa	\N	\N	\N	1	2012-12-20 06:34:12.430518	2012-12-19 06:34:12.430543	\N	\N	123456780002	Sheik	Sultan	Sheik	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:12.430448	t	t	f	\N	\N	\N	2012-12-20 06:34:12.419621	2012-12-20 06:34:12.432526
4	sathish.t@openwavecomp.in	$2a$10$JGy1O1/wEGbT3tKwBrXageSPYMRPEHXTzcNCFxPYqVbJgXCyfF99W	\N	\N	\N	1	2012-12-20 06:34:12.59712	2012-12-19 06:34:12.597145	\N	\N	123456781111	Dept1Admin	JKMM	Sathish	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:12.597051	t	t	f	\N	\N	\N	2012-12-20 06:34:12.586323	2012-12-20 06:34:12.599151
5	mathewvivek.a@openwavecomp.in	$2a$10$AmakLY5dKP5hya2QPf8fJuX6fpG6cw./JQ0WRiNvxLuC1Lyya5gku	\N	\N	\N	1	2012-12-20 06:34:13.030362	2012-12-19 06:34:13.030388	\N	\N	123456783333	Dept3Admin	JAIM	Mathew	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:13.030277	t	t	f	\N	\N	\N	2012-12-20 06:34:13.019843	2012-12-20 06:34:13.032469
6	nirmala.a.b@openwavecomp.in	$2a$10$eQkaJzZpzfgK4WHAeH6dXOOmfwYQswi92SOuws2WyqL6TZHaVFo4u	\N	\N	\N	1	2012-12-20 06:34:13.196966	2012-12-19 06:34:13.196991	\N	\N	123456784444	Dept4Admin	JKRM	Nirmala	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:13.196896	t	t	f	\N	\N	\N	2012-12-20 06:34:13.185935	2012-12-20 06:34:13.199063
7	sasitharan.t@openwavecomp.in	$2a$10$q76Cpq8eFHKjDG92Wsfe4.mUYkmM8BzQ.KHDcrNhfh./yPCAFnDF.	\N	\N	\N	1	2012-12-20 06:34:13.363538	2012-12-19 06:34:13.363563	\N	\N	123456785555	Dept5Admin	JPNM	Sasitharan	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:13.363472	t	t	f	\N	\N	\N	2012-12-20 06:34:13.352397	2012-12-20 06:34:13.365561
8	prakashkumar.m@openwavecomp.in	$2a$10$6TXHT7.1dRd9.jaD1Djf3e3pqLIWOsR9dFrfsQ8QC9AqZ7HJj/e9q	\N	\N	\N	1	2012-12-20 06:34:13.530167	2012-12-19 06:34:13.530191	\N	\N	123456786666	Dept6Admin	JKM	Prakash	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:13.530099	t	t	f	\N	\N	\N	2012-12-20 06:34:13.518986	2012-12-20 06:34:13.53218
9	testopen06@gmail.com	$2a$10$Jw0FRGBey7SG9m4NX3u9tONclQlXUsfemh4rktC.Y583dK96GACWe	\N	\N	\N	1	2012-12-20 06:34:13.696961	2012-12-19 06:34:13.696986	\N	\N	123456781110	Dept1UserFirst	JKMM	TestOpen06	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:13.696891	t	t	f	\N	\N	\N	2012-12-20 06:34:13.685979	2012-12-20 06:34:13.699014
10	abuthahir.a.b@openwavecomp.in	$2a$10$6Y2zFHEyTwVBk/OI51kvx.voXkAwMDj36UZZ5ldoSBsppVkMp4EJa	\N	\N	\N	1	2012-12-20 06:34:13.863454	2012-12-19 06:34:13.863479	\N	\N	123456781120	Dept1UserSecond	JKMM	Abuthahir	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:13.863387	t	t	f	\N	\N	\N	2012-12-20 06:34:13.85243	2012-12-20 06:34:13.865432
11	testopen07@gmail.com	$2a$10$7Ge1h12qx3E4r215XuK/bO5zWbWArsJycurqO2/BZRg4sHnnbvP5u	\N	\N	\N	2	2012-12-20 06:35:04.156776	2012-12-20 06:34:14.030069	127.0.0.1	127.0.0.1	123456781130	Dept1UserThird	JKMM	TestOpen07	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:14.03	t	t	f	\N	\N	\N	2012-12-20 06:34:14.018938	2012-12-20 06:35:22.812003
12	anusudha.r@openwavecomp.in	$2a$10$5Fw/H1ivn0tNubelyruGUe7lSio.MPjSTiEHIemGi/wS3LCAqb35y	\N	\N	\N	1	2012-12-20 06:34:14.255162	2012-12-19 06:34:14.255188	\N	\N	123456782210	Dept2Userfirst	JMNM	Anu	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:14.25508	t	t	f	\N	\N	\N	2012-12-20 06:34:14.186232	2012-12-20 06:34:14.257345
13	latha.k@openwavecomp.in	$2a$10$5VqF2Jh4S2gOmBKMRra6quNtNLHD/UqXf7yVO9ox1xyNLrAXSpp4y	\N	\N	\N	1	2012-12-20 06:34:14.471626	2012-12-19 06:34:14.471652	\N	\N	123456782220	Dept2UserSecond	JMNM	Latha	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:14.471556	t	t	f	\N	\N	\N	2012-12-20 06:34:14.46059	2012-12-20 06:34:14.473721
14	sakthivel.m@openwavecomp.in	$2a$10$tYSAu8mXwY93lgd8QsapYeLtF59wWQqNgXledgZSjZSzUJCoqsWEG	\N	\N	\N	1	2012-12-20 06:34:14.63824	2012-12-19 06:34:14.638265	\N	\N	123456782230	Dept2UserThird	JMNM	Sakthi	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:14.638169	t	t	f	\N	\N	\N	2012-12-20 06:34:14.627211	2012-12-20 06:34:14.64031
15	gopinath.m@openwavecomp.in	$2a$10$yAqwsWt.ydxxqMNouruYGOMJdds2rExgBpDORuSfIxSsoJP3Fcu9O	\N	\N	\N	1	2012-12-20 06:34:14.804991	2012-12-19 06:34:14.805016	\N	\N	123456783310	Dept3Userfirst	JAIM	Gopinath	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:14.804906	t	t	f	\N	\N	\N	2012-12-20 06:34:14.795175	2012-12-20 06:34:14.807164
16	testopen01@gmail.com	$2a$10$f1twOa85eMSc3tEu2K8I9eTEumL.NX1BPBOE.jR0dNkH53pUsyLMO	\N	\N	\N	1	2012-12-20 06:34:14.971447	2012-12-19 06:34:14.971472	\N	\N	123456783320	Dept3UserSecond	JAIM	TestOpen01	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:14.971379	t	t	f	\N	\N	\N	2012-12-20 06:34:14.960407	2012-12-20 06:34:14.973498
17	testopen02@gmail.com	$2a$10$29nN2j0tW.udzdSsmSNaku/.IvQsgqGPrvoQC/DycqHv9fFyKv6oe	\N	\N	\N	1	2012-12-20 06:34:15.138182	2012-12-19 06:34:15.138207	\N	\N	123456783330	Dept3UserThird	JAIM	TestOpen02	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:15.138111	t	t	f	\N	\N	\N	2012-12-20 06:34:15.127168	2012-12-20 06:34:15.140227
18	testopen03@gmail.com	$2a$10$2guIRqGTLWqWjDzwb.PYGOJIiQF8j/833.0eRw.8lWaHWRbcIZZ3C	\N	\N	\N	1	2012-12-20 06:34:15.30479	2012-12-19 06:34:15.304815	\N	\N	123456784410	Dept4Userfirst	JKRM	TestOpen03	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:15.304722	t	t	f	\N	\N	\N	2012-12-20 06:34:15.294158	2012-12-20 06:34:15.306847
19	testopen04@gmail.com	$2a$10$uEKJE8itWpYVrwcK6.Ti/Orxkvvi431lTXFg.7ADGc0eI1xSZ7s7q	\N	\N	\N	1	2012-12-20 06:34:15.47139	2012-12-19 06:34:15.471414	\N	\N	123456784420	Dept4UserSecond	JKRM	TestOpen04	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:15.471322	t	t	f	\N	\N	\N	2012-12-20 06:34:15.460544	2012-12-20 06:34:15.47341
20	testopen05@gmail.com	$2a$10$um80shgMNkJBgwL2ePwdx.MGROk5jDBIctqKSSm3Cbn8VVfsfaRPa	\N	\N	\N	1	2012-12-20 06:34:15.638018	2012-12-19 06:34:15.638042	\N	\N	123456784430	Dept4UserThird	JKRM	TestOpen05	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:15.637948	t	t	f	\N	\N	\N	2012-12-20 06:34:15.626838	2012-12-20 06:34:15.640029
21	testopen08@gmail.com	$2a$10$a9o1scx9rNgEYcmdlHGjBOqfxeGM2ay0u9sFsrYUEbaPqKqp6V97q	\N	\N	\N	1	2012-12-20 06:34:15.804645	2012-12-19 06:34:15.80467	\N	\N	123456785510	Dept5Userfirst	JPNM	TestOpen08	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:15.804575	t	t	f	\N	\N	\N	2012-12-20 06:34:15.793866	2012-12-20 06:34:15.806679
22	testopen09@gmail.com	$2a$10$ElLQ3nCfrs8Cibm/d7zXteTPHaz4Q2HS0NEcXUKOQWlf8sFiD8ihG	\N	\N	\N	1	2012-12-20 06:34:15.971236	2012-12-19 06:34:15.971261	\N	\N	123456785520	Dept5UserSecond	JPNM	TestOpen09	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:15.971168	t	t	f	\N	\N	\N	2012-12-20 06:34:15.960097	2012-12-20 06:34:15.973278
23	john.poul01@gmail.com	$2a$10$J5TBAy/ek8gkeu4yP/ua9./YMuakl4ImF6f4og/lz0cx3gHvmI5ye	\N	\N	\N	1	2012-12-20 06:34:16.187875	2012-12-19 06:34:16.1879	\N	\N	123456785530	Dept5UserThird	JPNM	JohnPoul01	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:16.187798	t	t	f	\N	\N	\N	2012-12-20 06:34:16.127013	2012-12-20 06:34:16.190047
24	john.poul02@gmail.com	$2a$10$ALtS10ZdFlKFMQPWwjU6senaiRj5MeW11edU8zYCz8.z7rtUoRUtu	\N	\N	\N	1	2012-12-20 06:34:16.354507	2012-12-19 06:34:16.354533	\N	\N	123456786610	Dept6Userfirst	JKM	JohnPoul02	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:16.354434	t	t	f	\N	\N	\N	2012-12-20 06:34:16.343788	2012-12-20 06:34:16.356648
25	john.poul03@gmail.com	$2a$10$NkrC6pPVsfgZaZwztYzrSuec2RXVWGk26ZNgdVW.fBSYz8vwvXrI.	\N	\N	\N	1	2012-12-20 06:34:16.521145	2012-12-19 06:34:16.52117	\N	\N	123456786620	Dept6UserSecond	JKM	JohnPoul03	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:16.521075	t	t	f	\N	\N	\N	2012-12-20 06:34:16.510073	2012-12-20 06:34:16.523243
26	john.poul04@gmail.com	$2a$10$TtjtUx04pU7gZ27EGorUsezZsE2qbzzhOAA5vLKpnvSUvnWygP91y	\N	\N	\N	1	2012-12-20 06:34:16.68779	2012-12-19 06:34:16.687815	\N	\N	123456786630	Dept6UserThird	JKM	JohnPoul04	\N	\N	\N	\N	\N	7	\N	9801498404	\N	\N	\N	\N	\N	\N	\N	Active	f	f	\N	2012-12-20 06:34:16.687721	t	t	f	\N	\N	\N	2012-12-20 06:34:16.676915	2012-12-20 06:34:16.689838
\.


--
-- TOC entry 2505 (class 0 OID 27473)
-- Dependencies: 196
-- Data for Name: vehicle_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehicle_types (id, name, created_at, updated_at) FROM stdin;
1	Kereta\n	2012-12-20 06:34:11.334731	2012-12-20 06:34:11.334731
2	Van\n	2012-12-20 06:34:11.355947	2012-12-20 06:34:11.355947
3	MPV\n	2012-12-20 06:34:11.364147	2012-12-20 06:34:11.364147
4	4WD\n	2012-12-20 06:34:11.372436	2012-12-20 06:34:11.372436
5	Bas\n	2012-12-20 06:34:11.380735	2012-12-20 06:34:11.380735
6	Lori\n	2012-12-20 06:34:11.389082	2012-12-20 06:34:11.389082
\.


--
-- TOC entry 2506 (class 0 OID 27481)
-- Dependencies: 198
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehicles (id, registration_id, registration_number, driver_id, vehicle_type_id, model_name, registration_date, alternate_driver_assigned, alternate_driver_id, created_at, updated_at) FROM stdin;
1	25	MBC 7447	1	1	Proton Waja	\n	f	\N	2012-12-20 06:34:17.923915	2012-12-20 06:34:17.923915
2	32	MBP 111	2	5	Bas Executive (30 Penumpang)	\n	f	\N	2012-12-20 06:34:17.954774	2012-12-20 06:34:17.954774
3	33	MBC 84	3	5	Bas (20 Penumpang)	\n	f	\N	2012-12-20 06:34:17.962898	2012-12-20 06:34:17.962898
4	47	MBM 202	4	1	Toyota Innova	20/01/2011\n	f	\N	2012-12-20 06:34:17.971204	2012-12-20 06:34:17.971204
5	49	MAH 4477	5	1	WIRA	31/01/2011\n	f	\N	2012-12-20 06:34:17.979507	2012-12-20 06:34:17.979507
6	52	MAU 1100	6	5	BAS ( 40 PENUMPANG )	23/02/2011\n	f	\N	2012-12-20 06:34:17.987855	2012-12-20 06:34:17.987855
7	54	MBB 7000	7	2	VAN	25/02/2011\n	f	\N	2012-12-20 06:34:17.996175	2012-12-20 06:34:17.996175
8	57	MBX 725	8	2	TOYOTA HIACE	18/03/2011\n	f	\N	2012-12-20 06:34:18.004539	2012-12-20 06:34:18.004539
9	71	MBC 262	9	1	PERDANA V6	30/05/2011\n	f	\N	2012-12-20 06:34:18.012857	2012-12-20 06:34:18.012857
10	72	MBC 434	10	1	Proton Waja	08/06/2011\n	f	\N	2012-12-20 06:34:18.021172	2012-12-20 06:34:18.021172
11	80	MBQ 2010	11	3	HONDA CRV	16/08/2011\n	f	\N	2012-12-20 06:34:18.029478	2012-12-20 06:34:18.029478
12	81	MAW 200	12	1	PAJERO	06/09/2011\n	f	\N	2012-12-20 06:34:18.03783	2012-12-20 06:34:18.03783
13	87	MBM 2299	13	1	Proton Waja	07/03/2012\n	f	\N	2012-12-20 06:34:18.04614	2012-12-20 06:34:18.04614
14	88	MBH 454	14	1	Proton Perdana Exec.	07/03/2012\n	f	\N	2012-12-20 06:34:18.054486	2012-12-20 06:34:18.054486
15	89	MAW 2	15	1	Proton Perdana Exec.	07/03/2012\n	f	\N	2012-12-20 06:34:18.0628	2012-12-20 06:34:18.0628
16	90	MBC 262	16	1	PERDANA V6	12/06/2012\n	f	\N	2012-12-20 06:34:18.071151	2012-12-20 06:34:18.071151
\.


--
-- TOC entry 2501 (class 0 OID 27422)
-- Dependencies: 188
-- Data for Name: vendor_stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vendor_stores (id, vendor_id, resources_id, quantity, serial_no, uom, is_active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2494 (class 0 OID 27348)
-- Dependencies: 174
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vendors (id, name, remarks, is_active, address, email, contact_no, created_at, updated_at) FROM stdin;
1	Vendor_one	\N	t	PERANAKAN	\N	012-112-1111	2012-12-20 06:34:10.898749	2012-12-20 06:34:10.898749
2	Vendor_two	\N	t	ST.PAUL HILL	\N	012-112-1112	2012-12-20 06:34:10.914499	2012-12-20 06:34:10.914499
3	Vendor_three	\N	t	PULAU UPEH	\N	012-112-1113	2012-12-20 06:34:10.922665	2012-12-20 06:34:10.922665
4	Vendor_four	\N	t	HARI MERDEKA	\N	012-112-1114	2012-12-20 06:34:10.93103	2012-12-20 06:34:10.93103
\.


-- Completed on 2012-12-20 12:24:05 IST

--
-- PostgreSQL database dump complete
--

