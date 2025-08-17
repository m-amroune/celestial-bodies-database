--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discovered_year integer,
    is_periodic boolean NOT NULL,
    orbit_length integer,
    star_id integer
);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    size integer NOT NULL,
    distance numeric(10,2),
    has_black_hole boolean NOT NULL,
    description text
);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    radius integer NOT NULL
);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    mass numeric NOT NULL
);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    is_visible boolean NOT NULL
);


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comet VALUES (1, 'Halley', 1758, true, 75, 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1995, false, 2533, 2);
INSERT INTO public.comet VALUES (3, 'Encke', 1786, true, 3, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', 1000000, 3300.50, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda I', 3000, 2500.00, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 1200000, 2537.00, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 800000, 11100.25, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Butterfly Galaxies', 600000, 6300.75, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Medusa Merger', 700000, 4500.10, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.moon VALUES (1, 'Luna', 2, true, 1737);
INSERT INTO public.moon VALUES (2, 'Phobos_Pb', 3, false, 11);
INSERT INTO public.moon VALUES (3, 'Deimos_Pb', 3, false, 6);
INSERT INTO public.moon VALUES (4, 'Sirius_b_I_M1', 5, true, 1200);
INSERT INTO public.moon VALUES (5, 'Sirius_b_I_M2', 5, true, 800);
INSERT INTO public.moon VALUES (6, 'Sirius_b_II_M1', 6, true, 1000);
INSERT INTO public.moon VALUES (7, 'Rigel_I_M1', 7, false, 500);
INSERT INTO public.moon VALUES (8, 'Rigel_I_M2', 7, true, 600);
INSERT INTO public.moon VALUES (9, 'Rigel_II_M1', 8, false, 400);
INSERT INTO public.moon VALUES (10, 'Rigel_II_M2', 8, false, 300);
INSERT INTO public.moon VALUES (11, 'Rigel_II_M3', 8, true, 900);
INSERT INTO public.moon VALUES (12, 'Vega_I_M1', 9, true, 700);
INSERT INTO public.moon VALUES (13, 'Vega_I_M2', 9, false, 200);
INSERT INTO public.moon VALUES (14, 'Vega_II_M1', 10, false, 350);
INSERT INTO public.moon VALUES (15, 'Deneb_I_M1', 11, true, 1000);
INSERT INTO public.moon VALUES (16, 'Deneb_I_M2', 11, false, 400);
INSERT INTO public.moon VALUES (17, 'Deneb_II_M1', 12, true, 1200);
INSERT INTO public.moon VALUES (18, 'Deneb_II_M2', 12, true, 800);
INSERT INTO public.moon VALUES (19, 'Deneb_II_M3', 12, false, 600);
INSERT INTO public.moon VALUES (20, 'Deneb_II_M4', 12, false, 300);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 0.33);
INSERT INTO public.planet VALUES (2, 'Earth', 1, true, 5.97);
INSERT INTO public.planet VALUES (3, 'Proxima b', 2, false, 1.27);
INSERT INTO public.planet VALUES (4, 'Proxima c', 2, false, 7.0);
INSERT INTO public.planet VALUES (5, 'Sirius b I', 3, false, 2.1);
INSERT INTO public.planet VALUES (6, 'Sirius b II', 3, false, 3.4);
INSERT INTO public.planet VALUES (7, 'Rigel I', 4, false, 4.2);
INSERT INTO public.planet VALUES (8, 'Rigel II', 4, false, 6.8);
INSERT INTO public.planet VALUES (9, 'Vega I', 5, false, 1.9);
INSERT INTO public.planet VALUES (10, 'Vega II', 5, false, 5.5);
INSERT INTO public.planet VALUES (11, 'Deneb I', 6, false, 8.2);
INSERT INTO public.planet VALUES (12, 'Deneb II', 6, false, 10.4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.star VALUES (1, 'Alcyoneus Star', 1, 15000, true);
INSERT INTO public.star VALUES (2, 'Andromeda I Star', 2, 12000, false);
INSERT INTO public.star VALUES (3, 'Andromeda Main Star', 3, 20000, true);
INSERT INTO public.star VALUES (4, 'Backward Core Star', 4, 18000, true);
INSERT INTO public.star VALUES (5, 'Butterfly Twin Star', 5, 16000, true);
INSERT INTO public.star VALUES (6, 'Medusa Central Star', 6, 17000, false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

