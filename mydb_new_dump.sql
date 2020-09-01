--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2020-08-27 09:43:19

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

SET default_with_oids = false;

--
-- TOC entry 206 (class 1259 OID 122914)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 122912)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 208 (class 1259 OID 122924)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 122922)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 204 (class 1259 OID 122906)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 122904)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 210 (class 1259 OID 122932)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 122942)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 122940)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 209 (class 1259 OID 122930)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 214 (class 1259 OID 122950)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 122948)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 198 (class 1259 OID 122880)
-- Name: data_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_log (
    year_construct integer NOT NULL,
    year_commiss integer NOT NULL,
    total_area double precision NOT NULL,
    total_area_resident double precision NOT NULL,
    total_area_none_resident double precision NOT NULL,
    total_count integer NOT NULL,
    count_resident integer NOT NULL,
    max_floors integer NOT NULL,
    min_floors integer NOT NULL,
    total_area_part double precision,
    count_none_resident integer,
    id integer
);


ALTER TABLE public.data_log OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 90119)
-- Name: data_main; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_main (
    street character(256) NOT NULL,
    year_construct integer NOT NULL,
    year_commiss integer NOT NULL,
    total_area double precision NOT NULL,
    total_area_resident double precision NOT NULL,
    total_area_none_resident double precision NOT NULL,
    total_count integer NOT NULL,
    count_resident integer NOT NULL,
    max_floors integer NOT NULL,
    min_floors integer NOT NULL,
    house character(256),
    cluster character(256),
    series character(256),
    total_area_part double precision,
    label integer,
    status integer DEFAULT '-1'::integer NOT NULL,
    count_none_resident integer,
    id integer NOT NULL
);


ALTER TABLE public.data_main OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 106506)
-- Name: data_main_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.data_main ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.data_main_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 123010)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 123008)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 215
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 202 (class 1259 OID 122896)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 122894)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 200 (class 1259 OID 122885)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 122883)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 217 (class 1259 OID 123041)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 131072)
-- Name: neights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.neights (
    id_neigh integer,
    id_data integer
);


ALTER TABLE public.neights OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 131075)
-- Name: range_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.range_table (
    min_ double precision NOT NULL,
    max_ double precision NOT NULL,
    label integer NOT NULL
);


ALTER TABLE public.range_table OWNER TO postgres;

--
-- TOC entry 2764 (class 2604 OID 122917)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 122927)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 122909)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 122935)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 122945)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 122953)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 123013)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2762 (class 2604 OID 122899)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 122888)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2960 (class 0 OID 122914)
-- Dependencies: 206
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 122924)
-- Dependencies: 208
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 122906)
-- Dependencies: 204
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
\.


--
-- TOC entry 2964 (class 0 OID 122932)
-- Dependencies: 210
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$F5HYgU8Bm5lh$38yK6juDoiSjkKBStLoQYoUkyiWG6KA1WcoW7ol3QDg=	2020-07-30 21:59:21.415782+03	t	compic				t	t	2020-07-30 21:58:27.645766+03
\.


--
-- TOC entry 2966 (class 0 OID 122942)
-- Dependencies: 212
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 122950)
-- Dependencies: 214
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 122880)
-- Dependencies: 198
-- Data for Name: data_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_log (year_construct, year_commiss, total_area, total_area_resident, total_area_none_resident, total_count, count_resident, max_floors, min_floors, total_area_part, count_none_resident, id) FROM stdin;
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
-1	-1	-1	-1	-1	-1	-1	-1	-1	1	-1	5813
-1	-1	-1	-1	-1	-1	-1	-1	-1	2	-1	5813
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
-1	-1	-1	-1	-1	-1	-1	-1	-1	1	-1	5850
-1	-1	-1	-1	-1	-1	-1	-1	-1	2	-1	5850
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
0	0	0	0	0	0	0	0	0	0	0	5858
0	0	0	0	0	0	0	0	0	0	0	5800
0	0	0	0	0	0	0	0	0	0	0	5799
0	0	0	0	0	0	0	0	0	0	0	5806
0	0	0	0	0	0	0	0	0	0	0	5808
0	0	0	0	0	0	0	0	0	0	0	5859
\.


