--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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
-- Name: dept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept (
    deptno numeric(2,0) NOT NULL,
    dname character varying(50) NOT NULL,
    location character varying(50) NOT NULL
);


ALTER TABLE public.dept OWNER TO postgres;

--
-- Name: emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emp (
    empno numeric(4,0) NOT NULL,
    ename character varying(50) NOT NULL,
    job character varying(50) NOT NULL,
    mgr numeric(4,0),
    hiredate date,
    sal numeric(10,2),
    comm numeric(10,2),
    deptno numeric(2,0) NOT NULL
);


ALTER TABLE public.emp OWNER TO postgres;

--
-- Name: salgrade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salgrade (
    grade numeric(4,0) NOT NULL,
    losal numeric(10,2),
    hisal numeric(10,2)
);


ALTER TABLE public.salgrade OWNER TO postgres;

--
-- Data for Name: dept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dept (deptno, dname, location) FROM stdin;
10	Accounting	New York
20	Research	Dallas
30	Sales	Chicago
40	Operations	Boston
\.


--
-- Data for Name: emp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) FROM stdin;
7839	KING	PRESIDENT	\N	1990-06-09	5000.00	0.00	10
7566	JONES	MANAGER	7839	1995-10-31	2975.00	\N	20
7698	BLAKE	MANAGER	7839	1992-06-11	2850.00	\N	30
7782	CLARK	MANAGER	7839	1993-05-14	2450.00	\N	10
7499	ALLEN	SALESMAN	7698	1998-08-15	1600.00	300.00	30
7521	WARD	SALESMAN	7698	1996-03-26	1250.00	500.00	30
7788	SCOTT	ANALYST	7566	1996-03-05	3000.00	\N	20
7844	TURNER	SALESMAN	7698	1995-06-04	1500.00	0.00	30
7876	ADAMS	CLERK	7788	1999-06-04	1100.00	\N	20
7900	JAMES	CLERK	7698	2000-06-23	950.00	\N	30
7934	MILLER	CLERK	7782	2001-01-21	1300.00	\N	10
7902	FORD	ANALYST	7566	1997-12-05	3000.00	\N	20
7369	SMITH	CLERK	7902	1993-06-13	800.00	0.00	20
7654	MARTIN	SALESMAN	7698	1995-12-05	1250.00	1400.00	30
\.


--
-- Data for Name: salgrade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salgrade (grade, losal, hisal) FROM stdin;
\.


--
-- Name: dept dept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept
    ADD CONSTRAINT dept_pkey PRIMARY KEY (deptno);


--
-- Name: emp emp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_pkey PRIMARY KEY (empno);


--
-- Name: salgrade salgrade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salgrade
    ADD CONSTRAINT salgrade_pkey PRIMARY KEY (grade);


--
-- Name: emp emp_deptno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_deptno_fkey FOREIGN KEY (deptno) REFERENCES public.dept(deptno);


--
-- Name: emp emp_mgr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_mgr_fkey FOREIGN KEY (mgr) REFERENCES public.emp(empno);


--
-- PostgreSQL database dump complete
--

