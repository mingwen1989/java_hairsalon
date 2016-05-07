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
-- Name: clients; Type: TABLE; Schema: public; Owner: MW
--

CREATE TABLE clients (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    birthdate character varying,
    stylistid integer
);


ALTER TABLE clients OWNER TO "MW";

--
-- Name: stylists; Type: TABLE; Schema: public; Owner: MW
--

CREATE TABLE stylists (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying
);


ALTER TABLE stylists OWNER TO "MW";

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

ALTER SEQUENCE doctors_id_seq OWNED BY stylists.id;


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

ALTER SEQUENCE patients_id_seq OWNED BY clients.id;


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

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MW
--

ALTER TABLE ONLY specialties ALTER COLUMN id SET DEFAULT nextval('specialties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: MW
--

ALTER TABLE ONLY stylists ALTER COLUMN id SET DEFAULT nextval('doctors_id_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: MW
--

COPY clients (id, first_name, last_name, birthdate, stylistid) FROM stdin;
1	John	Doe	1985-05-06	1
4	Margret	Ann	1974-08-12	3
2	Randel	Cobb	1995-03-21	2
3	Mourice	Jean-Lucas	1987-07-05	1
5	Darren	Marks	1979-09-09	5
10	Margaret	Thatcher	1954-08-09	5
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MW
--

SELECT pg_catalog.setval('doctors_id_seq', 10, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: MW
--

SELECT pg_catalog.setval('patients_id_seq', 10, true);


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
-- Data for Name: stylists; Type: TABLE DATA; Schema: public; Owner: MW
--

COPY stylists (id, first_name, last_name) FROM stdin;
1	Alex	Smith
2	Lucas	Jones
3	Lisa	Arthur
4	Mark	Scott
5	Thomas 	Aaron
7	Paul 	Fitzgerald
8	Scott	Fitzgerald
9	Douglas	MacArthur
10	Robert	Fitzgerald
\.


--
-- Name: doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: MW
--

ALTER TABLE ONLY stylists
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: MW
--

ALTER TABLE ONLY clients
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

