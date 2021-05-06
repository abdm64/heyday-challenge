--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2021-05-06 14:30:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2837 (class 0 OID 32963)
-- Dependencies: 203
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (22, 'abdella', 200, 1, 'djezzy');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (1, 'Raffael', 44, 1, 'Moon Inc');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (2, 'Mathis', 44, 1, 'Moon Inc');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (3, 'Tim', 44, 1, 'Moon Inc');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (4, 'Beatrix', 60, 1, 'Moon Inc');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (5, 'Angela', 30, 2, 'Sun Inc');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (6, 'Alina', 30, 2, 'Sun Inc');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (7, 'Corinna', 30, 2, 'Sun Inc');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (8, 'Greta', 30, 2, 'Sun Inc');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (9, 'Heinz', 30, 2, 'Sun Inc');
INSERT INTO public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) VALUES (10, 'Gregor', 100, 3, 'Venus Inc');


--
-- TOC entry 2841 (class 0 OID 33105)
-- Dependencies: 207
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (1, '2020-01-05 00:00:00', 1, 6);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (2, '2020-02-05 00:00:00', 1, 6);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (3, '2020-03-05 00:00:00', 1, 1);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (4, '2020-03-10 00:00:00', 1, 2);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (5, '2020-01-03 00:00:00', 2, 5);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (6, '2020-01-03 00:00:00', 2, 5);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (7, '2020-02-03 00:00:00', 2, 5);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (8, '2020-02-03 00:00:00', 2, 5);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (9, '2020-03-03 00:00:00', 2, 5);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (10, '2020-03-03 00:00:00', 2, 5);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (11, '2020-01-03 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (12, '2020-01-04 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (13, '2020-01-05 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (14, '2020-01-06 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (15, '2020-01-07 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (16, '2020-01-08 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (17, '2020-02-03 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (18, '2020-02-03 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (19, '2020-02-03 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (20, '2020-02-03 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (21, '2020-02-03 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (22, '2020-02-03 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (23, '2020-03-04 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (24, '2020-03-04 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (25, '2020-03-04 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (26, '2020-03-04 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (27, '2020-03-04 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (28, '2020-03-04 00:00:00', 10, 3);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (29, '2020-01-08 00:00:00', 5, 4);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (30, '2020-02-03 00:00:00', 5, 4);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (31, '2020-03-04 00:00:00', 5, 4);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (32, '2020-01-07 00:00:00', 6, 5);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (33, '2020-02-05 00:00:00', 6, 5);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (34, '2020-03-14 00:00:00', 6, 5);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (35, '2020-01-05 00:00:00', 3, 2);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (36, '2020-01-05 00:00:00', 3, 2);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (37, '2020-02-05 00:00:00', 3, 2);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (38, '2020-02-05 00:00:00', 3, 2);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (39, '2020-03-05 00:00:00', 3, 2);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (40, '2020-03-05 00:00:00', 3, 2);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (41, '2020-01-07 00:00:00', 4, 6);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (42, '2020-02-03 00:00:00', 4, 6);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (43, '2020-03-04 00:00:00', 4, 4);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (44, '2020-02-03 00:00:00', 7, 6);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (45, '2020-03-04 00:00:00', 7, 6);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (46, '2020-01-07 00:00:00', 8, 1);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (47, '2020-01-07 00:00:00', 8, 1);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (48, '2020-02-05 00:00:00', 8, 1);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (49, '2020-02-05 00:00:00', 8, 1);
INSERT INTO public.orders ("orderId", "OrderDate", employee_id, voucher_id) VALUES (50, '2020-02-05 00:00:00', 8, 1);


--
-- TOC entry 2839 (class 0 OID 33082)
-- Dependencies: 205
-- Data for Name: voucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.voucher (voucher_id, "Voucher_Amount", partner_id, partner_name) VALUES (1, 10, 1, 'Atlantik Inc');
INSERT INTO public.voucher (voucher_id, "Voucher_Amount", partner_id, partner_name) VALUES (2, 20, 1, 'Atlantik Inc');
INSERT INTO public.voucher (voucher_id, "Voucher_Amount", partner_id, partner_name) VALUES (3, 15, 2, 'Pacific Inc');
INSERT INTO public.voucher (voucher_id, "Voucher_Amount", partner_id, partner_name) VALUES (4, 30, 2, 'Pacific Inc');
INSERT INTO public.voucher (voucher_id, "Voucher_Amount", partner_id, partner_name) VALUES (5, 22, 2, 'Pacific Inc');
INSERT INTO public.voucher (voucher_id, "Voucher_Amount", partner_id, partner_name) VALUES (6, 44, 2, 'Pacific Inc');


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 202
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 1, true);


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 206
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 204
-- Name: voucher_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voucher_voucher_id_seq', 1, false);


-- Completed on 2021-05-06 14:30:51

--
-- PostgreSQL database dump complete
--

