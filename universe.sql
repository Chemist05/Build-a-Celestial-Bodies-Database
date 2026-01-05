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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    hydrogen_mass_fraction numeric(3,2),
    is_spherical boolean,
    has_life boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    hydrogen_mass_fraction numeric(3,2),
    is_spherical boolean,
    has_life boolean,
    description text,
    galaxy_cluster_id integer NOT NULL
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    hydrogen_mass_fraction numeric(3,2),
    is_spherical boolean,
    has_life boolean,
    description text,
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    hydrogen_mass_fraction numeric(3,2),
    is_spherical boolean,
    has_life boolean,
    description text,
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    hydrogen_mass_fraction numeric(3,2),
    is_spherical boolean,
    has_life boolean,
    description text,
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
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, 0.74, true, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, 0.72, true, false, 'Nearest large spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 3000000, 0.73, true, false, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 400, 23000000, 0.71, true, false, 'Interacting galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9000, 29000000, 0.70, true, false, 'Galaxy with a prominent dust ring');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 13000, 53000000, 0.69, true, false, 'Giant elliptical galaxy');


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES ('Local Group', 13000, 0, 0.74, true, false, 'Galaxy group containing the Milky Way', 1);
INSERT INTO public.galaxy_cluster VALUES ('Virgo Cluster', 13000, 65000000, 0.72, true, false, 'Nearest large galaxy cluster', 2);
INSERT INTO public.galaxy_cluster VALUES ('Coma Cluster', 13000, 320000000, 0.70, true, false, 'Rich cluster in the Coma constellation', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (22, 'Moon', 4500, 384, 0.00, true, false, 'Earth''s moon', 3);
INSERT INTO public.moon VALUES (23, 'Phobos', 4500, 228, 0.00, false, false, 'Moon of Mars', 4);
INSERT INTO public.moon VALUES (24, 'Deimos', 4500, 228, 0.00, false, false, 'Moon of Mars', 4);
INSERT INTO public.moon VALUES (25, 'Io', 4500, 778, 0.00, true, false, 'Volcanic moon', 5);
INSERT INTO public.moon VALUES (26, 'Europa', 4500, 778, 0.00, true, false, 'Subsurface ocean', 5);
INSERT INTO public.moon VALUES (27, 'Ganymede', 4500, 778, 0.00, true, false, 'Largest moon', 5);
INSERT INTO public.moon VALUES (28, 'Callisto', 4500, 778, 0.00, true, false, 'Cratered moon', 5);
INSERT INTO public.moon VALUES (29, 'Titan', 4500, 1427, 0.10, true, false, 'Dense atmosphere', 6);
INSERT INTO public.moon VALUES (30, 'Rhea', 4500, 1427, 0.00, true, false, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (31, 'Iapetus', 4500, 1427, 0.00, true, false, 'Two-toned moon', 6);
INSERT INTO public.moon VALUES (32, 'Dione', 4500, 1427, 0.00, true, false, 'Icy surface', 6);
INSERT INTO public.moon VALUES (33, 'Tethys', 4500, 1427, 0.00, true, false, 'Large canyon', 6);
INSERT INTO public.moon VALUES (34, 'Enceladus', 4500, 1427, 0.00, true, false, 'Water geysers', 6);
INSERT INTO public.moon VALUES (35, 'Mimas', 4500, 1427, 0.00, true, false, 'Death Star appearance', 6);
INSERT INTO public.moon VALUES (36, 'Oberon', 4500, 2871, 0.00, true, false, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (37, 'Titania', 4500, 2871, 0.00, true, false, 'Largest Uranus moon', 7);
INSERT INTO public.moon VALUES (38, 'Miranda', 4500, 2871, 0.00, true, false, 'Extreme terrain', 7);
INSERT INTO public.moon VALUES (39, 'Triton', 4500, 4495, 0.00, true, false, 'Retrograde orbit', 8);
INSERT INTO public.moon VALUES (40, 'Nereid', 4500, 4495, 0.00, false, false, 'Eccentric orbit', 8);
INSERT INTO public.moon VALUES (41, 'Charon', 4500, 5900, 0.00, true, false, 'Moon of Pluto', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 58, 0.00, true, false, 'Smallest planet', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 108, 0.00, true, false, 'Very dense atmosphere', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4500, 150, 0.00, true, true, 'Only known planet with life', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, 228, 0.00, true, false, 'The red planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, 778, 0.90, true, false, 'Largest planet', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, 1427, 0.88, true, false, 'Planet with rings', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, 2871, 0.85, true, false, 'Ice giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, 4495, 0.84, true, false, 'Strong winds', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4800, 4, 0.05, true, false, 'Nearby exoplanet', 2);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 4000, 600000, 0.10, true, false, 'Exoplanet', 3);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 5000, 150000, 0.80, true, false, 'Hot Jupiter', 4);
INSERT INTO public.planet VALUES (12, 'Gliese 581 g', 7000, 20, 0.10, true, false, 'Potentially habitable', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 0, 0.74, true, true, 'Central star of our solar system', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4500, 4, 0.75, true, false, 'Closest star to the Sun', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 300, 9, 0.70, true, false, 'Brightest star in the night sky', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 10, 642, 0.68, true, false, 'Red supergiant star', 2);
INSERT INTO public.star VALUES (5, 'Rigel', 8, 860, 0.66, true, false, 'Blue supergiant star', 2);
INSERT INTO public.star VALUES (6, 'Vega', 455, 25, 0.71, true, false, 'Bright star in the Lyra constellation', 3);


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 3, true);


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
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


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

