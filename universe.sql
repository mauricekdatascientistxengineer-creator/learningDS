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
-- Name: celestial_bodies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.celestial_bodies (
    celestial_bodies_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.celestial_bodies OWNER TO postgres;

--
-- Name: celestial_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.celestial_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_bodies_id_seq OWNER TO postgres;

--
-- Name: celestial_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.celestial_bodies_id_seq OWNED BY public.celestial_bodies.celestial_bodies_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_description text,
    has_life boolean,
    galaxy_type character varying(255) NOT NULL
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
    name character varying(255) NOT NULL,
    moon_description text,
    moon_type boolean,
    is_spherical boolean,
    distance_from_planet integer,
    age_millions_of_years integer,
    rotation integer,
    orbit numeric NOT NULL,
    average_surface_temp numeric,
    planet_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    planet_description text,
    planet_types character varying(255) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth integer,
    age_millions_of_years integer,
    rotation integer,
    orbit_period numeric NOT NULL,
    average_surface_temp numeric,
    star_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    distance_from_earth integer,
    age_millions_of_years integer,
    size character varying(255) NOT NULL,
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
-- Name: celestial_bodies celestial_bodies_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_bodies ALTER COLUMN celestial_bodies_id SET DEFAULT nextval('public.celestial_bodies_id_seq'::regclass);


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
-- Data for Name: celestial_bodies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.celestial_bodies VALUES (1, 'galaxy', 'a massive, gravitationally bound system consisting of stars, stellar remnants, interstellar gas, dust, and dark matter.');
INSERT INTO public.celestial_bodies VALUES (2, 'planet', 'large celestial body that orbits a star, is shaped into a sphere by its own gravity, and has cleared its orbital neighborhood of other debris.');
INSERT INTO public.celestial_bodies VALUES (3, 'star', 'a massive, luminous sphere of plasma held together by its own gravity that generates light and heat through nuclear fusion in its core.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', NULL, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Magellanic', NULL, NULL, 'Dwarf');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', NULL, NULL, 'Giant');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', NULL, NULL, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', NULL, NULL, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', NULL, NULL, NULL, NULL, NULL, NULL, 0.32, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Amalthea', NULL, NULL, NULL, NULL, NULL, NULL, 0.50, NULL, 1);
INSERT INTO public.moon VALUES (3, 'Mimas', NULL, NULL, NULL, NULL, NULL, NULL, 0.94, NULL, 1);
INSERT INTO public.moon VALUES (4, 'Proteus', NULL, NULL, NULL, NULL, NULL, NULL, 1.12, NULL, 1);
INSERT INTO public.moon VALUES (5, 'Deimos', NULL, NULL, NULL, NULL, NULL, NULL, 1.26, NULL, 1);
INSERT INTO public.moon VALUES (6, 'Enceldus', NULL, NULL, NULL, NULL, NULL, NULL, 1.37, NULL, 1);
INSERT INTO public.moon VALUES (7, 'Io', NULL, NULL, NULL, NULL, NULL, NULL, 1.77, NULL, 1);
INSERT INTO public.moon VALUES (8, 'Ariel', NULL, NULL, NULL, NULL, NULL, NULL, 2.52, NULL, 1);
INSERT INTO public.moon VALUES (9, 'Europa', NULL, NULL, NULL, NULL, NULL, NULL, 3.55, NULL, 1);
INSERT INTO public.moon VALUES (10, 'Umbriel', NULL, NULL, NULL, NULL, NULL, NULL, 4.14, NULL, 1);
INSERT INTO public.moon VALUES (11, 'Rhea', NULL, NULL, NULL, NULL, NULL, NULL, 4.52, NULL, 1);
INSERT INTO public.moon VALUES (12, 'Triton', NULL, NULL, NULL, NULL, NULL, NULL, 5.88, NULL, 1);
INSERT INTO public.moon VALUES (13, 'Charon', NULL, NULL, NULL, NULL, NULL, NULL, 6.39, NULL, 1);
INSERT INTO public.moon VALUES (14, 'Ganymede', NULL, NULL, NULL, NULL, NULL, NULL, 7.16, NULL, 1);
INSERT INTO public.moon VALUES (15, 'Titania', NULL, NULL, NULL, NULL, NULL, NULL, 8.71, NULL, 1);
INSERT INTO public.moon VALUES (16, 'Oberon', NULL, NULL, NULL, NULL, NULL, NULL, 13.46, NULL, 1);
INSERT INTO public.moon VALUES (17, 'Titan', NULL, NULL, NULL, NULL, NULL, NULL, 15.95, NULL, 1);
INSERT INTO public.moon VALUES (18, 'Callisto', NULL, NULL, NULL, NULL, NULL, NULL, 16.69, NULL, 1);
INSERT INTO public.moon VALUES (19, 'Iapetus', NULL, NULL, NULL, NULL, NULL, NULL, 79.33, NULL, 1);
INSERT INTO public.moon VALUES (20, 'Themisto', NULL, NULL, NULL, NULL, NULL, NULL, 130, NULL, 1);
INSERT INTO public.moon VALUES (21, 'Nereid', NULL, NULL, NULL, NULL, NULL, NULL, 360.14, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 'Terrestrial', NULL, NULL, NULL, NULL, NULL, 88, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 'Terrestrial', NULL, NULL, NULL, NULL, NULL, 224.7, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, 'Terrestrial', NULL, NULL, NULL, NULL, NULL, 365.25, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 'Terrestrial', NULL, NULL, NULL, NULL, NULL, 687, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Ceres', NULL, 'Dwarf planet', NULL, NULL, NULL, NULL, NULL, 1680, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', NULL, 'Gas Giant', NULL, NULL, NULL, NULL, NULL, 4333, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', NULL, 'Gas Giant', NULL, NULL, NULL, NULL, NULL, 10756, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', NULL, 'Ice Giant', NULL, NULL, NULL, NULL, NULL, 30687, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', NULL, 'Ice Giant', NULL, NULL, NULL, NULL, NULL, 60170, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', NULL, 'Dwarf Planet', NULL, NULL, NULL, NULL, NULL, 90560, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', NULL, 'Dwarf Planet', NULL, NULL, NULL, NULL, NULL, 103410, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', NULL, 'Dwarf Planet', NULL, NULL, NULL, NULL, NULL, 112022, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', NULL, NULL, NULL, '1 Solar Radii', 1);
INSERT INTO public.star VALUES (2, 'Sirius A', NULL, NULL, NULL, '1.7 Solar Radii', 1);
INSERT INTO public.star VALUES (3, 'Pollux', NULL, NULL, NULL, '9 Solar Radii', 1);
INSERT INTO public.star VALUES (4, 'Arcturus', NULL, NULL, NULL, '25 Solar Radii', 1);
INSERT INTO public.star VALUES (5, 'Rigel', NULL, NULL, NULL, '79 Solar Radii', 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', NULL, NULL, NULL, '640-887 Solar Radii', 1);


--
-- Name: celestial_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.celestial_bodies_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: celestial_bodies celestial_bodies_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_id_key UNIQUE (celestial_bodies_id);


--
-- Name: celestial_bodies celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_pkey PRIMARY KEY (celestial_bodies_id);


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
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


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

