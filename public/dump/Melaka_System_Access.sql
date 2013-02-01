--
-- PostgreSQL database dump
--

-- Started on 2012-12-20 12:37:18 IST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 225
-- Name: system_accesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('system_accesses_id_seq', 18, true);


--
-- TOC entry 2140 (class 0 OID 27634)
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


-- Completed on 2012-12-20 12:37:18 IST

--
-- PostgreSQL database dump complete
--

