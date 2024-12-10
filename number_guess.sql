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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 3);
INSERT INTO public.games VALUES (2, 1, 2);
INSERT INTO public.games VALUES (3, 1, 6);
INSERT INTO public.games VALUES (4, 1, 5);
INSERT INTO public.games VALUES (5, 1, 1);
INSERT INTO public.games VALUES (6, 1, 6);
INSERT INTO public.games VALUES (7, 35, 4);
INSERT INTO public.games VALUES (8, 36, 594);
INSERT INTO public.games VALUES (9, 36, 450);
INSERT INTO public.games VALUES (10, 37, 624);
INSERT INTO public.games VALUES (11, 37, 411);
INSERT INTO public.games VALUES (12, 36, 62);
INSERT INTO public.games VALUES (13, 36, 674);
INSERT INTO public.games VALUES (14, 36, 998);
INSERT INTO public.games VALUES (15, 33, 4);
INSERT INTO public.games VALUES (16, 33, 3);
INSERT INTO public.games VALUES (17, 33, 2);
INSERT INTO public.games VALUES (18, 38, 830);
INSERT INTO public.games VALUES (19, 38, 61);
INSERT INTO public.games VALUES (20, 39, 480);
INSERT INTO public.games VALUES (21, 39, 354);
INSERT INTO public.games VALUES (22, 38, 409);
INSERT INTO public.games VALUES (23, 38, 606);
INSERT INTO public.games VALUES (24, 38, 463);
INSERT INTO public.games VALUES (25, 40, 161);
INSERT INTO public.games VALUES (26, 40, 492);
INSERT INTO public.games VALUES (27, 41, 713);
INSERT INTO public.games VALUES (28, 41, 471);
INSERT INTO public.games VALUES (29, 40, 30);
INSERT INTO public.games VALUES (30, 40, 788);
INSERT INTO public.games VALUES (31, 40, 126);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'test');
INSERT INTO public.users VALUES (2, 'tekst');
INSERT INTO public.users VALUES (3, 'user_1733493210118');
INSERT INTO public.users VALUES (4, 'user_1733493210117');
INSERT INTO public.users VALUES (5, 'user_1733493241300');
INSERT INTO public.users VALUES (6, 'user_1733493241299');
INSERT INTO public.users VALUES (7, 'user_1733493312057');
INSERT INTO public.users VALUES (8, 'user_1733493312056');
INSERT INTO public.users VALUES (9, 'user_1733493348764');
INSERT INTO public.users VALUES (10, 'user_1733493348763');
INSERT INTO public.users VALUES (11, 'user_1733493487200');
INSERT INTO public.users VALUES (12, 'user_1733493487199');
INSERT INTO public.users VALUES (13, 'user_1733493532163');
INSERT INTO public.users VALUES (14, 'user_1733493532162');
INSERT INTO public.users VALUES (15, 'user_1733493590086');
INSERT INTO public.users VALUES (16, 'user_1733493590085');
INSERT INTO public.users VALUES (17, 'user_1733493682864');
INSERT INTO public.users VALUES (18, 'user_1733493682863');
INSERT INTO public.users VALUES (19, 'user_1733850316265');
INSERT INTO public.users VALUES (20, 'user_1733850316264');
INSERT INTO public.users VALUES (21, '701');
INSERT INTO public.users VALUES (22, 'user_1733850581766');
INSERT INTO public.users VALUES (23, 'user_1733850581766');
INSERT INTO public.users VALUES (24, 'user_1733850581766');
INSERT INTO public.users VALUES (25, 'user_1733850581765');
INSERT INTO public.users VALUES (26, 'user_1733850581765');
INSERT INTO public.users VALUES (27, 'user_1733850581765');
INSERT INTO public.users VALUES (28, 'user_1733850581766');
INSERT INTO public.users VALUES (29, 'user_1733850581766');
INSERT INTO public.users VALUES (30, 'user_1733850581766');
INSERT INTO public.users VALUES (31, 'jessss');
INSERT INTO public.users VALUES (32, 'jes');
INSERT INTO public.users VALUES (33, 'blOb');
INSERT INTO public.users VALUES (34, 'blab');
INSERT INTO public.users VALUES (35, 'blapperdie');
INSERT INTO public.users VALUES (36, 'user_1733852236858');
INSERT INTO public.users VALUES (37, 'user_1733852236857');
INSERT INTO public.users VALUES (38, 'user_1733852526143');
INSERT INTO public.users VALUES (39, 'user_1733852526142');
INSERT INTO public.users VALUES (40, 'user_1733852584130');
INSERT INTO public.users VALUES (41, 'user_1733852584129');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 31, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 41, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