--
-- TOC entry 2950 (class 0 OID 90119)
-- Dependencies: 196
-- Data for Name: data_main; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_main (street, year_construct, year_commiss, total_area, total_area_resident, total_area_none_resident, total_count, count_resident, max_floors, min_floors, house, cluster, series, total_area_part, label, status, count_none_resident, id) FROM stdin;
Дмитровское ш.                                                                                                                                                                                                                                                  	1970	1970	3638.90000000000009	3638.90000000000009	0	84	84	12	12	57к2                                                                                                                                                                                                                                                            	4                                                                                                                                                                                                                                                               	П-18                                                                                                                                                                                                                                                            	1433	0	-3	0	5858
Тайнинская ул.                                                                                                                                                                                                                                                  	1960	1960	1010	640	45	25	24	3	3	13                                                                                                                                                                                                                                                              	1                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	614	1	-3	1	5800
Тайнинская ул.                                                                                                                                                                                                                                                  	1961	1961	975	650	0	24	24	3	3	11                                                                                                                                                                                                                                                              	1                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	614	1	-3	0	5799
Путевой пр.                                                                                                                                                                                                                                                     	1960	1960	1033.20000000000005	997.299999999999955	35.8999999999999986	18	18	3	3	16                                                                                                                                                                                                                                                              	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	106	1	-1	0	5831
Широкая ул.                                                                                                                                                                                                                                                     	1998	1998	11172	11172	0	206	202	17	17	6к4                                                                                                                                                                                                                                                             	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	1940	0	-1	4	5823
Тайнинская ул.                                                                                                                                                                                                                                                  	1969	1969	7123	4928	0	144	144	9	9	22                                                                                                                                                                                                                                                              	3                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	2111	2	-3	0	5806
Матроса Железняка б-р                                                                                                                                                                                                                                           	1998	1998	7431.19999999999982	7382.19999999999982	49	137	136	17	17	30к2                                                                                                                                                                                                                                                            	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	14913.6000000000004	3	-1	1	5812
Тайнинская ул.                                                                                                                                                                                                                                                  	1970	1970	4483	2209	996	85	81	12	12	24                                                                                                                                                                                                                                                              	4                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	800	2	-1	4	5805
Сивашская ул.                                                                                                                                                                                                                                                   	1997	1997	11293	10593	681.100000000000023	194	192	17	17	7к2                                                                                                                                                                                                                                                             	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	2029	4	-1	2	5828
Тайнинская ул.                                                                                                                                                                                                                                                  	1969	1969	7069	4772	0	144	144	9	9	18                                                                                                                                                                                                                                                              	3                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	2343	2	-3	0	5808
Богданова ул.                                                                                                                                                                                                                                                   	1970	1970	5271.89999999999964	3622	1	85	84	12	12	12                                                                                                                                                                                                                                                              	4                                                                                                                                                                                                                                                               	П-18                                                                                                                                                                                                                                                            	1648.90000000000009	2	-1	1	5856
Тайнинская ул.                                                                                                                                                                                                                                                  	1998	1998	11379	6266	503	205	196	17	17	15к1                                                                                                                                                                                                                                                            	5                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	2528	3	-1	9	5802
Кировоградская ул.                                                                                                                                                                                                                                              	1998	1998	7452.5	7401	52	136	135	17	17	8к5                                                                                                                                                                                                                                                             	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	2302.40000000000009	3	-1	1	5811
Филевский б-р.                                                                                                                                                                                                                                                  	1997	1997	26344.5	24785	1559.5	453	448	17	17	40                                                                                                                                                                                                                                                              	6                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	9334.5	-1	-1	5	5852
Загородное ш.                                                                                                                                                                                                                                                   	1970	1970	4643.19999999999982	3454.30000000000018	1188.90000000000009	80	80	12	12	7к1                                                                                                                                                                                                                                                             	4                                                                                                                                                                                                                                                               	П-18/22                                                                                                                                                                                                                                                         	433.899999999999977	-1	-1	0	5853
Цюрупы ул.                                                                                                                                                                                                                                                      	1998	1998	11281.2999999999993	11226.6000000000004	54.7000000000000028	195	194	17	17	16к1                                                                                                                                                                                                                                                            	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	2178.69999999999982	5	-1	1	5822
г. Щербинка, ул. Мостотреста                                                                                                                                                                                                                                    	1961	1961	1538.70000000000005	1538.70000000000005	0	36	36	3	3	11                                                                                                                                                                                                                                                              	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	124.099999999999994	5	-1	0	5837
Тайнинская ул.                                                                                                                                                                                                                                                  	1998	1998	7512	4269	91	136	133	17	17	13к2                                                                                                                                                                                                                                                            	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	2939	12	-1	3	5801
Загородное ш.                                                                                                                                                                                                                                                   	1970	1970	3633.19999999999982	3633.19999999999982	0	84	84	12	12	10к6                                                                                                                                                                                                                                                            	4                                                                                                                                                                                                                                                               	П-18/22                                                                                                                                                                                                                                                         	452.300000000000011	-1	-1	0	5854
п. Воскресенское, п. Воскресенское                                                                                                                                                                                                                              	1960	1960	1040.90000000000009	970	0	24	24	3	3	1                                                                                                                                                                                                                                                               	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	71	-1	-1	0	5834
Сивашская ул.                                                                                                                                                                                                                                                   	1997	1997	11337	10643	675.299999999999955	194	192	17	17	7к1                                                                                                                                                                                                                                                             	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	2034	-1	-1	2	5827
Братиславская ул.                                                                                                                                                                                                                                               	1998	1998	26279.2000000000007	25748	528	481	467	17	17	19к2                                                                                                                                                                                                                                                            	6                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	10507	-1	-1	14	5843
Бакинская ул.                                                                                                                                                                                                                                                   	1970	1970	3650.40000000000009	3650.40000000000009	0	84	84	12	12	11                                                                                                                                                                                                                                                              	4                                                                                                                                                                                                                                                               	П-18/22                                                                                                                                                                                                                                                         	480	0	-3	0	5859
Владимирская 3-я ул.                                                                                                                                                                                                                                            	1970	1970	6261.69999999999982	3466.40000000000009	965.100000000000023	83	81	12	12	25к1                                                                                                                                                                                                                                                            	4                                                                                                                                                                                                                                                               	П-18                                                                                                                                                                                                                                                            	1830.20000000000005	13	-1	2	5857
Тайнинская ул.                                                                                                                                                                                                                                                  	1998	1998	7532	4276	91	138	135	17	17	17к2                                                                                                                                                                                                                                                            	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	2939	0	-2	3	5804
Барышиха ул.                                                                                                                                                                                                                                                    	1998	1998	7429.89999999999964	6970	460	133	128	17	17	22к1                                                                                                                                                                                                                                                            	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	1323	0	-2	5	5809
Ясный пр.                                                                                                                                                                                                                                                       	1998	1998	7464	7414	49	136	135	17	17	25                                                                                                                                                                                                                                                              	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	1250	0	-1	1	5815
Ангарская ул.                                                                                                                                                                                                                                                   	1998	1998	11248	11199	49	190	190	17	17	22к4                                                                                                                                                                                                                                                            	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	4625	-1	-1	0	5819
Студеный пр.                                                                                                                                                                                                                                                    	1998	1998	7445	7396	49	137	134	17	17	4к5                                                                                                                                                                                                                                                             	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	1319	0	-2	3	5818
Филевская 2-я ул.                                                                                                                                                                                                                                               	1998	1998	11208	11208	0	203	203	17	17	7к1                                                                                                                                                                                                                                                             	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	3800	4	-1	0	5821
Дачная ул.                                                                                                                                                                                                                                                      	1960	1960	1259.40000000000009	1169	45	24	24	3	3	4                                                                                                                                                                                                                                                               	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	87	3	-1	0	5829
Ангарская ул.                                                                                                                                                                                                                                                   	1997	1997	11206	11157	49	204	203	17	17	16                                                                                                                                                                                                                                                              	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	4950	4	-1	1	5824
Графский пер.                                                                                                                                                                                                                                                   	1960	1960	1122	982	140	11	11	3	3	10/12к2                                                                                                                                                                                                                                                         	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	693	3	-1	0	5835
Путевой пр.                                                                                                                                                                                                                                                     	1960	1960	1103	996.299999999999955	0	18	18	3	3	18                                                                                                                                                                                                                                                              	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	107	3	-1	0	5832
п. Воскресенское, п. Воскресенское                                                                                                                                                                                                                              	1961	1961	1075.90000000000009	966	0	24	24	3	3	8                                                                                                                                                                                                                                                               	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	73	-1	-1	0	5838
Графский пер.                                                                                                                                                                                                                                                   	1960	1960	1122	982	140	11	11	3	3	10/12к2                                                                                                                                                                                                                                                         	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	693	-1	-1	0	5839
Стандартная ул.                                                                                                                                                                                                                                                 	1961	1961	1587.70000000000005	1587.70000000000005	0	24	24	3	3	15к1                                                                                                                                                                                                                                                            	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	155	-1	-1	0	5840
Стандартная ул.                                                                                                                                                                                                                                                 	1961	1961	1587.70000000000005	1587.70000000000005	0	24	24	3	3	15к1                                                                                                                                                                                                                                                            	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	155	5	-1	0	5836
Братиславская ул.                                                                                                                                                                                                                                               	1998	1998	30346.9000000000015	23602	6764	413	384	17	17	27к1                                                                                                                                                                                                                                                            	                                                                                                                                                                                                                                                                	ПД-4/12                                                                                                                                                                                                                                                         	3119	-1	-1	29	5844
Волжский б-р                                                                                                                                                                                                                                                    	1998	1998	26225.2000000000007	26022.4000000000015	202.800000000000011	482	472	17	17	25к1                                                                                                                                                                                                                                                            	6                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	187.300000000000011	-1	-1	10	5846
Братиславская ул.                                                                                                                                                                                                                                               	1998	1998	30365.5999999999985	23626	6740	394	384	17	17	31к1                                                                                                                                                                                                                                                            	                                                                                                                                                                                                                                                                	                                                                                                                                                                                                                                                                	3119	2	-1	10	5845
г. Зеленоград                                                                                                                                                                                                                                                   	1970	1970	7104	4894	NaN	144	144	9	9	200А                                                                                                                                                                                                                                                            	                                                                                                                                                                                                                                                                	П-49 Д                                                                                                                                                                                                                                                          	NaN	2	-2	0	5866
Тайнинская ул.                                                                                                                                                                                                                                                  	1970	1970	5217	2195	1715	87	81	12	12	20                                                                                                                                                                                                                                                              	4                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	800	0	-1	6	5807
п. Рязановское, п. Фабрики им 1 Мая                                                                                                                                                                                                                             	1960	1960	1815.90000000000009	980	136.199999999999989	26	24	3	3	43                                                                                                                                                                                                                                                              	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	699	1	-2	2	5833
Загородное ш.                                                                                                                                                                                                                                                   	1997	1997	11250.7000000000007	10534.2999999999993	716.399999999999977	189	189	17	17	4к2                                                                                                                                                                                                                                                             	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	1744.09999999999991	2	-2	0	5826
г. Зеленоград                                                                                                                                                                                                                                                   	1970	1970	7105.30000000000018	4829	NaN	142	142	9	9	200В                                                                                                                                                                                                                                                            	                                                                                                                                                                                                                                                                	П-49 Д                                                                                                                                                                                                                                                          	NaN	2	-1	0	5868
г. Щербинка, ул. Мостотреста                                                                                                                                                                                                                                    	1961	1961	1538.70000000000005	1538.70000000000005	0	36	36	3	3	11                                                                                                                                                                                                                                                              	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	124.099999999999994	1	-1	0	5841
Барышиха ул.                                                                                                                                                                                                                                                    	1998	1998	11228.1000000000004	10528	700	197	191	17	17	20                                                                                                                                                                                                                                                              	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	1943	2	-1	6	5820
п. Воскресенское, п. Воскресенское                                                                                                                                                                                                                              	1961	1961	1075.90000000000009	966	0	24	24	3	3	8                                                                                                                                                                                                                                                               	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	73	1	-1	0	5842
 Широкая ул.                                                                                                                                                                                                                                                    	1998	1998	7490	7034	456	130	127	17	17	5к4                                                                                                                                                                                                                                                             	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	1385	0	-1	3	5817
