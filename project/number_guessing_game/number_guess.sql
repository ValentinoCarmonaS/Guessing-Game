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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: guess_game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guess_game (
    guess_game_id integer NOT NULL,
    username character varying(22),
    random_number integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.guess_game OWNER TO freecodecamp;

--
-- Name: guess_game_guess_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guess_game_guess_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guess_game_guess_game_id_seq OWNER TO freecodecamp;

--
-- Name: guess_game_guess_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guess_game_guess_game_id_seq OWNED BY public.guess_game.guess_game_id;


--
-- Name: user_guess_game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_guess_game (
    username character varying(22) NOT NULL
);


ALTER TABLE public.user_guess_game OWNER TO freecodecamp;

--
-- Name: guess_game guess_game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_game ALTER COLUMN guess_game_id SET DEFAULT nextval('public.guess_game_guess_game_id_seq'::regclass);


--
-- Data for Name: guess_game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: user_guess_game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Name: guess_game_guess_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guess_game_guess_game_id_seq', 1, false);


--
-- Name: guess_game guess_game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_game
    ADD CONSTRAINT guess_game_pkey PRIMARY KEY (guess_game_id);


--
-- Name: user_guess_game user_guess_game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_guess_game
    ADD CONSTRAINT user_guess_game_pkey PRIMARY KEY (username);


--
-- Name: guess_game guess_game_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_game
    ADD CONSTRAINT guess_game_username_fkey FOREIGN KEY (username) REFERENCES public.user_guess_game(username);


--
-- PostgreSQL database dump complete
--

