--
-- PostgreSQL database dump
--

-- Started on 2012-12-20 12:36:20 IST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 255
-- Name: building_asset_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('building_asset_types_id_seq', 74, true);


--
-- TOC entry 2140 (class 0 OID 27792)
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


-- Completed on 2012-12-20 12:36:20 IST

--
-- PostgreSQL database dump complete
--