Балаклавский пр-кт.                                                                                                                                                                                                                                             	1997	1997	11270	11221	49	203	203	17	17	50                                                                                                                                                                                                                                                              	5                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	2071	8	-1	0	5825
Открытое ш.                                                                                                                                                                                                                                                     	1998	1998	7435.89999999999964	7413.30000000000018	23	138	135	17	17	24к3                                                                                                                                                                                                                                                            	2                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	2111	13	-1	3	5813
Ангарская ул.                                                                                                                                                                                                                                                   	1998	1998	7412.5	7413	63	136	135	17	17	22к3                                                                                                                                                                                                                                                            	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	3149	13	-1	1	5810
Тайнинская ул.                                                                                                                                                                                                                                                  	1998	1998	26364	14245	1782	463	446	17	17	17к1                                                                                                                                                                                                                                                            	6                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	5493	14	-1	17	5803
Плеханова ул.                                                                                                                                                                                                                                                   	1998	1998	7488.5	7439	49.5	135	134	17	17	25к6                                                                                                                                                                                                                                                            	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	2318.30000000000018	0	-1	1	5814
Краснолиманская ул.                                                                                                                                                                                                                                             	1960	1960	1535	1535	0	24	24	3	3	23                                                                                                                                                                                                                                                              	1                                                                                                                                                                                                                                                               	ИП                                                                                                                                                                                                                                                              	773	1	-1	0	5830
Богданова ул.                                                                                                                                                                                                                                                   	1970	1970	5049.10000000000036	3649	0	85	84	12	12	8                                                                                                                                                                                                                                                               	4                                                                                                                                                                                                                                                               	П-18                                                                                                                                                                                                                                                            	1400.09999999999991	0	-2	1	5855
Наметкина ул.                                                                                                                                                                                                                                                   	1998	1998	26186.9000000000015	26043.2000000000007	143.699999999999989	462	460	17	17	9к1                                                                                                                                                                                                                                                             	6                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	5009	2	-1	2	5847
Ясный пр.                                                                                                                                                                                                                                                       	1998	1998	7463.10000000000036	7417	49	136	135	17	17	25к2                                                                                                                                                                                                                                                            	2                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	1250	0	-1	1	5816
Перервинский б-р                                                                                                                                                                                                                                                	1998	1998	30920.9000000000015	30757.5999999999985	162.699999999999989	483	474	17	17	8                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	                                                                                                                                                                                                                                                                	2111	2	-1	9	5850
Наметкина ул.                                                                                                                                                                                                                                                   	1998	1998	26162	25801.5999999999985	360.399999999999977	454	450	17	17	9к3                                                                                                                                                                                                                                                             	6                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	5071.60000000000036	-1	-1	4	5848
Новомарьинская ул.                                                                                                                                                                                                                                              	1998	1998	20372.7000000000007	20112.4000000000015	113.200000000000003	367	364	17	17	17                                                                                                                                                                                                                                                              	                                                                                                                                                                                                                                                                	                                                                                                                                                                                                                                                                	113.200000000000003	-1	-1	3	5849
Пятницкое ш.                                                                                                                                                                                                                                                    	1997	1997	23462.5	22752	711	424	415	17	17	16                                                                                                                                                                                                                                                              	6                                                                                                                                                                                                                                                               	П-44                                                                                                                                                                                                                                                            	4437	-1	-1	9	5851
Василисы Кожиной ул.                                                                                                                                                                                                                                            	1970	1970	4604.5	3492	1112.5	82	80	12	12	10                                                                                                                                                                                                                                                              	4                                                                                                                                                                                                                                                               	П-18                                                                                                                                                                                                                                                            	2311.5	-1	-1	2	5860
Василисы Кожиной ул.                                                                                                                                                                                                                                            	1970	1970	4680.10000000000036	3460	1220.09999999999991	81	80	12	12	12                                                                                                                                                                                                                                                              	4                                                                                                                                                                                                                                                               	П-18                                                                                                                                                                                                                                                            	1829.90000000000009	-1	-1	1	5861
Коминтерна ул.                                                                                                                                                                                                                                                  	1970	1970	3656	2322	0	84	84	12	12	16                                                                                                                                                                                                                                                              	4                                                                                                                                                                                                                                                               	П-18/22                                                                                                                                                                                                                                                         	1334	-1	-1	0	5862
Винницкая ул.                                                                                                                                                                                                                                                   	1970	1970	7649	7439	195.699999999999989	143	143	9	9	3                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	АМ-1605                                                                                                                                                                                                                                                         	1615.79999999999995	-1	-1	0	5863
Винницкая ул.                                                                                                                                                                                                                                                   	1970	1970	7606.89999999999964	7399	188.900000000000006	143	143	9	9	9                                                                                                                                                                                                                                                               	                                                                                                                                                                                                                                                                	АМ-1605                                                                                                                                                                                                                                                         	1654.09999999999991	-1	-1	0	5864
Винницкая ул.                                                                                                                                                                                                                                                   	1970	1970	7537	7330	187.800000000000011	143	143	9	9	15                                                                                                                                                                                                                                                              	                                                                                                                                                                                                                                                                	АМ-1605                                                                                                                                                                                                                                                         	1601.5	-1	-1	0	5865
Образцова ул.                                                                                                                                                                                                                                                   	1970	1970	7849.39999999999964	7171	678.399999999999977	143	141	9	9	24                                                                                                                                                                                                                                                              	                                                                                                                                                                                                                                                                	П-49 Д                                                                                                                                                                                                                                                          	2358.59999999999991	-1	-1	2	5869
Октябрьская ул.                                                                                                                                                                                                                                                 	1970	1970	7865.5	7036	830	142	141	9	9	35                                                                                                                                                                                                                                                              	                                                                                                                                                                                                                                                                	П-49 Д                                                                                                                                                                                                                                                          	2225	-1	-1	1	5870
Октябрьская ул.                                                                                                                                                                                                                                                 	1970	1970	7414	6778	635	144	141	9	9	89                                                                                                                                                                                                                                                              	                                                                                                                                                                                                                                                                	П-49 Д                                                                                                                                                                                                                                                          	2132	-1	-1	3	5871
г. Зеленоград                                                                                                                                                                                                                                                   	1970	1970	7100.60000000000036	4904	NaN	144	144	9	9	200Б                                                                                                                                                                                                                                                            	                                                                                                                                                                                                                                                                	П-49 Д                                                                                                                                                                                                                                                          	NaN	2	-1	0	5867
Снайперская ул.                                                                                                                                                                                                                                                 	1970	1970	7119.39999999999964	4759.39999999999964	0	144	144	9	9	6к3                                                                                                                                                                                                                                                             	                                                                                                                                                                                                                                                                	П-49 Д                                                                                                                                                                                                                                                          	2360	2	-1	0	5872
\.


