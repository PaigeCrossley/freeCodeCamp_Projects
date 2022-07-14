--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    orbit_length_in_earth_years numeric(4,1) NOT NULL,
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric(4,2),
    description text,
    year_discovered integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_gal_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_gal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_gal_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_gal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_gal_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric(4,2),
    description text,
    avg_surface_temp_c integer,
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
    age_in_billions_of_years numeric(4,2),
    description text,
    inhabitable boolean,
    has_rings boolean,
    avg_surface_temp_c integer,
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
    age_in_billions_of_years numeric(4,2),
    description text,
    has_rings boolean,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_gal_id_seq'::regclass);


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

INSERT INTO public.comet VALUES (1, 'Halley', 76.0, 1);
INSERT INTO public.comet VALUES (3, 'Giacobini-Zinner', 6.6, 1);
INSERT INTO public.comet VALUES (2, 'Swift-Tuttle', 133.0, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.61, 'Spiral galaxy', 1610);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 10.01, 'Spiral galaxy', 964);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 0.40, 'Spiral galaxy', 1773);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 13.28, 'Bright nucleus, dark ring of dust surrounding and partially obscuring the nucleus', 1779);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 13.25, 'Bright nucleus, unusually large bulge in the center, dark ring of dust surrounding it', 1781);
INSERT INTO public.galaxy VALUES (6, 'Hoag''s Obejct', 12.75, 'Ring galaxy', 1950);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 4.50, 'Grey with many craters', -73, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4.50, 'Irregular shape with many craters, dark brown/gray color', -40, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4.50, 'Irregular shape with many craters, light brown/gray color, the smaller of the two Mars moons', -40, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 4.50, 'Brown with icy looking patches, surface has a scratched appearance', -171, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 4.50, 'Largest moon in the solar system, grey, cratered surface', -163, 5);
INSERT INTO public.moon VALUES (6, 'Io', 4.50, 'Slightly larger than Earth''s moon, gold/green color, dark green spots across the surface', -163, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4.50, 'Second largest Jupiter moon, beautifully colored, covered in craters', -128, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 4.50, 'Second largest moon in the solar system, beautiful smooth yellow/orange color', -180, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4.50, 'Grey, scratched and cratered surface', -198, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 4.50, 'Dark gray, extremely cratered surface', -209, 6);
INSERT INTO public.moon VALUES (11, 'Iapetus', 4.50, 'Light grey with a black patch covering one side, rough surface', -163, 6);
INSERT INTO public.moon VALUES (12, 'Hyperion', 4.50, 'Irregular shape, extremely cratered, brown', -180, 6);
INSERT INTO public.moon VALUES (13, 'Epimetheus', 4.50, 'Irregular shape, cratered surface, gray', -195, 6);
INSERT INTO public.moon VALUES (14, 'Ariel', 4.50, 'Dark gray, surface has a scratched appearance', -213, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 4.50, 'Light gray, surface has an extremely scratched appearance, smallest of the Uranus moons, also the innermost Uranus moon', -213, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 4.50, 'Gray, rough surface', -196, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 4.50, 'Outermost Uranus moon, gray, extremely rough surface', -198, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 4.50, 'Black, covered in craters, has a polar ice cap', -198, 7);
INSERT INTO public.moon VALUES (19, 'Naiad', 4.50, 'Innermost Neptune moon, due to it''s orbit it will eventually crash into Neptune or break up and become a new ring', -222, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 4.50, 'Largest Pluto moon, very large compared to Pluto, dark gray, rough surface', -220, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4.50, 'Closest to the sun, smallest planet, grey', false, false, 167, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.50, 'Light red, striped appearance', false, false, 464, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4.50, 'Green and blue, has polar ice caps, only planet capable of hosting life (that we know of)', true, false, 14, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4.50, 'Deep red, second smallest planet, has polar ice caps', false, false, -60, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4.50, 'Largest planet, brown and white striped appearance', false, true, -127, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4.50, 'Gas giant, has the most prominent rings', false, true, -158, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4.50, 'Blue, looks almost featureless', false, true, -209, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4.50, 'Densest giant planet, blue striped appearance, has visible weather patterns', false, true, -210, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4.50, 'Largest dwarf planet, grey with many surface features', false, false, -229, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 0.24, 'Dwarf planet, between Mars and Jupiter, grey and covered in craters', false, false, -99, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 4.50, 'Second largest dwarf planet', false, false, -231, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 4.50, 'Dwarf planet, red appearance', false, false, -230, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 4.60, 'Giant, orange-red', false, 1);
INSERT INTO public.star VALUES (2, 'Upsilon Andromedae', 3.12, 'Dwarf, yellow-white', false, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 0.01, 'Orange/red, extremely bright', false, 1);
INSERT INTO public.star VALUES (4, 'HR 4796', 0.01, 'Resembles an eye', true, 1);
INSERT INTO public.star VALUES (5, 'LSPM J0207+3331', 3.00, 'Dwarf, white', true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 0.45, 'Blue, extremely bright', false, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_gal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_gal_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: comet comet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name UNIQUE (name);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

