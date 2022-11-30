--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-1.pgdg100+1)
-- Dumped by pg_dump version 13.4 (Debian 13.4-1.pgdg100+1)

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
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    memberid integer NOT NULL,
    grade smallint,
    CONSTRAINT "grade >=1 and grade <=6" CHECK (((grade >= 1) AND (grade <= 6)))
);


ALTER TABLE public.member OWNER TO postgres;

--
-- Name: members_memberid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_memberid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_memberid_seq OWNER TO postgres;

--
-- Name: members_memberid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_memberid_seq OWNED BY public.member.memberid;


--
-- Name: member memberid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN memberid SET DEFAULT nextval('public.members_memberid_seq'::regclass);


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member (firstname, lastname, memberid, grade) FROM stdin;
Robin	Meier	2	6
Peter	Sacher	3	4
\.


--
-- Name: members_memberid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_memberid_seq', 3, true);


--
-- Name: member members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT members_pkey PRIMARY KEY (memberid);


--
-- PostgreSQL database dump complete
--

