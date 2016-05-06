--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: MW
--

CREATE TABLE doctors (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    specialty character varying
);


ALTER TABLE doctors OWNER TO "MW";

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: MW
--

CREATE SEQUENCE doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doctors_id_seq OWNER TO "MW";

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MW
--

ALTER SEQUENCE doctors_id_seq OWNED BY doctors.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: MW
--

CREATE TABLE patients (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    birthdate character varying,
    doctorid integer
);


ALTER TABLE patients OWNER TO "MW";

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: MW
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patients_id_seq OWNER TO "MW";

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MW
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: specialties; Type: TABLE; Schema: public; Owner: MW
--

CREATE TABLE specialties (
    id integer NOT NULL,
    specialty character varying
);


ALTER TABLE specialties OWNER TO "MW";

--
-- Name: specialties_id_seq; Type: SEQUENCE; Schema: public; Owner: MW
--

CREATE SEQUENCE specialties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specialties_id_seq OWNER TO "MW";

--
-- Name: specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: MW
--

ALTER SEQUENCE specialties_id_seq OWNED BY specialties.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MW
--

ALTER TABLE ONLY doctors ALTER COLUMN id SET DEFAULT nextval('doctors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MW
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MW
--

ALTER TABLE ONLY specialties ALTER COLUMN id SET DEFAULT nextval('specialties_id_seq'::regclass);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: MW
--

COPY doctors (id, first_name, last_name, specialty) FROM stdin;
1	Alex	Smith	Pediatrics
2	Lucas	Jones	Dermatology
3	Lisa	Arthur	Optometry
4	Mark	Scott	Neurology
5	Thomas 	Aaron	Dermatology
7	Paul 	Fitzgerald	\N
8	Scott	Fitzgerald	\N
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MW
--

SELECT pg_catalog.setval('doctors_id_seq', 8, true);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: MW
--

COPY patients (id, first_name, last_name, birthdate, doctorid) FROM stdin;
1	John	Doe	1985-05-06	1
4	Margret	Ann	1974-08-12	3
2	Randel	Cobb	1995-03-21	2
3	Mourice	Jean-Lucas	1987-07-05	1
5	Darren	Marks	1979-09-09	5
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MW
--

SELECT pg_catalog.setval('patients_id_seq', 5, true);


--
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: MW
--

COPY specialties (id, specialty) FROM stdin;
1	Optometry
2	Orthopedics
3	Pediatrics
4	Dermatology
5	Podiatry
6	Neurology
7	Anesthesiology
\.


--
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MW
--

SELECT pg_catalog.setval('specialties_id_seq', 7, true);


--
-- Name: doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: MW
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: MW
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: MW
--

ALTER TABLE ONLY specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: MW
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "MW";
GRANT ALL ON SCHEMA public TO "MW";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

