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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sidn77;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO sidn77;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sidn77;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO sidn77;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sidn77;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO sidn77;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO sidn77;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO sidn77;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO sidn77;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO sidn77;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO sidn77;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO sidn77;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO sidn77;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO sidn77;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sidn77;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO sidn77;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO sidn77;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO sidn77;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sidn77;

--
-- Name: vampire_address; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE vampire_address (
    aid integer NOT NULL,
    city character varying(20) NOT NULL,
    state character varying(20) NOT NULL,
    country character varying(20) NOT NULL
);


ALTER TABLE public.vampire_address OWNER TO sidn77;

--
-- Name: vampire_address_aid_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE vampire_address_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vampire_address_aid_seq OWNER TO sidn77;

--
-- Name: vampire_address_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE vampire_address_aid_seq OWNED BY vampire_address.aid;


--
-- Name: vampire_bloodbank; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE vampire_bloodbank (
    name character varying(200) NOT NULL,
    bbid integer NOT NULL,
    longitude numeric(5,2) NOT NULL,
    latitude numeric(5,2) NOT NULL,
    aid_id integer NOT NULL
);


ALTER TABLE public.vampire_bloodbank OWNER TO sidn77;

--
-- Name: vampire_bloodbank_bbid_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE vampire_bloodbank_bbid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vampire_bloodbank_bbid_seq OWNER TO sidn77;

--
-- Name: vampire_bloodbank_bbid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE vampire_bloodbank_bbid_seq OWNED BY vampire_bloodbank.bbid;


--
-- Name: vampire_bloodsample; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE vampire_bloodsample (
    bsid integer NOT NULL,
    donation_date timestamp with time zone NOT NULL,
    volume numeric(5,2) NOT NULL,
    bbid_id integer NOT NULL,
    did_id integer NOT NULL
);


ALTER TABLE public.vampire_bloodsample OWNER TO sidn77;

--
-- Name: vampire_bloodsample_bsid_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE vampire_bloodsample_bsid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vampire_bloodsample_bsid_seq OWNER TO sidn77;

--
-- Name: vampire_bloodsample_bsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE vampire_bloodsample_bsid_seq OWNED BY vampire_bloodsample.bsid;


--
-- Name: vampire_donor; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE vampire_donor (
    name character varying(200) NOT NULL,
    age integer NOT NULL,
    did integer NOT NULL,
    blood_type character varying(2) NOT NULL,
    aid_id integer NOT NULL,
    password character varying(200) NOT NULL,
    username character varying(200) NOT NULL
);


ALTER TABLE public.vampire_donor OWNER TO sidn77;

--
-- Name: vampire_donor_did_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE vampire_donor_did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vampire_donor_did_seq OWNER TO sidn77;

--
-- Name: vampire_donor_did_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE vampire_donor_did_seq OWNED BY vampire_donor.did;


--
-- Name: vampire_hospital; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE vampire_hospital (
    name character varying(20) NOT NULL,
    hid integer NOT NULL,
    longitude numeric(5,2) NOT NULL,
    latitude numeric(5,2) NOT NULL,
    aid_id integer NOT NULL,
    password character varying(200) NOT NULL,
    username character varying(200) NOT NULL
);


ALTER TABLE public.vampire_hospital OWNER TO sidn77;

--
-- Name: vampire_hospital_hid_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE vampire_hospital_hid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vampire_hospital_hid_seq OWNER TO sidn77;

--
-- Name: vampire_hospital_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE vampire_hospital_hid_seq OWNED BY vampire_hospital.hid;


--
-- Name: vampire_reserves; Type: TABLE; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE TABLE vampire_reserves (
    id integer NOT NULL,
    date_reserved timestamp with time zone NOT NULL,
    cost integer NOT NULL,
    bsid_id integer NOT NULL,
    hid_id integer NOT NULL
);


ALTER TABLE public.vampire_reserves OWNER TO sidn77;

--
-- Name: vampire_reserves_id_seq; Type: SEQUENCE; Schema: public; Owner: sidn77
--

CREATE SEQUENCE vampire_reserves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vampire_reserves_id_seq OWNER TO sidn77;