--
-- TOC entry 2970 (class 0 OID 123010)
-- Dependencies: 216
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 122896)
-- Dependencies: 202
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
\.


--
-- TOC entry 2954 (class 0 OID 122885)
-- Dependencies: 200
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-07-30 21:54:52.685682+03
2	auth	0001_initial	2020-07-30 21:54:52.832714+03
3	admin	0001_initial	2020-07-30 21:54:53.092758+03
4	admin	0002_logentry_remove_auto_add	2020-07-30 21:54:53.150774+03
5	admin	0003_logentry_add_action_flag_choices	2020-07-30 21:54:53.180782+03
6	contenttypes	0002_remove_content_type_name	2020-07-30 21:54:53.249801+03
7	auth	0002_alter_permission_name_max_length	2020-07-30 21:54:53.260803+03
8	auth	0003_alter_user_email_max_length	2020-07-30 21:54:53.280805+03
9	auth	0004_alter_user_username_opts	2020-07-30 21:54:53.301812+03
10	auth	0005_alter_user_last_login_null	2020-07-30 21:54:53.321821+03
11	auth	0006_require_contenttypes_0002	2020-07-30 21:54:53.326817+03
12	auth	0007_alter_validators_add_error_messages	2020-07-30 21:54:53.345823+03
13	auth	0008_alter_user_username_max_length	2020-07-30 21:54:53.392839+03
14	auth	0009_alter_user_last_name_max_length	2020-07-30 21:54:53.41184+03
15	auth	0010_alter_group_name_max_length	2020-07-30 21:54:53.434846+03
16	auth	0011_update_proxy_permissions	2020-07-30 21:54:53.454849+03
17	sessions	0001_initial	2020-07-30 21:54:53.489865+03
\.


