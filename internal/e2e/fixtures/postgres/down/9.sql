--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.19
-- Dumped by pg_dump version 12.4

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

--
-- Name: e2e_user_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.e2e_user_posts (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    slug character varying(64) NOT NULL,
    content character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.e2e_user_posts OWNER TO postgres;

--
-- Name: e2e_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.e2e_users (
    id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255)
);


ALTER TABLE public.e2e_users OWNER TO postgres;

--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migration (
    version character varying(14) NOT NULL
);


ALTER TABLE public.schema_migration OWNER TO postgres;

--
-- Name: e2e_user_posts e2e_user_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.e2e_user_posts
    ADD CONSTRAINT e2e_user_notes_pkey PRIMARY KEY (id);


--
-- Name: e2e_users e2e_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.e2e_users
    ADD CONSTRAINT e2e_users_pkey PRIMARY KEY (id);


--
-- Name: e2e_user_notes_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX e2e_user_notes_slug_idx ON public.e2e_user_posts USING btree (slug);


--
-- Name: e2e_user_notes_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX e2e_user_notes_user_id_idx ON public.e2e_user_posts USING btree (user_id);


--
-- Name: schema_migration_version_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX schema_migration_version_idx ON public.schema_migration USING btree (version);


--
-- Name: e2e_user_posts e2e_user_notes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.e2e_user_posts
    ADD CONSTRAINT e2e_user_notes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.e2e_users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

