--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(40) NOT NULL,
    diameter_in_km integer,
    radius_in_km integer,
    predominant_element character varying(30),
    age_in_million_of_years numeric(4,1),
    visible_from_earth boolean,
    bigger_than_the_milky_way boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diameter_in_km integer,
    radius_in_km integer,
    predominant_element character varying(30),
    age_in_million_of_years numeric(4,1),
    visible_from_earth boolean,
    bigger_than_the_moon boolean,
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
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diameter_in_km integer,
    radius_in_km integer,
    predominant_element character varying(30),
    age_in_million_of_years numeric(4,1),
    visible_from_earth boolean,
    bigger_than_the_earth boolean,
    star_id integer,
    nickname text
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
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diameter_in_km integer,
    radius_in_km integer,
    predominant_element character varying(30),
    age_in_million_of_years numeric(4,1),
    visible_from_earth boolean,
    bigger_than_the_sun boolean,
    galaxy_id integer NOT NULL
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
-- Name: stellar_system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stellar_system_system_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stellar_system_system_id_seq OWNER TO freecodecamp;

--
-- Name: stellar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stellar_system (
    stellar_system_id integer DEFAULT nextval('public.stellar_system_system_id_seq'::regclass) NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.stellar_system OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 100000000, 50000000, 'Hidrógeno', 130.0, true, false);