--
-- Name: vampire_reserves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sidn77
--

ALTER SEQUENCE vampire_reserves_id_seq OWNED BY vampire_reserves.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: aid; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_address ALTER COLUMN aid SET DEFAULT nextval('vampire_address_aid_seq'::regclass);


--
-- Name: bbid; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_bloodbank ALTER COLUMN bbid SET DEFAULT nextval('vampire_bloodbank_bbid_seq'::regclass);


--
-- Name: bsid; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_bloodsample ALTER COLUMN bsid SET DEFAULT nextval('vampire_bloodsample_bsid_seq'::regclass);


--
-- Name: did; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_donor ALTER COLUMN did SET DEFAULT nextval('vampire_donor_did_seq'::regclass);


--
-- Name: hid; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_hospital ALTER COLUMN hid SET DEFAULT nextval('vampire_hospital_hid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_reserves ALTER COLUMN id SET DEFAULT nextval('vampire_reserves_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add address	7	add_address
20	Can change address	7	change_address
21	Can delete address	7	delete_address
22	Can add donor	8	add_donor
23	Can change donor	8	change_donor
24	Can delete donor	8	delete_donor
25	Can add blood bank	9	add_bloodbank
26	Can change blood bank	9	change_bloodbank
27	Can delete blood bank	9	delete_bloodbank
28	Can add blood sample	10	add_bloodsample
29	Can change blood sample	10	change_bloodsample
30	Can delete blood sample	10	delete_bloodsample
31	Can add hospital	11	add_hospital
32	Can change hospital	11	change_hospital
33	Can delete hospital	11	delete_hospital
34	Can add reserves	12	add_reserves
35	Can change reserves	12	change_reserves
36	Can delete reserves	12	delete_reserves
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('auth_permission_id_seq', 36, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$rRynRklgWX9Q$DGfktwbZFzaSDNFDuxWomU6EQa9PJtKKtGgmRlM6ugE=	2016-04-19 17:04:43.338813+05:30	t	sidn77			sidn77@github.com	t	t	2016-04-13 02:04:11.85473+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-04-13 02:14:07.895965+05:30	1	Address object	1	Added.	7	1
2	2016-04-13 02:46:26.149516+05:30	3	Delhi India New-Delhi	2	Changed country.	7	1
3	2016-04-13 02:46:32.038119+05:30	1	uio ftyu qwer	3		7	1
4	2016-04-13 02:47:22.714094+05:30	1	Bhat Blood Bank	1	Added.	9	1
5	2016-04-13 02:47:49.072523+05:30	2	Narang Blood Bank	1	Added.	9	1
6	2016-04-13 02:48:18.303955+05:30	1	Bollu	1	Added.	8	1
7	2016-04-13 02:48:35.890282+05:30	2	Siddhant	1	Added.	8	1
8	2016-04-13 02:48:59.607885+05:30	1	Bhat Hospital	1	Added.	11	1
9	2016-04-13 02:49:12.950326+05:30	2	Narang Hospital	1	Added.	11	1
10	2016-04-13 02:49:47.804089+05:30	1	1	1	Added.	10	1
11	2016-04-13 02:50:04.434282+05:30	2	2	1	Added.	10	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 11, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	vampire	address
8	vampire	donor
9	vampire	bloodbank
10	vampire	bloodsample
11	vampire	hospital
12	vampire	reserves
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('django_content_type_id_seq', 12, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	vampire	0001_initial	2016-04-13 01:44:44.634245+05:30
2	contenttypes	0001_initial	2016-04-13 01:59:18.014867+05:30
3	auth	0001_initial	2016-04-13 01:59:18.883455+05:30
4	contenttypes	0002_remove_content_type_name	2016-04-13 01:59:19.015941+05:30
5	auth	0002_alter_permission_name_max_length	2016-04-13 01:59:19.038338+05:30
6	auth	0003_alter_user_email_max_length	2016-04-13 01:59:19.07185+05:30
7	auth	0004_alter_user_username_opts	2016-04-13 01:59:19.097598+05:30
8	auth	0005_alter_user_last_login_null	2016-04-13 01:59:19.127198+05:30
9	auth	0006_require_contenttypes_0002	2016-04-13 01:59:19.138467+05:30
10	auth	0007_alter_validators_add_error_messages	2016-04-13 01:59:19.157988+05:30
11	admin	0001_initial	2016-04-13 02:00:20.321121+05:30
12	admin	0002_logentry_remove_auto_add	2016-04-13 02:00:20.341705+05:30
13	sessions	0001_initial	2016-04-13 02:00:20.553093+05:30
14	vampire	0002_auto_20160419_1501	2016-04-19 15:01:39.52447+05:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('django_migrations_id_seq', 14, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
dcq71kq48j4logs81o4rvf4zstfd4688	ZGFlMjY3MmU4YmFkYTQ1YTMyZjBhMjBmNGNhNGMwNTMyYTU5N2YzNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhYjJjOGU5NTI1ZWJjZDQ0N2FkMDc2Zjk1OWYzYmUyNTkyZWVmMGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-27 02:04:31.537501+05:30
ucirznjppi61w1eq1b3vyxyoj4pdu282	ZGFlMjY3MmU4YmFkYTQ1YTMyZjBhMjBmNGNhNGMwNTMyYTU5N2YzNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhYjJjOGU5NTI1ZWJjZDQ0N2FkMDc2Zjk1OWYzYmUyNTkyZWVmMGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-05-03 17:04:43.350145+05:30
\.


--
-- Data for Name: vampire_address; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY vampire_address (aid, city, state, country) FROM stdin;
2	Manipal	India	Karnataka
3	Delhi	India	New-Delhi
4	AnonymousUser	AnonymousUser	AnonymousUser
5	AnonymousUser	AnonymousUser	AnonymousUser
6	AnonymousUser	AnonymousUser	AnonymousUser
7	AnonymousUser	AnonymousUser	AnonymousUser
8	AnonymousUser	AnonymousUser	AnonymousUser
16	1	1	1
17	1	1	1
\.


--
-- Name: vampire_address_aid_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('vampire_address_aid_seq', 17, true);


--
-- Data for Name: vampire_bloodbank; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY vampire_bloodbank (name, bbid, longitude, latitude, aid_id) FROM stdin;
Bhat Blood Bank	1	56.13	34.78	2
Narang Blood Bank	2	45.78	54.78	3
\.


--
-- Name: vampire_bloodbank_bbid_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('vampire_bloodbank_bbid_seq', 2, true);


--
-- Data for Name: vampire_bloodsample; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY vampire_bloodsample (bsid, donation_date, volume, bbid_id, did_id) FROM stdin;
1	2016-04-13 02:49:19+05:30	56.66	1	1
2	2016-04-13 02:49:55+05:30	45.66	2	2
\.


--
-- Name: vampire_bloodsample_bsid_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('vampire_bloodsample_bsid_seq', 2, true);


--
-- Data for Name: vampire_donor; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY vampire_donor (name, age, did, blood_type, aid_id, password, username) FROM stdin;
Bollu	20	1	O-	2	0000	#
Siddhant	20	2	O+	3	0000	#
\.


--
-- Name: vampire_donor_did_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('vampire_donor_did_seq', 4, true);


--
-- Data for Name: vampire_hospital; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY vampire_hospital (name, hid, longitude, latitude, aid_id, password, username) FROM stdin;
Bhat Hospital	1	54.67	43.67	2	0000	#
Narang Hospital	2	45.67	34.56	3	0000	#
\.


--
-- Name: vampire_hospital_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('vampire_hospital_hid_seq', 2, true);


--
-- Data for Name: vampire_reserves; Type: TABLE DATA; Schema: public; Owner: sidn77
--

COPY vampire_reserves (id, date_reserved, cost, bsid_id, hid_id) FROM stdin;
\.


--
-- Name: vampire_reserves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sidn77
--

SELECT pg_catalog.setval('vampire_reserves_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: vampire_address_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY vampire_address
    ADD CONSTRAINT vampire_address_pkey PRIMARY KEY (aid);


--
-- Name: vampire_bloodbank_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY vampire_bloodbank
    ADD CONSTRAINT vampire_bloodbank_pkey PRIMARY KEY (bbid);


--
-- Name: vampire_bloodsample_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY vampire_bloodsample
    ADD CONSTRAINT vampire_bloodsample_pkey PRIMARY KEY (bsid);


--
-- Name: vampire_donor_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY vampire_donor
    ADD CONSTRAINT vampire_donor_pkey PRIMARY KEY (did);


--
-- Name: vampire_hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY vampire_hospital
    ADD CONSTRAINT vampire_hospital_pkey PRIMARY KEY (hid);


--
-- Name: vampire_reserves_pkey; Type: CONSTRAINT; Schema: public; Owner: sidn77; Tablespace: 
--

ALTER TABLE ONLY vampire_reserves
    ADD CONSTRAINT vampire_reserves_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: vampire_bloodbank_4c4257d1; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX vampire_bloodbank_4c4257d1 ON vampire_bloodbank USING btree (aid_id);


--
-- Name: vampire_bloodsample_9078c436; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX vampire_bloodsample_9078c436 ON vampire_bloodsample USING btree (did_id);


--
-- Name: vampire_bloodsample_9d307b20; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX vampire_bloodsample_9d307b20 ON vampire_bloodsample USING btree (bbid_id);


--
-- Name: vampire_donor_4c4257d1; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX vampire_donor_4c4257d1 ON vampire_donor USING btree (aid_id);


--
-- Name: vampire_hospital_4c4257d1; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX vampire_hospital_4c4257d1 ON vampire_hospital USING btree (aid_id);


--
-- Name: vampire_reserves_1d335e07; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX vampire_reserves_1d335e07 ON vampire_reserves USING btree (bsid_id);


--
-- Name: vampire_reserves_e4cc83e2; Type: INDEX; Schema: public; Owner: sidn77; Tablespace: 
--

CREATE INDEX vampire_reserves_e4cc83e2 ON vampire_reserves USING btree (hid_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vampire_bloodbank_aid_id_76db69a5_fk_vampire_address_aid; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_bloodbank
    ADD CONSTRAINT vampire_bloodbank_aid_id_76db69a5_fk_vampire_address_aid FOREIGN KEY (aid_id) REFERENCES vampire_address(aid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vampire_bloodsample_bbid_id_fd5da0a3_fk_vampire_bloodbank_bbid; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_bloodsample
    ADD CONSTRAINT vampire_bloodsample_bbid_id_fd5da0a3_fk_vampire_bloodbank_bbid FOREIGN KEY (bbid_id) REFERENCES vampire_bloodbank(bbid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vampire_bloodsample_did_id_297fdf87_fk_vampire_donor_did; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_bloodsample
    ADD CONSTRAINT vampire_bloodsample_did_id_297fdf87_fk_vampire_donor_did FOREIGN KEY (did_id) REFERENCES vampire_donor(did) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vampire_donor_aid_id_bcdb7b81_fk_vampire_address_aid; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_donor
    ADD CONSTRAINT vampire_donor_aid_id_bcdb7b81_fk_vampire_address_aid FOREIGN KEY (aid_id) REFERENCES vampire_address(aid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vampire_hospital_aid_id_a11ad500_fk_vampire_address_aid; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_hospital
    ADD CONSTRAINT vampire_hospital_aid_id_a11ad500_fk_vampire_address_aid FOREIGN KEY (aid_id) REFERENCES vampire_address(aid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vampire_reserves_bsid_id_69028c36_fk_vampire_bloodsample_bsid; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_reserves
    ADD CONSTRAINT vampire_reserves_bsid_id_69028c36_fk_vampire_bloodsample_bsid FOREIGN KEY (bsid_id) REFERENCES vampire_bloodsample(bsid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vampire_reserves_hid_id_cfce7bc7_fk_vampire_hospital_hid; Type: FK CONSTRAINT; Schema: public; Owner: sidn77
--

ALTER TABLE ONLY vampire_reserves
    ADD CONSTRAINT vampire_reserves_hid_id_cfce7bc7_fk_vampire_hospital_hid FOREIGN KEY (hid_id) REFERENCES vampire_hospital(hid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