--
-- TOC entry 2971 (class 0 OID 123041)
-- Dependencies: 217
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
4x8v50u81srpbuk18n13ljhs9b3i76rz	Zjk0MjY3OGM2ZTE3ZWU3ZmNhMmQ4M2ZmM2QyZDUyNDU5MmU3MmYyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YzQ2ZjBmN2JiYmE4ZmQ5NjZhZjc5MTVmMDkzMzNmZmUzNjBlYjFkIn0=	2020-08-13 21:59:21.418889+03
qvjr8kmssn99gtvou0rv45rldhtsc9za	ZjdhNzZlOGU0MjIwNDg3NjEwZjcwZWYyMDYxMjg4ZWVlYzMyMWVkYTp7Imxpc3RfaW5kZXgiOls1ODU1XX0=	2020-09-03 12:49:48.192551+03
\.


--
-- TOC entry 2972 (class 0 OID 131072)
-- Dependencies: 218
-- Data for Name: neights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.neights (id_neigh, id_data) FROM stdin;
5736	5739
5730	5794
5729	5775
5727	5779
5727	5780
5727	5781
5727	5782
5735	5797
5793	5798
5776	5777
5759	5764
5759	5765
5759	5766
5759	5767
5725	5765
5740	5752
5806	5809
5806	5818
5799	5833
5806	5826
5808	5804
\.


