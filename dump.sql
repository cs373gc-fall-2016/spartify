--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: brianb
--

CREATE TABLE companies (
    id integer NOT NULL,
    name character varying,
    email character varying,
    url character varying,
    avatar_url character varying,
    description character varying
);


ALTER TABLE companies OWNER TO brianb;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: brianb
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE companies_id_seq OWNER TO brianb;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brianb
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: company_membership; Type: TABLE; Schema: public; Owner: brianb
--

CREATE TABLE company_membership (
    company_id integer,
    contributor_id integer
);


ALTER TABLE company_membership OWNER TO brianb;

--
-- Name: contributors; Type: TABLE; Schema: public; Owner: brianb
--

CREATE TABLE contributors (
    id integer NOT NULL,
    username character varying,
    email character varying,
    url character varying,
    avatar_url character varying,
    location character varying
);


ALTER TABLE contributors OWNER TO brianb;

--
-- Name: contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: brianb
--

CREATE SEQUENCE contributors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contributors_id_seq OWNER TO brianb;

--
-- Name: contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brianb
--

ALTER SEQUENCE contributors_id_seq OWNED BY contributors.id;


--
-- Name: language_usage; Type: TABLE; Schema: public; Owner: brianb
--

CREATE TABLE language_usage (
    language_id integer,
    project_id integer
);


ALTER TABLE language_usage OWNER TO brianb;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: brianb
--

CREATE TABLE languages (
    id integer NOT NULL,
    name character varying,
    creator character varying,
    type character varying,
    "firstAppeared" integer,
    description character varying
);


ALTER TABLE languages OWNER TO brianb;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: brianb
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_id_seq OWNER TO brianb;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brianb
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: paradigms; Type: TABLE; Schema: public; Owner: brianb
--

CREATE TABLE paradigms (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE paradigms OWNER TO brianb;

--
-- Name: paradigms_id_seq; Type: SEQUENCE; Schema: public; Owner: brianb
--

CREATE SEQUENCE paradigms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paradigms_id_seq OWNER TO brianb;

--
-- Name: paradigms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brianb
--

ALTER SEQUENCE paradigms_id_seq OWNED BY paradigms.id;


--
-- Name: paradigms_used; Type: TABLE; Schema: public; Owner: brianb
--

CREATE TABLE paradigms_used (
    language_id integer,
    paradigm_id integer
);


ALTER TABLE paradigms_used OWNER TO brianb;

--
-- Name: project_participation; Type: TABLE; Schema: public; Owner: brianb
--

CREATE TABLE project_participation (
    contributor_id integer,
    project_id integer
);


ALTER TABLE project_participation OWNER TO brianb;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: brianb
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying,
    url character varying,
    "createdDate" timestamp without time zone,
    private boolean,
    owner_id integer,
    description character varying
);


ALTER TABLE projects OWNER TO brianb;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: brianb
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO brianb;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brianb
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY contributors ALTER COLUMN id SET DEFAULT nextval('contributors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY paradigms ALTER COLUMN id SET DEFAULT nextval('paradigms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY companies (id, name, email, url, avatar_url, description) FROM stdin;
1	Google	\N	https://github.com/google	https://avatars.githubusercontent.com/u/1342004?v=3	\N
2	Facebook	\N	https://github.com/facebook	https://avatars.githubusercontent.com/u/69631?v=3	We work hard to contribute our work back to the web, mobile, big data, & infrastructure communities. NB: members must have two-factor auth.
3	Bootstrap	\N	https://github.com/twbs	https://avatars.githubusercontent.com/u/2918581?v=3	Source code and more for the most popular front-end framework in the world.
4	Twitter, Inc.	opensource@twitter.com	https://github.com/twitter	https://avatars.githubusercontent.com/u/50278?v=3	Working with and contributing to the open source community
5	GitHub	support@github.com	https://github.com/github	https://avatars.githubusercontent.com/u/9919?v=3	How people build software.
6	Mozilla	\N	https://github.com/mozilla	https://avatars.githubusercontent.com/u/131524?v=3	This technology could fall into the right hands.
7	jQuery Foundation	\N	https://github.com/jquery	https://avatars.githubusercontent.com/u/70142?v=3	\N
8	H5BP	\N	https://github.com/h5bp	https://avatars.githubusercontent.com/u/1136800?v=3	\N
9	Angular	\N	https://github.com/angular	https://avatars.githubusercontent.com/u/139426?v=3	\N
11	Square	\N	https://github.com/square	https://avatars.githubusercontent.com/u/82592?v=3	\N
12	thoughtbot, inc.	\N	https://github.com/thoughtbot	https://avatars.githubusercontent.com/u/6183?v=3	\N
13	Ruby on Rails	\N	https://github.com/rails	https://avatars.githubusercontent.com/u/4223?v=3	\N
14	Joyent	\N	https://github.com/joyent	https://avatars.githubusercontent.com/u/10161?v=3	\N
15	HubSpot	\N	https://github.com/HubSpot	https://avatars.githubusercontent.com/u/326419?v=3	\N
16	The Apache Software Foundation	\N	https://github.com/apache	https://avatars.githubusercontent.com/u/47359?v=3	\N
17	Automattic	\N	https://github.com/Automattic	https://avatars.githubusercontent.com/u/887802?v=3	We are passionate about making the web a better place.
18	Docker	\N	https://github.com/docker	https://avatars.githubusercontent.com/u/5429470?v=3	\N
19	Fort Awesome	admin@fortawesome.com	https://github.com/FortAwesome	https://avatars.githubusercontent.com/u/1505683?v=3	Tools to help you be moar betters on the web.
20	zurb	\N	https://github.com/zurb	https://avatars.githubusercontent.com/u/156122?v=3	\N
23	Facebook Archive	\N	https://github.com/facebookarchive	https://avatars.githubusercontent.com/u/7560860?v=3	\N
24	Homebrew	homebrew-discuss@googlegroups.com	https://github.com/Homebrew	https://avatars.githubusercontent.com/u/1503512?v=3	\N
25	Ionic	hi@ionic.io	https://github.com/driftyco	https://avatars.githubusercontent.com/u/3171503?v=3	Powerful tools and services for building cross-platform mobile apps
26	Yahoo Inc.	\N	https://github.com/yahoo	https://avatars.githubusercontent.com/u/16574?v=3	\N
27	Adobe Systems Incorporated	\N	https://github.com/adobe	https://avatars.githubusercontent.com/u/476009?v=3	Open source from Adobe
28	Atom	atom@github.com	https://github.com/atom	https://avatars.githubusercontent.com/u/1089146?v=3	\N
29	Spring	\N	https://github.com/spring-projects	https://avatars.githubusercontent.com/u/317776?v=3	\N
30	Meteor Development Group	\N	https://github.com/meteor	https://avatars.githubusercontent.com/u/789528?v=3	\N
31	StrongLoop	\N	https://github.com/strongloop	https://avatars.githubusercontent.com/u/3020012?v=3	An IBM Company
34	Netflix, Inc.	netflixoss@netflix.com	https://github.com/Netflix	https://avatars.githubusercontent.com/u/913567?v=3	Netflix Open Source Platform
39	Plataformatec	opensource@plataformatec.com.br	https://github.com/plataformatec	https://avatars.githubusercontent.com/u/127679?v=3	We are a software consultancy specialised in Elixir and Ruby.  Creators of Elixir, Devise and Simple Form.
40	Moment.js	\N	https://github.com/moment	https://avatars.githubusercontent.com/u/4129662?v=3	\N
41	mongodb	\N	https://github.com/mongodb	https://avatars.githubusercontent.com/u/45120?v=3	\N
42	Nwjs	kf@gnor.net	https://github.com/nwjs	https://avatars.githubusercontent.com/u/10180421?v=3	\N
43	Shopify	\N	https://github.com/Shopify	https://avatars.githubusercontent.com/u/8085?v=3	\N
44	AFNetworking	info@alamofire.org	https://github.com/AFNetworking	https://avatars.githubusercontent.com/u/1181541?v=3	A delightful iOS and OS X networking framework
45	Yeoman	\N	https://github.com/yeoman	https://avatars.githubusercontent.com/u/1714870?v=3	The web's scaffolding tool for modern webapps
46	Lodash Utilities	\N	https://github.com/lodash	https://avatars.githubusercontent.com/u/2565403?v=3	JavaScript utilities delivering consistency, modularity, performance, & extras.
47	PLD Linux Distribution (GitHub Mirror))	\N	https://github.com/pld-linux	https://avatars.githubusercontent.com/u/599313?v=3	\N
48	Jekyll	\N	https://github.com/jekyll	https://avatars.githubusercontent.com/u/3083652?v=3	Jekyll is a blog-aware, static site generator in Ruby.
49	INTRIDEA Inc.	hello@intridea.com	https://github.com/intridea	https://avatars.githubusercontent.com/u/3747?v=3	\N
50	Harvest	\N	https://github.com/harvesthq	https://avatars.githubusercontent.com/u/43635?v=3	\N
52	Airbnb	\N	https://github.com/airbnb	https://avatars.githubusercontent.com/u/698437?v=3	\N
53	Segment	friends@segment.com	https://github.com/segmentio	https://avatars.githubusercontent.com/u/819518?v=3	\N
54	GitLab	\N	https://github.com/gitlabhq	https://avatars.githubusercontent.com/u/1086321?v=3	\N
10	vuejs	\N	https://github.com/vuejs	https://avatars.githubusercontent.com/u/6128107?v=3	\N
22	AngularUI	\N	https://github.com/angular-ui	https://avatars.githubusercontent.com/u/1530011?v=3	\N
56	Ajax.org B.V.	\N	https://github.com/ajaxorg	https://avatars.githubusercontent.com/u/168515?v=3	\N
57	Django	\N	https://github.com/django	https://avatars.githubusercontent.com/u/27804?v=3	\N
58	Mapbox	\N	https://github.com/mapbox	https://avatars.githubusercontent.com/u/600935?v=3	\N
59	CocoaPods	\N	https://github.com/CocoaPods	https://avatars.githubusercontent.com/u/1189714?v=3	The Swift & Objective C Dependency Manager
60	Alibaba	\N	https://github.com/alibaba	https://avatars.githubusercontent.com/u/1961952?v=3	\N
63	Semantic Org	info@semantic-ui.com	https://github.com/Semantic-Org	https://avatars.githubusercontent.com/u/5796209?v=3	Semantic Organization
64	Modernizr	\N	https://github.com/Modernizr	https://avatars.githubusercontent.com/u/131060?v=3	\N
65	Ghost	\N	https://github.com/TryGhost	https://avatars.githubusercontent.com/u/2178663?v=3	Professional publishing
66	usablica	afshin.meh@gmail.com	https://github.com/usablica	https://avatars.githubusercontent.com/u/2010360?v=3	\N
67	Discourse	team@discourse.org	https://github.com/discourse	https://avatars.githubusercontent.com/u/3220138?v=3	The 100% open source discussion platform built for the next decade of the Internet. 
68	CoreOS	partners@coreos.com	https://github.com/coreos	https://avatars.githubusercontent.com/u/3730757?v=3	Open Source Projects for Linux Containers
70	polymer	polymer-dev@googlegroups.com	https://github.com/Polymer	https://avatars.githubusercontent.com/u/2159051?v=3	\N
71	.NET Foundation	contact@dotnetfoundation.org	https://github.com/dotnet	https://avatars.githubusercontent.com/u/9141961?v=3	Home of the .NET Foundation
72	Go	\N	https://github.com/golang	https://avatars.githubusercontent.com/u/4314092?v=3	\N
73	cocos2d	\N	https://github.com/cocos2d	https://avatars.githubusercontent.com/u/234324?v=3	\N
74	Google Cloud Platform	\N	https://github.com/GoogleCloudPlatform	https://avatars.githubusercontent.com/u/2810941?v=3	\N
75	Less	\N	https://github.com/less	https://avatars.githubusercontent.com/u/3538330?v=3	\N
76	Select2	\N	https://github.com/select2	https://avatars.githubusercontent.com/u/8077542?v=3	The jQuery replacement for select boxes
77	PhoneGap	\N	https://github.com/phonegap	https://avatars.githubusercontent.com/u/60365?v=3	\N
79	TextMate	\N	https://github.com/textmate	https://avatars.githubusercontent.com/u/91310?v=3	\N
80	Chef Software, Inc.	\N	https://github.com/chef	https://avatars.githubusercontent.com/u/29740?v=3	\N
82	The Rust Programming Language	\N	https://github.com/rust-lang	https://avatars.githubusercontent.com/u/5430905?v=3	\N
83	Microsoft	opensource@microsoft.com	https://github.com/Microsoft	https://avatars.githubusercontent.com/u/6154722?v=3	Open source, from Microsoft with love
84	Bower	team@bower.io	https://github.com/bower	https://avatars.githubusercontent.com/u/3709251?v=3	A package manager for the web
85	Heroku	\N	https://github.com/heroku	https://avatars.githubusercontent.com/u/23211?v=3	\N
86	TasteJS	tastejavascript@gmail.com	https://github.com/tastejs	https://avatars.githubusercontent.com/u/1733746?v=3	A better JavaScript learning experience. Keeper of TodoMVC & PropertyCross. Eater of popsicles.
87	papers-we-love	contact@paperswelove.org	https://github.com/papers-we-love	https://avatars.githubusercontent.com/u/6187757?v=3	A repository for good papers to read.
88	Neovim	\N	https://github.com/neovim	https://avatars.githubusercontent.com/u/6471485?v=3	vim out of the box
89	Dropbox	\N	https://github.com/dropbox	https://avatars.githubusercontent.com/u/559357?v=3	\N
90	gulp	team@gulpjs.com	https://github.com/gulpjs	https://avatars.githubusercontent.com/u/6200624?v=3	Streaming build system
91	Jenkins	\N	https://github.com/jenkinsci	https://avatars.githubusercontent.com/u/107424?v=3	\N
92	shadowsocks	\N	https://github.com/shadowsocks	https://avatars.githubusercontent.com/u/3006190?v=3	A fast tunnel proxy that helps you bypass firewalls
94	The League of Extraordinary Packages	\N	https://github.com/thephpleague	https://avatars.githubusercontent.com/u/527621?v=3	A group of developers who have banded together to build solid, well tested PHP packages using modern coding standards.
95	Ansible	\N	https://github.com/ansible	https://avatars.githubusercontent.com/u/1507452?v=3	\N
96	Puppet	\N	https://github.com/puppetlabs	https://avatars.githubusercontent.com/u/234268?v=3	\N
98	Sloth	\N	https://github.com/visionmedia	https://avatars.githubusercontent.com/u/9285252?v=3	New user is /tj
99	InterAgent	\N	https://github.com/interagent	https://avatars.githubusercontent.com/u/7388387?v=3	Tools and docs for building and using HTTP APIs
81	Balderdash	friends@balderdash.co	https://github.com/balderdashy	https://avatars.githubusercontent.com/u/1445252?v=3	\N
93	Leaflet	\N	https://github.com/Leaflet	https://avatars.githubusercontent.com/u/2854298?v=3	\N
97	Mono Project	mono@xamarin.com	https://github.com/mono	https://avatars.githubusercontent.com/u/53395?v=3	\N
32	LearnBoost	\N	https://github.com/LearnBoost	https://avatars.githubusercontent.com/u/204174?v=3	\N
33	Etsy, Inc.	\N	https://github.com/etsy	https://avatars.githubusercontent.com/u/193389?v=3	\N
35	grunt	\N	https://github.com/gruntjs	https://avatars.githubusercontent.com/u/1630826?v=3	\N
36	The Laravel PHP Framework	\N	https://github.com/laravel	https://avatars.githubusercontent.com/u/958072?v=3	\N
37	Filament Group	\N	https://github.com/filamentgroup	https://avatars.githubusercontent.com/u/30614?v=3	\N
38	Codrops	\N	https://github.com/codrops	https://avatars.githubusercontent.com/u/310036?v=3	\N
51	Ember.js	\N	https://github.com/emberjs	https://avatars.githubusercontent.com/u/1253363?v=3	\N
55	CyanogenMod	\N	https://github.com/CyanogenMod	https://avatars.githubusercontent.com/u/317721?v=3	\N
61	Clojure	\N	https://github.com/clojure	https://avatars.githubusercontent.com/u/317875?v=3	\N
62	GitHub resume generator	\N	https://github.com/resume	https://avatars.githubusercontent.com/u/602612?v=3	\N
69	Symfony	\N	https://github.com/symfony	https://avatars.githubusercontent.com/u/143937?v=3	\N
78	LinkedIn	\N	https://github.com/linkedin	https://avatars.githubusercontent.com/u/357098?v=3	\N
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('companies_id_seq', 1, false);


--
-- Data for Name: company_membership; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY company_membership (company_id, contributor_id) FROM stdin;
2	401
3	859
3	857
4	977
7	2081
7	2039
8	2311
8	2351
8	2267
9	2699
10	2707
13	1259
13	1279
14	3587
15	3643
15	3659
16	4063
16	4073
18	4513
19	4777
20	4817
20	5011
22	5119
22	5051
22	2011
22	5167
24	4703
24	5791
24	5779
24	5653
25	5933
25	2111
25	5939
27	6197
27	2719
28	859
28	6511
29	3463
31	2011
31	3587
31	6971
33	7211
34	7459
34	7351
35	7723
35	7673
36	7993
41	6793
41	8707
41	8627
42	9029
45	2011
45	2399
45	379
45	9649
46	9839
46	9859
48	9907
51	10301
51	5059
52	10523
52	10489
53	4133
54	10799
55	11159
56	11383
57	11411
57	11413
57	11423
57	11447
57	11467
59	11731
59	11783
59	11743
61	12043
61	12071
65	6511
65	12281
65	12269
65	12277
65	2389
68	12569
68	12577
68	12583
69	12743
70	5933
70	9629
71	13141
72	13499
72	12703
72	13513
73	13709
75	14009
75	7723
75	14011
77	7727
77	3469
78	14347
80	3511
81	2311
81	14713
81	2591
82	14897
84	15319
84	15313
85	15439
86	379
87	15619
88	15671
88	15647
88	15641
89	15767
91	4507
93	11593
93	9733
94	5791
94	16573
95	16729
95	16811
96	16949
97	17113
\.


--
-- Data for Name: contributors; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY contributors (id, username, email, url, avatar_url, location) FROM stdin;
1	haberman	jhaberman@gmail.com	https://github.com/haberman	https://avatars.githubusercontent.com/u/1270?v=3	Seattle, WA
17	dimo414	\N	https://github.com/dimo414	https://avatars.githubusercontent.com/u/1885701?v=3	Mountain View, CA
131	bob-wilson	\N	https://github.com/bob-wilson	https://avatars.githubusercontent.com/u/15724724?v=3	\N
157	sigmundch	\N	https://github.com/sigmundch	https://avatars.githubusercontent.com/u/2049220?v=3	\N
271	Dieterbe	\N	https://github.com/Dieterbe	https://avatars.githubusercontent.com/u/20774?v=3	New York City
277	chiragnagpal	\N	https://github.com/chiragnagpal	https://avatars.githubusercontent.com/u/4943802?v=3	Pittsburgh
283	shantanu69	\N	https://github.com/shantanu69	https://avatars.githubusercontent.com/u/12914604?v=3	Dhaka, Bangladesh
223	DjebbZ	khalid.jebbari@gmail.com	https://github.com/DjebbZ	https://avatars.githubusercontent.com/u/77278?v=3	Paris, France
293	Orvid	\N	https://github.com/Orvid	https://avatars.githubusercontent.com/u/709247?v=3	\N
307	paulbiss	\N	https://github.com/paulbiss	https://avatars.githubusercontent.com/u/1039792?v=3	\N
263	modocache	modocache@gmail.com	https://github.com/modocache	https://avatars.githubusercontent.com/u/552921?v=3	Brooklyn, NY
269	daneden	dan.eden@me.com	https://github.com/daneden	https://avatars.githubusercontent.com/u/439365?v=3	San Francisco, CA
281	jamesgpearce	james@tripleodeon.com	https://github.com/jamesgpearce	https://avatars.githubusercontent.com/u/90942?v=3	Palo Alto, California
289	int3	me@jezng.com	https://github.com/int3	https://avatars.githubusercontent.com/u/228496?v=3	San Francisco, CA, USA
311	SiebelsTim	\N	https://github.com/SiebelsTim	https://avatars.githubusercontent.com/u/1153003?v=3	Germany
313	binliu19	\N	https://github.com/binliu19	https://avatars.githubusercontent.com/u/11066845?v=3	MPK
317	TJ09	\N	https://github.com/TJ09	https://avatars.githubusercontent.com/u/829579?v=3	California
331	sid0	\N	https://github.com/sid0	https://avatars.githubusercontent.com/u/180618?v=3	San Francisco Bay Area
337	niallkennedy	\N	https://github.com/niallkennedy	https://avatars.githubusercontent.com/u/1100?v=3	San Francisco, CA, United States
349	oguzbilgic	\N	https://github.com/oguzbilgic	https://avatars.githubusercontent.com/u/144778?v=3	Mountain View, CA
359	andrey-starodubtsev	\N	https://github.com/andrey-starodubtsev	https://avatars.githubusercontent.com/u/7666511?v=3	Saint-Petersburg, Russia
353	rightparen	\N	https://github.com/rightparen	https://avatars.githubusercontent.com/u/1332313?v=3	\N
347	johnbreslin	john@streamglider.com	https://github.com/johnbreslin	https://avatars.githubusercontent.com/u/270732?v=3	Galway, Ireland
409	akuhn	\N	https://github.com/akuhn	https://avatars.githubusercontent.com/u/74872?v=3	Switzerland
367	dzhuowen	\N	https://github.com/dzhuowen	https://avatars.githubusercontent.com/u/14930169?v=3	\N
383	gregschechter	\N	https://github.com/gregschechter	https://avatars.githubusercontent.com/u/1542351?v=3	\N
389	suhasjoshi	\N	https://github.com/suhasjoshi	https://avatars.githubusercontent.com/u/1529703?v=3	\N
373	ChristianBecker	christian.becker.1987@gmail.com	https://github.com/ChristianBecker	https://avatars.githubusercontent.com/u/1763815?v=3	Hanover, Germany
379	passy	phartig@rdrei.net	https://github.com/passy	https://avatars.githubusercontent.com/u/9906?v=3	London, UK
397	chuganzy	takeru@hoppenichu.com	https://github.com/chuganzy	https://avatars.githubusercontent.com/u/2619092?v=3	Tokyo
401	aryx	yoann.padioleau@gmail.com	https://github.com/aryx	https://avatars.githubusercontent.com/u/332336?v=3	Palo Alto, CA, USA
431	cbergau	\N	https://github.com/cbergau	https://avatars.githubusercontent.com/u/2446617?v=3	Hannover (Germany)
433	0x20h	\N	https://github.com/0x20h	https://avatars.githubusercontent.com/u/309633?v=3	Gießen, Germany
419	juergenhoetzel	juergen@archlinux.org	https://github.com/juergenhoetzel	https://avatars.githubusercontent.com/u/52547?v=3	Germany
439	twindual	\N	https://github.com/twindual	https://avatars.githubusercontent.com/u/3850698?v=3	Ontario, Canada
421	qoelet	kenny@machinesung.com	https://github.com/qoelet	https://avatars.githubusercontent.com/u/115877?v=3	Singapore
467	jmkk	\N	https://github.com/jmkk	https://avatars.githubusercontent.com/u/3430965?v=3	Mountain View, CA
461	natan	\N	https://github.com/natan	https://avatars.githubusercontent.com/u/10638?v=3	\N
449	DGCarramona	d.g.carramona@gmail.com	https://github.com/DGCarramona	https://avatars.githubusercontent.com/u/8184340?v=3	\N
443	jonstjohn	jonstjohn@gmail.com	https://github.com/jonstjohn	https://avatars.githubusercontent.com/u/95620?v=3	Salt Lake City, UT
457	mikelikespie	mikelikespie@gmail.com	https://github.com/mikelikespie	https://avatars.githubusercontent.com/u/21435?v=3	Bay Area
463	alanf	af@cs.washington.edu	https://github.com/alanf	https://avatars.githubusercontent.com/u/154965?v=3	san francisco
569	cpojer	\N	https://github.com/cpojer	https://avatars.githubusercontent.com/u/13352?v=3	Facebook
751	chicoxyzzy	\N	https://github.com/chicoxyzzy	https://avatars.githubusercontent.com/u/1507086?v=3	✈️
479	michaelkirk	michael.code@endoftheworl.de	https://github.com/michaelkirk	https://avatars.githubusercontent.com/u/217057?v=3	\N
593	liukai	hfevers@gmail.com	https://github.com/liukai	https://avatars.githubusercontent.com/u/685252?v=3	San Francisco, CA
739	spicyj	ben@benalpert.com	https://github.com/spicyj	https://avatars.githubusercontent.com/u/6820?v=3	Mountain View, CA
809	vsn4ik	vsn4ik@yandex.ru	https://github.com/vsn4ik	https://avatars.githubusercontent.com/u/3757319?v=3	Moscow, Russia
811	StevenBlack	steveb@stevenblack.com	https://github.com/StevenBlack	https://avatars.githubusercontent.com/u/80144?v=3	Kingston, Ontario, Canada
823	acmetech	\N	https://github.com/acmetech	https://avatars.githubusercontent.com/u/134294?v=3	North Carolina, USA
827	supergibbs	\N	https://github.com/supergibbs	https://avatars.githubusercontent.com/u/1106331?v=3	Santa Monica, CA, USA
839	danielbayerlein	\N	https://github.com/danielbayerlein	https://avatars.githubusercontent.com/u/457834?v=3	Bavaria, Germany
863	gitname	\N	https://github.com/gitname	https://avatars.githubusercontent.com/u/7143133?v=3	California, United States
821	ssorallen	\N	https://github.com/ssorallen	https://avatars.githubusercontent.com/u/29612?v=3	\N
829	mrmrs	hi@mrmrs.cc	https://github.com/mrmrs	https://avatars.githubusercontent.com/u/1748143?v=3	\N
853	Atul9	atul1bhosale@gmail.com	https://github.com/Atul9	https://avatars.githubusercontent.com/u/3390330?v=3	Bangalore, India
857	jdorfman	justindorfman@gmail.com	https://github.com/jdorfman	https://avatars.githubusercontent.com/u/398230?v=3	Los Angeles
859	connors	connor@connorsears.com	https://github.com/connors	https://avatars.githubusercontent.com/u/874145?v=3	Castro Valley, CA
907	freezy-sk	\N	https://github.com/freezy-sk	https://avatars.githubusercontent.com/u/661637?v=3	Bratislava, Slovakia
911	dwijnand	\N	https://github.com/dwijnand	https://avatars.githubusercontent.com/u/344610?v=3	London, UK
929	zman0900	\N	https://github.com/zman0900	https://avatars.githubusercontent.com/u/428589?v=3	Columbus, OH
937	cnauroth	\N	https://github.com/cnauroth	https://avatars.githubusercontent.com/u/227407?v=3	Seattle, WA
883	cvergne	\N	https://github.com/cvergne	https://avatars.githubusercontent.com/u/1032689?v=3	\N
877	pcottle	petermcottle@gmail.com	https://github.com/pcottle	https://avatars.githubusercontent.com/u/1135007?v=3	Berkeley, CA
881	iamnirav	nirav.sanghani@gmail.com	https://github.com/iamnirav	https://avatars.githubusercontent.com/u/313886?v=3	San Francisco, CA
887	frabrunelle	frabrunelle@gmail.com	https://github.com/frabrunelle	https://avatars.githubusercontent.com/u/1114844?v=3	Montreal
947	cgs	\N	https://github.com/cgs	https://avatars.githubusercontent.com/u/16057?v=3	Bend, OR
971	sagemintblue	\N	https://github.com/sagemintblue	https://avatars.githubusercontent.com/u/440162?v=3	San Francisco, CA
941	seigel	github@paddlethis.com	https://github.com/seigel	https://avatars.githubusercontent.com/u/15181?v=3	Calgary
977	azymnis	\N	https://github.com/azymnis	https://avatars.githubusercontent.com/u/207127?v=3	San Francisco, CA
967	j3h	\N	https://github.com/j3h	https://avatars.githubusercontent.com/u/200659?v=3	\N
983	rore	\N	https://github.com/rore	https://avatars.githubusercontent.com/u/571498?v=3	\N
953	bitbckt	brandon@thewholedoubt.com	https://github.com/bitbckt	https://avatars.githubusercontent.com/u/335?v=3	San Francisco, CA United States
991	jcoveney	jcoveney@gmail.com	https://github.com/jcoveney	https://avatars.githubusercontent.com/u/830087?v=3	SF
1009	bmatheny	\N	https://github.com/bmatheny	https://avatars.githubusercontent.com/u/162694?v=3	San Francisco
997	rcohen	\N	https://github.com/rcohen	https://avatars.githubusercontent.com/u/384511?v=3	\N
1181	dometto	\N	https://github.com/dometto	https://avatars.githubusercontent.com/u/147111?v=3	\N
1013	joshbuddy	joshbuddy@gmail.com	https://github.com/joshbuddy	https://avatars.githubusercontent.com/u/8898?v=3	San Francisco, CA
1153	maxhodak	maxhodak@gmail.com	https://github.com/maxhodak	https://avatars.githubusercontent.com/u/83726?v=3	Palo Alto, CA
1187	technoweenie	technoweenie@gmail.com	https://github.com/technoweenie	https://avatars.githubusercontent.com/u/21?v=3	Louisville, CO
1201	moskvax	\N	https://github.com/moskvax	https://avatars.githubusercontent.com/u/577766?v=3	Sydney
1223	kch	\N	https://github.com/kch	https://avatars.githubusercontent.com/u/8216?v=3	Berlin
1193	flying-sheep	flying-sheep@web.de	https://github.com/flying-sheep	https://avatars.githubusercontent.com/u/291575?v=3	München
1213	blueyed	github@thequod.de	https://github.com/blueyed	https://avatars.githubusercontent.com/u/9766?v=3	Berlin, Germany
1217	cornwe19	cornwe19@gmail.com	https://github.com/cornwe19	https://avatars.githubusercontent.com/u/492618?v=3	Rochester, NY
1229	knu	knu@idaemons.org	https://github.com/knu	https://avatars.githubusercontent.com/u/10236?v=3	Tokyo, Japan
1231	atmos	atmos@atmos.org	https://github.com/atmos	https://avatars.githubusercontent.com/u/38?v=3	Potrero, SF
1237	lloydwatkin	lloyd@evilprofessor.co.uk	https://github.com/lloydwatkin	https://avatars.githubusercontent.com/u/271622?v=3	Bristol, United Kingdom
1277	fcheung	\N	https://github.com/fcheung	https://avatars.githubusercontent.com/u/5927?v=3	Ely (UK)
1291	mibe	\N	https://github.com/mibe	https://avatars.githubusercontent.com/u/573529?v=3	Germany
3659	timmfin	\N	https://github.com/timmfin	https://avatars.githubusercontent.com/u/60455?v=3	\N
1249	tu1ly	tully@apiary.io	https://github.com/tu1ly	https://avatars.githubusercontent.com/u/752248?v=3	\N
1259	fxn	fxn@hashref.com	https://github.com/fxn	https://avatars.githubusercontent.com/u/3387?v=3	Barcelona
1279	guilleiguaran	guilleiguaran@gmail.com	https://github.com/guilleiguaran	https://avatars.githubusercontent.com/u/160941?v=3	Colombia
1283	arcresu	carl@contraflo.ws	https://github.com/arcresu	https://avatars.githubusercontent.com/u/322256?v=3	Sydney, Australia
1289	stuartpb	stuart@testtrack4.com	https://github.com/stuartpb	https://avatars.githubusercontent.com/u/572196?v=3	Seattle, WA
1319	svenwin	\N	https://github.com/svenwin	https://avatars.githubusercontent.com/u/49042?v=3	Weiden, Germany
1321	anaulin	\N	https://github.com/anaulin	https://avatars.githubusercontent.com/u/6729309?v=3	Palo Alto
1297	rye	me@krye.io	https://github.com/rye	https://avatars.githubusercontent.com/u/1566689?v=3	Baxter, Minnesota
1301	mkutyba	\N	https://github.com/mkutyba	https://avatars.githubusercontent.com/u/1902139?v=3	\N
1307	jerodev	\N	https://github.com/jerodev	https://avatars.githubusercontent.com/u/3493941?v=3	\N
1303	KrauseFx	github@krausefx.com	https://github.com/KrauseFx	https://avatars.githubusercontent.com/u/869950?v=3	San Francisco
1327	ndbroadbent	nathan.f77@gmail.com	https://github.com/ndbroadbent	https://avatars.githubusercontent.com/u/139536?v=3	Chiang Mai, Thailand
1367	jnunemaker	\N	https://github.com/jnunemaker	https://avatars.githubusercontent.com/u/235?v=3	Indiana
1481	mal	\N	https://github.com/mal	https://avatars.githubusercontent.com/u/591257?v=3	Bristol, UK
1549	mickeyreiss	\N	https://github.com/mickeyreiss	https://avatars.githubusercontent.com/u/47405?v=3	San Francisco, CA
1381	dkowis	dkowis@shlrm.org	https://github.com/dkowis	https://avatars.githubusercontent.com/u/28048?v=3	Hurst, Texas
1607	cvan	\N	https://github.com/cvan	https://avatars.githubusercontent.com/u/203725?v=3	san francisco, ca
1627	eviljeff	\N	https://github.com/eviljeff	https://avatars.githubusercontent.com/u/768592?v=3	UK
1609	robhudson	rob@cogit8.org	https://github.com/robhudson	https://avatars.githubusercontent.com/u/1106?v=3	Eugene, Oregon
1613	clouserw	wclouser@mozilla.com	https://github.com/clouserw	https://avatars.githubusercontent.com/u/80098?v=3	Portland, OR
1619	mattbasta	mattbasta+github@gmail.com	https://github.com/mattbasta	https://avatars.githubusercontent.com/u/279498?v=3	San Francisco, CA
1621	chuckharmston	chuck@mozilla.com	https://github.com/chuckharmston	https://avatars.githubusercontent.com/u/23885?v=3	Denver, CO
1637	brandonsavage	brandon@brandonsavage.net	https://github.com/brandonsavage	https://avatars.githubusercontent.com/u/197889?v=3	Olney, MD
1657	glogiotatidis	\N	https://github.com/glogiotatidis	https://avatars.githubusercontent.com/u/584352?v=3	Athens, Greece
1669	ibai	\N	https://github.com/ibai	https://avatars.githubusercontent.com/u/901326?v=3	Oakland
1697	jay	\N	https://github.com/jay	https://avatars.githubusercontent.com/u/965580?v=3	New Rochelle, New York, United States
1699	kbrosnan	\N	https://github.com/kbrosnan	https://avatars.githubusercontent.com/u/250273?v=3	Mountain View, CA
1663	fxa90id	\N	https://github.com/fxa90id	https://avatars.githubusercontent.com/u/1533600?v=3	\N
1667	shuhaowu	shuhao@shuhaowu.com	https://github.com/shuhaowu	https://avatars.githubusercontent.com/u/338100?v=3	Ottawa
1693	zapion	zapionator@gmail.com	https://github.com/zapion	https://avatars.githubusercontent.com/u/734529?v=3	Taipei
1709	SmileyChris	\N	https://github.com/SmileyChris	https://avatars.githubusercontent.com/u/109951?v=3	New Zealand
1717	dangayle	\N	https://github.com/dangayle	https://avatars.githubusercontent.com/u/129611?v=3	Spokane, Wa
1723	karipe	\N	https://github.com/karipe	https://avatars.githubusercontent.com/u/763152?v=3	Seoul, Korea
1747	ilyakatz	\N	https://github.com/ilyakatz	https://avatars.githubusercontent.com/u/282514?v=3	SF
1751	brianchirls	\N	https://github.com/brianchirls	https://avatars.githubusercontent.com/u/492291?v=3	New York, NY
1741	mbuttu	\N	https://github.com/mbuttu	https://avatars.githubusercontent.com/u/766718?v=3	\N
1753	jptweb	\N	https://github.com/jptweb	https://avatars.githubusercontent.com/u/1360276?v=3	\N
1759	brettgaylor	brett@etherworks.ca	https://github.com/brettgaylor	https://avatars.githubusercontent.com/u/345974?v=3	\N
1721	jaimeirurzun	jaime@irurzun.com	https://github.com/jaimeirurzun	https://avatars.githubusercontent.com/u/177610?v=3	London, UK
1733	cadecairos	cade@mozillafoundation.org	https://github.com/cadecairos	https://avatars.githubusercontent.com/u/438003?v=3	Newmarket, Ontario
1783	balazsjuhasz	\N	https://github.com/balazsjuhasz	https://avatars.githubusercontent.com/u/5452269?v=3	Hungary
1921	jitter	\N	https://github.com/jitter	https://avatars.githubusercontent.com/u/414129?v=3	Vienna
1787	moijes12	\N	https://github.com/moijes12	https://avatars.githubusercontent.com/u/4566851?v=3	\N
1789	ochameau	\N	https://github.com/ochameau	https://avatars.githubusercontent.com/u/199907?v=3	\N
1777	jonallengriffin	jgriffin@mozilla.com	https://github.com/jonallengriffin	https://avatars.githubusercontent.com/u/119080?v=3	\N
1831	jaysoo	jack.hsu@gmail.com	https://github.com/jaysoo	https://avatars.githubusercontent.com/u/53559?v=3	Toronto
1871	anantn	anant@kix.in	https://github.com/anantn	https://avatars.githubusercontent.com/u/37190?v=3	Sunnyvale
1949	levidehaan	\N	https://github.com/levidehaan	https://avatars.githubusercontent.com/u/304932?v=3	Longmont/Boulder Colorado Area
1951	hennr	\N	https://github.com/hennr	https://avatars.githubusercontent.com/u/677418?v=3	Berlin, Germany
1931	mikesherov	\N	https://github.com/mikesherov	https://avatars.githubusercontent.com/u/364532?v=3	\N
1973	rkatic	robert.katic@gmail.com	https://github.com/rkatic	https://avatars.githubusercontent.com/u/38577?v=3	\N
1933	SaptakS	saptak013@gmail.com	https://github.com/SaptakS	https://avatars.githubusercontent.com/u/9530293?v=3	India
1979	malsup	malsup@gmail.com	https://github.com/malsup	https://avatars.githubusercontent.com/u/28185?v=3	@malsup on twitter
1993	gauravmittal1995	\N	https://github.com/gauravmittal1995	https://avatars.githubusercontent.com/u/6555434?v=3	Hyderabad
2003	ebenoist	\N	https://github.com/ebenoist	https://avatars.githubusercontent.com/u/1656713?v=3	Chicago
2011	eddiemonge	\N	https://github.com/eddiemonge	https://avatars.githubusercontent.com/u/127535?v=3	California
2029	aaronchi	\N	https://github.com/aaronchi	https://avatars.githubusercontent.com/u/6336?v=3	Santa Monica, CA
1987	willmoffat	will_git@hamstersoup.com	https://github.com/willmoffat	https://avatars.githubusercontent.com/u/119835?v=3	San Francisco, USA
1997	NV	me@elv1s.ru	https://github.com/NV	https://avatars.githubusercontent.com/u/55838?v=3	San Francisco
1999	trevorparscal	trevorparscal@gmail.com	https://github.com/trevorparscal	https://avatars.githubusercontent.com/u/108389?v=3	Pacifica, CA
2017	chicheng	git@chicheng.me	https://github.com/chicheng	https://avatars.githubusercontent.com/u/21835?v=3	Melbourne, Australia
2027	1Marc	m@marcgrabanski.com	https://github.com/1Marc	https://avatars.githubusercontent.com/u/19269?v=3	Burnsville, Minnesota, US
2039	gseguin	\N	https://github.com/gseguin	https://avatars.githubusercontent.com/u/373923?v=3	Boulder, CO
2053	stforek	\N	https://github.com/stforek	https://avatars.githubusercontent.com/u/411343?v=3	\N
2083	johnkpaul	\N	https://github.com/johnkpaul	https://avatars.githubusercontent.com/u/475621?v=3	\N
2063	karan1276	karan1276@gmail.com	https://github.com/karan1276	https://avatars.githubusercontent.com/u/8016851?v=3	Pune, India
2069	YasuhiroYoshida	yasuhiroyoshida@about.me	https://github.com/YasuhiroYoshida	https://avatars.githubusercontent.com/u/892791?v=3	Tokyo, Japan
2081	bobholt	bobholt@gmail.com	https://github.com/bobholt	https://avatars.githubusercontent.com/u/94167?v=3	Peterborough, NH
2089	dmzza	\N	https://github.com/dmzza	https://avatars.githubusercontent.com/u/120893?v=3	San Francisco, CA
2111	mlynch	\N	https://github.com/mlynch	https://avatars.githubusercontent.com/u/11214?v=3	Madison
2237	wbinnssmith	\N	https://github.com/wbinnssmith	https://avatars.githubusercontent.com/u/755844?v=3	Bay Area, CA
2251	GaryJones	\N	https://github.com/GaryJones	https://avatars.githubusercontent.com/u/88371?v=3	Basingstoke, UK
2087	jsvine	\N	https://github.com/jsvine	https://avatars.githubusercontent.com/u/534702?v=3	\N
2221	sorvell	\N	https://github.com/sorvell	https://avatars.githubusercontent.com/u/78891?v=3	\N
2269	darktable	\N	https://github.com/darktable	https://avatars.githubusercontent.com/u/585604?v=3	\N
2267	shichuan	shichuanr@gmail.com	https://github.com/shichuan	https://avatars.githubusercontent.com/u/153513?v=3	\N
2131	pgilad	giladp007@gmail.com	https://github.com/pgilad	https://avatars.githubusercontent.com/u/4533329?v=3	Tel Aviv, Israel
2141	dandv	ddascalescu+github@gmail.com	https://github.com/dandv	https://avatars.githubusercontent.com/u/33569?v=3	Silicon Valley
2273	git2samus	mail2samus@gmail.com	https://github.com/git2samus	https://avatars.githubusercontent.com/u/146392?v=3	Uruguay
2281	gmoulin	\N	https://github.com/gmoulin	https://avatars.githubusercontent.com/u/688073?v=3	\N
2311	niftylettuce	niftylettuce@gmail.com	https://github.com/niftylettuce	https://avatars.githubusercontent.com/u/523141?v=3	\N
2329	jakearchibald	 jaffathecake@gmail.com	https://github.com/jakearchibald	https://avatars.githubusercontent.com/u/93594?v=3	\N
2287	jsma	john-scott@greenlightgo.co	https://github.com/jsma	https://avatars.githubusercontent.com/u/24574?v=3	Seattle, WA
2293	raulfraile	raulfraile@gmail.com	https://github.com/raulfraile	https://avatars.githubusercontent.com/u/595160?v=3	Spain
2297	GonzaloGM	gonzalo@gonzalezmora.com	https://github.com/GonzaloGM	https://avatars.githubusercontent.com/u/77448?v=3	Rosario, Argentina
2309	robertcedwards	Github@coactlab.com	https://github.com/robertcedwards	https://avatars.githubusercontent.com/u/139775?v=3	Los Angeles, California
2333	irae	\N	https://github.com/irae	https://avatars.githubusercontent.com/u/98254?v=3	Sunnyvale, CA
2363	MayhemYDG	\N	https://github.com/MayhemYDG	https://avatars.githubusercontent.com/u/567105?v=3	London, United Kingdom
2381	ziggys	\N	https://github.com/ziggys	https://avatars.githubusercontent.com/u/617609?v=3	Reykjavík, Iceland
2383	dholth	\N	https://github.com/dholth	https://avatars.githubusercontent.com/u/208018?v=3	Florida
2339	voidfiles	voidfiles@gmail.com	https://github.com/voidfiles	https://avatars.githubusercontent.com/u/1764?v=3	SF, CA
2341	4nd3rs	a@andmag.se	https://github.com/4nd3rs	https://avatars.githubusercontent.com/u/479435?v=3	Stockholm
2347	develasquez	Felipe.velasquezc@gmail.com	https://github.com/develasquez	https://avatars.githubusercontent.com/u/887111?v=3	Chile
2351	Raynos	raynos2@gmail.com	https://github.com/Raynos	https://avatars.githubusercontent.com/u/479538?v=3	San Francisco
2357	joeybaker	joey@byjoeybaker.com	https://github.com/joeybaker	https://avatars.githubusercontent.com/u/36662?v=3	San Francisco
2371	tonyjcamp	tonyjcamp@gmail.com	https://github.com/tonyjcamp	https://avatars.githubusercontent.com/u/253558?v=3	Phoenix, AZ
2377	erikroyall	erikroyall@hotmail.com	https://github.com/erikroyall	https://avatars.githubusercontent.com/u/2878830?v=3	Hyderabad, India
2389	morficus	\N	https://github.com/morficus	https://avatars.githubusercontent.com/u/718799?v=3	Southeast Michigan
2393	slindstr	\N	https://github.com/slindstr	https://avatars.githubusercontent.com/u/224294?v=3	San Francisco, CA
2399	ericduran	\N	https://github.com/ericduran	https://avatars.githubusercontent.com/u/118016?v=3	New York, NY
2477	fhemberger	\N	https://github.com/fhemberger	https://avatars.githubusercontent.com/u/153481?v=3	Cologne, Germany
2521	btford	\N	https://github.com/btford	https://avatars.githubusercontent.com/u/474988?v=3	San Francisco, CA
9767	vitorbal	\N	https://github.com/vitorbal	https://avatars.githubusercontent.com/u/626038?v=3	Munich
2441	mateusortiz	mteusortiz@gmail.com	https://github.com/mateusortiz	https://avatars.githubusercontent.com/u/3077085?v=3	Brazil
2531	ksheedlo	\N	https://github.com/ksheedlo	https://avatars.githubusercontent.com/u/1271410?v=3	San Francisco, CA
2533	realityking	\N	https://github.com/realityking	https://avatars.githubusercontent.com/u/628508?v=3	Berlin, Germany
2543	faost	\N	https://github.com/faost	https://avatars.githubusercontent.com/u/736073?v=3	Russia, Moscow
2549	cburgdorf	\N	https://github.com/cburgdorf	https://avatars.githubusercontent.com/u/521109?v=3	Hannover / Germany
2551	danielzen	\N	https://github.com/danielzen	https://avatars.githubusercontent.com/u/1350534?v=3	New York, NY
2557	rolaveric	\N	https://github.com/rolaveric	https://avatars.githubusercontent.com/u/960670?v=3	Sydney, Australia
2539	NgDashboard	\N	https://github.com/NgDashboard	https://avatars.githubusercontent.com/u/6013193?v=3	\N
2579	softweave	\N	https://github.com/softweave	https://avatars.githubusercontent.com/u/2711933?v=3	\N
2567	asapach	dreamsonic@tut.by	https://github.com/asapach	https://avatars.githubusercontent.com/u/1755336?v=3	Minsk, Belarus
2593	drumaddict	\N	https://github.com/drumaddict	https://avatars.githubusercontent.com/u/323951?v=3	Athens,Greece
2711	kaorun343	\N	https://github.com/kaorun343	https://avatars.githubusercontent.com/u/5625395?v=3	Japan
2671	justinfagnani	\N	https://github.com/justinfagnani	https://avatars.githubusercontent.com/u/522948?v=3	\N
2713	bluemsn	\N	https://github.com/bluemsn	https://avatars.githubusercontent.com/u/3715420?v=3	\N
2591	Zolmeister	zolikahan@gmail.com	https://github.com/Zolmeister	https://avatars.githubusercontent.com/u/700546?v=3	\N
2657	ajoslin	andrewtjoslin@gmail.com	https://github.com/ajoslin	https://avatars.githubusercontent.com/u/1265995?v=3	USA
2699	gdi2290	github@gdi2290.com	https://github.com/gdi2290	https://avatars.githubusercontent.com/u/1016365?v=3	San Francisco, CA
2707	defcc	chengchao1@gmail.com	https://github.com/defcc	https://avatars.githubusercontent.com/u/2603918?v=3	china
2753	gavynriebau	\N	https://github.com/gavynriebau	https://avatars.githubusercontent.com/u/11895736?v=3	\N
2729	iagafonov	armadil@yandex.ru	https://github.com/iagafonov	https://avatars.githubusercontent.com/u/6047078?v=3	\N
2719	bmax	bmax1337@gmail.com	https://github.com/bmax	https://avatars.githubusercontent.com/u/158370?v=3	United States
2731	maraisr	hi@marais.io	https://github.com/maraisr	https://avatars.githubusercontent.com/u/599459?v=3	Gold Coast, Australia
2741	juukie	j.vandijk@activecreations.nl	https://github.com/juukie	https://avatars.githubusercontent.com/u/2678657?v=3	Netherlands
2749	yolo2013	xuhua.yolo@gmail.com	https://github.com/yolo2013	https://avatars.githubusercontent.com/u/5243482?v=3	China
2767	inlineLt	info@inline.lt	https://github.com/inlineLt	https://avatars.githubusercontent.com/u/8105706?v=3	Lithuania
2771	niallobrien	\N	https://github.com/niallobrien	https://avatars.githubusercontent.com/u/1525669?v=3	Waterford, Ireland
2819	TomKita	\N	https://github.com/TomKita	https://avatars.githubusercontent.com/u/1854580?v=3	Chicago
2791	jsedlacek	\N	https://github.com/jsedlacek	https://avatars.githubusercontent.com/u/10656?v=3	\N
2777	hingsir	hingsir1024@gmail.com	https://github.com/hingsir	https://avatars.githubusercontent.com/u/8073352?v=3	Shanghai
2797	janschoenherr	\N	https://github.com/janschoenherr	https://avatars.githubusercontent.com/u/355427?v=3	\N
2801	jwondrusch	\N	https://github.com/jwondrusch	https://avatars.githubusercontent.com/u/1430297?v=3	\N
2789	gbezyuk	me@gbezyuk.ru	https://github.com/gbezyuk	https://avatars.githubusercontent.com/u/1452165?v=3	St-Petersburg, Russia
2803	qt911025	qt911025@163.com	https://github.com/qt911025	https://avatars.githubusercontent.com/u/7759553?v=3	Hezhou
2879	boushley	boushley@gmail.com	https://github.com/boushley	https://avatars.githubusercontent.com/u/101239?v=3	Seattle, WA
3049	dfabulich	\N	https://github.com/dfabulich	https://avatars.githubusercontent.com/u/96150?v=3	\N
2887	asudoh	asudoh@gmail.com	https://github.com/asudoh	https://avatars.githubusercontent.com/u/1259051?v=3	Toyosu, Tokyo, Japan
2941	megawac	yeatesgraeme@gmail.com	https://github.com/megawac	https://avatars.githubusercontent.com/u/3475472?v=3	Waterloo, Ontario
2971	sheerun	sheerun@sher.pl	https://github.com/sheerun	https://avatars.githubusercontent.com/u/292365?v=3	Poland
3037	hornbeck	hornbeck@gmail.com	https://github.com/hornbeck	https://avatars.githubusercontent.com/u/49?v=3	Lawton, OK
3041	gabriel	gabrielh@gmail.com	https://github.com/gabriel	https://avatars.githubusercontent.com/u/2669?v=3	San Francisco, CA
3043	emerose	quigley@emerose.com	https://github.com/emerose	https://avatars.githubusercontent.com/u/2875?v=3	San Francisco, CA
3079	augustl	\N	https://github.com/augustl	https://avatars.githubusercontent.com/u/375?v=3	Oslo, Norway
3061	tristandunn	hello@tristandunn.com	https://github.com/tristandunn	https://avatars.githubusercontent.com/u/8506?v=3	Boston, MA
3067	schmidt	schmidt@nach-vorne.eu	https://github.com/schmidt	https://avatars.githubusercontent.com/u/734?v=3	Berlin, Germany
3077	smtlaissezfaire	scott@railsnewbie.com	https://github.com/smtlaissezfaire	https://avatars.githubusercontent.com/u/3690?v=3	San Francisco
3083	abhay	abhay@opensynapse.net	https://github.com/abhay	https://avatars.githubusercontent.com/u/75?v=3	San Francisco, CA
3187	steveklabnik	steve@steveklabnik.com	https://github.com/steveklabnik	https://avatars.githubusercontent.com/u/27786?v=3	Brooklyn
3229	carlesjove	\N	https://github.com/carlesjove	https://avatars.githubusercontent.com/u/1800981?v=3	Dosrius (Catalunya)
3247	jaredbeck	\N	https://github.com/jaredbeck	https://avatars.githubusercontent.com/u/380809?v=3	Ithaca, NY
3203	mschulkind	\N	https://github.com/mschulkind	https://avatars.githubusercontent.com/u/523089?v=3	\N
3209	zmillman	zach.millman@gmail.com	https://github.com/zmillman	https://avatars.githubusercontent.com/u/1028921?v=3	\N
3221	showaltb	showaltb@gmail.com	https://github.com/showaltb	https://avatars.githubusercontent.com/u/5165?v=3	\N
3217	rmm5t	ryan@mcgeary.org	https://github.com/rmm5t	https://avatars.githubusercontent.com/u/740?v=3	Louisville / Boulder, CO (Colorado)
3251	czarneckid	me@davidczarnecki.com	https://github.com/czarneckid	https://avatars.githubusercontent.com/u/72727?v=3	New York
3383	kamipo	\N	https://github.com/kamipo	https://avatars.githubusercontent.com/u/12642?v=3	Tokyo, Japan
3253	Empact	ben.woosley@gmail.com	https://github.com/Empact	https://avatars.githubusercontent.com/u/5470?v=3	San Francisco, CA
3389	sickill	\N	https://github.com/sickill	https://avatars.githubusercontent.com/u/17589?v=3	Krakow, Poland
3313	seanpdoyle	seandoyle@thoughtbot.com	https://github.com/seanpdoyle	https://avatars.githubusercontent.com/u/2575027?v=3	\N
3433	richlowe	richlowe@richlowe.net	https://github.com/richlowe	https://avatars.githubusercontent.com/u/245797?v=3	Washington, DC
3463	bbaia	\N	https://github.com/bbaia	https://avatars.githubusercontent.com/u/502642?v=3	Toulouse, France
3469	maxogden	\N	https://github.com/maxogden	https://avatars.githubusercontent.com/u/39759?v=3	Oregon
3467	geebee	\N	https://github.com/geebee	https://avatars.githubusercontent.com/u/372635?v=3	\N
3491	tgross	tim@0x74696d.com	https://github.com/tgross	https://avatars.githubusercontent.com/u/1409219?v=3	\N
3449	jgmills	gary_mills@fastmail.fm	https://github.com/jgmills	https://avatars.githubusercontent.com/u/5184034?v=3	Winnipeg, Manitoba, Canada
3457	davidlehn	dil@lehn.org	https://github.com/davidlehn	https://avatars.githubusercontent.com/u/109587?v=3	Blacksburg, VA, USA
3461	bahamas10	dave@daveeddy.com	https://github.com/bahamas10	https://avatars.githubusercontent.com/u/1205722?v=3	Buffalo, NY
3499	sjorge	\N	https://github.com/sjorge	https://avatars.githubusercontent.com/u/379665?v=3	Belgium
3587	piscisaureus	\N	https://github.com/piscisaureus	https://avatars.githubusercontent.com/u/218257?v=3	Amsterdam
3643	jessbrandi	\N	https://github.com/jessbrandi	https://avatars.githubusercontent.com/u/624428?v=3	\N
3533	algorist	github.algorist@ckwalters.com	https://github.com/algorist	https://avatars.githubusercontent.com/u/76272?v=3	\N
3511	danielsdeleo	dan@kallistec.com	https://github.com/danielsdeleo	https://avatars.githubusercontent.com/u/37162?v=3	Seattle, WA
3517	thommay	thom@may.lt	https://github.com/thommay	https://avatars.githubusercontent.com/u/8500?v=3	London
3539	seth	seth@chef.io	https://github.com/seth	https://avatars.githubusercontent.com/u/1619?v=3	Seattle, WA, USA
3673	dcancel	\N	https://github.com/dcancel	https://avatars.githubusercontent.com/u/2036?v=3	Cambridge, MA, US
3767	youknowone	\N	https://github.com/youknowone	https://avatars.githubusercontent.com/u/69878?v=3	Seoul, The Republic of Korea
3671	thinkclay	thinkclay@gmail.com	https://github.com/thinkclay	https://avatars.githubusercontent.com/u/209344?v=3	Lake, MI
3677	eipark	ernie.park@gmail.com	https://github.com/eipark	https://avatars.githubusercontent.com/u/723778?v=3	Cambridge, MA
3947	cko	\N	https://github.com/cko	https://avatars.githubusercontent.com/u/68239?v=3	Munich
3847	cziegeler	\N	https://github.com/cziegeler	https://avatars.githubusercontent.com/u/3958409?v=3	\N
3851	justinedelson	\N	https://github.com/justinedelson	https://avatars.githubusercontent.com/u/65906?v=3	\N
3853	stefan-egli	\N	https://github.com/stefan-egli	https://avatars.githubusercontent.com/u/8300790?v=3	\N
3877	covener	covener@apache.org	https://github.com/covener	https://avatars.githubusercontent.com/u/908093?v=3	\N
3859	jukka	jukka@zitting.name	https://github.com/jukka	https://avatars.githubusercontent.com/u/22447?v=3	Chestnut Hill, Massachusetts, USA
3863	tmaret	timothee.maret@gmail.com	https://github.com/tmaret	https://avatars.githubusercontent.com/u/1628648?v=3	Basel
3881	RoUS	The.Rodent.of.Unusual.Size@GMail.Com	https://github.com/RoUS	https://avatars.githubusercontent.com/u/277209?v=3	Raleigh, North Carolina, USA, NA, Terra, ~1.0 AU Solar orbit
3961	chirino	hiram@hiramchirino.com	https://github.com/chirino	https://avatars.githubusercontent.com/u/103255?v=3	Tampa, FL
4007	abh	ask@develooper.com	https://github.com/abh	https://avatars.githubusercontent.com/u/16861?v=3	Los Angeles, CA
4063	andrewgaul	andrew@gaul.org	https://github.com/andrewgaul	https://avatars.githubusercontent.com/u/848247?v=3	San Francisco
4091	sboisvert	\N	https://github.com/sboisvert	https://avatars.githubusercontent.com/u/289193?v=3	Ottawa, Canada
4097	ebensing	\N	https://github.com/ebensing	https://avatars.githubusercontent.com/u/1506233?v=3	New York, NY
4111	jondavidjohn	\N	https://github.com/jondavidjohn	https://avatars.githubusercontent.com/u/401520?v=3	Springfield, MO
4073	ash2k	\N	https://github.com/ash2k	https://avatars.githubusercontent.com/u/126021?v=3	\N
4079	vnsavage	\N	https://github.com/vnsavage	https://avatars.githubusercontent.com/u/1204149?v=3	\N
4093	jeremyfelt	jeremy.felt@gmail.com	https://github.com/jeremyfelt	https://avatars.githubusercontent.com/u/286171?v=3	Pullman, WA
4099	ChristianMurphy	christian.murphy.42@gmail.com	https://github.com/ChristianMurphy	https://avatars.githubusercontent.com/u/3107513?v=3	Arizona
4127	TooTallNate	nathan@tootallnate.net	https://github.com/TooTallNate	https://avatars.githubusercontent.com/u/71256?v=3	San Francisco, CA
4133	calvinfo	\N	https://github.com/calvinfo	https://avatars.githubusercontent.com/u/487539?v=3	San Francisco
4139	clbn	\N	https://github.com/clbn	https://avatars.githubusercontent.com/u/1071933?v=3	Stockholm, Sweden
4129	tmuellerleile	tobias@muellerleile.net	https://github.com/tmuellerleile	https://avatars.githubusercontent.com/u/165421?v=3	\N
4153	atomizer	danila.gerasimov@gmail.com	https://github.com/atomizer	https://avatars.githubusercontent.com/u/418303?v=3	Russia
4157	rochoa	rochoaf@gmail.com	https://github.com/rochoa	https://avatars.githubusercontent.com/u/45346?v=3	Madrid, Spain
4159	targos	targos@protonmail.com	https://github.com/targos	https://avatars.githubusercontent.com/u/2352663?v=3	Lausanne, Switzerland
4177	natebot	webmaster@grist.org	https://github.com/natebot	https://avatars.githubusercontent.com/u/83074?v=3	Seattle, Wa
4217	behrad	\N	https://github.com/behrad	https://avatars.githubusercontent.com/u/2151889?v=3	Tehran/Iran
4201	stevenvachon	contact@svachon.com	https://github.com/stevenvachon	https://avatars.githubusercontent.com/u/170197?v=3	Toronto, Canada
4211	raine	raine.virta@gmail.com	https://github.com/raine	https://avatars.githubusercontent.com/u/11027?v=3	Helsinki, Finland
4219	kirrg001	katharina.irrgang@googlemail.com	https://github.com/kirrg001	https://avatars.githubusercontent.com/u/1160712?v=3	Berlin
4229	jdesboeufs	jerome.desboeufs@gmail.com	https://github.com/jdesboeufs	https://avatars.githubusercontent.com/u/1231232?v=3	Paris
4231	bulkan	bulkan@gmail.com	https://github.com/bulkan	https://avatars.githubusercontent.com/u/13985?v=3	Australia, Melbourne
4253	simonwheatley	\N	https://github.com/simonwheatley	https://avatars.githubusercontent.com/u/233434?v=3	Manchester, UK
4259	imsimond	\N	https://github.com/imsimond	https://avatars.githubusercontent.com/u/663859?v=3	\N
4483	souravsingh	\N	https://github.com/souravsingh	https://avatars.githubusercontent.com/u/4314261?v=3	\N
4241	vhain	vhain6512@gmail.com	https://github.com/vhain	https://avatars.githubusercontent.com/u/1812260?v=3	\N
4243	pgherveou	pg@jogabo.com	https://github.com/pgherveou	https://avatars.githubusercontent.com/u/521091?v=3	San Francisco
4451	gitter-badger	badger@gitter.im	https://github.com/gitter-badger	https://avatars.githubusercontent.com/u/8518239?v=3	Safe in the Gitter den
4481	keeb	nstinemates@gmail.com	https://github.com/keeb	https://avatars.githubusercontent.com/u/15742?v=3	San Francisco, CA
4493	vdemeester	\N	https://github.com/vdemeester	https://avatars.githubusercontent.com/u/6508?v=3	Paris, France
4507	albers	\N	https://github.com/albers	https://avatars.githubusercontent.com/u/2901725?v=3	Hamburg, Germany
4523	consultantRR	\N	https://github.com/consultantRR	https://avatars.githubusercontent.com/u/4399454?v=3	\N
4513	dmcgowan	derek@mcgstyle.net	https://github.com/dmcgowan	https://avatars.githubusercontent.com/u/169601?v=3	San Jose
4517	bacongobbler	mfisher@deis.com	https://github.com/bacongobbler	https://avatars.githubusercontent.com/u/1360539?v=3	Nanoose Bay, BC
4519	noxiouz	noxiouz@yandex.ru	https://github.com/noxiouz	https://avatars.githubusercontent.com/u/664573?v=3	Moscow, Russia
4547	phensley	\N	https://github.com/phensley	https://avatars.githubusercontent.com/u/53846?v=3	New York, NY
4583	Wilfred	\N	https://github.com/Wilfred	https://avatars.githubusercontent.com/u/70800?v=3	London, UK
4561	bernardopericacho	\N	https://github.com/bernardopericacho	https://avatars.githubusercontent.com/u/1529456?v=3	\N
4549	lots0logs	dustin@falgout.us	https://github.com/lots0logs	https://avatars.githubusercontent.com/u/4675662?v=3	Gulf Coast, USA
4567	ewindisch	eric@iopipe.com	https://github.com/ewindisch	https://avatars.githubusercontent.com/u/73207?v=3	Philadelphia, Pennsylvania
4573	dregin	dregin@redbrick.dcu.ie	https://github.com/dregin	https://avatars.githubusercontent.com/u/165811?v=3	Dublin, Ireland
4649	whyrusleeping	why@ipfs.io	https://github.com/whyrusleeping	https://avatars.githubusercontent.com/u/1243164?v=3	Seattle, Wa
4703	denji	\N	https://github.com/denji	https://avatars.githubusercontent.com/u/3759759?v=3	Kiyv, UA
4777	robmadole	\N	https://github.com/robmadole	https://avatars.githubusercontent.com/u/132895?v=3	Oronogo, Missouri
4787	drmonkeyninja	\N	https://github.com/drmonkeyninja	https://avatars.githubusercontent.com/u/357623?v=3	Sheffield
4789	bengadbois	\N	https://github.com/bengadbois	https://avatars.githubusercontent.com/u/1879785?v=3	California, USA
4811	mockdeep	\N	https://github.com/mockdeep	https://avatars.githubusercontent.com/u/80543?v=3	San Francisco, California
4721	zchee	zchee.io@gmail.com	https://github.com/zchee	https://avatars.githubusercontent.com/u/6366270?v=3	Tokyo, Japan
4799	brandoncc	\N	https://github.com/brandoncc	https://avatars.githubusercontent.com/u/543973?v=3	\N
4723	smashwilson	smashwilson@gmail.com	https://github.com/smashwilson	https://avatars.githubusercontent.com/u/17565?v=3	\N
4783	mtscout6	mtscout6+github@gmail.com	https://github.com/mtscout6	https://avatars.githubusercontent.com/u/736870?v=3	Salt Lake City, UT
4793	Vusys	bryan@vuii.co.uk	https://github.com/Vusys	https://avatars.githubusercontent.com/u/4213522?v=3	Worcester, United Kingdom
4801	brianpattison	brian@brianpattison.com	https://github.com/brianpattison	https://avatars.githubusercontent.com/u/124570?v=3	Fargo, ND
4813	timvandijck	tim.van.dijck@gmail.com	https://github.com/timvandijck	https://avatars.githubusercontent.com/u/4528796?v=3	Belgium
4817	mrsweaters	\N	https://github.com/mrsweaters	https://avatars.githubusercontent.com/u/535897?v=3	Santa Cruz, CA
4831	Deckluhm	\N	https://github.com/Deckluhm	https://avatars.githubusercontent.com/u/2947925?v=3	Nîmes, France
4861	jgillette	\N	https://github.com/jgillette	https://avatars.githubusercontent.com/u/1019565?v=3	\N
5011	ProLoser	\N	https://github.com/ProLoser	https://avatars.githubusercontent.com/u/67395?v=3	San Francisco
4871	paolochiodi	chiodi84@gmail.com	https://github.com/paolochiodi	https://avatars.githubusercontent.com/u/81542?v=3	Sirone, LC - Italy
4877	cmwinters	cmwinters@github.com	https://github.com/cmwinters	https://avatars.githubusercontent.com/u/1295166?v=3	Santa Cruz, CA
4889	dragthor	kris.krause@gmail.com	https://github.com/dragthor	https://avatars.githubusercontent.com/u/156634?v=3	New Jersey
5051	douglasduteil	douglasduteil@gmail.com	https://github.com/douglasduteil	https://avatars.githubusercontent.com/u/730511?v=3	Paris, France
5059	darthdeus	darthdeus@gmail.com	https://github.com/darthdeus	https://avatars.githubusercontent.com/u/123374?v=3	Prague, Czech Republic
5077	eemece2	\N	https://github.com/eemece2	https://avatars.githubusercontent.com/u/452889?v=3	Getxo, Spain
5099	eczajk1	\N	https://github.com/eczajk1	https://avatars.githubusercontent.com/u/2584923?v=3	Maryland
5107	wrakky	\N	https://github.com/wrakky	https://avatars.githubusercontent.com/u/3098560?v=3	Swindon, UK
5113	creativelikeadog	\N	https://github.com/creativelikeadog	https://avatars.githubusercontent.com/u/3382621?v=3	\N
5101	jamestalmage	james@talmage.io	https://github.com/jamestalmage	https://avatars.githubusercontent.com/u/4082216?v=3	\N
5081	nateabele	nate@radify.io	https://github.com/nateabele	https://avatars.githubusercontent.com/u/18288?v=3	Philadelphia, PA
5087	nmccready	nemtcan@gmail.com	https://github.com/nmccready	https://avatars.githubusercontent.com/u/583593?v=3	Manassas VA
5119	deeg	dan@gornstein.com	https://github.com/deeg	https://avatars.githubusercontent.com/u/2857769?v=3	San Diego, CA
5167	ksperling	\N	https://github.com/ksperling	https://avatars.githubusercontent.com/u/794414?v=3	New Zealand
5147	dlgski	\N	https://github.com/dlgski	https://avatars.githubusercontent.com/u/864912?v=3	\N
5153	maxcan	i+gh@cantor.mx	https://github.com/maxcan	https://avatars.githubusercontent.com/u/646732?v=3	San Francisco
5171	ysbaddaden	julien@portalier.com	https://github.com/ysbaddaden	https://avatars.githubusercontent.com/u/47380?v=3	Nogent sur Oise, France
5189	adiroiban	\N	https://github.com/adiroiban	https://avatars.githubusercontent.com/u/204609?v=3	VGR, La Gomera
5197	walkingice	\N	https://github.com/walkingice	https://avatars.githubusercontent.com/u/54793?v=3	Taiwan/Hsinchu
5309	subhaze	\N	https://github.com/subhaze	https://avatars.githubusercontent.com/u/141903?v=3	Knoxville, TN
5179	joshuahiggins	hello@joshuahiggins.com	https://github.com/joshuahiggins	https://avatars.githubusercontent.com/u/879413?v=3	Charlotte, NC
5209	wuliupo	wuliupo@163.com	https://github.com/wuliupo	https://avatars.githubusercontent.com/u/1187809?v=3	Shanghai
5231	capaj	capajj@gmail.com	https://github.com/capaj	https://avatars.githubusercontent.com/u/1305378?v=3	Brno, Czech republic
5281	Toilal	toilal.dev@gmail.com	https://github.com/Toilal	https://avatars.githubusercontent.com/u/1165758?v=3	Orléans, France
5389	excentris	netrunner@gmail.com	https://github.com/excentris	https://avatars.githubusercontent.com/u/1089593?v=3	The Netherlands
5413	Hout	\N	https://github.com/Hout	https://avatars.githubusercontent.com/u/641321?v=3	The Netherlands
5417	thestoics	\N	https://github.com/thestoics	https://avatars.githubusercontent.com/u/136299?v=3	Grand Rapids
5407	jwang	john@johntwang.com	https://github.com/jwang	https://avatars.githubusercontent.com/u/74253?v=3	Cupertino, CA
5419	josemando	\N	https://github.com/josemando	https://avatars.githubusercontent.com/u/946167?v=3	São Paulo, Brazil
5431	kemenaran	\N	https://github.com/kemenaran	https://avatars.githubusercontent.com/u/179923?v=3	Paris
5437	mgregson	\N	https://github.com/mgregson	https://avatars.githubusercontent.com/u/333572?v=3	San Francisco, CA
5441	janoberst	\N	https://github.com/janoberst	https://avatars.githubusercontent.com/u/19206?v=3	San Francisco
5443	yliang6	\N	https://github.com/yliang6	https://avatars.githubusercontent.com/u/308273?v=3	\N
5449	whatthejeff	whatthejeff@gmail.com	https://github.com/whatthejeff	https://avatars.githubusercontent.com/u/306525?v=3	Atlanta, GA
5581	asparagui	koonce@gmail.com	https://github.com/asparagui	https://avatars.githubusercontent.com/u/518607?v=3	San Francisco, CA
5591	tschoonj	Tom.Schoonjans@gmail.com	https://github.com/tschoonj	https://avatars.githubusercontent.com/u/65736?v=3	Oxford, United Kingdom
5623	cheungpat	\N	https://github.com/cheungpat	https://avatars.githubusercontent.com/u/170071?v=3	Hong Kong
5669	FrankSansC	\N	https://github.com/FrankSansC	https://avatars.githubusercontent.com/u/3471406?v=3	Grenoble, France
5641	mcuelenaere	\N	https://github.com/mcuelenaere	https://avatars.githubusercontent.com/u/1682432?v=3	\N
5657	neoascetic	i@neoascetic.me	https://github.com/neoascetic	https://avatars.githubusercontent.com/u/725836?v=3	\N
5659	sandlst	sandlst@auburn.edu	https://github.com/sandlst	https://avatars.githubusercontent.com/u/1319164?v=3	\N
5627	alyssais	hi@alyssa.is	https://github.com/alyssais	https://avatars.githubusercontent.com/u/2768870?v=3	Edinburgh, Scotland
5639	arnested	arne@arnested.dk	https://github.com/arnested	https://avatars.githubusercontent.com/u/190005?v=3	Copenhagen, Denmark
5647	andot	andot@hprose.com	https://github.com/andot	https://avatars.githubusercontent.com/u/232161?v=3	China
5651	mvriel	me@mikevanriel.com	https://github.com/mvriel	https://avatars.githubusercontent.com/u/193704?v=3	Hoorn, Netherlands
5653	tomyun	tomyun@gmail.com	https://github.com/tomyun	https://avatars.githubusercontent.com/u/906626?v=3	Seattle, WA
5711	Blaisorblade	\N	https://github.com/Blaisorblade	https://avatars.githubusercontent.com/u/289960?v=3	Tübingen, Germany
5689	gmacon	\N	https://github.com/gmacon	https://avatars.githubusercontent.com/u/238853?v=3	\N
5729	kenzierocks	\N	https://github.com/kenzierocks	https://avatars.githubusercontent.com/u/2093023?v=3	\N
5683	lembacon	i@lembacon.com	https://github.com/lembacon	https://avatars.githubusercontent.com/u/251435?v=3	Beijing, China
5693	dpo	dominique.orban@gmail.com	https://github.com/dpo	https://avatars.githubusercontent.com/u/38760?v=3	Canada
5701	CarlosBorroto	carlosborroto@genepeeks.com	https://github.com/CarlosBorroto	https://avatars.githubusercontent.com/u/240588?v=3	New York, NY, US
5717	adammw	adman.com@gmail.com	https://github.com/adammw	https://avatars.githubusercontent.com/u/153219?v=3	Melbourne, Australia
5741	chinthakagodawita	\N	https://github.com/chinthakagodawita	https://avatars.githubusercontent.com/u/1452384?v=3	Sydney, Australia
5743	joemaller	\N	https://github.com/joemaller	https://avatars.githubusercontent.com/u/8320?v=3	NYC
5933	adamdbradley	\N	https://github.com/adamdbradley	https://avatars.githubusercontent.com/u/452425?v=3	Madison, Wisconsin
5939	perrygovier	\N	https://github.com/perrygovier	https://avatars.githubusercontent.com/u/571056?v=3	Madison, WI
5737	janrito	alejandro.giacometti@gmail.com	https://github.com/janrito	https://avatars.githubusercontent.com/u/31504?v=3	London
5749	rob	rob@rawb.net	https://github.com/rob	https://avatars.githubusercontent.com/u/503?v=3	Connecticut
5779	reitermarkus	me@reitermark.us	https://github.com/reitermarkus	https://avatars.githubusercontent.com/u/1309829?v=3	Austria
5791	marcqualie	marc@marcqualie.com	https://github.com/marcqualie	https://avatars.githubusercontent.com/u/101022?v=3	North East, England
5843	runar	runar@tveiten.io	https://github.com/runar	https://avatars.githubusercontent.com/u/189879?v=3	Norway
5953	alan-agius4	\N	https://github.com/alan-agius4	https://avatars.githubusercontent.com/u/17563226?v=3	Malta
5981	yuanyan	\N	https://github.com/yuanyan	https://avatars.githubusercontent.com/u/677114?v=3	China
5987	kubabrecka	kuba.brecka@gmail.com	https://github.com/kubabrecka	https://avatars.githubusercontent.com/u/1186214?v=3	\N
6043	huerlisi	simon.huerlimann@cyt.ch	https://github.com/huerlisi	https://avatars.githubusercontent.com/u/11375?v=3	Steinhausen, Switzerland
6047	morenoh149	harry@capsulerx.com	https://github.com/morenoh149	https://avatars.githubusercontent.com/u/587438?v=3	New York, NY
6053	jcleblanc	joncleblanc@yahoo.com	https://github.com/jcleblanc	https://avatars.githubusercontent.com/u/104491?v=3	Royal Palm Beach, FL
6067	xzyfer	\N	https://github.com/xzyfer	https://avatars.githubusercontent.com/u/579928?v=3	Australia
6151	aslushnikov	\N	https://github.com/aslushnikov	https://avatars.githubusercontent.com/u/746130?v=3	Saint Petersburg, Russia
6073	mislam77	\N	https://github.com/mislam77	https://avatars.githubusercontent.com/u/386152?v=3	\N
6143	lynschinzer	\N	https://github.com/lynschinzer	https://avatars.githubusercontent.com/u/1128757?v=3	\N
6133	marijnh	marijnh@gmail.com	https://github.com/marijnh	https://avatars.githubusercontent.com/u/144427?v=3	Berlin
6197	adrocknaphobia	\N	https://github.com/adrocknaphobia	https://avatars.githubusercontent.com/u/1197545?v=3	RockVegas, MD
6163	chrisbank	\N	https://github.com/chrisbank	https://avatars.githubusercontent.com/u/458642?v=3	\N
6173	dangoor	kid@blazingthings.com	https://github.com/dangoor	https://avatars.githubusercontent.com/u/55970?v=3	Ann Arbor, MI
6199	mc10	kevinji@berkeley.edu	https://github.com/mc10	https://avatars.githubusercontent.com/u/1146876?v=3	United States
6203	doismellburning	github@doismellburning.co.uk	https://github.com/doismellburning	https://avatars.githubusercontent.com/u/817118?v=3	London, UK
6211	kaydenl	kenneth@whitecape.org	https://github.com/kaydenl	https://avatars.githubusercontent.com/u/7066510?v=3	Hillsboro, Oregon, USA
6217	Wallbraker	\N	https://github.com/Wallbraker	https://avatars.githubusercontent.com/u/57528?v=3	Gothenburg, Sweden
6221	dbnicholson	\N	https://github.com/dbnicholson	https://avatars.githubusercontent.com/u/6495518?v=3	\N
6229	thomashvmw	\N	https://github.com/thomashvmw	https://avatars.githubusercontent.com/u/17000746?v=3	\N
6239	mibalan	\N	https://github.com/mibalan	https://avatars.githubusercontent.com/u/1461125?v=3	\N
6257	astearns	\N	https://github.com/astearns	https://avatars.githubusercontent.com/u/1380751?v=3	\N
6247	cjgammon	cj.gammon@gmail.com	https://github.com/cjgammon	https://avatars.githubusercontent.com/u/192022?v=3	\N
6329	maxbrunsfeld	maxbrunsfeld@gmail.com	https://github.com/maxbrunsfeld	https://avatars.githubusercontent.com/u/326587?v=3	Arcata, CA
6337	simurai	\N	https://github.com/simurai	https://avatars.githubusercontent.com/u/378023?v=3	Sapporo, Japan
6367	TomFreudenberg	\N	https://github.com/TomFreudenberg	https://avatars.githubusercontent.com/u/410087?v=3	Hamburg, Germany
6341	probablykevin	\N	https://github.com/probablykevin	https://avatars.githubusercontent.com/u/3596620?v=3	\N
6373	lwblackledge	\N	https://github.com/lwblackledge	https://avatars.githubusercontent.com/u/1142220?v=3	\N
6379	mjansing	\N	https://github.com/mjansing	https://avatars.githubusercontent.com/u/1260530?v=3	\N
6343	thomasjo	thomasjo@gmail.com	https://github.com/thomasjo	https://avatars.githubusercontent.com/u/3622?v=3	Tromsø, Norway
6353	yongkangchen	lx1988cyk@gmail.com	https://github.com/yongkangchen	https://avatars.githubusercontent.com/u/704762?v=3	China, Changsha
6359	CharlieHess	charlie@slack-corp.com	https://github.com/CharlieHess	https://avatars.githubusercontent.com/u/1865957?v=3	San Francisco, CA
6361	bengotow	ben@foundry376.com	https://github.com/bengotow	https://avatars.githubusercontent.com/u/1037212?v=3	Nashville ✈ San Francisco
6389	pusateri	\N	https://github.com/pusateri	https://avatars.githubusercontent.com/u/90469?v=3	The Carolinas
6547	igm	\N	https://github.com/igm	https://avatars.githubusercontent.com/u/152321?v=3	Bratislava, Slovakia
6551	systay	\N	https://github.com/systay	https://avatars.githubusercontent.com/u/402248?v=3	Malmö, Sweden
6521	spring-buildmaster	\N	https://github.com/spring-buildmaster	https://avatars.githubusercontent.com/u/1134463?v=3	\N
6529	philwebb	pwebb@pivotal.io	https://github.com/philwebb	https://avatars.githubusercontent.com/u/519772?v=3	\N
6511	felixrieseberg	felix@felixrieseberg.com	https://github.com/felixrieseberg	https://avatars.githubusercontent.com/u/1426799?v=3	San Francisco
6553	Centonni	komi.innocent@gmail.com	https://github.com/Centonni	https://avatars.githubusercontent.com/u/1955872?v=3	Abidjan, Côte d'Ivoire
6599	Chumper	\N	https://github.com/Chumper	https://avatars.githubusercontent.com/u/919670?v=3	Germany
6563	mahe-ymc	\N	https://github.com/mahe-ymc	https://avatars.githubusercontent.com/u/8296975?v=3	\N
6571	chrisjs	\N	https://github.com/chrisjs	https://avatars.githubusercontent.com/u/539358?v=3	\N
6569	cbeams	chris@beams.io	https://github.com/cbeams	https://avatars.githubusercontent.com/u/301810?v=3	Vienna
6577	willschipp	will.schipp@gmail.com	https://github.com/willschipp	https://avatars.githubusercontent.com/u/3287360?v=3	Dubai, United Arab Emirates
6581	snicoll	snicoll@pivotal.io	https://github.com/snicoll	https://avatars.githubusercontent.com/u/490484?v=3	Liège, Belgium
6749	nathan-muir	\N	https://github.com/nathan-muir	https://avatars.githubusercontent.com/u/3112329?v=3	Australia
6733	avital	avital@thewe.net	https://github.com/avital	https://avatars.githubusercontent.com/u/37586?v=3	San Francisco
6761	Primigenus	\N	https://github.com/Primigenus	https://avatars.githubusercontent.com/u/134624?v=3	Mountain View
6737	sixolet	naomi@seyfer.org	https://github.com/sixolet	https://avatars.githubusercontent.com/u/1633505?v=3	\N
6763	DenisGorbachev	Denis.D.Gorbachev@gmail.com	https://github.com/DenisGorbachev	https://avatars.githubusercontent.com/u/829578?v=3	Moscow, Russia
6779	jhuckabee	joshhuckabee [at] gmail [dot] com	https://github.com/jhuckabee	https://avatars.githubusercontent.com/u/4247?v=3	Arlington, VA
6781	rjrodger	richard.rodger@nearform.com	https://github.com/rjrodger	https://avatars.githubusercontent.com/u/138608?v=3	Ireland
6803	ErikAbele	\N	https://github.com/ErikAbele	https://avatars.githubusercontent.com/u/185813?v=3	Berlin, Germany
6791	cjo9900	\N	https://github.com/cjo9900	https://avatars.githubusercontent.com/u/549480?v=3	\N
6857	sverch	\N	https://github.com/sverch	https://avatars.githubusercontent.com/u/788085?v=3	\N
6793	christkv	christkv@gmail.com	https://github.com/christkv	https://avatars.githubusercontent.com/u/5569?v=3	Barcelona, Spain
6833	blakmatrix	blakmatrix@gmail.com	https://github.com/blakmatrix	https://avatars.githubusercontent.com/u/91209?v=3	Seattle, WA
6917	trevnorris	\N	https://github.com/trevnorris	https://avatars.githubusercontent.com/u/289174?v=3	Salt Lake City, UT
6977	larzconwell	\N	https://github.com/larzconwell	https://avatars.githubusercontent.com/u/1316992?v=3	Georgia
6961	pipobscure	pip@pipobscure.com	https://github.com/pipobscure	https://avatars.githubusercontent.com/u/446127?v=3	London, United Kingdom
6967	armed	artem.medeusheyev@gmail.com	https://github.com/armed	https://avatars.githubusercontent.com/u/223060?v=3	Almaty, Kazakhstan
6971	rmg	r.m.graham@gmail.com	https://github.com/rmg	https://avatars.githubusercontent.com/u/17978?v=3	Langley, BC, Canada
6983	jeffjewiss	jeff@jeffjewiss.com	https://github.com/jeffjewiss	https://avatars.githubusercontent.com/u/354604?v=3	Reading, UK
6991	toastynerd	tylermorgan86@gmail.com	https://github.com/toastynerd	https://avatars.githubusercontent.com/u/1447359?v=3	Seattle, WA
7019	jorrit	\N	https://github.com/jorrit	https://avatars.githubusercontent.com/u/521449?v=3	Breda, The Netherlands
7039	benkroeger	\N	https://github.com/benkroeger	https://avatars.githubusercontent.com/u/7782055?v=3	\N
7001	woodedlawn	jonathan@woodedlawn.com	https://github.com/woodedlawn	https://avatars.githubusercontent.com/u/2685518?v=3	\N
7027	jannyHou	juehou@ca.ibm.com	https://github.com/jannyHou	https://avatars.githubusercontent.com/u/12554153?v=3	\N
6997	tellnes	christian@tellnes.com	https://github.com/tellnes	https://avatars.githubusercontent.com/u/613729?v=3	Trondheim, Norway
7013	superkhau	superkhau@gmail.com	https://github.com/superkhau	https://avatars.githubusercontent.com/u/1617364?v=3	Vancouver, BC, Canada
7157	nibblebot	\N	https://github.com/nibblebot	https://avatars.githubusercontent.com/u/139526?v=3	New Orleans, LA
7159	pigmej	\N	https://github.com/pigmej	https://avatars.githubusercontent.com/u/496754?v=3	Wrocław
7213	draco2003	\N	https://github.com/draco2003	https://avatars.githubusercontent.com/u/196891?v=3	Boston
7229	jgoulah	\N	https://github.com/jgoulah	https://avatars.githubusercontent.com/u/128602?v=3	NYC
7219	volans-	\N	https://github.com/volans-	https://avatars.githubusercontent.com/u/6888121?v=3	\N
7151	zzen	jakub@apiary.io	https://github.com/zzen	https://avatars.githubusercontent.com/u/47515?v=3	Bay Area
7211	morria	asm@collapse.io	https://github.com/morria	https://avatars.githubusercontent.com/u/387209?v=3	New York City
7247	StoneIsle	\N	https://github.com/StoneIsle	https://avatars.githubusercontent.com/u/1032338?v=3	Hamar, Norway
7253	roidelapluie	\N	https://github.com/roidelapluie	https://avatars.githubusercontent.com/u/291750?v=3	Belgium
7237	elblinkin	\N	https://github.com/elblinkin	https://avatars.githubusercontent.com/u/431221?v=3	\N
7243	oker1	firstname at lastname dot cc	https://github.com/oker1	https://avatars.githubusercontent.com/u/431237?v=3	Budapest, Hungary
7283	jaredonline	jared.online@gmail.com	https://github.com/jaredonline	https://avatars.githubusercontent.com/u/14482?v=3	Tucson, AZ
7361	rspieldenner	\N	https://github.com/rspieldenner	https://avatars.githubusercontent.com/u/782102?v=3	San Jose, CA
7393	Vijay2win	\N	https://github.com/Vijay2win	https://avatars.githubusercontent.com/u/242674?v=3	San Jose
7351	elandau	\N	https://github.com/elandau	https://avatars.githubusercontent.com/u/913564?v=3	\N
7369	peterox	\N	https://github.com/peterox	https://avatars.githubusercontent.com/u/804375?v=3	\N
7297	hjr3	herman@hermanradtke.com	https://github.com/hjr3	https://avatars.githubusercontent.com/u/33318?v=3	Downtown Los Angeles
7417	nagaseyasuhito	\N	https://github.com/nagaseyasuhito	https://avatars.githubusercontent.com/u/501239?v=3	\N
7433	vmorarian	vmorarian@gmail.com	https://github.com/vmorarian	https://avatars.githubusercontent.com/u/328763?v=3	\N
7411	tjbaker	tbaker@circle.com	https://github.com/tjbaker	https://avatars.githubusercontent.com/u/3188587?v=3	Boston
7489	phillip	\N	https://github.com/phillip	https://avatars.githubusercontent.com/u/8435?v=3	SF Bay Area, CA, USA
7451	abersnaze	\N	https://github.com/abersnaze	https://avatars.githubusercontent.com/u/406038?v=3	\N
7459	allenxwang	\N	https://github.com/allenxwang	https://avatars.githubusercontent.com/u/1728105?v=3	\N
7487	jameskleeh	\N	https://github.com/jameskleeh	https://avatars.githubusercontent.com/u/1583789?v=3	\N
7457	spiermar	spiermar@gmail.com	https://github.com/spiermar	https://avatars.githubusercontent.com/u/2207415?v=3	Bay Area, CA
7463	jeffreymyers	myersj@gmail.com	https://github.com/jeffreymyers	https://avatars.githubusercontent.com/u/6369501?v=3	Cambridge, MA
7477	claymccoy	github@claymccoy.com	https://github.com/claymccoy	https://avatars.githubusercontent.com/u/2743?v=3	San Jose, CA
7481	zanthrash	zan@zanthrash.com	https://github.com/zanthrash	https://avatars.githubusercontent.com/u/66639?v=3	Bay Area
7547	richo	richo@psych0tik.net	https://github.com/richo	https://avatars.githubusercontent.com/u/476418?v=3	San Francisco
7559	mebigfatguy	dbrosius@mebigfatguy.com	https://github.com/mebigfatguy	https://avatars.githubusercontent.com/u/170161?v=3	Eastern Shore, MD
7673	vladikoff	github@vf.io	https://github.com/vladikoff	https://avatars.githubusercontent.com/u/128755?v=3	North America
7681	theasta	\N	https://github.com/theasta	https://avatars.githubusercontent.com/u/92213?v=3	Vancouver
7727	arendjr	\N	https://github.com/arendjr	https://avatars.githubusercontent.com/u/533294?v=3	Amsterdam, Netherlands
7723	lukeapage	\N	https://github.com/lukeapage	https://avatars.githubusercontent.com/u/309321?v=3	\N
7687	nnnnathann	nathan.bleigh@gmail.com	https://github.com/nnnnathann	https://avatars.githubusercontent.com/u/61154?v=3	Kansas City, MO
7691	searls	justin@testdouble.com	https://github.com/searls	https://avatars.githubusercontent.com/u/79303?v=3	Columbus, OH
7699	mikaelkaron	mikael@karon.se	https://github.com/mikaelkaron	https://avatars.githubusercontent.com/u/478468?v=3	Murcia
7703	floydwch	floydwch@gmail.com	https://github.com/floydwch	https://avatars.githubusercontent.com/u/1651509?v=3	Taipei, Taiwan
7717	steveoh	sgourley@utah.gov	https://github.com/steveoh	https://avatars.githubusercontent.com/u/325813?v=3	utah
7753	bleathem	\N	https://github.com/bleathem	https://avatars.githubusercontent.com/u/265649?v=3	Vancouver BC, Canada
7757	limikael	li.mikael@gmail.com	https://github.com/limikael	https://avatars.githubusercontent.com/u/902911?v=3	\N
7741	tonytopper	ttopper@gmail.com	https://github.com/tonytopper	https://avatars.githubusercontent.com/u/44864?v=3	San Jose, CA
7759	sapegin	artem@sapegin.ru	https://github.com/sapegin	https://avatars.githubusercontent.com/u/70067?v=3	Berlin, Germany
7769	chrisabrams	mail@chrisabrams.com	https://github.com/chrisabrams	https://avatars.githubusercontent.com/u/527740?v=3	New York, NY
7829	stephanebachelier	stephane.bachelier@gmail.com	https://github.com/stephanebachelier	https://avatars.githubusercontent.com/u/172615?v=3	\N
7789	netpro2k	netpro2k@gmail.com	https://github.com/netpro2k	https://avatars.githubusercontent.com/u/130735?v=3	Redwood City, CA
7993	themsaid	themsaid@gmail.com	https://github.com/themsaid	https://avatars.githubusercontent.com/u/4332182?v=3	Egypt
8009	Garbee	\N	https://github.com/Garbee	https://avatars.githubusercontent.com/u/868301?v=3	Virginia, USA
8011	nikush	\N	https://github.com/nikush	https://avatars.githubusercontent.com/u/680339?v=3	London
8039	pmatseykanets	\N	https://github.com/pmatseykanets	https://avatars.githubusercontent.com/u/779965?v=3	Baltimore, MD
8053	hdra	\N	https://github.com/hdra	https://avatars.githubusercontent.com/u/1270857?v=3	Indonesia
8017	gauravmak	gauravmakhecha@gmail.com	https://github.com/gauravmak	https://avatars.githubusercontent.com/u/11887260?v=3	\N
8059	mlantz	matt@yabhq.com	https://github.com/mlantz	https://avatars.githubusercontent.com/u/1065551?v=3	Toronto, Ontario, Canada
8069	lnpbk	\N	https://github.com/lnpbk	https://avatars.githubusercontent.com/u/608543?v=3	United Kingdom
8081	svpernova09	\N	https://github.com/svpernova09	https://avatars.githubusercontent.com/u/967362?v=3	Memphis, TN
8087	martinlindhe	\N	https://github.com/martinlindhe	https://avatars.githubusercontent.com/u/181531?v=3	Sweden
8089	ahsanity	\N	https://github.com/ahsanity	https://avatars.githubusercontent.com/u/88349?v=3	\N
8093	nathanmac	hola@nathanmac.com	https://github.com/nathanmac	https://avatars.githubusercontent.com/u/3205902?v=3	Reading, UK
8101	alxy	alexander@webdesign-guth.de	https://github.com/alxy	https://avatars.githubusercontent.com/u/2057062?v=3	Germany
8111	EspadaV8	espadav8@gmail.com	https://github.com/EspadaV8	https://avatars.githubusercontent.com/u/115825?v=3	Brisbane, QLD
8117	hannesvdvreken	\N	https://github.com/hannesvdvreken	https://avatars.githubusercontent.com/u/1410358?v=3	Ghent, Belgium
8147	PEKTOP	\N	https://github.com/PEKTOP	https://avatars.githubusercontent.com/u/1898063?v=3	Russian
8347	borgboston	\N	https://github.com/borgboston	https://avatars.githubusercontent.com/u/1900652?v=3	\N
8123	lesstif	lesstif@gmail.com	https://github.com/lesstif	https://avatars.githubusercontent.com/u/404534?v=3	South Korea
8143	Max13	adnan@rihan.fr	https://github.com/Max13	https://avatars.githubusercontent.com/u/531249?v=3	Around the globe
8389	Sapphire64	\N	https://github.com/Sapphire64	https://avatars.githubusercontent.com/u/1443567?v=3	Stockholm, Sweden
8431	dwhenry	\N	https://github.com/dwhenry	https://avatars.githubusercontent.com/u/63736?v=3	London
8353	diegotres	diegotres@gmail.com	https://github.com/diegotres	https://avatars.githubusercontent.com/u/39059?v=3	SP, Brazil
8387	yawetse	yaw.etse@gmail.com	https://github.com/yawetse	https://avatars.githubusercontent.com/u/1192414?v=3	New York, NY
8443	excid3	excid3@gmail.com	https://github.com/excid3	https://avatars.githubusercontent.com/u/67093?v=3	Brooklyn, NY
8447	andmej	andr@esmejia.com	https://github.com/andmej	https://avatars.githubusercontent.com/u/9726?v=3	Medellín, Colombia
8461	GCorbel	guirec.corbel@gmail.com	https://github.com/GCorbel	https://avatars.githubusercontent.com/u/1296201?v=3	Sept-Îles, Qc Canada
8467	Dinuz	massimiliano.marzo@gmail.com	https://github.com/Dinuz	https://avatars.githubusercontent.com/u/1139472?v=3	New York City
8483	fabianoarruda	fabianoarruda@gmail.com	https://github.com/fabianoarruda	https://avatars.githubusercontent.com/u/5299669?v=3	Brasília
8563	Oire	\N	https://github.com/Oire	https://avatars.githubusercontent.com/u/595597?v=3	Cherkassy, Ukraine
8573	vnathalye	\N	https://github.com/vnathalye	https://avatars.githubusercontent.com/u/14007809?v=3	Pune, MH, India
8501	robin850	robin.dupret@gmail.com	https://github.com/robin850	https://avatars.githubusercontent.com/u/354185?v=3	France
8513	krzyzak	michal.krzyzanowski+github@gmail.com	https://github.com/krzyzak	https://avatars.githubusercontent.com/u/185015?v=3	\N
8581	wyantb	wyantb@gmail.com	https://github.com/wyantb	https://avatars.githubusercontent.com/u/726818?v=3	\N
8521	fagiani	pfagiani@gmail.com	https://github.com/fagiani	https://avatars.githubusercontent.com/u/2450?v=3	São Paulo, Brazil
8527	stevenh512	stevenh512@gmail.com	https://github.com/stevenh512	https://avatars.githubusercontent.com/u/110500?v=3	Landers, CA, USA
8597	nvdh	\N	https://github.com/nvdh	https://avatars.githubusercontent.com/u/2909621?v=3	Belgium
8609	Frost	\N	https://github.com/Frost	https://avatars.githubusercontent.com/u/2308?v=3	Uppsala
8629	trnl	\N	https://github.com/trnl	https://avatars.githubusercontent.com/u/429240?v=3	Minsk
8599	robgallen	\N	https://github.com/robgallen	https://avatars.githubusercontent.com/u/5539080?v=3	\N
8623	samuelcole	sam@samuelcole.name	https://github.com/samuelcole	https://avatars.githubusercontent.com/u/18301?v=3	Brooklyn, New York
8627	rozza	ross.lawley@gmail.com	https://github.com/rozza	https://avatars.githubusercontent.com/u/420?v=3	United Kingdom
8641	hoffrocket	\N	https://github.com/hoffrocket	https://avatars.githubusercontent.com/u/24408?v=3	New York, NY
8653	ShaneHarvey	\N	https://github.com/ShaneHarvey	https://avatars.githubusercontent.com/u/5015933?v=3	Palo Alto, CA
8669	skazhy	\N	https://github.com/skazhy	https://avatars.githubusercontent.com/u/168427?v=3	Rīga, Latvia / Denver, CO
8681	hptabster	\N	https://github.com/hptabster	https://avatars.githubusercontent.com/u/5590711?v=3	\N
8647	daspilker	mail@daniel-spilker.com	https://github.com/daspilker	https://avatars.githubusercontent.com/u/47957?v=3	Hamburg, Germany
8663	entone	chris@entropealabs.com	https://github.com/entone	https://avatars.githubusercontent.com/u/157357?v=3	Chicago
8677	amidvidy	amidvidy@gmail.com	https://github.com/amidvidy	https://avatars.githubusercontent.com/u/363757?v=3	NYC
8689	FooBarWidget	hongli@phusion.nl	https://github.com/FooBarWidget	https://avatars.githubusercontent.com/u/819?v=3	Amsterdam, Netherlands
8693	jonhyman	jon@appboy.com	https://github.com/jonhyman	https://avatars.githubusercontent.com/u/832655?v=3	NYC
8719	mattparlane	\N	https://github.com/mattparlane	https://avatars.githubusercontent.com/u/176572?v=3	Wellington, New Zealand
8699	timoschilling	timo@schilling.io	https://github.com/timoschilling	https://avatars.githubusercontent.com/u/165599?v=3	Essen, Germany
8713	weltling	\N	https://github.com/weltling	https://avatars.githubusercontent.com/u/22016?v=3	\N
8731	xdg	\N	https://github.com/xdg	https://avatars.githubusercontent.com/u/7625322?v=3	\N
8741	Stevie-O	\N	https://github.com/Stevie-O	https://avatars.githubusercontent.com/u/3076911?v=3	\N
8737	ilmari	ilmari@ilmari.org	https://github.com/ilmari	https://avatars.githubusercontent.com/u/72175?v=3	\N
8707	derickr	github@derickrethans.nl	https://github.com/derickr	https://avatars.githubusercontent.com/u/208074?v=3	London, England
8747	hanumantmk	jcarey@argv.me	https://github.com/hanumantmk	https://avatars.githubusercontent.com/u/150922?v=3	New York City
8971	adimitrov	\N	https://github.com/adimitrov	https://avatars.githubusercontent.com/u/300693?v=3	Sofia, Bulgaria
8753	drzoid	\N	https://github.com/drzoid	https://avatars.githubusercontent.com/u/214597?v=3	\N
8783	dalyd	\N	https://github.com/dalyd	https://avatars.githubusercontent.com/u/7872884?v=3	\N
9029	rogerwang	roger@nwjs.io	https://github.com/rogerwang	https://avatars.githubusercontent.com/u/165401?v=3	\N
8761	gianpaj	hi@gian.xyz	https://github.com/gianpaj	https://avatars.githubusercontent.com/u/899175?v=3	Dublin, Ireland
8779	simi	retro@ballgag.cz	https://github.com/simi	https://avatars.githubusercontent.com/u/193936?v=3	Prague, Czech republic
8941	frewsxcv	coreyf@rwell.org	https://github.com/frewsxcv	https://avatars.githubusercontent.com/u/416575?v=3	New York City
9043	cotejp	\N	https://github.com/cotejp	https://avatars.githubusercontent.com/u/3246696?v=3	Montreal
9049	heavyk	\N	https://github.com/heavyk	https://avatars.githubusercontent.com/u/1226324?v=3	madrid
9067	jaro-sevcik	\N	https://github.com/jaro-sevcik	https://avatars.githubusercontent.com/u/17763629?v=3	\N
9059	hashseed	yangguo@chromium.org	https://github.com/hashseed	https://avatars.githubusercontent.com/u/2291463?v=3	\N
9041	fancycode	mail@joachim-bauch.de	https://github.com/fancycode	https://avatars.githubusercontent.com/u/247730?v=3	Stuttgart, Germany
9091	fredericosilva	\N	https://github.com/fredericosilva	https://avatars.githubusercontent.com/u/927601?v=3	Warsaw, Poland
9137	steffenmllr	\N	https://github.com/steffenmllr	https://avatars.githubusercontent.com/u/449563?v=3	Berlin
9127	dgozman	\N	https://github.com/dgozman	https://avatars.githubusercontent.com/u/9881434?v=3	\N
9133	jeremyroman	jeremy@jeremyroman.com	https://github.com/jeremyroman	https://avatars.githubusercontent.com/u/156119?v=3	\N
9103	thefourtheye	thechargingvolcano@gmail.com	https://github.com/thefourtheye	https://avatars.githubusercontent.com/u/696611?v=3	Chennai
9109	JacksonTian	shyvo1987@gmail.com	https://github.com/JacksonTian	https://avatars.githubusercontent.com/u/327019?v=3	Hangzhou, China
9161	kessler	\N	https://github.com/kessler	https://avatars.githubusercontent.com/u/147367?v=3	Israel
9173	nrako	\N	https://github.com/nrako	https://avatars.githubusercontent.com/u/425397?v=3	Switzerland
9187	af	\N	https://github.com/af	https://avatars.githubusercontent.com/u/25241?v=3	Vancouver, BC
9157	leizleiz	\N	https://github.com/leizleiz	https://avatars.githubusercontent.com/u/12983898?v=3	\N
9151	ruanyl	ruanyu1@gmail.com	https://github.com/ruanyl	https://avatars.githubusercontent.com/u/486382?v=3	Helsinki
9181	mr-wildcard	dev.vialajulien@gmail.com	https://github.com/mr-wildcard	https://avatars.githubusercontent.com/u/6979207?v=3	Bordeaux, France
9221	jnormore	\N	https://github.com/jnormore	https://avatars.githubusercontent.com/u/1075591?v=3	Canada
9197	nico	\N	https://github.com/nico	https://avatars.githubusercontent.com/u/3487?v=3	\N
9227	jonathankwok	jonafunkwok@gmail.com	https://github.com/jonathankwok	https://avatars.githubusercontent.com/u/4521864?v=3	\N
9239	smartacus	michael.lippold@smartacus.net	https://github.com/smartacus	https://avatars.githubusercontent.com/u/77801?v=3	Portland, OR
9241	nigelramsay	nigel.ramsay@abletech.co.nz	https://github.com/nigelramsay	https://avatars.githubusercontent.com/u/6838?v=3	Wellington, New Zealand
9257	Sirupsen	simon@sirupsen.com	https://github.com/Sirupsen	https://avatars.githubusercontent.com/u/97400?v=3	Ottawa, ON
9277	mikeletscher	\N	https://github.com/mikeletscher	https://avatars.githubusercontent.com/u/6666411?v=3	Columbus, Ohio
9283	clayton-shopify	\N	https://github.com/clayton-shopify	https://avatars.githubusercontent.com/u/11052374?v=3	\N
9281	djoume	djoume@taket.org	https://github.com/djoume	https://avatars.githubusercontent.com/u/34644?v=3	Toronto, ON, Canada
9293	Hammadk	hi@hammad.ca	https://github.com/Hammadk	https://avatars.githubusercontent.com/u/129764?v=3	Ontario, Canada 
9299	batasrki	spejic@gmail.com	https://github.com/batasrki	https://avatars.githubusercontent.com/u/2664?v=3	Toronto, ON
9311	RichardBlair	richard@blairingthoughts.com	https://github.com/RichardBlair	https://avatars.githubusercontent.com/u/627801?v=3	Ottawa, ON
9491	quellish	\N	https://github.com/quellish	https://avatars.githubusercontent.com/u/1182353?v=3	Los Angeles, CA
9511	ldrr	\N	https://github.com/ldrr	https://avatars.githubusercontent.com/u/580463?v=3	Wiener Neustadt / Austria
9521	westonplatter	westonplatter@gmail.com	https://github.com/westonplatter	https://avatars.githubusercontent.com/u/492603?v=3	\N
9497	tangphillip	phil.sj.tang@gmail.com	https://github.com/tangphillip	https://avatars.githubusercontent.com/u/463460?v=3	New York
9533	ay8s	contact@andydev.co.uk	https://github.com/ay8s	https://avatars.githubusercontent.com/u/1058408?v=3	San Francisco, CA
9539	pj4533	\N	https://github.com/pj4533	https://avatars.githubusercontent.com/u/110283?v=3	Stanfordville, NY
9571	alvinhu	\N	https://github.com/alvinhu	https://avatars.githubusercontent.com/u/2325860?v=3	\N
9547	touchbyte	info@touchbyte.com	https://github.com/touchbyte	https://avatars.githubusercontent.com/u/1822494?v=3	Hamburg, Germany
9551	veritech	jonathan@float-right.co.uk	https://github.com/veritech	https://avatars.githubusercontent.com/u/71444?v=3	England, UK
9587	dulaccc	pierre@dulaccc.me	https://github.com/dulaccc	https://avatars.githubusercontent.com/u/328718?v=3	Paris
9629	opozo	\N	https://github.com/opozo	https://avatars.githubusercontent.com/u/82517?v=3	Bay Area
9643	Awk34	\N	https://github.com/Awk34	https://avatars.githubusercontent.com/u/5545474?v=3	Indianapolis, IN
9613	tomlane	tom@webdevredemption.com	https://github.com/tomlane	https://avatars.githubusercontent.com/u/642385?v=3	Swindon, United Kingdom
9619	gnuwilliam	sudowilliam@gmail.com	https://github.com/gnuwilliam	https://avatars.githubusercontent.com/u/535794?v=3	Brazil
9623	oguzzkilic	oguzz.kilic@gmail.com	https://github.com/oguzzkilic	https://avatars.githubusercontent.com/u/3652404?v=3	İstanbul
9631	amitmerchant1990	bullredeyes@gmail.com	https://github.com/amitmerchant1990	https://avatars.githubusercontent.com/u/3647841?v=3	Milky Way
9649	ragingwind	ragingwind@gmail.com	https://github.com/ragingwind	https://avatars.githubusercontent.com/u/124117?v=3	Korea
9661	mteodori	\N	https://github.com/mteodori	https://avatars.githubusercontent.com/u/151025?v=3	London, UK
9677	oori	\N	https://github.com/oori	https://avatars.githubusercontent.com/u/200688?v=3	Berlin
9697	safjanowski	\N	https://github.com/safjanowski	https://avatars.githubusercontent.com/u/1997286?v=3	Poznan, Poland
9707	donaldpipowitch	\N	https://github.com/donaldpipowitch	https://avatars.githubusercontent.com/u/1152805?v=3	Germany, Leipzig
9689	tschaub	\N	https://github.com/tschaub	https://avatars.githubusercontent.com/u/41094?v=3	\N
9673	rajarju	arjun@athousandnodes.com	https://github.com/rajarju	https://avatars.githubusercontent.com/u/273188?v=3	Bangalore
9679	awk	awk@awkward.org	https://github.com/awk	https://avatars.githubusercontent.com/u/9641?v=3	Boston, MA
9733	tmcw	tom@macwright.org	https://github.com/tmcw	https://avatars.githubusercontent.com/u/32314?v=3	Washington, DC
9739	floatdrop	floatdrop@gmail.com	https://github.com/floatdrop	https://avatars.githubusercontent.com/u/365089?v=3	Russia, Yekaterinburg
9859	zackhall	\N	https://github.com/zackhall	https://avatars.githubusercontent.com/u/1725349?v=3	Seattle
9839	jfmengels	jfm.engels@gmail.com	https://github.com/jfmengels	https://avatars.githubusercontent.com/u/3869412?v=3	Paris, France
9851	dr-skot	skot@pobox.com	https://github.com/dr-skot	https://avatars.githubusercontent.com/u/1834560?v=3	New York
9857	just-boris	just-boris@hotmail.com	https://github.com/just-boris	https://avatars.githubusercontent.com/u/812240?v=3	Berlin
9871	MikeRyan52	mike.ryan52@gmail.com	https://github.com/MikeRyan52	https://avatars.githubusercontent.com/u/3712277?v=3	Huntsville, Al
9883	pawelz	pawelz@execve.pl	https://github.com/pawelz	https://avatars.githubusercontent.com/u/90792?v=3	Zürich, Switzerland
9907	alfredxing	\N	https://github.com/alfredxing	https://avatars.githubusercontent.com/u/2704010?v=3	Vancouver, Canada
9901	katastrofa999	\N	https://github.com/katastrofa999	https://avatars.githubusercontent.com/u/3437759?v=3	\N
9931	basex	\N	https://github.com/basex	https://avatars.githubusercontent.com/u/357288?v=3	\N
9887	btaudul	wolf.pld@gmail.com	https://github.com/btaudul	https://avatars.githubusercontent.com/u/600573?v=3	\N
9923	j15e	jeanphilippe.doyle@hooktstudios.com	https://github.com/j15e	https://avatars.githubusercontent.com/u/143380?v=3	Qc, Canada
9929	anroots	ando@sqroot.eu	https://github.com/anroots	https://avatars.githubusercontent.com/u/469120?v=3	Estonia
9941	janlindblom	janlindblom@fastmail.fm	https://github.com/janlindblom	https://avatars.githubusercontent.com/u/154438?v=3	Sundsvall, Sweden
9949	borfast	\N	https://github.com/borfast	https://avatars.githubusercontent.com/u/4837?v=3	Portugal
10061	skyfallsin	\N	https://github.com/skyfallsin	https://avatars.githubusercontent.com/u/998?v=3	Silicon Valley, CA
9967	Stargator	wildbug@linuxmail.org	https://github.com/Stargator	https://avatars.githubusercontent.com/u/7527155?v=3	Northern Virginia
10133	pupeno	pupeno@pupeno.com	https://github.com/pupeno	https://avatars.githubusercontent.com/u/8425?v=3	London, UK
10159	dantuck	\N	https://github.com/dantuck	https://avatars.githubusercontent.com/u/473408?v=3	Denver, CO
10163	phaas	\N	https://github.com/phaas	https://avatars.githubusercontent.com/u/1450137?v=3	\N
10289	keydunov	artyom.keydunov@gmail.com	https://github.com/keydunov	https://avatars.githubusercontent.com/u/1618877?v=3	\N
10139	lorenzoplanas	lorenzo@qindio.com	https://github.com/lorenzoplanas	https://avatars.githubusercontent.com/u/171133?v=3	Rota, Spain
10141	Pezmc	email@pezcuckow.com	https://github.com/Pezmc	https://avatars.githubusercontent.com/u/507155?v=3	Digital Nomad, UK
10151	jerrett	jerrett@gmail.com	https://github.com/jerrett	https://avatars.githubusercontent.com/u/2304?v=3	B.C., Canada
10301	chadhietala	\N	https://github.com/chadhietala	https://avatars.githubusercontent.com/u/183799?v=3	San Francisco, CA
10319	perlun	\N	https://github.com/perlun	https://avatars.githubusercontent.com/u/630613?v=3	Sweden & Finland
10321	peritpatrio	\N	https://github.com/peritpatrio	https://avatars.githubusercontent.com/u/729565?v=3	Finland
10337	eccegordo	\N	https://github.com/eccegordo	https://avatars.githubusercontent.com/u/497659?v=3	Seattle, WA
10303	jtaby	majd87@gmail.com	https://github.com/jtaby	https://avatars.githubusercontent.com/u/51309?v=3	\N
10333	patrarl	\N	https://github.com/patrarl	https://avatars.githubusercontent.com/u/1824281?v=3	\N
10313	wifelette	LeahSilber@gmail.com	https://github.com/wifelette	https://avatars.githubusercontent.com/u/25433?v=3	Portland, OR
10331	pixelhandler	pixelhandler@gmail.com	https://github.com/pixelhandler	https://avatars.githubusercontent.com/u/17178?v=3	SoCal
10343	kurtisnelson	kurtisnelson@gmail.com	https://github.com/kurtisnelson	https://avatars.githubusercontent.com/u/169606?v=3	San Francisco, CA
10357	craigteegarden	\N	https://github.com/craigteegarden	https://avatars.githubusercontent.com/u/1930208?v=3	Pittsburgh, PA
10487	nelgau	\N	https://github.com/nelgau	https://avatars.githubusercontent.com/u/1800798?v=3	Los Angeles, California
10489	mcharkov	\N	https://github.com/mcharkov	https://avatars.githubusercontent.com/u/58928?v=3	San Francisco, CA
10513	dcerri	\N	https://github.com/dcerri	https://avatars.githubusercontent.com/u/1693264?v=3	\N
10499	solidsnack	jason.dusek@gmail.com	https://github.com/solidsnack	https://avatars.githubusercontent.com/u/153008?v=3	San Francisco, CA
10501	boivie	victor@boivie.com	https://github.com/boivie	https://avatars.githubusercontent.com/u/106619?v=3	Sweden
10523	lencioni	joe.lencioni@gmail.com	https://github.com/lencioni	https://avatars.githubusercontent.com/u/195534?v=3	94612
11101	Kali-	\N	https://github.com/Kali-	https://avatars.githubusercontent.com/u/296919?v=3	Roma, IT
10691	bialecki	\N	https://github.com/bialecki	https://avatars.githubusercontent.com/u/131007?v=3	Boston, MA
10709	diwu1989	\N	https://github.com/diwu1989	https://avatars.githubusercontent.com/u/380950?v=3	Palo Alto, CA
10711	hamstah	\N	https://github.com/hamstah	https://avatars.githubusercontent.com/u/188302?v=3	London
10687	billyvg	github@mmo.me	https://github.com/billyvg	https://avatars.githubusercontent.com/u/79684?v=3	San Francisco, CA
10729	jormon	\N	https://github.com/jormon	https://avatars.githubusercontent.com/u/399335?v=3	San Francisco, CA
10733	yangchenyun	\N	https://github.com/yangchenyun	https://avatars.githubusercontent.com/u/1043403?v=3	San Francisco, CA
10739	brendan-roche	\N	https://github.com/brendan-roche	https://avatars.githubusercontent.com/u/2289454?v=3	Sydney
10799	jacobvosmaer	contact@jacobvosmaer.nl	https://github.com/jacobvosmaer	https://avatars.githubusercontent.com/u/1336311?v=3	\N
10723	rybnik	amonteiro@orkesta.es	https://github.com/rybnik	https://avatars.githubusercontent.com/u/1592298?v=3	Galicia, Spain
10727	arronmabrey	arron@mabreys.com	https://github.com/arronmabrey	https://avatars.githubusercontent.com/u/128298?v=3	Tampa, FL
10807	YorickPeterse	yorickpeterse@gmail.com	https://github.com/YorickPeterse	https://avatars.githubusercontent.com/u/86065?v=3	The Netherlands
10831	rdeltour	\N	https://github.com/rdeltour	https://avatars.githubusercontent.com/u/520889?v=3	Nancy, France
10837	matkoniecz	matkoniecz@gmail.com	https://github.com/matkoniecz	https://avatars.githubusercontent.com/u/899988?v=3	Kraków, Poland
10847	sitaramc	sitaramc@gmail.com	https://github.com/sitaramc	https://avatars.githubusercontent.com/u/43316?v=3	Hyderabad, India
10853	kaos	git@astekk.se	https://github.com/kaos	https://avatars.githubusercontent.com/u/72965?v=3	Visby, Gotland, Sweden
10859	milki	milki@rescomp.berkeley.edu	https://github.com/milki	https://avatars.githubusercontent.com/u/199279?v=3	San Francisco
10861	adamwiggins	a@adamwiggins.com	https://github.com/adamwiggins	https://avatars.githubusercontent.com/u/177?v=3	Berlin
10867	tslocke	\N	https://github.com/tslocke	https://avatars.githubusercontent.com/u/360?v=3	UK
11087	koush	\N	https://github.com/koush	https://avatars.githubusercontent.com/u/73924?v=3	Seattle, WA
11093	ctso	\N	https://github.com/ctso	https://avatars.githubusercontent.com/u/160060?v=3	Seattle, WA
11113	tpruvot	\N	https://github.com/tpruvot	https://avatars.githubusercontent.com/u/145119?v=3	Genève, Suisse / France
11117	ddougherty	\N	https://github.com/ddougherty	https://avatars.githubusercontent.com/u/1664195?v=3	\N
11119	colincross	\N	https://github.com/colincross	https://avatars.githubusercontent.com/u/2066996?v=3	\N
11159	aleho	\N	https://github.com/aleho	https://avatars.githubusercontent.com/u/138721?v=3	Austria
11131	gcondra	\N	https://github.com/gcondra	https://avatars.githubusercontent.com/u/13110866?v=3	\N
11161	chrismiller	\N	https://github.com/chrismiller	https://avatars.githubusercontent.com/u/328751?v=3	\N
11173	toastcfh	toastcfh@gmail.com	https://github.com/toastcfh	https://avatars.githubusercontent.com/u/184145?v=3	\N
11149	EddieRingle	eddie@ringle.io	https://github.com/EddieRingle	https://avatars.githubusercontent.com/u/32543?v=3	Cabot, AR
11171	behnaam	behnam.fakhimi@gmail.com	https://github.com/behnaam	https://avatars.githubusercontent.com/u/283349?v=3	Stockholm
11197	Altaf-Mahdi	\N	https://github.com/Altaf-Mahdi	https://avatars.githubusercontent.com/u/2896498?v=3	United Kingdom
11177	toddpoynor	toddpoynor@google.com	https://github.com/toddpoynor	https://avatars.githubusercontent.com/u/10679833?v=3	United States
11213	KonstaT	\N	https://github.com/KonstaT	https://avatars.githubusercontent.com/u/1254228?v=3	Finland
11203	reed-at-google	\N	https://github.com/reed-at-google	https://avatars.githubusercontent.com/u/13024162?v=3	\N
11383	javruben	ruben@c9.io	https://github.com/javruben	https://avatars.githubusercontent.com/u/248865?v=3	San Francisco & Amsterdam
11393	janjongboom	janjongboom@gmail.com	https://github.com/janjongboom	https://avatars.githubusercontent.com/u/816856?v=3	Amsterdam
11399	lazyval	\N	https://github.com/lazyval	https://avatars.githubusercontent.com/u/235297?v=3	Saint-Petersburg, Russia
11411	aaugustin	\N	https://github.com/aaugustin	https://avatars.githubusercontent.com/u/788910?v=3	Paris, France
11413	bmispelon	\N	https://github.com/bmispelon	https://avatars.githubusercontent.com/u/6345?v=3	Budapest, Hungary
11437	kaip	\N	https://github.com/kaip	https://avatars.githubusercontent.com/u/309665?v=3	\N
11423	carljm	carl@oddbird.net	https://github.com/carljm	https://avatars.githubusercontent.com/u/61586?v=3	Rapid City, SD
11441	d0ugal	dougal@dougalmatthews.com	https://github.com/d0ugal	https://avatars.githubusercontent.com/u/48211?v=3	Glasgow, UK
11443	gregmuellegger	gregor@muellegger.de	https://github.com/gregmuellegger	https://avatars.githubusercontent.com/u/88278?v=3	Munich, Germany
11447	charettes	charettes+github@gmail.com	https://github.com/charettes	https://avatars.githubusercontent.com/u/9293?v=3	Montréal, Québec
11449	fhahn	\N	https://github.com/fhahn	https://avatars.githubusercontent.com/u/450489?v=3	Manchester, UK
11467	jbronn	\N	https://github.com/jbronn	https://avatars.githubusercontent.com/u/141748?v=3	Houston, TX
11471	ikelly	\N	https://github.com/ikelly	https://avatars.githubusercontent.com/u/1767452?v=3	Boulder, Colorado
11483	subsume	\N	https://github.com/subsume	https://avatars.githubusercontent.com/u/4164113?v=3	\N
11489	NotSqrt	\N	https://github.com/NotSqrt	https://avatars.githubusercontent.com/u/1997005?v=3	\N
11491	rhunwicks	\N	https://github.com/rhunwicks	https://avatars.githubusercontent.com/u/1317567?v=3	\N
11597	rnorris	rw_norris@hotmail.com	https://github.com/rnorris	https://avatars.githubusercontent.com/u/105411?v=3	\N
11579	johnhaitas	john@haitas.com	https://github.com/johnhaitas	https://avatars.githubusercontent.com/u/967276?v=3	Nashville, TN
11611	Xevib	xbarnada@gmail.com	https://github.com/Xevib	https://avatars.githubusercontent.com/u/2422305?v=3	\N
11587	rory	rory@technomancy.org	https://github.com/rory	https://avatars.githubusercontent.com/u/1547?v=3	Karlsruhe, DE, EU
11593	JasonSanford	jasonsanford@gmail.com	https://github.com/JasonSanford	https://avatars.githubusercontent.com/u/220341?v=3	Charlotte, NC
11617	sk1p	alex@gc-web.de	https://github.com/sk1p	https://avatars.githubusercontent.com/u/5778?v=3	Kiel, Germany
11621	kant	magallania at gmail dot com	https://github.com/kant	https://avatars.githubusercontent.com/u/32717?v=3	Somewhere, in Planet Earth...
11639	petropavel13	\N	https://github.com/petropavel13	https://avatars.githubusercontent.com/u/6436245?v=3	Saint Petersburg, Russia
11633	mick	dthompson@gmail.com	https://github.com/mick	https://avatars.githubusercontent.com/u/26278?v=3	San Francisco, CA
11657	lvivier	luke@vivier.ca	https://github.com/lvivier	https://avatars.githubusercontent.com/u/679312?v=3	Vancouver
11663	carter-thaxton	carter.thaxton@gmail.com	https://github.com/carter-thaxton	https://avatars.githubusercontent.com/u/303253?v=3	Portland, OR
11731	benasher44	benasher44@gmail.com	https://github.com/benasher44	https://avatars.githubusercontent.com/u/1120429?v=3	San Francisco, CA
11779	alessandroorru	\N	https://github.com/alessandroorru	https://avatars.githubusercontent.com/u/1560491?v=3	Cagliari, Italy
11743	nwest	nwestr@gmail.com	https://github.com/nwest	https://avatars.githubusercontent.com/u/466674?v=3	Detroit, Michigan
11789	cwagdev	\N	https://github.com/cwagdev	https://avatars.githubusercontent.com/u/235322?v=3	Gilbert, AZ
11747	kcoleman731	kevin@layer.com	https://github.com/kcoleman731	https://avatars.githubusercontent.com/u/1423931?v=3	San Francisco
11777	banjun	banjun+github@gmail.com	https://github.com/banjun	https://avatars.githubusercontent.com/u/11156?v=3	Tokyo, Japan
11783	k0nserv	h@tunius.se	https://github.com/k0nserv	https://avatars.githubusercontent.com/u/1333960?v=3	Edinburgh, Scotland
11897	zhouhaibin	\N	https://github.com/zhouhaibin	https://avatars.githubusercontent.com/u/2115488?v=3	\N
11917	CodePlayer	\N	https://github.com/CodePlayer	https://avatars.githubusercontent.com/u/3793502?v=3	\N
11903	magicdoom	magicdoom@gmail.com	https://github.com/magicdoom	https://avatars.githubusercontent.com/u/468657?v=3	\N
11801	chipp	chippcheg@gmail.com	https://github.com/chipp	https://avatars.githubusercontent.com/u/115227?v=3	Minsk, Belarus
11807	jogu	joseph@heenan.me.uk	https://github.com/jogu	https://avatars.githubusercontent.com/u/316456?v=3	Glasgow, UK
11887	melin	libinsong1204@gmail.com	https://github.com/melin	https://avatars.githubusercontent.com/u/1145830?v=3	杭州
11909	qxo	qxodream@gmail.com	https://github.com/qxo	https://avatars.githubusercontent.com/u/1813709?v=3	hangzhou,china
11923	shibenli	\N	https://github.com/shibenli	https://avatars.githubusercontent.com/u/7353956?v=3	上海
15737	nmalkin	\N	https://github.com/nmalkin	https://avatars.githubusercontent.com/u/903179?v=3	\N
11927	sundy-li	543950155@qq.com	https://github.com/sundy-li	https://avatars.githubusercontent.com/u/3325189?v=3	\N
11933	felixonmars	felixonmars@archlinux.org	https://github.com/felixonmars	https://avatars.githubusercontent.com/u/1006477?v=3	Wuhan, Hubei, China
11939	zhuzhaoyuan	zhuzhaoyuan@gmail.com	https://github.com/zhuzhaoyuan	https://avatars.githubusercontent.com/u/74670?v=3	Hangzhou, China
11941	yaoweibin	yaoweibin@gmail.com	https://github.com/yaoweibin	https://avatars.githubusercontent.com/u/153753?v=3	Hangzhou, China
11953	lilbedwin	lilb.edwin@gmail.com	https://github.com/lilbedwin	https://avatars.githubusercontent.com/u/4852870?v=3	Beijing, China
11959	jinjiu	wanyco@gmail.com	https://github.com/jinjiu	https://avatars.githubusercontent.com/u/7484739?v=3	Hangzhou
11969	wangbin579	wangbin579@gmail.com	https://github.com/wangbin579	https://avatars.githubusercontent.com/u/1127759?v=3	Beijing, China
12037	tomfaulhaber	\N	https://github.com/tomfaulhaber	https://avatars.githubusercontent.com/u/37207?v=3	San Francisco
12041	amalloy	\N	https://github.com/amalloy	https://avatars.githubusercontent.com/u/368685?v=3	Santa Monica, CA
12071	pmbauer	\N	https://github.com/pmbauer	https://avatars.githubusercontent.com/u/453580?v=3	\N
12073	ska2342	\N	https://github.com/ska2342	https://avatars.githubusercontent.com/u/972373?v=3	\N
12043	abedra	aaron@aaronbedra.com	https://github.com/abedra	https://avatars.githubusercontent.com/u/2090?v=3	Chicago, IL
12049	hiredman	redchin@gmail.com	https://github.com/hiredman	https://avatars.githubusercontent.com/u/35954?v=3	Washington State
12053	straszheimjeffrey	straszheimjeffrey@gmail.com	https://github.com/straszheimjeffrey	https://avatars.githubusercontent.com/u/61773?v=3	Boston
12157	jsoref	\N	https://github.com/jsoref	https://avatars.githubusercontent.com/u/2119212?v=3	Toronto
12163	maturano	\N	https://github.com/maturano	https://avatars.githubusercontent.com/u/5768813?v=3	México
12143	chocolateboy	chocolate@cpan.org	https://github.com/chocolateboy	https://avatars.githubusercontent.com/u/31533?v=3	\N
12149	AndrewRadev	andrey.radev@gmail.com	https://github.com/AndrewRadev	https://avatars.githubusercontent.com/u/124255?v=3	Sofia, Bulgaria
12161	BreadMaker	fcpc.1984@gmail.com	https://github.com/BreadMaker	https://avatars.githubusercontent.com/u/713711?v=3	Concepción, Chile.
12211	Maxhodges	\N	https://github.com/Maxhodges	https://avatars.githubusercontent.com/u/957271?v=3	Tokyo
12239	emilchristensen	\N	https://github.com/emilchristensen	https://avatars.githubusercontent.com/u/575486?v=3	New York
12251	novalagung	\N	https://github.com/novalagung	https://avatars.githubusercontent.com/u/982868?v=3	Surabaya, Indonesia
12197	luisrudge	luis@luisrudge.net	https://github.com/luisrudge	https://avatars.githubusercontent.com/u/941075?v=3	Brazil
12203	MBrunoS	mb.bruno.s@gmail.com	https://github.com/MBrunoS	https://avatars.githubusercontent.com/u/5315188?v=3	Brazil
12241	hay	huskyr@gmail.com	https://github.com/hay	https://avatars.githubusercontent.com/u/129681?v=3	Amsterdam, the Netherlands
12253	stevendaniels	\N	https://github.com/stevendaniels	https://avatars.githubusercontent.com/u/177155?v=3	Washington, DC
12281	gotdibbs	\N	https://github.com/gotdibbs	https://avatars.githubusercontent.com/u/1540648?v=3	Chicago, IL
12289	mike182uk	\N	https://github.com/mike182uk	https://avatars.githubusercontent.com/u/991592?v=3	Leeds, UK
12263	htanjo	expheno@gmail.com	https://github.com/htanjo	https://avatars.githubusercontent.com/u/774048?v=3	Kawasaki, Japan
12269	jaswilli	jaswilli@gmail.com	https://github.com/jaswilli	https://avatars.githubusercontent.com/u/214142?v=3	Chicago, IL
12277	javorszky	gabor@javorszky.co.uk	https://github.com/javorszky	https://avatars.githubusercontent.com/u/1196299?v=3	Oxford
12301	jakegiltsoff	hi@jke.me	https://github.com/jakegiltsoff	https://avatars.githubusercontent.com/u/1681384?v=3	Bristol, UK
12317	deduce	\N	https://github.com/deduce	https://avatars.githubusercontent.com/u/8616?v=3	Taipei, Taiwan
12343	jpope777	\N	https://github.com/jpope777	https://avatars.githubusercontent.com/u/3165757?v=3	/dev/null
12373	jwallaceparker	\N	https://github.com/jwallaceparker	https://avatars.githubusercontent.com/u/42021?v=3	Baltimore, MD
12323	benjaminfritz	b@werkshow.com	https://github.com/benjaminfritz	https://avatars.githubusercontent.com/u/2838594?v=3	Berlin
12329	apaunchev	apaunchev@gmail.com	https://github.com/apaunchev	https://avatars.githubusercontent.com/u/150465?v=3	Sofia, Bulgaria
12347	AAlakkad	am.alakkad@gmail.com	https://github.com/AAlakkad	https://avatars.githubusercontent.com/u/351256?v=3	Istanbul, Turkey
12377	lyoshenka	alex@grin.io	https://github.com/lyoshenka	https://avatars.githubusercontent.com/u/362784?v=3	New Haven, CT
12391	alireza-ahmadi	\N	https://github.com/alireza-ahmadi	https://avatars.githubusercontent.com/u/1054228?v=3	Tehran, Iran
12379	html5-ninja	contact@html5-ninja.com	https://github.com/html5-ninja	https://avatars.githubusercontent.com/u/2590579?v=3	Tunisia
12409	dswen	\N	https://github.com/dswen	https://avatars.githubusercontent.com/u/1483828?v=3	\N
12401	voltagex	github@voltagex.org	https://github.com/voltagex	https://avatars.githubusercontent.com/u/159567?v=3	Australia
12413	fiveminuteargument	editor@fiveminuteargument.com	https://github.com/fiveminuteargument	https://avatars.githubusercontent.com/u/120135?v=3	London, United Kingdom
12433	riking	rikingcoding@gmail.com	https://github.com/riking	https://avatars.githubusercontent.com/u/627891?v=3	Fremont
12437	fantasticfears	fantasticfears@gmail.com	https://github.com/fantasticfears	https://avatars.githubusercontent.com/u/297343?v=3	Sundsvall, Sweden
12457	portableant	\N	https://github.com/portableant	https://avatars.githubusercontent.com/u/286552?v=3	Great Russell Street
12473	bartj3	\N	https://github.com/bartj3	https://avatars.githubusercontent.com/u/390426?v=3	Vienna, Austria
12487	leonardteo	\N	https://github.com/leonardteo	https://avatars.githubusercontent.com/u/352074?v=3	Montreal, Canada
12491	jamesfid	\N	https://github.com/jamesfid	https://avatars.githubusercontent.com/u/215912?v=3	Iowa
12451	henrynet	\N	https://github.com/henrynet	https://avatars.githubusercontent.com/u/2919791?v=3	\N
12461	freney	\N	https://github.com/freney	https://avatars.githubusercontent.com/u/3589241?v=3	\N
12479	devchakraborty	d5chakra@uwaterloo.ca	https://github.com/devchakraborty	https://avatars.githubusercontent.com/u/2321559?v=3	Waterloo, Canada
12503	voiprodrigo	\N	https://github.com/voiprodrigo	https://avatars.githubusercontent.com/u/2421504?v=3	Coimbra, Portugal
12497	dasnixon	chris.d.nixon@gmail.com	https://github.com/dasnixon	https://avatars.githubusercontent.com/u/672057?v=3	San Francisco, CA
12539	dianders	\N	https://github.com/dianders	https://avatars.githubusercontent.com/u/13226086?v=3	\N
12541	pimanttr	\N	https://github.com/pimanttr	https://avatars.githubusercontent.com/u/5993936?v=3	\N
12547	yufengshen	\N	https://github.com/yufengshen	https://avatars.githubusercontent.com/u/10565333?v=3	\N
12553	nasser-quicinc	\N	https://github.com/nasser-quicinc	https://avatars.githubusercontent.com/u/757421?v=3	\N
12511	Stealthii	dpreid@gmail.com	https://github.com/Stealthii	https://avatars.githubusercontent.com/u/998920?v=3	Belfast, UK
12517	alexdong	me@alexdong.com	https://github.com/alexdong	https://avatars.githubusercontent.com/u/190415?v=3	Dunedin, New Zealand
12563	pdxJayhawk	russell.webb@intel.com	https://github.com/pdxJayhawk	https://avatars.githubusercontent.com/u/1156757?v=3	Hillsboro, OR
12569	crawford	\N	https://github.com/crawford	https://avatars.githubusercontent.com/u/368848?v=3	San Francisco, CA
12601	david-mcmahon	\N	https://github.com/david-mcmahon	https://avatars.githubusercontent.com/u/15622407?v=3	Mountain View, CA
12583	pbx0	\N	https://github.com/pbx0	https://avatars.githubusercontent.com/u/10945781?v=3	\N
12589	gtank	\N	https://github.com/gtank	https://avatars.githubusercontent.com/u/622063?v=3	\N
12577	glevand	geoff@infradead.org	https://github.com/glevand	https://avatars.githubusercontent.com/u/10858804?v=3	\N
12611	pdubroy	pdubroy@gmail.com	https://github.com/pdubroy	https://avatars.githubusercontent.com/u/17293?v=3	Monaco di Baviera
12703	mattn	mattn.jp@gmail.com	https://github.com/mattn	https://avatars.githubusercontent.com/u/10111?v=3	Osaka, Japan
12767	garak	\N	https://github.com/garak	https://avatars.githubusercontent.com/u/179866?v=3	Rome, Italy
12769	brikou	\N	https://github.com/brikou	https://avatars.githubusercontent.com/u/383212?v=3	Nancy
12781	yudoufu	\N	https://github.com/yudoufu	https://avatars.githubusercontent.com/u/48963?v=3	Japan / Tokyo
12743	aitboudad	\N	https://github.com/aitboudad	https://avatars.githubusercontent.com/u/1753742?v=3	\N
12739	kriswallsmith	kris.wallsmith@gmail.com	https://github.com/kriswallsmith	https://avatars.githubusercontent.com/u/33886?v=3	Portland, Oregon USA
12757	cordoval	cordoval@gmail.com	https://github.com/cordoval	https://avatars.githubusercontent.com/u/328359?v=3	LV-233
12763	mdpatrick	dan@mdpatrick.com	https://github.com/mdpatrick	https://avatars.githubusercontent.com/u/788554?v=3	Oakland, CA
12809	szicsu	\N	https://github.com/szicsu	https://avatars.githubusercontent.com/u/109741?v=3	Hungary, Budapest
12821	nanocom	\N	https://github.com/nanocom	https://avatars.githubusercontent.com/u/667482?v=3	Paris
12827	davidfuhr	\N	https://github.com/davidfuhr	https://avatars.githubusercontent.com/u/446054?v=3	Karlsruhe, Germany
12791	ganchiku	ohnoshin@gmail.com	https://github.com/ganchiku	https://avatars.githubusercontent.com/u/149973?v=3	Tokyo
12829	Slamdunk	\N	https://github.com/Slamdunk	https://avatars.githubusercontent.com/u/152236?v=3	Italy
12799	kalessil	kalessil+github@gmail.com	https://github.com/kalessil	https://avatars.githubusercontent.com/u/1577185?v=3	Karlsruhe, Germany
12823	kbond	kevinbond@gmail.com	https://github.com/kbond	https://avatars.githubusercontent.com/u/127811?v=3	Kitchener, ON
12959	JimPanic	\N	https://github.com/JimPanic	https://avatars.githubusercontent.com/u/279293?v=3	Austria, Vienna
12973	kacper-sokolowski	\N	https://github.com/kacper-sokolowski	https://avatars.githubusercontent.com/u/10741291?v=3	Kraków
12941	rictic	rictic@gmail.com	https://github.com/rictic	https://avatars.githubusercontent.com/u/1659?v=3	94109 (San Francisco)
12979	JanMiksovsky	\N	https://github.com/JanMiksovsky	https://avatars.githubusercontent.com/u/86139?v=3	Seattle, WA
13043	richlander	\N	https://github.com/richlander	https://avatars.githubusercontent.com/u/2608468?v=3	Seattle / Toronto
12937	kevinpschaaf	\N	https://github.com/kevinpschaaf	https://avatars.githubusercontent.com/u/1354932?v=3	\N
12953	shycherry	\N	https://github.com/shycherry	https://avatars.githubusercontent.com/u/2857848?v=3	\N
12967	FluorescentHallucinogen	fluorescent.hallucinogen@gmail.com	https://github.com/FluorescentHallucinogen	https://avatars.githubusercontent.com/u/7892779?v=3	\N
13049	blackdwarf	\N	https://github.com/blackdwarf	https://avatars.githubusercontent.com/u/3115004?v=3	Seattle
13063	sebastienros	\N	https://github.com/sebastienros	https://avatars.githubusercontent.com/u/1165805?v=3	Bellevue, WA
13073	Priya91	\N	https://github.com/Priya91	https://avatars.githubusercontent.com/u/7853870?v=3	Redmond
13093	saurabh500	\N	https://github.com/saurabh500	https://avatars.githubusercontent.com/u/1623701?v=3	\N
13099	dsgouda	\N	https://github.com/dsgouda	https://avatars.githubusercontent.com/u/14796031?v=3	\N
13081	mmitche	mmitche@microsoft.com	https://github.com/mmitche	https://avatars.githubusercontent.com/u/8725170?v=3	Redmond, WA
13121	eadordzhiev	\N	https://github.com/eadordzhiev	https://avatars.githubusercontent.com/u/8386271?v=3	Russia, Moscow
13141	attilah	\N	https://github.com/attilah	https://avatars.githubusercontent.com/u/230432?v=3	Redmond, WA
13147	benjaminpetit	\N	https://github.com/benjaminpetit	https://avatars.githubusercontent.com/u/20427417?v=3	Redmond, WA
13103	naamunds	naamunds@microsoft.com	https://github.com/naamunds	https://avatars.githubusercontent.com/u/8249261?v=3	Fargo, ND
13151	NingnaD	\N	https://github.com/NingnaD	https://avatars.githubusercontent.com/u/15618122?v=3	\N
13109	Petermarcu	Petermarcu@hotmail.com	https://github.com/Petermarcu	https://avatars.githubusercontent.com/u/8228359?v=3	Redmond, WA
13127	binki	ohnobinki@ohnopublishing.net	https://github.com/binki	https://avatars.githubusercontent.com/u/82626?v=3	Grand Rapids, MI
13171	Andy-Wilkinson	\N	https://github.com/Andy-Wilkinson	https://avatars.githubusercontent.com/u/7702119?v=3	\N
13177	CyrusNajmabadi	cyrusn@microsoft.com	https://github.com/CyrusNajmabadi	https://avatars.githubusercontent.com/u/4564579?v=3	\N
13183	mavasani	mavasani@microsoft.com	https://github.com/mavasani	https://avatars.githubusercontent.com/u/10605811?v=3	\N
13159	repne	antoniofiumano@outlook.com	https://github.com/repne	https://avatars.githubusercontent.com/u/628923?v=3	London
13163	davkean	davkean@microsoft.com	https://github.com/davkean	https://avatars.githubusercontent.com/u/1103906?v=3	Redmond
13187	DustinCampbell	dustin@teamcampbell.org	https://github.com/DustinCampbell	https://avatars.githubusercontent.com/u/116161?v=3	Redmond, WA
13217	whoisj	\N	https://github.com/whoisj	https://avatars.githubusercontent.com/u/11578325?v=3	Raleigh, NC, USA
13219	russellhadley	rhadley@microsoft.com	https://github.com/russellhadley	https://avatars.githubusercontent.com/u/9874904?v=3	Redmond, WA
13229	vicancy	lianwei@microsoft.com	https://github.com/vicancy	https://avatars.githubusercontent.com/u/668244?v=3	Shanghai
13411	boxofrad	daniel@floppy.co	https://github.com/boxofrad	https://avatars.githubusercontent.com/u/580803?v=3	Newbury, Berkshire - UK
13417	aishraj	aish@aishraj.com	https://github.com/aishraj	https://avatars.githubusercontent.com/u/696410?v=3	San Francisco
13421	fiorix	fiorix@gmail.com	https://github.com/fiorix	https://avatars.githubusercontent.com/u/129742?v=3	London, UK
13457	stapelberg	\N	https://github.com/stapelberg	https://avatars.githubusercontent.com/u/55506?v=3	Zürich, Switzerland
13441	jgilik	\N	https://github.com/jgilik	https://avatars.githubusercontent.com/u/186020?v=3	\N
13477	jtolds	\N	https://github.com/jtolds	https://avatars.githubusercontent.com/u/109603?v=3	\N
13469	zombiezen	ross@zombiezen.com	https://github.com/zombiezen	https://avatars.githubusercontent.com/u/181535?v=3	\N
13487	dkerwin	daniel@linuxaddicted.de	https://github.com/dkerwin	https://avatars.githubusercontent.com/u/168948?v=3	\N
13451	d4l3k	rice@fn.lc	https://github.com/d4l3k	https://avatars.githubusercontent.com/u/909104?v=3	Vancouver
13463	fumin	awawfumin@gmail.com	https://github.com/fumin	https://avatars.githubusercontent.com/u/765222?v=3	Taipei, Taiwan
13493	davidrjenni	\N	https://github.com/davidrjenni	https://avatars.githubusercontent.com/u/10241572?v=3	Switzerland
13499	dvyukov	\N	https://github.com/dvyukov	https://avatars.githubusercontent.com/u/1095328?v=3	Munich
13681	vlidholt	\N	https://github.com/vlidholt	https://avatars.githubusercontent.com/u/1539812?v=3	San Francisco
13691	nickskull	\N	https://github.com/nickskull	https://avatars.githubusercontent.com/u/1776969?v=3	Prague, Czech Republic
13523	hyangah	\N	https://github.com/hyangah	https://avatars.githubusercontent.com/u/4999471?v=3	\N
13687	cocojoe	\N	https://github.com/cocojoe	https://avatars.githubusercontent.com/u/928115?v=3	\N
13513	mpvl	mpvl@golang.org	https://github.com/mpvl	https://avatars.githubusercontent.com/u/6445383?v=3	Zurich, Switzerland
13679	slembcke	slembcke@gmail.com	https://github.com/slembcke	https://avatars.githubusercontent.com/u/153633?v=3	Minnesota
13693	pierredavidbelanger	\N	https://github.com/pierredavidbelanger	https://avatars.githubusercontent.com/u/1076726?v=3	Montréal
13697	richardgroves	\N	https://github.com/richardgroves	https://avatars.githubusercontent.com/u/715058?v=3	London
13721	yangws	\N	https://github.com/yangws	https://avatars.githubusercontent.com/u/488183?v=3	Xiamen. China
13711	CocosRobot	\N	https://github.com/CocosRobot	https://avatars.githubusercontent.com/u/990131?v=3	\N
13723	xiaofeng11	\N	https://github.com/xiaofeng11	https://avatars.githubusercontent.com/u/11676879?v=3	\N
13709	zilongshanren	guanghui8827@126.com	https://github.com/zilongshanren	https://avatars.githubusercontent.com/u/785541?v=3	Xiamen, Fujian, China
13729	darkdukey	nite.luo.work@gmail.com	https://github.com/darkdukey	https://avatars.githubusercontent.com/u/371584?v=3	San Francisco
13751	xingsenma	\N	https://github.com/xingsenma	https://avatars.githubusercontent.com/u/2291190?v=3	\N
13763	fengwomei	\N	https://github.com/fengwomei	https://avatars.githubusercontent.com/u/2774755?v=3	\N
13789	vedi	\N	https://github.com/vedi	https://avatars.githubusercontent.com/u/433620?v=3	\N
13799	qiaofeng00oo	\N	https://github.com/qiaofeng00oo	https://avatars.githubusercontent.com/u/1835200?v=3	\N
13757	AndriyLin	xuankang.lin@gmail.com	https://github.com/AndriyLin	https://avatars.githubusercontent.com/u/1215792?v=3	West Lafayette
13753	SmallAiTT	536762164@qq.com	https://github.com/SmallAiTT	https://avatars.githubusercontent.com/u/4328836?v=3	\N
13759	mutoo	gmutoo@gmail.com	https://github.com/mutoo	https://avatars.githubusercontent.com/u/710607?v=3	Southbank VIC Australia
13781	ayuer	ayueer@hotmail.com	https://github.com/ayuer	https://avatars.githubusercontent.com/u/1461962?v=3	\N
13787	MartinCote	martin@loopycube.com	https://github.com/MartinCote	https://avatars.githubusercontent.com/u/116176?v=3	Montreal
15451	naaman	\N	https://github.com/naaman	https://avatars.githubusercontent.com/u/143326?v=3	sf
13879	danholevoet	\N	https://github.com/danholevoet	https://avatars.githubusercontent.com/u/2816624?v=3	\N
16381	manubb	\N	https://github.com/manubb	https://avatars.githubusercontent.com/u/5610287?v=3	\N
13877	tmatsuo	tmatsuo@google.com	https://github.com/tmatsuo	https://avatars.githubusercontent.com/u/41815?v=3	CA, USA
14011	SomMeri	\N	https://github.com/SomMeri	https://avatars.githubusercontent.com/u/618879?v=3	\N
13883	marcacohen	marc@mkcohen.com	https://github.com/marcacohen	https://avatars.githubusercontent.com/u/658327?v=3	\N
13901	wmwong	wesley.mw.wong@gmail.com	https://github.com/wmwong	https://avatars.githubusercontent.com/u/156485?v=3	Vancouver
13903	jcriner	jacob.criner@gmail.com	https://github.com/jcriner	https://avatars.githubusercontent.com/u/947146?v=3	Seattle, WA
14009	cloudhead	github@cloudhead.io	https://github.com/cloudhead	https://avatars.githubusercontent.com/u/40774?v=3	Berlin
14017	spocke	spocke@moxiecode.com	https://github.com/spocke	https://avatars.githubusercontent.com/u/115879?v=3	Umeå, Sweden
14057	ameliagreenhall	\N	https://github.com/ameliagreenhall	https://avatars.githubusercontent.com/u/984213?v=3	San Francisco, CA
14029	Glench	\N	https://github.com/Glench	https://avatars.githubusercontent.com/u/451461?v=3	\N
14033	hyperbolist	hyperbolist@gmail.com	https://github.com/hyperbolist	https://avatars.githubusercontent.com/u/18764?v=3	\N
14051	amazingSurge	amazingSurge@yahoo.com	https://github.com/amazingSurge	https://avatars.githubusercontent.com/u/2949224?v=3	\N
14039	Sopamo	github@sopamo.de	https://github.com/Sopamo	https://avatars.githubusercontent.com/u/1202596?v=3	Germany
14059	ahutchings	andrew.hutchings@gmail.com	https://github.com/ahutchings	https://avatars.githubusercontent.com/u/35026?v=3	Atlanta, GA
14081	creage	creage@gmail.com	https://github.com/creage	https://avatars.githubusercontent.com/u/910967?v=3	Kiev
14087	Kollibri	\N	https://github.com/Kollibri	https://avatars.githubusercontent.com/u/533377?v=3	Lansing, MI
14107	joekaiser	\N	https://github.com/joekaiser	https://avatars.githubusercontent.com/u/1521110?v=3	Seattle, Wa
14083	stretch4x4	\N	https://github.com/stretch4x4	https://avatars.githubusercontent.com/u/12271094?v=3	\N
14093	Brankub	\N	https://github.com/Brankub	https://avatars.githubusercontent.com/u/1280465?v=3	\N
14111	mdeweerd	\N	https://github.com/mdeweerd	https://avatars.githubusercontent.com/u/1504752?v=3	\N
14149	ttopholm	\N	https://github.com/ttopholm	https://avatars.githubusercontent.com/u/593729?v=3	Copenhagen / Denmark
14153	ryanbetts	\N	https://github.com/ryanbetts	https://avatars.githubusercontent.com/u/148069?v=3	Vancouver, BC
14173	darkk	\N	https://github.com/darkk	https://avatars.githubusercontent.com/u/21046?v=3	Saint Petersburg, Russia
14143	peutetre	paul@42loops.com	https://github.com/peutetre	https://avatars.githubusercontent.com/u/204569?v=3	Berlin
14177	sotownsend	\N	https://github.com/sotownsend	https://avatars.githubusercontent.com/u/1043162?v=3	San Francisco, CA
14159	manuganji	manuganji@gmail.com	https://github.com/manuganji	https://avatars.githubusercontent.com/u/1709986?v=3	Hyderabad, India
14197	gtanner	\N	https://github.com/gtanner	https://avatars.githubusercontent.com/u/317051?v=3	Canada
14207	rodms10	\N	https://github.com/rodms10	https://avatars.githubusercontent.com/u/3000200?v=3	Seattle
14281	xiaoyang	\N	https://github.com/xiaoyang	https://avatars.githubusercontent.com/u/171066?v=3	San Francisco Bay Area
14303	bcui	\N	https://github.com/bcui	https://avatars.githubusercontent.com/u/364547?v=3	Beijing, China
14293	wei-shen	\N	https://github.com/wei-shen	https://avatars.githubusercontent.com/u/2480927?v=3	\N
14279	sguo	enigmaguo@hotmail.com	https://github.com/sguo	https://avatars.githubusercontent.com/u/589050?v=3	Mountain View, CA
14317	ruslansv	\N	https://github.com/ruslansv	https://avatars.githubusercontent.com/u/723125?v=3	Redwood City, CA
14321	abhinigam	\N	https://github.com/abhinigam	https://avatars.githubusercontent.com/u/4186366?v=3	\N
14323	mavlee	\N	https://github.com/mavlee	https://avatars.githubusercontent.com/u/192700?v=3	\N
14341	gvsboy	\N	https://github.com/gvsboy	https://avatars.githubusercontent.com/u/2659299?v=3	\N
14347	eoneill	\N	https://github.com/eoneill	https://avatars.githubusercontent.com/u/552715?v=3	\N
14327	gabrielwong	me@gabrielwong.net	https://github.com/gabrielwong	https://avatars.githubusercontent.com/u/3857617?v=3	Toronto, ON
14479	abitgone	anthony@abitgone.co.uk	https://github.com/abitgone	https://avatars.githubusercontent.com/u/62781?v=3	Warwick, Warwickshire, UK
14557	niku4i	\N	https://github.com/niku4i	https://avatars.githubusercontent.com/u/1019617?v=3	Tokyo, Japan
14543	javmorin	\N	https://github.com/javmorin	https://avatars.githubusercontent.com/u/56076?v=3	\N
14569	co-me	\N	https://github.com/co-me	https://avatars.githubusercontent.com/u/2589563?v=3	\N
14551	pravi	praveen@debian.org	https://github.com/pravi	https://avatars.githubusercontent.com/u/708222?v=3	\N
16493	bajb	brooke@bajb.net	https://github.com/bajb	https://avatars.githubusercontent.com/u/2241334?v=3	UK
14533	sethvargo	sethvargo+github@gmail.com	https://github.com/sethvargo	https://avatars.githubusercontent.com/u/408570?v=3	Pittsburgh, PA
14537	sawanoboly	sawanoboriyu@gmail.com	https://github.com/sawanoboly	https://avatars.githubusercontent.com/u/272388?v=3	Kobe, Japan
14549	jamesgolick	jamesgolick@gmail.com	https://github.com/jamesgolick	https://avatars.githubusercontent.com/u/37?v=3	New York
14561	mattmanning	matt.manning@gmail.com	https://github.com/mattmanning	https://avatars.githubusercontent.com/u/44615?v=3	Atlanta, GA
14563	JonRowe	hello@jonrowe.co.uk	https://github.com/JonRowe	https://avatars.githubusercontent.com/u/162976?v=3	Sydney, Australia
14717	internalfx	\N	https://github.com/internalfx	https://avatars.githubusercontent.com/u/583701?v=3	Scottsdale, AZ
14909	jseyfried	\N	https://github.com/jseyfried	https://avatars.githubusercontent.com/u/8652869?v=3	Berkeley, CA
14723	andyhu	\N	https://github.com/andyhu	https://avatars.githubusercontent.com/u/203980?v=3	\N
14731	tkh44	kye.hohenberger@gmail.com	https://github.com/tkh44	https://avatars.githubusercontent.com/u/662750?v=3	\N
14713	techpines	brad@techpines.com	https://github.com/techpines	https://avatars.githubusercontent.com/u/1779513?v=3	Austin, TX
14897	alexcrichton	alex@alexcrichton.com	https://github.com/alexcrichton	https://avatars.githubusercontent.com/u/64996?v=3	San Francisco, CA
14923	SphinxKnight	\N	https://github.com/SphinxKnight	https://avatars.githubusercontent.com/u/2413436?v=3	Edinburgh
14929	jasonkliu	\N	https://github.com/jasonkliu	https://avatars.githubusercontent.com/u/1038730?v=3	New Haven, CT
14957	bfabio	\N	https://github.com/bfabio	https://avatars.githubusercontent.com/u/788293?v=3	Italy
14951	FreeFull	\N	https://github.com/FreeFull	https://avatars.githubusercontent.com/u/1496908?v=3	\N
14933	lazpeng	lazpeng@gmail.com	https://github.com/lazpeng	https://avatars.githubusercontent.com/u/20118844?v=3	Brazil
14939	matklad	aleksey.kladov@gmail.com	https://github.com/matklad	https://avatars.githubusercontent.com/u/1711539?v=3	St. Petersburg
14947	birkenfeld	georg@python.org	https://github.com/birkenfeld	https://avatars.githubusercontent.com/u/144359?v=3	München
15011	ggreif	\N	https://github.com/ggreif	https://avatars.githubusercontent.com/u/1312006?v=3	\N
15013	alkis	\N	https://github.com/alkis	https://avatars.githubusercontent.com/u/265981?v=3	\N
15017	hfinkel	\N	https://github.com/hfinkel	https://avatars.githubusercontent.com/u/910929?v=3	\N
14969	rprichard	ryan.prichard@gmail.com	https://github.com/rprichard	https://avatars.githubusercontent.com/u/1572855?v=3	USA
14977	hawkw	hi@hawkweisman.me	https://github.com/hawkw	https://avatars.githubusercontent.com/u/2796466?v=3	Pennsylvania
14983	urschrei	urschrei@gmail.com	https://github.com/urschrei	https://avatars.githubusercontent.com/u/131862?v=3	London ⇄ Dublin
15137	bombless	\N	https://github.com/bombless	https://avatars.githubusercontent.com/u/1296393?v=3	Guangzhou, China
15031	djasper	\N	https://github.com/djasper	https://avatars.githubusercontent.com/u/1850611?v=3	\N
15049	freebroccolo	\N	https://github.com/freebroccolo	https://avatars.githubusercontent.com/u/151197?v=3	\N
15061	tbu-	\N	https://github.com/tbu-	https://avatars.githubusercontent.com/u/6666593?v=3	\N
15101	davidszotten	\N	https://github.com/davidszotten	https://avatars.githubusercontent.com/u/412005?v=3	\N
15053	CloudiDust	cloudidust@gmail.com	https://github.com/CloudiDust	https://avatars.githubusercontent.com/u/30068?v=3	Nanjing, China
15263	pednekarprajakta	v-prajpe@microsoft.com	https://github.com/pednekarprajakta	https://avatars.githubusercontent.com/u/1875318?v=3	India
15319	benmann	\N	https://github.com/benmann	https://avatars.githubusercontent.com/u/7561396?v=3	Düsseldorf, Germany
15269	mikpiipp	\N	https://github.com/mikpiipp	https://avatars.githubusercontent.com/u/3907274?v=3	\N
15271	mustanaamio	pekka.kauppila@futurice.com	https://github.com/mustanaamio	https://avatars.githubusercontent.com/u/3169196?v=3	\N
15307	kentwills	rkwills@yelp.com	https://github.com/kentwills	https://avatars.githubusercontent.com/u/2310975?v=3	San Francisco, CA
15313	kunyan	admin@yankun.org	https://github.com/kunyan	https://avatars.githubusercontent.com/u/752130?v=3	China
15329	riyadhalnur	riyadhalnur@verticalaxisbd.com	https://github.com/riyadhalnur	https://avatars.githubusercontent.com/u/3457571?v=3	Dhaka, Bangladesh
15331	KatieLo	katie@dune8.com	https://github.com/KatieLo	https://avatars.githubusercontent.com/u/5752227?v=3	Vancouver, BC
15347	cobbweb	andrew.cobby@gmail.com	https://github.com/cobbweb	https://avatars.githubusercontent.com/u/159373?v=3	Working Nomad, Australia
15349	fabianishere	mail.fabianm@gmail.com	https://github.com/fabianishere	https://avatars.githubusercontent.com/u/767351?v=3	The Hague, Netherlands
15383	nzoschke	\N	https://github.com/nzoschke	https://avatars.githubusercontent.com/u/147410?v=3	San Francisco
15391	csquared	\N	https://github.com/csquared	https://avatars.githubusercontent.com/u/173457?v=3	Berkeley, CA
15401	mathias	matt.gauger@gmail.com	https://github.com/mathias	https://avatars.githubusercontent.com/u/3340?v=3	\N
15359	andela-abankole	akinjide.bankole@andela.com	https://github.com/andela-abankole	https://avatars.githubusercontent.com/u/11836769?v=3	6.507093, 3.383739
15377	ddollar	david@dollar.io	https://github.com/ddollar	https://avatars.githubusercontent.com/u/3308?v=3	Atlanta, GA
15413	nate	nate@sutton.me	https://github.com/nate	https://avatars.githubusercontent.com/u/130?v=3	Milwaukee, WI
15419	neilmiddleton	neil@neilmiddleton.com	https://github.com/neilmiddleton	https://avatars.githubusercontent.com/u/60786?v=3	Horsham, UK
15439	daneharrigan	dane@heroku.com	https://github.com/daneharrigan	https://avatars.githubusercontent.com/u/94443?v=3	San Francisco
15541	sh1989	\N	https://github.com/sh1989	https://avatars.githubusercontent.com/u/2462285?v=3	Newcastle-Upon-Tyne, United Kingdom
15583	Randommood	\N	https://github.com/Randommood	https://avatars.githubusercontent.com/u/486373?v=3	San Francisco
15551	georgehenderson	georgehendersonmusic@gmail.com	https://github.com/georgehenderson	https://avatars.githubusercontent.com/u/1379792?v=3	Austin, TX
15553	dragongears	art@dahm.com	https://github.com/dragongears	https://avatars.githubusercontent.com/u/476180?v=3	Fort Lauderdale, FL
15559	rolfbjarne	rolf@xamarin.com	https://github.com/rolfbjarne	https://avatars.githubusercontent.com/u/249268?v=3	Madrid, Spain
15581	DarrenN	v25media@gmail.com	https://github.com/DarrenN	https://avatars.githubusercontent.com/u/215030?v=3	Brooklyn
15619	tsclausing	\N	https://github.com/tsclausing	https://avatars.githubusercontent.com/u/542163?v=3	Nashville, TN
15641	justinmk	\N	https://github.com/justinmk	https://avatars.githubusercontent.com/u/1359421?v=3	Berlin
15647	jszakmeister	\N	https://github.com/jszakmeister	https://avatars.githubusercontent.com/u/448087?v=3	Baltimore, MD
15601	JoaoGFarias	jgfarias42@gmail.com	https://github.com/JoaoGFarias	https://avatars.githubusercontent.com/u/1585655?v=3	Olinda
15643	ZyX-I	\N	https://github.com/ZyX-I	https://avatars.githubusercontent.com/u/322097?v=3	\N
15661	KillTheMule	\N	https://github.com/KillTheMule	https://avatars.githubusercontent.com/u/4117685?v=3	\N
15667	sethjackson	\N	https://github.com/sethjackson	https://avatars.githubusercontent.com/u/6191831?v=3	\N
15649	oni-link	knil.ino@gmail.com	https://github.com/oni-link	https://avatars.githubusercontent.com/u/2077655?v=3	\N
15607	justincampbell	justin@justincampbell.me	https://github.com/justincampbell	https://avatars.githubusercontent.com/u/246978?v=3	Philadelphia
15707	henadzit	\N	https://github.com/henadzit	https://avatars.githubusercontent.com/u/1061223?v=3	Dublin
15671	jbranchaud	jbranchaud@gmail.com	https://github.com/jbranchaud	https://avatars.githubusercontent.com/u/694063?v=3	Chicago, IL
15679	DuncanvR	\N	https://github.com/DuncanvR	https://avatars.githubusercontent.com/u/4466737?v=3	\N
15683	dev0x	racine.matt@gmail.com	https://github.com/dev0x	https://avatars.githubusercontent.com/u/275451?v=3	Wisconsin
15739	aybabtme	@AntoineGrondin	https://github.com/aybabtme	https://avatars.githubusercontent.com/u/1189716?v=3	Ottawa, Canada
15773	florianheinemann	\N	https://github.com/florianheinemann	https://avatars.githubusercontent.com/u/6122601?v=3	Cambridge, MA
15749	mans0954	\N	https://github.com/mans0954	https://avatars.githubusercontent.com/u/4855578?v=3	\N
15767	braincore	\N	https://github.com/braincore	https://avatars.githubusercontent.com/u/4674965?v=3	\N
15787	marpetr	\N	https://github.com/marpetr	https://avatars.githubusercontent.com/u/546797?v=3	\N
15791	jamezpolley	jp@jamezpolley.com	https://github.com/jamezpolley	https://avatars.githubusercontent.com/u/216918?v=3	\N
15761	drakedevel	adrake@adrake.org	https://github.com/drakedevel	https://avatars.githubusercontent.com/u/403067?v=3	San Francisco, CA
15793	mattrobenolt	m@robenolt.com	https://github.com/mattrobenolt	https://avatars.githubusercontent.com/u/375744?v=3	San Francisco, CA
15809	ericsuh	\N	https://github.com/ericsuh	https://avatars.githubusercontent.com/u/382805?v=3	San Francisco, CA
15823	jefflub	\N	https://github.com/jefflub	https://avatars.githubusercontent.com/u/518479?v=3	Seattle, WA
15913	lubelski	\N	https://github.com/lubelski	https://avatars.githubusercontent.com/u/195878?v=3	Boston, MA
15797	sofuture	jeffz@eml.cc	https://github.com/sofuture	https://avatars.githubusercontent.com/u/66669?v=3	Missoula, Montana
15919	AntouanK	\N	https://github.com/AntouanK	https://avatars.githubusercontent.com/u/4569111?v=3	London, UK
15817	teisenbeDropbox	teisenberger@dropbox.com	https://github.com/teisenbeDropbox	https://avatars.githubusercontent.com/u/4564460?v=3	\N
15923	asfktz	asf.ktz@gmail.com	https://github.com/asfktz	https://avatars.githubusercontent.com/u/199747?v=3	\N
15803	jszobody	joseph@stechstudio.com	https://github.com/jszobody	https://avatars.githubusercontent.com/u/203749?v=3	Geneva, IL
15929	ckross01	christopher.k.ross@gmail.com	https://github.com/ckross01	https://avatars.githubusercontent.com/u/1379666?v=3	Gilbert, AZ
15971	virtuakazib	\N	https://github.com/virtuakazib	https://avatars.githubusercontent.com/u/4948337?v=3	\N
15973	perrin4869	julian@dotcore.co.il	https://github.com/perrin4869	https://avatars.githubusercontent.com/u/5774716?v=3	\N
15937	dashed	mailforalberto@gmail.com	https://github.com/dashed	https://avatars.githubusercontent.com/u/139499?v=3	Toronto, Canada
15943	fixe	tiago.ribeiro@gmail.com	https://github.com/fixe	https://avatars.githubusercontent.com/u/484559?v=3	Braga, Portugal
15959	laurelnaiad	laurelnaiad@gmail.com	https://github.com/laurelnaiad	https://avatars.githubusercontent.com/u/4078946?v=3	Oakland, CA, USA
16193	kimw	\N	https://github.com/kimw	https://avatars.githubusercontent.com/u/658250?v=3	Dallas TX, US
16171	clowwindy	\N	https://github.com/clowwindy	https://avatars.githubusercontent.com/u/1073082?v=3	\N
16183	ddatsh	\N	https://github.com/ddatsh	https://avatars.githubusercontent.com/u/1809194?v=3	\N
16187	amyangfei	amyangfei@gmail.com	https://github.com/amyangfei	https://avatars.githubusercontent.com/u/1527315?v=3	\N
16189	lidashuang	ldshuang@gmail.com	https://github.com/lidashuang	https://avatars.githubusercontent.com/u/612381?v=3	\N
16223	vmlinz	\N	https://github.com/vmlinz	https://avatars.githubusercontent.com/u/68061?v=3	\N
16229	lozen130	\N	https://github.com/lozen130	https://avatars.githubusercontent.com/u/652264?v=3	\N
16201	vfreex	vfreex+github@gmail.com	https://github.com/vfreex	https://avatars.githubusercontent.com/u/9941773?v=3	\N
16231	haobug	\N	https://github.com/haobug	https://avatars.githubusercontent.com/u/1269309?v=3	\N
16249	li3shiyi	\N	https://github.com/li3shiyi	https://avatars.githubusercontent.com/u/11346056?v=3	\N
16217	Mygod	contact-github@mygod.be	https://github.com/Mygod	https://avatars.githubusercontent.com/u/3511321?v=3	Mygod
16241	kookxiang	gayhub@ikk.me	https://github.com/kookxiang	https://avatars.githubusercontent.com/u/2725379?v=3	Shenzhen, Guangdong, China
16253	GhostFlying	g@ghostflying.com	https://github.com/GhostFlying	https://avatars.githubusercontent.com/u/4019569?v=3	Hangzhou, China
16369	bennlich	\N	https://github.com/bennlich	https://avatars.githubusercontent.com/u/704368?v=3	\N
16361	hyperknot	zsolt.ero@gmail.com	https://github.com/hyperknot	https://avatars.githubusercontent.com/u/494223?v=3	Budapest, Hungary
16363	AndriiHeonia	a.heonia@gmail.com	https://github.com/AndriiHeonia	https://avatars.githubusercontent.com/u/773648?v=3	Berlin, Germany
16421	glaidler	\N	https://github.com/glaidler	https://avatars.githubusercontent.com/u/1322247?v=3	UK
16439	justinffs	\N	https://github.com/justinffs	https://avatars.githubusercontent.com/u/17650336?v=3	Vancouver, B.C.
16447	getsetbro	\N	https://github.com/getsetbro	https://avatars.githubusercontent.com/u/442793?v=3	Chicagoland
16411	elidupuis	elidupuis+code@gmail.com	https://github.com/elidupuis	https://avatars.githubusercontent.com/u/196410?v=3	Edmonton AB
16453	qmacro	\N	https://github.com/qmacro	https://avatars.githubusercontent.com/u/73068?v=3	Manchester
16417	migmruiz	migmruiz@gmail.com	https://github.com/migmruiz	https://avatars.githubusercontent.com/u/1760721?v=3	\N
16427	jeyb	jey.balachandran@gmail.com	https://github.com/jeyb	https://avatars.githubusercontent.com/u/142833?v=3	San Francisco, CA
16433	YuanxiangFranck	franckwang123@gmail.com	https://github.com/YuanxiangFranck	https://avatars.githubusercontent.com/u/14313188?v=3	France
16451	AliMD	i@ali.md	https://github.com/AliMD	https://avatars.githubusercontent.com/u/697913?v=3	Mashhad, IR
16487	MichaelGooden	\N	https://github.com/MichaelGooden	https://avatars.githubusercontent.com/u/1275012?v=3	Port Elizabeth, South Africa
16507	aderuwe	\N	https://github.com/aderuwe	https://avatars.githubusercontent.com/u/1125184?v=3	Belgium, Antwerp
16481	kduma	\N	https://github.com/kduma	https://avatars.githubusercontent.com/u/1062582?v=3	\N
16519	beinbm	\N	https://github.com/beinbm	https://avatars.githubusercontent.com/u/995872?v=3	\N
16477	OzzyCzech	ozana@omdesign.cz	https://github.com/OzzyCzech	https://avatars.githubusercontent.com/u/105520?v=3	Czech Republic
16553	Zizaco	\N	https://github.com/Zizaco	https://avatars.githubusercontent.com/u/777635?v=3	\N
16561	jsyi	jsyi86@gmail.com	https://github.com/jsyi	https://avatars.githubusercontent.com/u/2161327?v=3	\N
16529	benjamindavid	ben@dukt.net	https://github.com/benjamindavid	https://avatars.githubusercontent.com/u/2911900?v=3	Grenoble, France
16547	zot24	sotoisra24@gmail.com	https://github.com/zot24	https://avatars.githubusercontent.com/u/678498?v=3	Newcastle upon Tyne
16567	gabrielbull	me@gabrielbull.com	https://github.com/gabrielbull	https://avatars.githubusercontent.com/u/671923?v=3	Montréal, Canada
16573	reinink	jonathan@reinink.ca	https://github.com/reinink	https://avatars.githubusercontent.com/u/882133?v=3	Beamsville, Ontario
16741	risaacson	\N	https://github.com/risaacson	https://avatars.githubusercontent.com/u/1542625?v=3	Minnesota
16747	jpmens	\N	https://github.com/jpmens	https://avatars.githubusercontent.com/u/60706?v=3	\N
16603	thbourlove	thbourlove@gmail.com	https://github.com/thbourlove	https://avatars.githubusercontent.com/u/1768066?v=3	Shanghai
16729	abadger	a.badger@gmail.com	https://github.com/abadger	https://avatars.githubusercontent.com/u/209242?v=3	Granite Bay, CA
16799	dragorosson	\N	https://github.com/dragorosson	https://avatars.githubusercontent.com/u/2906354?v=3	\N
16789	thomaskrag	ildiroen@gmail.com	https://github.com/thomaskrag	https://avatars.githubusercontent.com/u/6620141?v=3	\N
16759	anotherjesse	anotherjesse@gmail.com	https://github.com/anotherjesse	https://avatars.githubusercontent.com/u/27?v=3	San Francisco, CA
16763	goozbach	derek@goozbach.com	https://github.com/goozbach	https://avatars.githubusercontent.com/u/71405?v=3	American Fork, Utah
16787	takis	takis@issaris.org	https://github.com/takis	https://avatars.githubusercontent.com/u/128511?v=3	Belgium
16901	blewa	\N	https://github.com/blewa	https://avatars.githubusercontent.com/u/658174?v=3	Portland, OR
16811	matburt	bsdmatburt@gmail.com	https://github.com/matburt	https://avatars.githubusercontent.com/u/89544?v=3	Raleigh, NC
16879	kstokke	\N	https://github.com/kstokke	https://avatars.githubusercontent.com/u/245480?v=3	\N
16889	duritong	\N	https://github.com/duritong	https://avatars.githubusercontent.com/u/9511?v=3	\N
16883	jhoblitt	josh@hoblitt.com	https://github.com/jhoblitt	https://avatars.githubusercontent.com/u/948901?v=3	Tucson, AZ
16903	x-way	x-way@waterwave.ch	https://github.com/x-way	https://avatars.githubusercontent.com/u/53128?v=3	Switzerland
16931	vrthra	\N	https://github.com/vrthra	https://avatars.githubusercontent.com/u/70410?v=3	Corvallis
16937	zaphod42	\N	https://github.com/zaphod42	https://avatars.githubusercontent.com/u/295810?v=3	London, UK
16943	Aethylred	\N	https://github.com/Aethylred	https://avatars.githubusercontent.com/u/90848?v=3	Palmerston North, New Zealand
16921	nfagerlund	\N	https://github.com/nfagerlund	https://avatars.githubusercontent.com/u/484309?v=3	\N
16927	MarkusQ	\N	https://github.com/MarkusQ	https://avatars.githubusercontent.com/u/34996?v=3	\N
16949	glarizza	glarizza@me.com	https://github.com/glarizza	https://avatars.githubusercontent.com/u/139824?v=3	Portland, Oregon
16963	masterzen	brice+github@daysofwonder.com	https://github.com/masterzen	https://avatars.githubusercontent.com/u/20242?v=3	Paris, France
16981	mindymo	\N	https://github.com/mindymo	https://avatars.githubusercontent.com/u/12620152?v=3	Portland, Oregon
17117	illupus	lupus@oddwiz.org	https://github.com/illupus	https://avatars.githubusercontent.com/u/263091?v=3	\N
16979	ahpook	ahpook@gmail.com	https://github.com/ahpook	https://avatars.githubusercontent.com/u/56753?v=3	PDX
16987	ghoneycutt	github@garretthoneycutt.com	https://github.com/ghoneycutt	https://avatars.githubusercontent.com/u/313891?v=3	Indianapolis
16993	mikegerwitz	mtg@gnu.org	https://github.com/mikegerwitz	https://avatars.githubusercontent.com/u/93763?v=3	United States
17107	sandyarmstrong	sanfordarmstrong@gmail.com	https://github.com/sandyarmstrong	https://avatars.githubusercontent.com/u/155076?v=3	Las Vegas, NV
17113	harinath	harinath@hurrynot.org	https://github.com/harinath	https://avatars.githubusercontent.com/u/4610?v=3	Bangalore, India
17183	roadhump	e79eas@gmail.com	https://github.com/roadhump	https://avatars.githubusercontent.com/u/234692?v=3	Belarus, Minsk
17203	jdan	\N	https://github.com/jdan	https://avatars.githubusercontent.com/u/287268?v=3	NY / NJ
17209	bentruyman	\N	https://github.com/bentruyman	https://avatars.githubusercontent.com/u/85315?v=3	San Francisco, CA, USA
17231	jpjoyal	\N	https://github.com/jpjoyal	https://avatars.githubusercontent.com/u/32315?v=3	Montreal, QC
17189	johntron	john.syrinek@gmail.com	https://github.com/johntron	https://avatars.githubusercontent.com/u/131961?v=3	Dallas, TX
17191	magicdawn	magicdawn@qq.com	https://github.com/magicdawn	https://avatars.githubusercontent.com/u/4067115?v=3	China
17201	jbellenger	github@james.bellenger.org	https://github.com/jbellenger	https://avatars.githubusercontent.com/u/1391805?v=3	Oakland, CA
17207	brollb	brian.broll@gmail.com	https://github.com/brollb	https://avatars.githubusercontent.com/u/4982789?v=3	Nashville, TN
17221	eivindfjeldstad	eivind.fjeldstad@gmail.com	https://github.com/eivindfjeldstad	https://avatars.githubusercontent.com/u/1316951?v=3	Oslo, Norway
17239	kewah	\N	https://github.com/kewah	https://avatars.githubusercontent.com/u/195442?v=3	Stockholm, Sweden
17293	rramsden	\N	https://github.com/rramsden	https://avatars.githubusercontent.com/u/82835?v=3	Tokyo, Japan
17321	gcoderre	\N	https://github.com/gcoderre	https://avatars.githubusercontent.com/u/10054?v=3	Montréal, Québec, Canada
17327	hayduke19us	hayduke19us@gmail.com	https://github.com/hayduke19us	https://avatars.githubusercontent.com/u/218698?v=3	\N
17291	kenchan	kenichi.taka@gmail.com	https://github.com/kenchan	https://avatars.githubusercontent.com/u/6875?v=3	Chiba
17299	RaVbaker	ravbaker@gmail.com	https://github.com/RaVbaker	https://avatars.githubusercontent.com/u/56023?v=3	Warszawa/Poland
17317	BCVisin	Blake@oybro.com	https://github.com/BCVisin	https://avatars.githubusercontent.com/u/1686127?v=3	Los Angeles, CA
17323	KensoDev	avi@kensodev.com	https://github.com/KensoDev	https://avatars.githubusercontent.com/u/79502?v=3	San Francisco
17341	kcyeu	\N	https://github.com/kcyeu	https://avatars.githubusercontent.com/u/7254000?v=3	Taipei, Taiwan
17351	stevenbeeckman	\N	https://github.com/stevenbeeckman	https://avatars.githubusercontent.com/u/399360?v=3	Brussels, Belgium
17333	hkulekci	haydarkulekci@gmail.com	https://github.com/hkulekci	https://avatars.githubusercontent.com/u/586318?v=3	İstanbul, Ankara, Turkey
\.


--
-- Name: contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('contributors_id_seq', 1, false);


--
-- Data for Name: language_usage; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY language_usage (language_id, project_id) FROM stdin;
1	1
3	1
6	1
7	1
9	1
10	2
9	31
3	32
23	32
26	32
27	32
12	32
19	32
28	32
30	32
9	32
31	32
1	32
33	32
34	32
35	32
33	33
1	34
9	34
19	35
10	36
9	36
3	37
28	37
7	37
37	38
10	38
38	38
1	38
3	38
33	38
23	38
39	38
40	38
41	38
27	38
12	38
19	38
28	38
42	38
7	38
31	38
9	38
19	39
3	40
12	40
18	40
28	40
7	40
9	40
12	61
7	61
12	62
7	62
12	65
12	70
10	77
1	77
3	77
7	79
7	80
10	82
65	83
65	84
7	84
7	85
7	108
9	108
18	109
7	109
7	110
70	111
12	111
7	111
7	115
12	137
9	137
12	138
19	138
34	138
9	138
12	139
9	139
9	140
9	141
12	143
19	143
12	146
9	146
12	167
12	169
19	169
12	170
19	170
12	171
12	172
12	173
19	173
12	174
19	174
12	175
12	176
12	197
12	198
12	201
12	202
7	202
12	203
19	203
12	205
12	221
19	221
89	221
12	223
12	225
19	225
12	226
12	229
19	229
9	229
69	250
12	250
69	251
12	251
12	252
12	253
12	254
12	258
7	281
7	284
7	286
7	288
7	310
7	315
12	316
7	318
7	319
70	340
12	340
7	340
7	341
7	345
7	349
1	371
3	371
75	371
88	371
39	371
34	371
78	371
49	371
26	371
28	371
30	371
93	371
94	371
31	371
3	373
75	373
60	373
88	373
89	373
95	373
26	373
28	373
19	373
30	373
9	373
10	373
1	373
34	373
78	373
80	373
12	374
31	374
12	375
1	376
3	376
9	376
1	378
3	378
60	378
34	378
78	378
12	378
30	378
9	378
9	400
12	401
19	403
70	407
12	407
10	435
65	435
61	435
12	435
7	435
9	435
1	438
3	438
26	438
34	438
9	438
19	460
12	461
12	462
1	463
3	463
12	463
9	463
12	464
19	464
12	465
19	466
70	467
12	467
12	469
19	469
9	490
3	491
18	491
30	491
18	492
9	492
9	494
9	495
70	497
12	497
9	497
18	499
9	499
12	520
7	520
7	522
12	525
7	528
7	531
12	532
12	533
12	556
12	557
70	558
12	558
12	559
12	560
69	561
12	561
12	562
12	563
12	564
1	585
3	585
34	585
41	585
1	587
3	587
12	587
19	587
28	587
9	587
1	588
3	588
19	588
34	588
9	588
1	589
19	589
34	589
9	589
12	590
10	591
19	592
31	592
9	592
42	593
42	594
34	594
7	615
7	616
7	617
7	618
7	619
7	620
7	621
7	622
9	622
7	623
7	624
12	645
9	645
12	647
19	647
12	649
9	649
69	650
12	650
19	650
12	651
28	651
12	652
37	653
10	653
1	653
12	653
28	653
9	654
12	677
19	677
12	683
10	684
12	684
12	705
1	706
3	706
12	706
28	706
9	706
12	707
19	707
7	707
105	707
12	708
7	708
1	709
3	709
28	709
34	709
125	709
111	709
9	709
31	709
12	714
125	714
9	714
70	735
12	735
70	736
1	736
12	736
9	736
70	737
1	737
3	737
9	737
70	738
1	738
9	738
1	739
70	739
64	739
12	739
28	739
9	739
70	740
1	740
9	740
70	741
12	741
70	743
1	743
12	743
9	743
10	766
10	767
10	768
61	768
10	771
61	772
10	773
10	774
37	795
1	795
70	795
3	795
12	795
28	795
7	795
12	796
12	798
12	799
12	800
10	803
12	804
9	804
1	825
12	825
9	825
12	826
12	827
12	828
12	829
12	830
12	831
12	833
12	834
12	859
19	859
12	860
12	861
12	886
34	886
19	887
9	888
12	891
7	891
12	893
19	893
111	893
10	915
10	916
10	917
10	918
10	919
12	921
10	923
65	923
12	923
10	924
12	924
61	924
12	945
12	946
12	947
12	948
12	949
12	951
12	952
12	953
12	954
12	975
19	975
19	978
19	979
19	980
19	981
7	981
19	984
12	1002
12	1003
19	1003
12	1032
12	1035
7	1062
78	1063
7	1063
78	1064
7	1064
78	1065
7	1065
78	1066
7	1066
7	1067
78	1071
7	1071
69	1088
12	1088
12	1089
12	1090
10	1094
61	1094
3	1095
9	1095
1	1096
3	1096
12	1096
18	1096
9	1096
7	1097
1	1098
3	1098
12	1098
19	1098
1	1099
3	1099
34	1099
10	1100
1	1100
12	1100
19	1100
7	1100
9	1100
7	1101
12	1102
9	1102
1	1123
3	1123
64	1123
12	1123
28	1123
111	1123
9	1123
1	1124
3	1124
12	1124
9	1124
1	1125
3	1125
12	1125
9	1125
31	1125
1	1126
3	1126
60	1126
48	1126
12	1126
7	1126
9	1126
10	1127
1	1127
3	1127
64	1127
34	1127
70	1127
12	1127
19	1127
28	1127
7	1127
30	1127
9	1127
12	1128
1	1129
3	1129
64	1129
28	1129
30	1129
9	1129
12	1130
12	1131
12	1132
7	1134
7	1137
7	1138
12	1140
7	1140
7	1141
28	1164
67	1164
7	1164
28	1165
7	1165
28	1167
7	1167
28	1168
7	1168
12	1187
7	1187
12	1188
12	1189
70	1190
12	1190
70	1191
12	1191
69	1192
70	1192
12	1192
12	1193
12	1194
12	1195
12	1216
12	1217
12	1218
12	1219
7	1219
12	1220
12	1221
34	1223
9	1223
70	1253
19	1253
7	1253
12	1254
7	1254
7	1255
7	1259
7	1285
10	1287
7	1313
37	1319
50	1319
19	1319
7	1319
70	1322
12	1322
12	1343
12	1344
7	1344
12	1345
7	1345
12	1346
7	1346
12	1347
7	1347
70	1348
12	1348
7	1348
12	1352
7	1373
7	1375
12	1378
42	1378
9	1378
7	1379
70	1381
12	1381
12	1404
12	1405
9	1407
37	1408
12	1410
7	1411
19	1412
12	1433
7	1433
7	1434
7	1435
34	1437
7	1438
1	1464
3	1464
9	1464
10	1465
34	1467
10	1468
1	1468
3	1468
28	1468
30	1468
9	1468
10	1469
10	1470
3	1471
75	1493
121	1493
122	1493
18	1493
40	1493
61	1493
41	1493
134	1493
136	1493
27	1493
137	1493
42	1493
51	1493
30	1493
139	1493
105	1493
9	1493
63	1493
106	1493
34	1493
102	1493
67	1493
80	1493
14	1493
127	1493
15	1493
37	1493
60	1493
141	1493
69	1493
48	1493
95	1493
50	1493
12	1493
28	1493
6	1493
19	1493
7	1493
10	1493
1	1493
99	1493
65	1493
143	1493
144	1493
66	1493
145	1493
70	1493
111	1493
103	1493
12	1494
70	1499
43	1499
12	1499
7	1499
9	1499
12	1500
9	1500
12	1501
9	1501
12	1502
9	1502
9	1503
12	1504
9	1504
12	1505
9	1505
9	1506
28	1518
9	1519
12	1520
1	1521
12	1521
9	1521
12	1522
12	1523
9	1526
1	1527
3	1527
12	1527
9	1527
7	1548
7	1550
7	1551
7	1552
12	1554
7	1554
7	1555
7	1556
12	1557
7	1557
10	1580
12	1580
10	1581
12	1581
3	1583
3	1585
12	1586
1	1587
3	1587
34	1587
49	1587
6	1587
28	1587
30	1587
127	1587
9	1587
10	1608
105	1608
12	1609
105	1609
105	1610
105	1611
65	1613
105	1613
105	1615
105	1616
105	1617
12	1638
7	1638
12	1639
70	1641
12	1641
70	1642
12	1642
19	1642
34	1642
70	1643
12	1643
70	1644
12	1644
19	1644
34	1644
12	1669
12	1670
7	1670
12	1671
12	1678
7	1679
12	1680
7	1681
70	1682
12	1684
12	1686
12	1708
12	1710
19	1710
12	1728
7	1728
12	1730
19	1730
12	1732
7	1732
7	1733
12	1734
7	1734
7	1735
12	1736
7	1736
9	1759
3	1760
26	1760
7	1760
9	1760
3	1762
34	1762
104	1762
78	1762
109	1762
26	1762
9	1762
31	1762
18	1764
9	1764
1	1766
3	1766
34	1766
1	1767
3	1767
3	1788
12	1788
19	1788
1	1789
19	1789
51	1789
30	1789
9	1789
19	1790
19	1792
19	1793
19	1794
19	1795
19	1796
19	1797
12	1818
12	1819
12	1820
12	1821
9	1821
12	1822
12	1823
12	1824
12	1825
12	1826
12	1827
37	1849
1	1849
3	1849
88	1849
34	1849
61	1849
50	1849
28	1849
9	1849
37	1850
50	1850
34	1850
61	1850
9	1850
37	1852
50	1852
43	1852
61	1852
125	1852
37	1853
61	1853
37	1855
1	1855
50	1855
61	1855
125	1855
37	1856
61	1856
12	1857
12	1878
18	1878
18	1879
31	1879
18	1880
18	1881
18	1882
18	1883
12	1884
18	1884
1	1885
3	1885
18	1885
34	1885
78	1885
26	1885
12	1885
102	1885
30	1885
9	1885
18	1887
1	1908
3	1908
28	1908
10	1909
1	1909
3	1909
64	1909
12	1909
6	1909
28	1909
9	1909
12	1912
1	1914
3	1914
60	1914
12	1914
28	1914
12	1915
9	1936
9	1937
7	1938
9	1938
10	1939
9	1939
12	1941
19	1941
10	1943
12	1943
9	1943
9	1944
7	1966
7	1967
12	1968
12	1969
7	1969
12	1970
12	1973
12	1974
12	1975
12	1983
12	1986
37	1989
10	1989
1	1989
3	1989
113	1989
12	1989
28	1989
109	1989
9	1989
12	1990
12	1991
12	1994
12	1995
10	2017
12	2017
80	2017
61	2017
9	2017
10	2019
61	2019
10	2023
12	2023
9	2023
10	2025
65	2025
12	2026
74	2055
7	2055
49	2077
12	2077
7	2077
9	2077
7	2078
7	2079
7	2080
7	2081
7	2082
7	2083
7	2084
7	2085
7	2086
70	2114
12	2114
12	2115
1	2137
63	2137
3	2137
26	2137
12	2137
19	2137
51	2137
9	2137
63	2138
12	2138
7	2138
9	2138
63	2139
12	2139
12	2140
9	2140
1	2141
3	2141
60	2141
28	2141
9	2141
1	2143
3	2143
27	2143
28	2143
34	2143
30	2143
9	2143
31	2143
1	2144
3	2144
28	2144
30	2144
9	2144
63	2145
12	2145
9	2145
37	2168
10	2168
43	2168
50	2168
37	2169
37	2170
37	2171
37	2172
37	2173
37	2174
37	2175
12	2197
18	2197
12	2198
12	2199
12	2200
7	2202
7	2204
7	2205
7	2206
7	2207
7	2208
7	2210
7	2211
12	2232
37	2234
10	2234
1	2234
3	2234
74	2234
69	2234
70	2234
159	2234
12	2234
28	2234
51	2234
7	2234
111	2234
9	2234
12	2237
12	2240
12	2241
12	2248
7	2248
1	2272
3	2272
34	2272
89	2272
26	2272
6	2272
28	2272
7	2272
9	2272
12	2273
7	2273
9	2274
12	2275
1	2276
3	2276
34	2276
6	2276
28	2276
7	2276
9	2276
9	2277
3	2278
6	2278
9	2278
7	2279
70	2289
12	2289
9	2289
3	2290
9	2290
70	2291
9	2293
19	2294
9	2295
31	2295
62	2297
10	2297
39	2297
9	2297
12	2318
12	2319
12	2320
12	2322
12	2323
12	2324
12	2325
10	2353
9	2378
70	2379
12	2379
70	2380
12	2380
18	2381
1	2382
3	2382
28	2382
30	2382
10	2383
1	2383
3	2383
65	2383
34	2383
9	2383
1	2384
3	2384
28	2384
9	2384
37	2385
70	2386
12	2386
70	2387
12	2408
12	2409
12	2410
12	2411
12	2412
12	2413
12	2414
12	2415
12	2417
19	2424
19	2425
19	2428
19	2429
19	2430
19	2433
12	2454
18	2454
80	2454
9	2454
19	2456
9	2456
9	2458
7	2484
7	2485
7	2486
7	2488
7	2490
51	2491
7	2491
31	2491
12	2492
34	2492
7	2492
7	2493
37	2516
9	2516
37	2519
162	2519
12	2545
12	2547
12	2548
12	2549
12	2551
12	2552
7	2562
7	2563
7	2564
18	2565
7	2567
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY languages (id, name, creator, type, "firstAppeared", description) FROM stdin;
1	C++	Bjarne Stroustrup	Compiled	1983	C++ is a general-purpose programming language. It has imperative, object-oriented and generic programming features, while also providing facilities for low-level memory manipulation. It was designed with a bias toward system programming and embedded, resource-constrained and large systems, with performance, efficiency and flexibility of use as its design highlights. C++ has also been found useful in many other contexts, with key strengths being software infrastructure and resource-constrained applications, including desktop applications, servers, and performance-critical applications.
3	C	Dennis Ritchie	Compiled	1972	C is a general-purpose, imperative computer programming language, supporting structured programming, lexical variable scope and recursion, while a static type system prevents many unintended operations. By design, C provides constructs that map efficiently to typical machine instructions, and therefore it has found lasting use in applications that had formerly been coded in assembly language, including operating systems, as well as various application software for computers ranging from supercomputers to embedded systems.
6	Lua	Roberto Ierusalimschy, Waldemar Celes, Luiz Henrique de Figueiredo	Interpreted	1993	Lua is a lightweight multi-paradigm programming language designed primarily for embedded systems and clients. Lua is cross-platform since it is written in ANSI C, and has a relatively simple C API.
7	Ruby	Yukihiro Matsumoto	Interpreted	1995	Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro Matz Matsumoto in Japan. According to its creator, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, including functional, object-oriented, and imperative. It also has a dynamic type system and automatic memory management.
9	Python	Guido van Rossum	Interpreted	1991	Python is a widely used high-level, general-purpose, interpreted, dynamic programming language. Its design philosophy emphasizes code readability, and its syntax allows programmers to express concepts in fewer lines of code than possible in languages such as C++ or Java. The language provides constructs intended to enable writing clear programs on both a small and large scale.
10	Java	James Gosling	Compiled	1995	Java is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible. It is intended to let application developers write once, run anywhere (WORA), meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.
12	JavaScript	Brendan Eich	Interpreted	1995	JavaScript is a high-level, dynamic, untyped, and interpreted programming language. It has been standardized in the ECMAScript language specification. Alongside HTML and CSS, it is one of the three core technologies of World Wide Web content production; the majority of websites employ it and it is supported by all modern Web browsers without plug-ins.
14	LiveScript	Jeremy Ashkenas, Satoshi Murakami, George Zahariev	Interpreted	2011	LiveScript is a functional language that compiles to JavaScript. It was created by Jeremy Ashkenas-the creator of CoffeeScript-along with Satoshi Muramaki, George Zahariev, and many others. Notably, LiveScript was briefly the name of JavaScript in 1990s.
15	Dart	Lars Bak, Kasper Lund	Compiled	2011	Dart is a general-purpose programming language originally developed by Google and later approved as a standard by Ecma. It is  a class-based, single inheritance, object-oriented language with C-style syntax which can optionally transcompile into JavaScript. It supports interfaces, mixins, abstract classes, reified generics, and optional typing.
18	Go	Robert Griesemer, Rob Pike, Ken Thompson	Compiled	2009	Go is a free and open source programming language created at Google in 2007 by Robert Griesemer, Rob Pike, and Ken Thompson. It is a compiled, statically typed language in the tradition of Algol and C, with garbage collection, limited structural typing, memory safety features and CSP-style concurrent programming features added.
19	PHP	Rasmus Lerdorf	Interpreted	1995	PHP is a server-side scripting language designed primarily for web development but is also used as a general-purpose programming language. Originally created by Rasmus Lerdorf in 1994, the PHP reference implementation is now produced by The PHP Development Team. PHP originally stood for Personal Home Page, but it now stands for the recursive acronym PHP: Hypertext Preprocessor.
23	Standard ML	David MacQueen, Mads Tofte, Robert Harper, and Robin Milner	Compiled	1990	Standard ML (SML) is a general-purpose, modular, functional programming language with compile-time type checking and type inference. It is popular among compiler writers and programming language researchers, as well as in the development of theorem provers.
26	Awk	Alfred Aho, Peter Weinberger, Brian Kernighan	Interpreted	1977	AWK was created at Bell Labs in the 1970s, and its name is derived from the surnames of its authors - Alfred Aho, Peter Weinberger, and Brian Kernighan. It is a programming language designed for text processing and typically used as a data extraction and reporting tool. It is a standard feature of most Unix-like operating systems.
27	OCaml	INRIA	Compiled	1996	OCaml, originally known as Objective Caml, is the main implementation of the Caml programming language, created by Xavier Leroy, Jerome Vouillon, Damien Doligez, Didier Remy, Ascander Suarez and others in 1996. A member of the ML language family, OCaml extends the core Caml language with object-oriented constructs.
28	Objective-C	Tom Love and Brad Cox	Compiled	1984	Objective-C is a general-purpose, object-oriented programming language that adds Smalltalk-style messaging to the C programming language. It was the main programming language used by Apple for the OS X and iOS operating systems, and their respective application programming interfaces (APIs) Cocoa and Cocoa Touch prior to the introduction of Swift.
30	Assembly	unknown	Compiled	1949	An assembly (or assembler) language, often abbreviated asm, is a low-level programming language for a computer, or other programmable device, in which there is a very strong (generally one-to-one) correspondence between the language and the architecture's machine code instructions. Each assembly language is specific to a particular computer architecture. In contrast, most high-level programming languages are generally portable across multiple architectures but require interpreting or compiling. Assembly language may also be called symbolic machine code.
31	Emacs Lisp	Richard Stallman, Guy L. Steele, Jr.	Interpreted	1985	Emacs Lisp is a dialect of the Lisp programming language used as a scripting language by the GNU Emacs and XEmacs text editors. It is used for implementing most of the editing functionality built into Emacs, the remainder being written in C (as is the Lisp interpreter itself). Emacs Lisp is also referred to as Elisp, although there is also an older, unrelated Lisp dialect with that name.
33	Hack	Facebook	Interpreted	2014	Hack is a programming language for the HipHop Virtual Machine, created by Facebook as a dialect of PHP. The language implementation is open-source, licensed under the BSD License. The language allows programmers to use both dynamic typing and static typing. This kind of a type system is called gradual typing, which is also implemented in other programming languages such as ActionScript.
34	Perl	Larry Wall	Interpreted	1987	Perl is a family of high-level, general-purpose, interpreted, dynamic programming languages. Perl was originally developed by Larry Wall in 1987 as a general-purpose Unix scripting language to make report processing easier. Since then, it has undergone many changes and revisions. Perl 6, which began as a redesign of Perl 5 in 2000, eventually evolved into a separate language. Both languages continue to be developed independently by different development teams and liberally borrow ideas from one another.
35	PAWN	CompuPhase	Compiled	2000	pawn is a simple, typeless, 32-bit extension language with a C-like syntax. A pawn source program is compiled to a binary file for optimal execution speed. The pawn compiler outputs P-code (or bytecode) that subsequently runs on an abstract machine. Execution speed, stability, simplicity and a small footprint were essential design criteria for both the language and the abstract machine.
37	C#	Microsoft	Compiled	2000	C# is a multi-paradigm programming language encompassing strong typing, imperative, declarative, functional, generic, object-oriented , and component-oriented programming disciplines. It was developed by Microsoft within its .NET initiative and later approved as a standard by Ecma (ECMA-334) and ISO (ISO/IEC 23270:2006). C# is one of the programming languages designed for the Common Language Infrastructure.
38	Opa	MLstate	Compiled	2011	Opa is an open-source programming language for developing scalable web applications. It can be used for both client-side and server-side scripting, where complete programs are written in Opa and subsequently compiled to Nodejs on the server and JavaScript on the client, with the compiler automating all communication between the two. Opa implements strong, static typing, which can be helpful in protecting against security issues such as SQL injections and cross-site scripting attacks.
39	Prolog	Alain Colmerauer	Compiled	1972	Prolog is a general-purpose logic programming language associated with artificial intelligence and computational linguistics. Prolog has its roots in first-order logic, a formal logic, and unlike many other programming languages, Prolog is declarative: the program logic is expressed in terms of relations, represented as facts and rules. A computation is initiated by running a query over these relations.
40	Common Lisp	Scott Fahlman, Richard P. Gabriel, Dave Moon, Guy Steele, Dan Weinreb	Interpreted	1984	Common Lisp is a general-purpose, multi-paradigm programming language. It supports a combination of procedural, functional, and object-oriented programming paradigms. As a dynamic programming language, it facilitates evolutionary and incremental software development, with iterative compilation into efficient run-time programs. This incremental development is often done interactively without interrupting the running application.
41	Erlang	Joe Armstrong, Robert Virding, and Mike Williams	Compiled	1986	Erlang is a general-purpose, concurrent, functional programming language. It is also a garbage-collected runtime system. The sequential subset of Erlang supports eager evaluation, single assignment, and dynamic typing. Erlang is known for its designs that are well suited for systems with the following characteristics: Distributed, Fault-tolerant, Soft real-time, Highly available, non-stop applications, Hot swapping.
42	Haskell	Lennart Augustsson, Dave Barton, Brian Boutel, Warren Burton, others	Compiled	1990	Haskell is a standardized, general-purpose purely functional programming language, with non-strict semantics and strong static typing. It is named after logician Haskell Curry. Haskell features a type system with type inference and lazy evaluation.
43	Smalltalk	Alan Kay, Dan Ingalls, Adele Goldberg	Compiled	1972	Smalltalk is an object-oriented, dynamically typed, reflective programming language. Smalltalk was created as the language to underpin the new world of computing exemplified by human-computer symbiosis. It was designed and created in part for educational use, more so for constructionist learning, at the Learning Research Group (LRG) of Xerox PARC.
48	R	Ross Ihaka and Robert Gentleman	Interpreted	1993	R is a programming language and software environment for statistical computing and graphics supported by the R Foundation for Statistical Computing. The R language is widely used among statisticians and data miners for developing statistical software and data analysis. Polls, surveys of data miners, and studies of scholarly literature databases show that R's popularity has increased substantially in recent years.
49	Perl6	Larry Wall	Interpreted	2015	Perl 6 is a member of the Perl family of programming languages.
50	Visual Basic	Microsoft	Interpreted	1991	Visual Basic is a third-generation event-driven programming language and integrated development environment (IDE) from Microsoft for its Component Object Model (COM) programming model first released in 1991 and declared legacy in 2008. Microsoft intended Visual Basic to be relatively easy to learn and use. Visual Basic was derived from BASIC, a user-friendly programming language designed for beginners, and it enables the rapid application development (RAD) of graphical user interface (GUI) applications, access to databases using Data Access Objects, Remote Data Objects, or ActiveX Data Objects, and creation of ActiveX controls and objects.
51	Pascal	Niklaus Wirth	Compiled	1970	Pascal is an imperative and procedural programming language, which Niklaus Wirth designed in 1968-69 and published in 1970, as a small, efficient language intended to encourage good programming practices using structured programming and data structuring.
60	D	Walter Bright, Andrei Alexandrescu	Compiled	2001	The D programming language is an object-oriented, imperative, multi-paradigm system programming language created by Walter Bright of Digital Mars and released in 2001. Bright was joined in the design and development effort in 2007 by Andrei Alexandrescu. Though it originated as a re-engineering of C++, D is a distinct language, having redesigned some core C++ features while also taking inspiration from other languages, notably Java, Python, Ruby, C#, and Eiffel.
94	eC	Jerome Jacovella-St-Louis	Compiled	2004	eC (Ecere C) is an object-oriented programming language, defined as a super-set of the C language. The goals of the language are to provide object-oriented constructs, reflection, properties and dynamic modules on top of the C language while maintaining C compatibility and optimal native performance.
61	Groovy	James Strachan	Interpreted	2003	Apache Groovy is an object-oriented programming language for the Java platform. It is a dynamic language with features similar to those of Python, Ruby, Perl, and Smalltalk. It can be used as a scripting language for the Java Platform, is dynamically compiled to Java Virtual Machine (JVM) bytecode, and interoperates with other Java code and libraries. Groovy uses a Java-like curly-bracket syntax. Most Java code is also syntactically valid Groovy, although semantics may be different.
62	IDL	David Stern	Compiled	1977	IDL, short for Interactive Data Language, is a programming language used for data analysis. It is popular in particular areas of science, such as astronomy, atmospheric physics and medical imaging. IDL shares a common syntax with PV-Wave and originated from the same codebase, though the languages have subsequently diverged in detail.
63	Rust	Graydon Hoare	Compiled	2010	Rust is a general-purpose, multi-paradigm, compiled programming language sponsored by Mozilla Research. It is designed to be a safe, concurrent, practical language, supporting functional and imperative-procedural paradigms.
64	Objective-C++	Tom Love and Brad Cox	Compiled	1984	Objective-C is a general-purpose, object-oriented programming language that adds Smalltalk-style messaging to the C programming language. It was the main programming language used by Apple for the OS X and iOS operating systems, and their respective application programming interfaces (APIs) Cocoa and Cocoa Touch prior to the introduction of Swift.
65	Scala	Martin Odersky	Compiled	2004	Scala  is a general-purpose programming language. Scala has full support for functional programming and a strong static type system. Designed to be concise, many of Scala's design decisions were inspired by criticism of Java's shortcomings. Scala source code is intended to be compiled to Java bytecode, so that the resulting executable code runs on a Java virtual machine. Java libraries may be used directly in Scala code and vice versa.
66	Kotlin	JetBrains	Compiled	2011	Kotlin is a statically-typed programming language that runs on the Java Virtual Machine and also can be compiled to JavaScript source code. Its primary development is from a team of JetBrains programmers based in Saint Petersburg, Russia. While not syntax compatible with Java, Kotlin is designed to interoperate with Java code and is reliant on Java code from the existing Java Class Library, such as the collections framework.
67	Swift	Chris Lattner	Compiled	2014	Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. for iOS, macOS, watchOS, tvOS, and Linux. Swift is designed to work with Apple's Cocoa and Cocoa Touch frameworks and the large body of extant Objective-C (ObjC) code written for Apple products. Swift is intended to be more resilient to erroneous code (safer) than Objective-C, and more concise. It is built with the LLVM compiler framework included in Xcode 6 and later and, on platforms other than Linux, uses the Objective-C runtime library, which allows C, Objective-C, C++ and Swift code to run within one program.
69	TypeScript	Microsoft	Compiled	2012	TypeScript is a free and open source programming language developed and maintained by Microsoft. It is a strict superset of JavaScript, and adds optional static typing and class-based object-oriented programming to the language. Anders Hejlsberg, lead architect of C# and creator of Delphi and Turbo Pascal, has worked on the development of TypeScript. TypeScript may be used to develop JavaScript applications for client-side or server-side (Node.js) execution.
70	CoffeeScript	Jeremy Ashkenas	Compiled	2009	CoffeeScript is a programming language that transcompiles to JavaScript. It adds syntactic sugar inspired by Ruby, Python and Haskell in an effort to enhance JavaScript's brevity and readability. Specific additional features include list comprehension and pattern matching.
74	AppleScript	Apple Inc.	Compiled	1993	AppleScript is a scripting language created by Apple Inc. and built into the Classic Mac OS since System 7 and into all versions of macOS.
75	Scheme	Guy L. Steele, Gerald Jay Sussman	Interpreted	1970	Scheme is a functional programming language and one of the two main dialects of the programming language Lisp. Unlike Common Lisp, the other main dialect, Scheme follows a minimalist design philosophy specifying a small standard core with powerful tools for language extension.
78	Logo	Wally Feurzeig, Seymour Papert	Interpreted	1967	Logo is a multi-paradigm adaptation and dialect of Lisp, a functional programming language. Despite being a general-purpose language, Logo is often is known for its use of turtle graphics, in which commands for movement and drawing produced line graphics either on screen or with a small robot called a turtle. The language was originally conceived to teach concepts of programming related to Lisp and only later to enable what Papert called body-syntonic reasoning, where students could understand, predict and reason about the turtle's motion by imagining what they would do if they were the turtle.
80	Tcl	John Ousterhout	Interpreted	1988	Tcl (originally from Tool Command Language, but conventionally spelled Tcl,  pronounced as tickle or tee-see-ell) is a scripting language created by John Ousterhout. Originally born out of frustration, according to the author, with programmers devising their own languages intended to be embedded into applications, Tcl gained acceptance on its own. It is commonly used for rapid prototyping, scripted applications, GUIs, and testing. Tcl is used on embedded systems platforms, both in its full form and in several other small-footprint versions.
88	DIGITAL Command Language	Digital Equipment Corporation	Interpreted	1977	DIGITAL Command Language (DCL) is the standard command language adopted by most of the operating systems (OSs) that were sold by the former Digital Equipment Corporation (which was acquired by Compaq, which was in turn acquired by Hewlett-Packard). It had its roots in the IAS, TOPS-20, and RT-11 OSs and was implemented as a standard across most of Digital's OSs, notably RSX-11, but took its most powerful form in the OpenVMS OS.
89	PostScript	John Warnock,Chuck Geschke,Doug Brotz,Ed Taft,Bill Paxton	Interpreted	1982	PostScript (PS) is a computer language for creating vector graphics. It is a dynamically typed, concatenative programming language and was created at Adobe Systems. It is used as a page description language in the electronic publishing and desktop publishing.
93	Rebol	Carl Sassenrath	Interpreted	1997	Rebol is a cross-platform data exchange language and a multi-paradigm dynamic programming language designed by Carl Sassenrath for network communications and distributed computing. It introduces the concept of dialecting: small, optimized, domain-specific languages for code and data, which is also the most notable property of the language according to its designer. Although it can be used for programming, writing functions, and performing processes, its greatest strength is the ability to easily create domain-specific languages or dialects.
95	Forth	Charles H. Moore	Compiled	1970	Forth is an imperative stack-based computer programming language and environment originally designed by Charles Chuck Moore. Language features include structured programming, reflection (the ability to modify the program structure during program execution), concatenative programming (functions are composed with juxtaposition) and extensibility (the programmer can create new commands). Although not an acronym, the language's name is sometimes spelled with all capital letters as FORTH, following the customary usage during its earlier years.
99	Haxe	Haxe Foundation	Compiled	2005	Haxe is an open source, high-level, cross-platform, multi-paradigm programming language and compiler that can produce applications and source code for many different platforms from a single code-base. Haxe includes a set of common functionality that is supported across all platforms, such as numeric data types, text, arrays, binary and some common file formats.
102	FORTRAN	John Backus	Compiled	1957	Fortran (formerly FORTRAN, derived from Formula Translation) is a general-purpose, imperative programming language that is especially suited to numeric computation and scientific computing. Originally developed by IBM in the 1950s for scientific and engineering applications, Fortran came to dominate this area of programming early on and has been in continuous use for over half a century in computationally intensive areas such as numerical weather prediction, finite element analysis, computational fluid dynamics, computational physics, crystallography and computational chemistry.
103	Ada	Jean Ichbiah	Compiled	1980	Ada is a structured, statically typed, imperative, wide-spectrum, and object-oriented high-level computer programming language, extended from Pascal and other languages. It has built-in language support for design-by-contract, extremely strong typing, explicit concurrency, offering tasks, synchronous message passing, protected objects, and non-determinism. Ada improves code safety and maintainability by using the compiler to find errors in favor of runtime errors. Ada is an international standard; the current version (known as Ada 2012) is defined by ISO/IEC 8652:2012.
104	NewLisp	Lutz Mueller	Interpreted	1991	NewLISP is an open source scripting language in the Lisp family of programming languages developed by Lutz Mueller and released under the GNU General Public License.
105	Clojure	Rich Hickey	Compiled	2007	Clojure, or ClojureScript, is a dialect of the Lisp programming language created by Rich Hickey. Clojure is a general-purpose programming language with an emphasis on functional programming. It runs on the Java virtual machine, Common Language Runtime, and JavaScript engines. Like other Lisps, Clojure treats code as data and has a macro system.
106	Vala	Jurg Billeter, Raffaele Sandrini	Compiled	2006	Vala is an object-oriented programming language with a self-hosting compiler that generates C code and uses the GObject system. Vala is syntactically similar to C# and includes several features such as: anonymous functions, signals, properties, generics, assisted memory management, exception handling, type inference, and foreach statements.
109	M	Neil Pappalardo	Compiled	1966	MUMPS (Massachusetts General Hospital Utility Multi-Programming System), or alternatively M, is a general-purpose computer programming language that provides ACID (Atomic, Consistent, Isolated, and Durable) transaction processing. Its differentiating feature is its built-in database, enabling high-level access to disk storage using simple symbolic program variables and subscripted arrays, similar to the variables used by most languages to access main memory.
111	ActionScript	Gary Grossman	Compiled	1998	ActionScript is an object-oriented programming language originally developed by Macromedia Inc. (since merged into Adobe Systems). It is a derivation of HyperTalk, the scripting language for HyperCard. It is now a dialect of ECMAScript (meaning it is a superset of the syntax and semantics of the language more widely known as JavaScript), though it originally arose as a sibling, both being influenced by HyperTalk.
113	Racket	PLT Inc.	Compiled	1994	Racket (formerly PLT Scheme) is a general purpose, multi-paradigm programming language in the Lisp-Scheme family. One of its design goals is to serve as a platform for language creation, design, and implementation. The language is used in a variety of contexts such as scripting, general-purpose programming, computer science education, and research.
121	XQuery	W3C	Compiled	2007	XQuery (XML Query) is a query and functional programming language that queries and transforms collections of structured and unstructured data, usually in the form of XML, text and with vendor-specific extensions for other data formats (JSON, binary, etc.).
122	Elm	Evan Czaplicki	Compiled	2012	Elm is a domain-specific programming language for declaratively creating web browser-based graphical user interfaces. Elm is purely functional, and is developed with emphasis on usability, performance, and robustness. It advertises no runtime exceptions in practice, made possible by the Elm compiler's static type checking.
125	F#	Microsoft Research,Don Syme	Compiled	2005	F# (pronounced F sharp) is a strongly typed, multi-paradigm programming language that encompasses functional, imperative, and object-oriented programming techniques. F# is most often used as a cross-platform CLI language, but can also be used to generate JavaScript and GPU code.
127	Elixir	Jose Valim	Compiled	2012	Elixir is a functional, concurrent, general-purpose programming language that runs on the Erlang virtual machine (BEAM). Elixir builds on top of Erlang and shares the same abstractions for building distributed, fault-tolerant applications. Elixir also provides a productive tooling and an extensible design. The latter is supported by compile-time metaprogramming with macros and polymorphism via protocols.
134	ABAP	SAP SE	Interpreted	1983	ABAP (Advanced Business Application Programming, originally Allgemeiner Berichts-Aufbereitungs-Prozessor, German for general report creation processor) is a high-level programming language created by the German software company SAP SE. It is currently positioned, alongside Java, as the language for programming the SAP Application Server, which is part of the NetWeaver platform for building business applications.
136	VHDL	Peter J. Ashenden	Compiled	1987	VHDL (VHSIC Hardware Description Language) is a hardware description language used in electronic design automation to describe digital and mixed-signal systems such as field-programmable gate arrays and integrated circuits. VHDL can also be used as a general purpose parallel programming language.
137	Verilog	Prabhu Goel,Phil Moorby	Compiled	1984	Verilog, standardized as IEEE 1364, is a hardware description language (HDL) used to model electronic systems. It is most commonly used in the design and verification of digital circuits at the register-transfer level of abstraction. It is also used in the verification of analog circuits and mixed-signal circuits, as well as in the design of genetic circuits.
139	Eiffel	Bertrand Meyer	Compiled	1986	Eiffel is an object-oriented programming language designed by Bertrand Meyer (an object-orientation proponent and author of Object-Oriented Software Construction) and Eiffel Software. The design of the language is closely connected with the Eiffel programming method. Both are based on a set of principles, including design by contract, command-query separation, the uniform-access principle, the single-choice principle, the open-closed principle, and option-operand separation.
141	Io	Steve Dekorte	Interpreted	2002	Io is a pure object-oriented programming language inspired by Smalltalk, Self, Lua, Lisp, Act1, and NewtonScript. Io has a prototype-based object model similar to the ones in Self and NewtonScript, eliminating the distinction between instance and class. Like Smalltalk, everything is an object and it uses dynamic typing. Like Lisp, programs are just data trees. Io uses actors for concurrency.
143	COBOL	Howard Bromberg,Howard Discount,Vernon Reeves,Jean E. Sammet,William Selden,Gertrude Tierney	Compiled	1959	COBOL (an acronym for common business-oriented language) is a compiled English-like computer programming language designed for business use. It is imperative, procedural and, since 2002, object-oriented. COBOL is primarily used in business, finance, and administrative systems for companies and governments.
144	JSONiq	Jonathan Robie,Ghislain Fourny,Matthias Brantner,Daniela Florescu,Till Westmann,Markos Zaharioudakis	Compiled	2007	JSONiq is a query and functional programming language that is designed to declaratively query and transform collections of hierarchical and heterogeneous data in format of JSON, XML, as well as unstructured, textual data.
145	Julia	Jeff Bezanson,Stefan Karpinski,Viral B. Shah,Alan Edelman	Compiled	2012	Julia is a high-level dynamic programming language designed to address the requirements of high-performance numerical and scientific computing while also being effective for general-purpose programming, web use or as a specification language. Distinctive aspects of Julia's design include a type system with parametric types in a fully dynamic programming language and multiple dispatch as its core programming paradigm.
159	UrWeb	Adam Chlipala	Compiled	2014	Ur also called Ur/Web is a Free and Open source functional programming language specific for web development, created by Adam Chlipala at the Massachusetts Institute of Technology that from a single program produces server code, browser client code and SQL code specific for the chosen database backend.
162	Boo	Rodrigo B. De Oliveira	Interpreted	2003	Boo is an object-oriented, statically typed, general-purpose programming language that seeks to make use of the Common Language Infrastructure's support for Unicode, internationalization, and web applications, while using a Python-inspired syntax and a special focus on language and compiler extensibility. Some features of note include type inference, generators, multimethods, optional duck typing, macros, true closures, currying, and first-class functions.
\.


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('languages_id_seq', 1, false);


--
-- Data for Name: paradigms; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY paradigms (id, name) FROM stdin;
1	Imperative
2	Structured
3	Functional
4	Object-oriented
5	Generic
6	Concurrent
7	Reflective
8	Meta
9	Language Oriented Programming
10	Logic programming
11	Vector Oriented Programming
12	Modular
13	Declarative
14	Aspect Oriented Programming
15	Protocol Oriented Programming
\.


--
-- Name: paradigms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('paradigms_id_seq', 1, false);


--
-- Data for Name: paradigms_used; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY paradigms_used (language_id, paradigm_id) FROM stdin;
1	1
1	3
1	4
1	5
3	1
3	2
7	1
7	4
7	3
7	7
9	1
9	3
9	4
9	7
10	1
10	2
10	4
10	5
10	6
10	7
12	1
12	3
12	4
37	1
37	3
37	4
37	5
37	6
37	7
6	1
6	3
6	4
14	3
14	4
15	1
15	3
15	4
18	1
18	2
18	6
19	1
19	3
19	4
19	7
23	1
23	3
26	1
27	1
27	3
27	4
28	4
28	7
30	1
31	3
31	7
31	8
33	1
33	3
33	4
33	7
34	1
34	3
34	4
34	5
34	7
35	1
35	2
38	1
38	3
39	10
40	1
40	3
40	4
40	5
40	7
40	8
41	3
41	6
42	1
42	3
43	4
48	1
48	3
48	4
49	1
49	3
49	4
49	5
49	7
50	1
50	4
51	1
51	2
60	1
60	3
60	4
60	5
60	6
62	11
63	1
63	2
63	3
63	5
63	6
64	4
64	7
65	1
65	3
65	4
65	6
66	1
66	4
67	1
67	3
67	4
67	15
69	1
69	2
69	3
69	4
70	1
70	3
69	5
74	1
75	1
75	3
75	8
78	1
78	3
78	7
80	1
80	3
80	4
88	1
89	1
93	1
93	9
94	1
94	4
94	5
95	1
95	7
99	3
99	4
99	5
102	1
102	2
102	4
102	5
103	1
103	2
103	4
104	3
104	4
105	3
106	1
106	2
106	4
109	1
111	4
111	3
111	1
113	3
113	1
113	4
113	10
113	7
113	8
113	12
121	13
121	3
121	12
122	3
125	3
125	1
125	4
125	8
125	6
127	3
127	6
134	4
134	2
134	1
136	6
137	2
139	4
141	4
143	1
143	4
144	3
144	12
144	13
145	4
145	1
145	3
145	8
159	3
162	4
\.


--
-- Data for Name: project_participation; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY project_participation (contributor_id, project_id) FROM stdin;
1	1
17	2
263	31
269	31
271	31
277	31
281	31
283	31
289	32
293	32
307	32
311	32
313	32
317	33
331	34
281	34
337	35
281	35
347	35
349	35
353	36
359	36
367	36
373	36
379	36
383	37
353	37
367	37
389	37
397	37
401	38
409	38
289	38
419	38
421	38
431	39
433	39
439	39
443	39
449	39
457	40
461	40
463	40
467	40
479	40
809	61
811	61
821	61
823	61
827	61
829	61
839	62
853	62
857	63
859	63
863	63
859	65
877	65
809	65
881	65
883	65
887	65
887	66
907	70
929	77
937	77
941	77
947	79
953	79
967	80
379	80
971	82
977	82
983	82
991	82
997	83
997	84
1009	84
1013	85
1181	108
1187	108
1193	108
1201	108
1213	109
1217	109
1223	109
1229	109
1187	110
1231	110
1237	110
1249	110
1259	111
1187	111
1277	111
1279	111
1283	112
1289	112
1291	112
1297	112
1301	112
1303	112
1307	112
1319	113
1187	115
1321	115
1327	115
1607	137
1609	137
1613	137
1619	137
1621	137
1627	137
1637	138
1657	139
1663	139
1667	139
1669	139
1693	140
1697	140
1699	140
1709	141
1717	141
1721	141
1723	141
1613	142
1607	142
1609	142
1619	142
1733	143
1741	143
1747	143
1751	143
1753	143
1759	143
1777	146
1783	146
1787	146
1789	146
1921	167
1931	167
1933	167
1949	169
1951	169
1931	170
1921	170
1973	170
1979	170
1987	171
1993	171
1997	171
1999	171
2003	171
1931	172
2011	172
1931	173
2017	173
2027	173
2029	173
2039	174
2011	174
2053	174
2063	175
2069	175
2081	176
2083	176
2087	176
2089	176
2011	176
2267	197
2269	197
2273	197
2281	197
2287	197
2267	198
2293	198
2297	198
2309	199
2311	200
2267	200
2267	201
2329	201
2333	201
2339	201
2341	201
2347	201
2351	202
2357	202
2363	202
2371	203
269	203
2377	203
2269	204
2267	204
2273	204
2381	204
2383	204
2281	204
2389	204
2393	204
2399	205
2521	221
2531	221
2533	221
2539	223
2521	223
223	223
2543	223
2549	223
2551	223
2557	223
2521	225
2539	225
1871	225
2549	225
2567	225
2539	226
2521	226
2549	226
2551	226
223	226
2579	226
2557	226
2521	229
2591	229
2593	229
2707	250
2711	250
2713	250
2719	250
2729	250
2731	250
2741	251
2749	251
2753	252
2767	252
2771	252
2777	252
2707	253
2789	253
2791	253
2741	253
2797	254
2801	254
2803	254
2819	258
1231	281
3037	281
3041	282
457	282
3043	284
3041	285
457	285
3049	285
3061	286
3067	286
3077	286
3079	287
3083	288
3203	310
3209	310
3217	315
3221	315
3229	315
3079	315
3061	316
3061	318
3247	318
3061	319
3251	319
3067	319
3253	319
1259	340
1279	340
1187	340
3383	340
1187	341
1187	345
3389	349
3433	371
3433	373
3449	373
3457	374
3461	374
3463	374
3467	374
3469	374
2351	374
3491	375
3433	376
3461	378
3433	378
3499	378
3643	400
3659	401
3671	403
3673	403
3643	407
3677	407
3659	409
3847	435
3851	435
3853	435
3859	435
3863	435
3877	438
3881	438
4079	460
4091	460
4093	460
4097	461
4099	461
4111	461
4127	462
4129	462
4133	462
4139	462
4127	463
4153	463
4157	463
4159	463
4177	464
4201	465
4127	465
1481	465
4211	465
4091	466
4217	467
4219	467
4229	467
4231	467
4241	467
4243	467
4253	469
2251	469
4259	469
4481	490
4483	490
4493	491
4507	491
4513	491
4517	492
4519	492
4523	492
4547	494
4549	494
4561	494
4567	495
4481	497
4573	497
4583	497
4481	499
4777	520
4783	520
4787	520
4789	520
4793	520
4799	522
4801	522
4811	522
4813	522
4777	524
4817	525
4817	528
4817	529
4831	531
4817	532
4861	532
4871	532
4817	533
4877	533
4889	533
5011	555
2657	556
5011	556
5051	556
5059	556
5011	557
2657	557
5077	557
5081	557
5087	558
2311	558
5099	558
5101	558
5107	558
5113	558
2657	559
5119	559
5147	560
5011	560
5153	560
5081	561
5167	561
5171	561
5011	561
2011	561
5179	561
2699	561
2657	562
5011	563
2657	563
5051	563
5189	563
5059	563
5051	564
5011	564
5197	564
5209	564
281	585
5407	586
5413	586
5417	586
5419	586
5431	586
281	587
281	588
937	589
5437	589
281	589
5441	589
5443	589
281	590
281	591
281	592
5449	592
281	593
281	594
5581	615
5591	615
5623	616
5627	616
5639	617
4703	617
5641	617
5647	617
5651	617
5653	618
5657	618
5659	618
5591	618
5669	619
5683	620
5689	620
5693	621
5701	621
5591	621
5581	621
5711	622
5591	622
5717	622
5729	623
5737	623
5741	624
5743	624
5749	624
2111	645
2111	646
2111	647
2111	648
2111	649
5933	650
2111	650
5939	650
2657	650
5953	650
2111	651
2111	652
5939	652
5933	652
2657	652
2111	653
5933	654
2111	654
2699	654
5981	654
6053	677
6067	683
6073	684
6133	705
6143	705
6151	705
6163	706
6173	707
6163	707
6197	708
6199	708
6203	708
3851	708
6211	709
6217	709
6221	709
6229	709
6239	714
6247	714
6257	714
6329	735
6337	735
6341	735
6343	735
6329	736
6343	736
6353	737
4723	738
6329	739
6359	739
6361	739
4723	740
6329	740
821	740
6367	740
6373	740
6379	741
6343	743
6389	743
6341	743
6521	766
6521	767
6529	767
6547	767
6551	768
6521	771
6529	771
6553	771
6547	771
6563	771
6569	772
6571	773
6577	773
6521	774
6569	774
6581	774
6599	774
6733	795
6737	795
2141	795
6749	795
6733	796
6733	798
6737	798
2141	798
6761	798
6763	798
6733	799
3469	799
4127	799
2329	800
6779	801
6781	801
6791	803
6793	804
569	804
6803	804
2351	804
6961	825
6967	825
6971	826
6977	826
6983	826
6991	826
6971	827
6997	827
7001	827
6971	828
7013	828
7019	828
6971	829
6971	830
6971	831
6971	832
7013	833
6971	833
7027	833
7039	833
6971	834
4127	859
6833	860
7151	860
7157	861
4127	861
7159	861
7211	885
7213	886
271	886
7219	886
7229	886
7237	887
7243	887
7247	888
7253	888
7211	890
7229	891
7283	891
7211	892
271	893
7211	893
7297	894
7211	894
7351	915
7361	915
4073	915
7369	915
7361	916
4063	916
7393	917
7361	917
7411	917
7393	918
7417	918
7433	919
7451	921
7457	921
7459	923
7351	923
7463	923
7361	923
7477	924
7481	924
7487	924
911	924
7489	924
7673	945
1931	945
7681	945
7673	946
7687	946
7691	946
7699	946
7703	946
7673	947
7717	947
7673	948
2567	948
2131	948
7673	949
7723	949
4201	949
7727	949
7673	951
7741	951
2011	951
2363	951
7673	952
7753	952
7757	952
7673	953
7759	953
2011	953
7769	953
569	953
7673	954
7789	954
5657	975
7993	975
8009	977
7993	977
8011	977
8017	977
7993	978
8039	979
7993	979
8053	979
8059	980
8069	980
8081	981
8087	981
8089	981
8093	981
8101	981
8081	982
8111	982
8117	982
8123	982
8143	984
8147	984
8347	1002
2017	1003
2027	1003
2029	1003
1831	1003
8353	1003
7759	1032
8387	1032
8389	1035
8431	1062
8443	1062
8447	1062
853	1063
8461	1063
8467	1063
853	1064
8483	1064
853	1065
8501	1066
8513	1067
8521	1067
8527	1071
8563	1088
8573	1088
8581	1088
2141	1088
8597	1089
8599	1089
8609	1090
8623	1090
4451	1090
8627	1094
8629	1094
7559	1094
8641	1094
6793	1094
8647	1094
8627	1095
8653	1095
8663	1095
8669	1095
6857	1096
8677	1096
8681	1096
8689	1097
8693	1097
1367	1097
8699	1097
8707	1098
8713	1098
8719	1098
8731	1099
8737	1099
4007	1099
8741	1099
8747	1099
8753	1099
8761	1100
8693	1101
3253	1101
8779	1101
8783	1102
6857	1102
9029	1123
9041	1123
9043	1123
9049	1123
9059	1124
9067	1124
4127	1125
9091	1125
3587	1125
3587	1126
6917	1126
4127	1126
9103	1126
4159	1126
9109	1126
6151	1127
9029	1127
9127	1127
9133	1127
9137	1128
7673	1128
9029	1128
9151	1128
9157	1129
9029	1129
9137	1130
9161	1130
9173	1130
9181	1130
9029	1131
9187	1132
3469	1132
9221	1134
9227	1134
9239	1134
9241	1134
9257	1137
9277	1138
9281	1138
9257	1138
9283	1138
9293	1140
9221	1140
9299	1140
9293	1141
9311	1141
9491	1164
9497	1164
9511	1165
9521	1165
9221	1167
9533	1167
9539	1167
9547	1167
9551	1168
2089	1168
9571	1170
9587	1170
2011	1186
2399	1186
9613	1186
2521	1186
9619	1186
2011	1187
2399	1187
379	1187
9623	1187
9629	1187
9613	1187
9631	1187
379	1188
2011	1188
2521	1188
5281	1188
9613	1188
9643	1188
379	1189
6043	1189
9649	1190
379	1190
379	1191
9661	1191
7829	1191
2567	1191
2011	1192
379	1192
2521	1192
751	1192
9673	1192
5389	1192
9677	1192
9679	1192
6043	1192
379	1193
2011	1193
9689	1193
2011	1194
2521	1194
379	1194
9697	1194
5281	1194
9613	1194
2011	1195
379	1195
9689	1195
9613	1195
2941	1216
9839	1216
9851	1216
2941	1217
9857	1218
9859	1219
4099	1219
2941	1220
9871	1221
9883	1223
9887	1223
9901	1226
9907	1253
9923	1254
9929	1254
9931	1254
9941	1254
9949	1255
9967	1259
1187	1285
10061	1287
10133	1313
10139	1319
10141	1319
10151	1322
10159	1322
10163	1322
10289	1343
9689	1343
10301	1344
10303	1344
10313	1345
10319	1345
10321	1345
3313	1346
10331	1346
10313	1347
10333	1347
10337	1348
10343	1348
5059	1348
10357	1352
593	1373
10487	1373
10489	1373
881	1373
10499	1375
10501	1375
1367	1376
1187	1376
10499	1378
10513	1379
10523	1381
4133	1404
3643	1404
10687	1404
10691	1404
4133	1405
4133	1407
10709	1407
10711	1407
4133	1408
10723	1410
4133	1411
10727	1411
10729	1411
10733	1411
4133	1412
10739	1412
10799	1433
10807	1433
1187	1434
10799	1434
1381	1434
10831	1435
10837	1435
10847	1437
10853	1437
10859	1437
10861	1438
1153	1438
2273	1438
10867	1438
11087	1463
11093	1463
11101	1463
11113	1463
11117	1464
11119	1464
11131	1464
11093	1465
11149	1465
11087	1465
11159	1465
11161	1465
11093	1467
11087	1467
11149	1467
11171	1467
11173	1467
11119	1468
11177	1468
11131	1468
11197	1469
11203	1470
11131	1470
11213	1470
11093	1471
11087	1471
11383	1493
11393	1493
11399	1494
11411	1499
11413	1499
11423	1499
11437	1500
11411	1500
11441	1500
11423	1500
1709	1500
11443	1500
11447	1500
11449	1501
11413	1501
11411	1502
11413	1503
11411	1504
11413	1504
11411	1505
11467	1505
11447	1505
11423	1505
11413	1505
11471	1505
1709	1505
11483	1506
11489	1506
11491	1506
9733	1518
11579	1518
9733	1519
11587	1519
11593	1519
11597	1519
9733	1520
9733	1521
9733	1522
11611	1522
11617	1522
11621	1522
9733	1523
11593	1523
11633	1523
9733	1525
9733	1526
11639	1526
4127	1527
9733	1527
11657	1527
6361	1527
11663	1527
11731	1548
11743	1548
11747	1548
3767	1549
3041	1549
11731	1550
11777	1550
11779	1550
11783	1551
11783	1552
11789	1554
1549	1554
11743	1555
11777	1556
11801	1556
11783	1557
11731	1557
11807	1557
11887	1580
11897	1580
11903	1580
11909	1580
11917	1581
11923	1581
11927	1581
11933	1581
11939	1583
11941	1583
11939	1585
11941	1585
9109	1586
11941	1587
11939	1587
11953	1587
11959	1587
11969	1587
12037	1608
12041	1608
12043	1608
12049	1608
12037	1609
12053	1609
12049	1609
12043	1610
12041	1610
12043	1611
12071	1613
12043	1613
12073	1615
12043	1616
12041	1617
12043	1617
12143	1638
12149	1638
3079	1638
12157	1639
12161	1639
12163	1639
2141	1639
12197	1641
12203	1642
12197	1642
2141	1643
12163	1643
12211	1643
2141	1644
12239	1669
12241	1669
12251	1670
12253	1670
9707	1671
2477	1671
7019	1671
12263	1671
12269	1678
4219	1678
12277	1678
6511	1678
12281	1678
2389	1678
12269	1679
12289	1679
12277	1679
12301	1680
12317	1681
12323	1681
12329	1681
7993	1681
12277	1682
12269	1682
6511	1684
12343	1684
12347	1686
12373	1707
12377	1707
12379	1707
12391	1708
12401	1710
9767	1710
12409	1710
12413	1710
12433	1728
5987	1728
12437	1728
12451	1730
12457	1730
12433	1730
12461	1730
12433	1732
12437	1732
12473	1732
12479	1732
12487	1733
12491	1733
12497	1733
3251	1733
12503	1734
12433	1735
12437	1735
2141	1735
12511	1735
5711	1735
12517	1735
12433	1736
12511	1736
12437	1736
12539	1758
12541	1758
12547	1758
12553	1758
12563	1758
12539	1759
12569	1759
12563	1759
12569	1760
12577	1760
12583	1760
12589	1760
12577	1762
12569	1762
12539	1762
12547	1762
12569	1764
12601	1764
12541	1764
12577	1764
12539	1764
12589	1764
12569	1765
12583	1765
9157	1765
9157	1766
12569	1767
12577	1767
12611	1767
12739	1788
12743	1788
12757	1789
12763	1789
12767	1789
12769	1789
12767	1790
12781	1790
12739	1790
12791	1790
12799	1792
12743	1792
12739	1792
12739	1793
12799	1793
12743	1793
12809	1793
12799	1794
12743	1794
12739	1794
12757	1794
12757	1795
12799	1795
12743	1795
12821	1796
12743	1796
12799	1796
12823	1796
12739	1796
12739	1797
12769	1797
12827	1797
12829	1797
5231	1818
2221	1819
12937	1819
12941	1819
2141	1819
2671	1820
12937	1820
2221	1820
12953	1820
12959	1821
12937	1821
2141	1821
2671	1821
12941	1821
12967	1821
2221	1822
2221	1823
157	1823
12973	1823
2221	1824
2221	1825
2221	1826
2221	1827
12979	1827
9689	1827
157	1827
13043	1848
13049	1848
13063	1848
4451	1848
13073	1849
13081	1849
13093	1849
13073	1850
13081	1850
13099	1850
13103	1850
13049	1851
13043	1851
13109	1851
13121	1851
13127	1851
13141	1852
13147	1852
13151	1852
13081	1852
13159	1852
13073	1853
13081	1853
13163	1853
13171	1853
13109	1853
13163	1854
13177	1855
13183	1855
13163	1855
13187	1855
13043	1856
13217	1856
13219	1856
13049	1857
13043	1857
13229	1857
13411	1878
13417	1878
13421	1878
13441	1879
13451	1879
12703	1879
13457	1880
13463	1881
13469	1882
13477	1883
13487	1883
13493	1884
6047	1884
13499	1885
13513	1885
12703	1887
13523	1887
13679	1908
13681	1908
13687	1908
13691	1908
13693	1908
13697	1908
13709	1909
13711	1909
13721	1909
13723	1909
13729	1909
13751	1912
13753	1912
13757	1912
13759	1912
13763	1912
13709	1912
13781	1914
13787	1914
13789	1914
13751	1915
13799	1915
13877	1936
13879	1936
13883	1936
13879	1937
13877	1938
13879	1938
13879	1939
13877	1941
13901	1941
13883	1943
13877	1943
13883	1944
13903	1944
13877	1944
3079	1966
7723	1966
3079	1967
7723	1968
14009	1968
14011	1968
14017	1968
7723	1969
14009	1969
14029	1969
14033	1969
14011	1969
14039	1969
7723	1970
14011	1970
14051	1970
14057	1970
14059	1970
7723	1973
7723	1974
7723	1975
14081	1983
14083	1983
14087	1983
2533	1983
14093	1983
14107	1986
8971	1986
14111	1986
3469	1989
14143	1989
14149	1989
14153	1990
14159	1990
14173	1991
3203	1991
14177	1991
14197	1994
14207	1995
14279	2017
14281	2017
14293	2017
14303	2017
3961	2019
14279	2023
14317	2023
14321	2025
14323	2025
14327	2025
14341	2026
14347	2026
14479	2049
5779	2055
3511	2077
3517	2077
3539	2077
3533	2077
14533	2077
3511	2078
3517	2078
14537	2078
14543	2078
3511	2079
3517	2079
3511	2080
3517	2080
14533	2080
14549	2080
14551	2080
3511	2081
3517	2081
14557	2081
10861	2082
14561	2082
14563	2082
14569	2082
1187	2082
3511	2083
3517	2083
3533	2083
11933	2083
14551	2083
3511	2084
3539	2084
3533	2084
3511	2085
3511	2086
3539	2086
3533	2086
2591	2114
14713	2114
14717	2114
14723	2114
2591	2115
14731	2115
14897	2137
3187	2137
6133	2137
14909	2137
3187	2138
14897	2138
14923	2138
14929	2138
14933	2138
6133	2138
14939	2138
14897	2139
14947	2139
7547	2139
8941	2139
14951	2139
14957	2139
14969	2140
3187	2140
14977	2140
14983	2140
3587	2141
12703	2141
131	2143
15011	2143
15013	2143
15017	2143
13499	2144
131	2144
9197	2144
15031	2144
14897	2145
14939	2145
3187	2145
8941	2145
14897	2146
15049	2146
3187	2146
15053	2146
15061	2146
15263	2168
15269	2169
15271	2170
15271	2171
15271	2172
15269	2172
15269	2173
15269	2174
15269	2175
2971	2197
15307	2197
15313	2197
2971	2198
15319	2198
7687	2198
7673	2198
15313	2198
7547	2198
2971	2199
15319	2199
15329	2199
15331	2199
2971	2200
9103	2200
2971	2201
15319	2201
15347	2201
15349	2201
751	2201
15359	2201
15377	2202
10861	2202
1223	2202
15383	2202
15391	2202
15377	2204
1223	2205
15377	2205
15391	2206
15401	2206
10861	2206
15377	2206
15413	2206
10861	2207
15383	2207
15383	2208
10499	2210
15383	2211
379	2232
2879	2232
2549	2232
2887	2232
2131	2232
15541	2234
15551	2234
15553	2234
15559	2234
379	2237
379	2240
379	2241
15581	2247
15583	2247
15601	2247
15581	2248
15607	2248
3947	2248
15583	2248
15581	2250
15581	2251
15619	2252
15581	2252
15581	2253
15581	2254
15581	2255
15581	2256
15641	2272
15643	2272
15647	2272
15649	2272
15661	2272
15667	2272
15641	2273
15671	2273
15643	2273
15679	2273
15683	2273
5843	2273
15641	2274
8941	2274
1213	2274
15707	2274
15641	2275
15641	2276
15643	2276
15641	2277
15643	2277
15647	2277
15641	2278
15643	2278
15647	2278
15641	2279
15647	2279
2237	2279
4721	2279
15101	2279
15737	2289
15739	2289
15749	2289
15761	2290
15767	2291
7673	2291
2879	2291
15773	2291
15787	2293
15791	2293
15793	2293
15797	2293
15803	2294
15809	2295
15817	2295
15823	2297
15767	2297
9739	2318
15913	2318
15919	2318
15923	2318
5309	2318
15929	2319
6967	2319
4783	2320
9739	2320
2131	2320
15937	2320
15943	2320
9739	2322
2131	2323
4649	2323
15959	2323
9151	2323
12143	2324
15929	2324
15971	2324
2131	2324
15973	2324
2441	2325
4507	2353
16171	2378
16171	2379
16171	2380
16171	2381
16183	2381
16187	2381
16189	2381
16171	2382
16193	2382
16201	2382
16217	2383
16223	2383
16171	2383
16229	2383
16231	2383
16171	2384
16171	2385
16193	2385
16241	2385
15137	2385
16249	2385
16253	2385
16171	2386
16171	2387
11593	2408
9733	2408
16361	2408
16363	2408
16369	2408
16381	2409
9733	2409
9733	2410
16411	2410
16417	2410
9733	2411
16421	2411
9733	2412
16427	2412
16433	2413
16361	2414
7829	2414
16439	2415
16447	2417
16451	2417
16453	2417
739	2417
2039	2417
16477	2424
4451	2424
16481	2424
16487	2425
8117	2425
16493	2425
16507	2426
16519	2426
4787	2426
16529	2426
16493	2428
16547	2428
16553	2429
16561	2429
16567	2430
1637	2430
16573	2430
5791	2433
16603	2433
8093	2433
16729	2454
16741	2454
16747	2454
16759	2455
16763	2455
16787	2456
16789	2456
16729	2456
16799	2456
16811	2458
16879	2484
16883	2485
16889	2485
16901	2485
16903	2485
16921	2486
16927	2488
16931	2488
16937	2488
16943	2490
16949	2490
16937	2491
16921	2491
16963	2491
16931	2491
16921	2492
16979	2492
16981	2492
16987	2492
16949	2493
16993	2493
17107	2516
17113	2519
17117	2519
17183	2545
4127	2547
17189	2547
17191	2547
17201	2547
17203	2548
8941	2548
17207	2548
17209	2548
17221	2549
4243	2551
17231	2551
4127	2552
17239	2552
6997	2552
15439	2562
1223	2562
17291	2562
15419	2562
17293	2562
15439	2563
15451	2563
17299	2563
15439	2564
15391	2564
17317	2564
17321	2564
15439	2565
15419	2566
17323	2566
15419	2567
15383	2567
15401	2567
17327	2567
17333	2568
17341	2568
17351	2568
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY projects (id, name, url, "createdDate", private, owner_id, description) FROM stdin;
1	upb	https://github.com/google/upb	2009-05-09 02:38:42	f	1	small, fast parsers for the 21st century
2	truth	https://github.com/google/truth	2011-06-22 18:55:12	f	1	Assertion/Proposition framework for Java unit tests
35	open-graph-protocol	https://github.com/facebook/open-graph-protocol	2010-04-20 08:52:25	f	2	\N
31	codemod	https://github.com/facebook/codemod	2009-04-02 04:51:54	f	2	Codemod is a tool/library to assist you with large-scale codebase refactors that can be partially automated but still require human oversight and occasional intervention. Codemod was developed at Facebook and released as open source.
32	hhvm	https://github.com/facebook/hhvm	2010-01-02 01:17:06	f	2	A virtual machine designed for executing programs written in Hack and PHP. 
33	xhp-lib	https://github.com/facebook/xhp-lib	2010-01-07 20:20:02	f	2	Class libraries for XHP. XHP is a Hack feature that augments the syntax of the language such that XML document fragments become valid PHP expressions.
34	pyre2	https://github.com/facebook/pyre2	2010-03-16 18:45:15	f	2	Python wrapper for RE2
36	facebook-android-sdk	https://github.com/facebook/facebook-android-sdk	2010-05-10 17:17:33	f	2	Used to integrate Android apps with Facebook Platform.
37	facebook-ios-sdk	https://github.com/facebook/facebook-ios-sdk	2010-06-24 22:11:03	f	2	Used to integrate iOS apps with Facebook Platform.
38	pfff	https://github.com/facebook/pfff	2010-09-23 05:13:55	f	2	Tools for code analysis, visualizations, or style-preserving source transformation.
39	php-webdriver	https://github.com/facebook/php-webdriver	2011-08-26 05:33:38	f	2	A php client for webdriver.
40	SocketRocket	https://github.com/facebook/SocketRocket	2012-01-30 00:21:34	f	2	A conforming Objective-C WebSocket client library.
61	bootstrap	https://github.com/twbs/bootstrap	2011-07-29 21:19:00	f	3	The most popular HTML, CSS, and JavaScript framework for developing responsive, mobile first projects on the web.
62	bootstrap-sass	https://github.com/twbs/bootstrap-sass	2011-09-06 18:58:49	f	3	Official Sass port of Bootstrap 2 and 3.
63	bootstrap-blog	https://github.com/twbs/bootstrap-blog	2012-03-22 05:38:07	f	3	Official blog for Bootstrap.
65	ratchet	https://github.com/twbs/ratchet	2012-08-17 05:41:57	f	3	Build mobile apps with simple HTML, CSS, and JavaScript components. 
66	bootstrap-expo	https://github.com/twbs/bootstrap-expo	2013-03-04 00:33:43	f	3	Beautiful and inspiring uses of Bootstrap.
70	grunt-bootlint	https://github.com/twbs/grunt-bootlint	2014-07-26 07:14:06	f	3	A Grunt wrapper for Bootlint, the HTML linter for Bootstrap projects
77	hadoop-lzo	https://github.com/twitter/hadoop-lzo	2009-09-21 03:19:24	f	4	Refactored version of code.google.com/hadoop-gpl-compression for hadoop 0.20
79	thrift_client	https://github.com/twitter/thrift_client	2009-10-02 01:00:57	f	4	A Thrift client wrapper that encapsulates some common failover behavior
80	twurl	https://github.com/twitter/twurl	2009-10-18 05:48:53	f	4	OAuth-enabled curl for the Twitter API
82	elephant-bird	https://github.com/twitter/elephant-bird	2010-03-25 01:49:40	f	4	Twitter's collection of LZO and Protocol Buffer-related Hadoop, Pig, Hive, and HBase code.
83	gizzard	https://github.com/twitter/gizzard	2010-04-06 21:13:26	f	4	A flexible sharding framework for creating eventually-consistent distributed datastores
84	flockdb	https://github.com/twitter/flockdb	2010-04-12 03:53:45	f	4	A distributed, fault-tolerant graph database
85	flockdb-client	https://github.com/twitter/flockdb-client	2010-04-13 17:58:42	f	4	A Ruby client library for FlockDB
108	markup	https://github.com/github/markup	2009-10-31 01:02:46	f	5	The code we use to render README.your_favorite_markup
109	hub	https://github.com/github/hub	2009-12-05 22:15:25	f	5	hub helps you win at git.
110	github-services	https://github.com/github/github-services	2010-05-14 20:07:36	f	5	Official GitHub Services Integration - You can set these up in your repository settings screen under Service Hooks
111	rails	https://github.com/github/rails	2010-10-16 00:01:48	f	5	Ruby on Rails + GitHub patches
112	gitignore	https://github.com/github/gitignore	2010-11-08 20:17:14	f	5	A collection of useful .gitignore templates
113	dmca	https://github.com/github/dmca	2011-01-28 23:58:38	f	5	Repository with text of DMCA takedown notices as received. GitHub does not endorse or adopt any assertion contained in the following notices. Users identified in the notices are presumed innocent until proven guilty. Additional information about our DMCA policy can be found at 
115	email_reply_parser	https://github.com/github/email_reply_parser	2011-02-23 02:13:11	f	5	Small library to parse plain text email content
137	zamboni	https://github.com/mozilla/zamboni	2009-10-23 19:35:34	f	6	Backend for the Firefox Marketplace
138	tuxedo	https://github.com/mozilla/tuxedo	2009-12-16 15:59:45	f	6	An improved version of Mozilla's download load balancer Bouncer, with a user interface written in Django/Python.
139	kitsune	https://github.com/mozilla/kitsune	2010-01-26 18:53:57	f	6	Platform for Mozilla Support (Unmainted)
140	mozregression	https://github.com/mozilla/mozregression	2010-02-11 05:49:14	f	6	Regression range finder for Mozilla nightly builds
141	bleach	https://github.com/mozilla/bleach	2010-02-19 01:12:41	f	6	An easy, HTML5, whitelisting HTML sanitizer.
142	zamboni-lib	https://github.com/mozilla/zamboni-lib	2010-05-19 21:27:03	f	6	All the pure Python dependencies for zamboni
143	popcorn-js	https://github.com/mozilla/popcorn-js	2010-05-21 17:40:35	f	6	The HTML5 Media Framework
146	mozmill	https://github.com/mozilla/mozmill	2010-06-24 22:14:43	f	6	DEPRECATED project - Check the Marionette framework instead
167	sizzle	https://github.com/jquery/sizzle	2008-08-24 20:38:54	f	7	A sizzlin' hot selector engine.
169	testswarm	https://github.com/jquery/testswarm	2009-02-03 22:17:23	f	7	Distributed continuous integration testing for JavaScript.
170	jquery	https://github.com/jquery/jquery	2009-04-03 15:20:14	f	7	jQuery JavaScript Library
171	qunit	https://github.com/jquery/qunit	2009-07-24 16:26:23	f	7	An easy-to-use JavaScript Unit Testing framework.
172	jquery-color	https://github.com/jquery/jquery-color	2009-07-25 16:10:40	f	7	jQuery plugin for color manipulation and animation support.
173	jquery-ui	https://github.com/jquery/jquery-ui	2010-01-19 14:40:34	f	7	The official jQuery user interface library.
174	jquery-mobile	https://github.com/jquery/jquery-mobile	2010-09-13 15:02:22	f	7	jQuery Mobile Framework
175	globalize	https://github.com/jquery/globalize	2010-09-28 23:01:58	f	7	A JavaScript library for internationalization and localization that leverages the official Unicode CLDR JSON data
176	learn.jquery.com	https://github.com/jquery/learn.jquery.com	2010-11-09 12:46:56	f	7	jQuery Learning Center web site content
197	html5-boilerplate	https://github.com/h5bp/html5-boilerplate	2010-01-24 18:03:24	f	8	A professional front-end template for building fast, robust, and adaptable web apps or sites.
198	html5boilerplate.com	https://github.com/h5bp/html5boilerplate.com	2010-03-29 06:22:51	f	8	Files for the HTML5 Boilerplate website.
199	lazyweb-requests	https://github.com/h5bp/lazyweb-requests	2010-10-21 23:29:08	f	8	Get projects and ideas built by the community
200	server-configs	https://github.com/h5bp/server-configs	2010-12-15 05:11:25	f	8	Boilerplate configurations for various web servers.
201	mobile-boilerplate	https://github.com/h5bp/mobile-boilerplate	2010-12-15 14:54:15	f	8	DEPRECATED - A front-end template that helps you build fast, modern mobile web apps.
202	html5please	https://github.com/h5bp/html5please	2011-07-09 18:32:29	f	8	Graded Feature Support: Look up web technologies and find out if they are ready for use.
203	movethewebforward	https://github.com/h5bp/movethewebforward	2011-11-17 15:27:22	f	8	You ♡ the Web Platform. You maybe even feel compelled to “give back” to the community. We’re here to help you get started.
204	ant-build-script	https://github.com/h5bp/ant-build-script	2012-01-30 23:33:17	f	8	Ant build script intended for use with HTML5 Boilerplate.
205	h5bp.github.io	https://github.com/h5bp/h5bp.github.io	2012-01-31 02:10:19	f	8	A website for the H5BP organization. Browse all the H5BP projects in one place.
221	angular.js	https://github.com/angular/angular.js	2010-01-06 00:34:37	f	9	HTML enhanced for web apps
223	angular-seed	https://github.com/angular/angular-seed	2010-12-24 06:07:50	f	9	Seed project for angular apps. 
225	angularjs.org	https://github.com/angular/angularjs.org	2011-02-08 21:08:44	f	9	code for angularjs.org site
226	angular-phonecat	https://github.com/angular/angular-phonecat	2011-03-07 21:42:29	f	9	Tutorial on building an angular application.
229	builtwith.angularjs.org	https://github.com/angular/builtwith.angularjs.org	2012-05-16 22:49:17	f	9	builtwith.angularjs.org
250	vue	https://github.com/vuejs/vue	2013-07-29 03:24:51	f	10	Simple yet powerful library for building modern web interfaces.
251	vue-router	https://github.com/vuejs/vue-router	2013-12-11 19:37:46	f	10	The official router for Vue.js.
252	vue-validator	https://github.com/vuejs/vue-validator	2013-12-11 19:39:54	f	10	Validator component for Vue.js :white_check_mark:
253	vuejs.org	https://github.com/vuejs/vuejs.org	2014-01-05 03:11:14	f	10	The website.
254	vue-resource	https://github.com/vuejs/vue-resource	2014-02-07 23:07:56	f	10	The HTTP client for Vue.js
258	vue-devtools	https://github.com/vuejs/vue-devtools	2014-09-29 03:52:07	f	10	Chrome devtools extension for debugging Vue.js applications.
281	eycap	https://github.com/square/eycap	2009-06-21 15:03:48	f	11	Engine Yard specific capistrano recipes
282	yajl-objc	https://github.com/square/yajl-objc	2009-08-11 01:04:56	f	11	Objective-C bindings for YAJL (Yet Another JSON Library) C library
284	simplerrd	https://github.com/square/simplerrd	2009-09-06 04:38:25	f	11	SimpleRRD provides a simple Ruby interface for creating graphs with RRD
285	gh-unit	https://github.com/square/gh-unit	2009-09-22 18:13:54	f	11	Test Framework for Objective-C
286	hoptoad_notifier	https://github.com/square/hoptoad_notifier	2009-10-22 18:24:59	f	11	Reports exceptions to Hoptoad
287	more	https://github.com/square/more	2009-10-27 04:28:55	f	11	less on rails — the official LESS plugin for Ruby on Rails
288	plastic	https://github.com/square/plastic	2009-10-30 23:49:06	f	11	Credit card (“plastic”) library for Ruby
310	paperclip	https://github.com/thoughtbot/paperclip	2008-04-10 19:58:20	f	12	Easy file attachment management for ActiveRecord
315	shoulda	https://github.com/thoughtbot/shoulda	2008-04-14 13:27:26	f	12	Makes tests easy on the fingers and the eyes
316	jester	https://github.com/thoughtbot/jester	2008-04-14 14:09:22	f	12	REST in Javascript
318	factory_girl	https://github.com/thoughtbot/factory_girl	2008-06-03 13:55:37	f	12	A library for setting up Ruby objects as test data.
319	hoptoad_notifier	https://github.com/thoughtbot/hoptoad_notifier	2008-07-23 18:11:17	f	12	Reports exceptions to Hoptoad
340	rails	https://github.com/rails/rails	2008-04-11 02:19:47	f	13	Ruby on Rails
341	account_location	https://github.com/rails/account_location	2008-05-29 20:14:45	f	13	NOTICE: official repository moved to https://github.com/bbommarito/account_location
345	atom_feed_helper	https://github.com/rails/atom_feed_helper	2008-05-29 20:26:39	f	13	NOTICE: official repository moved to https://github.com/TrevorBramble/atom_feed_helper
349	exception_notification	https://github.com/rails/exception_notification	2008-05-29 20:32:17	f	13	NOTICE: official repository moved to https://github.com/smartinez87/exception_notification
371	illumos-extra	https://github.com/joyent/illumos-extra	2010-12-03 17:55:57	f	14	Extra non-ON software required for Illumos
373	illumos-joyent	https://github.com/joyent/illumos-joyent	2011-04-07 20:50:31	f	14	Community developed and maintained version of the OS/Net consolidation
374	node-http-signature	https://github.com/joyent/node-http-signature	2011-07-14 17:58:00	f	14	Reference implementation of Joyent's HTTP Signature Scheme
375	node-smartdc	https://github.com/joyent/node-smartdc	2011-07-15 15:26:23	f	14	Client SDK and CLI for the Joyent SmartDataCenter API
376	illumos-kvm	https://github.com/joyent/illumos-kvm	2011-08-13 17:03:51	f	14	KVM driver for illumos
378	smartos-live	https://github.com/joyent/smartos-live	2011-08-14 01:08:28	f	14	For more information, please see http://smartos.org/  For any questions that aren't answered there, please join the SmartOS discussion list: http://smartos.org/smartos-mailing-list/
400	hapipy	https://github.com/HubSpot/hapipy	2011-09-14 15:14:46	f	15	A Python wrapper for the HubSpot APIs  #hubspot-open-source
401	hubspot.github.com	https://github.com/HubSpot/hubspot.github.com	2011-09-16 23:09:07	f	15	HubSpot Open Source projects.
403	haPiHP	https://github.com/HubSpot/haPiHP	2011-11-22 20:12:14	f	15	An updated PHP client for the HubSpot API
407	teeble	https://github.com/HubSpot/teeble	2012-08-23 16:48:49	f	15	A tiny table plugin #hubspot-open-source
562	builder	https://github.com/angular-ui/builder	2013-01-24 15:01:38	f	22	Build server for angular-ui
409	virtualenvchdir	https://github.com/HubSpot/virtualenvchdir	2012-11-08 19:57:36	f	15	Easily chdir into different virtualenvs  #hubspot-open-source
497	docker-tutorial	https://github.com/docker/docker-tutorial	2013-08-22 16:59:47	f	18	\N
528	image_science	https://github.com/zurb/image_science	2011-02-08 21:29:54	f	20	\N
529	html5_video_voting	https://github.com/zurb/html5_video_voting	2011-07-12 20:33:44	f	20	\N
435	sling	https://github.com/apache/sling	2009-03-27 15:41:54	f	16	Mirror of Apache Sling
438	apr	https://github.com/apache/apr	2009-03-27 15:41:55	f	16	Mirror of Apache Portable Runtime
460	batcache	https://github.com/Automattic/batcache	2009-09-04 19:48:01	f	17	A memcached HTML page cache for WordPress.
461	mongoose	https://github.com/Automattic/mongoose	2010-04-06 21:39:05	f	17	MongoDB object modeling designed to work in an asynchronous environment.
462	knox	https://github.com/Automattic/knox	2010-09-16 18:05:43	f	17	S3 Lib
463	node-canvas	https://github.com/Automattic/node-canvas	2010-09-29 17:31:21	f	17	Node canvas is a Cairo backed Canvas implementation for NodeJS.
464	Edit-Flow	https://github.com/Automattic/Edit-Flow	2010-10-02 14:18:19	f	17	WordPress plugin to accelerate your editorial workflow
465	cli-table	https://github.com/Automattic/cli-table	2011-01-04 03:25:49	f	17	Pretty unicode tables for the CLI with Node.JS
466	cheezcap	https://github.com/Automattic/cheezcap	2011-06-03 20:32:58	f	17	Cheezburger Custom Administration Panel - This is a working fork of the original CheezCAP
467	kue	https://github.com/Automattic/kue	2011-06-27 22:37:37	f	17	Kue is a priority job queue backed by redis, built for node.js.
469	babble	https://github.com/Automattic/babble	2011-09-23 15:12:41	f	17	Multilingual WordPress done right.
490	bender	https://github.com/docker/bender	2012-01-22 22:19:49	f	18	IRC bot to manage scrum-like standup meetings
491	docker	https://github.com/docker/docker	2013-01-18 18:10:57	f	18	Docker - the open-source application container engine
492	docker-registry	https://github.com/docker/docker-registry	2013-04-16 01:04:54	f	18	This is **DEPRECATED**! Please go to https://github.com/docker/distribution
494	docker-py	https://github.com/docker/docker-py	2013-05-23 16:15:07	f	18	An API client for docker written in Python
495	openstack-docker	https://github.com/docker/openstack-docker	2013-05-30 01:14:44	f	18	Nova driver and Glance backend to use Docker inside OpenStack
499	gordon	https://github.com/docker/gordon	2013-10-30 22:10:05	f	18	Cli application to manage github pull requests 
520	Font-Awesome	https://github.com/FortAwesome/Font-Awesome	2012-02-17 14:19:43	f	19	The iconic font and CSS toolkit
522	font-awesome-sass	https://github.com/FortAwesome/font-awesome-sass	2013-07-12 18:00:55	f	19	Font-Awesome Sass gem for use in Ruby/Rails projects
524	phoenix-app	https://github.com/FortAwesome/phoenix-app	2016-04-21 17:41:37	f	19	Base Docker container for our Phoenix framework-based apps
525	flickrbomb	https://github.com/zurb/flickrbomb	2010-10-13 23:49:57	f	20	flickrBomb provides an easy way for you to fill your prototypes with relevant content, and not just those dull gray placeholder images.
531	foundation-rails	https://github.com/zurb/foundation-rails	2011-09-12 02:25:19	f	20	Foundation for Rails
532	joyride	https://github.com/zurb/joyride	2011-10-12 22:25:51	f	20	jQuery feature tour plugin.
533	foundation-sites	https://github.com/zurb/foundation-sites	2011-10-13 23:05:42	f	20	The most advanced responsive front-end framework in the world. Quickly create prototypes and production code for sites that work on any kind of device.
555	AngularJs.tmbundle	https://github.com/angular-ui/AngularJs.tmbundle	2011-12-06 01:58:13	f	22	AngularJs Textmate Bundle
556	angular-ui-OLDREPO	https://github.com/angular-ui/angular-ui-OLDREPO	2012-03-21 19:32:13	f	22	DISCONTINUED REPO: This project has been restructured ->
557	angular-ui.github.com	https://github.com/angular-ui/angular-ui.github.com	2012-03-21 19:33:42	f	22	Demo page
558	angular-google-maps	https://github.com/angular-ui/angular-google-maps	2012-08-16 12:50:47	f	22	AngularJS directives for the Google Maps Javascript API
559	bootstrap	https://github.com/angular-ui/bootstrap	2012-10-05 18:27:01	f	22	Native AngularJS (Angular) directives for Bootstrap. Smaller footprint (20kB gzipped), no 3rd party JS dependencies (jQuery, bootstrap JS) required. Please read the README.md file before submitting an issue!
560	ui-grid	https://github.com/angular-ui/ui-grid	2012-10-13 01:39:25	f	22	UI Grid: an Angular Data Grid
561	ui-router	https://github.com/angular-ui/ui-router	2013-01-18 20:26:29	f	22	The de-facto solution to flexible routing with nested views in AngularJS
563	ui-select2	https://github.com/angular-ui/ui-select2	2013-02-25 22:34:45	f	22	AngularJS wrapper for select2 (deprecated, use angular-ui/ui-select)
564	ui-sortable	https://github.com/angular-ui/ui-sortable	2013-02-25 22:34:53	f	22	jQuery UI Sortable for AngularJS
585	memcached	https://github.com/facebookarchive/memcached	2008-12-19 10:48:52	f	23	A fork of memcached/memcached
586	three20	https://github.com/facebookarchive/three20	2009-02-19 06:31:51	f	23	Three20 is an Objective-C library for iPhone developers
587	platform	https://github.com/facebookarchive/platform	2009-04-02 04:46:20	f	23	An old snapshot of the infrastructure that runs Facebook Platform.
588	phpembed	https://github.com/facebookarchive/phpembed	2009-04-02 04:49:44	f	23	Simplified API built on top of PHP SAPI
589	scribe	https://github.com/facebookarchive/scribe	2009-04-02 04:55:56	f	23	Scribe is a server for aggregating log data streamed in real time from a large number of servers.
590	firefox-toolbar	https://github.com/facebookarchive/firefox-toolbar	2009-04-02 04:57:46	f	23	The Facebook Toolbar for Firefox is a free extension for Firefox that lets you extend your Facebook experience into your everyday browsing.
591	cassandra	https://github.com/facebookarchive/cassandra	2009-04-02 04:59:15	f	23	A distributed storage system for managing structured data while providing reliability at scale.
592	phpsh	https://github.com/facebookarchive/phpsh	2009-05-05 08:40:42	f	23	A read-eval-print-loop for php
593	futil	https://github.com/facebookarchive/futil	2009-05-05 08:52:56	f	23	utility library for haskell projects
594	lex-pass	https://github.com/facebookarchive/lex-pass	2009-05-05 09:05:07	f	23	manipulate a php codebase using haskell to transform the abstract-syntax-tree
615	legacy-homebrew	https://github.com/Homebrew/legacy-homebrew	2009-05-20 19:38:37	f	24	:skull: The former home of :beer: the missing package manager for OS X
616	homebrew-bundle	https://github.com/Homebrew/homebrew-bundle	2011-06-25 17:12:46	f	24	:package: Bundler for non-Ruby dependencies from Homebrew
617	homebrew-php	https://github.com/Homebrew/homebrew-php	2012-02-19 06:55:28	f	24	:elephant: PHP macOS formulae for the Homebrew package manager
618	homebrew-games	https://github.com/Homebrew/homebrew-games	2012-03-05 17:32:42	f	24	:video_game: Games formulae for the Homebrew package manager
619	homebrew-dupes	https://github.com/Homebrew/homebrew-dupes	2012-03-15 17:51:50	f	24	:two_women_holding_hands: System duplicate formulae for the Homebrew package manager
620	homebrew-versions	https://github.com/Homebrew/homebrew-versions	2012-03-17 02:42:59	f	24	:1234: Versioned formulae for the Homebrew package manager
621	homebrew-science	https://github.com/Homebrew/homebrew-science	2012-04-22 20:16:34	f	24	:microscope: Scientific formulae for the Homebrew package manager
622	homebrew-boneyard	https://github.com/Homebrew/homebrew-boneyard	2012-04-24 19:59:02	f	24	:skull: Archive of formulae removed from the Homebrew package manager
623	homebrew-python	https://github.com/Homebrew/homebrew-python	2012-07-26 12:31:18	f	24	:snake: Python formulae for the Homebrew package manager
624	homebrew-apache	https://github.com/Homebrew/homebrew-apache	2012-09-02 05:23:21	f	24	:globe_with_meridians: Apache formulae for the Homebrew package manager
645	graphite	https://github.com/driftyco/graphite	2013-01-02 19:05:06	f	25	Clean jQuery Mobile theme-pack and theme generator
646	jetstrap-docs	https://github.com/driftyco/jetstrap-docs	2013-03-07 20:43:21	f	25	Jetstrap Documentation and Tutorials
647	jqm-plain	https://github.com/driftyco/jqm-plain	2013-03-31 20:45:32	f	25	A fork of jQuery Mobile with one swatch and a simple, default theme.
648	jquerymobile-tabbar	https://github.com/driftyco/jquerymobile-tabbar	2013-05-01 21:01:14	f	25	An easier to use NavBar control for jQuery Mobile apps
649	jqm-neue	https://github.com/driftyco/jqm-neue	2013-06-07 14:47:15	f	25	A slightly tweaked default jQuery Mobile theme.
650	ionic	https://github.com/driftyco/ionic	2013-08-20 23:06:02	f	25	Build amazing native and progressive web apps with Angular and open web technologies. One app running on everything 🎉
651	cordova-camera-roll	https://github.com/driftyco/cordova-camera-roll	2013-09-24 22:43:55	f	25	An iOS camera roll plugin for Cordova/PhoneGap
652	ionic-site	https://github.com/driftyco/ionic-site	2013-09-30 16:22:20	f	25	Repo for the ionicframework.com site
654	ionicons	https://github.com/driftyco/ionicons	2013-10-10 14:34:18	f	25	The premium icon font for Ionic
653	ionic-todo	https://github.com/driftyco/ionic-todo	2013-10-01 14:34:37	f	25	\N
677	yos-social-php	https://github.com/yahoo/yos-social-php	2009-06-15 21:46:09	f	26	[archiving soon] Yahoo! Social SDK - PHP library
683	boomerang	https://github.com/yahoo/boomerang	2010-05-20 03:01:02	f	26	End user oriented web performance testing and beaconing
684	oozie	https://github.com/yahoo/oozie	2010-06-15 07:21:41	f	26	Oozie - workflow engine for Hadoop
705	CodeMirror2	https://github.com/adobe/CodeMirror2	2011-12-07 17:40:34	f	27	In-browser code editor
706	brackets-app	https://github.com/adobe/brackets-app	2011-12-07 21:01:01	f	27	Deprecated CEF1-based app shell for Brackets. Use https://github.com/adobe/brackets-shell instead.
707	brackets	https://github.com/adobe/brackets	2011-12-07 21:14:40	f	27	An open source code editor for the web, written in JavaScript, HTML and CSS.
708	adobe.github.com	https://github.com/adobe/adobe.github.com	2012-03-09 21:55:32	f	27	Adobe central hub for open source
709	glsl2agal	https://github.com/adobe/glsl2agal	2012-04-20 02:53:41	f	27	GLSL To AGAL compiler -- Use this to compile GLSL shaders so they can be used in your flash application.
714	web-platform	https://github.com/adobe/web-platform	2012-05-07 20:45:41	f	27	\N
796	madewith	https://github.com/meteor/madewith	2012-04-17 02:17:46	f	30	\N
829	strong-task-emitter	https://github.com/strongloop/strong-task-emitter	2013-03-28 22:36:02	f	31	\N
735	atom	https://github.com/atom/atom	2012-01-20 18:18:21	f	28	The hackable text editor
736	node-oniguruma	https://github.com/atom/node-oniguruma	2013-03-05 23:15:01	f	28	Oniguruma Node Module
737	node-ctags	https://github.com/atom/node-ctags	2013-03-07 01:01:05	f	28	Ctags Node module
738	git-utils	https://github.com/atom/git-utils	2013-03-08 18:57:00	f	28	Git Node Module
739	node-spellchecker	https://github.com/atom/node-spellchecker	2013-03-23 12:01:50	f	28	SpellChecker Node Module
740	node-pathwatcher	https://github.com/atom/node-pathwatcher	2013-04-06 17:01:46	f	28	Path Watcher Node Module
741	node-ls-archive	https://github.com/atom/node-ls-archive	2013-04-12 23:20:58	f	28	Node Module for archive files
830	strong-config-loader	https://github.com/strongloop/strong-config-loader	2013-03-28 22:42:53	f	31	\N
743	apm	https://github.com/atom/apm	2013-05-07 16:27:05	f	28	Atom Package Manager
831	strong-module-loader	https://github.com/strongloop/strong-module-loader	2013-04-02 18:41:15	f	31	\N
766	spring-data-jdbc-ext	https://github.com/spring-projects/spring-data-jdbc-ext	2010-11-09 17:49:12	f	29	Spring Data JDBC Extensions.  Support for database specific extensions to standard JDBC including support for Oracle RAC fast connection failover, AQ JMS support and support for using advanced data types.
767	spring-data-commons	https://github.com/spring-projects/spring-data-commons	2010-11-11 20:19:31	f	29	Spring Data Commons. Interfaces and code shared between the various datastore specific implementations.
768	spring-data-graph	https://github.com/spring-projects/spring-data-graph	2010-11-11 20:23:19	f	29	Provides support to increase developer productivity in Java when using a graph database like Neo4j.  Uses familiar Spring concepts such as a template classes for core API usage and provides an annotation based programming model using AspectJ.
771	spring-data-jpa	https://github.com/spring-projects/spring-data-jpa	2010-11-11 21:36:56	f	29	Simplifies the development of creating a JPA-based data access layer. 
772	spring-build-gradle	https://github.com/spring-projects/spring-build-gradle	2010-11-12 03:06:48	f	29	*Deprecated* Shared Gradle sources for automating Spring Project builds
773	spring-batch-admin	https://github.com/spring-projects/spring-batch-admin	2010-11-15 17:57:12	f	29	Spring Batch Admin: runtime application and utilities for running Jobs with Spring Batch
774	spring-amqp	https://github.com/spring-projects/spring-amqp	2010-11-17 15:50:16	f	29	Spring AMQP - support for Spring programming model with AMQP, especially but not limited to RabbitMQ
795	meteor	https://github.com/meteor/meteor	2012-01-19 01:58:17	f	30	Meteor, the JavaScript App Platform
798	docs	https://github.com/meteor/docs	2012-09-21 03:22:09	f	30	The Meteor API documentation.
799	fstream	https://github.com/meteor/fstream	2012-12-18 03:10:33	f	30	Advanced FS Streaming for Node
800	UglifyJS2	https://github.com/meteor/UglifyJS2	2013-01-16 19:36:45	f	30	 JavaScript parser / mangler / compressor / beautifier toolkit
801	gzippo	https://github.com/meteor/gzippo	2013-02-06 05:32:20	f	30	gzippo pronounced `g-zippo` is a nodejs gzip middleware for Connect and express js using the new native node zlib api
803	s3-plugin	https://github.com/meteor/s3-plugin	2013-04-02 19:05:20	f	30	Upload Jenkins build artifacts to Amazon S3
804	node-mongodb-native	https://github.com/meteor/node-mongodb-native	2013-05-21 21:46:29	f	30	Mongo DB Native NodeJS Driver
825	fsevents	https://github.com/strongloop/fsevents	2011-02-23 16:41:56	f	31	Native Access to Mac OS-X FSEvents
826	node-foreman	https://github.com/strongloop/node-foreman	2012-10-21 01:06:00	f	31	A Node.js Version of Foreman
827	loopback-component-oauth2	https://github.com/strongloop/loopback-component-oauth2	2012-11-18 04:52:24	f	31	oAuth 2.0 server for LoopBack
828	strongloop	https://github.com/strongloop/strongloop	2013-03-11 22:55:26	f	31	StrongLoop: Enterprise Node to Power the API Economy
832	dist-paas-buildpack	https://github.com/strongloop/dist-paas-buildpack	2013-04-09 06:24:03	f	31	StrongLoop distributions for PAAS
833	loopback	https://github.com/strongloop/loopback	2013-04-09 16:02:18	f	31	LoopBack is an open source Node.js framework built on top of Express optimized for building APIs for mobile, web, and other devices. Connect to multiple data sources, write business logic in Node.js, glue on top of your existing services and data, connect using JS, iOS & Android SDKs.
834	dist-paas-quickstart	https://github.com/strongloop/dist-paas-quickstart	2013-04-10 14:57:31	f	31	StrongLoop distributions for PAAS - Quick Start
859	drawback	https://github.com/LearnBoost/drawback	2010-12-03 00:21:05	f	32	The Drawback framework provides a seamless way to render 2D drawings on the client side using HTML5 technologies with a server-side backend.
860	tobi	https://github.com/LearnBoost/tobi	2010-12-03 02:25:34	f	32	Tobi: Expressive server-side functional testing with jQuery
861	cluster	https://github.com/LearnBoost/cluster	2011-02-11 18:18:02	f	32	Node.JS multi-core server manager with plugins support.
893	dashboard	https://github.com/etsy/dashboard	2011-10-21 19:22:14	f	33	\N
921	netflix.github.com	https://github.com/Netflix/netflix.github.com	2012-01-31 00:50:10	f	34	\N
977	docs	https://github.com/laravel/docs	2013-01-10 19:08:45	f	36	\N
885	cascading.jruby	https://github.com/etsy/cascading.jruby	2010-03-08 16:59:15	f	33	A JRuby DSL for Cascading
886	statsd	https://github.com/etsy/statsd	2010-12-30 00:09:50	f	33	Daemon for easy but powerful stats aggregation
887	phpunit-extensions	https://github.com/etsy/phpunit-extensions	2011-02-27 15:36:41	f	33	Etsy PHPUnit Extensions
888	logster	https://github.com/etsy/logster	2011-03-11 20:34:13	f	33	Parse log files, generate metrics for Graphite and Ganglia
978	framework	https://github.com/laravel/framework	2013-01-10 21:27:28	f	36	\N
890	ab	https://github.com/etsy/ab	2011-07-22 23:11:14	f	33	Etsy's little framework for A/B testing, feature ramp up, and more.
891	deployinator	https://github.com/etsy/deployinator	2011-07-29 19:32:38	f	33	Deployinate!
892	ttorrent	https://github.com/etsy/ttorrent	2011-08-18 15:34:55	f	33	Turn's BitTorrent Java library (tracker and client)
894	GearmanManager	https://github.com/etsy/GearmanManager	2011-10-24 20:56:19	f	33	PHP daemon for managing gearman workers
915	astyanax	https://github.com/Netflix/astyanax	2011-07-13 20:24:30	f	34	Cassandra Java Client
916	curator	https://github.com/Netflix/curator	2011-07-14 19:47:55	f	34	ZooKeeper client wrapper and rich ZooKeeper framework
917	Priam	https://github.com/Netflix/Priam	2011-07-20 17:51:25	f	34	Co-Process for backup/recovery, Token Management, and Centralized Configuration management for Cassandra.
918	CassJMeter	https://github.com/Netflix/CassJMeter	2011-10-20 16:18:00	f	34	JMeter plugin to run cassandra tests.
919	servo	https://github.com/Netflix/servo	2011-12-16 21:09:27	f	34	Netflix Application Monitoring Library
979	envoy	https://github.com/laravel/envoy	2014-02-08 18:43:03	f	36	\N
980	cashier	https://github.com/laravel/cashier	2014-03-04 03:11:44	f	36	\N
923	archaius	https://github.com/Netflix/archaius	2012-05-11 00:07:05	f	34	Library for configuration management API
924	asgard	https://github.com/Netflix/asgard	2012-05-21 21:24:15	f	34	[Asgard is deprecated at Netflix. We use Spinnaker ( www.spinnaker.io ).] Web interface for application deployments and cloud management in Amazon Web Services (AWS). Binary download: http://github.com/Netflix/asgard/releases
945	grunt	https://github.com/gruntjs/grunt	2011-09-21 15:16:20	f	35	Grunt: The JavaScript Task Runner
946	grunt-contrib	https://github.com/gruntjs/grunt-contrib	2012-04-10 20:26:33	f	35	[DEPRECATED] A collection of common grunt tasks.
947	gruntjs.com	https://github.com/gruntjs/gruntjs.com	2012-09-01 02:38:07	f	35	Grunt's Website
948	grunt-contrib-clean	https://github.com/gruntjs/grunt-contrib-clean	2012-09-01 13:23:16	f	35	Clear files and folders.
949	grunt-contrib-less	https://github.com/gruntjs/grunt-contrib-less	2012-09-04 17:37:16	f	35	Compile LESS files to CSS.
981	homestead	https://github.com/laravel/homestead	2014-04-17 01:46:34	f	36	\N
951	grunt-contrib-cssmin	https://github.com/gruntjs/grunt-contrib-cssmin	2012-09-07 20:08:02	f	35	Compress CSS files.
952	grunt-contrib-yuidoc	https://github.com/gruntjs/grunt-contrib-yuidoc	2012-09-07 20:52:35	f	35	Compile YUIDoc Documentation.
953	grunt-contrib-stylus	https://github.com/gruntjs/grunt-contrib-stylus	2012-09-07 21:07:17	f	35	Compile Stylus files to CSS.
954	grunt-contrib-compress	https://github.com/gruntjs/grunt-contrib-compress	2012-09-07 21:44:12	f	35	Compress files and folders.
975	laravel	https://github.com/laravel/laravel	2011-06-08 03:06:08	f	36	A PHP Framework For Web Artisans
982	settler	https://github.com/laravel/settler	2014-05-12 15:58:57	f	36	\N
984	socialite	https://github.com/laravel/socialite	2014-08-18 02:49:36	f	36	\N
1002	EnhanceJS	https://github.com/filamentgroup/EnhanceJS	2010-08-13 19:59:01	f	37	Are you looking for the new Enhance? Try here https://github.com/filamentgroup/enhance
1003	jquery-ui	https://github.com/filamentgroup/jquery-ui	2010-10-18 14:52:01	f	37	A fork of jQuery UI to push development of some plug-ins. Currently selectmenu is adopted to be improved. Please see branch selectmenu!
1126	node	https://github.com/nwjs/node	2013-04-23 06:50:07	f	42	\N
1032	BookBlock	https://github.com/codrops/BookBlock	2012-09-03 15:57:21	f	38	A jQuery plugin that will create a booklet-like component that let's you navigate through its items by flipping the pages.
1035	Windy	https://github.com/codrops/Windy	2012-10-09 10:00:13	f	38	A jQuery Plugin for Swift Content Navigation
1062	devise	https://github.com/plataformatec/devise	2009-09-16 12:15:12	f	39	Flexible authentication solution for Rails with Warden.
1063	responders	https://github.com/plataformatec/responders	2009-12-02 13:19:13	f	39	A set of Rails responders to dry up your application
1064	has_scope	https://github.com/plataformatec/has_scope	2009-12-04 11:45:59	f	39	Map incoming controller parameters to named scopes in your resources
1065	show_for	https://github.com/plataformatec/show_for	2009-12-15 11:24:16	f	39	Wrap your objects with a helper to easily show them
1066	mail_form	https://github.com/plataformatec/mail_form	2009-12-24 11:20:17	f	39	Send e-mail straight from forms in Rails with I18n, validations, attachments and request information.
1067	simple_form	https://github.com/plataformatec/simple_form	2009-12-28 14:23:48	f	39	Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.
1071	markerb	https://github.com/plataformatec/markerb	2011-04-26 08:09:25	f	39	Multipart templates made easy with Markdown + ERb
1088	moment	https://github.com/moment/moment	2011-03-01 02:46:06	f	40	Parse, validate, manipulate, and display dates in javascript.
1089	momentjs.com	https://github.com/moment/momentjs.com	2012-02-03 17:41:22	f	40	The website for momentjs
1090	moment-timezone	https://github.com/moment/moment-timezone	2012-05-09 03:51:49	f	40	Timezone support for moment.js
1094	mongo-java-driver	https://github.com/mongodb/mongo-java-driver	2009-01-15 15:16:29	f	41	The Java driver for MongoDB 
1095	mongo-python-driver	https://github.com/mongodb/mongo-python-driver	2009-01-15 15:18:06	f	41	PyMongo - the Python driver for MongoDB
1096	mongo	https://github.com/mongodb/mongo	2009-01-15 16:15:18	f	41	The Mongo Database
1097	mongo-ruby-driver	https://github.com/mongodb/mongo-ruby-driver	2009-01-15 16:40:45	f	41	Ruby driver for MongoDB
1098	mongo-php-driver-legacy	https://github.com/mongodb/mongo-php-driver-legacy	2009-02-04 21:30:35	f	41	Legacy MongoDB PHP driver
1099	mongo-perl-driver	https://github.com/mongodb/mongo-perl-driver	2009-03-05 21:14:18	f	41	Perl driver for the MongoDB
1100	mongo-snippets	https://github.com/mongodb/mongo-snippets	2009-03-10 22:09:11	f	41	snippets of code that might be useful
1101	mongoid	https://github.com/mongodb/mongoid	2009-09-16 16:24:56	f	41	Ruby ODM framework for MongoDB
1102	mongo-perf	https://github.com/mongodb/mongo-perf	2009-12-07 20:29:03	f	41	performance tools for mongodb
1123	nw.js	https://github.com/nwjs/nw.js	2012-01-04 06:21:10	f	42	Call all Node.js modules directly from DOM and enable a new way of writing applications with all Web technologies.
1124	v8	https://github.com/nwjs/v8	2012-04-20 01:52:00	f	42	An official mirror of V8 SVN repository
1125	nw-gyp	https://github.com/nwjs/nw-gyp	2012-11-04 12:24:12	f	42	native addon build tool for node-webkit
1127	blink	https://github.com/nwjs/blink	2013-06-03 05:07:00	f	42	Unofficial mirror of the Web engine in Google Chromium, forked from WebKit
1128	grunt-nw-builder	https://github.com/nwjs/grunt-nw-builder	2013-08-13 14:48:17	f	42	 Let you build your node-webkit apps for mac, win and linux with grunt. It will download the prebuilt binaries for a specify version, unpacks it, creates a release folder, create the app.nw file for a specified directory and copys the app.nw file where it belongs.
1129	breakpad	https://github.com/nwjs/breakpad	2013-10-06 02:32:03	f	42	breakpad used in node-webkit
1130	nw-builder	https://github.com/nwjs/nw-builder	2014-01-21 14:14:36	f	42	Build your NW.js apps for Mac, Win and Linux programmatically or via CLI
1134	active_shipping	https://github.com/Shopify/active_shipping	2008-04-21 18:13:39	f	43	ActiveShipping is a simple shipping abstraction library extracted from Shopify
1131	website	https://github.com/nwjs/website	2014-12-14 04:13:09	f	42	\N
1132	npm-installer	https://github.com/nwjs/npm-installer	2015-01-16 01:56:46	f	42	\N
1137	liquid	https://github.com/Shopify/liquid	2008-05-08 15:27:26	f	43	Liquid markup language. Safe, customer facing template language for flexible web apps. 
1138	active_fulfillment	https://github.com/Shopify/active_fulfillment	2008-05-13 15:04:36	f	43	Active Merchant library for integration with order fulfillment services
1170	AFIncrementalStore	https://github.com/AFNetworking/AFIncrementalStore	2012-07-13 18:18:49	f	44	\N
1140	shopify_app	https://github.com/Shopify/shopify_app	2008-10-09 15:10:52	f	43	Adds a full Shopify API Application environment to your application
1141	shopify_api	https://github.com/Shopify/shopify_api	2009-06-12 15:54:26	f	43	ShopifyAPI is a lightweight gem for accessing the Shopify admin REST web services.
1223	rpm-build-tools	https://github.com/pld-linux/rpm-build-tools	2012-07-07 14:18:44	f	47	\N
1164	AFNetworking	https://github.com/AFNetworking/AFNetworking	2011-05-31 21:28:44	f	44	A delightful networking framework for iOS, OS X, watchOS, and tvOS.
1165	AFOAuth2Manager	https://github.com/AFNetworking/AFOAuth2Manager	2011-12-06 18:02:23	f	44	AFNetworking Extension for OAuth 2 Authentication
1167	AFOAuth1Client	https://github.com/AFNetworking/AFOAuth1Client	2011-12-27 20:40:01	f	44	AFNetworking Extension for OAuth 1.0a Authentication
1168	AFAmazonS3Manager	https://github.com/AFNetworking/AFAmazonS3Manager	2012-05-01 16:34:32	f	44	AFNetworking Client for the Amazon S3 API
1186	yeoman	https://github.com/yeoman/yeoman	2012-04-13 05:12:21	f	45	Yeoman - a set of tools for automating development workflow
1187	yeoman.github.io	https://github.com/yeoman/yeoman.github.io	2012-05-30 10:33:33	f	45	Yeoman website
1188	generator	https://github.com/yeoman/generator	2012-07-23 13:07:31	f	45	Rails-inspired generator system that provides scaffolding for your apps
1189	configstore	https://github.com/yeoman/configstore	2012-11-13 15:34:24	f	45	Easily load and persist config without having to think about where and how
1190	generator-chromeapp	https://github.com/yeoman/generator-chromeapp	2012-11-21 21:48:26	f	45	Scaffold out a Chrome app
1191	generator-backbone	https://github.com/yeoman/generator-backbone	2012-11-21 22:38:43	f	45	Scaffold out a Backbone.js project
1192	generator-angular	https://github.com/yeoman/generator-angular	2012-11-21 22:43:39	f	45	Yeoman generator for AngularJS
1193	generator-webapp_DEPRECATED	https://github.com/yeoman/generator-webapp_DEPRECATED	2012-11-21 23:20:28	f	45	Yeoman generator that scaffolds out a front-end web app
1194	generator-karma	https://github.com/yeoman/generator-karma	2012-11-21 23:56:30	f	45	Yeoman generator for Karma
1195	generator-mocha	https://github.com/yeoman/generator-mocha	2012-11-23 17:32:41	f	45	Yeoman generator for Mocha
1216	lodash	https://github.com/lodash/lodash	2012-04-07 04:11:46	f	46	A modern JavaScript utility library delivering modularity, performance, & extras.
1217	lodash-cli	https://github.com/lodash/lodash-cli	2013-08-28 02:04:59	f	46	The Lodash command-line interface.
1218	lodash-migrate	https://github.com/lodash/lodash-migrate	2014-12-12 16:35:09	f	46	Migrate to the latest Lodash release.
1219	lodash.com	https://github.com/lodash/lodash.com	2015-06-07 23:30:43	f	46	The Lodash website.
1220	babel-plugin-lodash	https://github.com/lodash/babel-plugin-lodash	2015-07-30 17:56:37	f	46	Modular Lodash builds without the hassle.
1221	lodash-webpack-plugin	https://github.com/lodash/lodash-webpack-plugin	2016-04-29 03:03:30	f	46	Smaller modular Lodash builds.
1226	0verkill	https://github.com/pld-linux/0verkill	2012-07-13 21:42:13	f	47	0verkill - ASCII-art multiplayer game
1253	jekyll	https://github.com/jekyll/jekyll	2008-10-20 06:29:03	f	48	:globe_with_meridians: Jekyll is a blog-aware, static site generator in Ruby
1254	jekyll-assets	https://github.com/jekyll/jekyll-assets	2012-10-21 22:43:15	f	48	:art: Asset pipelines for Jekyll.
1255	jekyll-import	https://github.com/jekyll/jekyll-import	2013-01-30 20:46:46	f	48	:inbox_tray: The jekyll import command for importing from various blogs to Jekyll format.
1352	ember-inspector	https://github.com/emberjs/ember-inspector	2013-01-28 18:36:15	f	51	\N
1259	jekyll-test-gem-plugin	https://github.com/jekyll/jekyll-test-gem-plugin	2013-10-04 19:36:25	f	48	Wouldn't it be cool if you could ship Jekyll plugins as gems?
1285	github-services	https://github.com/intridea/github-services	2008-09-26 15:08:23	f	49	Fork of Official GitHub Services Integration to include Present.ly integration.
1287	presently-android-1.0	https://github.com/intridea/presently-android-1.0	2008-10-22 01:52:25	f	49	Present.ly Android is the official Android client for Present.ly.
1313	time-warp	https://github.com/harvesthq/time-warp	2009-01-05 21:37:41	f	50	Ruby gem to warp time in tests
1319	harvest_api_samples	https://github.com/harvesthq/harvest_api_samples	2010-09-30 18:41:25	f	50	Samples of Harvest API usage in various languages.
1322	chosen	https://github.com/harvesthq/chosen	2011-04-18 15:07:41	f	50	Chosen is a library for making long, unwieldy select boxes more friendly.
1343	starter-kit	https://github.com/emberjs/starter-kit	2011-05-24 05:11:07	f	51	A starter kit for Ember
1344	ember.js	https://github.com/emberjs/ember.js	2011-05-25 23:39:40	f	51	Ember.js - A JavaScript framework for creating ambitious web applications
1345	website	https://github.com/emberjs/website	2011-10-26 05:30:05	f	51	Source for emberjs.com
1346	data	https://github.com/emberjs/data	2011-12-20 01:50:40	f	51	A data persistence library for Ember.js.
1347	emberjs.github.com	https://github.com/emberjs/emberjs.github.com	2011-12-28 17:44:06	f	51	Ember.js Website - DO NOT OPEN ISSUES/PRs HERE!!! Please send them to https://github.com/emberjs/website instead.
1348	ember-rails	https://github.com/emberjs/ember-rails	2012-01-03 02:48:12	f	51	Ember for Rails 3.1+
1373	trebuchet	https://github.com/airbnb/trebuchet	2011-04-07 03:21:23	f	52	Trebuchet launches features at people
1375	zonify	https://github.com/airbnb/zonify	2011-11-12 00:58:50	f	52	a command line tool for generating DNS records from EC2 instances
1376	statsd-ruby	https://github.com/airbnb/statsd-ruby	2012-01-24 23:51:32	f	52	A Ruby Statsd client that isn't a direct port of the Python example code. Because Ruby isn't Python.
1378	sssp	https://github.com/airbnb/sssp	2012-03-03 01:15:06	f	52	Software distribution by way of S3 signed URLs
1379	cloud-maker	https://github.com/airbnb/cloud-maker	2012-07-18 21:12:21	f	52	Building castles in the sky
1381	infinity	https://github.com/airbnb/infinity	2012-08-08 18:54:33	f	52	UITableViews for the web (DEPRECATED)
1471	android_device_htc_hero	https://github.com/CyanogenMod/android_device_htc_hero	2010-07-04 22:15:43	f	55	\N
1404	analytics.js	https://github.com/segmentio/analytics.js	2012-06-18 05:38:24	f	53	The hassle-free way to integrate analytics into any web application.
1405	analytics-node	https://github.com/segmentio/analytics-node	2012-07-09 08:36:04	f	53	The hassle-free way to integrate analytics into any node application.
1506	django-contrib-comments	https://github.com/django/django-contrib-comments	2013-03-11 18:27:37	f	57	\N
1407	analytics-python	https://github.com/segmentio/analytics-python	2012-07-17 21:17:15	f	53	The hassle-free way to integrate analytics into any python application. 
1408	Analytics.NET	https://github.com/segmentio/Analytics.NET	2012-10-01 07:37:48	f	53	The hassle-free way to integrate analytics into any C# / .NET application.
1410	inbound	https://github.com/segmentio/inbound	2012-12-24 01:33:47	f	53	A url and referrer parsing library for node.
1411	analytics-ruby	https://github.com/segmentio/analytics-ruby	2013-01-11 18:33:55	f	53	The hassle-free way to integrate analytics into any Ruby application.
1412	analytics-php	https://github.com/segmentio/analytics-php	2013-01-22 23:41:14	f	53	The hassle-free way to integrate analytics into any php application.
1433	gitlabhq	https://github.com/gitlabhq/gitlabhq	2011-10-02 16:25:27	f	54	GitLab CE | Please open new issues in our issue tracker on GitLab.com
1434	grit	https://github.com/gitlabhq/grit	2011-10-10 21:13:01	f	54	Grit gives you object oriented read/write access to Git repositories via Ruby. Patched for GitLab
1435	linguist	https://github.com/gitlabhq/linguist	2011-10-20 17:59:37	f	54	GitLab Dependency | Language Savant
1437	gitolite	https://github.com/gitlabhq/gitolite	2011-12-05 20:01:37	f	54	Patched for GitLab | Hosting git repositories -- Gitolite allows you to setup git hosting on a central server, with very fine-grained access control and many (many!) more powerful features.
1438	yaml_db	https://github.com/gitlabhq/yaml_db	2012-03-06 17:35:10	f	54	GitLab Dependency | Rails plugin for a database-independent dump format, data.yml.
1463	android	https://github.com/CyanogenMod/android	2010-06-29 18:35:51	f	55	Misc Android stuff
1464	android_build	https://github.com/CyanogenMod/android_build	2010-06-29 18:46:21	f	55	Android Build System (cyanogenmod)
1465	android_packages_apps_CMParts	https://github.com/CyanogenMod/android_packages_apps_CMParts	2010-07-04 02:13:05	f	55	CMParts
1467	android_vendor_cyanogen	https://github.com/CyanogenMod/android_vendor_cyanogen	2010-07-04 06:31:10	f	55	CyanogenMod Android vendor tree
1468	android_system_core	https://github.com/CyanogenMod/android_system_core	2010-07-04 17:56:35	f	55	Android System Core (CM)
1469	android_packages_apps_DeskClock	https://github.com/CyanogenMod/android_packages_apps_DeskClock	2010-07-04 21:55:39	f	55	Android Desk Clock
1470	android_packages_apps_Browser	https://github.com/CyanogenMod/android_packages_apps_Browser	2010-07-04 22:02:20	f	55	Android Web Browser (cyanogenmod)
1493	ace	https://github.com/ajaxorg/ace	2010-10-27 10:43:36	f	56	Ace (Ajax.org Cloud9 Editor)
1494	treehugger	https://github.com/ajaxorg/treehugger	2011-03-27 14:53:18	f	56	JavaScript AST (Abstract Syntax Tree) transformation tools
1499	djangoproject.com	https://github.com/django/djangoproject.com	2010-05-28 11:27:09	f	57	Source code to djangoproject.com
1500	djangobench	https://github.com/django/djangobench	2010-06-19 19:01:45	f	57	Harness and benchmarks for evaluating Django's performance over time
1501	djangopeople	https://github.com/django/djangopeople	2011-03-29 11:12:10	f	57	A geographical community site for Django developers
1502	django-dev-dashboard	https://github.com/django/django-dev-dashboard	2011-04-21 17:41:32	f	57	Django Development Dashboard
1503	ticketbot	https://github.com/django/ticketbot	2011-10-06 06:17:32	f	57	Django's IRC ticketbot. Linkifies tickets and changesets. Hangs out in #django and #django-dev.
1504	code.djangoproject.com	https://github.com/django/code.djangoproject.com	2012-04-25 15:02:11	f	57	Configuration for Django's Trac instance (code.djangoproject.com)
1505	django	https://github.com/django/django	2012-04-28 02:47:18	f	57	The Web framework for perfectionists with deadlines.
1518	Simple-KML	https://github.com/mapbox/Simple-KML	2010-07-13 23:09:59	f	58	Simple KML is a simple & lightweight parsing library for KML written in Objective-C for the iOS platform. 
1519	osm-bright	https://github.com/mapbox/osm-bright	2010-12-05 00:12:26	f	58	A Carto template for OpenStreetMap data
1520	node-srs	https://github.com/mapbox/node-srs	2011-01-18 14:45:20	f	58	I parse your exotic projection representations and try to figure out WTF they are + magic detection of spherical mercator and wgs84 variants
1521	node-zipfile	https://github.com/mapbox/node-zipfile	2011-01-19 16:09:25	f	58	Inspect and uncompress zipfile archives in Node.js
1522	carto	https://github.com/mapbox/carto	2011-02-07 00:03:06	f	58	fast CSS-like map stylesheets
1523	tilelive	https://github.com/mapbox/tilelive	2011-02-07 00:07:18	f	58	fast interface to tiles with pluggable backends
1616	tools.logging	https://github.com/clojure/tools.logging	2011-03-11 15:01:29	f	61	\N
1525	mbtiles-spec	https://github.com/mapbox/mbtiles-spec	2011-02-07 22:15:37	f	58	specification documents for the MBTiles tileset format
1526	mbutil	https://github.com/mapbox/mbutil	2011-02-14 01:48:06	f	58	Importer and Exporter of MBTiles
1527	node-sqlite3	https://github.com/mapbox/node-sqlite3	2011-02-14 21:50:01	f	58	Asynchronous, non-blocking SQLite3 bindings for Node.js
1548	CocoaPods	https://github.com/CocoaPods/CocoaPods	2011-08-14 00:10:53	f	59	The Cocoa Dependency Manager.
1549	Specs	https://github.com/CocoaPods/Specs	2011-09-11 13:47:10	f	59	The CocoaPods Master Repo
1550	Xcodeproj	https://github.com/CocoaPods/Xcodeproj	2011-11-07 10:59:27	f	59	Create and modify Xcode projects from Ruby.
1551	search.cocoapods.org	https://github.com/CocoaPods/search.cocoapods.org	2011-11-12 11:18:21	f	59	This is the CocoaPods search engine repo, please direct CocoaPods issues to the main CocoaPods repository.
1552	feeds.cocoapods.org	https://github.com/CocoaPods/feeds.cocoapods.org	2012-04-16 21:35:45	f	59	Feeds or newly published Pods.
1617	data.xml	https://github.com/clojure/data.xml	2011-03-11 15:05:46	f	61	\N
1554	cocoapods.github.com	https://github.com/CocoaPods/cocoapods.github.com	2012-11-06 22:22:20	f	59	User and developer documentation for CocoaPods
1555	Core	https://github.com/CocoaPods/Core	2012-11-09 11:24:08	f	59	The models used within the CocoaPods gem
1556	cocoapods-downloader	https://github.com/CocoaPods/cocoapods-downloader	2012-12-12 16:32:08	f	59	A small library that provides downloaders for various source types (HTTP/SVN/Git/Mercurial)
1557	cocoadocs.org	https://github.com/CocoaPods/cocoadocs.org	2013-03-02 17:41:16	f	59	Static generator for CocoaDocs.org and the CocoaPods.org fancy web pages
1580	druid	https://github.com/alibaba/druid	2011-11-03 05:12:51	f	60	为监控而生的数据库连接池！
1581	fastjson	https://github.com/alibaba/fastjson	2011-11-03 06:58:52	f	60	:bullettrain_side: A fast JSON parser/generator for Java
1583	nginx-http-concat	https://github.com/alibaba/nginx-http-concat	2011-12-09 15:22:51	f	60	A Nginx module for concatenating files in a given context: CSS and JS files usually
1585	nginx-http-slice	https://github.com/alibaba/nginx-http-slice	2012-03-01 01:50:30	f	60	Nginx module for serving a file in slices (reverse byte-range)
1586	top	https://github.com/alibaba/top	2012-03-05 12:59:44	f	60	Taobao Open API Client
1587	tengine	https://github.com/alibaba/tengine	2012-03-21 06:34:37	f	60	A distribution of Nginx with some advanced features
1608	clojure	https://github.com/clojure/clojure	2010-06-29 20:03:33	f	61	The Clojure programming language
1609	clojure-contrib	https://github.com/clojure/clojure-contrib	2010-06-29 20:05:09	f	61	NOTE - the contrib libraries have moved to individual repos under Clojure:
1610	data.finger-tree	https://github.com/clojure/data.finger-tree	2010-10-12 13:28:17	f	61	Finger Tree data structure
1611	core.unify	https://github.com/clojure/core.unify	2010-10-12 13:30:16	f	61	Unification library
1613	test.benchmark	https://github.com/clojure/test.benchmark	2010-10-26 11:08:09	f	61	Benchmark and Regression Suite for Clojure
1615	data.json	https://github.com/clojure/data.json	2011-03-11 15:00:31	f	61	JSON in Clojure
1638	resume.github.com	https://github.com/resume/resume.github.com	2011-02-06 13:39:55	f	62	Resumes generated using the GitHub informations
1639	Semantic-UI	https://github.com/Semantic-Org/Semantic-UI	2013-04-08 23:32:04	f	63	Semantic is a UI component framework based around useful principles from natural language.
1641	Semantic-UI-ar	https://github.com/Semantic-Org/Semantic-UI-ar	2013-12-22 10:14:03	f	63	سيمانتك يو آي تزيد فاعلية العمل بين المصممين و المطورين من خلال مفردات ذات دلالة لفظية مشتركة لبناء واجهة المستخدم
1642	Semantic-UI-pt-br	https://github.com/Semantic-Org/Semantic-UI-pt-br	2013-12-27 10:30:11	f	63	Semantic dá poder a designers e desenvolvedores através da criação de um vocabulário comum para UI
1643	Semantic-UI-Docs	https://github.com/Semantic-Org/Semantic-UI-Docs	2014-03-14 22:44:20	f	63	Official Documentation for Semantic UI
1644	Semantic-UI-nl	https://github.com/Semantic-Org/Semantic-UI-nl	2014-06-09 21:49:35	f	63	Dutch translation of Semantic UI
1669	Modernizr	https://github.com/Modernizr/Modernizr	2009-09-25 20:13:23	f	64	Modernizr is a JavaScript library that detects HTML5 and CSS3 features in the user’s browser.
1670	the-old-modernizr.com	https://github.com/Modernizr/the-old-modernizr.com	2011-06-28 00:07:07	f	64	The old modernizr.com site (and builder)
1671	grunt-modernizr	https://github.com/Modernizr/grunt-modernizr	2012-09-09 01:08:57	f	64	Build out a lean, mean Modernizr machine.
1758	board-overlays	https://github.com/coreos/board-overlays	2013-02-28 21:40:58	f	68	\N
1759	chromite	https://github.com/coreos/chromite	2013-02-28 21:42:57	f	68	\N
1678	Ghost	https://github.com/TryGhost/Ghost	2013-05-04 11:09:13	f	65	A simple, powerful publishing platform
1679	Ghost-Vagrant	https://github.com/TryGhost/Ghost-Vagrant	2013-05-06 14:56:43	f	65	Vagrant setup for developing Ghost
1680	Casper	https://github.com/TryGhost/Casper	2013-05-10 21:38:18	f	65	The default personal blogging theme for Ghost
1681	roon-i18n	https://github.com/TryGhost/roon-i18n	2013-08-28 15:54:04	f	65	Roon Internationalization
1682	Slimer	https://github.com/TryGhost/Slimer	2013-10-31 14:32:10	f	65	A bot who lives in IRC
1684	Ghost-Config	https://github.com/TryGhost/Ghost-Config	2013-11-04 19:23:58	f	65	Cross-platform meta data and configurations
1686	Blog	https://github.com/TryGhost/Blog	2014-02-03 16:14:20	f	65	The official Ghost blog theme
1707	front-end-frameworks	https://github.com/usablica/front-end-frameworks	2012-11-25 12:21:43	f	66	A collection of best front-end frameworks for faster and easier web development.
1708	persian.js	https://github.com/usablica/persian.js	2012-12-26 13:25:43	f	66	A simple library for Persian language localization.
1710	intro.js	https://github.com/usablica/intro.js	2013-03-10 15:12:45	f	66	A better way for new feature introduction and step-by-step users guide for your website and project.
1728	discourse	https://github.com/discourse/discourse	2013-01-12 00:25:55	f	67	A platform for community discussion. Free, open, simple.
1730	wp-discourse	https://github.com/discourse/wp-discourse	2013-03-27 06:31:28	f	67	WordPress plugin that lets you use Discourse as the community engine for a WordPress blog
1732	onebox	https://github.com/discourse/onebox	2013-07-09 04:44:38	f	67	A gem for turning URLs into website previews
1733	discourse_api	https://github.com/discourse/discourse_api	2013-07-11 01:31:01	f	67	Ruby API for Discourse
1734	discourse-spoiler-alert	https://github.com/discourse/discourse-spoiler-alert	2013-09-20 21:22:27	f	67	A plugin for discourse to hide spoilers behind the spoiler-alert jQuery plugin
1735	discourse_docker	https://github.com/discourse/discourse_docker	2013-10-30 00:50:14	f	67	A Docker image for Discourse
1736	docker_manager	https://github.com/discourse/docker_manager	2013-11-13 06:43:05	f	67	plugin for use with discourse docker image
1760	coreos-overlay	https://github.com/coreos/coreos-overlay	2013-02-28 21:43:07	f	68	Custom ebuilds for CoreOS
1762	portage-stable	https://github.com/coreos/portage-stable	2013-02-28 21:43:11	f	68	unmodified ebuilds mirrored from the portage tree
1764	scripts	https://github.com/coreos/scripts	2013-02-28 21:45:57	f	68	Build and maintenance scripts for CoreOS
1765	manifest	https://github.com/coreos/manifest	2013-02-28 21:46:40	f	68	repo tool manifest for CoreOS sdk
1766	dbus-cplusplus	https://github.com/coreos/dbus-cplusplus	2013-03-04 21:14:09	f	68	DEPRECATED - Do not use
1767	update_engine	https://github.com/coreos/update_engine	2013-03-07 04:33:28	f	68	update daemon for CoreOS
1788	symfony	https://github.com/symfony/symfony	2010-01-04 14:21:21	f	69	The Symfony PHP framework
1789	symfony-docs	https://github.com/symfony/symfony-docs	2010-02-17 08:43:51	f	69	The Symfony documentation
1790	symfony1-docs	https://github.com/symfony/symfony1-docs	2010-04-02 07:25:34	f	69	Documentation for symfony 1.3/1.4
1792	yaml	https://github.com/symfony/yaml	2011-02-18 10:47:20	f	69	[READ-ONLY] Subtree split of the Symfony YAML Component
2318	gulp	https://github.com/gulpjs/gulp	2013-07-04 05:26:06	f	90	The streaming build system
1793	class-loader	https://github.com/symfony/class-loader	2011-02-22 17:56:22	f	69	[READ-ONLY] Subtree split of the Symfony ClassLoader Component
1794	browser-kit	https://github.com/symfony/browser-kit	2011-02-22 17:59:52	f	69	[READ-ONLY] Subtree split of the Symfony BrowserKit Component
1795	config	https://github.com/symfony/config	2011-02-22 18:00:14	f	69	[READ-ONLY] Subtree split of the Symfony Config Component
1796	console	https://github.com/symfony/console	2011-02-22 18:00:31	f	69	[READ-ONLY] Subtree split of the Symfony Console Component
1797	css-selector	https://github.com/symfony/css-selector	2011-02-22 18:01:24	f	69	[READ-ONLY] Subtree split of the Symfony CssSelector Component
1818	observe-js	https://github.com/Polymer/observe-js	2012-08-10 17:16:05	f	70	A library for observing Arrays, Objects and PathValues
1819	polymer	https://github.com/Polymer/polymer	2012-08-23 20:56:30	f	70	Build modern apps using web components
1820	TemplateBinding	https://github.com/Polymer/TemplateBinding	2013-01-11 20:47:53	f	70	TemplateBinding Prolyfill
1821	docs	https://github.com/Polymer/docs	2013-01-24 19:11:00	f	70	Documentation for Polymer
1822	PointerGestures	https://github.com/Polymer/PointerGestures	2013-01-25 20:04:41	f	70	An intuitive set of gestures built on PointerEvents
1823	ShadowDOM	https://github.com/Polymer/ShadowDOM	2013-02-25 22:22:34	f	70	ShadowDOM Polyfill
1824	CustomElements	https://github.com/Polymer/CustomElements	2013-02-25 22:27:50	f	70	Custom Elements Polyfill
1825	platform	https://github.com/Polymer/platform	2013-02-26 00:59:33	f	70	Integrate platform polyfills: load, build, test
1826	MutationObservers	https://github.com/Polymer/MutationObservers	2013-03-15 18:21:06	f	70	Mutation Observers Polyfill
1827	HTMLImports	https://github.com/Polymer/HTMLImports	2013-04-03 16:56:32	f	70	Polyfill implementing the HTMLImports specification
1848	home	https://github.com/dotnet/home	2014-10-30 21:16:09	f	71	This is the hub for all the projects that are part of the .NET Foundation. MD files in the projects folder feed the content on the .NET Foundation website
1849	corefx	https://github.com/dotnet/corefx	2014-11-06 23:42:48	f	71	This repo contains the .NET Core foundational libraries, called CoreFX. It includes classes for collections, file systems, console, XML, async and many others.
1850	buildtools	https://github.com/dotnet/buildtools	2014-11-06 23:43:05	f	71	Build tools that are necessary for building the .NET Core projects
1851	core	https://github.com/dotnet/core	2014-11-18 00:44:57	f	71	Home repository for .NET Core
1852	orleans	https://github.com/dotnet/orleans	2014-12-19 14:32:50	f	71	Orleans - Distributed Virtual Actor Model
1853	codeformatter	https://github.com/dotnet/codeformatter	2015-01-07 03:28:44	f	71	Tool that uses Roslyn to automatically rewrite the source to follow our coding styles
1854	apireviews	https://github.com/dotnet/apireviews	2015-01-08 01:02:57	f	71	This repository contains the notes and API differences that we reviewed.
1855	roslyn	https://github.com/dotnet/roslyn	2015-01-11 02:39:03	f	71	The .NET Compiler Platform (Roslyn) provides open-source C# and Visual Basic compilers with rich code analysis APIs.
1856	corefxlab	https://github.com/dotnet/corefxlab	2015-01-20 00:44:35	f	71	This repo is for experimentation and exploring new ideas that may or may not make it into the main corefx repo.
1857	dotnet.github.io	https://github.com/dotnet/dotnet.github.io	2015-01-23 01:54:38	f	71	The source for the dotnet.github.io site
1878	gddo	https://github.com/golang/gddo	2011-06-18 02:42:58	f	72	Go Doc Dot Org
1879	lint	https://github.com/golang/lint	2013-06-02 22:45:37	f	72	This is a linter for Go source code.
1880	glog	https://github.com/golang/glog	2013-07-16 04:33:04	f	72	Leveled execution logs for Go
1881	groupcache	https://github.com/golang/groupcache	2013-07-22 21:55:07	f	72	groupcache is a caching and cache-filling library, intended as a replacement for memcached in many cases.
1882	appengine	https://github.com/golang/appengine	2014-02-11 04:24:51	f	72	Go App Engine packages
1883	oauth2	https://github.com/golang/oauth2	2014-04-14 15:07:35	f	72	Go OAuth2
1884	example	https://github.com/golang/example	2014-07-28 01:58:44	f	72	Go example projects
1885	go	https://github.com/golang/go	2014-08-19 04:33:40	f	72	The Go programming language
1887	review	https://github.com/golang/review	2014-10-28 07:14:26	f	72	[mirror] Tool for working with Gerrit code reviews
1908	cocos2d-objc	https://github.com/cocos2d/cocos2d-objc	2010-03-31 19:07:59	f	73	Cocos2d for iOS and OS X, built using Objective-C
1909	cocos2d-x	https://github.com/cocos2d/cocos2d-x	2010-11-18 23:17:00	f	73	cocos2d-x for C++
1912	cocos2d-html5	https://github.com/cocos2d/cocos2d-html5	2012-01-20 07:31:59	f	73	cocos2d for Web Browsers. Built using JavaScript
1914	CocosBuilder	https://github.com/cocos2d/CocosBuilder	2012-03-15 18:29:28	f	73	CocosBuilder, the visual editor for cocos2d
1915	cocos2d-js-tests	https://github.com/cocos2d/cocos2d-js-tests	2012-09-06 16:24:17	f	73	cocos2d JavaScript test cases and games.
1936	appengine-guestbook-python	https://github.com/GoogleCloudPlatform/appengine-guestbook-python	2012-11-17 01:01:16	f	74	Guestbook is an example application showing basic usage of Google App Engine
1937	appengine-last-across-the-finish-line-python	https://github.com/GoogleCloudPlatform/appengine-last-across-the-finish-line-python	2012-11-19 18:10:32	f	74	Last Across the Finish Line is an example application that uses the Task Queue API to showcase a pattern for tracking asynchronous batch workers and notifying a user when all the workers have completed.
1938	appengine-guestbook-python-cloudsql	https://github.com/GoogleCloudPlatform/appengine-guestbook-python-cloudsql	2012-11-21 22:47:15	f	74	Another guestbook example with Cloud SQL as the data storage
1939	appengine-sockets-python-java-go	https://github.com/GoogleCloudPlatform/appengine-sockets-python-java-go	2012-11-26 05:01:57	f	74	Python, Go, and Java examples of using the App Engine Socket API.
1973	less-plugin-inline-urls	https://github.com/less/less-plugin-inline-urls	2013-11-17 21:27:28	f	75	\N
1941	php-docs-samples	https://github.com/GoogleCloudPlatform/php-docs-samples	2012-12-03 22:45:09	f	74	A collection of samples that demonstrate how to call Google Cloud services from PHP.
2023	sin	https://github.com/linkedin/sin	2011-07-09 19:34:29	f	78	\N
1943	prediction-try-java-python	https://github.com/GoogleCloudPlatform/prediction-try-java-python	2012-12-05 05:29:46	f	74	Sample application illustrating use of the  Google Prediction API within the Google App Engine environment
1944	storage-file-transfer-json-python	https://github.com/GoogleCloudPlatform/storage-file-transfer-json-python	2012-12-05 05:56:15	f	74	Uploads and downloads files between Google Cloud Storage and the local filesystem using the Google Python Client Library.
1966	less.ruby	https://github.com/less/less.ruby	2009-05-03 21:35:57	f	75	Less Ruby — now at http://github.com/cowboyd/less.rb
1967	more	https://github.com/less/more	2009-09-11 16:06:13	f	75	less on rails — the official LESS plugin for Ruby on Rails
1968	less.js	https://github.com/less/less.js	2010-02-20 17:25:38	f	75	Leaner CSS
1969	old-lesscss.org	https://github.com/less/old-lesscss.org	2011-02-03 18:54:05	f	75	The OLD lesscss.org. For the new one see less-docs.
1970	less-docs	https://github.com/less/less-docs	2013-06-24 17:57:02	f	75	Documentation for Less.
1974	less.github.io	https://github.com/less/less.github.io	2014-01-14 20:40:47	f	75	see https://github.com/less/less-docs
1975	less-plugin-clean-css	https://github.com/less/less-plugin-clean-css	2014-09-09 20:31:01	f	75	Post-process and compress CSS using clean-css.
1983	select2	https://github.com/select2/select2	2012-03-04 18:43:12	f	76	Select2 is a jQuery based replacement for select boxes. It supports searching, remote data sets, and infinite scrolling of results.
1986	x-editable	https://github.com/select2/x-editable	2015-06-07 20:08:02	f	76	Select2 4.0.0 compatible version of x-editable
1989	phonegap-plugins	https://github.com/phonegap/phonegap-plugins	2010-10-07 00:12:01	f	77	(DEPRECATED) Plugins for use with PhoneGap. 
1990	phonegap-start	https://github.com/phonegap/phonegap-start	2010-11-02 17:45:54	f	77	PhoneGap Hello World app
1991	ios-sim	https://github.com/phonegap/ios-sim	2010-12-17 16:17:09	f	77	Command-line application launcher for the iOS Simulator
1994	emulate.phonegap.com	https://github.com/phonegap/emulate.phonegap.com	2012-06-29 21:28:34	f	77	Ripple emulation for PhoneGap's JavaScript environment
1995	phonegap-cli	https://github.com/phonegap/phonegap-cli	2012-10-05 21:56:47	f	77	PhoneGap and PhoneGap/Build command-line interface
2017	sensei	https://github.com/linkedin/sensei	2010-02-24 00:04:42	f	78	distributed realtime searchable database
2019	linkedin-zookeeper	https://github.com/linkedin/linkedin-zookeeper	2010-11-06 00:19:28	f	78	This project provides utilities and wrappers around ZooKeeper
2025	norbert	https://github.com/linkedin/norbert	2011-09-07 06:29:32	f	78	Norbert is a cluster manager and networking layer built on top of Zookeeper.
2026	inject	https://github.com/linkedin/inject	2011-09-08 00:38:32	f	78	AMD and CJS dependency management in the browser
2049	asp.tmbundle	https://github.com/textmate/asp.tmbundle	2009-06-09 06:32:02	f	79	TextMate support for ASP
2055	apache.tmbundle	https://github.com/textmate/apache.tmbundle	2009-06-09 06:32:50	f	79	TextMate support for Apache
2077	chef	https://github.com/chef/chef	2009-01-15 20:40:48	f	80	A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.
2078	ohai	https://github.com/chef/ohai	2009-01-15 20:50:43	f	80	Ohai profiles your system and emits JSON
2079	mixlib-log	https://github.com/chef/mixlib-log	2009-03-11 20:33:49	f	80	A simple class based Log mechanism, similar to Merb and Chef, that you can mix in to your project.
2080	mixlib-config	https://github.com/chef/mixlib-config	2009-03-12 01:12:18	f	80	A simple class based Config mechanism, similar to the one found in Chef
2081	mixlib-cli	https://github.com/chef/mixlib-cli	2009-03-13 00:42:30	f	80	A mixin for creating command line applications - gives an easy DSL for argument specification and processing
2082	rest-client	https://github.com/chef/rest-client	2009-03-16 20:07:25	f	80	Simple REST client for Ruby, inspired by microframework syntax for specifying actions.
2083	mixlib-authentication	https://github.com/chef/mixlib-authentication	2009-08-06 17:31:19	f	80	AuthN signing and verification.  Appears in both the client and server
2084	mixlib-authorization	https://github.com/chef/mixlib-authorization	2009-08-06 17:33:37	f	80	Server side AuthZ.  Private to our implementation
2085	aws-s3	https://github.com/chef/aws-s3	2010-04-29 19:02:22	f	80	AWS-S3 is a Ruby implementation of Amazon's S3 REST API
2086	opscode-expander	https://github.com/chef/opscode-expander	2010-09-03 18:50:29	f	80	Parallelized Chef-Solr-Indexer implementation
2114	sails	https://github.com/balderdashy/sails	2012-03-18 19:46:15	f	81	Realtime MVC Framework for Node.js
2115	mast	https://github.com/balderdashy/mast	2012-05-07 16:35:07	f	81	UI conventions built on top of Backbone.JS
2210	amqp_in_irb	https://github.com/heroku/amqp_in_irb	2010-07-15 05:53:46	f	85	Connects to an AMQP server with the AMQP gem and then opens an IRB console.
2137	rust	https://github.com/rust-lang/rust	2010-06-16 20:39:03	f	82	A safe, concurrent, practical language.
2138	rust-www	https://github.com/rust-lang/rust-www	2011-08-31 16:42:32	f	82	The Rust website
2139	rust-playpen	https://github.com/rust-lang/rust-playpen	2013-08-15 03:40:58	f	82	A web interface for running Rust code
2140	sublime-rust	https://github.com/rust-lang/sublime-rust	2014-01-08 16:35:35	f	82	The official Sublime Text 3 package for the Rust Programming Language
2141	libuv	https://github.com/rust-lang/libuv	2014-01-10 04:18:53	f	82	Clone of libuv for rust
2143	llvm	https://github.com/rust-lang/llvm	2014-01-10 04:20:15	f	82	Temporary fork of LLVM for Rust
2144	compiler-rt	https://github.com/rust-lang/compiler-rt	2014-02-11 23:14:14	f	82	Mirror of official compiler-rt git repository located at http://llvm.org/git/compiler-rt.  Updated hourly.
2145	cargo	https://github.com/rust-lang/cargo	2014-03-04 23:20:42	f	82	The Rust package manager
2146	rfcs	https://github.com/rust-lang/rfcs	2014-03-07 21:29:00	f	82	RFCs for changes to Rust
2168	WindowsAzureToolkitForEclipseWithJava	https://github.com/Microsoft/WindowsAzureToolkitForEclipseWithJava	2012-08-28 18:33:11	f	83	Windows Azure Toolkit for Eclipse with Java
2169	filter-explorer	https://github.com/Microsoft/filter-explorer	2013-07-24 13:36:42	f	83	Filter Explorer is an example application which demonstrates some of the image editing capabilities and performance of the Imaging SDK by allowing the user to apply a number of filter layers to existing or newly captured photos.
2170	filter-effects	https://github.com/Microsoft/filter-effects	2013-07-29 08:30:45	f	83	An example application demonstrating the use of the different filters of Imaging SDK with camera photos. This example app uses the camera and displays the viewfinder for taking a picture. The taken photo is then processed with the predefined filters. The filter properties can be manipulated and the changes can be seen in the preview image immediately. The processed image can be saved in JPEG format to the device. You can also select an existing photo and apply an effect to it.
2171	real-time-filter-demo	https://github.com/Microsoft/real-time-filter-demo	2013-07-29 08:36:12	f	83	An example application demonstrating the use of the Imaging SDK for real-time image effects. The effects are applied to the stream received from the camera and shown in the viewfinder. This app does not support capturing photos.
2172	photo-inspector	https://github.com/Microsoft/photo-inspector	2013-07-29 08:47:31	f	83	Photo Inspector is an example application on how to capture and process high resolution photos (resolution depends on device hardware).
2173	camera-explorer	https://github.com/Microsoft/camera-explorer	2013-07-29 08:51:40	f	83	Camera Explorer application for Windows Phone 8 demonstrates the use of the new advanced Windows Phone 8 camera API, the Windows.Phone.Media.Capture.PhotoCaptureDevice and the related classes and enumerations on Lumia devices.
2174	map-explorer	https://github.com/Microsoft/map-explorer	2013-07-29 09:02:19	f	83	Map Explorer is an example application demonstrating how to use the new Windows Phone 8 Maps API replacing the Bing Maps used in Windows Phone 7.x.
2175	music-explorer	https://github.com/Microsoft/music-explorer	2013-07-29 09:05:41	f	83	Music Explorer is an example application demonstrating the use of Nokia Music API together with standard Windows Phone 8 audio features to create an immersive music experience.
2205	heroku-nav	https://github.com/heroku/heroku-nav	2010-02-25 06:09:32	f	85	\N
2197	registry	https://github.com/bower/registry	2012-09-07 00:00:44	f	84	The Bower registry
2198	bower	https://github.com/bower/bower	2012-09-07 00:15:39	f	84	A package manager for the web
2199	bower.github.io	https://github.com/bower/bower.github.io	2013-04-19 19:38:39	f	84	The Bower website
2200	decompress-zip	https://github.com/bower/decompress-zip	2013-08-15 20:08:55	f	84	Module that decompresses zip files
2201	spec	https://github.com/bower/spec	2013-10-23 14:48:35	f	84	bower.json and .bowerrc specification
2202	heroku	https://github.com/heroku/heroku	2009-03-18 01:21:53	f	85	Heroku CLI
2279	homebrew-neovim	https://github.com/neovim/homebrew-neovim	2014-11-06 06:49:53	f	88	\N
2204	heroku-deploy-rails	https://github.com/heroku/heroku-deploy-rails	2010-01-12 21:37:00	f	85	Heroku plugin to combine common deployment tasks
2206	kensa	https://github.com/heroku/kensa	2010-04-05 23:08:10	f	85	A tool to help Heroku add-on providers integrate their services with Heroku
2207	judo	https://github.com/heroku/judo	2010-06-12 01:42:27	f	85	A tool for sparing with EC2
2208	kuzushi	https://github.com/heroku/kuzushi	2010-06-12 01:43:17	f	85	A tool used by the sumo gem for performing instance setup and management in AWS
2211	heroku-postgresql	https://github.com/heroku/heroku-postgresql	2010-07-27 23:52:22	f	85	Heroku client plugin for the heroku-postgresql addon
2232	todomvc	https://github.com/tastejs/todomvc	2011-06-03 19:56:33	f	86	Helping you select an MV* framework - Todo apps for Backbone.js, Ember.js, AngularJS, and many more
2234	PropertyCross	https://github.com/tastejs/PropertyCross	2012-09-27 12:41:22	f	86	Helping developers select a framework for cross-platform mobile development.
2237	todomvc-common	https://github.com/tastejs/todomvc-common	2013-03-09 15:11:26	f	86	Common TodoMVC utilities used in every app
2240	todomvc-backbone-es6	https://github.com/tastejs/todomvc-backbone-es6	2013-07-22 14:25:48	f	86	Backbone TodoMVC rewritten using ES6
2241	todomvc-app-template	https://github.com/tastejs/todomvc-app-template	2014-01-25 21:55:37	f	86	Template used for creating TodoMVC apps
2247	papers-we-love	https://github.com/papers-we-love/papers-we-love	2013-12-15 14:31:41	f	87	Papers from the computer science community to read and discuss.
2248	papers-we-love.github.io	https://github.com/papers-we-love/papers-we-love.github.io	2014-02-28 23:00:59	f	87	Official Papers We Love site
2250	organizers	https://github.com/papers-we-love/organizers	2015-10-25 20:18:44	f	87	Materials for starting a local Papers We Love chapter
2251	boston	https://github.com/papers-we-love/boston	2015-10-27 11:00:13	f	87	Papers We :heart: Boston
2252	nashville	https://github.com/papers-we-love/nashville	2015-11-05 00:31:48	f	87	Papers We :heart: Nashville
2253	local-chapter-template	https://github.com/papers-we-love/local-chapter-template	2015-11-07 14:15:56	f	87	Template for local chapter repos
2254	kathmandu	https://github.com/papers-we-love/kathmandu	2015-11-07 14:20:42	f	87	Papers We :heart: Kathmandu
2255	iasi	https://github.com/papers-we-love/iasi	2015-11-19 13:03:52	f	87	Papers We :heart: Iasi
2256	warsaw	https://github.com/papers-we-love/warsaw	2015-11-28 16:44:29	f	87	Papers We :heart: Warsaw
2272	neovim	https://github.com/neovim/neovim	2014-01-31 13:39:22	f	88	Vim-fork focused on extensibility and agility.
2273	neovim.github.io	https://github.com/neovim/neovim.github.io	2014-02-22 05:18:52	f	88	Website
2274	python-client	https://github.com/neovim/python-client	2014-05-07 20:13:49	f	88	Python client for Neovim
2275	doc	https://github.com/neovim/doc	2014-06-26 20:47:35	f	88	Generated documentation and reports
2276	deps	https://github.com/neovim/deps	2014-06-30 21:10:43	f	88	Dependencies for Neovim CI
2277	bot-ci	https://github.com/neovim/bot-ci	2014-07-10 13:41:48	f	88	Automation
2278	lua-client	https://github.com/neovim/lua-client	2014-08-29 06:29:27	f	88	Lua client for Neovim
2289	zxcvbn	https://github.com/dropbox/zxcvbn	2012-02-28 03:25:54	f	89	A realistic password strength estimator.
2290	nautilus-dropbox	https://github.com/dropbox/nautilus-dropbox	2012-03-20 18:13:48	f	89	Dropbox Integration for Nautilus
2291	dropbox-js	https://github.com/dropbox/dropbox-js	2012-07-16 11:13:12	f	89	Deprecated JS library for API v1. Use our v2 SDK instead:
2293	pygerduty	https://github.com/dropbox/pygerduty	2012-12-12 22:53:08	f	89	A Python library for PagerDuty.
2294	dropbox-sdk-php	https://github.com/dropbox/dropbox-sdk-php	2013-02-16 01:04:38	f	89	A PHP library for the Dropbox Core API.
2295	pyxl	https://github.com/dropbox/pyxl	2013-02-24 00:13:50	f	89	A Python extension for writing structured and reusable inline HTML.
2297	dropbox-sdk-java	https://github.com/dropbox/dropbox-sdk-java	2013-06-27 00:32:18	f	89	A Java library for the Dropbox Core API.
2319	glob-stream	https://github.com/gulpjs/glob-stream	2013-07-04 08:29:48	f	90	File system globs as a stream
2320	gulp-util	https://github.com/gulpjs/gulp-util	2013-07-06 07:35:39	f	90	Utilities for gulp plugins
2378	shadowsocks	https://github.com/shadowsocks/shadowsocks	2012-04-20 13:10:49	f	92	\N
2322	glob-watcher	https://github.com/gulpjs/glob-watcher	2013-12-20 21:20:48	f	90	Watch globs for changes
2323	vinyl	https://github.com/gulpjs/vinyl	2013-12-20 22:26:37	f	90	Virtual file format.
2324	vinyl-fs	https://github.com/gulpjs/vinyl-fs	2013-12-21 06:40:44	f	90	Vinyl adapter for the file system.
2325	gulpjs.github.io	https://github.com/gulpjs/gulpjs.github.io	2013-12-22 23:23:20	f	90	The gulp website
2379	shadowsocks-nodejs	https://github.com/shadowsocks/shadowsocks-nodejs	2012-05-18 07:25:27	f	92	\N
2353	maven-hudson-dev-plugin	https://github.com/jenkinsci/maven-hudson-dev-plugin	2010-02-03 01:52:59	f	91	Patched maven-jetty-plugin used in Jenkins
2380	shadowsocks-dotcloud	https://github.com/shadowsocks/shadowsocks-dotcloud	2012-09-25 09:23:40	f	92	a port of shadowsocks via websockets protocol, able to tunnel through HTTP proxy
2381	shadowsocks-go	https://github.com/shadowsocks/shadowsocks-go	2012-11-01 08:43:38	f	92	go port of shadowsocks
2382	shadowsocks-libev	https://github.com/shadowsocks/shadowsocks-libev	2012-12-15 08:11:07	f	92	libev port of shadowsocks
2383	shadowsocks-android	https://github.com/shadowsocks/shadowsocks-android	2012-12-16 13:40:29	f	92	A shadowsocks client for Android
2384	shadowsocks-iOS	https://github.com/shadowsocks/shadowsocks-iOS	2012-12-27 09:23:49	f	92	Removed according to regulations.
2385	shadowsocks-windows	https://github.com/shadowsocks/shadowsocks-windows	2013-01-14 07:54:16	f	92	If you want to keep a secret, you must also hide it from yourself.
2386	shadowsocks-chromeapp	https://github.com/shadowsocks/shadowsocks-chromeapp	2013-01-19 11:10:41	f	92	Chrome client for shadowsocks
2387	shadowsocks-gui	https://github.com/shadowsocks/shadowsocks-gui	2013-05-28 08:52:33	f	92	Shadowsocks GUI client
2408	Leaflet	https://github.com/Leaflet/Leaflet	2010-09-22 16:57:44	f	93	 :leaves: JavaScript library for mobile-friendly interactive maps
2409	Leaflet.draw	https://github.com/Leaflet/Leaflet.draw	2012-06-05 04:57:52	f	93	Vector drawing and editing plugin for Leaflet
2410	Leaflet.markercluster	https://github.com/Leaflet/Leaflet.markercluster	2012-07-11 01:54:39	f	93	Marker Clustering plugin for Leaflet
2411	Leaflet.label	https://github.com/Leaflet/Leaflet.label	2012-09-24 01:16:29	f	93	Leaflet.label is plugin for adding labels to markers & shapes on leaflet powered maps.
2412	Leaflet.fullscreen	https://github.com/Leaflet/Leaflet.fullscreen	2013-02-21 23:24:42	f	93	A fullscreen control for Leaflet
2413	Leaflet.heat	https://github.com/Leaflet/Leaflet.heat	2014-01-31 13:34:50	f	93	A tiny, simple and fast heatmap plugin for Leaflet.
2414	Leaflet.Editable	https://github.com/Leaflet/Leaflet.Editable	2014-08-01 13:03:41	f	93	Make geometries editable in Leaflet.
2415	Leaflet.toolbar	https://github.com/Leaflet/Leaflet.toolbar	2014-09-22 22:36:34	f	93	Flexible, extensible toolbars for Leaflet maps.
2417	playground	https://github.com/Leaflet/playground	2015-08-31 12:35:46	f	93	A trivial fork of jsbin, rebranding it for LeafletJS.
2424	html-to-markdown	https://github.com/thephpleague/html-to-markdown	2011-10-21 13:38:37	f	94	Convert HTML to Markdown with PHP
2425	oauth2-server	https://github.com/thephpleague/oauth2-server	2012-06-04 20:00:52	f	94	A spec compliant, secure by default PHP OAuth 2.0 Server
2426	omnipay	https://github.com/thephpleague/omnipay	2012-09-03 14:35:08	f	94	A framework agnostic, multi-gateway payment processing library for PHP 5.3+
2428	oauth2-client	https://github.com/thephpleague/oauth2-client	2013-01-29 16:01:42	f	94	Easy integration with OAuth 2.0 service providers.
2429	factory-muffin	https://github.com/thephpleague/factory-muffin	2013-01-31 04:51:12	f	94	Enables the rapid creation of objects for testing
2430	geotools	https://github.com/thephpleague/geotools	2013-02-06 20:42:40	f	94	Geo-related tools PHP 5.4+ library built atop Geocoder and React libraries
2433	statsd	https://github.com/thephpleague/statsd	2013-06-13 09:56:15	f	94	A library for working with StatsD
2454	ansible	https://github.com/ansible/ansible	2012-03-06 14:58:02	f	95	Ansible is a radically simple IT automation platform that makes your applications and systems easier to deploy. Avoid writing scripts or custom code to deploy and update your applications— automate in a language that approaches plain English, using SSH, with no agents to install on remote systems.
2455	ansible.github.com	https://github.com/ansible/ansible.github.com	2012-03-06 23:55:24	f	95	nothing to see here, this just makes ansible.github.com/io a redirect to the main project page
2456	ansible-examples	https://github.com/ansible/ansible-examples	2013-03-18 14:15:50	f	95	A few starter examples of ansible playbooks, to show features and how they work together.  See http://galaxy.ansible.com for example roles from the Ansible community for deploying many popular applications.
2516	at-spi-sharp	https://github.com/mono/at-spi-sharp	2010-07-22 15:23:15	f	97	\N
2458	tower-cli	https://github.com/ansible/tower-cli	2013-08-24 15:19:04	f	95	Command line tool and client library for Ansible Tower's REST API
2484	puppetlabs-nodes	https://github.com/puppetlabs/puppetlabs-nodes	2010-04-16 13:17:58	f	96	A module that models nodes as resources on other nodes.
2485	puppetlabs-concat	https://github.com/puppetlabs/puppetlabs-concat	2010-05-06 21:49:50	f	96	File concatenation system for Puppet
2486	puppet-module-tool	https://github.com/puppetlabs/puppet-module-tool	2010-05-18 20:29:37	f	96	DEPRECATED: the tool has been moved into core as of Puppet 2.7.12 and will no longer be maintained here. Raise bugs for the new tool in the project below under the category 'module tool'.
2488	puppet-acceptance	https://github.com/puppetlabs/puppet-acceptance	2010-07-20 03:38:47	f	96	This project facilitates acceptance testing of puppet.
2490	puppetlabs-apache	https://github.com/puppetlabs/puppetlabs-apache	2010-09-01 22:00:16	f	96	Puppet module for the Apache httpd server, maintained by Puppet, Inc. 
2491	puppet	https://github.com/puppetlabs/puppet	2010-09-14 19:26:44	f	96	Server automation framework and application
2492	puppet-docs	https://github.com/puppetlabs/puppet-docs	2010-09-14 19:30:19	f	96	Curated Puppet Documentation
2493	puppetlabs-vcsrepo	https://github.com/puppetlabs/puppetlabs-vcsrepo	2010-09-14 19:30:52	f	96	Support for source control repositories
2519	cecil-old	https://github.com/mono/cecil-old	2010-07-22 15:27:57	f	97	ECMA CIL Manipulation Library
2545	expresso	https://github.com/visionmedia/expresso	2010-05-28 17:04:04	f	98	use mocha
2547	superagent	https://github.com/visionmedia/superagent	2011-04-13 02:29:45	f	98	Ajax with less suck - (and node.js HTTP client to match)
2548	node-progress	https://github.com/visionmedia/node-progress	2011-04-21 01:09:35	f	98	Flexible ascii progress bar for nodejs
2549	move.js	https://github.com/visionmedia/move.js	2011-05-23 04:57:12	f	98	CSS3 backed JavaScript animation framework
2551	uikit	https://github.com/visionmedia/uikit	2011-10-09 22:48:32	f	98	UIKit - modern ui components for the modern web
2552	debug	https://github.com/visionmedia/debug	2011-11-29 02:23:54	f	98	tiny node.js & browser debugging utility for your libraries and applications
2562	heroics	https://github.com/interagent/heroics	2013-07-31 21:21:19	f	99	Ruby HTTP client for APIs represented with JSON schema
2563	committee	https://github.com/interagent/committee	2013-11-05 07:05:45	f	99	A collection of Rack middleware to support JSON Schema.
2564	prmd	https://github.com/interagent/prmd	2013-12-19 17:45:58	f	99	JSON Schema tools and doc generation for HTTP APIs
2565	schematic	https://github.com/interagent/schematic	2014-02-25 03:57:09	f	99	A Go point of view on JSON Schema
2566	pliny-template	https://github.com/interagent/pliny-template	2014-03-26 17:40:28	f	99	Base Sinatra app for writing excellent APIs in Ruby
2567	pliny	https://github.com/interagent/pliny	2014-04-24 07:22:09	f	99	An opinionated toolkit for writing excellent APIs in Ruby.
2568	http-api-design	https://github.com/interagent/http-api-design	2014-05-07 17:00:37	f	99	HTTP API design guide extracted from work on the Heroku Platform API
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('projects_id_seq', 1, false);


--
-- Name: companies_name_key; Type: CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_name_key UNIQUE (name);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY contributors
    ADD CONSTRAINT contributors_pkey PRIMARY KEY (id);


--
-- Name: languages_name_key; Type: CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_name_key UNIQUE (name);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: paradigms_name_key; Type: CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY paradigms
    ADD CONSTRAINT paradigms_name_key UNIQUE (name);


--
-- Name: paradigms_pkey; Type: CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY paradigms
    ADD CONSTRAINT paradigms_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: company_membership_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY company_membership
    ADD CONSTRAINT company_membership_company_id_fkey FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE;


--
-- Name: company_membership_contributor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY company_membership
    ADD CONSTRAINT company_membership_contributor_id_fkey FOREIGN KEY (contributor_id) REFERENCES contributors(id) ON DELETE CASCADE;


--
-- Name: language_usage_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY language_usage
    ADD CONSTRAINT language_usage_language_id_fkey FOREIGN KEY (language_id) REFERENCES languages(id) ON DELETE CASCADE;


--
-- Name: language_usage_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY language_usage
    ADD CONSTRAINT language_usage_project_id_fkey FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE;


--
-- Name: paradigms_used_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY paradigms_used
    ADD CONSTRAINT paradigms_used_language_id_fkey FOREIGN KEY (language_id) REFERENCES languages(id) ON DELETE CASCADE;


--
-- Name: paradigms_used_paradigm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY paradigms_used
    ADD CONSTRAINT paradigms_used_paradigm_id_fkey FOREIGN KEY (paradigm_id) REFERENCES paradigms(id);


--
-- Name: project_participation_contributor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY project_participation
    ADD CONSTRAINT project_participation_contributor_id_fkey FOREIGN KEY (contributor_id) REFERENCES contributors(id) ON DELETE CASCADE;


--
-- Name: project_participation_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY project_participation
    ADD CONSTRAINT project_participation_project_id_fkey FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE;


--
-- Name: projects_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES companies(id) ON DELETE CASCADE;


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

