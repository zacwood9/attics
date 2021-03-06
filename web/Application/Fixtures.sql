

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.bands DISABLE TRIGGER ALL;

INSERT INTO public.bands (id, collection, name, updated_at, url, logo_url) VALUES ('2ed21249-81a7-4359-badc-0b0b63db8f62', 'DarkStarOrchestra', 'Dark Star Orchestra', '2021-03-23 20:16:45.844206-04', '', '');
INSERT INTO public.bands (id, collection, name, updated_at, url, logo_url) VALUES ('cd6b4911-971a-4fdb-b3cb-07c3c2256f85', 'PhilLeshandFriends', 'Phil Lesh and Friends', '2021-03-23 20:17:12.196115-04', '', '');
INSERT INTO public.bands (id, collection, name, updated_at, url, logo_url) VALUES ('1f746c23-35cd-44ae-9ef8-1b9623c173c5', 'BillyStrings', 'Billy Strings', '2021-03-23 20:45:53.406871-04', '', '');


ALTER TABLE public.bands ENABLE TRIGGER ALL;