--
-- TOC entry 2973 (class 0 OID 131075)
-- Dependencies: 219
-- Data for Name: range_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.range_table (min_, max_, label) FROM stdin;
5000	7000	2
4300	6000	1
3550	3900	0
\.


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 24, true);


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 197
-- Name: data_main_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_main_id_seq', 5872, true);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 215
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 6, true);


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 17, true);


--
-- TOC entry 2786 (class 2606 OID 123039)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2791 (class 2606 OID 122966)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2794 (class 2606 OID 122929)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 122919)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 122957)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2783 (class 2606 OID 122911)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 122947)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 122981)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2796 (class 2606 OID 122937)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 122955)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 122995)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2799 (class 2606 OID 123033)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2772 (class 2606 OID 106515)
-- Name: data_main data_main_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_main
    ADD CONSTRAINT data_main_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 123019)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 122903)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2778 (class 2606 OID 122901)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 122893)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 123048)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2784 (class 1259 OID 123040)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2789 (class 1259 OID 122977)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2792 (class 1259 OID 122978)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2779 (class 1259 OID 122963)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2800 (class 1259 OID 122993)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2803 (class 1259 OID 122992)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2806 (class 1259 OID 123007)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2809 (class 1259 OID 123006)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2797 (class 1259 OID 123034)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2812 (class 1259 OID 123030)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2815 (class 1259 OID 123031)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2816 (class 1259 OID 123050)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2819 (class 1259 OID 123049)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2822 (class 2606 OID 122972)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2821 (class 2606 OID 122967)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2820 (class 2606 OID 122958)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2824 (class 2606 OID 122987)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2823 (class 2606 OID 122982)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2826 (class 2606 OID 123001)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2825 (class 2606 OID 122996)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2827 (class 2606 OID 123020)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2828 (class 2606 OID 123025)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-08-27 09:43:19

--
-- PostgreSQL database dump complete
--

