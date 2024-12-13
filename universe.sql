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
    name character varying(100) NOT NULL,
    description text,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean,
    galaxy_type integer
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
    name character varying(100) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric NOT NULL,
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
    name character varying(100) NOT NULL,
    type character varying(50),
    has_life boolean,
    distance_from_star numeric NOT NULL,
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
-- Name: space_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_event (
    event_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    event_year integer NOT NULL,
    galaxy_id integer,
    planet_id integer,
    space_event_id integer NOT NULL
);


ALTER TABLE public.space_event OWNER TO freecodecamp;

--
-- Name: space_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_event_event_id_seq OWNER TO freecodecamp;

--
-- Name: space_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_event_event_id_seq OWNED BY public.space_event.event_id;


--
-- Name: space_event_space_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_event_space_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_event_space_event_id_seq OWNER TO freecodecamp;

--
-- Name: space_event_space_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_event_space_event_id_seq OWNED BY public.space_event.space_event_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass numeric NOT NULL,
    has_planets boolean,
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
-- Name: space_event event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_event ALTER COLUMN event_id SET DEFAULT nextval('public.space_event_event_id_seq'::regclass);


--
-- Name: space_event space_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_event ALTER COLUMN space_event_id SET DEFAULT nextval('public.space_event_space_event_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 0, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest major galaxy to Milky Way', 2537000, true, 1);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'A member of the Local Group', 3000000, true, 1);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Famous for its interacting nature', 23000000, true, 1);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 163000, false, 2);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Another satellite galaxy of the Milky Way', 20000, false, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 384.4, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 9.4, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 23.4, 4);
INSERT INTO public.moon VALUES (4, 'Io', true, 421.6, 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, 670.9, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 1070.4, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 1882.7, 5);
INSERT INTO public.moon VALUES (8, 'Titan', true, 1221.8, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 238.0, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', true, 185.5, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', true, 527.0, 6);
INSERT INTO public.moon VALUES (12, 'lapetus', true, 3561.3, 6);
INSERT INTO public.moon VALUES (13, 'Triton', true, 354.8, 8);
INSERT INTO public.moon VALUES (14, 'Charon', true, 19.6, 9);
INSERT INTO public.moon VALUES (15, 'Sirius b Moon 1', false, 5.0, 10);
INSERT INTO public.moon VALUES (16, 'Betelgeuse Moon 1', false, 100, 11);
INSERT INTO public.moon VALUES (17, 'Betelgeuse Moon 2', false, 200, 11);
INSERT INTO public.moon VALUES (18, 'Rigel Moon 1', true, 300, 12);
INSERT INTO public.moon VALUES (19, 'Rigel Moon 2', true, 500, 12);
INSERT INTO public.moon VALUES (20, 'Rigel Moon 3', true, 700, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, 57.9, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 108.2, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, 149.6, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 227.9, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 1433.5, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 778.5, 1);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 'Terrestrial', false, 0.05, 2);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri b', 'Terrestrial', false, 0.048, 2);
INSERT INTO public.planet VALUES (9, 'Sirius b Planet 1', 'Gas Giant', false, 0.9, 4);
INSERT INTO public.planet VALUES (10, 'Betelgeuse Planet 1', 'Terrestrial', false, 400, 5);
INSERT INTO public.planet VALUES (11, 'Betelgeuse Planet 2', 'Terrestrial', false, 600, 5);
INSERT INTO public.planet VALUES (12, 'Rigel Planet 1', 'Gas Giant', false, 300, 6);


--
-- Data for Name: space_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_event VALUES (1, 'Supernova SN1987A', 'Bright supernova in the Large Magellanic Cloud', 1987, NULL, NULL, 1);
INSERT INTO public.space_event VALUES (2, 'Milky Way Black Hole Discovery', 'Sagittarius A* identified as a black hole', 2002, 1, NULL, 2);
INSERT INTO public.space_event VALUES (3, 'Mars Rover Landing', 'NASA successfully lands a rover on Mars', 2021, 1, 4, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type Main Sequence', 1.0, true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G-type Main Sequence', 1.1, true, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'K-type Main Sequence', 0.9, true, 2);
INSERT INTO public.star VALUES (4, 'Sirius A', 'A-type Main Sequence', 2.1, false, 3);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red Supergiant', 20.0, false, 4);
INSERT INTO public.star VALUES (6, 'Rigel', 'Blue Supergiant', 21.0, false, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: space_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_event_event_id_seq', 3, true);


--
-- Name: space_event_space_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_event_space_event_id_seq', 3, true);


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
-- Name: space_event space_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_event
    ADD CONSTRAINT space_event_name_key UNIQUE (name);


--
-- Name: space_event space_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_event
    ADD CONSTRAINT space_event_pkey PRIMARY KEY (space_event_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: space_event fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_event
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: space_event fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_event
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

