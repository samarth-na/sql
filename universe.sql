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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbital_period_years numeric(10,2),
    last_perihelion date NOT NULL,
    is_periodic boolean NOT NULL,
    nucleus_diameter_km numeric(8,2),
    next_visible_from_earth date
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_ly numeric(15,2) NOT NULL,
    has_supermassive_black_hole boolean DEFAULT true,
    is_spiral boolean,
    discovered_year integer,
    description text
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
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    is_tidally_locked boolean DEFAULT true,
    has_ice boolean,
    discovery_year integer
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mass_earth numeric(12,4),
    has_atmosphere boolean,
    has_life boolean DEFAULT false,
    orbital_period_days numeric(10,2)
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
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    spectral_class character varying(10) NOT NULL,
    temperature_kelvin integer,
    is_variable boolean DEFAULT false,
    has_planetary_system boolean,
    luminosity numeric(20,10)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 75.32, '1986-02-09', true, 11.00, '2061-07-28');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533.00, '1997-04-01', true, 60.00, '4385-01-01');
INSERT INTO public.comet VALUES (3, 'Comet NEOWISE', 6766.00, '2020-07-03', true, 5.00, '8686-01-01');
INSERT INTO public.comet VALUES (4, '2P/Encke', 3.30, '2023-10-22', true, 4.80, '2027-03-10');
INSERT INTO public.comet VALUES (5, 'Comet Hyakutake', 17000.00, '1996-05-01', false, 4.20, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105700.00, true, true, 1610, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000.00, true, true, 964, 'Closest spiral galaxy to Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000.00, true, true, 1654, 'Third-largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 980000.00, true, false, 1781, 'Famous for its supermassive black hole');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 49000.00, true, true, 1781, 'Named for its resemblance to the hat');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 60000.00, true, true, 1773, 'Interacting grand-design spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (19, 3, 'Ganymede', 5262.40, true, true, 1610);
INSERT INTO public.moon VALUES (20, 3, 'Callisto', 4820.60, true, true, 1610);
INSERT INTO public.moon VALUES (21, 3, 'Io', 3643.20, true, false, 1610);
INSERT INTO public.moon VALUES (22, 3, 'Europa', 3121.60, true, true, 1610);
INSERT INTO public.moon VALUES (23, 3, 'Amalthea', 167.00, true, false, 1892);
INSERT INTO public.moon VALUES (24, 3, 'Himalia', 139.60, false, true, 1904);
INSERT INTO public.moon VALUES (25, 4, 'Titan', 5149.50, true, true, 1655);
INSERT INTO public.moon VALUES (26, 4, 'Rhea', 1527.60, true, true, 1672);
INSERT INTO public.moon VALUES (27, 4, 'Iapetus', 1468.60, true, true, 1671);
INSERT INTO public.moon VALUES (28, 4, 'Dione', 1122.80, true, true, 1684);
INSERT INTO public.moon VALUES (29, 4, 'Tethys', 1062.20, true, true, 1684);
INSERT INTO public.moon VALUES (30, 4, 'Enceladus', 504.20, true, true, 1789);
INSERT INTO public.moon VALUES (31, 4, 'Mimas', 396.40, true, true, 1789);
INSERT INTO public.moon VALUES (32, 1, 'Moon', 3474.80, true, true, -3000);
INSERT INTO public.moon VALUES (33, 2, 'Phobos', 22.20, true, false, 1877);
INSERT INTO public.moon VALUES (34, 2, 'Deimos', 12.40, true, false, 1877);
INSERT INTO public.moon VALUES (35, 9, 'Titania', 1576.80, true, true, 1787);
INSERT INTO public.moon VALUES (36, 9, 'Oberon', 1522.80, true, true, 1787);
INSERT INTO public.moon VALUES (37, 9, 'Umbriel', 1169.40, true, true, 1851);
INSERT INTO public.moon VALUES (38, 9, 'Ariel', 1157.80, true, true, 1851);
INSERT INTO public.moon VALUES (39, 9, 'Miranda', 471.60, true, true, 1948);
INSERT INTO public.moon VALUES (40, 10, 'Triton', 2706.80, true, true, 1846);
INSERT INTO public.moon VALUES (41, 10, 'Proteus', 420.00, true, true, 1989);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'Terrestrial', 1.0000, true, true, 365.25);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 'Terrestrial', 0.1070, true, false, 687.00);
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', 'Gas Giant', 317.8000, true, false, 4332.59);
INSERT INTO public.planet VALUES (4, 1, 'Saturn', 'Gas Giant', 95.1600, true, false, 10759.22);
INSERT INTO public.planet VALUES (5, 3, 'Proxima Centauri b', 'Terrestrial', 1.2700, true, NULL, 11.19);
INSERT INTO public.planet VALUES (6, 6, 'Vega b', 'Gas Giant', 150.0000, true, false, 2.43);
INSERT INTO public.planet VALUES (7, 1, 'Venus', 'Terrestrial', 0.8150, true, false, 224.70);
INSERT INTO public.planet VALUES (8, 1, 'Mercury', 'Terrestrial', 0.0550, false, false, 87.97);
INSERT INTO public.planet VALUES (9, 1, 'Uranus', 'Ice Giant', 14.5400, true, false, 30688.50);
INSERT INTO public.planet VALUES (10, 1, 'Neptune', 'Ice Giant', 17.1500, true, false, 60182.00);
INSERT INTO public.planet VALUES (11, 3, 'Alpha Centauri Bb', 'Super Earth', 1.1300, true, NULL, 3.24);
INSERT INTO public.planet VALUES (12, 6, 'Vega c', 'Ice Giant', 45.0000, true, false, 500.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G2V', 5778, false, true, 1.0000000000);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 'A1V', 9940, false, false, 25.4000000000);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri A', 'G2V', 5790, false, true, 1.5190000000);
INSERT INTO public.star VALUES (4, 2, 'Alpheratz', 'B8IV', 13800, true, false, 200.0000000000);
INSERT INTO public.star VALUES (5, 1, 'Betelgeuse', 'M2Iab', 3500, true, false, 126000.0000000000);
INSERT INTO public.star VALUES (6, 1, 'Vega', 'A0V', 9602, false, true, 40.1200000000);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 41, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_unique UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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

