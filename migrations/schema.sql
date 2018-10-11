--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id uuid NOT NULL,
    traveller_id uuid NOT NULL,
    guide_id uuid NOT NULL,
    status character varying(255) NOT NULL,
    total_price numeric(13,2) NOT NULL,
    extend_price numeric(13,2) NOT NULL,
    meet_dt timestamp without time zone NOT NULL,
    booking_type time without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: guide_freetimes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guide_freetimes (
    id uuid NOT NULL,
    start_dt timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    end_dt timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.guide_freetimes OWNER TO postgres;

--
-- Name: guide_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guide_profiles (
    id uuid NOT NULL,
    base_price numeric(13,2) NOT NULL,
    rank character varying(50) DEFAULT 'BEGINNER'::character varying NOT NULL,
    total_trip integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.guide_profiles OWNER TO postgres;

--
-- Name: mst_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_activities (
    id uuid NOT NULL,
    activity_type character varying(255) NOT NULL
);


ALTER TABLE public.mst_activities OWNER TO postgres;

--
-- Name: mst_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_languages (
    id uuid NOT NULL,
    language character varying(255) NOT NULL
);


ALTER TABLE public.mst_languages OWNER TO postgres;

--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migration (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migration OWNER TO postgres;

--
-- Name: trips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trips (
    id uuid NOT NULL,
    booking_id uuid NOT NULL,
    cancel_by character varying(255) NOT NULL,
    extend_time time without time zone NOT NULL,
    start_dt timestamp without time zone NOT NULL,
    end_dt timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trips OWNER TO postgres;

--
-- Name: user_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_accounts (
    id uuid NOT NULL,
    auth_provider character varying(255) NOT NULL,
    access_token character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    age integer NOT NULL,
    sex character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    description text NOT NULL,
    is_guide boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_accounts OWNER TO postgres;

--
-- Name: user_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_activities (
    id uuid NOT NULL,
    activity_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_activities OWNER TO postgres;

--
-- Name: user_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_languages (
    id uuid NOT NULL,
    language_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_languages OWNER TO postgres;

--
-- Name: user_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_payments (
    id uuid NOT NULL,
    trip_id uuid NOT NULL,
    price numeric(13,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_payments OWNER TO postgres;

--
-- Name: user_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_reviews (
    id uuid NOT NULL,
    reviewer uuid NOT NULL,
    reviewee uuid NOT NULL,
    content text NOT NULL,
    rating character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_reviews OWNER TO postgres;

--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: guide_freetimes guide_freetimes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guide_freetimes
    ADD CONSTRAINT guide_freetimes_pkey PRIMARY KEY (id);


--
-- Name: guide_profiles guide_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guide_profiles
    ADD CONSTRAINT guide_profiles_pkey PRIMARY KEY (id);


--
-- Name: mst_activities mst_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_activities
    ADD CONSTRAINT mst_activities_pkey PRIMARY KEY (id);


--
-- Name: mst_languages mst_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_languages
    ADD CONSTRAINT mst_languages_pkey PRIMARY KEY (id);


--
-- Name: trips trips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (id);


--
-- Name: user_accounts user_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_pkey PRIMARY KEY (id);


--
-- Name: user_activities user_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activities
    ADD CONSTRAINT user_activities_pkey PRIMARY KEY (id);


--
-- Name: user_languages user_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_languages
    ADD CONSTRAINT user_languages_pkey PRIMARY KEY (id);


--
-- Name: user_payments user_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payments
    ADD CONSTRAINT user_payments_pkey PRIMARY KEY (id);


--
-- Name: user_reviews user_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reviews
    ADD CONSTRAINT user_reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migration_version_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX schema_migration_version_idx ON public.schema_migration USING btree (version);


--
-- PostgreSQL database dump complete
--

