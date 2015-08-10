--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_advertises; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_advertises (
    id integer NOT NULL,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    status boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    link character varying(255),
    key character varying(255) DEFAULT 'lock'::character varying
);


ALTER TABLE public.admin_advertises OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_advertises_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_advertises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_advertises_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_advertises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_advertises_id_seq OWNED BY admin_advertises.id;


--
-- Name: admin_categories; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_categories OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_categories_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_categories_id_seq OWNED BY admin_categories.id;


--
-- Name: admin_company_profiles; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_company_profiles (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    vission character varying(255),
    mission character varying(255),
    motto character varying(255),
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    phone character varying(255)
);


ALTER TABLE public.admin_company_profiles OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_company_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_company_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_company_profiles_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_company_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_company_profiles_id_seq OWNED BY admin_company_profiles.id;


--
-- Name: admin_contact_companies; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_contact_companies (
    id integer NOT NULL,
    admin_id integer,
    name character varying(255),
    email character varying(255),
    body character varying(255),
    profile character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_contact_companies OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_contact_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_contact_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_contact_companies_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_contact_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_contact_companies_id_seq OWNED BY admin_contact_companies.id;


--
-- Name: admin_contacts; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_contacts (
    id integer NOT NULL,
    admin_id integer,
    name character varying(255),
    email character varying(255),
    body text,
    profile character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    read_status boolean DEFAULT false
);


ALTER TABLE public.admin_contacts OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_contacts_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_contacts_id_seq OWNED BY admin_contacts.id;


--
-- Name: admin_galleries; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_galleries (
    id integer NOT NULL,
    title character varying(255),
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    group_id integer,
    gallery_group_id integer,
    content text
);


ALTER TABLE public.admin_galleries OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_galleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_galleries_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_galleries_id_seq OWNED BY admin_galleries.id;


--
-- Name: admin_gallery_comment_replies; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_gallery_comment_replies (
    id integer NOT NULL,
    gallery_comment_id integer,
    content character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_gallery_comment_replies OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_gallery_comment_replies_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_gallery_comment_replies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_gallery_comment_replies_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_gallery_comment_replies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_gallery_comment_replies_id_seq OWNED BY admin_gallery_comment_replies.id;


--
-- Name: admin_gallery_comments; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_gallery_comments (
    id integer NOT NULL,
    gallery_id integer,
    name character varying(255),
    email character varying(255),
    body character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_gallery_comments OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_gallery_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_gallery_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_gallery_comments_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_gallery_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_gallery_comments_id_seq OWNED BY admin_gallery_comments.id;


--
-- Name: admin_gallery_groups; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_gallery_groups (
    id integer NOT NULL,
    name character varying(255),
    sub_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_gallery_groups OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_gallery_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_gallery_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_gallery_groups_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_gallery_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_gallery_groups_id_seq OWNED BY admin_gallery_groups.id;


--
-- Name: admin_help_files; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_help_files (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    help_id integer,
    document_file_name character varying(255),
    document_content_type character varying(255),
    document_file_size integer,
    document_updated_at timestamp without time zone
);


ALTER TABLE public.admin_help_files OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_help_files_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_help_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_help_files_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_help_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_help_files_id_seq OWNED BY admin_help_files.id;


--
-- Name: admin_helps; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_helps (
    id integer NOT NULL,
    full_name character varying(255),
    e_mail character varying(255),
    help text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_helps OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_helps_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_helps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_helps_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_helps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_helps_id_seq OWNED BY admin_helps.id;


--
-- Name: admin_jornal_team_designers; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_jornal_team_designers (
    id integer NOT NULL,
    journal_id integer,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_jornal_team_designers OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_jornal_team_designers_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_jornal_team_designers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_jornal_team_designers_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_jornal_team_designers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_jornal_team_designers_id_seq OWNED BY admin_jornal_team_designers.id;


--
-- Name: admin_journal_issue_asignees; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_journal_issue_asignees (
    id integer NOT NULL,
    journal_issue_id integer,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_journal_issue_asignees OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_asignees_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_journal_issue_asignees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_journal_issue_asignees_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_asignees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_journal_issue_asignees_id_seq OWNED BY admin_journal_issue_asignees.id;


--
-- Name: admin_journal_issue_comment_files; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_journal_issue_comment_files (
    id integer NOT NULL,
    comment_document_file_name character varying(255),
    comment_document_content_type character varying(255),
    comment_document_file_size integer,
    comment_document_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    journal_issue_comment_id integer
);


ALTER TABLE public.admin_journal_issue_comment_files OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_comment_files_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_journal_issue_comment_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_journal_issue_comment_files_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_comment_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_journal_issue_comment_files_id_seq OWNED BY admin_journal_issue_comment_files.id;


--
-- Name: admin_journal_issue_comments; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_journal_issue_comments (
    id integer NOT NULL,
    journal_issue_id integer,
    admin_id integer,
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_journal_issue_comments OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_journal_issue_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_journal_issue_comments_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_journal_issue_comments_id_seq OWNED BY admin_journal_issue_comments.id;


--
-- Name: admin_journal_issue_files; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_journal_issue_files (
    id integer NOT NULL,
    journal_issue_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    document_file_name character varying(255),
    document_content_type character varying(255),
    document_file_size integer,
    document_updated_at timestamp without time zone
);


ALTER TABLE public.admin_journal_issue_files OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_files_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_journal_issue_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_journal_issue_files_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_journal_issue_files_id_seq OWNED BY admin_journal_issue_files.id;


--
-- Name: admin_journal_issue_images; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_journal_issue_images (
    id integer NOT NULL,
    journal_issue_id integer,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_journal_issue_images OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_images_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_journal_issue_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_journal_issue_images_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issue_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_journal_issue_images_id_seq OWNED BY admin_journal_issue_images.id;


--
-- Name: admin_journal_issues; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_journal_issues (
    id integer NOT NULL,
    journal_id integer,
    status_id integer,
    no character varying(255),
    title character varying(255),
    start date,
    "end" date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type_id integer,
    priority integer,
    progress character varying(255),
    content text,
    asignee integer
);


ALTER TABLE public.admin_journal_issues OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_journal_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_journal_issues_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_journal_issues_id_seq OWNED BY admin_journal_issues.id;


--
-- Name: admin_journal_team_checks; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_journal_team_checks (
    id integer NOT NULL,
    journal_id integer,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_journal_team_checks OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_team_checks_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_journal_team_checks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_journal_team_checks_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_team_checks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_journal_team_checks_id_seq OWNED BY admin_journal_team_checks.id;


--
-- Name: admin_journal_team_developers; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_journal_team_developers (
    id integer NOT NULL,
    journal_id integer,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_journal_team_developers OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_team_developers_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_journal_team_developers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_journal_team_developers_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journal_team_developers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_journal_team_developers_id_seq OWNED BY admin_journal_team_developers.id;


--
-- Name: admin_journals; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_journals (
    id integer NOT NULL,
    title character varying(255),
    start date,
    "end" date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    project_manajer character varying(255),
    admin_id integer,
    status_id integer
);


ALTER TABLE public.admin_journals OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_journals_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_journals_id_seq OWNED BY admin_journals.id;


--
-- Name: admin_profile_hobbies; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_profile_hobbies (
    id integer NOT NULL,
    name character varying(255),
    profile_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_profile_hobbies OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_profile_hobbies_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_profile_hobbies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_profile_hobbies_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_profile_hobbies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_profile_hobbies_id_seq OWNED BY admin_profile_hobbies.id;


--
-- Name: admin_profile_skills; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_profile_skills (
    id integer NOT NULL,
    name character varying(255),
    skill integer,
    profile_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    icon_file_name character varying(255),
    icon_content_type character varying(255),
    icon_file_size integer,
    icon_updated_at timestamp without time zone
);


ALTER TABLE public.admin_profile_skills OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_profile_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_profile_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_profile_skills_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_profile_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_profile_skills_id_seq OWNED BY admin_profile_skills.id;


--
-- Name: admin_profiles; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_profiles (
    id integer NOT NULL,
    name character varying(255),
    last_name character varying(255),
    facebook character varying(255),
    e_mail character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    motto text,
    describe_me text,
    skype character varying(255),
    birthday date,
    admin_id integer
);


ALTER TABLE public.admin_profiles OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_profiles_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_profiles_id_seq OWNED BY admin_profiles.id;


--
-- Name: admin_reply_contact_companies; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_reply_contact_companies (
    id integer NOT NULL,
    body character varying(255),
    contact_company_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_reply_contact_companies OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_reply_contact_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_reply_contact_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_reply_contact_companies_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_reply_contact_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_reply_contact_companies_id_seq OWNED BY admin_reply_contact_companies.id;


--
-- Name: admin_reply_contacts; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_reply_contacts (
    id integer NOT NULL,
    body character varying(255),
    contact_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_reply_contacts OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_reply_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_reply_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_reply_contacts_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_reply_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_reply_contacts_id_seq OWNED BY admin_reply_contacts.id;


--
-- Name: admin_status_journals; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_status_journals (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_status_journals OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_status_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_status_journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_status_journals_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_status_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_status_journals_id_seq OWNED BY admin_status_journals.id;


--
-- Name: admin_sub_categories; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_sub_categories (
    id integer NOT NULL,
    name character varying(255),
    category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_sub_categories OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_sub_categories_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_sub_categories_id_seq OWNED BY admin_sub_categories.id;


--
-- Name: admin_type_journals; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admin_type_journals (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admin_type_journals OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_type_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admin_type_journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_type_journals_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admin_type_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admin_type_journals_id_seq OWNED BY admin_type_journals.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admins OWNER TO xgcdrmfhremvhq;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    title character varying(255),
    body text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    category_id integer,
    sub_category_id integer
);


ALTER TABLE public.articles OWNER TO xgcdrmfhremvhq;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: dashboard_comments; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE dashboard_comments (
    id integer NOT NULL,
    article_id integer,
    name character varying(255),
    email character varying(255),
    body text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    profile character varying(255)
);


ALTER TABLE public.dashboard_comments OWNER TO xgcdrmfhremvhq;

--
-- Name: dashboard_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE dashboard_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_comments_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: dashboard_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE dashboard_comments_id_seq OWNED BY dashboard_comments.id;


--
-- Name: dashboard_reply_comments; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE dashboard_reply_comments (
    id integer NOT NULL,
    body character varying(255),
    comment_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.dashboard_reply_comments OWNER TO xgcdrmfhremvhq;

--
-- Name: dashboard_reply_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE dashboard_reply_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_reply_comments_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: dashboard_reply_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE dashboard_reply_comments_id_seq OWNED BY dashboard_reply_comments.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying(255),
    queue character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.delayed_jobs OWNER TO xgcdrmfhremvhq;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delayed_jobs_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE delayed_jobs_id_seq OWNED BY delayed_jobs.id;


--
-- Name: rand_clouds; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE rand_clouds (
    id integer NOT NULL,
    types character varying(255),
    type_id integer,
    rand character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rand_clouds OWNER TO xgcdrmfhremvhq;

--
-- Name: rand_clouds_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE rand_clouds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rand_clouds_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: rand_clouds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE rand_clouds_id_seq OWNED BY rand_clouds.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO xgcdrmfhremvhq;

--
-- Name: temps; Type: TABLE; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE TABLE temps (
    id integer NOT NULL,
    source_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.temps OWNER TO xgcdrmfhremvhq;

--
-- Name: temps_id_seq; Type: SEQUENCE; Schema: public; Owner: xgcdrmfhremvhq
--

CREATE SEQUENCE temps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temps_id_seq OWNER TO xgcdrmfhremvhq;

--
-- Name: temps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER SEQUENCE temps_id_seq OWNED BY temps.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_advertises ALTER COLUMN id SET DEFAULT nextval('admin_advertises_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_categories ALTER COLUMN id SET DEFAULT nextval('admin_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_company_profiles ALTER COLUMN id SET DEFAULT nextval('admin_company_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_contact_companies ALTER COLUMN id SET DEFAULT nextval('admin_contact_companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_contacts ALTER COLUMN id SET DEFAULT nextval('admin_contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_galleries ALTER COLUMN id SET DEFAULT nextval('admin_galleries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_gallery_comment_replies ALTER COLUMN id SET DEFAULT nextval('admin_gallery_comment_replies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_gallery_comments ALTER COLUMN id SET DEFAULT nextval('admin_gallery_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_gallery_groups ALTER COLUMN id SET DEFAULT nextval('admin_gallery_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_help_files ALTER COLUMN id SET DEFAULT nextval('admin_help_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_helps ALTER COLUMN id SET DEFAULT nextval('admin_helps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_jornal_team_designers ALTER COLUMN id SET DEFAULT nextval('admin_jornal_team_designers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_journal_issue_asignees ALTER COLUMN id SET DEFAULT nextval('admin_journal_issue_asignees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_journal_issue_comment_files ALTER COLUMN id SET DEFAULT nextval('admin_journal_issue_comment_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_journal_issue_comments ALTER COLUMN id SET DEFAULT nextval('admin_journal_issue_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_journal_issue_files ALTER COLUMN id SET DEFAULT nextval('admin_journal_issue_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_journal_issue_images ALTER COLUMN id SET DEFAULT nextval('admin_journal_issue_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_journal_issues ALTER COLUMN id SET DEFAULT nextval('admin_journal_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_journal_team_checks ALTER COLUMN id SET DEFAULT nextval('admin_journal_team_checks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_journal_team_developers ALTER COLUMN id SET DEFAULT nextval('admin_journal_team_developers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_journals ALTER COLUMN id SET DEFAULT nextval('admin_journals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_profile_hobbies ALTER COLUMN id SET DEFAULT nextval('admin_profile_hobbies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_profile_skills ALTER COLUMN id SET DEFAULT nextval('admin_profile_skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_profiles ALTER COLUMN id SET DEFAULT nextval('admin_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_reply_contact_companies ALTER COLUMN id SET DEFAULT nextval('admin_reply_contact_companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_reply_contacts ALTER COLUMN id SET DEFAULT nextval('admin_reply_contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_status_journals ALTER COLUMN id SET DEFAULT nextval('admin_status_journals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_sub_categories ALTER COLUMN id SET DEFAULT nextval('admin_sub_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admin_type_journals ALTER COLUMN id SET DEFAULT nextval('admin_type_journals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY dashboard_comments ALTER COLUMN id SET DEFAULT nextval('dashboard_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY dashboard_reply_comments ALTER COLUMN id SET DEFAULT nextval('dashboard_reply_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY delayed_jobs ALTER COLUMN id SET DEFAULT nextval('delayed_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY rand_clouds ALTER COLUMN id SET DEFAULT nextval('rand_clouds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xgcdrmfhremvhq
--

ALTER TABLE ONLY temps ALTER COLUMN id SET DEFAULT nextval('temps_id_seq'::regclass);


--
-- Data for Name: admin_advertises; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_advertises (id, image_file_name, image_content_type, image_file_size, image_updated_at, status, created_at, updated_at, link, key) FROM stdin;
\.


--
-- Name: admin_advertises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_advertises_id_seq', 1, false);


--
-- Data for Name: admin_categories; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_categories (id, name, created_at, updated_at) FROM stdin;
2	Film	2015-01-02 01:30:03.096476	2015-01-02 01:30:03.096476
3	SampulKreativ	2015-01-05 03:51:23.30806	2015-01-05 03:51:23.30806
\.


--
-- Name: admin_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_categories_id_seq', 3, true);


--
-- Data for Name: admin_company_profiles; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_company_profiles (id, name, address, vission, mission, motto, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, created_at, updated_at, phone) FROM stdin;
1	Sampulkreativ	<p>not yet</p>\r\n	<p>Menjadi perusahaan IT no 1 di Indonesia</p>\r\n	<p>Memberikan pelayanan terbaik untuk memuaskan Pelanggan</p>\r\n	We have All for Creative Future	1618619_407409126080267_4890459421677415385_n.jpg	image/jpeg	13288	2015-01-07 06:34:06.915343	2014-12-16 04:37:10.636684	2015-01-07 06:34:06.923356	\N
\.


--
-- Name: admin_company_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_company_profiles_id_seq', 1, true);


--
-- Data for Name: admin_contact_companies; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_contact_companies (id, admin_id, name, email, body, profile, created_at, updated_at) FROM stdin;
\.


--
-- Name: admin_contact_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_contact_companies_id_seq', 1, false);


--
-- Data for Name: admin_contacts; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_contacts (id, admin_id, name, email, body, profile, created_at, updated_at, read_status) FROM stdin;
1	2	Hasan Al Farisi	hasan.farisi47@gmail.com	Mana foto orangnya?		2014-12-16 05:28:10.121787	2014-12-16 05:32:20.032214	t
9	6	Hasan Al Farisi	hasan.farisi47@gmail.com	Terima Kasih banyak Yan :D		2015-01-01 12:43:24.251657	2015-01-01 12:43:24.251657	f
6	3	Hasan Al Farisi	hasan.farisi47@gmail.com	Terima kasih Ras :D		2014-12-22 10:01:48.196384	2015-01-04 07:53:22.721536	t
11	8	Hasan Al Farisi	hasan.farisi47@gmail.com	Indra tolong update fotonya ya.		2015-01-04 16:32:11.795226	2015-01-04 16:32:11.795226	f
13	2	Hasan Al Farisi	hasan.farisi47@gmail.com	Luck tolong Upload fotonya lagi ya		2015-01-04 16:34:14.222858	2015-01-04 16:34:14.222858	f
16	6	Hasan Al Farisi	hasan.farisi47@gmail.com	Yan tolong update fotonya ya.		2015-01-04 16:36:14.945841	2015-01-04 16:36:14.945841	f
14	4	Hasan Al Farisi	hasan.farisi47@gmail.com	Ki tolong Update fotonya lagi ya biar enak ngeliat profilenya.		2015-01-04 16:34:49.646686	2015-01-05 02:17:41.320824	t
15	5	Hasan Al Farisi	hasan.farisi47@gmail.com	Yud tolong Update foto profilenya ya, biar enak kita ngeliat profilenya.		2015-01-04 16:35:46.191179	2015-01-05 02:56:03.155856	t
12	3	Hasan Al Farisi	hasan.farisi47@gmail.com	Iya firas, sekarang Upload sudah bisa Upload foto, dan tolonf di Upload juga foto profilenya ya.		2015-01-04 16:33:33.600144	2015-01-05 03:38:46.233688	t
10	7	Hasan Al Farisi	hasan.farisi47@gmail.com	Yud, tolong update fotonya ya.		2015-01-04 16:31:38.644717	2015-01-06 00:51:37.835734	t
\.


--
-- Name: admin_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_contacts_id_seq', 18, true);


--
-- Data for Name: admin_galleries; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_galleries (id, title, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, created_at, updated_at, group_id, gallery_group_id, content) FROM stdin;
\.


--
-- Name: admin_galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_galleries_id_seq', 8, true);


--
-- Data for Name: admin_gallery_comment_replies; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_gallery_comment_replies (id, gallery_comment_id, content, created_at, updated_at) FROM stdin;
\.


--
-- Name: admin_gallery_comment_replies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_gallery_comment_replies_id_seq', 1, false);


--
-- Data for Name: admin_gallery_comments; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_gallery_comments (id, gallery_id, name, email, body, created_at, updated_at) FROM stdin;
\.


--
-- Name: admin_gallery_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_gallery_comments_id_seq', 1, false);


--
-- Data for Name: admin_gallery_groups; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_gallery_groups (id, name, sub_name, created_at, updated_at) FROM stdin;
\.


--
-- Name: admin_gallery_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_gallery_groups_id_seq', 2, true);


--
-- Data for Name: admin_help_files; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_help_files (id, created_at, updated_at, help_id, document_file_name, document_content_type, document_file_size, document_updated_at) FROM stdin;
\.


--
-- Name: admin_help_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_help_files_id_seq', 2, true);


--
-- Data for Name: admin_helps; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_helps (id, full_name, e_mail, help, created_at, updated_at) FROM stdin;
\.


--
-- Name: admin_helps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_helps_id_seq', 1, true);


--
-- Data for Name: admin_jornal_team_designers; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_jornal_team_designers (id, journal_id, admin_id, created_at, updated_at) FROM stdin;
3	3	1	2014-12-30 07:37:15.265404	2014-12-30 07:37:15.265404
4	4	1	2015-01-02 04:36:20.379939	2015-01-02 04:36:20.379939
\.


--
-- Name: admin_jornal_team_designers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_jornal_team_designers_id_seq', 4, true);


--
-- Data for Name: admin_journal_issue_asignees; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_journal_issue_asignees (id, journal_issue_id, admin_id, created_at, updated_at) FROM stdin;
2	2	5	2014-12-30 10:10:18.378167	2014-12-31 06:03:26.565267
1	1	5	2014-12-30 09:57:50.756171	2014-12-31 06:03:51.617349
9	9	5	2015-01-01 12:54:37.117373	2015-01-02 04:02:53.331493
5	5	5	2014-12-31 16:36:52.327602	2015-01-02 04:26:23.816721
6	6	1	2015-01-01 01:35:07.429714	2015-01-02 04:26:36.819278
15	15	3	2015-01-03 08:17:51.790225	2015-01-03 08:17:51.790225
16	16	\N	2015-01-05 03:40:18.279176	2015-01-05 03:40:40.036289
17	17	3	2015-01-06 07:52:57.416061	2015-01-06 13:46:02.534895
8	8	3	2015-01-01 02:19:08.419954	2015-01-06 13:47:13.183043
14	14	3	2015-01-02 17:32:23.251101	2015-01-06 13:48:01.737998
12	12	\N	2015-01-02 17:18:01.248967	2015-01-06 22:29:22.29792
18	18	\N	2015-01-07 02:55:57.041886	2015-01-07 02:55:57.041886
20	20	\N	2015-01-07 03:47:47.557239	2015-01-07 14:07:32.47184
23	23	\N	2015-01-09 10:04:05.634158	2015-01-09 10:04:05.634158
21	21	5	2015-01-07 04:07:31.72328	2015-01-12 12:07:35.975431
22	22	\N	2015-01-07 15:47:53.899506	2015-01-12 21:51:05.512825
24	24	\N	2015-01-12 22:01:31.534835	2015-01-12 22:01:31.534835
25	25	\N	2015-01-15 09:23:32.705288	2015-01-15 09:23:32.705288
26	26	\N	2015-01-17 14:45:58.123239	2015-01-17 14:45:58.123239
27	27	\N	2015-01-22 22:50:34.835477	2015-01-22 22:50:34.835477
28	28	\N	2015-01-22 23:31:00.980683	2015-01-22 23:31:00.980683
\.


--
-- Name: admin_journal_issue_asignees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_journal_issue_asignees_id_seq', 28, true);


--
-- Data for Name: admin_journal_issue_comment_files; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_journal_issue_comment_files (id, comment_document_file_name, comment_document_content_type, comment_document_file_size, comment_document_updated_at, created_at, updated_at, journal_issue_comment_id) FROM stdin;
1	_00006.txt	text/plain	570	2015-01-02 03:36:22.001917	2015-01-02 03:36:22.004717	2015-01-02 03:36:22.004717	5
2	root.php	application/octet-stream	8539	2015-01-02 03:36:22.017897	2015-01-02 03:36:22.018937	2015-01-02 03:36:22.018937	5
3	usercontroller.php	application/octet-stream	461	2015-01-02 03:37:13.815554	2015-01-02 03:37:13.81695	2015-01-02 03:37:13.81695	6
4	redkerjadb.sql	application/octet-stream	10604	2015-01-05 03:44:18.154166	2015-01-05 03:44:18.158739	2015-01-05 03:44:18.158739	11
5	redkerjadb.sql	text/x-sql	21677	2015-01-11 02:55:01.773132	2015-01-11 02:55:01.775843	2015-01-11 02:55:01.775843	26
\.


--
-- Name: admin_journal_issue_comment_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_journal_issue_comment_files_id_seq', 5, true);


--
-- Data for Name: admin_journal_issue_comments; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_journal_issue_comments (id, journal_issue_id, admin_id, content, created_at, updated_at) FROM stdin;
1	1	4	Yang ini mah sudah san	2014-12-31 07:42:21.541305	2014-12-31 07:42:21.541305
2	2	1	Firas mohon diperhatikan Deadline dari Journal ini.	2014-12-31 15:50:23.880311	2014-12-31 15:50:23.880311
3	2	1	Firas mohon diperhatikan Deadline dari Journal ini.	2014-12-31 15:51:09.654222	2014-12-31 15:51:09.654222
4	2	1	Tutorial Singkat GIT SSH:\r\n1. Buka Directory file yang akan dijadikan Repository local (Bebas)\r\n2. Click kanan kemudian pilih GIT Bash.\r\n3. Saat Command Promt muncul, ketikan perintah berikut:\r\n    a. ssh-keygen -t rsa\r\n    b. kemudian tekan Enter dan jangan masukan Inputan apapun sampai selesai.\r\n    c. Jika sudah selesai, masukan perintah berikut, cat ~/.ssh/id_rsa.pub\r\n    d. Saat perintah itu dijalankan, maka akan muncul kumpulan Code, yang dimana Code itu adalah GIT SSH.\r\n    e. Copy kumpulan code itu dari command promt dan e-mailkan kepada PM RedKerja	2015-01-01 01:22:13.351838	2015-01-01 01:22:13.351838
5	9	4	Baru masukin HTMLnya , lagi ngedit CSS biar bisa responsive.\r\n\r\nMohon di Baca file txt nya ya	2015-01-02 03:36:21.981211	2015-01-02 03:36:21.981211
6	9	4	ini file user controllernya	2015-01-02 03:37:13.810824	2015-01-02 03:37:13.810824
7	9	1	Ok ki nanti klo Udah Feedback 100% aku Deploy ke Heroku, silahkan saja selesaikan dulu.	2015-01-02 04:01:13.627195	2015-01-02 04:01:13.627195
8	9	1	Ki kalau masih In Progress ngak di perlu di Assign ke Aku, nanti aja klo udah feedback ya.	2015-01-02 04:45:55.192196	2015-01-02 04:45:55.192196
9	9	4	okeeey san	2015-01-02 06:19:28.828173	2015-01-02 06:19:28.828173
10	12	1	Firas sekiranya Journal masih dalam status InProgress tidak perlu di Assign ke saya, nanti saja setelah selesai baru Update Statusnya menjadi Feedback to PM.\r\n\r\nnb: Mohon A.S.A.P	2015-01-04 16:11:19.581054	2015-01-04 16:11:19.581054
11	14	3	san untuk database red kerja saya upload disini ya	2015-01-05 03:44:18.034684	2015-01-05 03:44:18.034684
12	12	1	Firas File DB nya di upload di comment ini aja ya. A.S.A.P	2015-01-05 03:44:37.94553	2015-01-05 03:44:37.94553
13	12	4	Firas : rada di perquick upload databasenya he he he :D	2015-01-05 14:46:17.228709	2015-01-05 14:46:17.228709
14	14	4	TInggal menunggu database	2015-01-05 14:46:36.415717	2015-01-05 14:46:36.415717
15	15	4	ini sudah diterapkan di CI , tinggal responsivenya :D	2015-01-05 14:47:16.365119	2015-01-05 14:47:16.365119
16	15	4	ini sudah diterapkan di CI , tinggal responsivenya :D	2015-01-05 14:47:21.988009	2015-01-05 14:47:21.988009
17	15	4	ini sudah diterapkan di CI , tinggal responsivenya :D	2015-01-05 14:47:25.820921	2015-01-05 14:47:25.820921
18	14	4	gak bisa di download ras :D	2015-01-05 14:47:56.536717	2015-01-05 14:47:56.536717
19	17	4	dalam proses	2015-01-06 10:25:33.874366	2015-01-06 10:25:33.874366
20	17	1	Ki seharusnya saat User Click login maka dia langsung mengarah ke halaman Dashboard, begitupun saat Register, saat click register maka User akan diarahkan ke halaman Register.\r\nkalau yang sekarang nemu message "No input file specified."	2015-01-06 23:40:51.734019	2015-01-06 23:40:51.734019
21	17	4	udah aku benerin san bugnya , mangga dicoba lagi :D	2015-01-07 01:13:56.584706	2015-01-07 01:13:56.584706
22	8	1	Ki untuk yang ini di feedback ke aku pas udah sama fungsi login ke Database ya.	2015-01-07 02:07:58.397807	2015-01-07 02:07:58.397807
23	14	1	Ki tolong tiket ini dikerjakan saat Registrasi sudah berhasil masuk ke Database ya.	2015-01-07 02:10:24.102032	2015-01-07 02:10:24.102032
24	20	9	Gak usah ambil data san. Nanti klo mau nampilin kategori, kota, dkk. Tinggal inner join aja.	2015-01-10 11:11:00.050179	2015-01-10 11:11:00.050179
25	20	9	Gak usah ambil data san. Nanti klo mau nampilin kategori, kota, dkk. Tinggal inner join aja.	2015-01-10 11:11:08.663733	2015-01-10 11:11:08.663733
26	22	3		2015-01-11 02:55:01.750835	2015-01-11 02:55:01.750835
27	9	4	Sudah OK	2015-01-12 03:39:54.747735	2015-01-12 03:39:54.747735
28	14	4	oke san	2015-01-12 03:40:54.782192	2015-01-12 03:40:54.782192
29	8	4	siap :D	2015-01-12 03:41:48.000389	2015-01-12 03:41:48.000389
30	21	4	sudah diupgrade	2015-01-12 12:07:33.812414	2015-01-12 12:07:33.812414
31	14	4	udah masuk database	2015-01-12 13:50:35.824311	2015-01-12 13:50:35.824311
32	14	4	beres san	2015-01-12 14:08:42.16666	2015-01-12 14:08:42.16666
33	20	1	Jan saat user tidak mengisi form yang tersedia tampilkan error message seperti pada form student ya. Gambar saya sertakan diatas. lalu saat saya click tombol Register kok tidak terjadi apa-apa malah terdapat error pas saya inspact element di chrome, gambar saya sertakan diatas	2015-01-14 13:05:29.688416	2015-01-14 13:05:29.688416
34	14	1	Belum ki, message errornya belum di tampilkan	2015-01-14 13:22:19.405791	2015-01-14 13:22:19.405791
35	14	4	udah aku edit, coba di cek\r\n	2015-01-14 14:47:15.52517	2015-01-14 14:47:15.52517
36	14	1	ok Nuhun nanti aku cek nuhun	2015-01-15 08:15:25.878282	2015-01-15 08:15:25.878282
37	14	1		2015-01-15 12:16:15.778483	2015-01-15 12:16:15.778483
38	8	1	Ki Journal ini belum dikerjain lagi ya?	2015-01-17 04:05:02.144855	2015-01-17 04:05:02.144855
39	18	4	tinggal upload file	2015-01-26 16:30:42.784011	2015-01-26 16:30:42.784011
40	18	4	tingal upload document	2015-01-29 04:19:05.575378	2015-01-29 04:19:05.575378
\.


--
-- Name: admin_journal_issue_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_journal_issue_comments_id_seq', 40, true);


--
-- Data for Name: admin_journal_issue_files; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_journal_issue_files (id, journal_issue_id, created_at, updated_at, document_file_name, document_content_type, document_file_size, document_updated_at) FROM stdin;
3	2	2014-12-31 06:03:26.580352	2014-12-31 06:03:26.580352	GITRepositorytutorial.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	10912	2014-12-31 06:03:26.57776
4	1	2014-12-31 06:03:51.639501	2014-12-31 06:03:51.639501	GITRepositorytutorial.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	10912	2014-12-31 06:03:51.638404
5	9	2015-01-01 12:54:37.153692	2015-01-01 12:54:37.153692	Home.rar	application/octet-stream	1913149	2015-01-01 12:54:37.149792
6	15	2015-01-03 08:17:51.821445	2015-01-03 08:17:51.821445	Home_Register.rar	application/octet-stream	1917190	2015-01-03 08:17:51.816841
10	21	2015-01-07 04:07:31.745788	2015-01-07 04:07:31.745788	redkerja.sql	application/sql	10650	2015-01-07 04:07:31.744509
11	27	2015-01-22 22:50:34.858713	2015-01-22 22:50:34.858713	redkerja_(1).sql	application/octet-stream	29692	2015-01-22 22:50:34.856457
12	27	2015-01-22 23:19:32.134883	2015-01-22 23:19:32.134883	redkerja.sql	application/octet-stream	29155	2015-01-22 23:19:32.128344
13	27	2015-01-22 23:19:48.411453	2015-01-22 23:19:48.411453	redkerja.sql	application/octet-stream	29155	2015-01-22 23:19:48.403198
14	27	2015-01-22 23:19:54.134864	2015-01-22 23:19:54.134864	redkerja.sql	application/octet-stream	29155	2015-01-22 23:19:54.132208
15	28	2015-01-22 23:31:00.998526	2015-01-22 23:31:00.998526	12_redkerja.sql	application/octet-stream	29155	2015-01-22 23:31:00.996852
\.


--
-- Name: admin_journal_issue_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_journal_issue_files_id_seq', 15, true);


--
-- Data for Name: admin_journal_issue_images; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_journal_issue_images (id, journal_issue_id, image_file_name, image_content_type, image_file_size, image_updated_at, created_at, updated_at) FROM stdin;
1	8	mockup.png	image/png	9597	2015-01-01 02:19:08.438108	2015-01-01 02:19:08.440828	2015-01-01 02:19:08.440828
9	12	RedKerja_databases_phase_1.png	image/png	99120	2015-01-04 16:09:54.241426	2015-01-04 16:09:54.244079	2015-01-04 16:09:54.244079
10	9	mockup.jpg	image/jpeg	350491	2015-01-04 16:23:14.600815	2015-01-04 16:23:14.602213	2015-01-04 16:23:14.602213
11	14	mockup.png	image/png	14556	2015-01-04 16:24:10.692849	2015-01-04 16:24:10.694082	2015-01-04 16:24:10.694082
12	14	mockup_(2).png	image/png	13887	2015-01-04 16:24:10.86812	2015-01-04 16:24:10.8695	2015-01-04 16:24:10.8695
15	15	click.jpg	image/jpeg	70247	2015-01-05 13:32:29.633706	2015-01-05 13:32:29.637538	2015-01-05 13:32:29.637538
16	15	mockup2.jpg	image/jpeg	345906	2015-01-05 13:32:29.793628	2015-01-05 13:32:29.796419	2015-01-05 13:32:29.796419
17	18	student_complete_1.jpg	image/jpeg	165321	2015-01-07 02:55:57.057378	2015-01-07 02:55:57.062829	2015-01-07 02:55:57.062829
18	18	student_complete_2A.jpg	image/jpeg	149529	2015-01-07 02:55:57.814579	2015-01-07 02:55:57.816399	2015-01-07 02:55:57.816399
19	18	student_complete_2B.jpg	image/jpeg	140691	2015-01-07 02:58:07.533785	2015-01-07 02:58:07.535417	2015-01-07 02:58:07.535417
20	18	student_complete_3.jpg	image/jpeg	145556	2015-01-07 02:58:07.712091	2015-01-07 02:58:07.724836	2015-01-07 02:58:07.724836
21	20	company_complete_1.jpg	image/jpeg	179169	2015-01-07 03:47:47.569533	2015-01-07 03:47:47.570965	2015-01-07 03:47:47.570965
22	20	company_complete_2.jpg	image/jpeg	174521	2015-01-07 03:47:53.038977	2015-01-07 03:47:53.042959	2015-01-07 03:47:53.042959
23	22	redkerja_database_schema_phase2.png	image/png	550494	2015-01-07 15:47:53.930737	2015-01-07 15:47:53.934927	2015-01-07 15:47:53.934927
24	23	candidat2.jpg	image/jpeg	282721	2015-01-09 10:04:05.657742	2015-01-09 10:04:05.660703	2015-01-09 10:04:05.660703
25	24	Screenshot_-_130115_-_05_01_04.png	image/png	190228	2015-01-12 22:01:31.562936	2015-01-12 22:01:31.567408	2015-01-12 22:01:31.567408
26	20	pesan.jpg	image/jpeg	65394	2015-01-14 13:10:47.208274	2015-01-14 13:10:47.211189	2015-01-14 13:10:47.211189
27	20	error.PNG	image/png	41746	2015-01-14 13:10:47.539446	2015-01-14 13:10:47.540948	2015-01-14 13:10:47.540948
28	25	Screenshot_-_150115_-_14_50_01.png	image/png	144129	2015-01-15 09:23:32.773334	2015-01-15 09:23:32.777953	2015-01-15 09:23:32.777953
29	25	Screenshot_-_150115_-_14_53_14.png	image/png	221074	2015-01-15 09:23:33.821775	2015-01-15 09:23:33.823673	2015-01-15 09:23:33.823673
30	25	download.png	image/png	9061	2015-01-15 10:06:59.407903	2015-01-15 10:06:59.40942	2015-01-15 10:06:59.40942
31	25	email.png	image/png	9380	2015-01-15 10:06:59.798402	2015-01-15 10:06:59.800284	2015-01-15 10:06:59.800284
32	26	jobs_list.PNG	image/png	83469	2015-01-17 14:45:58.152735	2015-01-17 14:45:58.156123	2015-01-17 14:45:58.156123
33	27	student_dashboard.PNG	image/png	109066	2015-01-22 22:50:35.12761	2015-01-22 22:50:35.130784	2015-01-22 22:50:35.130784
34	27	student_jobs_list.PNG	image/png	60211	2015-01-22 22:50:35.36142	2015-01-22 22:50:35.362989	2015-01-22 22:50:35.362989
35	28	admin_dashboard.PNG	image/png	50084	2015-01-22 23:31:01.180051	2015-01-22 23:31:01.181926	2015-01-22 23:31:01.181926
36	28	admin_chart.PNG	image/png	45727	2015-01-22 23:31:01.440125	2015-01-22 23:31:01.441745	2015-01-22 23:31:01.441745
37	28	admin_resume.PNG	image/png	46731	2015-01-22 23:31:01.72834	2015-01-22 23:31:01.735765	2015-01-22 23:31:01.735765
38	28	admin_compny_index.PNG	image/png	49170	2015-01-22 23:31:02.014126	2015-01-22 23:31:02.018635	2015-01-22 23:31:02.018635
\.


--
-- Name: admin_journal_issue_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_journal_issue_images_id_seq', 38, true);


--
-- Data for Name: admin_journal_issues; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_journal_issues (id, journal_id, status_id, no, title, start, "end", created_at, updated_at, type_id, priority, progress, content, asignee) FROM stdin;
12	3	5	000007	RedKerja Databases Phase 1	2015-01-02	2015-01-03	2015-01-02 17:18:01.12502	2015-01-07 02:10:58.737472	1	2	100	<p>Berikut adalah Desain Database Phase pertama untuk Redkerja, silahkan anda buat satu buah Database mengikuti Desain seperti gambar yang saya sertakan di bawah (bila tidak muncul silahkan download di: https://docs.google.com/file/d/0B1pBXMtqWXs9ZjBSYkU0ZGhGSWM/edit)</p>\r\n	1
1	3	5	000001	GIT Repository	2014-12-30	2014-12-31	2014-12-30 09:57:50.704423	2014-12-31 15:39:52.024964	1	3	100	<p>Tolong buatkan Repository GIT berdasarkan Framework CI, setelah Framework CI dibuat harap masukan kedalam local Repository kemudian PUSH ke&nbsp;GIT dengan menjalankan perintah berdasarkan tutorial GIT yang saya lampirkan (bila tidak ada, dapat dilihat di Gdrive).</p>\r\n\r\n<p>Setelah Framwork CI di PUSH ke dalam GIT Repository, buatlah halaman Index.html dengan content</p>\r\n\r\n<p>&quot;<strong>HELLO REDKERJA</strong>&quot;</p>\r\n\r\n<p>Jika Journal ini telah selesai, rubahlah status Journal menjadi <strong>Feedback</strong>&nbsp;dengan&nbsp;di&nbsp;Assign kepada Hasan Al Farisi</p>\r\n	1
6	3	5	000004	GIT Clone Repository	2015-01-01	2015-01-02	2015-01-01 01:35:07.386618	2015-01-02 04:28:11.207503	1	2	100	<p>Setelah GIT SSH sudah selesai ditambahkan didalam Repository GITLAB, maka selanjutnya adalah mendownload atau meng-CLONE repository GITLAB kedalam Repository local, caranya lakukan perintah berikut:</p>\r\n\r\n<p>1. Buka Direktory yang akan dijadikan Repository local (Bebas), Click kanan kemudian pilih <strong>Git Bash</strong></p>\r\n\r\n<p>2. Saat Command Promt muncul, ketikan perintah berikut:</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; a. <strong>git init</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; b. <strong>git clone git@gitlab.com:sampulkreativ/redkerja.git</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; c. Tinggalkan Command promt dan Kemudian buatlah satu dokument <strong>NamaAnggota.txt </strong>dengan content &quot;<strong>Hello GIT</strong>&quot; didalam Folder yang sudah didownload tadi.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; d. Masuk kembali kedalam Command Promt dan ketikan perintah berikut <strong>git status</strong>, saat perintah ini dijalankan, maka akan muncul nama file yang sudah kita buat sebelumnya. Copykan nama file itu dan ketikan perintah berikut seperti contoh <strong>git add NamaAnggota.txt</strong><br />\r\n&nbsp;&nbsp;&nbsp; e. Kemudian masukan perintah <strong>git commit -m &quot;My First Repository&quot;</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; f. Terakhir jalankan perintah berikut <strong>git push origin master</strong></p>\r\n\r\n<p>Jika tidak terdapat error, maka anda sudah berhasil mengUpload satu document pekerjaan kedalam Repository GITLAB, dengan demikian anda dapat bekerja didalam Team RedKerja.</p>\r\n\r\n<p>nb: Jangan lupa untuk mengupdate Status Journal jika sudah selesai dengan merubahnya menjadi <strong>feedback </strong>yang di <strong>assign </strong>pada PM RedKerja.</p>\r\n	1
5	3	5	000003	GIT Pull	2014-12-31	2015-01-01	2014-12-31 16:36:52.297502	2015-01-02 04:11:29.329945	1	3	100	<p>Lakukan <strong>GIT PULL&nbsp;</strong>atau mengupdate Local Repository kita dengan Repository yang ada di Gitlab, GIT PULL harus selalu dilakukan sebelum anda bekerja di dalam Local Repository, Hal ini diperlukan agar tidak adanya conflict yang terjadi apabila hendak melakukan GIT PUSH ke Repository GITLAB.</p>\r\n	1
2	3	5	000002	GIT SSH	2014-12-30	2014-12-31	2014-12-30 10:10:18.366378	2015-01-02 03:57:07.582527	1	2	100	<p>Generate-lah Public SSH Key dengan mengikuti langkah - langkah yang sudah saya lampirkan dalam file GIT Tutorial. Jika SSH-Key sudah berhasil dibuat, maka E-mail kan SSH key tersebut ke alamat berikut:</p>\r\n\r\n<p>hasan.farisi47@gmail.com dengan subject [GIT] - [SSH - (NamaAnggota)]</p>\r\n\r\n<p>nb: bila ada yang kurang dimengerti silahkan hubungi PM dari project RedKerja kemudian apabila&nbsp;file yang saya lampirkan tidak ada (GIT Tutorial), silahkan anda lihat di Gdrive.</p>\r\n	1
9	3	5	000006	Home Page HTML Responsive with Design	2015-01-01	2015-01-03	2015-01-01 12:54:37.093272	2015-01-12 21:49:15.816632	1	3	100	<p>Terapkan hasil Desain HTML pada Aplikasi CI Redkerja. kemudian applikasikan juga pada Form Login yang sebelumnya sudah dibuat.</p>\r\n\r\n<p>File Mockup dari Applikasi saya lampirkan, namun apabila tidak muncul anda dapat mendownloadnya di&nbsp;<a href="https://docs.google.com/file/d/0B1pBXMtqWXs9MXdPQl9BaFBleVU/edit?usp=drive_web">https://docs.google.com/file/d/0B1pBXMtqWXs9MXdPQl9BaFBleVU/edit?usp=drive_web</a>.</p>\r\n\r\n<p>File HTML Desain Applikasi juga saya sertakan,&nbsp;namun apabila tidak muncul anda dapat mendownloadnya di&nbsp;<a href="https://docs.google.com/file/d/0B1pBXMtqWXs9Ukgwb0c5MEFhVW8/edit">https://docs.google.com/file/d/0B1pBXMtqWXs9Ukgwb0c5MEFhVW8/edit</a></p>\r\n\r\n<p>nb: Pastikan anda mengupdate Status Journal menjadi Feedback to PM apabila Journal telah selesai, namun In Progress apabila masih dalam pengerjaan. Perlu diperhatikan pula tanggal dari Deadline Journal</p>\r\n	1
8	3	6	000005	Form Login	2015-01-01	2015-01-04	2015-01-01 02:19:08.39928	2015-01-12 03:41:54.830991	1	3	50	<p>Butlah login form tanpa style CSS&nbsp;berdasarkan Mockup berikut (Jika mockup tidak muncul anda dapat mendownloadnya di <a href="https://docs.google.com/file/d/0B1pBXMtqWXs9eWVONjFMV2diMG8/edit">https://docs.google.com/file/d/0B1pBXMtqWXs9eWVONjFMV2diMG8/edit</a>), fungsi dari form ini adalah untuk dapat masuk kedalam Dashboard Student, Company dan University.</p>\r\n\r\n<p>Role Login:</p>\r\n\r\n<p>Terdapat Select Box yang berisi 3 pilihan Student, Company dan University, bila User memilih University maka arah user kedalah halaman University dengan content: &quot;<strong>Hello University</strong>&quot;</p>\r\n\r\n<p>lakukan hal diatas untuk Student dan Company.</p>\r\n\r\n<p>nb: Bila journal ini sudah selesai maka rubah statusnya menjadi Feedback to PM, jika masih dalam pengerjaan rubahlah status journal menjadi Inprogress.</p>\r\n	4
17	3	5	000011	HTML Dummy Login dan Register	2015-01-06	2015-01-06	2015-01-06 07:52:57.271669	2015-01-07 02:06:04.53015	1	2	100	<p>Tolong buatkan halaman Dummy untuk masing masing Role beriku:</p>\r\n\r\n<p><strong>Role Login:</strong></p>\r\n\r\n<p>Saat user&nbsp;berhasil Masuk (blm menggunakan Database juga tak apa), buatlah satu halaman HTML dengan Content &quot;<strong>Ini halaman dashboard Student</strong>&quot;. Lakukan hal yang sama untuk Company dan University</p>\r\n\r\n<p><strong>Role Register:</strong></p>\r\n\r\n<p>Saat user berhasil melakukan Registrasi (blm menggunakan Database juga tak apa), buatlah satu halaman HTML dengan content &quot;<strong>Ini Halaman Complete Profile Student</strong>&quot;. Lakukan hal yang sama untuk Company dan University.</p>\r\n\r\n<p>NB: jika sudah selesai lakukanlah konfirmasi pada PM dan&nbsp;updatelah Journal ini lalu&nbsp;di PUSH ke GITLAB.</p>\r\n\r\n<p>&nbsp;</p>\r\n	1
15	3	5	000009	Register Page HTML Responsive with Design	2015-01-03	2015-01-04	2015-01-03 08:17:51.736867	2015-01-07 02:06:44.056822	1	3	100	<p><strong>Role Registrasi:</strong></p>\r\n\r\n<p>Ketika user mengklik link <strong>Sign Up for Free </strong>seperti pada gambar, maka munculkan Popup Registrasi seperti pada gambar. semua Style CSS sudah Desainer terapkan sehingga Developer hanya perlu melakukan penyesuain dengan Code yang sudah dibuat.</p>\r\n\r\n<p>File HTLM dan CSS sudah saya Lampirkan di bawah dengan nama Home Register. namun jika semua file lampiran tidak tersedia, silahkan and Download di link berikut:</p>\r\n\r\n<p>Mockup 1:&nbsp;<a href="https://docs.google.com/file/d/0B1pBXMtqWXs9dWN2cWJ3ZXdUaW8/edit?usp=drive_web">https://docs.google.com/file/d/0B1pBXMtqWXs9dWN2cWJ3ZXdUaW8/edit?usp=drive_web</a></p>\r\n\r\n<p>Mockup 2:&nbsp;<a href="https://docs.google.com/file/d/0B1pBXMtqWXs9NExlOS1uMFhqY0U/edit">https://docs.google.com/file/d/0B1pBXMtqWXs9NExlOS1uMFhqY0U/edit</a></p>\r\n\r\n<p>Mockup 3:&nbsp;<a href="https://docs.google.com/file/d/0B1pBXMtqWXs9MjhNTzkzOWwzaGs/edit">https://docs.google.com/file/d/0B1pBXMtqWXs9MjhNTzkzOWwzaGs/edit</a></p>\r\n	1
16	3	5	000010	GIT Clone Repository	2015-01-05	2015-01-05	2015-01-05 03:40:18.257914	2015-01-05 04:45:34.8803	1	2	100	<p>Setelah GIT SSH sudah selesai ditambahkan didalam Repository GITLAB, maka selanjutnya adalah mendownload atau meng-CLONE repository GITLAB kedalam Repository local, caranya lakukan perintah berikut:</p>\r\n\r\n<p>1. Buka Direktory yang akan dijadikan Repository local (Bebas), Click kanan kemudian pilih&nbsp;<strong>Git Bash</strong></p>\r\n\r\n<p>2. Saat Command Promt muncul, ketikan perintah berikut:</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; a.&nbsp;<strong>git init</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; b.&nbsp;<strong>git clone git@gitlab.com:sampulkreativ/redkerja.git</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; c. Tinggalkan Command promt dan Kemudian buatlah satu dokument&nbsp;<strong>NamaAnggota.txt&nbsp;</strong>dengan content &quot;<strong>Hello GIT</strong>&quot; didalam Folder yang sudah didownload tadi.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; d. Masuk kembali kedalam Command Promt dan ketikan perintah berikut&nbsp;<strong>git status</strong>, saat perintah ini dijalankan, maka akan muncul nama file yang sudah kita buat sebelumnya. Copykan nama file itu dan ketikan perintah berikut seperti contoh&nbsp;<strong>git add NamaAnggota.txt</strong><br />\r\n&nbsp;&nbsp;&nbsp; e. Kemudian masukan perintah&nbsp;<strong>git commit -m &quot;My First Repository&quot;</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; f. Terakhir jalankan perintah berikut&nbsp;<strong>git push origin master,</strong>&nbsp;setelah itu akan muncul &quot;Tell me who are you?&quot;, Copy saja perintahnya dan isikan perintah tersebut. Bila sudah terisi jalankan kembali perintah&nbsp;<strong>git push origin master.</strong></p>\r\n\r\n<p>Jika tidak terdapat error, maka anda sudah berhasil mengUpload satu document pekerjaan kedalam Repository GITLAB, dengan demikian anda dapat bekerja didalam Team RedKerja.</p>\r\n\r\n<p>nb: Jangan lupa untuk mengupdate Status Journal jika sudah selesai dengan merubahnya menjadi&nbsp;<strong>feedback&nbsp;</strong>yang di<strong>assign&nbsp;</strong>pada PM RedKerja.</p>\r\n	1
21	3	5	000015	Database Redkerja dan HTML Complete Profile	2015-01-07	2015-01-07	2015-01-07 04:07:31.712491	2015-01-12 21:50:40.14327	1	2	100	<p>Berikut adalah Link Download file HTML dari complete profile</p>\r\n\r\n<p><a href="http://www.mediafire.com/download/pb5feuzsi2q5chz/Complete_Profile_HTML.rar">Complete Profile</a></p>\r\n\r\n<p>dan berikut saya sertakan juga file sql database redkerja.</p>\r\n\r\n<p>nb: buat database dengan nama redkerja dan bila ada error mohon dihiraukan.</p>\r\n	1
22	3	5	000016	Redkerja Database Phase 2	2015-01-07	2015-01-08	2015-01-07 15:47:53.829497	2015-01-12 21:51:05.483293	1	3	100	Berikut adalah Desain Database Phase kedua untuk Redkerja, silahkan anda Update database Phase pertama dengan yang kedua ini. Berikut saya lampirkan File Imagenya.\r\n\r\nnb: Upload file SQL di didalam kotak Comment.\r\nkemudia hapus filed city_id,state_id dan country_id di table students, kemudian ganti dengan cities_id, states_id dan countries_id	1
24	3	1	000018	Admin Panel	2015-01-12	2015-01-12	2015-01-12 22:01:31.508379	2015-01-12 22:01:31.508379	1	2		<p>Buatlah satu link menuju halaman Admin Panel&nbsp;pada Aplikasi RedKerja, saat user mengetikan URL berikut <strong>admin/login.php</strong>, maka user akan diarahkan kedalam halaman login admin (Screen Shoot saya sertakan). Setelah login berhasil maka Admin akan masuk kedalam halaman Dashboard (Halaman Dashboard akan dijelaskan kembali). jika gagal maka munculkan error message.</p>\r\n	3
23	3	6	000017	Company Dashboard Applicants Menu HTML Responsive	2015-01-09	2015-01-11	2015-01-09 10:04:05.578328	2015-01-14 03:13:25.778661	1	3	80	<p>Berikut adalah HTML dengan nama file&nbsp;<strong>company_dashboard_search.html</strong>&nbsp;untuk halaman Company Dashboard dengan Menu <strong>Applicants</strong> (Pelamar), silahkan terapkan HTML berikut&nbsp;kedalam Applikasi Redkerja.</p>\r\n\r\n<p><a href="http://www.mediafire.com/download/5x1ld31529bqelv/Company+Dashboard+Search+Applicants.rar">Download file HTML</a></p>\r\n\r\n<p>nb: Untuk Fungsi akan dijelaskan kembali</p>\r\n	9
14	3	2	000008	Register Form	2015-01-02	2015-01-04	2015-01-02 17:32:23.238523	2015-01-29 04:38:16.713294	1	3	100	<p>Buatkan form Registrasi tanpa style CSS mengikuti mockup berikut, buatlah dua form registrasi yang dimana untuk form pertama disebut &quot;<strong>Form Registrasi Student</strong>&quot; kemudian di sebelah dari form pertama buatlah form yang kedua yang disebut &quot;<strong>Form Registrasi Compay</strong>&quot;</p>\r\n\r\n<p><strong>Role Registrasi Student:</strong></p>\r\n\r\n<p>JIka Pengunjung melakukan pendaftaran di dalam form student dan berhasil mendaftar, maka arahkanlah pengunjung tersebut kedalam&nbsp;halaman Complete profile student dengan content HTML:</p>\r\n\r\n<p>&quot;<strong>Complete Profile Student</strong>&quot;</p>\r\n\r\n<p><strong>&quot;Role Registrasi Company&quot;</strong></p>\r\n\r\n<p>Jika pengunjung melakukan pendaftaran di dalam form company&nbsp;dan berhasil mendaftar. maka arahkanlah pengunjung tersebut kedalam halaman complete profile company dengan content HTML:</p>\r\n\r\n<p>&quot;<strong>Complete Profile Company</strong>&quot;</p>\r\n\r\n<p>nb: Jika file mockup tidak muncul, anda dapat mendownloadnya di:</p>\r\n\r\n<p>1. (<a href="https://docs.google.com/file/d/0B1pBXMtqWXs9OGxaZl9CM0ZVd1U/edit">https://docs.google.com/file/d/0B1pBXMtqWXs9OGxaZl9CM0ZVd1U/edit</a>)</p>\r\n\r\n<p>2. (<a href="https://docs.google.com/file/d/0B1pBXMtqWXs9REVEUXk5NnZSdmc/edit">https://docs.google.com/file/d/0B1pBXMtqWXs9REVEUXk5NnZSdmc/edit</a>)</p>\r\n\r\n<p>Kemudian bila journal masih dalam pengerjaan rubahlah statusnya menjadi Inprogress dengan tidak mengAssign kepada PM, namun bila journal sudah selesai maka rubahlah statusnya menjadi Feddback dan di Assign kepada PM</p>\r\n	1
25	3	1	000019	Company Search Result and Student Details	2015-01-15	2015-01-16	2015-01-15 09:23:32.394558	2015-01-15 10:06:59.39113	1	3		<p>Terapkan 2 HTML seperti pada gambar pada Aplikasi Redkerja halaman Company,</p>\r\n\r\n<p>Pada halaman Search result atau gambar pertama terdapat Add favourite (kotak merah) yang berisi list favourite (dalam pengerjaan).</p>\r\n\r\n<p>Pada halaman student show detail terdapat dua tombol yang berada di bawah profile. pada tombol download CV munculkan Popup seperti gambar dimana Tombol Student CV adalah tombol untuk mendownload file CV yang di upload Student, sedangkan Redkerja CV adalah tombol untuk&nbsp;meng-generate&nbsp;file PDF dengan menampilkan Informasi yang ada di details student tersebut.</p>\r\n\r\n<p>untuk tombol Send Email munculkan popup seperti gambar.</p>\r\n\r\n<p><a href="http://www.mediafire.com/download/64o78vy3s38j6bo/Search+Result.zip">Download file HTML</a></p>\r\n\r\n<p>catatan : jangan pastekan seluruh CSS tapi&nbsp;pastekan CSS sesuai dengan nama File contoh pada file CSS terdapat comment /*Company Student Search Result*/ maka pastekan style yang ada pada komentar tersebut.</p>\r\n	9
20	3	2	000014	Company Complete Profile HTML Responsive	2015-01-07	2015-01-08	2015-01-07 03:47:47.54448	2015-01-20 06:38:04.326845	1	3	80	<p>Terapkanlah Desain HTML seperti mockup dibawah kedalam aplikasi Redkerja.</p>\r\n\r\n<p>Saat user dengan jenis Company&nbsp;berhasil melakukan Registrasi, maka user akan diarahkan kedalam halaman Complete Profile Company.</p>\r\n\r\n<p>Rubahlah tampilan halaman itu berdasarkan mockup file dan sql database yang&nbsp;sudah saya lampirkan&nbsp;di journal <a href="https://journalkreativ.herokuapp.com/admin/journal_issues/21?id_journal=3">#000015</a></p>\r\n\r\n<p>kemudian masukanlah inputan user tersebut kedalam database redkerja dengan table companies berdasarkan:</p>\r\n\r\n<p>Company Name =&gt; <strong>name</strong></p>\r\n\r\n<p>Industry Category =&gt; ambil data dari table <strong>industry_categories</strong></p>\r\n\r\n<p>company city =&gt; ambil data dari table <strong>cities</strong>, company state =&gt; data dari tabel <strong>states</strong>, company country =&gt; dari table <strong>countries</strong>.</p>\r\n\r\n<p>company email =&gt; <strong>email</strong></p>\r\n\r\n<p>company primary phone =&gt; <strong>phone_1</strong></p>\r\n\r\n<p>company secondary&nbsp;phone =&gt; <strong>phone_2</strong></p>\r\n\r\n<p>company description =&gt; <strong>description</strong></p>\r\n\r\n<p>contact name =&gt; <strong>contact_name</strong></p>\r\n\r\n<p>contact name2 (harusnya CONTACT PHONE) =&gt; <strong>contact_phone</strong></p>\r\n\r\n<p>Untuk complete profile tahap 2 (Buy Items) belum selesai, jadi user bisa langsung next dan masuk kehalaman Company Dashboard.</p>\r\n\r\n<p>nb: Anda dapat melihat Redkerja secara live di <a href="http://redkerja.besaba.com">redkerja</a><br />\r\n<br />\r\nBug: Saat user tidak mengisi Form dengan benar, tampilkan pesan seperti Mockup lalu beri background warna merah pada field yang tidak terisi seperti pada form student. Kemudian terdapat error seperti gambar, mohon diperbaiki</p>\r\n	1
27	3	1	000021	Student Dashboard	2015-01-22	2015-01-24	2015-01-22 22:50:34.443922	2015-01-22 23:19:32.085852	1	3		<p>Terapkanlah HTML berikut untuk Student Dashboard.</p>\r\n\r\n<p><a href="http://www.mediafire.com/download/ndmgek39lx9vau8/Student_Jobs_Dashboard.rar">Download File HTML</a></p>\r\n\r\n<p>Pada halaman Student Dashboard terdapat list pekerjaan yang ditawarkan oleh Company, saat Student melakukan pencarian, tampilkan pekerjaan seperti pada gambar.</p>\r\n\r\n<p>Pada List pekerjaan (Current Jobs) terdapat button Apply dan Applied, Apply berarti student dapat mengirimkan lamaran pekerjaan kepada Company. sedangkan Applied berarti Student sudah mengirimkan lamaran pekerjaan kepada Company.</p>\r\n\r\n<p>Saat student mengirim &nbsp;lamaran atau Apply Job, masukan data job yang di Apply kedalam table s<strong>tudent_applied_jobs,&nbsp;</strong>dan&nbsp;<strong>company_job_messages.</strong></p>\r\n\r\n<p>Pada table company_job_message generate lah secara otomatis texts berikut untuk dimasukan kedalam field content. Texsnya adalah:</p>\r\n\r\n<p>&quot;Hello {Company Name} You have one message from {Student Name}</p>\r\n\r\n<p>Greeting</p>\r\n\r\n<p>I am interest with your Job {Jobs Name} and I want to work in your Company.</p>\r\n\r\n<p>Please Reply me if you accept.</p>\r\n\r\n<p>Best Regards&quot;</p>\r\n\r\n<p>Pada Halaman Jobs List, terdapat student job dengan Respone dan Unrespone, respone berarrti bahwa jobs yang di applied telah di balas oleh company, sedangkan Unrespone berarti Job yang di Applied belum dibalas oleh Company. Untuk saat ini berikan status Unrespone sebagai Default.</p>\r\n\r\n<p>NB: Saya sertakan database Redkerja Phase 3</p>\r\n	4
28	3	1	000022	Admin Dashboard	2015-01-22	2015-01-24	2015-01-22 23:31:00.961239	2015-01-22 23:31:00.961239	1	3		<p>Pada halaman Admin Dashboard, terdapat table yang memuat informasi Student dan Company. Pada Table pertama menampilkan informasi dari Student beserta status mereka. untuk status Complete memiliki arti bahwa student tersebut sudah melengkapi profile. Sedangkan Incomplete berarti student terebut belum melengkapi profille. Hal yang sama juga berlaku untuk table Company dibawahnya.</p>\r\n\r\n<p>Pada halaman Admin Dashboard juga terdapat Chart yang menampilkan data student yang melamar pekerjaan kepada Company yang dihitung setiap bulannya.</p>\r\n\r\n<p>Status <strong>Accepted =&gt;&nbsp;</strong>Student yang melamar pekerjaan sudah berhasil di terima oleh company. ini ditandai dengan table student_job_messages terisi.</p>\r\n\r\n<p>Status <strong>Rejected =&gt;&nbsp;</strong>Saat ini belum ada</p>\r\n\r\n<p>Status <strong>Waiting =&gt;&nbsp;</strong>Student yang sudah mengirimkan lamaran namun belum ada tanggapa dari Company. ini ditandai dengan table student_job_applies yang terisi namun tidak terdapat di table&nbsp;student_job_messages.</p>\r\n\r\n<p>status <strong>Not Selected =&gt;&nbsp;</strong>Stadent yang belum melakukan pelamaran kepada Company. ini ditandai dengan Tidak ada student di table student_job_applies.</p>\r\n\r\n<p>Pada halaman Admin Dashboard yang terakhir terdapat list CV yang telah diUggah oleh Student. kemudian terdapat list Jobs yang berstatus Active yang sudah dibuat oleh Company.</p>\r\n\r\n<p>Pada halaman Company Index terdapat list All dari company. pada halaman Ini admin dapat melakukan pemblokiran kepada Company dengan mengclick button Freeze. dan tombol Unfreeze apabila akan membatalkan pemblokiran.</p>\r\n	3
26	3	6	000020	Company Jobs Page	2015-01-17	2015-01-19	2015-01-17 14:45:57.655308	2015-01-29 03:24:31.34161	1	2	30	<p>Terapkanlah HTML untuk halaman Jobs pada Company. Pada File rar yang saya sertakan sudah terdapat semua component yang dibutuhkan untuk halaman Jobs dan juga SQL database terbaru untuk Redkerja, maka karena itu silahkan anda perbaharui database Redkerjanya.</p>\r\n\r\n<p><a href="http://www.mediafire.com/download/zyc9scgrj7xxh5f/Company_Jobs_Page.rar">Download File HTML</a><br />\r\n<br />\r\nSetelah Company berhasil membuat Job dan memiliki status Active, maka tampilkan Job tersebut&nbsp;dihalaman muka Redkerja.</p>\r\n\r\n<p>Pada halaman Jobs list terdapat dua buah botton,&nbsp;yang pertama adalah button Active, Button Active memiliki arti jikalau Job yang bersangkutan sedang ditampilkan atau di publish di halaman Muka Redkerja. Sedangkan Unactive memiliki arti bahwa Job yang bersangkutan sedang tidak ditampilkan atau di publish di halaman Muka Redkerja.</p>\r\n\r\n<p>catatan : jika token Post Job yang dimiliki User Company sudah habis, maka tampikan pesan Notifikasi bahwa User tidak dapat melakukan Post Job.</p>\r\n	9
18	3	2	000012	Student Complete Profile HTML Responsive	2015-01-07	2015-01-09	2015-01-07 02:55:57.027019	2015-01-29 04:19:22.941497	1	3	100	<p>Terapkanlah Desain HTML untuk Student Complete Profile.</p>\r\n\r\n<p><strong>Role Student Complete:</strong></p>\r\n\r\n<p>Setelas User berhasil melakukan Registrasi dengan jenis Student, maka arahkanlah User tersebut kedalam Halaman Student Register dengan tampilan Desain seperti di bawah.</p>\r\n\r\n<p><strong>Role Student Complete Biodata:</strong></p>\r\n\r\n<p>Terdapat Form isian yang memuat tentang data pribadi dari User, pada Form ini pula user dapat Meng-Upload CV yang dimiliki kedalam database RedKerja</p>\r\n\r\n<p><strong>Role Student Complete Academic:</strong></p>\r\n\r\n<p>Terdapat Form isian yang memuat tentang data Akademis dari User, pada Form ini terdapat Select Box University Name yang berisi data Universitas dari table University di database&nbsp;begitupun dengan Vocationals dan Faculties. kemudian terdapat select Box Academic Status yang memiliki isian <strong>Graduated</strong> atau <strong>Student</strong>.</p>\r\n\r\n<p><strong>Graduted</strong><br />\r\nBila user memilih Graduated maka field akan terlihat seperti mockup A<br />\r\n<strong>Student</strong><br />\r\nBila user memilih Student maka akan menghilang semua filed yang ada pada Mockup A dan akan digantikan dengan field baru seperi Mockup B.</p>\r\n\r\n<p><strong>Role Student Complete Work Experinces:</strong></p>\r\n\r\n<p>Terdapat Form isian yang memuat data pengalaman bekerja User, pada tahap ketiga ini user dapat menambahkan lebih dari satu pengalaman bekerja dengan mengClick tombol &quot;Add Experince&quot;. Kemudian Tahap ketiga ini adalah tahap yang tidak wajib diisi sehingga User dapat menyelesaikan tahap Complete Profile.</p>\r\n\r\n<p>nb: Tanda <strong>(*)</strong> menandakan kalau field tersebut wajib diisi, dan bila kosong, maka tampilkan Error Message. Lalu file HTML dan SQL saya Lampirkan di Journal no <a href="https://journalkreativ.herokuapp.com/admin/journal_issues/21?id_journal=3"><strong><span style="font-family:verdana,sans-serif">#000015</span></strong></a></p>\r\n	1
\.


--
-- Name: admin_journal_issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_journal_issues_id_seq', 28, true);


--
-- Data for Name: admin_journal_team_checks; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_journal_team_checks (id, journal_id, admin_id, created_at, updated_at) FROM stdin;
3	3	5	2014-12-30 07:37:15.444474	2014-12-31 06:02:41.748613
4	4	5	2015-01-02 04:36:20.435103	2015-01-02 04:36:20.435103
\.


--
-- Name: admin_journal_team_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_journal_team_checks_id_seq', 4, true);


--
-- Data for Name: admin_journal_team_developers; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_journal_team_developers (id, journal_id, admin_id, created_at, updated_at) FROM stdin;
5	3	3	2014-12-30 07:37:15.37286	2014-12-30 07:37:15.37286
6	3	4	2014-12-30 07:37:15.408712	2014-12-30 07:37:15.408712
7	4	7	2015-01-02 04:36:20.41059	2015-01-02 04:36:20.41059
8	4	4	2015-01-02 04:36:20.424288	2015-01-02 04:36:20.424288
9	3	9	2015-01-05 03:27:02.533712	2015-01-05 03:27:02.533712
\.


--
-- Name: admin_journal_team_developers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_journal_team_developers_id_seq', 9, true);


--
-- Data for Name: admin_journals; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_journals (id, title, start, "end", created_at, updated_at, project_manajer, admin_id, status_id) FROM stdin;
3	RedKerja	2014-12-30	2015-01-31	2014-12-30 07:37:15.237398	2014-12-30 07:37:15.237398	Hasan Al Farisi	1	6
4	RamenDer	2015-02-01	2015-03-31	2015-01-02 04:36:20.367868	2015-01-02 04:36:20.367868	firas tistus	3	6
\.


--
-- Name: admin_journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_journals_id_seq', 4, true);


--
-- Data for Name: admin_profile_hobbies; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_profile_hobbies (id, name, profile_id, created_at, updated_at) FROM stdin;
1	Futsal	2	2014-12-17 06:20:20.620268	2014-12-17 06:20:20.620268
2	Travelling	1	2014-12-17 12:49:50.750175	2014-12-17 12:49:50.750175
3	Shopping	1	2014-12-17 12:49:50.912277	2014-12-17 12:49:50.912277
4	Browsing	1	2014-12-17 12:49:50.921722	2014-12-17 12:49:50.921722
5	Hiking, Photography	3	2014-12-17 14:50:28.684882	2014-12-17 14:50:28.684882
6	Futsal	4	2014-12-30 02:50:57.68199	2014-12-30 02:50:57.68199
7	Hiking	4	2014-12-30 02:50:57.696232	2014-12-30 02:50:57.696232
8	Camping	4	2014-12-30 02:50:57.706583	2014-12-30 02:50:57.706583
9	Renang	4	2014-12-30 02:50:57.717066	2014-12-30 02:50:57.717066
10	Futsal	5	2014-12-31 05:45:04.053174	2014-12-31 05:45:04.053174
11	Beladiri	5	2014-12-31 05:45:04.104851	2014-12-31 05:45:04.104851
12	Hiking	5	2014-12-31 05:45:04.110286	2014-12-31 05:48:20.024817
13	tidur	6	2015-01-01 12:30:27.493139	2015-01-01 12:30:27.493139
14	makan	6	2015-01-01 12:30:27.502897	2015-01-01 12:30:27.502897
15	main game	6	2015-01-01 12:30:27.513308	2015-01-01 12:30:27.513308
16	Futsal	7	2015-01-02 03:46:06.122733	2015-01-02 03:46:06.122733
17	Basket	7	2015-01-02 03:46:06.131782	2015-01-02 03:46:06.131782
18	Watch Anime	7	2015-01-02 03:46:06.136943	2015-01-02 03:46:06.136943
19	Playing Game	7	2015-01-02 03:46:06.142016	2015-01-02 03:46:06.142016
20	Download	7	2015-01-02 03:46:06.147094	2015-01-02 03:46:06.147094
21	Music	7	2015-01-02 03:46:06.152111	2015-01-02 03:46:06.152111
22	Sleep	8	2015-01-02 13:17:37.146002	2015-01-02 13:17:37.146002
23	Eat	8	2015-01-02 13:17:37.155567	2015-01-02 13:17:37.155567
24	Game	8	2015-01-02 13:17:37.1616	2015-01-02 13:17:37.1616
25	Sports	8	2015-01-02 13:17:37.167193	2015-01-02 13:17:56.530909
26	Musik	9	2015-01-05 03:25:25.355429	2015-01-05 03:25:25.355429
27	Game	9	2015-01-05 03:25:25.39153	2015-01-05 03:25:25.39153
28		9	2015-01-05 03:25:25.415961	2015-01-05 03:25:25.415961
\.


--
-- Name: admin_profile_hobbies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_profile_hobbies_id_seq', 28, true);


--
-- Data for Name: admin_profile_skills; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_profile_skills (id, name, skill, profile_id, created_at, updated_at, icon_file_name, icon_content_type, icon_file_size, icon_updated_at) FROM stdin;
1	Android	89	2	2014-12-17 06:20:19.684159	2014-12-17 06:20:19.684159	\N	\N	\N	\N
2	Native PHP	84	2	2014-12-17 06:20:19.959033	2014-12-17 06:20:19.959033	\N	\N	\N	\N
3	Code Igniter	74	2	2014-12-17 06:20:19.971036	2014-12-17 06:20:19.971036	\N	\N	\N	\N
4	.NET	78	2	2014-12-17 06:20:19.982966	2014-12-17 06:20:19.982966	\N	\N	\N	\N
5	J2EE	80	2	2014-12-17 06:20:19.996469	2014-12-17 06:20:19.996469	\N	\N	\N	\N
6	J2ME	77	2	2014-12-17 06:20:20.021523	2014-12-17 06:20:20.021523	\N	\N	\N	\N
7	C++	62	2	2014-12-17 06:20:20.049274	2014-12-17 06:20:20.049274	\N	\N	\N	\N
8	Delphi	63	2	2014-12-17 06:20:20.109095	2014-12-17 06:20:20.109095	\N	\N	\N	\N
9	Ruby on Rails	49	2	2014-12-17 06:20:20.162501	2014-12-17 06:20:20.162501	\N	\N	\N	\N
10	Javascript	63	2	2014-12-17 06:20:20.204938	2014-12-17 06:20:20.204938	\N	\N	\N	\N
11	C#	32	2	2014-12-17 06:20:20.307153	2014-12-17 06:20:20.307153	\N	\N	\N	\N
12	Phyton	34	2	2014-12-17 06:20:20.502729	2014-12-17 06:20:20.502729	\N	\N	\N	\N
13	Actionscript	82	2	2014-12-17 06:20:20.569676	2014-12-17 06:20:20.569676	\N	\N	\N	\N
14	Web Design	52	2	2014-12-17 06:20:20.586198	2014-12-17 06:20:20.586198	\N	\N	\N	\N
15	Mobile Design	54	2	2014-12-17 06:20:20.595803	2014-12-17 06:20:20.595803	\N	\N	\N	\N
16	Desktop Design	50	2	2014-12-17 06:20:20.601957	2014-12-17 06:20:20.601957	\N	\N	\N	\N
17	Ruby on Rails	90	1	2014-12-17 12:49:50.696086	2014-12-17 12:49:50.696086	\N	\N	\N	\N
18	ActionScript	80	1	2014-12-17 12:49:50.709057	2014-12-17 12:49:50.709057	\N	\N	\N	\N
19	Design	78	1	2014-12-17 12:49:50.718593	2014-12-17 12:49:50.718593	\N	\N	\N	\N
20	Animation	70	1	2014-12-17 12:49:50.729192	2014-12-17 12:49:50.729192	\N	\N	\N	\N
21	Javascript	60	1	2014-12-17 12:49:50.738935	2014-12-17 12:49:50.738935	\N	\N	\N	\N
22	web design	80	3	2014-12-17 14:50:28.606934	2014-12-17 14:50:28.606934	\N	\N	\N	\N
23	design illustration	80	3	2014-12-17 14:50:28.632252	2014-12-17 14:50:28.632252	\N	\N	\N	\N
24	design grafis	80	3	2014-12-17 14:50:28.654035	2014-12-17 14:50:28.654035	\N	\N	\N	\N
26	PHP Framework	75	4	2014-12-30 02:50:57.656185	2014-12-30 02:50:57.656185	\N	\N	\N	\N
27	Desain Grapich	65	4	2014-12-30 02:50:57.670963	2014-12-30 02:50:57.670963	\N	\N	\N	\N
28	Android Programming	80	5	2014-12-31 05:45:03.97594	2014-12-31 05:45:03.97594	\N	\N	\N	\N
29	PHP Programming	70	5	2014-12-31 05:45:04.019758	2014-12-31 05:45:04.019758	\N	\N	\N	\N
30	Android Design	72	5	2014-12-31 05:45:04.026225	2014-12-31 05:45:04.026225	\N	\N	\N	\N
32	API (PHP Native)	72	5	2014-12-31 05:45:04.037834	2014-12-31 05:45:04.037834	\N	\N	\N	\N
31	Design Grafis	67	5	2014-12-31 05:45:04.032191	2014-12-31 05:48:07.94721	\N	\N	\N	\N
33	C++	60	5	2014-12-31 05:48:07.971812	2014-12-31 05:48:07.971812	\N	\N	\N	\N
34	android	80	6	2015-01-01 12:30:27.428329	2015-01-01 12:30:27.428329	\N	\N	\N	\N
35	php	75	6	2015-01-01 12:30:27.449398	2015-01-01 12:30:27.449398	\N	\N	\N	\N
36	html	75	6	2015-01-01 12:30:27.459322	2015-01-01 12:30:27.459322	\N	\N	\N	\N
37	css	70	6	2015-01-01 12:30:27.467133	2015-01-01 12:30:27.467133	\N	\N	\N	\N
38	java	65	6	2015-01-01 12:30:27.474192	2015-01-01 12:30:27.474192	\N	\N	\N	\N
39	PHP 	92	7	2015-01-02 03:46:06.085837	2015-01-02 03:46:06.085837	\N	\N	\N	\N
40	HTML	82	7	2015-01-02 03:46:06.093701	2015-01-02 03:46:06.093701	\N	\N	\N	\N
41	CSS	85	7	2015-01-02 03:46:06.099424	2015-01-02 03:46:06.099424	\N	\N	\N	\N
42	Design	82	7	2015-01-02 03:46:06.105068	2015-01-02 03:46:06.105068	\N	\N	\N	\N
43	Visual Basic	77	7	2015-01-02 03:46:06.1108	2015-01-02 03:46:06.1108	\N	\N	\N	\N
44	Java Desktop	76	7	2015-01-02 03:46:06.116592	2015-01-02 03:46:06.116592	\N	\N	\N	\N
45	Web Design	70	8	2015-01-02 13:15:33.665752	2015-01-02 13:15:33.665752	\N	\N	\N	\N
46	Web Developer	70	8	2015-01-02 13:15:33.677159	2015-01-02 13:15:33.677159	\N	\N	\N	\N
47	Designer	50	8	2015-01-02 13:15:33.684163	2015-01-02 13:15:33.684163	\N	\N	\N	\N
48	CSS	67	5	2015-01-05 02:55:29.197914	2015-01-05 02:55:29.197914	\N	\N	\N	\N
49	HTML	70	5	2015-01-05 02:55:29.218832	2015-01-05 02:55:29.218832	\N	\N	\N	\N
50	Java Prgrammer	80	9	2015-01-05 03:21:39.197426	2015-01-05 03:25:25.25218	\N	\N	\N	\N
51	Android Programmer	50	9	2015-01-05 03:25:25.269297	2015-01-05 03:25:25.269297	\N	\N	\N	\N
52	Web Programmer	90	9	2015-01-05 03:25:25.303835	2015-01-05 03:25:25.303835	\N	\N	\N	\N
53	Visual Programming	50	9	2015-01-05 03:25:25.3249	2015-01-05 03:25:25.3249	\N	\N	\N	\N
\.


--
-- Name: admin_profile_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_profile_skills_id_seq', 53, true);


--
-- Data for Name: admin_profiles; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_profiles (id, name, last_name, facebook, e_mail, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, motto, describe_me, skype, birthday, admin_id) FROM stdin;
3	firas	tistus	firas C-qin Sitizen	firastistus@gmail.com	2014-12-17 13:50:40.944155	2015-01-11 16:04:33.813268	trip1.jpg	image/jpeg	106184	2015-01-11 16:04:33.809507	man jadda wa jada, man shobaro zafira	Traveling membuat saya semakin bersemangat kembali  menjalani aktifitas keseharian, lebih membuka mata saya bahwa kehidupan ini jangan selalu seperti biasanya.\r\nOlahraga membuat saya lebih fresh dan membuat fisik semakin kuat.\r\nPhotography, saya selalu ingin menyimpan kenangan atau mengabadikan setiap kejadian, berbagi cerita saat saya melakukan perjalanan jauh sembari memperlihatkan gambaran dari cerita saya tersebut.\r\n		1995-02-22	3
10	unknow	unknow	unknow	ariqfahri@gmail.com	2015-01-14 03:07:58.580596	2015-01-14 03:07:58.580596	\N	\N	\N	\N	unknow	unknow	\N	2015-01-14	10
8	Indra	Prasetya	facebook.com/prasetyaindraa	indraprasetya154@gmail.com	2015-01-02 13:09:55.306948	2015-01-02 13:12:24.790353	\N	\N	\N	\N	Better than before	I'm Human	prasetyaindraa	1995-04-15	8
7	Yudi Setiadi	Permana	https://www.facebook.com/yudi.s.permana1	yudi.setiadi.permana@gmail.com	2015-01-02 03:13:47.192198	2015-01-05 01:48:22.065098	CYMERA_20140802_1009225.jpg	image/jpeg	135631	2015-01-05 01:48:22.057042	unknow	unknow		1995-07-18	7
4	Rizki	Fauzi	https://www.facebook.com/UstadzSquadz	rizkifauzi37@gmail.com	2014-12-30 02:34:31.798537	2015-01-05 02:39:04.022389	IMG_0351_copy.jpg	image/jpeg	36864	2015-01-05 02:39:04.021427	Practice Make Perfect	Belajar dan teruslah belajar dari pengalaman dan kegagalan. Karena disitulah langkah awal kita untuk bangkit. :D		2014-12-30	4
2	Muhammad Lucky	Pradana	mluckypradana	mluckypradana@gmail.com	2014-12-16 05:16:06.405142	2015-01-05 02:44:14.260526	IMG_0041_(2).JPG	image/jpeg	752163	2015-01-05 02:44:14.259649	Still thinking my moto.	Live in Bandung.	mluckypradana	2014-01-26	2
5	Yudi	Rahmat	https://www.facebook.com/yudi.rahmat.71	yudirahmat7@gmail.com	2014-12-31 05:34:35.675297	2015-01-05 03:28:49.966281	yudi2.jpg	image/jpeg	115789	2015-01-05 03:28:49.958745	Berusaha semaksimal mungkin !!	....		1994-07-03	5
9	Dejan Sandria	Silitonga	https://www.facebook.com/sandriadejan	sandriadejan@gmail.com	2015-01-05 03:20:13.311877	2015-01-05 03:32:22.8685	redkerja.jpg	image/jpeg	83918	2015-01-05 03:32:22.866202	Banyak Bekerja, Sedikit Bicara	I'm a programmer in PT. Arutala Indonesia. Specifically, I am a Java Programmer, Android Programmer, Visual Programmer, and Web Programmer.		1995-07-25	9
6	Rian	Erlangga Saputra	https://www.facebook.com/rerlanggas	rianerlangga03@gmail.com	2015-01-01 12:28:53.279799	2015-01-05 04:39:14.535202	as.jpg	image/jpeg	130599	2015-01-05 04:39:14.53437	unknow	unknow		2015-01-01	6
1	Hasan	Al Farisi	Hasan Al Farisi	hasan.farisi47@gmail.com	2014-12-16 04:39:21.832615	2015-01-05 13:16:42.036598	Hasan.jpg	image/jpeg	26658	2015-01-05 13:16:42.032964	Jalani hidup dengan kesungguhan, karena hidup tak akan bisa terulang	Saya...	Hasan_Al_Farisi	1995-12-31	1
\.


--
-- Name: admin_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_profiles_id_seq', 10, true);


--
-- Data for Name: admin_reply_contact_companies; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_reply_contact_companies (id, body, contact_company_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: admin_reply_contact_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_reply_contact_companies_id_seq', 1, false);


--
-- Data for Name: admin_reply_contacts; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_reply_contacts (id, body, contact_id, created_at, updated_at) FROM stdin;
1	Udah San, foto 2015 PES	1	2014-12-16 05:32:30.913185	2014-12-16 05:32:30.913185
3	dear hasan,\r\n\r\nmockup upnya gak bisa di buka ? kenapa ya ? g drivenya upload ke sampulkreativ aja\r\n\r\ngdrivenya harus switch account	6	2015-01-04 07:54:58.727144	2015-01-04 07:54:58.727144
4	dear hasan,\r\n\r\nmockup upnya gak bisa di buka ? kenapa ya ? g drivenya upload ke sampulkreativ aja\r\n\r\ngdrivenya harus switch account	6	2015-01-04 07:55:04.354174	2015-01-04 07:55:04.354174
5	udah san , tapi gak muncul	14	2015-01-05 02:17:54.809898	2015-01-05 02:17:54.809898
6	udah san ..	15	2015-01-05 02:56:21.320129	2015-01-05 02:56:21.320129
8	dear hasan,\r\n\r\nsaya sudah buat database untuk redkerja, sorry lama, sebagai pertanyaan di table student memang ada field yang sama ? city dan cities, states dan state -> 	12	2015-01-05 03:43:12.978607	2015-01-05 03:43:12.978607
9	-> saya buat 1 dulu, jika ada perubahan akan segera saya rubah kemabali\r\n\r\nterima kasih\r\nfiras	12	2015-01-05 03:43:23.752946	2015-01-05 03:43:23.752946
\.


--
-- Name: admin_reply_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_reply_contacts_id_seq', 9, true);


--
-- Data for Name: admin_status_journals; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_status_journals (id, name, created_at, updated_at) FROM stdin;
1	New	2014-12-16 04:37:10.659065	2014-12-16 04:37:10.659065
2	Feedback	2014-12-16 04:37:10.66729	2014-12-16 04:37:10.66729
3	Rejected	2014-12-16 04:37:10.671745	2014-12-16 04:37:10.671745
4	Resolved	2014-12-16 04:37:10.675567	2014-12-16 04:37:10.675567
5	Close	2014-12-16 04:37:10.679396	2014-12-16 04:37:10.679396
6	In Progress	2014-12-16 04:37:10.682768	2014-12-16 04:37:10.682768
\.


--
-- Name: admin_status_journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_status_journals_id_seq', 6, true);


--
-- Data for Name: admin_sub_categories; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_sub_categories (id, name, category_id, created_at, updated_at) FROM stdin;
1	Riview	2	2015-01-02 01:30:03.158208	2015-01-02 01:30:03.158208
2	Download	2	2015-01-02 01:30:31.197542	2015-01-02 01:30:31.197542
\.


--
-- Name: admin_sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_sub_categories_id_seq', 2, true);


--
-- Data for Name: admin_type_journals; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admin_type_journals (id, name, created_at, updated_at) FROM stdin;
1	Sprint	2014-12-16 04:37:10.696973	2014-12-16 04:37:10.696973
2	Change Request	2014-12-16 04:37:10.702937	2014-12-16 04:37:10.702937
3	Bug	2014-12-16 04:37:10.706607	2014-12-16 04:37:10.706607
\.


--
-- Name: admin_type_journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admin_type_journals_id_seq', 3, true);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
7	yudi.setiadi.permana@gmail.com	$2a$10$dAYGJxAO8wQuT2ruD8a0aeP1kVcLpSvLVAkJdTdkXgMgRJO6dsAYe	\N	\N	\N	5	2015-02-02 01:59:21.711074	2015-01-26 08:54:46.452706	180.253.20.206	36.72.205.57	2015-01-02 03:13:47.172611	2015-02-02 01:59:21.713854
6	rianerlangga03@gmail.com	$2a$10$02GitNnKFIH6.KbT7L.5JOI4V.NIpnqxS0.iWJUemUnx/PY6xHw9K	\N	\N	\N	2	2015-01-05 04:34:23.217895	2015-01-01 12:28:53.263964	128.199.207.123	128.199.207.123	2015-01-01 12:28:53.255027	2015-01-05 04:34:23.220541
1	hasan.farisi47@gmail.com	$2a$10$ZZ6j/JsRIsYsri7mmNumgeDn5xq69jGVmFBlQR7U0zFj0FOhC2iD.	\N	\N	\N	69	2015-02-02 23:06:54.897454	2015-02-02 02:13:04.743847	120.177.140.64	202.138.247.73	2014-12-16 04:39:21.751514	2015-02-02 23:06:54.903869
4	rizkifauzi37@gmail.com	$2a$10$9LXtK3wYlp9gcmg8jDPXsuriVPNww6o9nfG5X0WY2ZcZxDmS/2VNi	\N	\N	\N	25	2015-02-03 02:19:50.481341	2015-02-02 02:00:02.48239	180.253.20.206	180.253.20.206	2014-12-30 02:34:31.757946	2015-02-03 02:19:50.484345
8	indraprasetya154@gmail.com	$2a$10$9IN0yMCAkHmoNi630Ky7q./9tsP4kvT59FTe25QPP8jtNPDWvmcMy	\N	\N	\N	1	2015-01-02 13:09:55.285575	2015-01-02 13:09:55.285575	36.72.50.197	36.72.50.197	2015-01-02 13:09:55.265721	2015-01-02 13:09:55.287668
3	firastistus@gmail.com	$2a$10$eGPAHSPEZFOA4Cc61VyT5OSDt95/GoaofdGUBAFtSvDDV/l8evYBK	\N	\N	\N	15	2015-01-23 01:42:41.286826	2015-01-16 13:08:42.113867	114.79.1.248	222.124.59.51	2014-12-17 13:50:40.894968	2015-01-23 01:42:41.2905
2	mluckypradana@gmail.com	$2a$10$6KeBm9oxLOn5AAJyzG8d5uxvb7EykV1OCBdfvQEgH4SNhp/9YiKU2	\N	\N	2015-01-05 02:42:57.865738	10	2015-01-14 02:59:55.784926	2015-01-13 04:04:56.793554	202.138.247.73	202.138.247.73	2014-12-16 05:16:06.319858	2015-01-14 02:59:55.78765
10	ariqfahri@gmail.com	$2a$10$.6dC4mwvKDf.lj965QS7qeFx9wAV3mC9RPmFsKnHH7./L.aWJAwpC	\N	\N	\N	1	2015-01-14 03:07:58.565215	2015-01-14 03:07:58.565215	120.173.118.38	120.173.118.38	2015-01-14 03:07:58.556688	2015-01-14 03:07:58.56644
5	yudirahmat7@gmail.com	$2a$10$7odHYKx/NNvDI18dw6ru8egmt1MQZwZJGK9m5Ysf3DOa4IC1Cj7Uy	\N	\N	\N	2	2015-01-05 02:31:49.246603	2014-12-31 05:34:35.659949	36.71.245.113	36.79.161.202	2014-12-31 05:34:35.490008	2015-01-05 02:31:49.252882
9	sandriadejan@gmail.com	$2a$10$FKCUylNAsZGF9FoUwjX2UutuvIpSBybdB7fqouK4JBQg4xTKk0NwC	\N	\N	2015-01-29 03:22:27.594524	17	2015-01-29 03:22:27.605084	2015-01-20 04:58:38.46741	150.107.244.234	103.23.32.76	2015-01-05 03:20:13.279706	2015-01-29 03:22:27.607365
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('admins_id_seq', 10, true);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY articles (id, title, body, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, category_id, sub_category_id) FROM stdin;
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('articles_id_seq', 3, true);


--
-- Data for Name: dashboard_comments; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY dashboard_comments (id, article_id, name, email, body, created_at, updated_at, profile) FROM stdin;
\.


--
-- Name: dashboard_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('dashboard_comments_id_seq', 1, true);


--
-- Data for Name: dashboard_reply_comments; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY dashboard_reply_comments (id, body, comment_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: dashboard_reply_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('dashboard_reply_comments_id_seq', 1, false);


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
289	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 14\n- '3'\n- plus\n	\N	2015-01-15 12:16:24.948963	\N	\N	\N	notification_create_journal_issue	2015-01-15 12:16:24.949171	2015-01-15 12:16:24.949171
290	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 14\n- 4\n- main\n	\N	2015-01-15 12:16:24.95596	\N	\N	\N	notification_create_journal_issue	2015-01-15 12:16:24.956059	2015-01-15 12:16:24.956059
291	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 26\n- 9\n- main\n	\N	2015-01-17 14:45:57.84309	\N	\N	\N	notification_create_journal_issue	2015-01-17 14:45:57.843258	2015-01-17 14:45:57.843258
292	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 26\n- ''\n- plus\n	\N	2015-01-17 14:45:58.138355	\N	\N	\N	notification_create_journal_issue	2015-01-17 14:45:58.138462	2015-01-17 14:45:58.138462
293	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 20\n- ''\n- plus\n	\N	2015-01-20 06:38:04.40773	\N	\N	\N	notification_create_journal_issue	2015-01-20 06:38:04.407968	2015-01-20 06:38:04.407968
294	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 20\n- 1\n- main\n	\N	2015-01-20 06:38:04.476531	\N	\N	\N	notification_create_journal_issue	2015-01-20 06:38:04.476803	2015-01-20 06:38:04.476803
295	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- 4\n- main\n	\N	2015-01-22 22:50:34.822848	\N	\N	\N	notification_create_journal_issue	2015-01-22 22:50:34.823057	2015-01-22 22:50:34.823057
296	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- ''\n- plus\n	\N	2015-01-22 22:50:34.843627	\N	\N	\N	notification_create_journal_issue	2015-01-22 22:50:34.843767	2015-01-22 22:50:34.843767
297	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- ''\n- plus\n	\N	2015-01-22 23:19:32.114219	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:19:32.11439	2015-01-22 23:19:32.11439
298	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- 4\n- main\n	\N	2015-01-22 23:19:32.340014	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:19:32.340228	2015-01-22 23:19:32.340228
299	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- ''\n- plus\n	\N	2015-01-22 23:19:48.397462	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:19:48.3976	2015-01-22 23:19:48.3976
300	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- 4\n- main\n	\N	2015-01-22 23:19:48.708286	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:19:48.708448	2015-01-22 23:19:48.708448
301	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- ''\n- plus\n	\N	2015-01-22 23:19:54.126241	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:19:54.126393	2015-01-22 23:19:54.126393
302	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- 4\n- main\n	\N	2015-01-22 23:19:54.289196	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:19:54.289346	2015-01-22 23:19:54.289346
303	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- ''\n- plus\n	\N	2015-01-22 23:20:32.819775	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:20:32.820063	2015-01-22 23:20:32.820063
304	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- 4\n- main\n	\N	2015-01-22 23:20:32.830717	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:20:32.830873	2015-01-22 23:20:32.830873
305	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- ''\n- plus\n	\N	2015-01-22 23:21:17.74653	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:21:17.746846	2015-01-22 23:21:17.746846
306	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 27\n- 4\n- main\n	\N	2015-01-22 23:21:17.757686	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:21:17.757859	2015-01-22 23:21:17.757859
307	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 28\n- 3\n- main\n	\N	2015-01-22 23:31:00.974011	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:31:00.974159	2015-01-22 23:31:00.974159
308	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 28\n- ''\n- plus\n	\N	2015-01-22 23:31:00.991647	\N	\N	\N	notification_create_journal_issue	2015-01-22 23:31:00.991828	2015-01-22 23:31:00.991828
309	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 18\n- ''\n- plus\n	\N	2015-01-26 16:30:42.697095	\N	\N	\N	notification_create_journal_issue	2015-01-26 16:30:42.697426	2015-01-26 16:30:42.697426
310	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 18\n- 4\n- main\n	\N	2015-01-26 16:30:42.722808	\N	\N	\N	notification_create_journal_issue	2015-01-26 16:30:42.722992	2015-01-26 16:30:42.722992
311	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 26\n- ''\n- plus\n	\N	2015-01-29 03:24:31.404926	\N	\N	\N	notification_create_journal_issue	2015-01-29 03:24:31.405135	2015-01-29 03:24:31.405135
312	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 26\n- 9\n- main\n	\N	2015-01-29 03:24:31.42483	\N	\N	\N	notification_create_journal_issue	2015-01-29 03:24:31.424972	2015-01-29 03:24:31.424972
313	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 18\n- ''\n- plus\n	\N	2015-01-29 04:19:08.170793	\N	\N	\N	notification_create_journal_issue	2015-01-29 04:19:08.170919	2015-01-29 04:19:08.170919
314	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 18\n- 4\n- main\n	\N	2015-01-29 04:19:08.178827	\N	\N	\N	notification_create_journal_issue	2015-01-29 04:19:08.178943	2015-01-29 04:19:08.178943
315	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 18\n- ''\n- plus\n	\N	2015-01-29 04:19:22.958865	\N	\N	\N	notification_create_journal_issue	2015-01-29 04:19:22.958961	2015-01-29 04:19:22.958961
316	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 18\n- 1\n- main\n	\N	2015-01-29 04:19:22.96642	\N	\N	\N	notification_create_journal_issue	2015-01-29 04:19:22.966497	2015-01-29 04:19:22.966497
317	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 14\n- '3'\n- plus\n	\N	2015-01-29 04:38:16.730024	\N	\N	\N	notification_create_journal_issue	2015-01-29 04:38:16.730122	2015-01-29 04:38:16.730122
318	1	0	--- !ruby/object:Delayed::PerformableMailer\nobject: !ruby/class 'AdminMailer'\nmethod_name: :mail_journal_issue\nargs:\n- 14\n- 1\n- main\n	\N	2015-01-29 04:38:16.737666	\N	\N	\N	notification_create_journal_issue	2015-01-29 04:38:16.737728	2015-01-29 04:38:16.737728
\.


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('delayed_jobs_id_seq', 318, true);


--
-- Data for Name: rand_clouds; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY rand_clouds (id, types, type_id, rand, created_at, updated_at) FROM stdin;
2	profile	1	/v28	2015-01-05 13:16:42.426035	2015-01-05 13:16:42.426035
1	company	1	/v25	2015-01-05 13:14:54.786455	2015-01-07 06:34:07.859447
3	profile	3	/v29	2015-01-11 16:04:34.204024	2015-01-11 16:04:34.204024
\.


--
-- Name: rand_clouds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('rand_clouds_id_seq', 3, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY schema_migrations (version) FROM stdin;
20140909063935
20140909074958
20140909093043
20140918065300
20140918070840
20140918073210
20140919132108
20140920055026
20140920084842
20140920121948
20140921034143
20140921034423
20140921054918
20140922140836
20140924044227
20140925040008
20140925040041
20140925043858
20140925044226
20140925063007
20140926132822
20140928051638
20140928061629
20141001062530
20141001063549
20141001063906
20141001070014
20141002022240
20141002094242
20141016044117
20141019064135
20141019081805
20141022025855
20141023040016
20141027070010
20141115025950
20141115122335
20141115122435
20141115122823
20141116050728
20141116051321
20141116055849
20141116060923
20141116074132
20141117131515
20141118070550
20141118090838
20141119020259
20141119022006
20141119022333
20141119022640
20141119023014
20141119023027
20141119023037
20141119082019
20141120014049
20141120014423
20141121133339
20141121135816
20141125132610
20141212021656
20141212023616
20141212034646
20141212035732
20141222031955
20141223023218
20141223033340
20141225080225
20141225094238
20141225114325
20141230025131
20150105064350
20150105130243
\.


--
-- Data for Name: temps; Type: TABLE DATA; Schema: public; Owner: xgcdrmfhremvhq
--

COPY temps (id, source_id, created_at, updated_at) FROM stdin;
1	1	2014-12-30 04:48:34.245313	2014-12-30 04:48:34.245313
2	1	2014-12-30 07:27:09.190223	2014-12-30 07:27:09.190223
3	1	2014-12-30 07:35:31.820246	2014-12-30 07:35:31.820246
4	3	2015-01-02 04:33:12.363295	2015-01-02 04:33:12.363295
5	3	2015-01-02 04:33:24.039208	2015-01-02 04:33:24.039208
6	3	2015-01-02 04:34:22.313589	2015-01-02 04:34:22.313589
7	3	2015-01-02 04:34:31.804754	2015-01-02 04:34:31.804754
8	1	2015-01-05 03:26:55.690629	2015-01-05 03:26:55.690629
\.


--
-- Name: temps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xgcdrmfhremvhq
--

SELECT pg_catalog.setval('temps_id_seq', 8, true);


--
-- Name: admin_advertises_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_advertises
    ADD CONSTRAINT admin_advertises_pkey PRIMARY KEY (id);


--
-- Name: admin_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_categories
    ADD CONSTRAINT admin_categories_pkey PRIMARY KEY (id);


--
-- Name: admin_company_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_company_profiles
    ADD CONSTRAINT admin_company_profiles_pkey PRIMARY KEY (id);


--
-- Name: admin_contact_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_contact_companies
    ADD CONSTRAINT admin_contact_companies_pkey PRIMARY KEY (id);


--
-- Name: admin_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_contacts
    ADD CONSTRAINT admin_contacts_pkey PRIMARY KEY (id);


--
-- Name: admin_galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_galleries
    ADD CONSTRAINT admin_galleries_pkey PRIMARY KEY (id);


--
-- Name: admin_gallery_comment_replies_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_gallery_comment_replies
    ADD CONSTRAINT admin_gallery_comment_replies_pkey PRIMARY KEY (id);


--
-- Name: admin_gallery_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_gallery_comments
    ADD CONSTRAINT admin_gallery_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_gallery_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_gallery_groups
    ADD CONSTRAINT admin_gallery_groups_pkey PRIMARY KEY (id);


--
-- Name: admin_help_files_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_help_files
    ADD CONSTRAINT admin_help_files_pkey PRIMARY KEY (id);


--
-- Name: admin_helps_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_helps
    ADD CONSTRAINT admin_helps_pkey PRIMARY KEY (id);


--
-- Name: admin_jornal_team_designers_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_jornal_team_designers
    ADD CONSTRAINT admin_jornal_team_designers_pkey PRIMARY KEY (id);


--
-- Name: admin_journal_issue_asignees_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_journal_issue_asignees
    ADD CONSTRAINT admin_journal_issue_asignees_pkey PRIMARY KEY (id);


--
-- Name: admin_journal_issue_comment_files_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_journal_issue_comment_files
    ADD CONSTRAINT admin_journal_issue_comment_files_pkey PRIMARY KEY (id);


--
-- Name: admin_journal_issue_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_journal_issue_comments
    ADD CONSTRAINT admin_journal_issue_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_journal_issue_files_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_journal_issue_files
    ADD CONSTRAINT admin_journal_issue_files_pkey PRIMARY KEY (id);


--
-- Name: admin_journal_issue_images_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_journal_issue_images
    ADD CONSTRAINT admin_journal_issue_images_pkey PRIMARY KEY (id);


--
-- Name: admin_journal_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_journal_issues
    ADD CONSTRAINT admin_journal_issues_pkey PRIMARY KEY (id);


--
-- Name: admin_journal_team_checks_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_journal_team_checks
    ADD CONSTRAINT admin_journal_team_checks_pkey PRIMARY KEY (id);


--
-- Name: admin_journal_team_developers_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_journal_team_developers
    ADD CONSTRAINT admin_journal_team_developers_pkey PRIMARY KEY (id);


--
-- Name: admin_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_journals
    ADD CONSTRAINT admin_journals_pkey PRIMARY KEY (id);


--
-- Name: admin_profile_hobbies_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_profile_hobbies
    ADD CONSTRAINT admin_profile_hobbies_pkey PRIMARY KEY (id);


--
-- Name: admin_profile_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_profile_skills
    ADD CONSTRAINT admin_profile_skills_pkey PRIMARY KEY (id);


--
-- Name: admin_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_profiles
    ADD CONSTRAINT admin_profiles_pkey PRIMARY KEY (id);


--
-- Name: admin_reply_contact_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_reply_contact_companies
    ADD CONSTRAINT admin_reply_contact_companies_pkey PRIMARY KEY (id);


--
-- Name: admin_reply_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_reply_contacts
    ADD CONSTRAINT admin_reply_contacts_pkey PRIMARY KEY (id);


--
-- Name: admin_status_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_status_journals
    ADD CONSTRAINT admin_status_journals_pkey PRIMARY KEY (id);


--
-- Name: admin_sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_sub_categories
    ADD CONSTRAINT admin_sub_categories_pkey PRIMARY KEY (id);


--
-- Name: admin_type_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admin_type_journals
    ADD CONSTRAINT admin_type_journals_pkey PRIMARY KEY (id);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: dashboard_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY dashboard_comments
    ADD CONSTRAINT dashboard_comments_pkey PRIMARY KEY (id);


--
-- Name: dashboard_reply_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY dashboard_reply_comments
    ADD CONSTRAINT dashboard_reply_comments_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: rand_clouds_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY rand_clouds
    ADD CONSTRAINT rand_clouds_pkey PRIMARY KEY (id);


--
-- Name: temps_pkey; Type: CONSTRAINT; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

ALTER TABLE ONLY temps
    ADD CONSTRAINT temps_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE INDEX delayed_jobs_priority ON delayed_jobs USING btree (priority, run_at);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: xgcdrmfhremvhq; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: xgcdrmfhremvhq
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM xgcdrmfhremvhq;
GRANT ALL ON SCHEMA public TO xgcdrmfhremvhq;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

