--Todo esse esquema de banco de dados foi criado por mim em uma atividade de Banco de Dados relacionais.
--Ao longo da atividade eu não pude anotar os comados executados, mas no final ele me deu um resumo de todos os comandos e inserções.
--Abaixo está o resumo de todos os comandos e inserções que foram executados para criar esse banco de dados. 

--Disponibilizado por: freeCodeCamp 

--------------------------------

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    description text,
    has_life boolean NOT NULL,
    age_in_milions_of_years integer,
    planet_types text NOT NULL,
    distance_from_earth numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    name character varying(20) NOT NULL,
    galaxy_type text,
    dimension numeric(10,3) NOT NULL,
    galaxy_types_id integer NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20),
    moon_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_milions_of_years integer,
    planet_types text NOT NULL,
    distance_from_earth numeric(10,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20),
    planet_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_milions_of_years integer,
    planet_types text NOT NULL,
    distance_from_earth numeric(10,2),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(20),
    star_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_milions_of_years integer,
    planet_types text NOT NULL,
    distance_from_earth numeric(10,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', NULL, false, NULL, 'NULL', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, false, NULL, 'NULL', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulo', NULL, false, NULL, 'NULL', NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', NULL, false, NULL, 'NULL', NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus', NULL, false, NULL, 'NULL', NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', NULL, false, NULL, 'NULL', NULL);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES ('Espiral', NULL, 10.000, 1);
INSERT INTO public.galaxy_types VALUES ('Eliptica', NULL, 10.000, 2);
INSERT INTO public.galaxy_types VALUES ('Irregular', NULL, 10.000, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Lua', 2, NULL, false, NULL, 'NULL', NULL, 1);
INSERT INTO public.moon VALUES ('Fobos', 5, NULL, false, NULL, 'NULL', NULL, 2);
INSERT INTO public.moon VALUES ('Deimos', 6, NULL, false, NULL, 'NULL', NULL, 2);
INSERT INTO public.moon VALUES ('Europa', 10, NULL, false, NULL, 'NULL', NULL, 3);
INSERT INTO public.moon VALUES ('Gamides', 11, NULL, false, NULL, 'NULL', NULL, 3);
INSERT INTO public.moon VALUES ('Calisto', 12, NULL, false, NULL, 'NULL', NULL, 3);
INSERT INTO public.moon VALUES ('IO', 7, NULL, false, NULL, 'NULL', NULL, 3);
INSERT INTO public.moon VALUES ('Tita', 13, NULL, false, NULL, 'NULL', NULL, 4);
INSERT INTO public.moon VALUES ('Encelado', 14, NULL, false, NULL, 'NULL', NULL, 4);
INSERT INTO public.moon VALUES ('Mimas', 15, NULL, false, NULL, 'NULL', NULL, 4);
INSERT INTO public.moon VALUES ('Japeto', 16, NULL, false, NULL, 'NULL', NULL, 4);
INSERT INTO public.moon VALUES ('Reia', 17, NULL, false, NULL, 'NULL', NULL, 4);
INSERT INTO public.moon VALUES ('Dione', 18, NULL, false, NULL, 'NULL', NULL, 4);
INSERT INTO public.moon VALUES ('Tetis', 19, NULL, false, NULL, 'NULL', NULL, 4);
INSERT INTO public.moon VALUES ('Titania', 20, NULL, false, NULL, 'NULL', NULL, 5);
INSERT INTO public.moon VALUES ('Oberon', 21, NULL, false, NULL, 'NULL', NULL, 5);
INSERT INTO public.moon VALUES ('Miranda', 22, NULL, false, NULL, 'NULL', NULL, 5);
INSERT INTO public.moon VALUES ('Ariel', 23, NULL, false, NULL, 'NULL', NULL, 5);
INSERT INTO public.moon VALUES ('Umbriel', 24, NULL, false, NULL, 'NULL', NULL, 5);
INSERT INTO public.moon VALUES ('Tritaõ', 25, NULL, false, NULL, 'NULL', NULL, 6);
INSERT INTO public.moon VALUES ('Prometeus[]', 26, NULL, false, NULL, 'NULL', NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Terra', 1, NULL, true, NULL, 'NULL', NULL, 1);
INSERT INTO public.planet VALUES ('Venus', 3, NULL, true, NULL, 'NULL', NULL, 1);
INSERT INTO public.planet VALUES ('Marte', 4, NULL, true, NULL, 'NULL', NULL, 1);
INSERT INTO public.planet VALUES ('Jupite', 5, NULL, true, NULL, 'NULL', NULL, 1);
INSERT INTO public.planet VALUES ('Saturno', 6, NULL, true, NULL, 'NULL', NULL, 1);
INSERT INTO public.planet VALUES ('Urano', 7, NULL, true, NULL, 'NULL', NULL, 2);
INSERT INTO public.planet VALUES ('Netuno', 8, NULL, true, NULL, 'NULL', NULL, 2);
INSERT INTO public.planet VALUES ('Proxima B', 9, NULL, true, NULL, 'NULL', NULL, 2);
INSERT INTO public.planet VALUES ('Kepler 1', 10, NULL, true, NULL, 'NULL', NULL, 2);
INSERT INTO public.planet VALUES ('Kepler 2', 11, NULL, true, NULL, 'NULL', NULL, 2);
INSERT INTO public.planet VALUES ('Trappist', 12, NULL, true, NULL, 'NULL', NULL, 2);
INSERT INTO public.planet VALUES ('Mercúrio', 2, NULL, true, NULL, 'NULL', NULL, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sol', 1, NULL, false, NULL, 'NULL', NULL, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 2, NULL, false, NULL, 'NULL', NULL, 1);
INSERT INTO public.star VALUES ('Sirius', 3, NULL, false, NULL, 'NULL', NULL, 1);
INSERT INTO public.star VALUES ('Betelgeuse', 4, NULL, false, NULL, 'NULL', NULL, 2);
INSERT INTO public.star VALUES ('Rigel', 5, NULL, false, NULL, 'NULL', NULL, 2);
INSERT INTO public.star VALUES ('Vega', 6, NULL, false, NULL, 'NULL', NULL, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

