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
1	Google		https://github.com/google	https://avatars.githubusercontent.com/u/1342004?v=3	
2	Facebook		https://github.com/facebook	https://avatars.githubusercontent.com/u/69631?v=3	We work hard to contribute our work back to the web, mobile, big data, & infrastructure communities. NB: members must have two-factor auth.
3	Microsoft	opensource@microsoft.com	https://github.com/microsoft	https://avatars.githubusercontent.com/u/6154722?v=3	Open source, from Microsoft with love
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('companies_id_seq', 3, true);


--
-- Data for Name: company_membership; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY company_membership (company_id, contributor_id) FROM stdin;
\.


--
-- Data for Name: contributors; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY contributors (id, username, email, url, avatar_url, location) FROM stdin;
1	haberman	jhaberman@gmail.com	https://github.com/haberman	https://avatars.githubusercontent.com/u/1270?v=3	Seattle, WA
2	modocache	modocache@gmail.com	https://github.com/modocache	https://avatars.githubusercontent.com/u/552921?v=3	Brooklyn, NY
3	tompaana	\N	https://github.com/tompaana	https://avatars.githubusercontent.com/u/1629215?v=3	Tampere, Finland
\.


--
-- Name: contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('contributors_id_seq', 3, true);


--
-- Data for Name: language_usage; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY language_usage (language_id, project_id) FROM stdin;
3	3
7	3
4	1
5	1
6	1
1	1
1	2
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY languages (id, name, creator, type, "firstAppeared", description) FROM stdin;
1	python	Guido van Rossum	Interpreted	1991	Python is a widely used high-level, general-purpose, interpreted, dynamic programming language. Its design philosophy emphasizes code readability, and its syntax allows programmers to express concepts in fewer lines of code than possible in languages such as C++ or Java. The language provides constructs intended to enable writing clear programs on both a small and large scale.
2	java	James Gosling	Compiled	1995	Java is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible. It is intended to let application developers "write once, run anywhere" (WORA), meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.
3	javascript	Brendan Eich	Interpreted	1995	JavaScript is a high-level, dynamic, untyped, and interpreted programming language. It has been standardized in the ECMAScript language specification. Alongside HTML and CSS, it is one of the three core technologies of World Wide Web content production; the majority of websites employ it and it is supported by all modern Web browsers without plug-ins.
4	c	Dennis Ritchie	Compiled	1972	C is a general-purpose, imperative computer programming language, supporting structured programming, lexical variable scope and recursion, while a static type system prevents many unintended operations. By design, C provides constructs that map efficiently to typical machine instructions, and therefore it has found lasting use in applications that had formerly been coded in assembly language, including operating systems, as well as various application software for computers ranging from supercomputers to embedded systems.
5	c++	Bjarne Stroustrup	Compiled	1983	C++ is a general-purpose programming language. It has imperative, object-oriented and generic programming features, while also providing facilities for low-level memory manipulation. It was designed with a bias toward system programming and embedded, resource-constrained and large systems, with performance, efficiency and flexibility of use as its design highlights. C++ has also been found useful in many other contexts, with key strengths being software infrastructure and resource-constrained applications, including desktop applications, servers, and performance-critical applications.
6	ruby	Yukihiro Matsumoto	Interpreted	1995	Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro "Matz" Matsumoto in Japan. According to its creator, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, including functional, object-oriented, and imperative. It also has a dynamic type system and automatic memory management.
7	c#	Microsoft	Compiled	2000	C# is a multi-paradigm programming language encompassing strong typing, imperative, declarative, functional, generic, object-oriented , and component-oriented programming disciplines. It was developed by Microsoft within its .NET initiative and later approved as a standard by Ecma (ECMA-334) and ISO (ISO/IEC 23270:2006). C# is one of the programming languages designed for the Common Language Infrastructure.
\.


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('languages_id_seq', 7, true);


--
-- Data for Name: paradigms; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY paradigms (id, name) FROM stdin;
4	Object Oriented
5	Functional
6	Imperative
\.


--
-- Name: paradigms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('paradigms_id_seq', 6, true);


--
-- Data for Name: paradigms_used; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY paradigms_used (language_id, paradigm_id) FROM stdin;
2	4
1	4
1	5
3	5
3	6
3	4
5	5
4	6
5	6
5	4
2	6
6	6
6	4
6	5
7	5
7	6
7	4
\.


--
-- Data for Name: project_participation; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY project_participation (contributor_id, project_id) FROM stdin;
1	1
2	2
3	3
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: brianb
--

COPY projects (id, name, url, "createdDate", private, owner_id, description) FROM stdin;
1	upb	https://github.com/google/upb	2009-05-09 02:38:42	f	1	small, fast parsers for the 21st century
2	codemod	https://github.com/facebook/codemod	2009-04-02 04:51:54	f	2	Codemod is a tool/library to assist you with large-scale codebase refactors that can be partially automated but still require human oversight and occasional intervention. Codemod was developed at Facebook and released as open source.
3	protractor	https://github.com/Microsoft/protractor	2013-10-25 12:35:40	f	3	HTML5 application for Windows Phone that allows the screen to be used as protractor/ruler to measure lengths and angles.
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brianb
--

SELECT pg_catalog.setval('projects_id_seq', 3, true);


--
-- Name: companies_description_key; Type: CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_description_key UNIQUE (description);


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
    ADD CONSTRAINT company_membership_company_id_fkey FOREIGN KEY (company_id) REFERENCES companies(id);


--
-- Name: company_membership_contributor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY company_membership
    ADD CONSTRAINT company_membership_contributor_id_fkey FOREIGN KEY (contributor_id) REFERENCES contributors(id);


--
-- Name: language_usage_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY language_usage
    ADD CONSTRAINT language_usage_language_id_fkey FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: language_usage_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY language_usage
    ADD CONSTRAINT language_usage_project_id_fkey FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: paradigms_used_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY paradigms_used
    ADD CONSTRAINT paradigms_used_language_id_fkey FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: paradigms_used_paradigm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY paradigms_used
    ADD CONSTRAINT paradigms_used_paradigm_id_fkey FOREIGN KEY (paradigm_id) REFERENCES paradigms(id);


--
-- Name: project_participation_contributor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY project_participation
    ADD CONSTRAINT project_participation_contributor_id_fkey FOREIGN KEY (contributor_id) REFERENCES contributors(id);


--
-- Name: project_participation_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY project_participation
    ADD CONSTRAINT project_participation_project_id_fkey FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: projects_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brianb
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES companies(id);


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

