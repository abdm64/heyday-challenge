toc.dat                                                                                             0000600 0004000 0002000 00000015567 14045331566 0014464 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           '                y            nestdb    13.2    13.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16713    nestdb    DATABASE     [   CREATE DATABASE nestdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE nestdb;
                postgres    false         �            1259    16735    employee    TABLE     �   CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    "employee_Name" character varying NOT NULL,
    monthly_budget integer NOT NULL,
    company_id integer NOT NULL,
    company_title character varying NOT NULL
);
    DROP TABLE public.employee;
       public         heap    postgres    false         �            1259    16733    employee_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.employee_employee_id_seq;
       public          postgres    false    205         �           0    0    employee_employee_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;
          public          postgres    false    204         �            1259    16727    orders    TABLE     �   CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "OrderDate" timestamp without time zone NOT NULL,
    employee_id integer NOT NULL,
    voucher_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false         �            1259    16725    orders_orderId_seq    SEQUENCE     �   CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."orders_orderId_seq";
       public          postgres    false    203         �           0    0    orders_orderId_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";
          public          postgres    false    202         �            1259    16716    voucher    TABLE     �   CREATE TABLE public.voucher (
    voucher_id integer NOT NULL,
    "Voucher_Amount" integer NOT NULL,
    partner_id integer NOT NULL,
    partner_name character varying NOT NULL
);
    DROP TABLE public.voucher;
       public         heap    postgres    false         �            1259    16714    voucher_voucher_id_seq    SEQUENCE     �   CREATE SEQUENCE public.voucher_voucher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.voucher_voucher_id_seq;
       public          postgres    false    201         �           0    0    voucher_voucher_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.voucher_voucher_id_seq OWNED BY public.voucher.voucher_id;
          public          postgres    false    200         ;           2604    16738    employee employee_id    DEFAULT     |   ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);
 C   ALTER TABLE public.employee ALTER COLUMN employee_id DROP DEFAULT;
       public          postgres    false    205    204    205         :           2604    16730    orders orderId    DEFAULT     t   ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);
 ?   ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
       public          postgres    false    202    203    203         9           2604    16719    voucher voucher_id    DEFAULT     x   ALTER TABLE ONLY public.voucher ALTER COLUMN voucher_id SET DEFAULT nextval('public.voucher_voucher_id_seq'::regclass);
 A   ALTER TABLE public.voucher ALTER COLUMN voucher_id DROP DEFAULT;
       public          postgres    false    200    201    201         �          0    16735    employee 
   TABLE DATA           k   COPY public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) FROM stdin;
    public          postgres    false    205       3273.dat �          0    16727    orders 
   TABLE DATA           Q   COPY public.orders ("orderId", "OrderDate", employee_id, voucher_id) FROM stdin;
    public          postgres    false    203       3271.dat �          0    16716    voucher 
   TABLE DATA           Y   COPY public.voucher (voucher_id, "Voucher_Amount", partner_id, partner_name) FROM stdin;
    public          postgres    false    201       3269.dat �           0    0    employee_employee_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.employee_employee_id_seq', 1, false);
          public          postgres    false    204         �           0    0    orders_orderId_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);
          public          postgres    false    202         �           0    0    voucher_voucher_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.voucher_voucher_id_seq', 1, false);
          public          postgres    false    200         ?           2606    16732 %   orders PK_41ba27842ac1a2c24817ca59eaa 
   CONSTRAINT     l   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "PK_41ba27842ac1a2c24817ca59eaa" PRIMARY KEY ("orderId");
 Q   ALTER TABLE ONLY public.orders DROP CONSTRAINT "PK_41ba27842ac1a2c24817ca59eaa";
       public            postgres    false    203         =           2606    16724 &   voucher PK_b885ed14e32391234a3bad969d2 
   CONSTRAINT     n   ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT "PK_b885ed14e32391234a3bad969d2" PRIMARY KEY (voucher_id);
 R   ALTER TABLE ONLY public.voucher DROP CONSTRAINT "PK_b885ed14e32391234a3bad969d2";
       public            postgres    false    201         A           2606    16743 '   employee PK_f9d306b968b54923539b3936b03 
   CONSTRAINT     p   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "PK_f9d306b968b54923539b3936b03" PRIMARY KEY (employee_id);
 S   ALTER TABLE ONLY public.employee DROP CONSTRAINT "PK_f9d306b968b54923539b3936b03";
       public            postgres    false    205                                                                                                                                                 3273.dat                                                                                            0000600 0004000 0002000 00000000346 14045331566 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Raffael	44	1	Moon Inc
2	Mathis	44	1	Moon Inc
3	Tim	44	1	Moon Inc
4	Beatrix	60	1	Moon Inc
5	Angela	30	2	Sun Inc
6	Alina	30	2	Sun Inc
7	Corinna	30	2	Sun Inc
8	Greta	30	2	Sun Inc
9	Heinz	30	2	Sun Inc
10	Gregor	100	3	Venus Inc
\.


                                                                                                                                                                                                                                                                                          3271.dat                                                                                            0000600 0004000 0002000 00000002524 14045331566 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2020-01-05 00:00:00	1	6