INSERT INTO public.galaxy VALUES (2, 'Galaxia de Andrómeda', 220000000, 110000000, 'Hidrógeno', 100.0, true, true);
INSERT INTO public.galaxy VALUES (3, 'Galaxia de Triángulo', 60000000, 30000000, 'Hidrógeno', 120.0, true, false);
INSERT INTO public.galaxy VALUES (4, 'Galaxia Sombrero', 90000000, 45000000, 'Hidrógeno', 100.0, true, false);
INSERT INTO public.galaxy VALUES (5, 'Galaxia elíptica M87', 120000000, 60000000, 'Hidrógeno', 130.0, true, false);
INSERT INTO public.galaxy VALUES (6, 'Galaxia de Bode', 60000000, 30000000, 'Hidrógeno', 110.0, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (16, 'Hermes C', 450, 225, 'Roca', 420.0, false, false, 1);
INSERT INTO public.moon VALUES (17, 'Hermes D', 500, 250, 'Hierro', 420.0, false, false, 1);
INSERT INTO public.moon VALUES (18, 'Kepler Moon Beta', 1100, 550, 'Hielo', 650.0, false, false, 2);
INSERT INTO public.moon VALUES (19, 'Kepler Moon Gamma', 900, 450, 'Silicio', 680.0, false, false, 2);
INSERT INTO public.moon VALUES (20, 'Io', 3643, 1821, 'Azufre', 460.0, true, false, 3);
INSERT INTO public.moon VALUES (21, 'Europa', 3122, 1561, 'Hielo', 460.0, true, false, 3);
INSERT INTO public.moon VALUES (22, 'Ganímedes', 5268, 2634, 'Silicato', 460.0, true, true, 3);
INSERT INTO public.moon VALUES (23, 'Callisto', 4820, 2410, 'Carbono', 460.0, true, false, 3);
INSERT INTO public.moon VALUES (24, 'HD Moon Beta', 1300, 650, 'Metano', 310.0, false, false, 4);
INSERT INTO public.moon VALUES (25, 'HD Moon Gamma', 1400, 700, 'Carbono', 320.0, false, false, 4);
INSERT INTO public.moon VALUES (26, 'Proxima Moon 1', 750, 375, 'Roca', 400.0, false, false, 5);
INSERT INTO public.moon VALUES (27, 'Proxima Moon 2', 800, 400, 'Hierro', 400.0, false, false, 5);
INSERT INTO public.moon VALUES (28, 'Vulcano Moon C', 600, 300, 'Silicio', 420.0, false, false, 6);
INSERT INTO public.moon VALUES (29, 'Vulcano Moon D', 700, 350, 'Carbono', 420.0, false, false, 6);
INSERT INTO public.moon VALUES (30, 'Luna', 3474, 1737, 'Silicio', 450.0, true, false, 7);
INSERT INTO public.moon VALUES (31, 'Tritón', 2707, 1354, 'Nitrógeno', 450.0, true, false, 8);
INSERT INTO public.moon VALUES (32, 'Nereida', 340, 170, 'Carbono', 450.0, true, false, 8);
INSERT INTO public.moon VALUES (33, 'Oberón', 1523, 761, 'Hielo', 450.0, false, false, 9);
INSERT INTO public.moon VALUES (34, 'Miranda', 471, 236, 'Silicato', 450.0, false, false, 9);
INSERT INTO public.moon VALUES (35, 'Gliese Moon Alpha', 1100, 550, 'Roca', 430.0, false, false, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 4879, 2439, 'Hierro', 450.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Kepler-22b', 24000, 12000, 'Silicio', 600.0, false, false, 3, NULL);
INSERT INTO public.planet VALUES (3, 'Júpiter', 139820, 69911, 'Hidrógeno', 460.0, true, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'HD 209458 b', 143000, 71500, 'Hidrógeno', 500.0, false, true, 2, NULL);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri b', 12000, 6000, 'Roca', 400.0, false, false, 4, NULL);
INSERT INTO public.planet VALUES (6, 'Vulcano', 6100, 3050, 'Hierro', 420.0, false, false, 6, NULL);
INSERT INTO public.planet VALUES (7, 'Tierra', 12742, 6371, 'Oxígeno', 450.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptuno', 49528, 24764, 'Hidrógeno', 460.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Urano', 51118, 25559, 'Hidrógeno', 460.0, true, false, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Gliese 581 g', 11300, 5650, 'Silicio', 700.0, false, false, 2, NULL);
INSERT INTO public.planet VALUES (11, 'HD 189733 b', 13500, 6750, 'Metano', 300.0, false, false, 3, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-452 b', 12000, 6000, 'Silicio', 400.0, false, false, 4, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1392700, 696350, 'Hidrógeno', 460.0, true, false, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 950000000, 475000000, 'Hidrógeno', 800.0, true, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 2390000, 1195000, 'Hidrógeno', 200.0, true, false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1392000, 696000, 'Hidrógeno', 500.0, true, false, 1);
INSERT INTO public.star VALUES (5, 'Antares', 880000000, 440000000, 'Hidrógeno', 120.0, true, true, 4);
INSERT INTO public.star VALUES (6, 'Vega', 2690000, 1345000, 'Hidrógeno', 500.0, true, false, 3);


--
-- Data for Name: stellar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stellar_system VALUES (1, 'Sistema Solar', 1, 1);
INSERT INTO public.stellar_system VALUES (2, 'Sistema Rigelatus', 2, 2);
INSERT INTO public.stellar_system VALUES (3, 'Sistema Siriana', 3, 3);
INSERT INTO public.stellar_system VALUES (4, 'Sistema Centauris', 4, 4);
INSERT INTO public.stellar_system VALUES (5, 'Sistema Scorpius', 5, 5);
INSERT INTO public.stellar_system VALUES (6, 'Sistema Lyrae', 6, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 35, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 26, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: stellar_system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stellar_system_system_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: stellar_system stellar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_system
    ADD CONSTRAINT stellar_system_pkey PRIMARY KEY (stellar_system_id);


--
-- Name: moon uniq_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uniq_moon UNIQUE (moon_id, name);


--
-- Name: planet uniq_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniq_planet UNIQUE (planet_id, name);


--
-- Name: stellar_system uniq_stellar; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_system
    ADD CONSTRAINT uniq_stellar UNIQUE (stellar_system_id, name);


--
-- Name: moon moon_corresp_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_corresp_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_nearest_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_nearest_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_corresp_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_corresp_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: stellar_system stellar_system_corresp_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_system
    ADD CONSTRAINT stellar_system_corresp_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: stellar_system stellar_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_system
    ADD CONSTRAINT stellar_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