2	2020-02-05 00:00:00	1	6
3	2020-03-05 00:00:00	1	1
4	2020-03-10 00:00:00	1	2
5	2020-01-03 00:00:00	2	5
6	2020-01-03 00:00:00	2	5
7	2020-02-03 00:00:00	2	5
8	2020-02-03 00:00:00	2	5
9	2020-03-03 00:00:00	2	5
10	2020-03-03 00:00:00	2	5
11	2020-01-03 00:00:00	10	3
12	2020-01-04 00:00:00	10	3
13	2020-01-05 00:00:00	10	3
14	2020-01-06 00:00:00	10	3
15	2020-01-07 00:00:00	10	3
16	2020-01-08 00:00:00	10	3
17	2020-02-03 00:00:00	10	3
18	2020-02-03 00:00:00	10	3
19	2020-02-03 00:00:00	10	3
20	2020-02-03 00:00:00	10	3
21	2020-02-03 00:00:00	10	3
22	2020-02-03 00:00:00	10	3
23	2020-03-04 00:00:00	10	3
24	2020-03-04 00:00:00	10	3
25	2020-03-04 00:00:00	10	3
26	2020-03-04 00:00:00	10	3
27	2020-03-04 00:00:00	10	3
28	2020-03-04 00:00:00	10	3
29	2020-01-08 00:00:00	5	4
30	2020-02-03 00:00:00	5	4
31	2020-03-04 00:00:00	5	4
32	2020-01-07 00:00:00	6	5
33	2020-02-05 00:00:00	6	5
34	2020-03-14 00:00:00	6	5
35	2020-01-05 00:00:00	3	2
36	2020-01-05 00:00:00	3	2
37	2020-02-05 00:00:00	3	2
38	2020-02-05 00:00:00	3	2
39	2020-03-05 00:00:00	3	2
40	2020-03-05 00:00:00	3	2
41	2020-01-07 00:00:00	4	6
42	2020-02-03 00:00:00	4	6
43	2020-03-04 00:00:00	4	4
44	2020-02-03 00:00:00	7	6
45	2020-03-04 00:00:00	7	6
46	2020-01-07 00:00:00	8	1
47	2020-01-07 00:00:00	8	1
48	2020-02-05 00:00:00	8	1
49	2020-02-05 00:00:00	8	1
50	2020-02-05 00:00:00	8	1
\.


                                                                                                                                                                            3269.dat                                                                                            0000600 0004000 0002000 00000000171 14045331566 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	10	1	Atlantik Inc
2	20	1	Atlantik Inc
3	15	2	Pacific Inc
4	30	2	Pacific Inc
5	22	2	Pacific Inc
6	44	2	Pacific Inc
\.


                                                                                                                                                                                                                                                                                                                                                                                                       restore.sql                                                                                         0000600 0004000 0002000 00000014215 14045331566 0015376 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.0

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

DROP DATABASE nestdb;
--
-- Name: nestdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE nestdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE nestdb OWNER TO postgres;

\connect nestdb

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    "employee_Name" character varying NOT NULL,
    monthly_budget integer NOT NULL,
    company_id integer NOT NULL,
    company_title character varying NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employee_id_seq OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "OrderDate" timestamp without time zone NOT NULL,
    employee_id integer NOT NULL,
    voucher_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."orders_orderId_seq" OWNER TO postgres;

--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: voucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voucher (
    voucher_id integer NOT NULL,
    "Voucher_Amount" integer NOT NULL,
    partner_id integer NOT NULL,
    partner_name character varying NOT NULL
);


ALTER TABLE public.voucher OWNER TO postgres;

--
-- Name: voucher_voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voucher_voucher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voucher_voucher_id_seq OWNER TO postgres;

--
-- Name: voucher_voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voucher_voucher_id_seq OWNED BY public.voucher.voucher_id;


--
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: voucher voucher_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher ALTER COLUMN voucher_id SET DEFAULT nextval('public.voucher_voucher_id_seq'::regclass);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) FROM stdin;
\.
COPY public.employee (employee_id, "employee_Name", monthly_budget, company_id, company_title) FROM '$$PATH$$/3273.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders ("orderId", "OrderDate", employee_id, voucher_id) FROM stdin;
\.
COPY public.orders ("orderId", "OrderDate", employee_id, voucher_id) FROM '$$PATH$$/3271.dat';

--
-- Data for Name: voucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voucher (voucher_id, "Voucher_Amount", partner_id, partner_name) FROM stdin;
\.
COPY public.voucher (voucher_id, "Voucher_Amount", partner_id, partner_name) FROM '$$PATH$$/3269.dat';

--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 1, false);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);


--
-- Name: voucher_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voucher_voucher_id_seq', 1, false);


--
-- Name: orders PK_41ba27842ac1a2c24817ca59eaa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "PK_41ba27842ac1a2c24817ca59eaa" PRIMARY KEY ("orderId");


--
-- Name: voucher PK_b885ed14e32391234a3bad969d2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT "PK_b885ed14e32391234a3bad969d2" PRIMARY KEY (voucher_id);


--
-- Name: employee PK_f9d306b968b54923539b3936b03; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "PK_f9d306b968b54923539b3936b03" PRIMARY KEY (employee_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   