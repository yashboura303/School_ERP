--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.accounts_userprofile (
    id integer NOT NULL,
    user_type character varying(20) NOT NULL,
    mobile_no bigint NOT NULL,
    user_id integer NOT NULL,
    image character varying(100) NOT NULL,
    "fullName" character varying(50) NOT NULL
);


ALTER TABLE public.accounts_userprofile OWNER TO myprojectuser;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.accounts_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO myprojectuser;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.accounts_userprofile_id_seq OWNED BY public.accounts_userprofile.id;


--
-- Name: attendence_studentattendence; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.attendence_studentattendence (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    date date NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.attendence_studentattendence OWNER TO myprojectuser;

--
-- Name: attendence_studentattendence_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.attendence_studentattendence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendence_studentattendence_id_seq OWNER TO myprojectuser;

--
-- Name: attendence_studentattendence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.attendence_studentattendence_id_seq OWNED BY public.attendence_studentattendence.id;


--
-- Name: attendence_teacherattendence; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.attendence_teacherattendence (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    date date NOT NULL,
    teacher_id integer NOT NULL,
    available_casual_leave integer NOT NULL,
    available_sick_leave integer NOT NULL,
    taken_casual_leave integer NOT NULL,
    taken_sick_leave integer NOT NULL,
    total_no_of_days_present integer NOT NULL
);


ALTER TABLE public.attendence_teacherattendence OWNER TO myprojectuser;

--
-- Name: attendence_teacherattendence_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.attendence_teacherattendence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendence_teacherattendence_id_seq OWNER TO myprojectuser;

--
-- Name: attendence_teacherattendence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.attendence_teacherattendence_id_seq OWNED BY public.attendence_teacherattendence.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO myprojectuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO myprojectuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO myprojectuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO myprojectuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO myprojectuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO myprojectuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: myprojectuser
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


ALTER TABLE public.auth_user OWNER TO myprojectuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO myprojectuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO myprojectuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: classform_classroom; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_classroom (
    id integer NOT NULL,
    "classSection" character varying(50) NOT NULL,
    teacher_id integer NOT NULL
);


ALTER TABLE public.classform_classroom OWNER TO myprojectuser;

--
-- Name: classform_classroom_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_classroom_id_seq OWNER TO myprojectuser;

--
-- Name: classform_classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_classroom_id_seq OWNED BY public.classform_classroom.id;


--
-- Name: classform_classroomstudent; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_classroomstudent (
    id integer NOT NULL,
    roll_number integer NOT NULL,
    "classRoom_id" integer NOT NULL,
    student_id bigint NOT NULL
);


ALTER TABLE public.classform_classroomstudent OWNER TO myprojectuser;

--
-- Name: classform_classroomstudent_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_classroomstudent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_classroomstudent_id_seq OWNER TO myprojectuser;

--
-- Name: classform_classroomstudent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_classroomstudent_id_seq OWNED BY public.classform_classroomstudent.id;


--
-- Name: dailythought_thoughts; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.dailythought_thoughts (
    id integer NOT NULL,
    thought text NOT NULL,
    "timestamp" date NOT NULL
);


ALTER TABLE public.dailythought_thoughts OWNER TO myprojectuser;

--
-- Name: dailythought_thoughts_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.dailythought_thoughts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dailythought_thoughts_id_seq OWNER TO myprojectuser;

--
-- Name: dailythought_thoughts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.dailythought_thoughts_id_seq OWNED BY public.dailythought_thoughts.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: myprojectuser
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


ALTER TABLE public.django_admin_log OWNER TO myprojectuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO myprojectuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO myprojectuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO myprojectuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO myprojectuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO myprojectuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO myprojectuser;

--
-- Name: employeeform_currentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_currentaddress (
    employee_id integer NOT NULL,
    "Address" character varying(100) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL,
    "zipCode" bigint NOT NULL,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL
);


ALTER TABLE public.employeeform_currentaddress OWNER TO myprojectuser;

--
-- Name: employeeform_employee; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_employee (
    "empID" integer NOT NULL,
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    "fullName" character varying(50) NOT NULL,
    father_name character varying(50) NOT NULL,
    mother_name character varying(50) NOT NULL,
    "partnerName" character varying(50) NOT NULL,
    gender character varying(20) NOT NULL,
    email character varying(40) NOT NULL,
    "currentAddress" character varying(100) NOT NULL,
    "permanentAddress" character varying(100) NOT NULL,
    dob date,
    "joiningDate" date,
    "bloodGroup" character varying(20) NOT NULL,
    mobile_number bigint NOT NULL,
    marital_status character varying(20) NOT NULL,
    experience character varying(20) NOT NULL,
    "aadharNumber" bigint NOT NULL,
    "empCategory" character varying(20) NOT NULL
);


ALTER TABLE public.employeeform_employee OWNER TO myprojectuser;

--
-- Name: employeeform_employeedocuments; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_employeedocuments (
    employee_id integer NOT NULL,
    photo character varying(100) NOT NULL,
    "qualificationDoc" character varying(100) NOT NULL,
    "IdProof" character varying(100) NOT NULL,
    "addressProof" character varying(100) NOT NULL,
    "otherDoc" character varying(100) NOT NULL
);


ALTER TABLE public.employeeform_employeedocuments OWNER TO myprojectuser;

--
-- Name: employeeform_permanentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_permanentaddress (
    employee_id integer NOT NULL,
    "Address" character varying(100) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL,
    "zipCode" bigint NOT NULL,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL
);


ALTER TABLE public.employeeform_permanentaddress OWNER TO myprojectuser;

--
-- Name: employeeform_teacher; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_teacher (
    employee_id integer NOT NULL,
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    "fullName" character varying(50) NOT NULL,
    specialization character varying(50) NOT NULL,
    designation character varying(50) NOT NULL,
    "classTeacher" character varying(50) NOT NULL
);


ALTER TABLE public.employeeform_teacher OWNER TO myprojectuser;

--
-- Name: fees_classsectionfees; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_classsectionfees (
    id integer NOT NULL,
    fees integer NOT NULL,
    "classSection_id" integer NOT NULL,
    "feeCategory_id" integer NOT NULL
);


ALTER TABLE public.fees_classsectionfees OWNER TO myprojectuser;

--
-- Name: fees_classsectionfees_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_classsectionfees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_classsectionfees_id_seq OWNER TO myprojectuser;

--
-- Name: fees_classsectionfees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_classsectionfees_id_seq OWNED BY public.fees_classsectionfees.id;


--
-- Name: fees_fee; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_fee (
    id integer NOT NULL,
    "regNo" integer NOT NULL,
    payment_method character varying(50) NOT NULL,
    "submissionDate" date NOT NULL,
    "monthsPaid" character varying(50) NOT NULL,
    "classSection_id" integer NOT NULL,
    student_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.fees_fee OWNER TO myprojectuser;

--
-- Name: fees_fee_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_fee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_fee_id_seq OWNER TO myprojectuser;

--
-- Name: fees_fee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_fee_id_seq OWNED BY public.fees_fee.id;


--
-- Name: fees_feecategory; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_feecategory (
    id integer NOT NULL,
    once boolean NOT NULL,
    submission_type character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.fees_feecategory OWNER TO myprojectuser;

--
-- Name: fees_feecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_feecategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_feecategory_id_seq OWNER TO myprojectuser;

--
-- Name: fees_feecategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_feecategory_id_seq OWNED BY public.fees_feecategory.id;


--
-- Name: fees_feecycle; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_feecycle (
    id integer NOT NULL,
    "lastSubmissionDate" date NOT NULL,
    "firstSubmissionDate" date NOT NULL,
    cycle character varying(50) NOT NULL
);


ALTER TABLE public.fees_feecycle OWNER TO myprojectuser;

--
-- Name: fees_feecycle_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_feecycle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_feecycle_id_seq OWNER TO myprojectuser;

--
-- Name: fees_feecycle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_feecycle_id_seq OWNED BY public.fees_feecycle.id;


--
-- Name: fees_feediscount; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_feediscount (
    id integer NOT NULL,
    discount integer NOT NULL,
    category character varying(50) NOT NULL,
    description text NOT NULL,
    total_off integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.fees_feediscount OWNER TO myprojectuser;

--
-- Name: fees_feediscount_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_feediscount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_feediscount_id_seq OWNER TO myprojectuser;

--
-- Name: fees_feediscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_feediscount_id_seq OWNED BY public.fees_feediscount.id;


--
-- Name: fees_fine; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_fine (
    id integer NOT NULL,
    fine integer NOT NULL,
    category character varying(100) NOT NULL,
    description text NOT NULL,
    student_id integer NOT NULL,
    "submissionDate" date NOT NULL
);


ALTER TABLE public.fees_fine OWNER TO myprojectuser;

--
-- Name: fees_fine_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_fine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_fine_id_seq OWNER TO myprojectuser;

--
-- Name: fees_fine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_fine_id_seq OWNED BY public.fees_fine.id;


--
-- Name: form_currentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_currentaddress (
    student_id bigint NOT NULL,
    "Address" character varying(100) NOT NULL,
    "zipCode" bigint,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL
);


ALTER TABLE public.form_currentaddress OWNER TO myprojectuser;

--
-- Name: form_documents; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_documents (
    student_id bigint NOT NULL,
    photo character varying(100) NOT NULL,
    "idProof" character varying(100) NOT NULL,
    "castCertificate" character varying(100) NOT NULL,
    domicile character varying(100) NOT NULL,
    tc character varying(100) NOT NULL,
    "characterCertificate" character varying(100) NOT NULL
);


ALTER TABLE public.form_documents OWNER TO myprojectuser;

--
-- Name: form_parentinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_parentinfo (
    student_id bigint NOT NULL,
    "fatherName" character varying(20) NOT NULL,
    "motherName" character varying(20) NOT NULL,
    "Fatherdob" date,
    "Motherdob" date,
    "MobileNumber" bigint,
    "altMobileNumber" bigint,
    "gaurdianQual" character varying(30) NOT NULL,
    "guardianOccup" character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    "motherQual" character varying(30) NOT NULL,
    "motherOccup" character varying(20) NOT NULL
);


ALTER TABLE public.form_parentinfo OWNER TO myprojectuser;

--
-- Name: form_permanentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_permanentaddress (
    student_id bigint NOT NULL,
    "Address" character varying(100) NOT NULL,
    "zipCode" bigint,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL
);


ALTER TABLE public.form_permanentaddress OWNER TO myprojectuser;

--
-- Name: form_studentinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_studentinfo (
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    gender character varying(20) NOT NULL,
    dob date,
    "classSection" character varying(20) NOT NULL,
    "admissionNumber" bigint NOT NULL,
    "mobileNumber" bigint,
    religion character varying(20) NOT NULL,
    caste character varying(20) NOT NULL,
    "tcNumber" bigint,
    "aadharNumber" bigint,
    "feeWaiverCategory" character varying(20) NOT NULL,
    "siblingID" bigint,
    "prevSchoolName" character varying(20) NOT NULL,
    "fullName" character varying(50) NOT NULL
);


ALTER TABLE public.form_studentinfo OWNER TO myprojectuser;

--
-- Name: holiday_holiday; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.holiday_holiday (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL
);


ALTER TABLE public.holiday_holiday OWNER TO myprojectuser;

--
-- Name: holiday_holiday_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.holiday_holiday_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.holiday_holiday_id_seq OWNER TO myprojectuser;

--
-- Name: holiday_holiday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.holiday_holiday_id_seq OWNED BY public.holiday_holiday.id;


--
-- Name: homework_homework; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.homework_homework (
    id integer NOT NULL,
    description text NOT NULL,
    subject character varying(100) NOT NULL,
    document character varying(100) NOT NULL,
    date_published date NOT NULL,
    "classRoom_id" integer NOT NULL
);


ALTER TABLE public.homework_homework OWNER TO myprojectuser;

--
-- Name: homework_homework_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.homework_homework_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homework_homework_id_seq OWNER TO myprojectuser;

--
-- Name: homework_homework_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.homework_homework_id_seq OWNED BY public.homework_homework.id;


--
-- Name: homework_syllabus; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.homework_syllabus (
    id integer NOT NULL,
    description text NOT NULL,
    document character varying(100) NOT NULL,
    date_published date NOT NULL,
    "classRoom_id" integer NOT NULL
);


ALTER TABLE public.homework_syllabus OWNER TO myprojectuser;

--
-- Name: homework_syllabus_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.homework_syllabus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homework_syllabus_id_seq OWNER TO myprojectuser;

--
-- Name: homework_syllabus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.homework_syllabus_id_seq OWNED BY public.homework_syllabus.id;


--
-- Name: markssection_additionalsubjectmapping; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_additionalsubjectmapping (
    id integer NOT NULL,
    subject character varying(50) NOT NULL,
    marks integer,
    "classroomStudent_id" integer NOT NULL,
    "examName_id" integer NOT NULL,
    "examType_id" integer NOT NULL
);


ALTER TABLE public.markssection_additionalsubjectmapping OWNER TO myprojectuser;

--
-- Name: markssection_additionalsubjectmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_additionalsubjectmapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_additionalsubjectmapping_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_additionalsubjectmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_additionalsubjectmapping_id_seq OWNED BY public.markssection_additionalsubjectmapping.id;


--
-- Name: markssection_exam; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_exam (
    id integer NOT NULL,
    "examName" character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.markssection_exam OWNER TO myprojectuser;

--
-- Name: markssection_exam_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_exam_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_exam_id_seq OWNED BY public.markssection_exam.id;


--
-- Name: markssection_exammapping; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_exammapping (
    id integer NOT NULL,
    subject character varying(100) NOT NULL,
    classroom_id integer NOT NULL,
    "examName_id" integer NOT NULL,
    "examType_id" integer NOT NULL
);


ALTER TABLE public.markssection_exammapping OWNER TO myprojectuser;

--
-- Name: markssection_exammapping_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_exammapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_exammapping_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_exammapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_exammapping_id_seq OWNED BY public.markssection_exammapping.id;


--
-- Name: markssection_examtype; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_examtype (
    id integer NOT NULL,
    "examType" character varying(50) NOT NULL,
    "minMarks" integer NOT NULL,
    "maxMarks" integer NOT NULL,
    priority integer,
    "examName_id" integer NOT NULL
);


ALTER TABLE public.markssection_examtype OWNER TO myprojectuser;

--
-- Name: markssection_examtype_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_examtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_examtype_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_examtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_examtype_id_seq OWNED BY public.markssection_examtype.id;


--
-- Name: markssection_marks; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_marks (
    id integer NOT NULL,
    subject character varying(50) NOT NULL,
    marks integer NOT NULL,
    "classroomStudent_id" integer NOT NULL,
    "examType_id" integer NOT NULL,
    "examName_id" integer NOT NULL
);


ALTER TABLE public.markssection_marks OWNER TO myprojectuser;

--
-- Name: markssection_marks_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_marks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_marks_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_marks_id_seq OWNED BY public.markssection_marks.id;


--
-- Name: newsletter_newsletter; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.newsletter_newsletter (
    id integer NOT NULL,
    description text,
    date date NOT NULL
);


ALTER TABLE public.newsletter_newsletter OWNER TO myprojectuser;

--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.newsletter_newsletter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_newsletter_id_seq OWNER TO myprojectuser;

--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.newsletter_newsletter_id_seq OWNED BY public.newsletter_newsletter.id;


--
-- Name: notice_classnotice; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.notice_classnotice (
    id integer NOT NULL,
    notice text NOT NULL,
    notice_document character varying(100) NOT NULL,
    "classRoom_id" integer NOT NULL
);


ALTER TABLE public.notice_classnotice OWNER TO myprojectuser;

--
-- Name: notice_classnotice_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.notice_classnotice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_classnotice_id_seq OWNER TO myprojectuser;

--
-- Name: notice_classnotice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.notice_classnotice_id_seq OWNED BY public.notice_classnotice.id;


--
-- Name: notice_studentnotice; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.notice_studentnotice (
    id integer NOT NULL,
    notice text NOT NULL,
    notice_document character varying(100) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.notice_studentnotice OWNER TO myprojectuser;

--
-- Name: notice_studentnotice_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.notice_studentnotice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_studentnotice_id_seq OWNER TO myprojectuser;

--
-- Name: notice_studentnotice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.notice_studentnotice_id_seq OWNED BY public.notice_studentnotice.id;


--
-- Name: schoolinfo_schoolinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.schoolinfo_schoolinfo (
    "schoolName" character varying(100) NOT NULL,
    addresss character varying(100) NOT NULL,
    "principalName" character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    "zipCode" integer NOT NULL,
    "schoolID" integer NOT NULL,
    longitude integer NOT NULL,
    latitude integer NOT NULL,
    "contactNumber" integer NOT NULL,
    "webSiteURL" character varying(100) NOT NULL,
    img character varying(100) NOT NULL,
    logo character varying(100) NOT NULL
);


ALTER TABLE public.schoolinfo_schoolinfo OWNER TO myprojectuser;

--
-- Name: accounts_userprofile id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_userprofile_id_seq'::regclass);


--
-- Name: attendence_studentattendence id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_studentattendence ALTER COLUMN id SET DEFAULT nextval('public.attendence_studentattendence_id_seq'::regclass);


--
-- Name: attendence_teacherattendence id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_teacherattendence ALTER COLUMN id SET DEFAULT nextval('public.attendence_teacherattendence_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: classform_classroom id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom ALTER COLUMN id SET DEFAULT nextval('public.classform_classroom_id_seq'::regclass);


--
-- Name: classform_classroomstudent id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent ALTER COLUMN id SET DEFAULT nextval('public.classform_classroomstudent_id_seq'::regclass);


--
-- Name: dailythought_thoughts id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.dailythought_thoughts ALTER COLUMN id SET DEFAULT nextval('public.dailythought_thoughts_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: fees_classsectionfees id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees ALTER COLUMN id SET DEFAULT nextval('public.fees_classsectionfees_id_seq'::regclass);


--
-- Name: fees_fee id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee ALTER COLUMN id SET DEFAULT nextval('public.fees_fee_id_seq'::regclass);


--
-- Name: fees_feecategory id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecategory ALTER COLUMN id SET DEFAULT nextval('public.fees_feecategory_id_seq'::regclass);


--
-- Name: fees_feecycle id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecycle ALTER COLUMN id SET DEFAULT nextval('public.fees_feecycle_id_seq'::regclass);


--
-- Name: fees_feediscount id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feediscount ALTER COLUMN id SET DEFAULT nextval('public.fees_feediscount_id_seq'::regclass);


--
-- Name: fees_fine id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fine ALTER COLUMN id SET DEFAULT nextval('public.fees_fine_id_seq'::regclass);


--
-- Name: holiday_holiday id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.holiday_holiday ALTER COLUMN id SET DEFAULT nextval('public.holiday_holiday_id_seq'::regclass);


--
-- Name: homework_homework id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_homework ALTER COLUMN id SET DEFAULT nextval('public.homework_homework_id_seq'::regclass);


--
-- Name: homework_syllabus id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_syllabus ALTER COLUMN id SET DEFAULT nextval('public.homework_syllabus_id_seq'::regclass);


--
-- Name: markssection_additionalsubjectmapping id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping ALTER COLUMN id SET DEFAULT nextval('public.markssection_additionalsubjectmapping_id_seq'::regclass);


--
-- Name: markssection_exam id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exam ALTER COLUMN id SET DEFAULT nextval('public.markssection_exam_id_seq'::regclass);


--
-- Name: markssection_exammapping id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping ALTER COLUMN id SET DEFAULT nextval('public.markssection_exammapping_id_seq'::regclass);


--
-- Name: markssection_examtype id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_examtype ALTER COLUMN id SET DEFAULT nextval('public.markssection_examtype_id_seq'::regclass);


--
-- Name: markssection_marks id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks ALTER COLUMN id SET DEFAULT nextval('public.markssection_marks_id_seq'::regclass);


--
-- Name: newsletter_newsletter id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.newsletter_newsletter ALTER COLUMN id SET DEFAULT nextval('public.newsletter_newsletter_id_seq'::regclass);


--
-- Name: notice_classnotice id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_classnotice ALTER COLUMN id SET DEFAULT nextval('public.notice_classnotice_id_seq'::regclass);


--
-- Name: notice_studentnotice id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_studentnotice ALTER COLUMN id SET DEFAULT nextval('public.notice_studentnotice_id_seq'::regclass);


--
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.accounts_userprofile (id, user_type, mobile_no, user_id, image, "fullName") FROM stdin;
12	Admin	4545445449	4	profile_pics/customer-3_EWBaFFT.jpg	Smith D'souza
1	Admin	4659898989	1	profile_pics/customer-1.jpg	Yash Boura
\.


--
-- Data for Name: attendence_studentattendence; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.attendence_studentattendence (id, status, date, student_id) FROM stdin;
1	present	2019-12-03	1
2	present	2019-12-03	2
3	present	2019-12-03	3
4	present	2019-12-03	1
5	present	2019-12-03	2
6	present	2019-12-03	3
8	absent	2019-12-18	4
7	absent	2019-12-18	1
9	leave	2019-12-25	1
10	present	2019-12-25	2
11	absent	2019-12-25	3
\.


--
-- Data for Name: attendence_teacherattendence; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.attendence_teacherattendence (id, status, date, teacher_id, available_casual_leave, available_sick_leave, taken_casual_leave, taken_sick_leave, total_no_of_days_present) FROM stdin;
2	present	2019-12-11	1223	10	10	0	0	0
3	absent	2019-12-11	6577	10	10	0	0	0
4	present	2019-12-11	10101012	10	10	0	0	0
5	Absent	2019-12-11	10101012	10	10	0	0	0
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user profile	1	add_userprofile
2	Can change user profile	1	change_userprofile
3	Can delete user profile	1	delete_userprofile
4	Can view user profile	1	view_userprofile
5	Can add log entry	2	add_logentry
6	Can change log entry	2	change_logentry
7	Can delete log entry	2	delete_logentry
8	Can view log entry	2	view_logentry
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add user	5	add_user
18	Can change user	5	change_user
19	Can delete user	5	delete_user
20	Can view user	5	view_user
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add student info	8	add_studentinfo
30	Can change student info	8	change_studentinfo
31	Can delete student info	8	delete_studentinfo
32	Can view student info	8	view_studentinfo
33	Can add parent info	9	add_parentinfo
34	Can change parent info	9	change_parentinfo
35	Can delete parent info	9	delete_parentinfo
36	Can view parent info	9	view_parentinfo
37	Can add documents	10	add_documents
38	Can change documents	10	change_documents
39	Can delete documents	10	delete_documents
40	Can view documents	10	view_documents
41	Can add current address	11	add_currentaddress
42	Can change current address	11	change_currentaddress
43	Can delete current address	11	delete_currentaddress
44	Can view current address	11	view_currentaddress
45	Can add permanent address	12	add_permanentaddress
46	Can change permanent address	12	change_permanentaddress
47	Can delete permanent address	12	delete_permanentaddress
48	Can view permanent address	12	view_permanentaddress
49	Can add employee documents	13	add_employeedocuments
50	Can change employee documents	13	change_employeedocuments
51	Can delete employee documents	13	delete_employeedocuments
52	Can view employee documents	13	view_employeedocuments
53	Can add employee	14	add_employee
54	Can change employee	14	change_employee
55	Can delete employee	14	delete_employee
56	Can view employee	14	view_employee
57	Can add teacher	15	add_teacher
58	Can change teacher	15	change_teacher
59	Can delete teacher	15	delete_teacher
60	Can view teacher	15	view_teacher
61	Can add teacher	16	add_teacher
62	Can change teacher	16	change_teacher
63	Can delete teacher	16	delete_teacher
64	Can view teacher	16	view_teacher
65	Can add employee documents	17	add_employeedocuments
66	Can change employee documents	17	change_employeedocuments
67	Can delete employee documents	17	delete_employeedocuments
68	Can view employee documents	17	view_employeedocuments
69	Can add employee	18	add_employee
70	Can change employee	18	change_employee
71	Can delete employee	18	delete_employee
72	Can view employee	18	view_employee
73	Can add permanent address	19	add_permanentaddress
74	Can change permanent address	19	change_permanentaddress
75	Can delete permanent address	19	delete_permanentaddress
76	Can view permanent address	19	view_permanentaddress
77	Can add current address	20	add_currentaddress
78	Can change current address	20	change_currentaddress
79	Can delete current address	20	delete_currentaddress
80	Can view current address	20	view_currentaddress
81	Can add class room	21	add_classroom
82	Can change class room	21	change_classroom
83	Can delete class room	21	delete_classroom
84	Can view class room	21	view_classroom
85	Can add class room student	22	add_classroomstudent
86	Can change class room student	22	change_classroomstudent
87	Can delete class room student	22	delete_classroomstudent
88	Can view class room student	22	view_classroomstudent
89	Can add student attendence	23	add_studentattendence
90	Can change student attendence	23	change_studentattendence
91	Can delete student attendence	23	delete_studentattendence
92	Can view student attendence	23	view_studentattendence
93	Can add teacher attendence	24	add_teacherattendence
94	Can change teacher attendence	24	change_teacherattendence
95	Can delete teacher attendence	24	delete_teacherattendence
96	Can view teacher attendence	24	view_teacherattendence
97	Can add exam type	25	add_examtype
98	Can change exam type	25	change_examtype
99	Can delete exam type	25	delete_examtype
100	Can view exam type	25	view_examtype
101	Can add subjects to class	26	add_subjectstoclass
102	Can change subjects to class	26	change_subjectstoclass
103	Can delete subjects to class	26	delete_subjectstoclass
104	Can view subjects to class	26	view_subjectstoclass
105	Can add marks	27	add_marks
106	Can change marks	27	change_marks
107	Can delete marks	27	delete_marks
108	Can view marks	27	view_marks
109	Can add exam	28	add_exam
110	Can change exam	28	change_exam
111	Can delete exam	28	delete_exam
112	Can view exam	28	view_exam
113	Can add exam mapping	29	add_exammapping
114	Can change exam mapping	29	change_exammapping
115	Can delete exam mapping	29	delete_exammapping
116	Can view exam mapping	29	view_exammapping
117	Can add additional subject	30	add_additionalsubject
118	Can change additional subject	30	change_additionalsubject
119	Can delete additional subject	30	delete_additionalsubject
120	Can view additional subject	30	view_additionalsubject
121	Can add marks	31	add_marks
122	Can change marks	31	change_marks
123	Can delete marks	31	delete_marks
124	Can view marks	31	view_marks
125	Can add exam	32	add_exam
126	Can change exam	32	change_exam
127	Can delete exam	32	delete_exam
128	Can view exam	32	view_exam
129	Can add exam mapping	33	add_exammapping
130	Can change exam mapping	33	change_exammapping
131	Can delete exam mapping	33	delete_exammapping
132	Can view exam mapping	33	view_exammapping
133	Can add exam type	34	add_examtype
134	Can change exam type	34	change_examtype
135	Can delete exam type	34	delete_examtype
136	Can view exam type	34	view_examtype
137	Can add additional subject	35	add_additionalsubject
138	Can change additional subject	35	change_additionalsubject
139	Can delete additional subject	35	delete_additionalsubject
140	Can view additional subject	35	view_additionalsubject
141	Can add additional subject mapping	36	add_additionalsubjectmapping
142	Can change additional subject mapping	36	change_additionalsubjectmapping
143	Can delete additional subject mapping	36	delete_additionalsubjectmapping
144	Can view additional subject mapping	36	view_additionalsubjectmapping
145	Can add home work	37	add_homework
146	Can change home work	37	change_homework
147	Can delete home work	37	delete_homework
148	Can view home work	37	view_homework
149	Can add class notice	38	add_classnotice
150	Can change class notice	38	change_classnotice
151	Can delete class notice	38	delete_classnotice
152	Can view class notice	38	view_classnotice
153	Can add student notice	39	add_studentnotice
154	Can change student notice	39	change_studentnotice
155	Can delete student notice	39	delete_studentnotice
156	Can view student notice	39	view_studentnotice
157	Can add thoughts	40	add_thoughts
158	Can change thoughts	40	change_thoughts
159	Can delete thoughts	40	delete_thoughts
160	Can view thoughts	40	view_thoughts
161	Can add newsletter	41	add_newsletter
162	Can change newsletter	41	change_newsletter
163	Can delete newsletter	41	delete_newsletter
164	Can view newsletter	41	view_newsletter
165	Can add school info	42	add_schoolinfo
166	Can change school info	42	change_schoolinfo
167	Can delete school info	42	delete_schoolinfo
168	Can view school info	42	view_schoolinfo
169	Can add holiday	43	add_holiday
170	Can change holiday	43	change_holiday
171	Can delete holiday	43	delete_holiday
172	Can view holiday	43	view_holiday
173	Can add fee category	44	add_feecategory
174	Can change fee category	44	change_feecategory
175	Can delete fee category	44	delete_feecategory
176	Can view fee category	44	view_feecategory
177	Can add fee cycle	45	add_feecycle
178	Can change fee cycle	45	change_feecycle
179	Can delete fee cycle	45	delete_feecycle
180	Can view fee cycle	45	view_feecycle
181	Can add fee discount	46	add_feediscount
182	Can change fee discount	46	change_feediscount
183	Can delete fee discount	46	delete_feediscount
184	Can view fee discount	46	view_feediscount
185	Can add fine	47	add_fine
186	Can change fine	47	change_fine
187	Can delete fine	47	delete_fine
188	Can view fine	47	view_fine
189	Can add fee	48	add_fee
190	Can change fee	48	change_fee
191	Can delete fee	48	delete_fee
192	Can view fee	48	view_fee
193	Can add class section fees	49	add_classsectionfees
194	Can change class section fees	49	change_classsectionfees
195	Can delete class section fees	49	delete_classsectionfees
196	Can view class section fees	49	view_classsectionfees
197	Can add syllabus	50	add_syllabus
198	Can change syllabus	50	change_syllabus
199	Can delete syllabus	50	delete_syllabus
200	Can view syllabus	50	view_syllabus
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$150000$AH8YhH5ddait$2Knous/eaROaakLDRdHxn0y5UZZPEJKd3AlTKqFJDbQ=	2019-12-24 11:16:01.963582+00	t	Smith Singh	Smith Singh			t	t	2019-12-24 08:22:10+00
2	pbkdf2_sha256$150000$IKRemWv0JUjT$MdI4gKXsyUU20rqojDU99idXwXpu96diyxwtdeHpVH4=	2019-12-25 17:07:05.559738+00	t	admin				t	t	2019-12-05 10:13:06.231138+00
1	pbkdf2_sha256$150000$lHFzcuPyPZdB$vEZb9OfmyMFet89Bpy7WHpa0QInbG/w0YBLTmdxqUBc=	2019-12-25 17:07:37.517568+00	t	yash	yash			t	t	2019-12-05 10:02:38+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: classform_classroom; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_classroom (id, "classSection", teacher_id) FROM stdin;
1	6-B	10101012
2	6-C	6577
3	6-A	1223
\.


--
-- Data for Name: classform_classroomstudent; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_classroomstudent (id, roll_number, "classRoom_id", student_id) FROM stdin;
1	1	3	2231
2	3	3	988
3	5	3	3231
4	2	1	223
5	4	1	12345
7	1	2	122
\.


--
-- Data for Name: dailythought_thoughts; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.dailythought_thoughts (id, thought, "timestamp") FROM stdin;
7	This a example thought of the day 	2019-12-19
8	This is again just a sample thought	2019-12-19
18	Sample thought sample thought sample thought sample thought sample thought sample thought.	2019-12-25
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-12-09 17:01:36.22459+00	1223	Name:Rohan Pawar| Class:6-A| Emp.ID: 1223	2	[{"changed": {"fields": ["employee", "firstName", "lastName", "fullName", "specialization", "designation", "classTeacher"]}}]	16	2
2	2019-12-09 17:02:08.042215+00	6577	Name:Kartik Singh| Class:6-A| Emp.ID: 6577	1	[{"added": {}}]	16	2
3	2019-12-09 17:02:16.789755+00	6577	Name:Kartik Singh| Class:6-C| Emp.ID: 6577	2	[{"changed": {"fields": ["classTeacher"]}}]	16	2
4	2019-12-09 17:02:40.422453+00	10101012	Name:Jainaish Thakur| Class:6-B| Emp.ID: 10101012	2	[{"changed": {"fields": ["classTeacher"]}}]	16	2
5	2019-12-09 17:02:52.031653+00	101010	Name:| Class:| Emp.ID: 101010	3		16	2
6	2019-12-09 17:03:51.746676+00	2231	Name:Suman Thakur Add.No: 2231 Class:5-A	2	[{"changed": {"fields": ["firstName", "lastName", "fullName", "classSection"]}}]	8	2
7	2019-12-09 17:04:11.639897+00	123656	Name: Add.No: 123656 Class:	3		8	2
8	2019-12-09 17:04:25.128907+00	909090	Name: Add.No: 909090 Class:	3		8	2
9	2019-12-09 17:04:38.834341+00	223	Name:rameshsingh Add.No: 223 Class:5-B	2	[{"changed": {"fields": ["classSection"]}}]	8	2
10	2019-12-09 17:09:28.677067+00	2	Class:6-C| Teacher: Kartik Singh	1	[{"added": {}}]	21	2
11	2019-12-09 17:09:38.354674+00	3	Class:6-A| Teacher: Rohan Pawar	1	[{"added": {}}]	21	2
12	2019-12-09 17:12:44.258501+00	223	Name:rameshsingh Add.No: 223 Class:6-B	2	[{"changed": {"fields": ["classSection"]}}]	8	2
13	2019-12-09 17:13:00.383327+00	2231	Name:Suman Thakur Add.No: 2231 Class:6-A	2	[{"changed": {"fields": ["classSection"]}}]	8	2
14	2019-12-09 17:13:30.719433+00	122	Name:yash dfs Add.No: 122 Class:6-A	2	[{"changed": {"fields": ["fullName", "fName", "classSection"]}}]	8	2
15	2019-12-09 17:13:39.970985+00	122	Name:yash dfs Add.No: 122 Class:6-C	2	[{"changed": {"fields": ["classSection"]}}]	8	2
16	2019-12-09 18:42:58.418092+00	1	Class:Class:6-A| Teacher: Rohan Pawar| Student: Suman Thakur	1	[{"added": {}}]	22	2
17	2019-12-09 19:17:57.289282+00	12345	Name:rameshsingh| Add.No: 12345| Class:6-B	2	[{"changed": {"fields": ["classSection"]}}]	8	2
18	2019-12-09 19:24:44.459846+00	6	Class:Class:6-C| Teacher: Kartik Singh| Student:yash dfs	3		22	2
19	2019-12-11 07:50:18.120468+00	7	Name:Suman Thakur| Date:2019-12-18 | Status:absent	2	[{"changed": {"fields": ["status"]}}]	23	2
20	2019-12-11 09:23:39.568939+00	5	Name:Jainaish Thakur| Date:2019-12-11 | Status:Absent	1	[{"added": {}}]	24	2
21	2019-12-12 06:01:38.493429+00	1	ExamType object (1)	3		25	2
22	2019-12-12 06:04:28.414425+00	2	ExamType object (2)	3		25	2
23	2019-12-12 06:05:04.415143+00	3	ExamType object (3)	3		25	2
24	2019-12-12 06:13:35.893242+00	14	ExamType object (14)	3		25	2
25	2019-12-12 06:13:35.996596+00	13	ExamType object (13)	3		25	2
26	2019-12-12 06:13:36.003183+00	12	ExamType object (12)	3		25	2
27	2019-12-12 06:13:36.014478+00	11	ExamType object (11)	3		25	2
28	2019-12-12 06:13:36.025504+00	10	ExamType object (10)	3		25	2
29	2019-12-12 06:13:36.036728+00	9	ExamType object (9)	3		25	2
30	2019-12-12 06:13:36.047814+00	8	ExamType object (8)	3		25	2
31	2019-12-12 06:13:36.058726+00	7	ExamType object (7)	3		25	2
32	2019-12-12 06:13:36.06977+00	6	ExamType object (6)	3		25	2
33	2019-12-12 06:13:36.082541+00	5	ExamType object (5)	3		25	2
34	2019-12-12 06:13:36.091741+00	4	ExamType object (4)	3		25	2
35	2019-12-12 06:19:47.677879+00	26	ExamType object (26)	3		25	2
36	2019-12-12 06:19:47.740218+00	25	ExamType object (25)	3		25	2
37	2019-12-12 06:19:47.751171+00	24	ExamType object (24)	3		25	2
38	2019-12-12 06:19:47.762345+00	23	ExamType object (23)	3		25	2
39	2019-12-12 06:19:47.773566+00	22	ExamType object (22)	3		25	2
40	2019-12-12 06:19:47.784438+00	21	ExamType object (21)	3		25	2
41	2019-12-12 06:19:47.795625+00	20	ExamType object (20)	3		25	2
42	2019-12-12 06:19:47.806612+00	19	ExamType object (19)	3		25	2
43	2019-12-12 06:19:47.81759+00	18	ExamType object (18)	3		25	2
44	2019-12-12 06:19:47.828911+00	17	ExamType object (17)	3		25	2
45	2019-12-12 06:19:47.839627+00	16	ExamType object (16)	3		25	2
46	2019-12-12 06:19:47.85066+00	15	ExamType object (15)	3		25	2
47	2019-12-12 08:33:59.411978+00	323198964	Name:Ashok Sinha| Add.No: 323198964| Class:6-A	2	[{"changed": {"fields": ["fullName", "fName", "prevSchoolName"]}}]	8	2
48	2019-12-12 08:34:27.674646+00	3231	Name:Ashok Sinha| Add.No: 3231| Class:6-A	2	[{"changed": {"fields": ["fullName", "fName", "prevSchoolName"]}}]	8	2
49	2019-12-12 09:03:08.66342+00	37	ExamType object (37)	3		25	2
50	2019-12-12 09:03:08.830194+00	36	ExamType object (36)	3		25	2
51	2019-12-12 09:03:08.903805+00	35	ExamType object (35)	3		25	2
52	2019-12-12 09:03:08.914906+00	34	ExamType object (34)	3		25	2
53	2019-12-12 09:03:08.925947+00	33	ExamType object (33)	3		25	2
54	2019-12-12 09:03:08.937573+00	32	ExamType object (32)	3		25	2
55	2019-12-12 09:03:08.948069+00	31	ExamType object (31)	3		25	2
56	2019-12-12 09:03:08.958801+00	30	ExamType object (30)	3		25	2
57	2019-12-12 09:03:08.969917+00	29	ExamType object (29)	3		25	2
58	2019-12-12 09:03:08.98096+00	28	ExamType object (28)	3		25	2
59	2019-12-14 08:45:43.890481+00	3	Exam :Annual Exam ExamType:Theory	3		34	2
60	2019-12-14 08:45:59.910087+00	4	Exam :Annual Exam ExamType:Oral	3		34	2
61	2019-12-14 10:38:44.450412+00	6	Exam :UT-1 ExamType:Theory	1	[{"added": {}}]	34	2
62	2019-12-14 10:39:29.106453+00	12	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
63	2019-12-14 10:40:05.096371+00	13	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
64	2019-12-14 10:40:24.599171+00	14	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
65	2019-12-14 10:40:58.20926+00	15	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
66	2019-12-16 07:15:11.909235+00	4	Exam :SA-1	2	[{"changed": {"fields": ["examName", "description"]}}]	32	2
67	2019-12-16 07:15:39.20997+00	3	Exam :SA-2	2	[{"changed": {"fields": ["examName", "description"]}}]	32	2
68	2019-12-16 07:18:54.36662+00	11	Exam:SA-1 ExamType:Theory|Subject:Social Studies	2	[{"changed": {"fields": ["examType"]}}]	33	2
69	2019-12-16 07:19:07.58753+00	10	Exam:SA-1 ExamType:Theory|Subject:Science	2	[{"changed": {"fields": ["examType"]}}]	33	2
70	2019-12-16 07:19:20.088347+00	9	Exam:SA-1 ExamType:Theory|Subject:English	2	[{"changed": {"fields": ["examType"]}}]	33	2
71	2019-12-16 07:19:40.899765+00	8	Exam:SA-1 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["examType"]}}]	33	2
72	2019-12-16 07:19:50.630075+00	14	Exam:UT-1 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["subject"]}}]	33	2
73	2019-12-16 07:20:08.499008+00	6	Exam:SA-1 ExamType:Theory|Subject:Social Studies	2	[{"changed": {"fields": ["examType"]}}]	33	2
74	2019-12-16 07:21:13.074867+00	5	Exam :SA-2 ExamType:Theory	2	[{"changed": {"fields": ["examName", "examType", "minMarks", "maxMarks"]}}]	34	2
75	2019-12-16 07:21:18.97819+00	2	Exam :SA-1 ExamType:Theory	2	[]	34	2
76	2019-12-16 07:21:27.650533+00	6	Exam :UT-1 ExamType:Theory	2	[{"changed": {"fields": ["minMarks"]}}]	34	2
77	2019-12-16 07:21:33.275431+00	2	Exam :SA-1 ExamType:Theory	2	[]	34	2
78	2019-12-16 07:21:47.635593+00	1	Exam :UT-2 ExamType:Theory	2	[{"changed": {"fields": ["examType", "minMarks", "maxMarks"]}}]	34	2
79	2019-12-16 07:25:36.792945+00	7	Exam:SA-2 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["examName"]}}]	33	2
80	2019-12-16 07:25:50.574291+00	6	Exam:SA-2 ExamType:Theory|Subject:Social Studies	2	[{"changed": {"fields": ["examName", "examType"]}}]	33	2
81	2019-12-16 07:26:17.157325+00	7	Exam:SA-2 ExamType:Theory|Subject:Mathematics	2	[]	33	2
82	2019-12-16 07:26:41.350543+00	5	Exam:SA-2 ExamType:Theory|Subject:Science	2	[{"changed": {"fields": ["examName"]}}]	33	2
83	2019-12-16 07:26:52.695319+00	4	Exam:SA-2 ExamType:Theory|Subject:English	2	[{"changed": {"fields": ["examName"]}}]	33	2
84	2019-12-16 07:27:13.255717+00	2	Exam:UT-2 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["subject"]}}]	33	2
85	2019-12-16 07:27:51.167669+00	16	Exam:UT-2 ExamType:Theory|Subject:Social Studies	1	[{"added": {}}]	33	2
86	2019-12-16 07:29:53.49678+00	4	Suman Thakur | Exam:Theory UT-2 | Subject:Mathematics	1	[{"added": {}}]	31	2
87	2019-12-16 07:30:08.017209+00	5	Suman Thakur | Exam:Theory SA-2 | Subject:Science	1	[{"added": {}}]	31	2
88	2019-12-16 07:30:23.316381+00	6	Suman Thakur | Exam:Theory SA-2 | Subject:Social Studies	1	[{"added": {}}]	31	2
89	2019-12-16 07:30:51.223063+00	7	Suman Thakur | Exam:Theory SA-2 | Subject:English	1	[{"added": {}}]	31	2
90	2019-12-16 07:31:31.26615+00	8	Suman Thakur | Exam:Theory SA-2 | Subject:Mathematics	1	[{"added": {}}]	31	2
91	2019-12-16 07:32:06.766127+00	9	Suman Thakur | Exam:Theory UT-2 | Subject:English	1	[{"added": {}}]	31	2
92	2019-12-16 07:32:17.192105+00	1	Suman Thakur | Exam:Theory UT-2 | Subject:Science	2	[{"changed": {"fields": ["marks"]}}]	31	2
93	2019-12-16 07:32:29.736079+00	4	Suman Thakur | Exam:Theory UT-2 | Subject:Mathematics	2	[{"changed": {"fields": ["marks"]}}]	31	2
94	2019-12-16 07:35:20.960475+00	10	Suman Thakur | Exam:Theory UT-2 | Subject:Social Studies	1	[{"added": {}}]	31	2
95	2019-12-16 07:36:08.664446+00	11	Suman Thakur | Exam:Theory SA-1 | Subject:English	1	[{"added": {}}]	31	2
96	2019-12-16 07:36:29.756268+00	12	Suman Thakur | Exam:Theory SA-1 | Subject:Social Studies	1	[{"added": {}}]	31	2
97	2019-12-16 07:36:46.399048+00	13	Suman Thakur | Exam:Theory SA-1 | Subject:Science	1	[{"added": {}}]	31	2
98	2019-12-16 07:37:09.690084+00	14	Suman Thakur | Exam:Theory SA-1 | Subject:Mathematics	1	[{"added": {}}]	31	2
99	2019-12-16 07:38:35.467898+00	15	Suman Thakur | Exam:Theory UT-1 | Subject:English	1	[{"added": {}}]	31	2
100	2019-12-16 07:38:45.450171+00	16	Suman Thakur | Exam:Theory UT-1 | Subject:Social Studies	1	[{"added": {}}]	31	2
101	2019-12-16 07:38:56.053555+00	17	Suman Thakur | Exam:Theory UT-1 | Subject:Science	1	[{"added": {}}]	31	2
102	2019-12-16 07:39:13.563926+00	18	Suman Thakur | Exam:Theory UT-1 | Subject:Science	1	[{"added": {}}]	31	2
103	2019-12-16 07:39:25.131619+00	18	Suman Thakur | Exam:Theory UT-1 | Subject:Mathematics	2	[{"changed": {"fields": ["subject"]}}]	31	2
104	2019-12-16 17:26:18.841325+00	14	Suman Thakur | Exam:Theory SA-1 | Subject:Mathematics	2	[{"changed": {"fields": ["marks"]}}]	31	2
105	2019-12-16 17:26:31.409235+00	7	Suman Thakur | Exam:Theory SA-2 | Subject:English	2	[{"changed": {"fields": ["marks"]}}]	31	2
106	2019-12-16 17:28:12.03869+00	13	Suman Thakur | Exam:Theory SA-1 | Subject:Science	2	[{"changed": {"fields": ["marks"]}}]	31	2
107	2019-12-17 09:28:43.913242+00	19	Suman Thakur | Exam:Theory Final | Subject:English	2	[]	31	2
108	2019-12-17 09:29:00.405342+00	22	Suman Thakur | Exam:Theory Final | Subject:Science	1	[{"added": {}}]	31	2
109	2019-12-17 09:29:18.78414+00	23	Suman Thakur | Exam:Theory Final | Subject:Social Studies	1	[{"added": {}}]	31	2
110	2019-12-17 09:29:35.452872+00	24	Suman Thakur | Exam:Theory Final | Subject:Mathematics	1	[{"added": {}}]	31	2
111	2019-12-17 09:52:41.751742+00	1	AdditionalSubjectMapping object (1)	2	[{"changed": {"fields": ["examName", "examType", "marks"]}}]	36	2
112	2019-12-17 09:53:09.78701+00	2	AdditionalSubjectMapping object (2)	1	[{"added": {}}]	36	2
113	2019-12-17 09:53:30.922688+00	3	AdditionalSubjectMapping object (3)	1	[{"added": {}}]	36	2
114	2019-12-20 12:38:02.684136+00	2	FeeCategory object (2)	3		44	2
115	2019-12-21 08:00:38.030724+00	1	Fee object (1)	2	[{"changed": {"fields": ["monthsPaid"]}}]	48	2
116	2019-12-21 08:01:58.846742+00	1	Fee object (1)	2	[]	48	2
117	2019-12-21 11:08:04.565503+00	2	Class:6-B| Teacher: Jainaish Thakur FeeCategory object (3) 23231	3		49	2
118	2019-12-21 11:08:05.005115+00	1	Class:6-B| Teacher: Jainaish Thakur FeeCategory object (3) 23231	3		49	2
119	2019-12-21 11:09:02.296727+00	1	Class:6-A| Student:Suman Thakur 46567 Jan,Feb	2	[{"changed": {"fields": ["amount", "monthsPaid"]}}]	48	2
120	2019-12-21 11:11:52.503737+00	2	Class:6-A| Student:Ashok Sinha 4545 Mar,Apr,Sep	1	[{"added": {}}]	48	2
121	2019-12-21 11:14:14.845832+00	1	Class:6-A| Student:Suman Thakur 46567 Jan,Feb	2	[{"changed": {"fields": ["classSection"]}}]	48	2
122	2019-12-21 12:56:57.448164+00	2	Class:6-A| Student:Ashok Sinha 4545 Mar,Apr,Sep	2	[{"changed": {"fields": ["submissionDate"]}}]	48	2
123	2019-12-21 12:57:07.920284+00	2	Class:6-A| Student:Ashok Sinha 4545 Mar,Apr,Sep	2	[{"changed": {"fields": ["submissionDate"]}}]	48	2
124	2019-12-23 18:45:11.605076+00	16	Newsletter object (16)	3		41	2
125	2019-12-23 18:45:11.769739+00	15	Newsletter object (15)	3		41	2
126	2019-12-23 18:45:11.78068+00	14	Newsletter object (14)	3		41	2
127	2019-12-23 18:45:11.791735+00	13	Newsletter object (13)	3		41	2
128	2019-12-23 18:45:11.802808+00	12	Newsletter object (12)	3		41	2
129	2019-12-23 18:45:11.81397+00	11	Newsletter object (11)	3		41	2
130	2019-12-23 18:46:14.376471+00	17	Newsletter object (17)	2	[{"changed": {"fields": ["description"]}}]	41	2
131	2019-12-24 06:30:13.196793+00	68	Newsletter object (68)	3		41	2
132	2019-12-24 06:30:13.296041+00	67	Newsletter object (67)	3		41	2
133	2019-12-24 06:30:13.307094+00	66	Newsletter object (66)	3		41	2
134	2019-12-24 06:30:13.318102+00	65	Newsletter object (65)	3		41	2
135	2019-12-24 06:30:13.329233+00	64	Newsletter object (64)	3		41	2
136	2019-12-24 06:30:13.340464+00	63	Newsletter object (63)	3		41	2
137	2019-12-24 06:30:13.351355+00	62	Newsletter object (62)	3		41	2
138	2019-12-24 06:30:13.362535+00	61	Newsletter object (61)	3		41	2
139	2019-12-24 06:30:13.373638+00	60	Newsletter object (60)	3		41	2
140	2019-12-24 06:30:13.384581+00	59	Newsletter object (59)	3		41	2
141	2019-12-24 06:30:13.395809+00	58	Newsletter object (58)	3		41	2
142	2019-12-24 06:30:13.406984+00	57	Newsletter object (57)	3		41	2
143	2019-12-24 06:30:13.429215+00	56	Newsletter object (56)	3		41	2
144	2019-12-24 06:30:13.44019+00	55	Newsletter object (55)	3		41	2
145	2019-12-24 06:30:13.451409+00	54	Newsletter object (54)	3		41	2
146	2019-12-24 06:30:13.46255+00	53	Newsletter object (53)	3		41	2
147	2019-12-24 06:30:13.473394+00	52	Newsletter object (52)	3		41	2
148	2019-12-24 06:30:13.48434+00	51	Newsletter object (51)	3		41	2
149	2019-12-24 06:30:13.495345+00	50	Newsletter object (50)	3		41	2
150	2019-12-24 06:30:13.507209+00	49	Newsletter object (49)	3		41	2
151	2019-12-24 06:30:13.51765+00	48	Newsletter object (48)	3		41	2
152	2019-12-24 06:30:13.52873+00	47	Newsletter object (47)	3		41	2
153	2019-12-24 06:30:13.539686+00	46	Newsletter object (46)	3		41	2
154	2019-12-24 06:30:13.550886+00	45	Newsletter object (45)	3		41	2
155	2019-12-24 06:30:13.561945+00	44	Newsletter object (44)	3		41	2
156	2019-12-24 06:30:13.573227+00	43	Newsletter object (43)	3		41	2
157	2019-12-24 06:30:13.584046+00	42	Newsletter object (42)	3		41	2
158	2019-12-24 06:30:13.594898+00	41	Newsletter object (41)	3		41	2
159	2019-12-24 06:30:13.607071+00	40	Newsletter object (40)	3		41	2
160	2019-12-24 06:30:13.617211+00	39	Newsletter object (39)	3		41	2
161	2019-12-24 06:30:13.628221+00	38	Newsletter object (38)	3		41	2
162	2019-12-24 06:30:13.640472+00	37	Newsletter object (37)	3		41	2
163	2019-12-24 06:30:13.650492+00	36	Newsletter object (36)	3		41	2
164	2019-12-24 06:30:13.661446+00	35	Newsletter object (35)	3		41	2
165	2019-12-24 06:30:13.673882+00	34	Newsletter object (34)	3		41	2
166	2019-12-24 06:30:13.683691+00	33	Newsletter object (33)	3		41	2
167	2019-12-24 06:30:13.694744+00	32	Newsletter object (32)	3		41	2
168	2019-12-24 06:30:13.706195+00	31	Newsletter object (31)	3		41	2
169	2019-12-24 06:30:13.716789+00	30	Newsletter object (30)	3		41	2
170	2019-12-24 06:30:13.728081+00	29	Newsletter object (29)	3		41	2
171	2019-12-24 06:30:13.740145+00	28	Newsletter object (28)	3		41	2
172	2019-12-24 06:30:13.750229+00	27	Newsletter object (27)	3		41	2
173	2019-12-24 06:30:13.761449+00	26	Newsletter object (26)	3		41	2
174	2019-12-24 06:30:13.772722+00	25	Newsletter object (25)	3		41	2
175	2019-12-24 06:30:13.783352+00	24	Newsletter object (24)	3		41	2
176	2019-12-24 06:30:13.794753+00	23	Newsletter object (23)	3		41	2
177	2019-12-24 06:30:13.805353+00	22	Newsletter object (22)	3		41	2
178	2019-12-24 06:30:13.816405+00	21	Newsletter object (21)	3		41	2
179	2019-12-24 06:30:13.827511+00	20	Newsletter object (20)	3		41	2
180	2019-12-24 06:30:13.838665+00	19	Newsletter object (19)	3		41	2
181	2019-12-24 06:30:13.849685+00	18	Newsletter object (18)	3		41	2
182	2019-12-24 06:30:13.860775+00	17	Newsletter object (17)	3		41	2
183	2019-12-24 06:38:01.499269+00	71	Newsletter object (71)	3		41	2
184	2019-12-24 06:38:01.592853+00	70	Newsletter object (70)	3		41	2
185	2019-12-24 06:46:13.073836+00	69	Newsletter object (69)	3		41	2
186	2019-12-24 06:52:10.650944+00	74	Newsletter object (74)	3		41	2
187	2019-12-24 06:53:21.050819+00	75	Newsletter object (75)	3		41	2
188	2019-12-24 07:18:04.610428+00	91	Newsletter object (91)	3		41	2
189	2019-12-24 07:18:04.660126+00	90	Newsletter object (90)	3		41	2
190	2019-12-24 07:18:04.693309+00	89	Newsletter object (89)	3		41	2
191	2019-12-24 07:18:04.726586+00	88	Newsletter object (88)	3		41	2
192	2019-12-24 07:18:04.759615+00	87	Newsletter object (87)	3		41	2
193	2019-12-24 07:18:04.792914+00	86	Newsletter object (86)	3		41	2
194	2019-12-24 07:18:04.826078+00	85	Newsletter object (85)	3		41	2
195	2019-12-24 07:18:04.859092+00	84	Newsletter object (84)	3		41	2
196	2019-12-24 07:18:04.892283+00	83	Newsletter object (83)	3		41	2
197	2019-12-24 07:18:04.925617+00	82	Newsletter object (82)	3		41	2
198	2019-12-24 07:18:04.958927+00	81	Newsletter object (81)	3		41	2
199	2019-12-24 07:18:04.992237+00	80	Newsletter object (80)	3		41	2
200	2019-12-24 07:18:05.025334+00	79	Newsletter object (79)	3		41	2
201	2019-12-24 07:18:05.058425+00	78	Newsletter object (78)	3		41	2
202	2019-12-24 07:18:05.091599+00	77	Newsletter object (77)	3		41	2
203	2019-12-24 07:18:05.124778+00	76	Newsletter object (76)	3		41	2
204	2019-12-24 07:18:05.158047+00	73	Newsletter object (73)	3		41	2
205	2019-12-24 07:18:05.19123+00	72	Newsletter object (72)	3		41	2
206	2019-12-24 07:39:54.917331+00	92	Newsletter object (92)	3		41	2
207	2019-12-24 08:19:38.410104+00	2	Rohan	2	[{"changed": {"fields": ["image"]}}]	1	2
208	2019-12-24 08:28:19.625049+00	3	Smith	3		1	2
209	2019-12-24 08:31:39.151991+00	4	Testing	3		1	2
210	2019-12-24 08:47:11.179005+00	8	Test12345	3		1	2
211	2019-12-24 08:47:11.19098+00	7	Test123	3		1	2
212	2019-12-24 08:47:11.202384+00	6	Testing1234	3		1	2
213	2019-12-24 08:47:11.213167+00	5	Testing123	3		1	2
214	2019-12-24 10:04:04.372423+00	1	yash	2	[{"changed": {"fields": ["image"]}}]	1	2
215	2019-12-24 10:04:34.517945+00	12	Smith	2	[{"changed": {"fields": ["user", "mobile_no"]}}]	1	2
216	2019-12-24 11:09:26.943368+00	11	kakkl	3		5	2
217	2019-12-24 11:09:26.97819+00	12	kakklqwqw	3		5	2
218	2019-12-24 11:09:26.989224+00	13	kakklqwqwqw	3		5	2
219	2019-12-24 11:09:27.000498+00	3	Rohan	3		5	2
220	2019-12-24 11:09:27.011345+00	8	Test123	3		5	2
221	2019-12-24 11:09:27.022454+00	9	Test12345	3		5	2
222	2019-12-24 11:09:27.03351+00	5	Testing	3		5	2
223	2019-12-24 11:09:27.044536+00	6	Testing123	3		5	2
224	2019-12-24 11:09:27.055639+00	7	Testing1234	3		5	2
225	2019-12-24 11:09:27.066891+00	10	Testing123456	3		5	2
226	2019-12-24 11:15:33.147539+00	4	Smith	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	5	2
227	2019-12-24 11:26:38.919266+00	12	Smith	2	[{"changed": {"fields": ["fullName"]}}]	1	4
228	2019-12-25 16:32:06.657628+00	116	Newsletter object (116)	3		41	2
229	2019-12-25 16:32:06.770873+00	115	Newsletter object (115)	3		41	2
230	2019-12-25 16:32:06.782015+00	114	Newsletter object (114)	3		41	2
231	2019-12-25 16:32:06.79303+00	113	Newsletter object (113)	3		41	2
232	2019-12-25 16:32:06.837458+00	112	Newsletter object (112)	3		41	2
233	2019-12-25 16:32:06.848541+00	111	Newsletter object (111)	3		41	2
234	2019-12-25 16:32:06.859622+00	110	Newsletter object (110)	3		41	2
235	2019-12-25 16:32:06.881317+00	109	Newsletter object (109)	3		41	2
236	2019-12-25 16:32:06.892538+00	108	Newsletter object (108)	3		41	2
237	2019-12-25 16:32:06.90375+00	107	Newsletter object (107)	3		41	2
238	2019-12-25 16:32:06.914821+00	106	Newsletter object (106)	3		41	2
239	2019-12-25 16:32:06.925903+00	105	Newsletter object (105)	3		41	2
240	2019-12-25 16:32:06.936956+00	104	Newsletter object (104)	3		41	2
241	2019-12-25 16:32:06.948028+00	103	Newsletter object (103)	3		41	2
242	2019-12-25 16:32:06.95906+00	102	Newsletter object (102)	3		41	2
243	2019-12-25 16:32:06.97032+00	101	Newsletter object (101)	3		41	2
244	2019-12-25 16:32:06.981284+00	100	Newsletter object (100)	3		41	2
245	2019-12-25 16:32:06.992046+00	99	Newsletter object (99)	3		41	2
246	2019-12-25 16:32:07.003077+00	98	Newsletter object (98)	3		41	2
247	2019-12-25 16:32:07.014125+00	97	Newsletter object (97)	3		41	2
248	2019-12-25 16:32:07.049846+00	96	Newsletter object (96)	3		41	2
249	2019-12-25 16:32:07.082495+00	95	Newsletter object (95)	3		41	2
250	2019-12-25 16:32:07.108948+00	94	Newsletter object (94)	3		41	2
251	2019-12-25 16:32:14.552087+00	93	Newsletter object (93)	2	[{"changed": {"fields": ["date"]}}]	41	2
252	2019-12-25 17:07:20.070478+00	1	yash	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	5	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	accounts	userprofile
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
8	form	studentinfo
9	form	parentinfo
10	form	documents
11	form	currentaddress
12	form	permanentaddress
13	teacherform	employeedocuments
14	teacherform	employee
15	teacherform	teacher
16	employeeform	teacher
17	employeeform	employeedocuments
18	employeeform	employee
19	employeeform	permanentaddress
20	employeeform	currentaddress
21	classform	classroom
22	classform	classroomstudent
23	attendence	studentattendence
24	attendence	teacherattendence
25	marks	examtype
26	marks	subjectstoclass
27	marks	marks
28	marks	exam
29	marks	exammapping
30	marks	additionalsubject
31	markssection	marks
32	markssection	exam
33	markssection	exammapping
34	markssection	examtype
35	markssection	additionalsubject
36	markssection	additionalsubjectmapping
37	homework	homework
38	notice	classnotice
39	notice	studentnotice
40	dailythought	thoughts
41	newsletter	newsletter
42	schoolinfo	schoolinfo
43	holiday	holiday
44	fees	feecategory
45	fees	feecycle
46	fees	feediscount
47	fees	fine
48	fees	fee
49	fees	classsectionfees
50	homework	syllabus
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-03 06:38:19.830653+00
2	auth	0001_initial	2019-12-03 06:38:20.198801+00
3	accounts	0001_initial	2019-12-03 06:38:20.837133+00
4	accounts	0002_auto_20191202_1037	2019-12-03 06:38:20.98694+00
5	admin	0001_initial	2019-12-03 06:38:21.118142+00
6	admin	0002_logentry_remove_auto_add	2019-12-03 06:38:21.238454+00
7	admin	0003_logentry_add_action_flag_choices	2019-12-03 06:38:21.270029+00
8	contenttypes	0002_remove_content_type_name	2019-12-03 06:38:21.315389+00
9	auth	0002_alter_permission_name_max_length	2019-12-03 06:38:21.337847+00
10	auth	0003_alter_user_email_max_length	2019-12-03 06:38:21.368507+00
11	auth	0004_alter_user_username_opts	2019-12-03 06:38:21.400553+00
12	auth	0005_alter_user_last_login_null	2019-12-03 06:38:21.419576+00
13	auth	0006_require_contenttypes_0002	2019-12-03 06:38:21.429578+00
14	auth	0007_alter_validators_add_error_messages	2019-12-03 06:38:21.46006+00
15	auth	0008_alter_user_username_max_length	2019-12-03 06:38:21.528431+00
16	auth	0009_alter_user_last_name_max_length	2019-12-03 06:38:21.558244+00
17	auth	0010_alter_group_name_max_length	2019-12-03 06:38:21.589089+00
18	auth	0011_update_proxy_permissions	2019-12-03 06:38:21.610388+00
19	sessions	0001_initial	2019-12-03 06:38:21.695526+00
20	form	0001_initial	2019-12-03 09:45:02.038996+00
21	form	0002_auto_20191204_1534	2019-12-04 10:04:48.559332+00
22	form	0003_auto_20191204_1656	2019-12-04 11:26:51.125674+00
23	form	0004_studentinfo_fname	2019-12-04 12:21:26.200659+00
24	form	0005_auto_20191204_1803	2019-12-04 12:33:45.888357+00
25	form	0006_auto_20191204_2230	2019-12-04 17:00:32.022084+00
26	form	0007_auto_20191204_2234	2019-12-04 17:04:43.976883+00
27	form	0008_currentaddress_city	2019-12-04 19:50:26.538903+00
28	form	0009_auto_20191205_0127	2019-12-04 19:57:33.324896+00
29	teacherform	0001_initial	2019-12-05 11:21:18.625715+00
30	employeeform	0001_initial	2019-12-06 07:35:01.685337+00
31	employeeform	0002_currentaddress_permanentaddress	2019-12-06 09:34:42.273471+00
32	employeeform	0003_auto_20191206_1619	2019-12-06 10:49:45.201609+00
33	form	0010_auto_20191206_1628	2019-12-06 10:59:02.936836+00
34	employeeform	0004_auto_20191206_1630	2019-12-06 11:00:37.214343+00
35	classform	0001_initial	2019-12-07 09:31:31.682729+00
36	employeeform	0005_auto_20191209_1730	2019-12-09 12:00:50.349272+00
37	attendence	0001_initial	2019-12-09 12:00:51.355304+00
38	classform	0002_auto_20191209_2352	2019-12-09 18:22:49.774506+00
39	classform	0003_auto_20191210_0002	2019-12-09 18:32:10.116961+00
40	classform	0004_auto_20191210_0011	2019-12-09 18:42:01.883328+00
41	attendence	0002_auto_20191210_1307	2019-12-10 07:37:36.597976+00
42	attendence	0003_auto_20191210_1737	2019-12-10 12:07:57.832733+00
43	attendence	0004_auto_20191210_2341	2019-12-10 18:11:17.33577+00
44	marks	0001_initial	2019-12-11 20:00:57.477451+00
45	marks	0002_auto_20191213_1719	2019-12-13 11:49:54.244371+00
46	markssection	0001_initial	2019-12-13 11:54:48.637545+00
47	markssection	0002_marks_examname	2019-12-13 13:03:20.095388+00
48	markssection	0003_auto_20191213_2340	2019-12-13 18:10:29.115281+00
49	homework	0001_initial	2019-12-18 07:20:48.724438+00
50	notice	0001_initial	2019-12-18 08:52:37.884812+00
51	dailythought	0001_initial	2019-12-19 07:50:44.575603+00
52	newsletter	0001_initial	2019-12-19 08:47:48.967396+00
53	newsletter	0002_auto_20191219_1419	2019-12-19 08:49:15.405205+00
54	newsletter	0003_auto_20191219_1420	2019-12-19 08:50:21.058556+00
55	schoolinfo	0001_initial	2019-12-19 10:35:18.466848+00
56	schoolinfo	0002_auto_20191219_1605	2019-12-19 10:35:18.50683+00
57	holiday	0001_initial	2019-12-19 11:56:27.569884+00
58	fees	0001_initial	2019-12-20 11:26:55.13996+00
59	newsletter	0004_auto_20191220_1656	2019-12-20 11:26:55.747336+00
60	fees	0002_auto_20191221_1512	2019-12-21 09:43:01.728073+00
61	newsletter	0005_auto_20191221_1512	2019-12-21 09:43:02.132809+00
62	newsletter	0005_auto_20191221_2021	2019-12-23 16:47:47.453213+00
63	newsletter	0006_auto_20191221_2047	2019-12-23 16:47:47.620493+00
64	newsletter	0007_merge_20191223_2217	2019-12-23 16:47:47.635334+00
65	accounts	0003_userprofile_image	2019-12-24 07:50:35.513395+00
66	fees	0003_fine_submissiondate	2019-12-24 07:50:36.620064+00
67	newsletter	0008_auto_20191224_1320	2019-12-24 07:50:36.648315+00
68	accounts	0004_auto_20191224_1412	2019-12-24 08:42:12.6633+00
69	accounts	0005_auto_20191224_1638	2019-12-24 11:08:57.59977+00
70	accounts	0006_userprofile_fullname	2019-12-24 11:23:22.837985+00
71	form	0011_remove_parentinfo_gaurdianname	2019-12-24 20:12:02.712169+00
72	newsletter	0007_merge_20191223_1057	2019-12-24 20:12:03.023635+00
73	newsletter	0008_auto_20191223_1057	2019-12-24 20:12:03.135603+00
74	newsletter	0009_merge_20191225_0141	2019-12-24 20:12:03.148927+00
75	form	0012_auto_20191225_2229	2019-12-25 16:59:30.813762+00
76	homework	0002_syllabus	2019-12-25 16:59:31.550471+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
9uatucct0nt5qsrnccwmee04pv6mdb02	YmZhN2Y5NmQ4ZjM1YzU5ZDY0ZWMxYjU4OTY1MjkyZjM3Y2U4YWQwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWFhZjhmMDYzZDk1OGI5NmMyNGVlM2Y2MTU1NjY2NjEwZTc1ODJlIn0=	2020-01-08 17:07:37.566204+00
azgkr0emzy4vcu4fevabf9x8a4p299w4	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:42:36.547035+00
4u8s6xbhnx8tslywobqfrhu3zkjbfzf1	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:44:58.656373+00
rl9itx9w57tddbug8d59ta151t5n8gvp	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:45:31.572683+00
5pim89hg8ejuvibd95cu4m226cwsm1pq	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:50:33.060822+00
i1fvoj2x1ph1h73f5befzfx50yz2hkgs	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:52:16.08979+00
\.


--
-- Data for Name: employeeform_currentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_currentaddress (employee_id, "Address", "Address1", "Address2", "zipCode", state, city) FROM stdin;
101010				0		
10101012				0		
4451212				0		
45465456				0		
\.


--
-- Data for Name: employeeform_employee; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_employee ("empID", "firstName", "lastName", "fullName", father_name, mother_name, "partnerName", gender, email, "currentAddress", "permanentAddress", dob, "joiningDate", "bloodGroup", mobile_number, marital_status, experience, "aadharNumber", "empCategory") FROM stdin;
1223	Rohan	Pawar	RohanPawar	Ramesh	Radha	Priya	Male	sdsdds@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	2 years	13133126	teacher
6577	Kartik	Singh	KartikSingh	Ramesh	Radha	Priya	Male	sdsdds@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	2 years	13133126	teacher
89	Aryan	Tukrul	AryanTukrul	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	teacher
89999	Aryan	Tukrul	AryanTukrul	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	teacher
78788	Aryan	Tukrul	AryanTukrul	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	teacher
899	Shubham	Shahi	ShubhamShahi	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	peon
786	Aakash	Boura	AakashBoura	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	manager
101010	Jainaish	Thakur	Jainaish Thakur	wewewewewew	wewewewe	wewewe	Male	sdsd@gmail.com	wewee ewewe,Mumbai,Maharashtra-420123	wewee ewewe,Mumbai,Maharashtra-420123	2019-12-25	2019-11-25	B+	4646464646	Unmarried	8 years	131313131	teacher
10101012	Jainaish	Thakur	Jainaish Thakur	wewewewewew	wewewewe	wewewe	Male	sdsd@gmail.com	wewee ewewe,Mumbai,Maharashtra-420123	wewee ewewe,Mumbai,Maharashtra-420123	2019-12-25	2019-11-25	B+	4646464646	Unmarried	8 years	131313131	teacher
445454											\N	\N		0			0	
4451212	test	test	test test	uyuyu	yuyuy	uyuyuy	Male	aa@gmail.com	yuuyuy uyuy,yuyuy,yuyu-yuy	yuuyuy uyuy,yuyuy,yuyu-yuy	2019-11-26	2019-12-02	A	45465464	qwqw	yuuyuy	46546546464	receptionist
45465456	test2	test2	test2 test2	kjjkj	jkjkj	jkjkj	Male	aa@gmail.com	jkkjk jkj,jkjk,jkkjk-jkj	jkkjk jkj,jkjk,jkkjk-jkj	2019-12-10	2019-12-09	A	31212121	kjkj	jkjkj	546464646	coordinator
\.


--
-- Data for Name: employeeform_employeedocuments; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_employeedocuments (employee_id, photo, "qualificationDoc", "IdProof", "addressProof", "otherDoc") FROM stdin;
1223	uploads/emp/photograph/Blazer.jpg	uploads/emp/qualificationDocs/mobile.jpg	uploads/emp/idProof/shirt.jpg	uploads/emp/addressProof/USB.jpg	uploads/emp/otherDoc/jeans.jpg
6577	uploads/emp/photograph/Blazer_8LqQFDd.jpg	uploads/emp/qualificationDocs/mobile_ZRQqISG.jpg	uploads/emp/idProof/shirt_a1gLma8.jpg	uploads/emp/addressProof/USB_hC0NQHw.jpg	uploads/emp/otherDoc/jeans_p8u7ODp.jpg
899	uploads/emp/photograph/Blazer_4YzoY1D.jpg	uploads/emp/qualificationDocs/mobile_Okaa7Yw.jpg	uploads/emp/idProof/shirt_bPWp85W.jpg	uploads/emp/addressProof/USB_Mtf3VbN.jpg	uploads/emp/otherDoc/jeans_viSsUqq.jpg
89	uploads/emp/photograph/Blazer_oXDBYyi.jpg	uploads/emp/qualificationDocs/mobile_qp4gBS8.jpg	uploads/emp/idProof/shirt_MurkfaR.jpg	uploads/emp/addressProof/USB_x7nwVMb.jpg	uploads/emp/otherDoc/jeans_kjqnppq.jpg
89999	uploads/emp/photograph/Blazer_kF86ugO.jpg	uploads/emp/qualificationDocs/mobile_3a0sILN.jpg	uploads/emp/idProof/shirt_ZlLdncs.jpg	uploads/emp/addressProof/USB_rR4ohcC.jpg	uploads/emp/otherDoc/jeans_t9ANcNr.jpg
78788	uploads/emp/photograph/Blazer_RcCM1gs.jpg	uploads/emp/qualificationDocs/mobile_FNf86sY.jpg	uploads/emp/idProof/shirt_X1Vt9hz.jpg	uploads/emp/addressProof/USB_nKn5xjW.jpg	uploads/emp/otherDoc/jeans_xeB2fsX.jpg
786	uploads/emp/photograph/Blazer_7faKlTx.jpg	uploads/emp/qualificationDocs/mobile_W6pKLZK.jpg	uploads/emp/idProof/shirt_Ve39DP5.jpg	uploads/emp/addressProof/USB_hhAErba.jpg	uploads/emp/otherDoc/jeans_bwdQoG7.jpg
10101012	uploads/emp/photograph/shirt.jpg	uploads/emp/qualificationDocs/bat.jpg	uploads/emp/idProof/shirt_1AkdrCo.jpg	uploads/emp/addressProof/bat.jpg	uploads/emp/otherDoc/bat.jpg
4451212	emp/test test/bat.jpg	emp/test test/bat_qYtvtYG.jpg	emp/test test/bat_kYWrH1f.jpg	emp/test test/bat_J89bs8c.jpg	emp/test test/bat_SlCtcfs.jpg
45465456	emp/test2 test2/bat.jpg	emp/test2 test2/bat_cqf3ATX.jpg	emp/test2 test2/bat_ISrmMO8.jpg	emp/test2 test2/bat_31EPcvS.jpg	emp/test2 test2/bat_NRohnvE.jpg
\.


--
-- Data for Name: employeeform_permanentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_permanentaddress (employee_id, "Address", "Address1", "Address2", "zipCode", state, city) FROM stdin;
101010				0		
10101012				0		
4451212				0		
45465456				0		
\.


--
-- Data for Name: employeeform_teacher; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_teacher (employee_id, "firstName", "lastName", "fullName", specialization, designation, "classTeacher") FROM stdin;
1223	Rohan	Pawar	Rohan Pawar	sdsdsdsds	Ss	6-A
6577	Kartik	Singh	Kartik Singh	sdsdsdsd	Ss	6-C
10101012	Jainaish	Thakur	Jainaish Thakur	sdsdsdsd	464	6-B
\.


--
-- Data for Name: fees_classsectionfees; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_classsectionfees (id, fees, "classSection_id", "feeCategory_id") FROM stdin;
3	23231	1	3
4	121212	3	1
\.


--
-- Data for Name: fees_fee; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_fee (id, "regNo", payment_method, "submissionDate", "monthsPaid", "classSection_id", student_id, amount) FROM stdin;
1	989898	uiuiu	2019-12-20	Jan,Feb	3	1	46567
2	54545	nkkj	2019-11-13	Mar,Apr,Sep	3	3	4545
\.


--
-- Data for Name: fees_feecategory; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_feecategory (id, once, submission_type, description) FROM stdin;
1	t	once	sdsds
3	f	Monthly	aaaa
\.


--
-- Data for Name: fees_feecycle; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_feecycle (id, "lastSubmissionDate", "firstSubmissionDate", cycle) FROM stdin;
1	2019-12-27	2019-12-17	monthly
\.


--
-- Data for Name: fees_feediscount; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_feediscount (id, discount, category, description, total_off, student_id) FROM stdin;
13	5		sdsdsd	2304	1
14	5		sdsdsd	2304	1
15	5		sdsdsd	2304	1
\.


--
-- Data for Name: fees_fine; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_fine (id, fine, category, description, student_id, "submissionDate") FROM stdin;
2	45454	tets	sdsdsd	1	2019-12-24
\.


--
-- Data for Name: form_currentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_currentaddress (student_id, "Address", "zipCode", state, city, "Address1", "Address2") FROM stdin;
122		0				
2231		0				
12345		0				
9766	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
19766	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
1	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
2	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
\.


--
-- Data for Name: form_documents; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_documents (student_id, photo, "idProof", "castCertificate", domicile, tc, "characterCertificate") FROM stdin;
122	uploads/photograph/bat.jpg	uploads/idProof/tabletennis.jpg	uploads/castCertificate/tabletennis.jpg	uploads/domicile/USB.jpg	uploads/tc/USB.jpg	uploads/characterCertificate/shirt.jpg
\.


--
-- Data for Name: form_parentinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_parentinfo (student_id, "fatherName", "motherName", "Fatherdob", "Motherdob", "MobileNumber", "altMobileNumber", "gaurdianQual", "guardianOccup", email, "motherQual", "motherOccup") FROM stdin;
122	asasas	asasas	2019-11-25	2019-11-25	4563	3449	asasas	asasas	asasas	asasas	
2231	suresh	priya	2019-12-24	2019-12-09	4654646465	4646464855	hjhjhjhj	ererererer	aysy@gmail.com	xcxcxcxcxc	
12345	suresh	priya	2019-12-24	2019-12-09	4654646465	4646464855	hjhjhjhj	ererererer	aysy@gmail.com	xcxcxcxcxc	
19766	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
1	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
2	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
9766	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
\.


--
-- Data for Name: form_permanentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_permanentaddress (student_id, "Address", "zipCode", state, city, "Address1", "Address2") FROM stdin;
122		0				
12345		0				
19766	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
2231	E 303, Something	401330	Maharashtra	Mumbai		
1	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
2	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
9766	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
\.


--
-- Data for Name: form_studentinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_studentinfo ("firstName", "lastName", gender, dob, "classSection", "admissionNumber", "mobileNumber", religion, caste, "tcNumber", "aadharNumber", "feeWaiverCategory", "siblingID", "prevSchoolName", "fullName") FROM stdin;
Soham	Singh	Male	2000-07-01		9766	5656565656	Hindu	Brahmin	464646	464646	hkhkhkh	23331		
asasas	asas	Male	2019-12-02	False	98	121212	asasas	asasas	456	56	asasas	34567	asasas	asasasas 
kartik	eret	Female	2019-12-02	False	988	121212	asasas	asasas	456	56	asasas	34567	asasas	kartik eret 
ramesh	singh	Male	2019-11-24	6-B	223	78965423198	Hindu	Brahman	454545454	546464646	Some Category	464646	euadsdcxvv	rameshsingh
Suman	Thakur	Male	2019-11-24	6-A	2231	78965423198	Hindu	Brahman	454545454	546464646	Some Category	464646	euadsdcxvv	Suman Thakur
yash	dff	Male	2019-12-02	6-C	122	121212	asasas	asasas	456	56	asasas	34567	asasas	yash dfs
			\N	6-A	4646464	0			0	0		0		
ramesh	singh	Male	2019-11-24	6-B	12345	78965423198	Hindu	Brahman	454545454	546464646	Some Category	464646	euadsdcxvv	rameshsingh
Ashok	Sinha	Male	2019-12-03	6-A	323198964	545454545	jljlj	jljlj	4646464	4646464	jkjkj	797979	asasas	Ashok Sinha
Ashok	Sinha	Male	2019-12-03	6-A	3231	545454545	jljlj	jljlj	4646464	4646464	jkjkj	797979	asasas	Ashok Sinha
Soham	Singh	Male	2000-07-01		19766	5656565656	Hindu	Brahmin	464646	464646	hkhkhkh	23331	sdsdsdsd	Soham Singh
Soham	Singh	Male	2000-07-01		1	5656565656	Hindu	Brahmin	464646	464646	hkhkhkh	23331	sdsdsdsd	Soham Singh
Dhruv	D’Sourza	Male	2001-05-01		2	1212121212	Muslim	Sdsd	464646	464646	hkhkhkh	23331	sdsdsdsd	Dhruv D’Sourza
\.


--
-- Data for Name: holiday_holiday; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.holiday_holiday (id, title, "startDate", "endDate") FROM stdin;
1	ssdsd	2019-12-02	2019-12-04
2	ssdsd	2019-12-02	2019-12-04
3	fdfdf	2019-12-02	2019-12-04
\.


--
-- Data for Name: homework_homework; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.homework_homework (id, description, subject, document, date_published, "classRoom_id") FROM stdin;
7	Something	English	homework/6-A/pip.txt	2019-12-18	3
8	dejvhjnvbn	Mathematics	homework/6-A/pip_AcUQsMI.txt	2019-12-18	3
10	asasas	Social Studies		2019-12-19	3
15	\r\n           \r\n          ghghg		homework/6-A/logo.png	2019-12-25	3
\.


--
-- Data for Name: homework_syllabus; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.homework_syllabus (id, description, document, date_published, "classRoom_id") FROM stdin;
\.


--
-- Data for Name: markssection_additionalsubjectmapping; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_additionalsubjectmapping (id, subject, marks, "classroomStudent_id", "examName_id", "examType_id") FROM stdin;
1	Drawing	63	1	4	2
2	Drawing	68	1	3	5
3	Drawing	72	1	5	7
\.


--
-- Data for Name: markssection_exam; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_exam (id, "examName", description) FROM stdin;
1	UT-1	Unit Test
2	UT-2	Unit Test
4	SA-1	half yearly exam
3	SA-2	annual exam
5	Final	Final Exam
\.


--
-- Data for Name: markssection_exammapping; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_exammapping (id, subject, classroom_id, "examName_id", "examType_id") FROM stdin;
1	English	3	2	1
3	Science	3	2	1
12	English	3	1	6
13	Science	3	1	6
15	Social Studies	3	1	6
11	Social Studies	3	4	2
10	Science	3	4	2
9	English	3	4	2
8	Mathematics	3	4	2
14	Mathematics	3	1	6
6	Social Studies	3	3	5
7	Mathematics	3	3	5
5	Science	3	3	5
4	English	3	3	5
2	Mathematics	3	2	1
16	Social Studies	3	2	1
17	English	3	5	7
18	Mathematics	3	5	7
19	Social Studies	3	5	7
20	Science	3	5	7
\.


--
-- Data for Name: markssection_examtype; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_examtype (id, "examType", "minMarks", "maxMarks", priority, "examName_id") FROM stdin;
5	Theory	24	80	3	3
6	Theory	8	20	\N	1
2	Theory	24	80	1	4
1	Theory	8	20	3	2
7	Theory	33	100	1	5
\.


--
-- Data for Name: markssection_marks; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_marks (id, subject, marks, "classroomStudent_id", "examType_id", "examName_id") FROM stdin;
2	Science	45	2	1	2
3	Science	48	3	1	2
5	Science	68	1	5	3
6	Social Studies	75	1	5	3
8	Mathematics	65	1	5	3
9	English	15	1	1	2
1	Science	14	1	1	2
4	Mathematics	19	1	5	2
10	Social Studies	16	1	1	2
11	English	70	1	2	4
12	Social Studies	68	1	2	4
15	English	15	1	6	1
16	Social Studies	18	1	6	1
17	Science	14	1	6	1
18	Mathematics	12	1	6	1
14	Mathematics	23	1	2	4
7	English	19	1	5	3
13	Science	11	1	2	4
20	English	45	2	7	5
21	English	54	3	7	5
19	English	56	1	7	5
22	Science	74	1	7	5
23	Social Studies	69	1	7	5
24	Mathematics	62	1	7	5
\.


--
-- Data for Name: newsletter_newsletter; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.newsletter_newsletter (id, description, date) FROM stdin;
93	<div align="center"><i><b>\r\n       \r\n      This is sample news for testing</b></i></div><div align="left"><a href="https://www.google.com/">https://www.google.com/</a><i><b>. </b></i>This is a sample link<i><b>. <br></b></i></div><div align="left"><ul><li><i>Testing</i></li><li><i>Testing 2</i></li><li><i>Testing 3<b><br></b></i></li></ul></div>	2019-12-25
\.


--
-- Data for Name: notice_classnotice; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.notice_classnotice (id, notice, notice_document, "classRoom_id") FROM stdin;
1	Notice	notice/6-A/pip_zHyqtqm.txt	3
2	Notice	notice/6-A/pip_XRcLwGo.txt	3
\.


--
-- Data for Name: notice_studentnotice; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.notice_studentnotice (id, notice, notice_document, student_id) FROM stdin;
1	Testing	notice/2231/pip.txt	1
\.


--
-- Data for Name: schoolinfo_schoolinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.schoolinfo_schoolinfo ("schoolName", addresss, "principalName", email, city, state, "zipCode", "schoolID", longitude, latitude, "contactNumber", "webSiteURL", img, logo) FROM stdin;
asasas	jkjkj	asas	gh@gmail.com	kkjk	jkjk	545	78787	78	989	8989898	kjkhk	schoolInfo/asasas/try_IDd1vvB.py	schoolInfo/asasas/Screenshot_from_2019-11-22_22-07-42_oN3gKuU.png
\.


--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 12, true);


--
-- Name: attendence_studentattendence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.attendence_studentattendence_id_seq', 11, true);


--
-- Name: attendence_teacherattendence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.attendence_teacherattendence_id_seq', 5, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 200, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 13, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: classform_classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_classroom_id_seq', 6, true);


--
-- Name: classform_classroomstudent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_classroomstudent_id_seq', 7, true);


--
-- Name: dailythought_thoughts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.dailythought_thoughts_id_seq', 18, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 252, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 50, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 76, true);


--
-- Name: fees_classsectionfees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_classsectionfees_id_seq', 4, true);


--
-- Name: fees_fee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_fee_id_seq', 2, true);


--
-- Name: fees_feecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_feecategory_id_seq', 3, true);


--
-- Name: fees_feecycle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_feecycle_id_seq', 1, true);


--
-- Name: fees_feediscount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_feediscount_id_seq', 15, true);


--
-- Name: fees_fine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_fine_id_seq', 2, true);


--
-- Name: holiday_holiday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.holiday_holiday_id_seq', 3, true);


--
-- Name: homework_homework_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.homework_homework_id_seq', 15, true);


--
-- Name: homework_syllabus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.homework_syllabus_id_seq', 1, false);


--
-- Name: markssection_additionalsubjectmapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_additionalsubjectmapping_id_seq', 3, true);


--
-- Name: markssection_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_exam_id_seq', 5, true);


--
-- Name: markssection_exammapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_exammapping_id_seq', 20, true);


--
-- Name: markssection_examtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_examtype_id_seq', 7, true);


--
-- Name: markssection_marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_marks_id_seq', 24, true);


--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.newsletter_newsletter_id_seq', 116, true);


--
-- Name: notice_classnotice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.notice_classnotice_id_seq', 2, true);


--
-- Name: notice_studentnotice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.notice_studentnotice_id_seq', 1, true);


--
-- Name: accounts_userprofile accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: attendence_studentattendence attendence_studentattendence_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_studentattendence
    ADD CONSTRAINT attendence_studentattendence_pkey PRIMARY KEY (id);


--
-- Name: attendence_teacherattendence attendence_teacherattendence_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_teacherattendence
    ADD CONSTRAINT attendence_teacherattendence_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: classform_classroom classform_classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom
    ADD CONSTRAINT classform_classroom_pkey PRIMARY KEY (id);


--
-- Name: classform_classroom classform_classroom_teacher_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom
    ADD CONSTRAINT classform_classroom_teacher_id_key UNIQUE (teacher_id);


--
-- Name: classform_classroomstudent classform_classroomstudent_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT classform_classroomstudent_pkey PRIMARY KEY (id);


--
-- Name: classform_classroomstudent classform_classroomstudent_student_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT classform_classroomstudent_student_id_key UNIQUE (student_id);


--
-- Name: dailythought_thoughts dailythought_thoughts_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.dailythought_thoughts
    ADD CONSTRAINT dailythought_thoughts_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: employeeform_currentaddress employeeform_currentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_currentaddress
    ADD CONSTRAINT employeeform_currentaddress_pkey PRIMARY KEY (employee_id);


--
-- Name: employeeform_employee employeeform_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_employee
    ADD CONSTRAINT employeeform_employee_pkey PRIMARY KEY ("empID");


--
-- Name: employeeform_employeedocuments employeeform_employeedocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_employeedocuments
    ADD CONSTRAINT employeeform_employeedocuments_pkey PRIMARY KEY (employee_id);


--
-- Name: employeeform_permanentaddress employeeform_permanentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_permanentaddress
    ADD CONSTRAINT employeeform_permanentaddress_pkey PRIMARY KEY (employee_id);


--
-- Name: employeeform_teacher employeeform_teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_teacher
    ADD CONSTRAINT employeeform_teacher_pkey PRIMARY KEY (employee_id);


--
-- Name: fees_classsectionfees fees_classsectionfees_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees
    ADD CONSTRAINT fees_classsectionfees_pkey PRIMARY KEY (id);


--
-- Name: fees_fee fees_fee_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee
    ADD CONSTRAINT fees_fee_pkey PRIMARY KEY (id);


--
-- Name: fees_feecategory fees_feecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecategory
    ADD CONSTRAINT fees_feecategory_pkey PRIMARY KEY (id);


--
-- Name: fees_feecycle fees_feecycle_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecycle
    ADD CONSTRAINT fees_feecycle_pkey PRIMARY KEY (id);


--
-- Name: fees_feediscount fees_feediscount_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feediscount
    ADD CONSTRAINT fees_feediscount_pkey PRIMARY KEY (id);


--
-- Name: fees_fine fees_fine_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fine
    ADD CONSTRAINT fees_fine_pkey PRIMARY KEY (id);


--
-- Name: form_currentaddress form_currentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_currentaddress
    ADD CONSTRAINT form_currentaddress_pkey PRIMARY KEY (student_id);


--
-- Name: form_documents form_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_documents
    ADD CONSTRAINT form_documents_pkey PRIMARY KEY (student_id);


--
-- Name: form_parentinfo form_parentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_parentinfo
    ADD CONSTRAINT form_parentinfo_pkey PRIMARY KEY (student_id);


--
-- Name: form_permanentaddress form_permanentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_permanentaddress
    ADD CONSTRAINT form_permanentaddress_pkey PRIMARY KEY (student_id);


--
-- Name: form_studentinfo form_studentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_studentinfo
    ADD CONSTRAINT form_studentinfo_pkey PRIMARY KEY ("admissionNumber");


--
-- Name: holiday_holiday holiday_holiday_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.holiday_holiday
    ADD CONSTRAINT holiday_holiday_pkey PRIMARY KEY (id);


--
-- Name: homework_homework homework_homework_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_homework
    ADD CONSTRAINT homework_homework_pkey PRIMARY KEY (id);


--
-- Name: homework_syllabus homework_syllabus_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_syllabus
    ADD CONSTRAINT homework_syllabus_pkey PRIMARY KEY (id);


--
-- Name: markssection_additionalsubjectmapping markssection_additionalsubjectmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT markssection_additionalsubjectmapping_pkey PRIMARY KEY (id);


--
-- Name: markssection_exam markssection_exam_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exam
    ADD CONSTRAINT markssection_exam_pkey PRIMARY KEY (id);


--
-- Name: markssection_exammapping markssection_exammapping_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT markssection_exammapping_pkey PRIMARY KEY (id);


--
-- Name: markssection_examtype markssection_examtype_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_examtype
    ADD CONSTRAINT markssection_examtype_pkey PRIMARY KEY (id);


--
-- Name: markssection_marks markssection_marks_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT markssection_marks_pkey PRIMARY KEY (id);


--
-- Name: newsletter_newsletter newsletter_newsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.newsletter_newsletter
    ADD CONSTRAINT newsletter_newsletter_pkey PRIMARY KEY (id);


--
-- Name: notice_classnotice notice_classnotice_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_classnotice
    ADD CONSTRAINT notice_classnotice_pkey PRIMARY KEY (id);


--
-- Name: notice_studentnotice notice_studentnotice_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_studentnotice
    ADD CONSTRAINT notice_studentnotice_pkey PRIMARY KEY (id);


--
-- Name: schoolinfo_schoolinfo schoolinfo_schoolinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.schoolinfo_schoolinfo
    ADD CONSTRAINT schoolinfo_schoolinfo_pkey PRIMARY KEY ("schoolID");


--
-- Name: attendence_studentattendence_student_id_3f6e948f; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX attendence_studentattendence_student_id_3f6e948f ON public.attendence_studentattendence USING btree (student_id);


--
-- Name: attendence_teacherattendence_teacher_id_3478c5fb; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX attendence_teacherattendence_teacher_id_3478c5fb ON public.attendence_teacherattendence USING btree (teacher_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: classform_classroomstudent_classRoom_id_f067618b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "classform_classroomstudent_classRoom_id_f067618b" ON public.classform_classroomstudent USING btree ("classRoom_id");


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fees_classsectionfees_classSection_id_a29d9f99; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "fees_classsectionfees_classSection_id_a29d9f99" ON public.fees_classsectionfees USING btree ("classSection_id");


--
-- Name: fees_classsectionfees_feeCategory_id_0f8cfa84; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "fees_classsectionfees_feeCategory_id_0f8cfa84" ON public.fees_classsectionfees USING btree ("feeCategory_id");


--
-- Name: fees_fee_classSection_id_7c0b3dc5; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "fees_fee_classSection_id_7c0b3dc5" ON public.fees_fee USING btree ("classSection_id");


--
-- Name: fees_fee_student_id_664ca066; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX fees_fee_student_id_664ca066 ON public.fees_fee USING btree (student_id);


--
-- Name: fees_feediscount_student_id_d0d7a89a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX fees_feediscount_student_id_d0d7a89a ON public.fees_feediscount USING btree (student_id);


--
-- Name: fees_fine_student_id_bb221b6a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX fees_fine_student_id_bb221b6a ON public.fees_fine USING btree (student_id);


--
-- Name: homework_homework_classRoom_id_eec0049c; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "homework_homework_classRoom_id_eec0049c" ON public.homework_homework USING btree ("classRoom_id");


--
-- Name: homework_syllabus_classRoom_id_f958b607; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "homework_syllabus_classRoom_id_f958b607" ON public.homework_syllabus USING btree ("classRoom_id");


--
-- Name: markssection_additionalsub_classroomStudent_id_ea5fd49a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_additionalsub_classroomStudent_id_ea5fd49a" ON public.markssection_additionalsubjectmapping USING btree ("classroomStudent_id");


--
-- Name: markssection_additionalsubjectmapping_examName_id_03059aa6; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_additionalsubjectmapping_examName_id_03059aa6" ON public.markssection_additionalsubjectmapping USING btree ("examName_id");


--
-- Name: markssection_additionalsubjectmapping_examType_id_9bff92ac; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_additionalsubjectmapping_examType_id_9bff92ac" ON public.markssection_additionalsubjectmapping USING btree ("examType_id");


--
-- Name: markssection_exammapping_classroom_id_926ae5dd; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX markssection_exammapping_classroom_id_926ae5dd ON public.markssection_exammapping USING btree (classroom_id);


--
-- Name: markssection_exammapping_examName_id_1828a436; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_exammapping_examName_id_1828a436" ON public.markssection_exammapping USING btree ("examName_id");


--
-- Name: markssection_exammapping_examType_id_e9df93e5; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_exammapping_examType_id_e9df93e5" ON public.markssection_exammapping USING btree ("examType_id");


--
-- Name: markssection_examtype_examName_id_39dd8ebe; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_examtype_examName_id_39dd8ebe" ON public.markssection_examtype USING btree ("examName_id");


--
-- Name: markssection_marks_classroomStudent_id_969d9022; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_marks_classroomStudent_id_969d9022" ON public.markssection_marks USING btree ("classroomStudent_id");


--
-- Name: markssection_marks_examName_id_9a0c8aa8; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_marks_examName_id_9a0c8aa8" ON public.markssection_marks USING btree ("examName_id");


--
-- Name: markssection_marks_examType_id_b678d74e; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_marks_examType_id_b678d74e" ON public.markssection_marks USING btree ("examType_id");


--
-- Name: notice_classnotice_classRoom_id_c977d857; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "notice_classnotice_classRoom_id_c977d857" ON public.notice_classnotice USING btree ("classRoom_id");


--
-- Name: notice_studentnotice_student_id_6137d249; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX notice_studentnotice_student_id_6137d249 ON public.notice_studentnotice USING btree (student_id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_92240672_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attendence_studentattendence attendence_studentat_student_id_3f6e948f_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_studentattendence
    ADD CONSTRAINT attendence_studentat_student_id_3f6e948f_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attendence_teacherattendence attendence_teacherat_teacher_id_3478c5fb_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_teacherattendence
    ADD CONSTRAINT attendence_teacherat_teacher_id_3478c5fb_fk_employeef FOREIGN KEY (teacher_id) REFERENCES public.employeeform_teacher(employee_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_classroom classform_classroom_teacher_id_38184a16_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom
    ADD CONSTRAINT classform_classroom_teacher_id_38184a16_fk_employeef FOREIGN KEY (teacher_id) REFERENCES public.employeeform_teacher(employee_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_classroomstudent classform_classrooms_classRoom_id_f067618b_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT "classform_classrooms_classRoom_id_f067618b_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_classroomstudent classform_classrooms_student_id_7965796d_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT classform_classrooms_student_id_7965796d_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_currentaddress employeeform_current_employee_id_191a1e2b_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_currentaddress
    ADD CONSTRAINT employeeform_current_employee_id_191a1e2b_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_employeedocuments employeeform_employe_employee_id_f234cb72_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_employeedocuments
    ADD CONSTRAINT employeeform_employe_employee_id_f234cb72_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_permanentaddress employeeform_permane_employee_id_e69075c3_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_permanentaddress
    ADD CONSTRAINT employeeform_permane_employee_id_e69075c3_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_teacher employeeform_teacher_employee_id_0c159000_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_teacher
    ADD CONSTRAINT employeeform_teacher_employee_id_0c159000_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_classsectionfees fees_classsectionfee_classSection_id_a29d9f99_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees
    ADD CONSTRAINT "fees_classsectionfee_classSection_id_a29d9f99_fk_classform" FOREIGN KEY ("classSection_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_classsectionfees fees_classsectionfee_feeCategory_id_0f8cfa84_fk_fees_feec; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees
    ADD CONSTRAINT "fees_classsectionfee_feeCategory_id_0f8cfa84_fk_fees_feec" FOREIGN KEY ("feeCategory_id") REFERENCES public.fees_feecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_fee fees_fee_classSection_id_7c0b3dc5_fk_classform_classroom_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee
    ADD CONSTRAINT "fees_fee_classSection_id_7c0b3dc5_fk_classform_classroom_id" FOREIGN KEY ("classSection_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_fee fees_fee_student_id_664ca066_fk_classform_classroomstudent_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee
    ADD CONSTRAINT fees_fee_student_id_664ca066_fk_classform_classroomstudent_id FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_feediscount fees_feediscount_student_id_d0d7a89a_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feediscount
    ADD CONSTRAINT fees_feediscount_student_id_d0d7a89a_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_fine fees_fine_student_id_bb221b6a_fk_classform_classroomstudent_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fine
    ADD CONSTRAINT fees_fine_student_id_bb221b6a_fk_classform_classroomstudent_id FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_currentaddress form_currentaddress_student_id_3af6431c_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_currentaddress
    ADD CONSTRAINT form_currentaddress_student_id_3af6431c_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_documents form_documents_student_id_34de472a_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_documents
    ADD CONSTRAINT form_documents_student_id_34de472a_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_parentinfo form_parentinfo_student_id_0ab3a289_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_parentinfo
    ADD CONSTRAINT form_parentinfo_student_id_0ab3a289_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_permanentaddress form_permanentaddres_student_id_598730f4_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_permanentaddress
    ADD CONSTRAINT form_permanentaddres_student_id_598730f4_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homework_homework homework_homework_classRoom_id_eec0049c_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_homework
    ADD CONSTRAINT "homework_homework_classRoom_id_eec0049c_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homework_syllabus homework_syllabus_classRoom_id_f958b607_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_syllabus
    ADD CONSTRAINT "homework_syllabus_classRoom_id_f958b607_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_additionalsubjectmapping markssection_additio_classroomStudent_id_ea5fd49a_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT "markssection_additio_classroomStudent_id_ea5fd49a_fk_classform" FOREIGN KEY ("classroomStudent_id") REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_additionalsubjectmapping markssection_additio_examName_id_03059aa6_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT "markssection_additio_examName_id_03059aa6_fk_markssect" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_additionalsubjectmapping markssection_additio_examType_id_9bff92ac_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT "markssection_additio_examType_id_9bff92ac_fk_markssect" FOREIGN KEY ("examType_id") REFERENCES public.markssection_examtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_exammapping markssection_exammap_classroom_id_926ae5dd_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT markssection_exammap_classroom_id_926ae5dd_fk_classform FOREIGN KEY (classroom_id) REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_exammapping markssection_exammap_examName_id_1828a436_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT "markssection_exammap_examName_id_1828a436_fk_markssect" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_exammapping markssection_exammap_examType_id_e9df93e5_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT "markssection_exammap_examType_id_e9df93e5_fk_markssect" FOREIGN KEY ("examType_id") REFERENCES public.markssection_examtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_examtype markssection_examtyp_examName_id_39dd8ebe_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_examtype
    ADD CONSTRAINT "markssection_examtyp_examName_id_39dd8ebe_fk_markssect" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_marks markssection_marks_classroomStudent_id_969d9022_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT "markssection_marks_classroomStudent_id_969d9022_fk_classform" FOREIGN KEY ("classroomStudent_id") REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_marks markssection_marks_examName_id_9a0c8aa8_fk_markssection_exam_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT "markssection_marks_examName_id_9a0c8aa8_fk_markssection_exam_id" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_marks markssection_marks_examType_id_b678d74e_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT "markssection_marks_examType_id_b678d74e_fk_markssect" FOREIGN KEY ("examType_id") REFERENCES public.markssection_examtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notice_classnotice notice_classnotice_classRoom_id_c977d857_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_classnotice
    ADD CONSTRAINT "notice_classnotice_classRoom_id_c977d857_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notice_studentnotice notice_studentnotice_student_id_6137d249_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_studentnotice
    ADD CONSTRAINT notice_studentnotice_student_id_6137d249_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.accounts_userprofile (
    id integer NOT NULL,
    user_type character varying(20) NOT NULL,
    mobile_no bigint NOT NULL,
    user_id integer NOT NULL,
    image character varying(100) NOT NULL,
    "fullName" character varying(50) NOT NULL
);


ALTER TABLE public.accounts_userprofile OWNER TO myprojectuser;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.accounts_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO myprojectuser;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.accounts_userprofile_id_seq OWNED BY public.accounts_userprofile.id;


--
-- Name: attendence_studentattendence; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.attendence_studentattendence (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    date date NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.attendence_studentattendence OWNER TO myprojectuser;

--
-- Name: attendence_studentattendence_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.attendence_studentattendence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendence_studentattendence_id_seq OWNER TO myprojectuser;

--
-- Name: attendence_studentattendence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.attendence_studentattendence_id_seq OWNED BY public.attendence_studentattendence.id;


--
-- Name: attendence_teacherattendence; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.attendence_teacherattendence (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    date date NOT NULL,
    teacher_id integer NOT NULL,
    available_casual_leave integer NOT NULL,
    available_sick_leave integer NOT NULL,
    taken_casual_leave integer NOT NULL,
    taken_sick_leave integer NOT NULL,
    total_no_of_days_present integer NOT NULL
);


ALTER TABLE public.attendence_teacherattendence OWNER TO myprojectuser;

--
-- Name: attendence_teacherattendence_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.attendence_teacherattendence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendence_teacherattendence_id_seq OWNER TO myprojectuser;

--
-- Name: attendence_teacherattendence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.attendence_teacherattendence_id_seq OWNED BY public.attendence_teacherattendence.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO myprojectuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO myprojectuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO myprojectuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO myprojectuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO myprojectuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO myprojectuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: myprojectuser
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


ALTER TABLE public.auth_user OWNER TO myprojectuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO myprojectuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO myprojectuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: classform_classroom; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_classroom (
    id integer NOT NULL,
    "classSection" character varying(50) NOT NULL,
    teacher_id integer NOT NULL
);


ALTER TABLE public.classform_classroom OWNER TO myprojectuser;

--
-- Name: classform_classroom_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_classroom_id_seq OWNER TO myprojectuser;

--
-- Name: classform_classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_classroom_id_seq OWNED BY public.classform_classroom.id;


--
-- Name: classform_classroomstudent; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_classroomstudent (
    id integer NOT NULL,
    roll_number integer NOT NULL,
    "classRoom_id" integer NOT NULL,
    student_id bigint NOT NULL
);


ALTER TABLE public.classform_classroomstudent OWNER TO myprojectuser;

--
-- Name: classform_classroomstudent_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_classroomstudent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_classroomstudent_id_seq OWNER TO myprojectuser;

--
-- Name: classform_classroomstudent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_classroomstudent_id_seq OWNED BY public.classform_classroomstudent.id;


--
-- Name: classform_reportcard; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_reportcard (
    id integer NOT NULL,
    "reportCard" character varying(100) NOT NULL,
    class_room_student_id integer NOT NULL
);


ALTER TABLE public.classform_reportcard OWNER TO myprojectuser;

--
-- Name: classform_reportcard_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_reportcard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_reportcard_id_seq OWNER TO myprojectuser;

--
-- Name: classform_reportcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_reportcard_id_seq OWNED BY public.classform_reportcard.id;


--
-- Name: classform_studentrouteattendence; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_studentrouteattendence (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    date date NOT NULL,
    "time" timestamp with time zone NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.classform_studentrouteattendence OWNER TO myprojectuser;

--
-- Name: classform_studentrouteattendence_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_studentrouteattendence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_studentrouteattendence_id_seq OWNER TO myprojectuser;

--
-- Name: classform_studentrouteattendence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_studentrouteattendence_id_seq OWNED BY public.classform_studentrouteattendence.id;


--
-- Name: dailythought_thoughts; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.dailythought_thoughts (
    id integer NOT NULL,
    thought text NOT NULL,
    "timestamp" date NOT NULL
);


ALTER TABLE public.dailythought_thoughts OWNER TO myprojectuser;

--
-- Name: dailythought_thoughts_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.dailythought_thoughts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dailythought_thoughts_id_seq OWNER TO myprojectuser;

--
-- Name: dailythought_thoughts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.dailythought_thoughts_id_seq OWNED BY public.dailythought_thoughts.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: myprojectuser
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


ALTER TABLE public.django_admin_log OWNER TO myprojectuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO myprojectuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO myprojectuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO myprojectuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO myprojectuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO myprojectuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO myprojectuser;

--
-- Name: employeeform_currentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_currentaddress (
    employee_id integer NOT NULL,
    "Address" character varying(100) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL,
    "zipCode" bigint NOT NULL,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL
);


ALTER TABLE public.employeeform_currentaddress OWNER TO myprojectuser;

--
-- Name: employeeform_employee; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_employee (
    "empID" integer NOT NULL,
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    "fullName" character varying(50) NOT NULL,
    father_name character varying(50) NOT NULL,
    mother_name character varying(50) NOT NULL,
    "partnerName" character varying(50) NOT NULL,
    gender character varying(20) NOT NULL,
    email character varying(40) NOT NULL,
    "currentAddress" character varying(100) NOT NULL,
    "permanentAddress" character varying(100) NOT NULL,
    dob date,
    "joiningDate" date,
    "bloodGroup" character varying(20) NOT NULL,
    mobile_number bigint NOT NULL,
    marital_status character varying(20) NOT NULL,
    experience character varying(20) NOT NULL,
    "aadharNumber" bigint NOT NULL,
    "empCategory" character varying(20) NOT NULL
);


ALTER TABLE public.employeeform_employee OWNER TO myprojectuser;

--
-- Name: employeeform_employeedocuments; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_employeedocuments (
    employee_id integer NOT NULL,
    photo character varying(100) NOT NULL,
    "qualificationDoc" character varying(100) NOT NULL,
    "IdProof" character varying(100) NOT NULL,
    "addressProof" character varying(100) NOT NULL,
    "otherDoc" character varying(100) NOT NULL
);


ALTER TABLE public.employeeform_employeedocuments OWNER TO myprojectuser;

--
-- Name: employeeform_permanentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_permanentaddress (
    employee_id integer NOT NULL,
    "Address" character varying(100) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL,
    "zipCode" bigint NOT NULL,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL
);


ALTER TABLE public.employeeform_permanentaddress OWNER TO myprojectuser;

--
-- Name: employeeform_teacher; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_teacher (
    employee_id integer NOT NULL,
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    "fullName" character varying(50) NOT NULL,
    specialization character varying(50) NOT NULL,
    designation character varying(50) NOT NULL,
    "classTeacher" character varying(50) NOT NULL
);


ALTER TABLE public.employeeform_teacher OWNER TO myprojectuser;

--
-- Name: fees_classsectionfees; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_classsectionfees (
    id integer NOT NULL,
    fees integer NOT NULL,
    "classSection_id" integer NOT NULL,
    "feeCategory_id" integer NOT NULL
);


ALTER TABLE public.fees_classsectionfees OWNER TO myprojectuser;

--
-- Name: fees_classsectionfees_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_classsectionfees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_classsectionfees_id_seq OWNER TO myprojectuser;

--
-- Name: fees_classsectionfees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_classsectionfees_id_seq OWNED BY public.fees_classsectionfees.id;


--
-- Name: fees_fee; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_fee (
    id integer NOT NULL,
    "regNo" integer NOT NULL,
    payment_method character varying(50) NOT NULL,
    "submissionDate" date NOT NULL,
    "monthsPaid" character varying(50) NOT NULL,
    "classSection_id" integer NOT NULL,
    student_id integer NOT NULL,
    amount integer NOT NULL,
    "feeSlip" character varying(100) NOT NULL
);


ALTER TABLE public.fees_fee OWNER TO myprojectuser;

--
-- Name: fees_fee_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_fee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_fee_id_seq OWNER TO myprojectuser;

--
-- Name: fees_fee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_fee_id_seq OWNED BY public.fees_fee.id;


--
-- Name: fees_feecategory; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_feecategory (
    id integer NOT NULL,
    once boolean NOT NULL,
    submission_type character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.fees_feecategory OWNER TO myprojectuser;

--
-- Name: fees_feecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_feecategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_feecategory_id_seq OWNER TO myprojectuser;

--
-- Name: fees_feecategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_feecategory_id_seq OWNED BY public.fees_feecategory.id;


--
-- Name: fees_feecycle; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_feecycle (
    id integer NOT NULL,
    "lastSubmissionDate" date NOT NULL,
    "firstSubmissionDate" date NOT NULL,
    cycle character varying(50) NOT NULL
);


ALTER TABLE public.fees_feecycle OWNER TO myprojectuser;

--
-- Name: fees_feecycle_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_feecycle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_feecycle_id_seq OWNER TO myprojectuser;

--
-- Name: fees_feecycle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_feecycle_id_seq OWNED BY public.fees_feecycle.id;


--
-- Name: fees_feediscount; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_feediscount (
    id integer NOT NULL,
    discount integer NOT NULL,
    category character varying(50) NOT NULL,
    description text NOT NULL,
    total_off integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.fees_feediscount OWNER TO myprojectuser;

--
-- Name: fees_feediscount_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_feediscount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_feediscount_id_seq OWNER TO myprojectuser;

--
-- Name: fees_feediscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_feediscount_id_seq OWNED BY public.fees_feediscount.id;


--
-- Name: fees_fine; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_fine (
    id integer NOT NULL,
    fine integer NOT NULL,
    category character varying(100) NOT NULL,
    description text NOT NULL,
    student_id integer NOT NULL,
    "submissionDate" date NOT NULL
);


ALTER TABLE public.fees_fine OWNER TO myprojectuser;

--
-- Name: fees_fine_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_fine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_fine_id_seq OWNER TO myprojectuser;

--
-- Name: fees_fine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_fine_id_seq OWNED BY public.fees_fine.id;


--
-- Name: form_currentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_currentaddress (
    student_id bigint NOT NULL,
    "Address" character varying(100) NOT NULL,
    "zipCode" bigint,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL
);


ALTER TABLE public.form_currentaddress OWNER TO myprojectuser;

--
-- Name: form_documents; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_documents (
    student_id bigint NOT NULL,
    photo character varying(100) NOT NULL,
    "idProof" character varying(100) NOT NULL,
    "castCertificate" character varying(100) NOT NULL,
    domicile character varying(100) NOT NULL,
    tc character varying(100) NOT NULL,
    "characterCertificate" character varying(100) NOT NULL
);


ALTER TABLE public.form_documents OWNER TO myprojectuser;

--
-- Name: form_parentinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_parentinfo (
    student_id bigint NOT NULL,
    "fatherName" character varying(20) NOT NULL,
    "motherName" character varying(20) NOT NULL,
    "Fatherdob" date,
    "Motherdob" date,
    "MobileNumber" bigint,
    "altMobileNumber" bigint,
    "gaurdianQual" character varying(30) NOT NULL,
    "guardianOccup" character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    "motherQual" character varying(30) NOT NULL,
    "motherOccup" character varying(20) NOT NULL
);


ALTER TABLE public.form_parentinfo OWNER TO myprojectuser;

--
-- Name: form_permanentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_permanentaddress (
    student_id bigint NOT NULL,
    "Address" character varying(100) NOT NULL,
    "zipCode" bigint,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL
);


ALTER TABLE public.form_permanentaddress OWNER TO myprojectuser;

--
-- Name: form_studentinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_studentinfo (
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    gender character varying(20) NOT NULL,
    dob date,
    "classSection" character varying(20) NOT NULL,
    "admissionNumber" bigint NOT NULL,
    "mobileNumber" bigint,
    religion character varying(20) NOT NULL,
    caste character varying(20) NOT NULL,
    "tcNumber" bigint,
    "aadharNumber" bigint,
    "feeWaiverCategory" character varying(20) NOT NULL,
    "siblingID" bigint,
    "prevSchoolName" character varying(20) NOT NULL,
    "fullName" character varying(50) NOT NULL
);


ALTER TABLE public.form_studentinfo OWNER TO myprojectuser;

--
-- Name: form_studentroute; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_studentroute (
    student_id bigint NOT NULL,
    route_code bigint NOT NULL,
    route_stoppage character varying(30) NOT NULL,
    shift character varying(30) NOT NULL
);


ALTER TABLE public.form_studentroute OWNER TO myprojectuser;

--
-- Name: holiday_holiday; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.holiday_holiday (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL
);


ALTER TABLE public.holiday_holiday OWNER TO myprojectuser;

--
-- Name: holiday_holiday_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.holiday_holiday_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.holiday_holiday_id_seq OWNER TO myprojectuser;

--
-- Name: holiday_holiday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.holiday_holiday_id_seq OWNED BY public.holiday_holiday.id;


--
-- Name: homework_homework; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.homework_homework (
    id integer NOT NULL,
    description text NOT NULL,
    subject character varying(100) NOT NULL,
    document character varying(100) NOT NULL,
    date_published date NOT NULL,
    "classRoom_id" integer NOT NULL
);


ALTER TABLE public.homework_homework OWNER TO myprojectuser;

--
-- Name: homework_homework_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.homework_homework_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homework_homework_id_seq OWNER TO myprojectuser;

--
-- Name: homework_homework_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.homework_homework_id_seq OWNED BY public.homework_homework.id;


--
-- Name: homework_syllabus; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.homework_syllabus (
    id integer NOT NULL,
    description text NOT NULL,
    document character varying(100) NOT NULL,
    date_published date NOT NULL,
    "classRoom_id" integer NOT NULL
);


ALTER TABLE public.homework_syllabus OWNER TO myprojectuser;

--
-- Name: homework_syllabus_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.homework_syllabus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homework_syllabus_id_seq OWNER TO myprojectuser;

--
-- Name: homework_syllabus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.homework_syllabus_id_seq OWNED BY public.homework_syllabus.id;


--
-- Name: markssection_additionalsubjectmapping; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_additionalsubjectmapping (
    id integer NOT NULL,
    subject character varying(50) NOT NULL,
    marks integer,
    "classroomStudent_id" integer NOT NULL,
    "examName_id" integer NOT NULL,
    "examType_id" integer NOT NULL
);


ALTER TABLE public.markssection_additionalsubjectmapping OWNER TO myprojectuser;

--
-- Name: markssection_additionalsubjectmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_additionalsubjectmapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_additionalsubjectmapping_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_additionalsubjectmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_additionalsubjectmapping_id_seq OWNED BY public.markssection_additionalsubjectmapping.id;


--
-- Name: markssection_exam; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_exam (
    id integer NOT NULL,
    "examName" character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.markssection_exam OWNER TO myprojectuser;

--
-- Name: markssection_exam_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_exam_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_exam_id_seq OWNED BY public.markssection_exam.id;


--
-- Name: markssection_exammapping; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_exammapping (
    id integer NOT NULL,
    subject character varying(100) NOT NULL,
    classroom_id integer NOT NULL,
    "examName_id" integer NOT NULL,
    "examType_id" integer NOT NULL
);


ALTER TABLE public.markssection_exammapping OWNER TO myprojectuser;

--
-- Name: markssection_exammapping_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_exammapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_exammapping_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_exammapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_exammapping_id_seq OWNED BY public.markssection_exammapping.id;


--
-- Name: markssection_examtype; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_examtype (
    id integer NOT NULL,
    "examType" character varying(50) NOT NULL,
    "minMarks" integer NOT NULL,
    "maxMarks" integer NOT NULL,
    priority integer,
    "examName_id" integer NOT NULL
);


ALTER TABLE public.markssection_examtype OWNER TO myprojectuser;

--
-- Name: markssection_examtype_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_examtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_examtype_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_examtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_examtype_id_seq OWNED BY public.markssection_examtype.id;


--
-- Name: markssection_marks; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_marks (
    id integer NOT NULL,
    subject character varying(50) NOT NULL,
    marks integer NOT NULL,
    "classroomStudent_id" integer NOT NULL,
    "examType_id" integer NOT NULL,
    "examName_id" integer NOT NULL
);


ALTER TABLE public.markssection_marks OWNER TO myprojectuser;

--
-- Name: markssection_marks_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_marks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_marks_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_marks_id_seq OWNED BY public.markssection_marks.id;


--
-- Name: newsletter_newsletter; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.newsletter_newsletter (
    id integer NOT NULL,
    description text,
    date date NOT NULL
);


ALTER TABLE public.newsletter_newsletter OWNER TO myprojectuser;

--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.newsletter_newsletter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_newsletter_id_seq OWNER TO myprojectuser;

--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.newsletter_newsletter_id_seq OWNED BY public.newsletter_newsletter.id;


--
-- Name: notice_classnotice; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.notice_classnotice (
    id integer NOT NULL,
    notice text NOT NULL,
    notice_document character varying(100) NOT NULL,
    "classRoom_id" integer NOT NULL
);


ALTER TABLE public.notice_classnotice OWNER TO myprojectuser;

--
-- Name: notice_classnotice_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.notice_classnotice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_classnotice_id_seq OWNER TO myprojectuser;

--
-- Name: notice_classnotice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.notice_classnotice_id_seq OWNED BY public.notice_classnotice.id;


--
-- Name: notice_studentnotice; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.notice_studentnotice (
    id integer NOT NULL,
    notice text NOT NULL,
    notice_document character varying(100) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.notice_studentnotice OWNER TO myprojectuser;

--
-- Name: notice_studentnotice_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.notice_studentnotice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_studentnotice_id_seq OWNER TO myprojectuser;

--
-- Name: notice_studentnotice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.notice_studentnotice_id_seq OWNED BY public.notice_studentnotice.id;


--
-- Name: schoolinfo_schoolinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.schoolinfo_schoolinfo (
    "schoolName" character varying(100) NOT NULL,
    addresss character varying(100) NOT NULL,
    "principalName" character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    "zipCode" integer NOT NULL,
    "schoolID" integer NOT NULL,
    longitude integer NOT NULL,
    latitude integer NOT NULL,
    "contactNumber" integer NOT NULL,
    "webSiteURL" character varying(100) NOT NULL,
    img character varying(100) NOT NULL,
    logo character varying(100) NOT NULL
);


ALTER TABLE public.schoolinfo_schoolinfo OWNER TO myprojectuser;

--
-- Name: transport_driver; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.transport_driver (
    employee_id integer NOT NULL,
    driver_name character varying(30) NOT NULL,
    dob date,
    license_no bigint NOT NULL,
    mobile_no bigint NOT NULL,
    batch_no bigint NOT NULL,
    contact_address character varying(30) NOT NULL,
    permanent_address character varying(30) NOT NULL,
    "driverPic" character varying(100) NOT NULL,
    "driverLicense" character varying(100) NOT NULL,
    "driverID" character varying(100) NOT NULL,
    vehicle_id integer NOT NULL
);


ALTER TABLE public.transport_driver OWNER TO myprojectuser;

--
-- Name: transport_routes; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.transport_routes (
    route_code bigint NOT NULL,
    start_place character varying(30) NOT NULL,
    end_place character varying(30) NOT NULL,
    shift_time character varying(30) NOT NULL,
    stoppage_names character varying(30) NOT NULL,
    stoppage_id integer NOT NULL,
    remarks character varying(50) NOT NULL,
    route_distance integer NOT NULL,
    longitude numeric(5,2) NOT NULL,
    lattitude numeric(5,2) NOT NULL,
    vehicle_id integer NOT NULL
);


ALTER TABLE public.transport_routes OWNER TO myprojectuser;

--
-- Name: transport_vehicle; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.transport_vehicle (
    id integer NOT NULL,
    vehicle_no bigint NOT NULL,
    device_id bigint NOT NULL,
    service_id bigint NOT NULL,
    no_of_seat integer NOT NULL,
    maximum_allowed integer NOT NULL,
    vehicle_type character varying(30) NOT NULL,
    insurance_company character varying(30) NOT NULL,
    contact_person character varying(30) NOT NULL,
    insurance_date date,
    permit_valid_date date,
    pollution_cert_exp_date date,
    fitness_service_date date,
    service_date date
);


ALTER TABLE public.transport_vehicle OWNER TO myprojectuser;

--
-- Name: transport_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.transport_vehicle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transport_vehicle_id_seq OWNER TO myprojectuser;

--
-- Name: transport_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.transport_vehicle_id_seq OWNED BY public.transport_vehicle.id;


--
-- Name: accounts_userprofile id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_userprofile_id_seq'::regclass);


--
-- Name: attendence_studentattendence id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_studentattendence ALTER COLUMN id SET DEFAULT nextval('public.attendence_studentattendence_id_seq'::regclass);


--
-- Name: attendence_teacherattendence id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_teacherattendence ALTER COLUMN id SET DEFAULT nextval('public.attendence_teacherattendence_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: classform_classroom id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom ALTER COLUMN id SET DEFAULT nextval('public.classform_classroom_id_seq'::regclass);


--
-- Name: classform_classroomstudent id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent ALTER COLUMN id SET DEFAULT nextval('public.classform_classroomstudent_id_seq'::regclass);


--
-- Name: classform_reportcard id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_reportcard ALTER COLUMN id SET DEFAULT nextval('public.classform_reportcard_id_seq'::regclass);


--
-- Name: classform_studentrouteattendence id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_studentrouteattendence ALTER COLUMN id SET DEFAULT nextval('public.classform_studentrouteattendence_id_seq'::regclass);


--
-- Name: dailythought_thoughts id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.dailythought_thoughts ALTER COLUMN id SET DEFAULT nextval('public.dailythought_thoughts_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: fees_classsectionfees id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees ALTER COLUMN id SET DEFAULT nextval('public.fees_classsectionfees_id_seq'::regclass);


--
-- Name: fees_fee id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee ALTER COLUMN id SET DEFAULT nextval('public.fees_fee_id_seq'::regclass);


--
-- Name: fees_feecategory id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecategory ALTER COLUMN id SET DEFAULT nextval('public.fees_feecategory_id_seq'::regclass);


--
-- Name: fees_feecycle id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecycle ALTER COLUMN id SET DEFAULT nextval('public.fees_feecycle_id_seq'::regclass);


--
-- Name: fees_feediscount id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feediscount ALTER COLUMN id SET DEFAULT nextval('public.fees_feediscount_id_seq'::regclass);


--
-- Name: fees_fine id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fine ALTER COLUMN id SET DEFAULT nextval('public.fees_fine_id_seq'::regclass);


--
-- Name: holiday_holiday id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.holiday_holiday ALTER COLUMN id SET DEFAULT nextval('public.holiday_holiday_id_seq'::regclass);


--
-- Name: homework_homework id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_homework ALTER COLUMN id SET DEFAULT nextval('public.homework_homework_id_seq'::regclass);


--
-- Name: homework_syllabus id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_syllabus ALTER COLUMN id SET DEFAULT nextval('public.homework_syllabus_id_seq'::regclass);


--
-- Name: markssection_additionalsubjectmapping id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping ALTER COLUMN id SET DEFAULT nextval('public.markssection_additionalsubjectmapping_id_seq'::regclass);


--
-- Name: markssection_exam id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exam ALTER COLUMN id SET DEFAULT nextval('public.markssection_exam_id_seq'::regclass);


--
-- Name: markssection_exammapping id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping ALTER COLUMN id SET DEFAULT nextval('public.markssection_exammapping_id_seq'::regclass);


--
-- Name: markssection_examtype id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_examtype ALTER COLUMN id SET DEFAULT nextval('public.markssection_examtype_id_seq'::regclass);


--
-- Name: markssection_marks id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks ALTER COLUMN id SET DEFAULT nextval('public.markssection_marks_id_seq'::regclass);


--
-- Name: newsletter_newsletter id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.newsletter_newsletter ALTER COLUMN id SET DEFAULT nextval('public.newsletter_newsletter_id_seq'::regclass);


--
-- Name: notice_classnotice id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_classnotice ALTER COLUMN id SET DEFAULT nextval('public.notice_classnotice_id_seq'::regclass);


--
-- Name: notice_studentnotice id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_studentnotice ALTER COLUMN id SET DEFAULT nextval('public.notice_studentnotice_id_seq'::regclass);


--
-- Name: transport_vehicle id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_vehicle ALTER COLUMN id SET DEFAULT nextval('public.transport_vehicle_id_seq'::regclass);


--
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.accounts_userprofile (id, user_type, mobile_no, user_id, image, "fullName") FROM stdin;
12	Admin	4545445449	4	profile_pics/customer-3_EWBaFFT.jpg	Smith D'souza
1	Admin	4659898989	1	profile_pics/customer-1.jpg	Yash Boura
\.


--
-- Data for Name: attendence_studentattendence; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.attendence_studentattendence (id, status, date, student_id) FROM stdin;
1	present	2019-12-03	1
2	present	2019-12-03	2
3	present	2019-12-03	3
4	present	2019-12-03	1
5	present	2019-12-03	2
6	present	2019-12-03	3
8	absent	2019-12-18	4
7	absent	2019-12-18	1
9	leave	2019-12-25	1
10	present	2019-12-25	2
11	absent	2019-12-25	3
12	present	2020-01-22	1
13	absent	2020-01-22	2
14	present	2020-01-22	3
15	present	2019-12-30	1
16	present	2020-01-07	7
\.


--
-- Data for Name: attendence_teacherattendence; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.attendence_teacherattendence (id, status, date, teacher_id, available_casual_leave, available_sick_leave, taken_casual_leave, taken_sick_leave, total_no_of_days_present) FROM stdin;
2	present	2019-12-11	1223	10	10	0	0	0
3	absent	2019-12-11	6577	10	10	0	0	0
4	present	2019-12-11	10101012	10	10	0	0	0
5	Absent	2019-12-11	10101012	10	10	0	0	0
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user profile	1	add_userprofile
2	Can change user profile	1	change_userprofile
3	Can delete user profile	1	delete_userprofile
4	Can view user profile	1	view_userprofile
5	Can add log entry	2	add_logentry
6	Can change log entry	2	change_logentry
7	Can delete log entry	2	delete_logentry
8	Can view log entry	2	view_logentry
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add user	5	add_user
18	Can change user	5	change_user
19	Can delete user	5	delete_user
20	Can view user	5	view_user
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add student info	8	add_studentinfo
30	Can change student info	8	change_studentinfo
31	Can delete student info	8	delete_studentinfo
32	Can view student info	8	view_studentinfo
33	Can add parent info	9	add_parentinfo
34	Can change parent info	9	change_parentinfo
35	Can delete parent info	9	delete_parentinfo
36	Can view parent info	9	view_parentinfo
37	Can add documents	10	add_documents
38	Can change documents	10	change_documents
39	Can delete documents	10	delete_documents
40	Can view documents	10	view_documents
41	Can add current address	11	add_currentaddress
42	Can change current address	11	change_currentaddress
43	Can delete current address	11	delete_currentaddress
44	Can view current address	11	view_currentaddress
45	Can add permanent address	12	add_permanentaddress
46	Can change permanent address	12	change_permanentaddress
47	Can delete permanent address	12	delete_permanentaddress
48	Can view permanent address	12	view_permanentaddress
49	Can add employee documents	13	add_employeedocuments
50	Can change employee documents	13	change_employeedocuments
51	Can delete employee documents	13	delete_employeedocuments
52	Can view employee documents	13	view_employeedocuments
53	Can add employee	14	add_employee
54	Can change employee	14	change_employee
55	Can delete employee	14	delete_employee
56	Can view employee	14	view_employee
57	Can add teacher	15	add_teacher
58	Can change teacher	15	change_teacher
59	Can delete teacher	15	delete_teacher
60	Can view teacher	15	view_teacher
61	Can add teacher	16	add_teacher
62	Can change teacher	16	change_teacher
63	Can delete teacher	16	delete_teacher
64	Can view teacher	16	view_teacher
65	Can add employee documents	17	add_employeedocuments
66	Can change employee documents	17	change_employeedocuments
67	Can delete employee documents	17	delete_employeedocuments
68	Can view employee documents	17	view_employeedocuments
69	Can add employee	18	add_employee
70	Can change employee	18	change_employee
71	Can delete employee	18	delete_employee
72	Can view employee	18	view_employee
73	Can add permanent address	19	add_permanentaddress
74	Can change permanent address	19	change_permanentaddress
75	Can delete permanent address	19	delete_permanentaddress
76	Can view permanent address	19	view_permanentaddress
77	Can add current address	20	add_currentaddress
78	Can change current address	20	change_currentaddress
79	Can delete current address	20	delete_currentaddress
80	Can view current address	20	view_currentaddress
81	Can add class room	21	add_classroom
82	Can change class room	21	change_classroom
83	Can delete class room	21	delete_classroom
84	Can view class room	21	view_classroom
85	Can add class room student	22	add_classroomstudent
86	Can change class room student	22	change_classroomstudent
87	Can delete class room student	22	delete_classroomstudent
88	Can view class room student	22	view_classroomstudent
89	Can add student attendence	23	add_studentattendence
90	Can change student attendence	23	change_studentattendence
91	Can delete student attendence	23	delete_studentattendence
92	Can view student attendence	23	view_studentattendence
93	Can add teacher attendence	24	add_teacherattendence
94	Can change teacher attendence	24	change_teacherattendence
95	Can delete teacher attendence	24	delete_teacherattendence
96	Can view teacher attendence	24	view_teacherattendence
97	Can add exam type	25	add_examtype
98	Can change exam type	25	change_examtype
99	Can delete exam type	25	delete_examtype
100	Can view exam type	25	view_examtype
101	Can add subjects to class	26	add_subjectstoclass
102	Can change subjects to class	26	change_subjectstoclass
103	Can delete subjects to class	26	delete_subjectstoclass
104	Can view subjects to class	26	view_subjectstoclass
105	Can add marks	27	add_marks
106	Can change marks	27	change_marks
107	Can delete marks	27	delete_marks
108	Can view marks	27	view_marks
109	Can add exam	28	add_exam
110	Can change exam	28	change_exam
111	Can delete exam	28	delete_exam
112	Can view exam	28	view_exam
113	Can add exam mapping	29	add_exammapping
114	Can change exam mapping	29	change_exammapping
115	Can delete exam mapping	29	delete_exammapping
116	Can view exam mapping	29	view_exammapping
117	Can add additional subject	30	add_additionalsubject
118	Can change additional subject	30	change_additionalsubject
119	Can delete additional subject	30	delete_additionalsubject
120	Can view additional subject	30	view_additionalsubject
121	Can add marks	31	add_marks
122	Can change marks	31	change_marks
123	Can delete marks	31	delete_marks
124	Can view marks	31	view_marks
125	Can add exam	32	add_exam
126	Can change exam	32	change_exam
127	Can delete exam	32	delete_exam
128	Can view exam	32	view_exam
129	Can add exam mapping	33	add_exammapping
130	Can change exam mapping	33	change_exammapping
131	Can delete exam mapping	33	delete_exammapping
132	Can view exam mapping	33	view_exammapping
133	Can add exam type	34	add_examtype
134	Can change exam type	34	change_examtype
135	Can delete exam type	34	delete_examtype
136	Can view exam type	34	view_examtype
137	Can add additional subject	35	add_additionalsubject
138	Can change additional subject	35	change_additionalsubject
139	Can delete additional subject	35	delete_additionalsubject
140	Can view additional subject	35	view_additionalsubject
141	Can add additional subject mapping	36	add_additionalsubjectmapping
142	Can change additional subject mapping	36	change_additionalsubjectmapping
143	Can delete additional subject mapping	36	delete_additionalsubjectmapping
144	Can view additional subject mapping	36	view_additionalsubjectmapping
145	Can add home work	37	add_homework
146	Can change home work	37	change_homework
147	Can delete home work	37	delete_homework
148	Can view home work	37	view_homework
149	Can add class notice	38	add_classnotice
150	Can change class notice	38	change_classnotice
151	Can delete class notice	38	delete_classnotice
152	Can view class notice	38	view_classnotice
153	Can add student notice	39	add_studentnotice
154	Can change student notice	39	change_studentnotice
155	Can delete student notice	39	delete_studentnotice
156	Can view student notice	39	view_studentnotice
157	Can add thoughts	40	add_thoughts
158	Can change thoughts	40	change_thoughts
159	Can delete thoughts	40	delete_thoughts
160	Can view thoughts	40	view_thoughts
161	Can add newsletter	41	add_newsletter
162	Can change newsletter	41	change_newsletter
163	Can delete newsletter	41	delete_newsletter
164	Can view newsletter	41	view_newsletter
165	Can add school info	42	add_schoolinfo
166	Can change school info	42	change_schoolinfo
167	Can delete school info	42	delete_schoolinfo
168	Can view school info	42	view_schoolinfo
169	Can add holiday	43	add_holiday
170	Can change holiday	43	change_holiday
171	Can delete holiday	43	delete_holiday
172	Can view holiday	43	view_holiday
173	Can add fee category	44	add_feecategory
174	Can change fee category	44	change_feecategory
175	Can delete fee category	44	delete_feecategory
176	Can view fee category	44	view_feecategory
177	Can add fee cycle	45	add_feecycle
178	Can change fee cycle	45	change_feecycle
179	Can delete fee cycle	45	delete_feecycle
180	Can view fee cycle	45	view_feecycle
181	Can add fee discount	46	add_feediscount
182	Can change fee discount	46	change_feediscount
183	Can delete fee discount	46	delete_feediscount
184	Can view fee discount	46	view_feediscount
185	Can add fine	47	add_fine
186	Can change fine	47	change_fine
187	Can delete fine	47	delete_fine
188	Can view fine	47	view_fine
189	Can add fee	48	add_fee
190	Can change fee	48	change_fee
191	Can delete fee	48	delete_fee
192	Can view fee	48	view_fee
193	Can add class section fees	49	add_classsectionfees
194	Can change class section fees	49	change_classsectionfees
195	Can delete class section fees	49	delete_classsectionfees
196	Can view class section fees	49	view_classsectionfees
197	Can add syllabus	50	add_syllabus
198	Can change syllabus	50	change_syllabus
199	Can delete syllabus	50	delete_syllabus
200	Can view syllabus	50	view_syllabus
201	Can add report card	51	add_reportcard
202	Can change report card	51	change_reportcard
203	Can delete report card	51	delete_reportcard
204	Can view report card	51	view_reportcard
205	Can add driver	52	add_driver
206	Can change driver	52	change_driver
207	Can delete driver	52	delete_driver
208	Can view driver	52	view_driver
209	Can add routes	53	add_routes
210	Can change routes	53	change_routes
211	Can delete routes	53	delete_routes
212	Can view routes	53	view_routes
213	Can add vehicle	54	add_vehicle
214	Can change vehicle	54	change_vehicle
215	Can delete vehicle	54	delete_vehicle
216	Can view vehicle	54	view_vehicle
217	Can add student route	55	add_studentroute
218	Can change student route	55	change_studentroute
219	Can delete student route	55	delete_studentroute
220	Can view student route	55	view_studentroute
221	Can add student route attendence	56	add_studentrouteattendence
222	Can change student route attendence	56	change_studentrouteattendence
223	Can delete student route attendence	56	delete_studentrouteattendence
224	Can view student route attendence	56	view_studentrouteattendence
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$150000$AH8YhH5ddait$2Knous/eaROaakLDRdHxn0y5UZZPEJKd3AlTKqFJDbQ=	2019-12-24 11:16:01.963582+00	t	Smith Singh	Smith Singh			t	t	2019-12-24 08:22:10+00
2	pbkdf2_sha256$150000$IKRemWv0JUjT$MdI4gKXsyUU20rqojDU99idXwXpu96diyxwtdeHpVH4=	2019-12-25 17:07:05.559738+00	t	admin				t	t	2019-12-05 10:13:06.231138+00
1	pbkdf2_sha256$150000$lHFzcuPyPZdB$vEZb9OfmyMFet89Bpy7WHpa0QInbG/w0YBLTmdxqUBc=	2020-01-08 17:39:17.972118+00	t	yash	yash			t	t	2019-12-05 10:02:38+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: classform_classroom; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_classroom (id, "classSection", teacher_id) FROM stdin;
1	6-B	10101012
2	6-C	6577
3	6-A	1223
\.


--
-- Data for Name: classform_classroomstudent; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_classroomstudent (id, roll_number, "classRoom_id", student_id) FROM stdin;
1	1	3	2231
2	3	3	988
3	5	3	3231
4	2	1	223
5	4	1	12345
7	1	2	122
8	6	3	323198964
\.


--
-- Data for Name: classform_reportcard; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_reportcard (id, "reportCard", class_room_student_id) FROM stdin;
\.


--
-- Data for Name: classform_studentrouteattendence; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_studentrouteattendence (id, status, date, "time", student_id) FROM stdin;
1	present	2019-12-30	2020-01-20 17:03:12.372002+00	1
2	absent	2020-01-07	2020-01-20 17:29:38.487832+00	8
\.


--
-- Data for Name: dailythought_thoughts; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.dailythought_thoughts (id, thought, "timestamp") FROM stdin;
7	This a example thought of the day 	2019-12-19
8	This is again just a sample thought	2019-12-19
18	Sample thought sample thought sample thought sample thought sample thought sample thought.	2019-12-25
19	Some random thought	2020-01-08
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-12-09 17:01:36.22459+00	1223	Name:Rohan Pawar| Class:6-A| Emp.ID: 1223	2	[{"changed": {"fields": ["employee", "firstName", "lastName", "fullName", "specialization", "designation", "classTeacher"]}}]	16	2
2	2019-12-09 17:02:08.042215+00	6577	Name:Kartik Singh| Class:6-A| Emp.ID: 6577	1	[{"added": {}}]	16	2
3	2019-12-09 17:02:16.789755+00	6577	Name:Kartik Singh| Class:6-C| Emp.ID: 6577	2	[{"changed": {"fields": ["classTeacher"]}}]	16	2
4	2019-12-09 17:02:40.422453+00	10101012	Name:Jainaish Thakur| Class:6-B| Emp.ID: 10101012	2	[{"changed": {"fields": ["classTeacher"]}}]	16	2
5	2019-12-09 17:02:52.031653+00	101010	Name:| Class:| Emp.ID: 101010	3		16	2
6	2019-12-09 17:03:51.746676+00	2231	Name:Suman Thakur Add.No: 2231 Class:5-A	2	[{"changed": {"fields": ["firstName", "lastName", "fullName", "classSection"]}}]	8	2
7	2019-12-09 17:04:11.639897+00	123656	Name: Add.No: 123656 Class:	3		8	2
8	2019-12-09 17:04:25.128907+00	909090	Name: Add.No: 909090 Class:	3		8	2
9	2019-12-09 17:04:38.834341+00	223	Name:rameshsingh Add.No: 223 Class:5-B	2	[{"changed": {"fields": ["classSection"]}}]	8	2
10	2019-12-09 17:09:28.677067+00	2	Class:6-C| Teacher: Kartik Singh	1	[{"added": {}}]	21	2
11	2019-12-09 17:09:38.354674+00	3	Class:6-A| Teacher: Rohan Pawar	1	[{"added": {}}]	21	2
12	2019-12-09 17:12:44.258501+00	223	Name:rameshsingh Add.No: 223 Class:6-B	2	[{"changed": {"fields": ["classSection"]}}]	8	2
13	2019-12-09 17:13:00.383327+00	2231	Name:Suman Thakur Add.No: 2231 Class:6-A	2	[{"changed": {"fields": ["classSection"]}}]	8	2
14	2019-12-09 17:13:30.719433+00	122	Name:yash dfs Add.No: 122 Class:6-A	2	[{"changed": {"fields": ["fullName", "fName", "classSection"]}}]	8	2
15	2019-12-09 17:13:39.970985+00	122	Name:yash dfs Add.No: 122 Class:6-C	2	[{"changed": {"fields": ["classSection"]}}]	8	2
16	2019-12-09 18:42:58.418092+00	1	Class:Class:6-A| Teacher: Rohan Pawar| Student: Suman Thakur	1	[{"added": {}}]	22	2
17	2019-12-09 19:17:57.289282+00	12345	Name:rameshsingh| Add.No: 12345| Class:6-B	2	[{"changed": {"fields": ["classSection"]}}]	8	2
18	2019-12-09 19:24:44.459846+00	6	Class:Class:6-C| Teacher: Kartik Singh| Student:yash dfs	3		22	2
19	2019-12-11 07:50:18.120468+00	7	Name:Suman Thakur| Date:2019-12-18 | Status:absent	2	[{"changed": {"fields": ["status"]}}]	23	2
20	2019-12-11 09:23:39.568939+00	5	Name:Jainaish Thakur| Date:2019-12-11 | Status:Absent	1	[{"added": {}}]	24	2
21	2019-12-12 06:01:38.493429+00	1	ExamType object (1)	3		25	2
22	2019-12-12 06:04:28.414425+00	2	ExamType object (2)	3		25	2
23	2019-12-12 06:05:04.415143+00	3	ExamType object (3)	3		25	2
24	2019-12-12 06:13:35.893242+00	14	ExamType object (14)	3		25	2
25	2019-12-12 06:13:35.996596+00	13	ExamType object (13)	3		25	2
26	2019-12-12 06:13:36.003183+00	12	ExamType object (12)	3		25	2
27	2019-12-12 06:13:36.014478+00	11	ExamType object (11)	3		25	2
28	2019-12-12 06:13:36.025504+00	10	ExamType object (10)	3		25	2
29	2019-12-12 06:13:36.036728+00	9	ExamType object (9)	3		25	2
30	2019-12-12 06:13:36.047814+00	8	ExamType object (8)	3		25	2
31	2019-12-12 06:13:36.058726+00	7	ExamType object (7)	3		25	2
32	2019-12-12 06:13:36.06977+00	6	ExamType object (6)	3		25	2
33	2019-12-12 06:13:36.082541+00	5	ExamType object (5)	3		25	2
34	2019-12-12 06:13:36.091741+00	4	ExamType object (4)	3		25	2
35	2019-12-12 06:19:47.677879+00	26	ExamType object (26)	3		25	2
36	2019-12-12 06:19:47.740218+00	25	ExamType object (25)	3		25	2
37	2019-12-12 06:19:47.751171+00	24	ExamType object (24)	3		25	2
38	2019-12-12 06:19:47.762345+00	23	ExamType object (23)	3		25	2
39	2019-12-12 06:19:47.773566+00	22	ExamType object (22)	3		25	2
40	2019-12-12 06:19:47.784438+00	21	ExamType object (21)	3		25	2
41	2019-12-12 06:19:47.795625+00	20	ExamType object (20)	3		25	2
42	2019-12-12 06:19:47.806612+00	19	ExamType object (19)	3		25	2
43	2019-12-12 06:19:47.81759+00	18	ExamType object (18)	3		25	2
44	2019-12-12 06:19:47.828911+00	17	ExamType object (17)	3		25	2
45	2019-12-12 06:19:47.839627+00	16	ExamType object (16)	3		25	2
46	2019-12-12 06:19:47.85066+00	15	ExamType object (15)	3		25	2
47	2019-12-12 08:33:59.411978+00	323198964	Name:Ashok Sinha| Add.No: 323198964| Class:6-A	2	[{"changed": {"fields": ["fullName", "fName", "prevSchoolName"]}}]	8	2
48	2019-12-12 08:34:27.674646+00	3231	Name:Ashok Sinha| Add.No: 3231| Class:6-A	2	[{"changed": {"fields": ["fullName", "fName", "prevSchoolName"]}}]	8	2
49	2019-12-12 09:03:08.66342+00	37	ExamType object (37)	3		25	2
50	2019-12-12 09:03:08.830194+00	36	ExamType object (36)	3		25	2
51	2019-12-12 09:03:08.903805+00	35	ExamType object (35)	3		25	2
52	2019-12-12 09:03:08.914906+00	34	ExamType object (34)	3		25	2
53	2019-12-12 09:03:08.925947+00	33	ExamType object (33)	3		25	2
54	2019-12-12 09:03:08.937573+00	32	ExamType object (32)	3		25	2
55	2019-12-12 09:03:08.948069+00	31	ExamType object (31)	3		25	2
56	2019-12-12 09:03:08.958801+00	30	ExamType object (30)	3		25	2
57	2019-12-12 09:03:08.969917+00	29	ExamType object (29)	3		25	2
58	2019-12-12 09:03:08.98096+00	28	ExamType object (28)	3		25	2
59	2019-12-14 08:45:43.890481+00	3	Exam :Annual Exam ExamType:Theory	3		34	2
60	2019-12-14 08:45:59.910087+00	4	Exam :Annual Exam ExamType:Oral	3		34	2
61	2019-12-14 10:38:44.450412+00	6	Exam :UT-1 ExamType:Theory	1	[{"added": {}}]	34	2
62	2019-12-14 10:39:29.106453+00	12	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
63	2019-12-14 10:40:05.096371+00	13	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
64	2019-12-14 10:40:24.599171+00	14	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
65	2019-12-14 10:40:58.20926+00	15	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
66	2019-12-16 07:15:11.909235+00	4	Exam :SA-1	2	[{"changed": {"fields": ["examName", "description"]}}]	32	2
67	2019-12-16 07:15:39.20997+00	3	Exam :SA-2	2	[{"changed": {"fields": ["examName", "description"]}}]	32	2
68	2019-12-16 07:18:54.36662+00	11	Exam:SA-1 ExamType:Theory|Subject:Social Studies	2	[{"changed": {"fields": ["examType"]}}]	33	2
69	2019-12-16 07:19:07.58753+00	10	Exam:SA-1 ExamType:Theory|Subject:Science	2	[{"changed": {"fields": ["examType"]}}]	33	2
70	2019-12-16 07:19:20.088347+00	9	Exam:SA-1 ExamType:Theory|Subject:English	2	[{"changed": {"fields": ["examType"]}}]	33	2
71	2019-12-16 07:19:40.899765+00	8	Exam:SA-1 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["examType"]}}]	33	2
72	2019-12-16 07:19:50.630075+00	14	Exam:UT-1 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["subject"]}}]	33	2
73	2019-12-16 07:20:08.499008+00	6	Exam:SA-1 ExamType:Theory|Subject:Social Studies	2	[{"changed": {"fields": ["examType"]}}]	33	2
74	2019-12-16 07:21:13.074867+00	5	Exam :SA-2 ExamType:Theory	2	[{"changed": {"fields": ["examName", "examType", "minMarks", "maxMarks"]}}]	34	2
75	2019-12-16 07:21:18.97819+00	2	Exam :SA-1 ExamType:Theory	2	[]	34	2
76	2019-12-16 07:21:27.650533+00	6	Exam :UT-1 ExamType:Theory	2	[{"changed": {"fields": ["minMarks"]}}]	34	2
77	2019-12-16 07:21:33.275431+00	2	Exam :SA-1 ExamType:Theory	2	[]	34	2
78	2019-12-16 07:21:47.635593+00	1	Exam :UT-2 ExamType:Theory	2	[{"changed": {"fields": ["examType", "minMarks", "maxMarks"]}}]	34	2
79	2019-12-16 07:25:36.792945+00	7	Exam:SA-2 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["examName"]}}]	33	2
80	2019-12-16 07:25:50.574291+00	6	Exam:SA-2 ExamType:Theory|Subject:Social Studies	2	[{"changed": {"fields": ["examName", "examType"]}}]	33	2
81	2019-12-16 07:26:17.157325+00	7	Exam:SA-2 ExamType:Theory|Subject:Mathematics	2	[]	33	2
82	2019-12-16 07:26:41.350543+00	5	Exam:SA-2 ExamType:Theory|Subject:Science	2	[{"changed": {"fields": ["examName"]}}]	33	2
83	2019-12-16 07:26:52.695319+00	4	Exam:SA-2 ExamType:Theory|Subject:English	2	[{"changed": {"fields": ["examName"]}}]	33	2
84	2019-12-16 07:27:13.255717+00	2	Exam:UT-2 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["subject"]}}]	33	2
85	2019-12-16 07:27:51.167669+00	16	Exam:UT-2 ExamType:Theory|Subject:Social Studies	1	[{"added": {}}]	33	2
86	2019-12-16 07:29:53.49678+00	4	Suman Thakur | Exam:Theory UT-2 | Subject:Mathematics	1	[{"added": {}}]	31	2
87	2019-12-16 07:30:08.017209+00	5	Suman Thakur | Exam:Theory SA-2 | Subject:Science	1	[{"added": {}}]	31	2
88	2019-12-16 07:30:23.316381+00	6	Suman Thakur | Exam:Theory SA-2 | Subject:Social Studies	1	[{"added": {}}]	31	2
89	2019-12-16 07:30:51.223063+00	7	Suman Thakur | Exam:Theory SA-2 | Subject:English	1	[{"added": {}}]	31	2
90	2019-12-16 07:31:31.26615+00	8	Suman Thakur | Exam:Theory SA-2 | Subject:Mathematics	1	[{"added": {}}]	31	2
91	2019-12-16 07:32:06.766127+00	9	Suman Thakur | Exam:Theory UT-2 | Subject:English	1	[{"added": {}}]	31	2
92	2019-12-16 07:32:17.192105+00	1	Suman Thakur | Exam:Theory UT-2 | Subject:Science	2	[{"changed": {"fields": ["marks"]}}]	31	2
93	2019-12-16 07:32:29.736079+00	4	Suman Thakur | Exam:Theory UT-2 | Subject:Mathematics	2	[{"changed": {"fields": ["marks"]}}]	31	2
94	2019-12-16 07:35:20.960475+00	10	Suman Thakur | Exam:Theory UT-2 | Subject:Social Studies	1	[{"added": {}}]	31	2
95	2019-12-16 07:36:08.664446+00	11	Suman Thakur | Exam:Theory SA-1 | Subject:English	1	[{"added": {}}]	31	2
96	2019-12-16 07:36:29.756268+00	12	Suman Thakur | Exam:Theory SA-1 | Subject:Social Studies	1	[{"added": {}}]	31	2
97	2019-12-16 07:36:46.399048+00	13	Suman Thakur | Exam:Theory SA-1 | Subject:Science	1	[{"added": {}}]	31	2
98	2019-12-16 07:37:09.690084+00	14	Suman Thakur | Exam:Theory SA-1 | Subject:Mathematics	1	[{"added": {}}]	31	2
99	2019-12-16 07:38:35.467898+00	15	Suman Thakur | Exam:Theory UT-1 | Subject:English	1	[{"added": {}}]	31	2
100	2019-12-16 07:38:45.450171+00	16	Suman Thakur | Exam:Theory UT-1 | Subject:Social Studies	1	[{"added": {}}]	31	2
101	2019-12-16 07:38:56.053555+00	17	Suman Thakur | Exam:Theory UT-1 | Subject:Science	1	[{"added": {}}]	31	2
102	2019-12-16 07:39:13.563926+00	18	Suman Thakur | Exam:Theory UT-1 | Subject:Science	1	[{"added": {}}]	31	2
103	2019-12-16 07:39:25.131619+00	18	Suman Thakur | Exam:Theory UT-1 | Subject:Mathematics	2	[{"changed": {"fields": ["subject"]}}]	31	2
104	2019-12-16 17:26:18.841325+00	14	Suman Thakur | Exam:Theory SA-1 | Subject:Mathematics	2	[{"changed": {"fields": ["marks"]}}]	31	2
105	2019-12-16 17:26:31.409235+00	7	Suman Thakur | Exam:Theory SA-2 | Subject:English	2	[{"changed": {"fields": ["marks"]}}]	31	2
106	2019-12-16 17:28:12.03869+00	13	Suman Thakur | Exam:Theory SA-1 | Subject:Science	2	[{"changed": {"fields": ["marks"]}}]	31	2
107	2019-12-17 09:28:43.913242+00	19	Suman Thakur | Exam:Theory Final | Subject:English	2	[]	31	2
108	2019-12-17 09:29:00.405342+00	22	Suman Thakur | Exam:Theory Final | Subject:Science	1	[{"added": {}}]	31	2
109	2019-12-17 09:29:18.78414+00	23	Suman Thakur | Exam:Theory Final | Subject:Social Studies	1	[{"added": {}}]	31	2
110	2019-12-17 09:29:35.452872+00	24	Suman Thakur | Exam:Theory Final | Subject:Mathematics	1	[{"added": {}}]	31	2
111	2019-12-17 09:52:41.751742+00	1	AdditionalSubjectMapping object (1)	2	[{"changed": {"fields": ["examName", "examType", "marks"]}}]	36	2
112	2019-12-17 09:53:09.78701+00	2	AdditionalSubjectMapping object (2)	1	[{"added": {}}]	36	2
113	2019-12-17 09:53:30.922688+00	3	AdditionalSubjectMapping object (3)	1	[{"added": {}}]	36	2
114	2019-12-20 12:38:02.684136+00	2	FeeCategory object (2)	3		44	2
115	2019-12-21 08:00:38.030724+00	1	Fee object (1)	2	[{"changed": {"fields": ["monthsPaid"]}}]	48	2
116	2019-12-21 08:01:58.846742+00	1	Fee object (1)	2	[]	48	2
117	2019-12-21 11:08:04.565503+00	2	Class:6-B| Teacher: Jainaish Thakur FeeCategory object (3) 23231	3		49	2
118	2019-12-21 11:08:05.005115+00	1	Class:6-B| Teacher: Jainaish Thakur FeeCategory object (3) 23231	3		49	2
119	2019-12-21 11:09:02.296727+00	1	Class:6-A| Student:Suman Thakur 46567 Jan,Feb	2	[{"changed": {"fields": ["amount", "monthsPaid"]}}]	48	2
120	2019-12-21 11:11:52.503737+00	2	Class:6-A| Student:Ashok Sinha 4545 Mar,Apr,Sep	1	[{"added": {}}]	48	2
121	2019-12-21 11:14:14.845832+00	1	Class:6-A| Student:Suman Thakur 46567 Jan,Feb	2	[{"changed": {"fields": ["classSection"]}}]	48	2
122	2019-12-21 12:56:57.448164+00	2	Class:6-A| Student:Ashok Sinha 4545 Mar,Apr,Sep	2	[{"changed": {"fields": ["submissionDate"]}}]	48	2
123	2019-12-21 12:57:07.920284+00	2	Class:6-A| Student:Ashok Sinha 4545 Mar,Apr,Sep	2	[{"changed": {"fields": ["submissionDate"]}}]	48	2
124	2019-12-23 18:45:11.605076+00	16	Newsletter object (16)	3		41	2
125	2019-12-23 18:45:11.769739+00	15	Newsletter object (15)	3		41	2
126	2019-12-23 18:45:11.78068+00	14	Newsletter object (14)	3		41	2
127	2019-12-23 18:45:11.791735+00	13	Newsletter object (13)	3		41	2
128	2019-12-23 18:45:11.802808+00	12	Newsletter object (12)	3		41	2
129	2019-12-23 18:45:11.81397+00	11	Newsletter object (11)	3		41	2
130	2019-12-23 18:46:14.376471+00	17	Newsletter object (17)	2	[{"changed": {"fields": ["description"]}}]	41	2
131	2019-12-24 06:30:13.196793+00	68	Newsletter object (68)	3		41	2
132	2019-12-24 06:30:13.296041+00	67	Newsletter object (67)	3		41	2
133	2019-12-24 06:30:13.307094+00	66	Newsletter object (66)	3		41	2
134	2019-12-24 06:30:13.318102+00	65	Newsletter object (65)	3		41	2
135	2019-12-24 06:30:13.329233+00	64	Newsletter object (64)	3		41	2
136	2019-12-24 06:30:13.340464+00	63	Newsletter object (63)	3		41	2
137	2019-12-24 06:30:13.351355+00	62	Newsletter object (62)	3		41	2
138	2019-12-24 06:30:13.362535+00	61	Newsletter object (61)	3		41	2
139	2019-12-24 06:30:13.373638+00	60	Newsletter object (60)	3		41	2
140	2019-12-24 06:30:13.384581+00	59	Newsletter object (59)	3		41	2
141	2019-12-24 06:30:13.395809+00	58	Newsletter object (58)	3		41	2
142	2019-12-24 06:30:13.406984+00	57	Newsletter object (57)	3		41	2
143	2019-12-24 06:30:13.429215+00	56	Newsletter object (56)	3		41	2
144	2019-12-24 06:30:13.44019+00	55	Newsletter object (55)	3		41	2
145	2019-12-24 06:30:13.451409+00	54	Newsletter object (54)	3		41	2
146	2019-12-24 06:30:13.46255+00	53	Newsletter object (53)	3		41	2
147	2019-12-24 06:30:13.473394+00	52	Newsletter object (52)	3		41	2
148	2019-12-24 06:30:13.48434+00	51	Newsletter object (51)	3		41	2
149	2019-12-24 06:30:13.495345+00	50	Newsletter object (50)	3		41	2
150	2019-12-24 06:30:13.507209+00	49	Newsletter object (49)	3		41	2
151	2019-12-24 06:30:13.51765+00	48	Newsletter object (48)	3		41	2
152	2019-12-24 06:30:13.52873+00	47	Newsletter object (47)	3		41	2
153	2019-12-24 06:30:13.539686+00	46	Newsletter object (46)	3		41	2
154	2019-12-24 06:30:13.550886+00	45	Newsletter object (45)	3		41	2
155	2019-12-24 06:30:13.561945+00	44	Newsletter object (44)	3		41	2
156	2019-12-24 06:30:13.573227+00	43	Newsletter object (43)	3		41	2
157	2019-12-24 06:30:13.584046+00	42	Newsletter object (42)	3		41	2
158	2019-12-24 06:30:13.594898+00	41	Newsletter object (41)	3		41	2
159	2019-12-24 06:30:13.607071+00	40	Newsletter object (40)	3		41	2
160	2019-12-24 06:30:13.617211+00	39	Newsletter object (39)	3		41	2
161	2019-12-24 06:30:13.628221+00	38	Newsletter object (38)	3		41	2
162	2019-12-24 06:30:13.640472+00	37	Newsletter object (37)	3		41	2
163	2019-12-24 06:30:13.650492+00	36	Newsletter object (36)	3		41	2
164	2019-12-24 06:30:13.661446+00	35	Newsletter object (35)	3		41	2
165	2019-12-24 06:30:13.673882+00	34	Newsletter object (34)	3		41	2
166	2019-12-24 06:30:13.683691+00	33	Newsletter object (33)	3		41	2
167	2019-12-24 06:30:13.694744+00	32	Newsletter object (32)	3		41	2
168	2019-12-24 06:30:13.706195+00	31	Newsletter object (31)	3		41	2
169	2019-12-24 06:30:13.716789+00	30	Newsletter object (30)	3		41	2
170	2019-12-24 06:30:13.728081+00	29	Newsletter object (29)	3		41	2
171	2019-12-24 06:30:13.740145+00	28	Newsletter object (28)	3		41	2
172	2019-12-24 06:30:13.750229+00	27	Newsletter object (27)	3		41	2
173	2019-12-24 06:30:13.761449+00	26	Newsletter object (26)	3		41	2
174	2019-12-24 06:30:13.772722+00	25	Newsletter object (25)	3		41	2
175	2019-12-24 06:30:13.783352+00	24	Newsletter object (24)	3		41	2
176	2019-12-24 06:30:13.794753+00	23	Newsletter object (23)	3		41	2
177	2019-12-24 06:30:13.805353+00	22	Newsletter object (22)	3		41	2
178	2019-12-24 06:30:13.816405+00	21	Newsletter object (21)	3		41	2
179	2019-12-24 06:30:13.827511+00	20	Newsletter object (20)	3		41	2
180	2019-12-24 06:30:13.838665+00	19	Newsletter object (19)	3		41	2
181	2019-12-24 06:30:13.849685+00	18	Newsletter object (18)	3		41	2
182	2019-12-24 06:30:13.860775+00	17	Newsletter object (17)	3		41	2
183	2019-12-24 06:38:01.499269+00	71	Newsletter object (71)	3		41	2
184	2019-12-24 06:38:01.592853+00	70	Newsletter object (70)	3		41	2
185	2019-12-24 06:46:13.073836+00	69	Newsletter object (69)	3		41	2
186	2019-12-24 06:52:10.650944+00	74	Newsletter object (74)	3		41	2
187	2019-12-24 06:53:21.050819+00	75	Newsletter object (75)	3		41	2
188	2019-12-24 07:18:04.610428+00	91	Newsletter object (91)	3		41	2
189	2019-12-24 07:18:04.660126+00	90	Newsletter object (90)	3		41	2
190	2019-12-24 07:18:04.693309+00	89	Newsletter object (89)	3		41	2
191	2019-12-24 07:18:04.726586+00	88	Newsletter object (88)	3		41	2
192	2019-12-24 07:18:04.759615+00	87	Newsletter object (87)	3		41	2
193	2019-12-24 07:18:04.792914+00	86	Newsletter object (86)	3		41	2
194	2019-12-24 07:18:04.826078+00	85	Newsletter object (85)	3		41	2
195	2019-12-24 07:18:04.859092+00	84	Newsletter object (84)	3		41	2
196	2019-12-24 07:18:04.892283+00	83	Newsletter object (83)	3		41	2
197	2019-12-24 07:18:04.925617+00	82	Newsletter object (82)	3		41	2
198	2019-12-24 07:18:04.958927+00	81	Newsletter object (81)	3		41	2
199	2019-12-24 07:18:04.992237+00	80	Newsletter object (80)	3		41	2
200	2019-12-24 07:18:05.025334+00	79	Newsletter object (79)	3		41	2
201	2019-12-24 07:18:05.058425+00	78	Newsletter object (78)	3		41	2
202	2019-12-24 07:18:05.091599+00	77	Newsletter object (77)	3		41	2
203	2019-12-24 07:18:05.124778+00	76	Newsletter object (76)	3		41	2
204	2019-12-24 07:18:05.158047+00	73	Newsletter object (73)	3		41	2
205	2019-12-24 07:18:05.19123+00	72	Newsletter object (72)	3		41	2
206	2019-12-24 07:39:54.917331+00	92	Newsletter object (92)	3		41	2
207	2019-12-24 08:19:38.410104+00	2	Rohan	2	[{"changed": {"fields": ["image"]}}]	1	2
208	2019-12-24 08:28:19.625049+00	3	Smith	3		1	2
209	2019-12-24 08:31:39.151991+00	4	Testing	3		1	2
210	2019-12-24 08:47:11.179005+00	8	Test12345	3		1	2
211	2019-12-24 08:47:11.19098+00	7	Test123	3		1	2
212	2019-12-24 08:47:11.202384+00	6	Testing1234	3		1	2
213	2019-12-24 08:47:11.213167+00	5	Testing123	3		1	2
214	2019-12-24 10:04:04.372423+00	1	yash	2	[{"changed": {"fields": ["image"]}}]	1	2
215	2019-12-24 10:04:34.517945+00	12	Smith	2	[{"changed": {"fields": ["user", "mobile_no"]}}]	1	2
216	2019-12-24 11:09:26.943368+00	11	kakkl	3		5	2
217	2019-12-24 11:09:26.97819+00	12	kakklqwqw	3		5	2
218	2019-12-24 11:09:26.989224+00	13	kakklqwqwqw	3		5	2
219	2019-12-24 11:09:27.000498+00	3	Rohan	3		5	2
220	2019-12-24 11:09:27.011345+00	8	Test123	3		5	2
221	2019-12-24 11:09:27.022454+00	9	Test12345	3		5	2
222	2019-12-24 11:09:27.03351+00	5	Testing	3		5	2
223	2019-12-24 11:09:27.044536+00	6	Testing123	3		5	2
224	2019-12-24 11:09:27.055639+00	7	Testing1234	3		5	2
225	2019-12-24 11:09:27.066891+00	10	Testing123456	3		5	2
226	2019-12-24 11:15:33.147539+00	4	Smith	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	5	2
227	2019-12-24 11:26:38.919266+00	12	Smith	2	[{"changed": {"fields": ["fullName"]}}]	1	4
228	2019-12-25 16:32:06.657628+00	116	Newsletter object (116)	3		41	2
229	2019-12-25 16:32:06.770873+00	115	Newsletter object (115)	3		41	2
230	2019-12-25 16:32:06.782015+00	114	Newsletter object (114)	3		41	2
231	2019-12-25 16:32:06.79303+00	113	Newsletter object (113)	3		41	2
232	2019-12-25 16:32:06.837458+00	112	Newsletter object (112)	3		41	2
233	2019-12-25 16:32:06.848541+00	111	Newsletter object (111)	3		41	2
234	2019-12-25 16:32:06.859622+00	110	Newsletter object (110)	3		41	2
235	2019-12-25 16:32:06.881317+00	109	Newsletter object (109)	3		41	2
236	2019-12-25 16:32:06.892538+00	108	Newsletter object (108)	3		41	2
237	2019-12-25 16:32:06.90375+00	107	Newsletter object (107)	3		41	2
238	2019-12-25 16:32:06.914821+00	106	Newsletter object (106)	3		41	2
239	2019-12-25 16:32:06.925903+00	105	Newsletter object (105)	3		41	2
240	2019-12-25 16:32:06.936956+00	104	Newsletter object (104)	3		41	2
241	2019-12-25 16:32:06.948028+00	103	Newsletter object (103)	3		41	2
242	2019-12-25 16:32:06.95906+00	102	Newsletter object (102)	3		41	2
243	2019-12-25 16:32:06.97032+00	101	Newsletter object (101)	3		41	2
244	2019-12-25 16:32:06.981284+00	100	Newsletter object (100)	3		41	2
245	2019-12-25 16:32:06.992046+00	99	Newsletter object (99)	3		41	2
246	2019-12-25 16:32:07.003077+00	98	Newsletter object (98)	3		41	2
247	2019-12-25 16:32:07.014125+00	97	Newsletter object (97)	3		41	2
248	2019-12-25 16:32:07.049846+00	96	Newsletter object (96)	3		41	2
249	2019-12-25 16:32:07.082495+00	95	Newsletter object (95)	3		41	2
250	2019-12-25 16:32:07.108948+00	94	Newsletter object (94)	3		41	2
251	2019-12-25 16:32:14.552087+00	93	Newsletter object (93)	2	[{"changed": {"fields": ["date"]}}]	41	2
252	2019-12-25 17:07:20.070478+00	1	yash	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	5	2
253	2020-01-07 17:10:45.389201+00	4	Exam :SEA-1	2	[{"changed": {"fields": ["examName"]}}]	32	1
254	2020-01-07 17:10:52.817174+00	3	Exam :SEA-2	2	[{"changed": {"fields": ["examName"]}}]	32	1
255	2020-01-07 17:11:17.439557+00	5	Exam :Annual	2	[{"changed": {"fields": ["examName"]}}]	32	1
256	2020-01-07 17:11:45.426595+00	6	Exam :Half Yearly	1	[{"added": {}}]	32	1
257	2020-01-07 17:12:16.156726+00	7	Exam :Note Book 1	1	[{"added": {}}]	32	1
258	2020-01-07 17:12:28.722339+00	7	Exam :Note Book-1	2	[{"changed": {"fields": ["examName"]}}]	32	1
259	2020-01-07 17:12:43.287043+00	8	Exam :Note Book-2	1	[{"added": {}}]	32	1
260	2020-01-07 17:14:42.902888+00	8	Exam :Note Book-1 ExamType:Theory	1	[{"added": {}}]	34	1
261	2020-01-07 17:14:57.07902+00	9	Exam :Note Book-2 ExamType:Theory	1	[{"added": {}}]	34	1
262	2020-01-07 17:35:41.17161+00	6	Exam :Half Yearly	2	[]	32	1
263	2020-01-07 17:36:06.56576+00	10	Exam :Half Yearly ExamType:Theory	1	[{"added": {}}]	34	1
264	2020-01-07 18:03:29.174787+00	6	Exam :Half-Yearly	2	[{"changed": {"fields": ["examName"]}}]	32	1
265	2020-01-12 07:07:46.336188+00	4	Class:6-A| Student:Suman Thakur 32000 Sept	3		48	1
266	2020-01-12 07:07:56.468492+00	3	Class:6-A| Student:Suman Thakur 32000 Sept	3		48	1
267	2020-01-12 07:09:35.805878+00	5	Class:6-A| Student:Suman Thakur 32000 Sept	3		48	1
268	2020-01-17 18:17:47.309816+00	899	Name:ShubhamShahi| Cateogry:driver| Emp.ID: 899	2	[{"changed": {"fields": ["empCategory"]}}]	18	1
269	2020-01-19 06:27:39.576583+00	3	Vehicle object (3)	1	[{"added": {}}]	54	1
270	2020-01-19 10:44:35.895182+00	3	Vehicle object (3)	2	[{"changed": {"fields": ["insurance_company"]}}]	54	1
271	2020-01-19 19:42:15.036373+00	2231	StudentRoute object (2231)	1	[{"added": {}}]	55	1
272	2020-01-20 17:16:45.236692+00	1	Routes object (1)	1	[{"added": {}}]	53	1
273	2020-01-20 17:17:03.867864+00	323198964	StudentRoute object (323198964)	1	[{"added": {}}]	55	1
274	2020-01-20 17:29:33.792675+00	8	Class:6-A| Student:Ashok Sinha	1	[{"added": {}}]	22	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	accounts	userprofile
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
8	form	studentinfo
9	form	parentinfo
10	form	documents
11	form	currentaddress
12	form	permanentaddress
13	teacherform	employeedocuments
14	teacherform	employee
15	teacherform	teacher
16	employeeform	teacher
17	employeeform	employeedocuments
18	employeeform	employee
19	employeeform	permanentaddress
20	employeeform	currentaddress
21	classform	classroom
22	classform	classroomstudent
23	attendence	studentattendence
24	attendence	teacherattendence
25	marks	examtype
26	marks	subjectstoclass
27	marks	marks
28	marks	exam
29	marks	exammapping
30	marks	additionalsubject
31	markssection	marks
32	markssection	exam
33	markssection	exammapping
34	markssection	examtype
35	markssection	additionalsubject
36	markssection	additionalsubjectmapping
37	homework	homework
38	notice	classnotice
39	notice	studentnotice
40	dailythought	thoughts
41	newsletter	newsletter
42	schoolinfo	schoolinfo
43	holiday	holiday
44	fees	feecategory
45	fees	feecycle
46	fees	feediscount
47	fees	fine
48	fees	fee
49	fees	classsectionfees
50	homework	syllabus
51	classform	reportcard
52	transport	driver
53	transport	routes
54	transport	vehicle
55	form	studentroute
56	classform	studentrouteattendence
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-03 06:38:19.830653+00
2	auth	0001_initial	2019-12-03 06:38:20.198801+00
3	accounts	0001_initial	2019-12-03 06:38:20.837133+00
4	accounts	0002_auto_20191202_1037	2019-12-03 06:38:20.98694+00
5	admin	0001_initial	2019-12-03 06:38:21.118142+00
6	admin	0002_logentry_remove_auto_add	2019-12-03 06:38:21.238454+00
7	admin	0003_logentry_add_action_flag_choices	2019-12-03 06:38:21.270029+00
8	contenttypes	0002_remove_content_type_name	2019-12-03 06:38:21.315389+00
9	auth	0002_alter_permission_name_max_length	2019-12-03 06:38:21.337847+00
10	auth	0003_alter_user_email_max_length	2019-12-03 06:38:21.368507+00
11	auth	0004_alter_user_username_opts	2019-12-03 06:38:21.400553+00
12	auth	0005_alter_user_last_login_null	2019-12-03 06:38:21.419576+00
13	auth	0006_require_contenttypes_0002	2019-12-03 06:38:21.429578+00
14	auth	0007_alter_validators_add_error_messages	2019-12-03 06:38:21.46006+00
15	auth	0008_alter_user_username_max_length	2019-12-03 06:38:21.528431+00
16	auth	0009_alter_user_last_name_max_length	2019-12-03 06:38:21.558244+00
17	auth	0010_alter_group_name_max_length	2019-12-03 06:38:21.589089+00
18	auth	0011_update_proxy_permissions	2019-12-03 06:38:21.610388+00
19	sessions	0001_initial	2019-12-03 06:38:21.695526+00
20	form	0001_initial	2019-12-03 09:45:02.038996+00
21	form	0002_auto_20191204_1534	2019-12-04 10:04:48.559332+00
22	form	0003_auto_20191204_1656	2019-12-04 11:26:51.125674+00
23	form	0004_studentinfo_fname	2019-12-04 12:21:26.200659+00
24	form	0005_auto_20191204_1803	2019-12-04 12:33:45.888357+00
25	form	0006_auto_20191204_2230	2019-12-04 17:00:32.022084+00
26	form	0007_auto_20191204_2234	2019-12-04 17:04:43.976883+00
27	form	0008_currentaddress_city	2019-12-04 19:50:26.538903+00
28	form	0009_auto_20191205_0127	2019-12-04 19:57:33.324896+00
29	teacherform	0001_initial	2019-12-05 11:21:18.625715+00
30	employeeform	0001_initial	2019-12-06 07:35:01.685337+00
31	employeeform	0002_currentaddress_permanentaddress	2019-12-06 09:34:42.273471+00
32	employeeform	0003_auto_20191206_1619	2019-12-06 10:49:45.201609+00
33	form	0010_auto_20191206_1628	2019-12-06 10:59:02.936836+00
34	employeeform	0004_auto_20191206_1630	2019-12-06 11:00:37.214343+00
35	classform	0001_initial	2019-12-07 09:31:31.682729+00
36	employeeform	0005_auto_20191209_1730	2019-12-09 12:00:50.349272+00
37	attendence	0001_initial	2019-12-09 12:00:51.355304+00
38	classform	0002_auto_20191209_2352	2019-12-09 18:22:49.774506+00
39	classform	0003_auto_20191210_0002	2019-12-09 18:32:10.116961+00
40	classform	0004_auto_20191210_0011	2019-12-09 18:42:01.883328+00
41	attendence	0002_auto_20191210_1307	2019-12-10 07:37:36.597976+00
42	attendence	0003_auto_20191210_1737	2019-12-10 12:07:57.832733+00
43	attendence	0004_auto_20191210_2341	2019-12-10 18:11:17.33577+00
44	marks	0001_initial	2019-12-11 20:00:57.477451+00
45	marks	0002_auto_20191213_1719	2019-12-13 11:49:54.244371+00
46	markssection	0001_initial	2019-12-13 11:54:48.637545+00
47	markssection	0002_marks_examname	2019-12-13 13:03:20.095388+00
48	markssection	0003_auto_20191213_2340	2019-12-13 18:10:29.115281+00
49	homework	0001_initial	2019-12-18 07:20:48.724438+00
50	notice	0001_initial	2019-12-18 08:52:37.884812+00
51	dailythought	0001_initial	2019-12-19 07:50:44.575603+00
52	newsletter	0001_initial	2019-12-19 08:47:48.967396+00
53	newsletter	0002_auto_20191219_1419	2019-12-19 08:49:15.405205+00
54	newsletter	0003_auto_20191219_1420	2019-12-19 08:50:21.058556+00
55	schoolinfo	0001_initial	2019-12-19 10:35:18.466848+00
56	schoolinfo	0002_auto_20191219_1605	2019-12-19 10:35:18.50683+00
57	holiday	0001_initial	2019-12-19 11:56:27.569884+00
58	fees	0001_initial	2019-12-20 11:26:55.13996+00
59	newsletter	0004_auto_20191220_1656	2019-12-20 11:26:55.747336+00
60	fees	0002_auto_20191221_1512	2019-12-21 09:43:01.728073+00
61	newsletter	0005_auto_20191221_1512	2019-12-21 09:43:02.132809+00
62	newsletter	0005_auto_20191221_2021	2019-12-23 16:47:47.453213+00
63	newsletter	0006_auto_20191221_2047	2019-12-23 16:47:47.620493+00
64	newsletter	0007_merge_20191223_2217	2019-12-23 16:47:47.635334+00
65	accounts	0003_userprofile_image	2019-12-24 07:50:35.513395+00
66	fees	0003_fine_submissiondate	2019-12-24 07:50:36.620064+00
67	newsletter	0008_auto_20191224_1320	2019-12-24 07:50:36.648315+00
68	accounts	0004_auto_20191224_1412	2019-12-24 08:42:12.6633+00
69	accounts	0005_auto_20191224_1638	2019-12-24 11:08:57.59977+00
70	accounts	0006_userprofile_fullname	2019-12-24 11:23:22.837985+00
71	form	0011_remove_parentinfo_gaurdianname	2019-12-24 20:12:02.712169+00
72	newsletter	0007_merge_20191223_1057	2019-12-24 20:12:03.023635+00
73	newsletter	0008_auto_20191223_1057	2019-12-24 20:12:03.135603+00
74	newsletter	0009_merge_20191225_0141	2019-12-24 20:12:03.148927+00
75	form	0012_auto_20191225_2229	2019-12-25 16:59:30.813762+00
76	homework	0002_syllabus	2019-12-25 16:59:31.550471+00
77	fees	0004_fee_feeslip	2020-01-11 18:02:10.077918+00
78	classform	0005_reportcard	2020-01-12 07:24:28.273902+00
79	transport	0001_initial	2020-01-16 18:42:58.431806+00
80	transport	0002_vehicle_service_date	2020-01-17 17:23:54.72671+00
81	transport	0003_auto_20200118_1138	2020-01-18 06:08:55.465855+00
82	transport	0004_auto_20200118_1141	2020-01-18 06:11:25.924134+00
83	form	0013_studentroute	2020-01-18 07:06:18.701966+00
84	form	0014_delete_studentroute	2020-01-19 19:40:00.11844+00
85	form	0015_studentroute	2020-01-19 19:40:44.384606+00
86	classform	0006_studentrouteattendence	2020-01-19 20:04:33.794983+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
9uatucct0nt5qsrnccwmee04pv6mdb02	ZGNmYWRlZjc4MjU0ZjAzYzRlOWRhNzc5NTg5YTBlYzk0MTA2MGJmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWFhZjhmMDYzZDk1OGI5NmMyNGVlM2Y2MTU1NjY2NjEwZTc1ODJlIiwiY2xhc3NfbmFtZSI6IjYtQSIsImFkZF9ubyI6IjEyMiJ9	2020-02-02 17:45:24.75217+00
azgkr0emzy4vcu4fevabf9x8a4p299w4	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:42:36.547035+00
4u8s6xbhnx8tslywobqfrhu3zkjbfzf1	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:44:58.656373+00
rl9itx9w57tddbug8d59ta151t5n8gvp	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:45:31.572683+00
5pim89hg8ejuvibd95cu4m226cwsm1pq	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:50:33.060822+00
i1fvoj2x1ph1h73f5befzfx50yz2hkgs	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:52:16.08979+00
\.


--
-- Data for Name: employeeform_currentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_currentaddress (employee_id, "Address", "Address1", "Address2", "zipCode", state, city) FROM stdin;
101010				0		
10101012				0		
4451212				0		
45465456				0		
\.


--
-- Data for Name: employeeform_employee; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_employee ("empID", "firstName", "lastName", "fullName", father_name, mother_name, "partnerName", gender, email, "currentAddress", "permanentAddress", dob, "joiningDate", "bloodGroup", mobile_number, marital_status, experience, "aadharNumber", "empCategory") FROM stdin;
1223	Rohan	Pawar	RohanPawar	Ramesh	Radha	Priya	Male	sdsdds@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	2 years	13133126	teacher
6577	Kartik	Singh	KartikSingh	Ramesh	Radha	Priya	Male	sdsdds@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	2 years	13133126	teacher
89	Aryan	Tukrul	AryanTukrul	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	teacher
89999	Aryan	Tukrul	AryanTukrul	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	teacher
78788	Aryan	Tukrul	AryanTukrul	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	teacher
786	Aakash	Boura	AakashBoura	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	manager
101010	Jainaish	Thakur	Jainaish Thakur	wewewewewew	wewewewe	wewewe	Male	sdsd@gmail.com	wewee ewewe,Mumbai,Maharashtra-420123	wewee ewewe,Mumbai,Maharashtra-420123	2019-12-25	2019-11-25	B+	4646464646	Unmarried	8 years	131313131	teacher
10101012	Jainaish	Thakur	Jainaish Thakur	wewewewewew	wewewewe	wewewe	Male	sdsd@gmail.com	wewee ewewe,Mumbai,Maharashtra-420123	wewee ewewe,Mumbai,Maharashtra-420123	2019-12-25	2019-11-25	B+	4646464646	Unmarried	8 years	131313131	teacher
445454											\N	\N		0			0	
4451212	test	test	test test	uyuyu	yuyuy	uyuyuy	Male	aa@gmail.com	yuuyuy uyuy,yuyuy,yuyu-yuy	yuuyuy uyuy,yuyuy,yuyu-yuy	2019-11-26	2019-12-02	A	45465464	qwqw	yuuyuy	46546546464	receptionist
45465456	test2	test2	test2 test2	kjjkj	jkjkj	jkjkj	Male	aa@gmail.com	jkkjk jkj,jkjk,jkkjk-jkj	jkkjk jkj,jkjk,jkkjk-jkj	2019-12-10	2019-12-09	A	31212121	kjkj	jkjkj	546464646	coordinator
899	Shubham	Shahi	ShubhamShahi	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	driver
\.


--
-- Data for Name: employeeform_employeedocuments; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_employeedocuments (employee_id, photo, "qualificationDoc", "IdProof", "addressProof", "otherDoc") FROM stdin;
1223	uploads/emp/photograph/Blazer.jpg	uploads/emp/qualificationDocs/mobile.jpg	uploads/emp/idProof/shirt.jpg	uploads/emp/addressProof/USB.jpg	uploads/emp/otherDoc/jeans.jpg
6577	uploads/emp/photograph/Blazer_8LqQFDd.jpg	uploads/emp/qualificationDocs/mobile_ZRQqISG.jpg	uploads/emp/idProof/shirt_a1gLma8.jpg	uploads/emp/addressProof/USB_hC0NQHw.jpg	uploads/emp/otherDoc/jeans_p8u7ODp.jpg
899	uploads/emp/photograph/Blazer_4YzoY1D.jpg	uploads/emp/qualificationDocs/mobile_Okaa7Yw.jpg	uploads/emp/idProof/shirt_bPWp85W.jpg	uploads/emp/addressProof/USB_Mtf3VbN.jpg	uploads/emp/otherDoc/jeans_viSsUqq.jpg
89	uploads/emp/photograph/Blazer_oXDBYyi.jpg	uploads/emp/qualificationDocs/mobile_qp4gBS8.jpg	uploads/emp/idProof/shirt_MurkfaR.jpg	uploads/emp/addressProof/USB_x7nwVMb.jpg	uploads/emp/otherDoc/jeans_kjqnppq.jpg
89999	uploads/emp/photograph/Blazer_kF86ugO.jpg	uploads/emp/qualificationDocs/mobile_3a0sILN.jpg	uploads/emp/idProof/shirt_ZlLdncs.jpg	uploads/emp/addressProof/USB_rR4ohcC.jpg	uploads/emp/otherDoc/jeans_t9ANcNr.jpg
78788	uploads/emp/photograph/Blazer_RcCM1gs.jpg	uploads/emp/qualificationDocs/mobile_FNf86sY.jpg	uploads/emp/idProof/shirt_X1Vt9hz.jpg	uploads/emp/addressProof/USB_nKn5xjW.jpg	uploads/emp/otherDoc/jeans_xeB2fsX.jpg
786	uploads/emp/photograph/Blazer_7faKlTx.jpg	uploads/emp/qualificationDocs/mobile_W6pKLZK.jpg	uploads/emp/idProof/shirt_Ve39DP5.jpg	uploads/emp/addressProof/USB_hhAErba.jpg	uploads/emp/otherDoc/jeans_bwdQoG7.jpg
10101012	uploads/emp/photograph/shirt.jpg	uploads/emp/qualificationDocs/bat.jpg	uploads/emp/idProof/shirt_1AkdrCo.jpg	uploads/emp/addressProof/bat.jpg	uploads/emp/otherDoc/bat.jpg
4451212	emp/test test/bat.jpg	emp/test test/bat_qYtvtYG.jpg	emp/test test/bat_kYWrH1f.jpg	emp/test test/bat_J89bs8c.jpg	emp/test test/bat_SlCtcfs.jpg
45465456	emp/test2 test2/bat.jpg	emp/test2 test2/bat_cqf3ATX.jpg	emp/test2 test2/bat_ISrmMO8.jpg	emp/test2 test2/bat_31EPcvS.jpg	emp/test2 test2/bat_NRohnvE.jpg
\.


--
-- Data for Name: employeeform_permanentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_permanentaddress (employee_id, "Address", "Address1", "Address2", "zipCode", state, city) FROM stdin;
101010				0		
10101012				0		
4451212				0		
45465456				0		
\.


--
-- Data for Name: employeeform_teacher; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_teacher (employee_id, "firstName", "lastName", "fullName", specialization, designation, "classTeacher") FROM stdin;
1223	Rohan	Pawar	Rohan Pawar	sdsdsdsds	Ss	6-A
6577	Kartik	Singh	Kartik Singh	sdsdsdsd	Ss	6-C
10101012	Jainaish	Thakur	Jainaish Thakur	sdsdsdsd	464	6-B
\.


--
-- Data for Name: fees_classsectionfees; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_classsectionfees (id, fees, "classSection_id", "feeCategory_id") FROM stdin;
3	23231	1	3
4	121212	3	1
\.


--
-- Data for Name: fees_fee; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_fee (id, "regNo", payment_method, "submissionDate", "monthsPaid", "classSection_id", student_id, amount, "feeSlip") FROM stdin;
1	989898	uiuiu	2019-12-20	Jan,Feb	3	1	46567	
2	54545	nkkj	2019-11-13	Mar,Apr,Sep	3	3	4545	
6	12121	Check	2020-01-12	Sept	3	1	32000	fee-slip/2231/fee-slip_JKQv1r1
\.


--
-- Data for Name: fees_feecategory; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_feecategory (id, once, submission_type, description) FROM stdin;
1	t	once	sdsds
3	f	Monthly	aaaa
\.


--
-- Data for Name: fees_feecycle; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_feecycle (id, "lastSubmissionDate", "firstSubmissionDate", cycle) FROM stdin;
1	2019-12-27	2019-12-17	monthly
\.


--
-- Data for Name: fees_feediscount; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_feediscount (id, discount, category, description, total_off, student_id) FROM stdin;
13	5		sdsdsd	2304	1
14	5		sdsdsd	2304	1
15	5		sdsdsd	2304	1
\.


--
-- Data for Name: fees_fine; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_fine (id, fine, category, description, student_id, "submissionDate") FROM stdin;
2	45454	tets	sdsdsd	1	2019-12-24
\.


--
-- Data for Name: form_currentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_currentaddress (student_id, "Address", "zipCode", state, city, "Address1", "Address2") FROM stdin;
122		0				
2231		0				
12345		0				
9766	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
19766	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
1	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
2	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
\.


--
-- Data for Name: form_documents; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_documents (student_id, photo, "idProof", "castCertificate", domicile, tc, "characterCertificate") FROM stdin;
122	uploads/photograph/bat.jpg	uploads/idProof/tabletennis.jpg	uploads/castCertificate/tabletennis.jpg	uploads/domicile/USB.jpg	uploads/tc/USB.jpg	uploads/characterCertificate/shirt.jpg
\.


--
-- Data for Name: form_parentinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_parentinfo (student_id, "fatherName", "motherName", "Fatherdob", "Motherdob", "MobileNumber", "altMobileNumber", "gaurdianQual", "guardianOccup", email, "motherQual", "motherOccup") FROM stdin;
122	asasas	asasas	2019-11-25	2019-11-25	4563	3449	asasas	asasas	asasas	asasas	
2231	suresh	priya	2019-12-24	2019-12-09	4654646465	4646464855	hjhjhjhj	ererererer	aysy@gmail.com	xcxcxcxcxc	
12345	suresh	priya	2019-12-24	2019-12-09	4654646465	4646464855	hjhjhjhj	ererererer	aysy@gmail.com	xcxcxcxcxc	
19766	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
1	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
2	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
9766	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
\.


--
-- Data for Name: form_permanentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_permanentaddress (student_id, "Address", "zipCode", state, city, "Address1", "Address2") FROM stdin;
122		0				
12345		0				
19766	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
2231	E 303, Something	401330	Maharashtra	Mumbai		
1	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
2	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
9766	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
\.


--
-- Data for Name: form_studentinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_studentinfo ("firstName", "lastName", gender, dob, "classSection", "admissionNumber", "mobileNumber", religion, caste, "tcNumber", "aadharNumber", "feeWaiverCategory", "siblingID", "prevSchoolName", "fullName") FROM stdin;
Soham	Singh	Male	2000-07-01		9766	5656565656	Hindu	Brahmin	464646	464646	hkhkhkh	23331		
asasas	asas	Male	2019-12-02	False	98	121212	asasas	asasas	456	56	asasas	34567	asasas	asasasas 
kartik	eret	Female	2019-12-02	False	988	121212	asasas	asasas	456	56	asasas	34567	asasas	kartik eret 
ramesh	singh	Male	2019-11-24	6-B	223	78965423198	Hindu	Brahman	454545454	546464646	Some Category	464646	euadsdcxvv	rameshsingh
Suman	Thakur	Male	2019-11-24	6-A	2231	78965423198	Hindu	Brahman	454545454	546464646	Some Category	464646	euadsdcxvv	Suman Thakur
yash	dff	Male	2019-12-02	6-C	122	121212	asasas	asasas	456	56	asasas	34567	asasas	yash dfs
			\N	6-A	4646464	0			0	0		0		
ramesh	singh	Male	2019-11-24	6-B	12345	78965423198	Hindu	Brahman	454545454	546464646	Some Category	464646	euadsdcxvv	rameshsingh
Ashok	Sinha	Male	2019-12-03	6-A	323198964	545454545	jljlj	jljlj	4646464	4646464	jkjkj	797979	asasas	Ashok Sinha
Ashok	Sinha	Male	2019-12-03	6-A	3231	545454545	jljlj	jljlj	4646464	4646464	jkjkj	797979	asasas	Ashok Sinha
Soham	Singh	Male	2000-07-01		19766	5656565656	Hindu	Brahmin	464646	464646	hkhkhkh	23331	sdsdsdsd	Soham Singh
Soham	Singh	Male	2000-07-01		1	5656565656	Hindu	Brahmin	464646	464646	hkhkhkh	23331	sdsdsdsd	Soham Singh
Dhruv	D’Sourza	Male	2001-05-01		2	1212121212	Muslim	Sdsd	464646	464646	hkhkhkh	23331	sdsdsdsd	Dhruv D’Sourza
\.


--
-- Data for Name: form_studentroute; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_studentroute (student_id, route_code, route_stoppage, shift) FROM stdin;
2231	123	Andheri	Morning
323198964	1	Dwarka	Evening
\.


--
-- Data for Name: holiday_holiday; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.holiday_holiday (id, title, "startDate", "endDate") FROM stdin;
1	ssdsd	2019-12-02	2019-12-04
2	ssdsd	2019-12-02	2019-12-04
3	fdfdf	2019-12-02	2019-12-04
\.


--
-- Data for Name: homework_homework; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.homework_homework (id, description, subject, document, date_published, "classRoom_id") FROM stdin;
7	Something	English	homework/6-A/pip.txt	2019-12-18	3
8	dejvhjnvbn	Mathematics	homework/6-A/pip_AcUQsMI.txt	2019-12-18	3
10	asasas	Social Studies		2019-12-19	3
15	\r\n           \r\n          ghghg		homework/6-A/logo.png	2019-12-25	3
\.


--
-- Data for Name: homework_syllabus; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.homework_syllabus (id, description, document, date_published, "classRoom_id") FROM stdin;
\.


--
-- Data for Name: markssection_additionalsubjectmapping; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_additionalsubjectmapping (id, subject, marks, "classroomStudent_id", "examName_id", "examType_id") FROM stdin;
1	Drawing	63	1	4	2
2	Drawing	68	1	3	5
3	Drawing	72	1	5	7
\.


--
-- Data for Name: markssection_exam; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_exam (id, "examName", description) FROM stdin;
1	UT-1	Unit Test
2	UT-2	Unit Test
4	SEA-1	half yearly exam
3	SEA-2	annual exam
5	Annual	Final Exam
7	Note Book-1	Note Book 1
8	Note Book-2	Note Book 2
6	Half-Yearly	Half Yearly Exam
\.


--
-- Data for Name: markssection_exammapping; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_exammapping (id, subject, classroom_id, "examName_id", "examType_id") FROM stdin;
1	English	3	2	1
3	Science	3	2	1
12	English	3	1	6
13	Science	3	1	6
15	Social Studies	3	1	6
11	Social Studies	3	4	2
10	Science	3	4	2
9	English	3	4	2
8	Mathematics	3	4	2
14	Mathematics	3	1	6
6	Social Studies	3	3	5
7	Mathematics	3	3	5
5	Science	3	3	5
4	English	3	3	5
2	Mathematics	3	2	1
16	Social Studies	3	2	1
17	English	3	5	7
18	Mathematics	3	5	7
19	Social Studies	3	5	7
20	Science	3	5	7
\.


--
-- Data for Name: markssection_examtype; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_examtype (id, "examType", "minMarks", "maxMarks", priority, "examName_id") FROM stdin;
5	Theory	24	80	3	3
6	Theory	8	20	\N	1
2	Theory	24	80	1	4
1	Theory	8	20	3	2
7	Theory	33	100	1	5
8	Theory	3	10	\N	7
9	Theory	2	10	\N	8
10	Theory	33	100	\N	6
\.


--
-- Data for Name: markssection_marks; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_marks (id, subject, marks, "classroomStudent_id", "examType_id", "examName_id") FROM stdin;
2	Science	45	2	1	2
3	Science	48	3	1	2
5	Science	68	1	5	3
6	Social Studies	75	1	5	3
8	Mathematics	65	1	5	3
9	English	15	1	1	2
1	Science	14	1	1	2
4	Mathematics	19	1	5	2
10	Social Studies	16	1	1	2
11	English	70	1	2	4
12	Social Studies	68	1	2	4
15	English	15	1	6	1
16	Social Studies	18	1	6	1
17	Science	14	1	6	1
18	Mathematics	12	1	6	1
14	Mathematics	23	1	2	4
7	English	19	1	5	3
13	Science	11	1	2	4
20	English	45	2	7	5
21	English	54	3	7	5
19	English	56	1	7	5
22	Science	74	1	7	5
23	Social Studies	69	1	7	5
24	Mathematics	62	1	7	5
\.


--
-- Data for Name: newsletter_newsletter; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.newsletter_newsletter (id, description, date) FROM stdin;
93	<div align="center"><i><b>\r\n       \r\n      This is sample news for testing</b></i></div><div align="left"><a href="https://www.google.com/">https://www.google.com/</a><i><b>. </b></i>This is a sample link<i><b>. <br></b></i></div><div align="left"><ul><li><i>Testing</i></li><li><i>Testing 2</i></li><li><i>Testing 3<b><br></b></i></li></ul></div>	2019-12-25
\.


--
-- Data for Name: notice_classnotice; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.notice_classnotice (id, notice, notice_document, "classRoom_id") FROM stdin;
1	Notice	notice/6-A/pip_zHyqtqm.txt	3
2	Notice	notice/6-A/pip_XRcLwGo.txt	3
\.


--
-- Data for Name: notice_studentnotice; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.notice_studentnotice (id, notice, notice_document, student_id) FROM stdin;
1	Testing	notice/2231/pip.txt	1
\.


--
-- Data for Name: schoolinfo_schoolinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.schoolinfo_schoolinfo ("schoolName", addresss, "principalName", email, city, state, "zipCode", "schoolID", longitude, latitude, "contactNumber", "webSiteURL", img, logo) FROM stdin;
asasas	jkjkj	asas	gh@gmail.com	kkjk	jkjk	545	78787	78	989	8989898	kjkhk	schoolInfo/asasas/try_IDd1vvB.py	schoolInfo/asasas/Screenshot_from_2019-11-22_22-07-42_oN3gKuU.png
\.


--
-- Data for Name: transport_driver; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.transport_driver (employee_id, driver_name, dob, license_no, mobile_no, batch_no, contact_address, permanent_address, "driverPic", "driverLicense", "driverID", vehicle_id) FROM stdin;
899	Shubham Shahi	2019-12-30	1132323	5656566565	122	wewewe	wewewe	emp/899/Fee_Recipt.xlsx	emp/899/Fee_Recipt_FJUNrbk.xlsx	emp/899/Fee_Recipt_jjeUH89.xlsx	2
\.


--
-- Data for Name: transport_routes; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.transport_routes (route_code, start_place, end_place, shift_time, stoppage_names, stoppage_id, remarks, route_distance, longitude, lattitude, vehicle_id) FROM stdin;
123	Virar	Borivali	Morning	Vasai, Naigaon	1233	Remark	23	23.10	23.10	2
1	Delhi	Delhi	Evening	Anyplace	1	adsdsd	12	21.20	31.10	3
\.


--
-- Data for Name: transport_vehicle; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.transport_vehicle (id, vehicle_no, device_id, service_id, no_of_seat, maximum_allowed, vehicle_type, insurance_company, contact_person, insurance_date, permit_valid_date, pollution_cert_exp_date, fitness_service_date, service_date) FROM stdin;
2	1231	12321	123	23	23	Bus	Company	Ramesh	2019-12-31	2020-01-14	2020-02-05	2020-01-28	2020-01-28
3	686	2363	6532	45	40	Mini-Bus	Some Company	Sandeep	2020-01-19	2020-01-19	2020-01-19	2020-01-19	2020-01-19
\.


--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 12, true);


--
-- Name: attendence_studentattendence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.attendence_studentattendence_id_seq', 16, true);


--
-- Name: attendence_teacherattendence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.attendence_teacherattendence_id_seq', 5, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 224, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 13, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: classform_classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_classroom_id_seq', 6, true);


--
-- Name: classform_classroomstudent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_classroomstudent_id_seq', 8, true);


--
-- Name: classform_reportcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_reportcard_id_seq', 1, false);


--
-- Name: classform_studentrouteattendence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_studentrouteattendence_id_seq', 2, true);


--
-- Name: dailythought_thoughts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.dailythought_thoughts_id_seq', 19, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 274, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 56, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 86, true);


--
-- Name: fees_classsectionfees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_classsectionfees_id_seq', 4, true);


--
-- Name: fees_fee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_fee_id_seq', 6, true);


--
-- Name: fees_feecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_feecategory_id_seq', 3, true);


--
-- Name: fees_feecycle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_feecycle_id_seq', 1, true);


--
-- Name: fees_feediscount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_feediscount_id_seq', 15, true);


--
-- Name: fees_fine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_fine_id_seq', 2, true);


--
-- Name: holiday_holiday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.holiday_holiday_id_seq', 3, true);


--
-- Name: homework_homework_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.homework_homework_id_seq', 15, true);


--
-- Name: homework_syllabus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.homework_syllabus_id_seq', 1, false);


--
-- Name: markssection_additionalsubjectmapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_additionalsubjectmapping_id_seq', 3, true);


--
-- Name: markssection_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_exam_id_seq', 8, true);


--
-- Name: markssection_exammapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_exammapping_id_seq', 20, true);


--
-- Name: markssection_examtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_examtype_id_seq', 10, true);


--
-- Name: markssection_marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_marks_id_seq', 24, true);


--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.newsletter_newsletter_id_seq', 116, true);


--
-- Name: notice_classnotice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.notice_classnotice_id_seq', 2, true);


--
-- Name: notice_studentnotice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.notice_studentnotice_id_seq', 1, true);


--
-- Name: transport_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.transport_vehicle_id_seq', 3, true);


--
-- Name: accounts_userprofile accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: attendence_studentattendence attendence_studentattendence_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_studentattendence
    ADD CONSTRAINT attendence_studentattendence_pkey PRIMARY KEY (id);


--
-- Name: attendence_teacherattendence attendence_teacherattendence_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_teacherattendence
    ADD CONSTRAINT attendence_teacherattendence_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: classform_classroom classform_classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom
    ADD CONSTRAINT classform_classroom_pkey PRIMARY KEY (id);


--
-- Name: classform_classroom classform_classroom_teacher_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom
    ADD CONSTRAINT classform_classroom_teacher_id_key UNIQUE (teacher_id);


--
-- Name: classform_classroomstudent classform_classroomstudent_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT classform_classroomstudent_pkey PRIMARY KEY (id);


--
-- Name: classform_classroomstudent classform_classroomstudent_student_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT classform_classroomstudent_student_id_key UNIQUE (student_id);


--
-- Name: classform_reportcard classform_reportcard_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_reportcard
    ADD CONSTRAINT classform_reportcard_pkey PRIMARY KEY (id);


--
-- Name: classform_studentrouteattendence classform_studentrouteattendence_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_studentrouteattendence
    ADD CONSTRAINT classform_studentrouteattendence_pkey PRIMARY KEY (id);


--
-- Name: dailythought_thoughts dailythought_thoughts_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.dailythought_thoughts
    ADD CONSTRAINT dailythought_thoughts_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: employeeform_currentaddress employeeform_currentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_currentaddress
    ADD CONSTRAINT employeeform_currentaddress_pkey PRIMARY KEY (employee_id);


--
-- Name: employeeform_employee employeeform_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_employee
    ADD CONSTRAINT employeeform_employee_pkey PRIMARY KEY ("empID");


--
-- Name: employeeform_employeedocuments employeeform_employeedocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_employeedocuments
    ADD CONSTRAINT employeeform_employeedocuments_pkey PRIMARY KEY (employee_id);


--
-- Name: employeeform_permanentaddress employeeform_permanentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_permanentaddress
    ADD CONSTRAINT employeeform_permanentaddress_pkey PRIMARY KEY (employee_id);


--
-- Name: employeeform_teacher employeeform_teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_teacher
    ADD CONSTRAINT employeeform_teacher_pkey PRIMARY KEY (employee_id);


--
-- Name: fees_classsectionfees fees_classsectionfees_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees
    ADD CONSTRAINT fees_classsectionfees_pkey PRIMARY KEY (id);


--
-- Name: fees_fee fees_fee_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee
    ADD CONSTRAINT fees_fee_pkey PRIMARY KEY (id);


--
-- Name: fees_feecategory fees_feecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecategory
    ADD CONSTRAINT fees_feecategory_pkey PRIMARY KEY (id);


--
-- Name: fees_feecycle fees_feecycle_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecycle
    ADD CONSTRAINT fees_feecycle_pkey PRIMARY KEY (id);


--
-- Name: fees_feediscount fees_feediscount_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feediscount
    ADD CONSTRAINT fees_feediscount_pkey PRIMARY KEY (id);


--
-- Name: fees_fine fees_fine_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fine
    ADD CONSTRAINT fees_fine_pkey PRIMARY KEY (id);


--
-- Name: form_currentaddress form_currentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_currentaddress
    ADD CONSTRAINT form_currentaddress_pkey PRIMARY KEY (student_id);


--
-- Name: form_documents form_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_documents
    ADD CONSTRAINT form_documents_pkey PRIMARY KEY (student_id);


--
-- Name: form_parentinfo form_parentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_parentinfo
    ADD CONSTRAINT form_parentinfo_pkey PRIMARY KEY (student_id);


--
-- Name: form_permanentaddress form_permanentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_permanentaddress
    ADD CONSTRAINT form_permanentaddress_pkey PRIMARY KEY (student_id);


--
-- Name: form_studentinfo form_studentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_studentinfo
    ADD CONSTRAINT form_studentinfo_pkey PRIMARY KEY ("admissionNumber");


--
-- Name: form_studentroute form_studentroute_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_studentroute
    ADD CONSTRAINT form_studentroute_pkey PRIMARY KEY (student_id);


--
-- Name: holiday_holiday holiday_holiday_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.holiday_holiday
    ADD CONSTRAINT holiday_holiday_pkey PRIMARY KEY (id);


--
-- Name: homework_homework homework_homework_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_homework
    ADD CONSTRAINT homework_homework_pkey PRIMARY KEY (id);


--
-- Name: homework_syllabus homework_syllabus_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_syllabus
    ADD CONSTRAINT homework_syllabus_pkey PRIMARY KEY (id);


--
-- Name: markssection_additionalsubjectmapping markssection_additionalsubjectmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT markssection_additionalsubjectmapping_pkey PRIMARY KEY (id);


--
-- Name: markssection_exam markssection_exam_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exam
    ADD CONSTRAINT markssection_exam_pkey PRIMARY KEY (id);


--
-- Name: markssection_exammapping markssection_exammapping_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT markssection_exammapping_pkey PRIMARY KEY (id);


--
-- Name: markssection_examtype markssection_examtype_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_examtype
    ADD CONSTRAINT markssection_examtype_pkey PRIMARY KEY (id);


--
-- Name: markssection_marks markssection_marks_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT markssection_marks_pkey PRIMARY KEY (id);


--
-- Name: newsletter_newsletter newsletter_newsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.newsletter_newsletter
    ADD CONSTRAINT newsletter_newsletter_pkey PRIMARY KEY (id);


--
-- Name: notice_classnotice notice_classnotice_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_classnotice
    ADD CONSTRAINT notice_classnotice_pkey PRIMARY KEY (id);


--
-- Name: notice_studentnotice notice_studentnotice_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_studentnotice
    ADD CONSTRAINT notice_studentnotice_pkey PRIMARY KEY (id);


--
-- Name: schoolinfo_schoolinfo schoolinfo_schoolinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.schoolinfo_schoolinfo
    ADD CONSTRAINT schoolinfo_schoolinfo_pkey PRIMARY KEY ("schoolID");


--
-- Name: transport_driver transport_driver_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_driver
    ADD CONSTRAINT transport_driver_pkey PRIMARY KEY (employee_id);


--
-- Name: transport_routes transport_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_routes
    ADD CONSTRAINT transport_routes_pkey PRIMARY KEY (stoppage_id);


--
-- Name: transport_vehicle transport_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_vehicle
    ADD CONSTRAINT transport_vehicle_pkey PRIMARY KEY (id);


--
-- Name: attendence_studentattendence_student_id_3f6e948f; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX attendence_studentattendence_student_id_3f6e948f ON public.attendence_studentattendence USING btree (student_id);


--
-- Name: attendence_teacherattendence_teacher_id_3478c5fb; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX attendence_teacherattendence_teacher_id_3478c5fb ON public.attendence_teacherattendence USING btree (teacher_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: classform_classroomstudent_classRoom_id_f067618b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "classform_classroomstudent_classRoom_id_f067618b" ON public.classform_classroomstudent USING btree ("classRoom_id");


--
-- Name: classform_reportcard_class_room_student_id_08f4446a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX classform_reportcard_class_room_student_id_08f4446a ON public.classform_reportcard USING btree (class_room_student_id);


--
-- Name: classform_studentrouteattendence_student_id_a60d2530; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX classform_studentrouteattendence_student_id_a60d2530 ON public.classform_studentrouteattendence USING btree (student_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fees_classsectionfees_classSection_id_a29d9f99; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "fees_classsectionfees_classSection_id_a29d9f99" ON public.fees_classsectionfees USING btree ("classSection_id");


--
-- Name: fees_classsectionfees_feeCategory_id_0f8cfa84; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "fees_classsectionfees_feeCategory_id_0f8cfa84" ON public.fees_classsectionfees USING btree ("feeCategory_id");


--
-- Name: fees_fee_classSection_id_7c0b3dc5; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "fees_fee_classSection_id_7c0b3dc5" ON public.fees_fee USING btree ("classSection_id");


--
-- Name: fees_fee_student_id_664ca066; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX fees_fee_student_id_664ca066 ON public.fees_fee USING btree (student_id);


--
-- Name: fees_feediscount_student_id_d0d7a89a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX fees_feediscount_student_id_d0d7a89a ON public.fees_feediscount USING btree (student_id);


--
-- Name: fees_fine_student_id_bb221b6a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX fees_fine_student_id_bb221b6a ON public.fees_fine USING btree (student_id);


--
-- Name: homework_homework_classRoom_id_eec0049c; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "homework_homework_classRoom_id_eec0049c" ON public.homework_homework USING btree ("classRoom_id");


--
-- Name: homework_syllabus_classRoom_id_f958b607; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "homework_syllabus_classRoom_id_f958b607" ON public.homework_syllabus USING btree ("classRoom_id");


--
-- Name: markssection_additionalsub_classroomStudent_id_ea5fd49a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_additionalsub_classroomStudent_id_ea5fd49a" ON public.markssection_additionalsubjectmapping USING btree ("classroomStudent_id");


--
-- Name: markssection_additionalsubjectmapping_examName_id_03059aa6; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_additionalsubjectmapping_examName_id_03059aa6" ON public.markssection_additionalsubjectmapping USING btree ("examName_id");


--
-- Name: markssection_additionalsubjectmapping_examType_id_9bff92ac; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_additionalsubjectmapping_examType_id_9bff92ac" ON public.markssection_additionalsubjectmapping USING btree ("examType_id");


--
-- Name: markssection_exammapping_classroom_id_926ae5dd; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX markssection_exammapping_classroom_id_926ae5dd ON public.markssection_exammapping USING btree (classroom_id);


--
-- Name: markssection_exammapping_examName_id_1828a436; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_exammapping_examName_id_1828a436" ON public.markssection_exammapping USING btree ("examName_id");


--
-- Name: markssection_exammapping_examType_id_e9df93e5; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_exammapping_examType_id_e9df93e5" ON public.markssection_exammapping USING btree ("examType_id");


--
-- Name: markssection_examtype_examName_id_39dd8ebe; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_examtype_examName_id_39dd8ebe" ON public.markssection_examtype USING btree ("examName_id");


--
-- Name: markssection_marks_classroomStudent_id_969d9022; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_marks_classroomStudent_id_969d9022" ON public.markssection_marks USING btree ("classroomStudent_id");


--
-- Name: markssection_marks_examName_id_9a0c8aa8; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_marks_examName_id_9a0c8aa8" ON public.markssection_marks USING btree ("examName_id");


--
-- Name: markssection_marks_examType_id_b678d74e; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_marks_examType_id_b678d74e" ON public.markssection_marks USING btree ("examType_id");


--
-- Name: notice_classnotice_classRoom_id_c977d857; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "notice_classnotice_classRoom_id_c977d857" ON public.notice_classnotice USING btree ("classRoom_id");


--
-- Name: notice_studentnotice_student_id_6137d249; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX notice_studentnotice_student_id_6137d249 ON public.notice_studentnotice USING btree (student_id);


--
-- Name: transport_driver_vehicle_id_e59a43bd; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX transport_driver_vehicle_id_e59a43bd ON public.transport_driver USING btree (vehicle_id);


--
-- Name: transport_routes_vehicle_id_1e85b02c; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX transport_routes_vehicle_id_1e85b02c ON public.transport_routes USING btree (vehicle_id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_92240672_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attendence_studentattendence attendence_studentat_student_id_3f6e948f_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_studentattendence
    ADD CONSTRAINT attendence_studentat_student_id_3f6e948f_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attendence_teacherattendence attendence_teacherat_teacher_id_3478c5fb_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_teacherattendence
    ADD CONSTRAINT attendence_teacherat_teacher_id_3478c5fb_fk_employeef FOREIGN KEY (teacher_id) REFERENCES public.employeeform_teacher(employee_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_classroom classform_classroom_teacher_id_38184a16_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom
    ADD CONSTRAINT classform_classroom_teacher_id_38184a16_fk_employeef FOREIGN KEY (teacher_id) REFERENCES public.employeeform_teacher(employee_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_classroomstudent classform_classrooms_classRoom_id_f067618b_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT "classform_classrooms_classRoom_id_f067618b_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_classroomstudent classform_classrooms_student_id_7965796d_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT classform_classrooms_student_id_7965796d_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_reportcard classform_reportcard_class_room_student_i_08f4446a_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_reportcard
    ADD CONSTRAINT classform_reportcard_class_room_student_i_08f4446a_fk_classform FOREIGN KEY (class_room_student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_studentrouteattendence classform_studentrou_student_id_a60d2530_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_studentrouteattendence
    ADD CONSTRAINT classform_studentrou_student_id_a60d2530_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_currentaddress employeeform_current_employee_id_191a1e2b_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_currentaddress
    ADD CONSTRAINT employeeform_current_employee_id_191a1e2b_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_employeedocuments employeeform_employe_employee_id_f234cb72_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_employeedocuments
    ADD CONSTRAINT employeeform_employe_employee_id_f234cb72_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_permanentaddress employeeform_permane_employee_id_e69075c3_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_permanentaddress
    ADD CONSTRAINT employeeform_permane_employee_id_e69075c3_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_teacher employeeform_teacher_employee_id_0c159000_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_teacher
    ADD CONSTRAINT employeeform_teacher_employee_id_0c159000_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_classsectionfees fees_classsectionfee_classSection_id_a29d9f99_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees
    ADD CONSTRAINT "fees_classsectionfee_classSection_id_a29d9f99_fk_classform" FOREIGN KEY ("classSection_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_classsectionfees fees_classsectionfee_feeCategory_id_0f8cfa84_fk_fees_feec; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees
    ADD CONSTRAINT "fees_classsectionfee_feeCategory_id_0f8cfa84_fk_fees_feec" FOREIGN KEY ("feeCategory_id") REFERENCES public.fees_feecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_fee fees_fee_classSection_id_7c0b3dc5_fk_classform_classroom_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee
    ADD CONSTRAINT "fees_fee_classSection_id_7c0b3dc5_fk_classform_classroom_id" FOREIGN KEY ("classSection_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_fee fees_fee_student_id_664ca066_fk_classform_classroomstudent_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee
    ADD CONSTRAINT fees_fee_student_id_664ca066_fk_classform_classroomstudent_id FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_feediscount fees_feediscount_student_id_d0d7a89a_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feediscount
    ADD CONSTRAINT fees_feediscount_student_id_d0d7a89a_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_fine fees_fine_student_id_bb221b6a_fk_classform_classroomstudent_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fine
    ADD CONSTRAINT fees_fine_student_id_bb221b6a_fk_classform_classroomstudent_id FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_currentaddress form_currentaddress_student_id_3af6431c_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_currentaddress
    ADD CONSTRAINT form_currentaddress_student_id_3af6431c_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_documents form_documents_student_id_34de472a_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_documents
    ADD CONSTRAINT form_documents_student_id_34de472a_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_parentinfo form_parentinfo_student_id_0ab3a289_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_parentinfo
    ADD CONSTRAINT form_parentinfo_student_id_0ab3a289_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_permanentaddress form_permanentaddres_student_id_598730f4_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_permanentaddress
    ADD CONSTRAINT form_permanentaddres_student_id_598730f4_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_studentroute form_studentroute_student_id_8ad881cb_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_studentroute
    ADD CONSTRAINT form_studentroute_student_id_8ad881cb_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homework_homework homework_homework_classRoom_id_eec0049c_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_homework
    ADD CONSTRAINT "homework_homework_classRoom_id_eec0049c_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homework_syllabus homework_syllabus_classRoom_id_f958b607_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_syllabus
    ADD CONSTRAINT "homework_syllabus_classRoom_id_f958b607_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_additionalsubjectmapping markssection_additio_classroomStudent_id_ea5fd49a_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT "markssection_additio_classroomStudent_id_ea5fd49a_fk_classform" FOREIGN KEY ("classroomStudent_id") REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_additionalsubjectmapping markssection_additio_examName_id_03059aa6_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT "markssection_additio_examName_id_03059aa6_fk_markssect" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_additionalsubjectmapping markssection_additio_examType_id_9bff92ac_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT "markssection_additio_examType_id_9bff92ac_fk_markssect" FOREIGN KEY ("examType_id") REFERENCES public.markssection_examtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_exammapping markssection_exammap_classroom_id_926ae5dd_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT markssection_exammap_classroom_id_926ae5dd_fk_classform FOREIGN KEY (classroom_id) REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_exammapping markssection_exammap_examName_id_1828a436_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT "markssection_exammap_examName_id_1828a436_fk_markssect" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_exammapping markssection_exammap_examType_id_e9df93e5_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT "markssection_exammap_examType_id_e9df93e5_fk_markssect" FOREIGN KEY ("examType_id") REFERENCES public.markssection_examtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_examtype markssection_examtyp_examName_id_39dd8ebe_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_examtype
    ADD CONSTRAINT "markssection_examtyp_examName_id_39dd8ebe_fk_markssect" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_marks markssection_marks_classroomStudent_id_969d9022_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT "markssection_marks_classroomStudent_id_969d9022_fk_classform" FOREIGN KEY ("classroomStudent_id") REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_marks markssection_marks_examName_id_9a0c8aa8_fk_markssection_exam_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT "markssection_marks_examName_id_9a0c8aa8_fk_markssection_exam_id" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_marks markssection_marks_examType_id_b678d74e_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT "markssection_marks_examType_id_b678d74e_fk_markssect" FOREIGN KEY ("examType_id") REFERENCES public.markssection_examtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notice_classnotice notice_classnotice_classRoom_id_c977d857_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_classnotice
    ADD CONSTRAINT "notice_classnotice_classRoom_id_c977d857_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notice_studentnotice notice_studentnotice_student_id_6137d249_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_studentnotice
    ADD CONSTRAINT notice_studentnotice_student_id_6137d249_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: transport_driver transport_driver_employee_id_c69d8019_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_driver
    ADD CONSTRAINT transport_driver_employee_id_c69d8019_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: transport_driver transport_driver_vehicle_id_e59a43bd_fk_transport_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_driver
    ADD CONSTRAINT transport_driver_vehicle_id_e59a43bd_fk_transport_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.transport_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: transport_routes transport_routes_vehicle_id_1e85b02c_fk_transport_vehicle_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_routes
    ADD CONSTRAINT transport_routes_vehicle_id_1e85b02c_fk_transport_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES public.transport_vehicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.accounts_userprofile (
    id integer NOT NULL,
    user_type character varying(20) NOT NULL,
    mobile_no bigint NOT NULL,
    user_id integer NOT NULL,
    image character varying(100) NOT NULL,
    "fullName" character varying(50) NOT NULL,
    addmission_number bigint NOT NULL,
    emp_id bigint NOT NULL
);


ALTER TABLE public.accounts_userprofile OWNER TO myprojectuser;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.accounts_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO myprojectuser;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.accounts_userprofile_id_seq OWNED BY public.accounts_userprofile.id;


--
-- Name: attendence_studentattendence; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.attendence_studentattendence (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    date date NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.attendence_studentattendence OWNER TO myprojectuser;

--
-- Name: attendence_studentattendence_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.attendence_studentattendence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendence_studentattendence_id_seq OWNER TO myprojectuser;

--
-- Name: attendence_studentattendence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.attendence_studentattendence_id_seq OWNED BY public.attendence_studentattendence.id;


--
-- Name: attendence_teacherattendence; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.attendence_teacherattendence (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    date date NOT NULL,
    teacher_id integer NOT NULL,
    available_casual_leave integer NOT NULL,
    available_sick_leave integer NOT NULL,
    taken_casual_leave integer NOT NULL,
    taken_sick_leave integer NOT NULL,
    total_no_of_days_present integer NOT NULL
);


ALTER TABLE public.attendence_teacherattendence OWNER TO myprojectuser;

--
-- Name: attendence_teacherattendence_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.attendence_teacherattendence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendence_teacherattendence_id_seq OWNER TO myprojectuser;

--
-- Name: attendence_teacherattendence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.attendence_teacherattendence_id_seq OWNED BY public.attendence_teacherattendence.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO myprojectuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO myprojectuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO myprojectuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO myprojectuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO myprojectuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO myprojectuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: myprojectuser
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


ALTER TABLE public.auth_user OWNER TO myprojectuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO myprojectuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO myprojectuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: classform_classroom; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_classroom (
    id integer NOT NULL,
    "classSection" character varying(50) NOT NULL,
    teacher_id integer NOT NULL
);


ALTER TABLE public.classform_classroom OWNER TO myprojectuser;

--
-- Name: classform_classroom_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_classroom_id_seq OWNER TO myprojectuser;

--
-- Name: classform_classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_classroom_id_seq OWNED BY public.classform_classroom.id;


--
-- Name: classform_classroomstudent; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_classroomstudent (
    id integer NOT NULL,
    roll_number integer NOT NULL,
    "classRoom_id" integer NOT NULL,
    student_id bigint NOT NULL
);


ALTER TABLE public.classform_classroomstudent OWNER TO myprojectuser;

--
-- Name: classform_classroomstudent_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_classroomstudent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_classroomstudent_id_seq OWNER TO myprojectuser;

--
-- Name: classform_classroomstudent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_classroomstudent_id_seq OWNED BY public.classform_classroomstudent.id;


--
-- Name: classform_reportcard; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_reportcard (
    id integer NOT NULL,
    "reportCard" character varying(100) NOT NULL,
    class_room_student_id integer NOT NULL
);


ALTER TABLE public.classform_reportcard OWNER TO myprojectuser;

--
-- Name: classform_reportcard_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_reportcard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_reportcard_id_seq OWNER TO myprojectuser;

--
-- Name: classform_reportcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_reportcard_id_seq OWNED BY public.classform_reportcard.id;


--
-- Name: classform_studentrouteattendence; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.classform_studentrouteattendence (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    date date NOT NULL,
    "time" timestamp with time zone NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.classform_studentrouteattendence OWNER TO myprojectuser;

--
-- Name: classform_studentrouteattendence_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.classform_studentrouteattendence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classform_studentrouteattendence_id_seq OWNER TO myprojectuser;

--
-- Name: classform_studentrouteattendence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.classform_studentrouteattendence_id_seq OWNED BY public.classform_studentrouteattendence.id;


--
-- Name: dailythought_thoughts; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.dailythought_thoughts (
    id integer NOT NULL,
    thought text NOT NULL,
    "timestamp" date NOT NULL
);


ALTER TABLE public.dailythought_thoughts OWNER TO myprojectuser;

--
-- Name: dailythought_thoughts_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.dailythought_thoughts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dailythought_thoughts_id_seq OWNER TO myprojectuser;

--
-- Name: dailythought_thoughts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.dailythought_thoughts_id_seq OWNED BY public.dailythought_thoughts.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: myprojectuser
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


ALTER TABLE public.django_admin_log OWNER TO myprojectuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO myprojectuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO myprojectuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO myprojectuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO myprojectuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO myprojectuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO myprojectuser;

--
-- Name: employeeform_currentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_currentaddress (
    employee_id integer NOT NULL,
    "Address" character varying(100) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL,
    "zipCode" bigint NOT NULL,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL
);


ALTER TABLE public.employeeform_currentaddress OWNER TO myprojectuser;

--
-- Name: employeeform_employee; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_employee (
    "empID" integer NOT NULL,
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    "fullName" character varying(50) NOT NULL,
    father_name character varying(50) NOT NULL,
    mother_name character varying(50) NOT NULL,
    "partnerName" character varying(50) NOT NULL,
    gender character varying(20) NOT NULL,
    email character varying(40) NOT NULL,
    "currentAddress" character varying(100) NOT NULL,
    "permanentAddress" character varying(100) NOT NULL,
    dob date,
    "joiningDate" date,
    "bloodGroup" character varying(20) NOT NULL,
    mobile_number bigint NOT NULL,
    marital_status character varying(20) NOT NULL,
    experience character varying(20) NOT NULL,
    "aadharNumber" bigint NOT NULL,
    "empCategory" character varying(20) NOT NULL
);


ALTER TABLE public.employeeform_employee OWNER TO myprojectuser;

--
-- Name: employeeform_employeedocuments; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_employeedocuments (
    employee_id integer NOT NULL,
    photo character varying(100) NOT NULL,
    "qualificationDoc" character varying(100) NOT NULL,
    "IdProof" character varying(100) NOT NULL,
    "addressProof" character varying(100) NOT NULL,
    "otherDoc" character varying(100) NOT NULL
);


ALTER TABLE public.employeeform_employeedocuments OWNER TO myprojectuser;

--
-- Name: employeeform_permanentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_permanentaddress (
    employee_id integer NOT NULL,
    "Address" character varying(100) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL,
    "zipCode" bigint NOT NULL,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL
);


ALTER TABLE public.employeeform_permanentaddress OWNER TO myprojectuser;

--
-- Name: employeeform_teacher; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.employeeform_teacher (
    employee_id integer NOT NULL,
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    "fullName" character varying(50) NOT NULL,
    specialization character varying(50) NOT NULL,
    designation character varying(50) NOT NULL,
    "classTeacher" character varying(50) NOT NULL
);


ALTER TABLE public.employeeform_teacher OWNER TO myprojectuser;

--
-- Name: fees_classsectionfees; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_classsectionfees (
    id integer NOT NULL,
    fees integer NOT NULL,
    "classSection_id" integer NOT NULL,
    "feeCategory_id" integer NOT NULL
);


ALTER TABLE public.fees_classsectionfees OWNER TO myprojectuser;

--
-- Name: fees_classsectionfees_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_classsectionfees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_classsectionfees_id_seq OWNER TO myprojectuser;

--
-- Name: fees_classsectionfees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_classsectionfees_id_seq OWNED BY public.fees_classsectionfees.id;


--
-- Name: fees_fee; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_fee (
    id integer NOT NULL,
    "regNo" integer NOT NULL,
    payment_method character varying(50) NOT NULL,
    "submissionDate" date NOT NULL,
    "monthsPaid" character varying(50) NOT NULL,
    "classSection_id" integer NOT NULL,
    student_id integer NOT NULL,
    amount integer NOT NULL,
    "feeSlip" character varying(100) NOT NULL
);


ALTER TABLE public.fees_fee OWNER TO myprojectuser;

--
-- Name: fees_fee_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_fee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_fee_id_seq OWNER TO myprojectuser;

--
-- Name: fees_fee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_fee_id_seq OWNED BY public.fees_fee.id;


--
-- Name: fees_feecategory; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_feecategory (
    id integer NOT NULL,
    once boolean NOT NULL,
    submission_type character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.fees_feecategory OWNER TO myprojectuser;

--
-- Name: fees_feecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_feecategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_feecategory_id_seq OWNER TO myprojectuser;

--
-- Name: fees_feecategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_feecategory_id_seq OWNED BY public.fees_feecategory.id;


--
-- Name: fees_feecycle; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_feecycle (
    id integer NOT NULL,
    "lastSubmissionDate" date NOT NULL,
    "firstSubmissionDate" date NOT NULL,
    cycle character varying(50) NOT NULL
);


ALTER TABLE public.fees_feecycle OWNER TO myprojectuser;

--
-- Name: fees_feecycle_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_feecycle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_feecycle_id_seq OWNER TO myprojectuser;

--
-- Name: fees_feecycle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_feecycle_id_seq OWNED BY public.fees_feecycle.id;


--
-- Name: fees_feediscount; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_feediscount (
    id integer NOT NULL,
    discount integer NOT NULL,
    category character varying(50) NOT NULL,
    description text NOT NULL,
    total_off integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.fees_feediscount OWNER TO myprojectuser;

--
-- Name: fees_feediscount_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_feediscount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_feediscount_id_seq OWNER TO myprojectuser;

--
-- Name: fees_feediscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_feediscount_id_seq OWNED BY public.fees_feediscount.id;


--
-- Name: fees_fine; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.fees_fine (
    id integer NOT NULL,
    fine integer NOT NULL,
    category character varying(100) NOT NULL,
    description text NOT NULL,
    student_id integer NOT NULL,
    "submissionDate" date NOT NULL
);


ALTER TABLE public.fees_fine OWNER TO myprojectuser;

--
-- Name: fees_fine_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.fees_fine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_fine_id_seq OWNER TO myprojectuser;

--
-- Name: fees_fine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.fees_fine_id_seq OWNED BY public.fees_fine.id;


--
-- Name: form_currentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_currentaddress (
    student_id bigint NOT NULL,
    "Address" character varying(100) NOT NULL,
    "zipCode" bigint,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL
);


ALTER TABLE public.form_currentaddress OWNER TO myprojectuser;

--
-- Name: form_documents; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_documents (
    student_id bigint NOT NULL,
    photo character varying(100) NOT NULL,
    "idProof" character varying(100) NOT NULL,
    "castCertificate" character varying(100) NOT NULL,
    domicile character varying(100) NOT NULL,
    tc character varying(100) NOT NULL,
    "characterCertificate" character varying(100) NOT NULL
);


ALTER TABLE public.form_documents OWNER TO myprojectuser;

--
-- Name: form_parentinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_parentinfo (
    student_id bigint NOT NULL,
    "fatherName" character varying(20) NOT NULL,
    "motherName" character varying(20) NOT NULL,
    "Fatherdob" date,
    "Motherdob" date,
    "MobileNumber" bigint,
    "altMobileNumber" bigint,
    "gaurdianQual" character varying(30) NOT NULL,
    "guardianOccup" character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    "motherQual" character varying(30) NOT NULL,
    "motherOccup" character varying(20) NOT NULL
);


ALTER TABLE public.form_parentinfo OWNER TO myprojectuser;

--
-- Name: form_permanentaddress; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_permanentaddress (
    student_id bigint NOT NULL,
    "Address" character varying(100) NOT NULL,
    "zipCode" bigint,
    state character varying(20) NOT NULL,
    city character varying(20) NOT NULL,
    "Address1" character varying(100) NOT NULL,
    "Address2" character varying(100) NOT NULL
);


ALTER TABLE public.form_permanentaddress OWNER TO myprojectuser;

--
-- Name: form_studentinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_studentinfo (
    "firstName" character varying(20) NOT NULL,
    "lastName" character varying(20) NOT NULL,
    gender character varying(20) NOT NULL,
    dob date,
    "classSection" character varying(20) NOT NULL,
    "admissionNumber" bigint NOT NULL,
    "mobileNumber" bigint,
    religion character varying(20) NOT NULL,
    caste character varying(20) NOT NULL,
    "tcNumber" bigint,
    "aadharNumber" bigint,
    "feeWaiverCategory" character varying(20) NOT NULL,
    "siblingID" bigint,
    "prevSchoolName" character varying(20) NOT NULL,
    "fullName" character varying(50) NOT NULL
);


ALTER TABLE public.form_studentinfo OWNER TO myprojectuser;

--
-- Name: form_studentroute; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.form_studentroute (
    student_id bigint NOT NULL,
    route_code bigint NOT NULL,
    route_stoppage character varying(30) NOT NULL,
    shift character varying(30) NOT NULL
);


ALTER TABLE public.form_studentroute OWNER TO myprojectuser;

--
-- Name: gallery_album; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.gallery_album (
    id integer NOT NULL,
    album_name character varying(30) NOT NULL,
    file character varying(100) NOT NULL
);


ALTER TABLE public.gallery_album OWNER TO myprojectuser;

--
-- Name: gallery_album_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.gallery_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gallery_album_id_seq OWNER TO myprojectuser;

--
-- Name: gallery_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.gallery_album_id_seq OWNED BY public.gallery_album.id;


--
-- Name: gallery_photo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.gallery_photo (
    id integer NOT NULL,
    photo_name character varying(30) NOT NULL,
    file character varying(100) NOT NULL
);


ALTER TABLE public.gallery_photo OWNER TO myprojectuser;

--
-- Name: gallery_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.gallery_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gallery_photo_id_seq OWNER TO myprojectuser;

--
-- Name: gallery_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.gallery_photo_id_seq OWNED BY public.gallery_photo.id;


--
-- Name: gallery_video; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.gallery_video (
    id integer NOT NULL,
    video_name character varying(30) NOT NULL,
    file character varying(100) NOT NULL
);


ALTER TABLE public.gallery_video OWNER TO myprojectuser;

--
-- Name: gallery_video_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.gallery_video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gallery_video_id_seq OWNER TO myprojectuser;

--
-- Name: gallery_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.gallery_video_id_seq OWNED BY public.gallery_video.id;


--
-- Name: holiday_holiday; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.holiday_holiday (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL
);


ALTER TABLE public.holiday_holiday OWNER TO myprojectuser;

--
-- Name: holiday_holiday_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.holiday_holiday_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.holiday_holiday_id_seq OWNER TO myprojectuser;

--
-- Name: holiday_holiday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.holiday_holiday_id_seq OWNED BY public.holiday_holiday.id;


--
-- Name: homework_homework; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.homework_homework (
    id integer NOT NULL,
    description text NOT NULL,
    subject character varying(100) NOT NULL,
    document character varying(100) NOT NULL,
    date_published date NOT NULL,
    "classRoom_id" integer NOT NULL
);


ALTER TABLE public.homework_homework OWNER TO myprojectuser;

--
-- Name: homework_homework_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.homework_homework_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homework_homework_id_seq OWNER TO myprojectuser;

--
-- Name: homework_homework_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.homework_homework_id_seq OWNED BY public.homework_homework.id;


--
-- Name: homework_syllabus; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.homework_syllabus (
    id integer NOT NULL,
    description text NOT NULL,
    document character varying(100) NOT NULL,
    date_published date NOT NULL,
    "classRoom_id" integer NOT NULL
);


ALTER TABLE public.homework_syllabus OWNER TO myprojectuser;

--
-- Name: homework_syllabus_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.homework_syllabus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homework_syllabus_id_seq OWNER TO myprojectuser;

--
-- Name: homework_syllabus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.homework_syllabus_id_seq OWNED BY public.homework_syllabus.id;


--
-- Name: leave_employeeleave; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.leave_employeeleave (
    id integer NOT NULL,
    description text NOT NULL,
    subject character varying(20) NOT NULL,
    date_from date NOT NULL,
    date_to date NOT NULL,
    employee_id integer NOT NULL,
    approved boolean NOT NULL,
    rejected boolean NOT NULL
);


ALTER TABLE public.leave_employeeleave OWNER TO myprojectuser;

--
-- Name: leave_employeeleave_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.leave_employeeleave_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_employeeleave_id_seq OWNER TO myprojectuser;

--
-- Name: leave_employeeleave_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.leave_employeeleave_id_seq OWNED BY public.leave_employeeleave.id;


--
-- Name: leave_studentleave; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.leave_studentleave (
    id integer NOT NULL,
    description text NOT NULL,
    subject character varying(20) NOT NULL,
    date_from date NOT NULL,
    date_to date NOT NULL,
    student_id bigint NOT NULL,
    approved boolean NOT NULL,
    rejected boolean NOT NULL
);


ALTER TABLE public.leave_studentleave OWNER TO myprojectuser;

--
-- Name: leave_studentleave_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.leave_studentleave_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_studentleave_id_seq OWNER TO myprojectuser;

--
-- Name: leave_studentleave_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.leave_studentleave_id_seq OWNED BY public.leave_studentleave.id;


--
-- Name: markssection_additionalsubjectmapping; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_additionalsubjectmapping (
    id integer NOT NULL,
    subject character varying(50) NOT NULL,
    marks integer,
    "classroomStudent_id" integer NOT NULL,
    "examName_id" integer NOT NULL,
    "examType_id" integer NOT NULL
);


ALTER TABLE public.markssection_additionalsubjectmapping OWNER TO myprojectuser;

--
-- Name: markssection_additionalsubjectmapping_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_additionalsubjectmapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_additionalsubjectmapping_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_additionalsubjectmapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_additionalsubjectmapping_id_seq OWNED BY public.markssection_additionalsubjectmapping.id;


--
-- Name: markssection_exam; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_exam (
    id integer NOT NULL,
    "examName" character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.markssection_exam OWNER TO myprojectuser;

--
-- Name: markssection_exam_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_exam_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_exam_id_seq OWNED BY public.markssection_exam.id;


--
-- Name: markssection_exammapping; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_exammapping (
    id integer NOT NULL,
    subject character varying(100) NOT NULL,
    classroom_id integer NOT NULL,
    "examName_id" integer NOT NULL,
    "examType_id" integer NOT NULL
);


ALTER TABLE public.markssection_exammapping OWNER TO myprojectuser;

--
-- Name: markssection_exammapping_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_exammapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_exammapping_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_exammapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_exammapping_id_seq OWNED BY public.markssection_exammapping.id;


--
-- Name: markssection_examtype; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_examtype (
    id integer NOT NULL,
    "examType" character varying(50) NOT NULL,
    "minMarks" integer NOT NULL,
    "maxMarks" integer NOT NULL,
    priority integer,
    "examName_id" integer NOT NULL
);


ALTER TABLE public.markssection_examtype OWNER TO myprojectuser;

--
-- Name: markssection_examtype_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_examtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_examtype_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_examtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_examtype_id_seq OWNED BY public.markssection_examtype.id;


--
-- Name: markssection_marks; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.markssection_marks (
    id integer NOT NULL,
    subject character varying(50) NOT NULL,
    marks integer NOT NULL,
    "classroomStudent_id" integer NOT NULL,
    "examType_id" integer NOT NULL,
    "examName_id" integer NOT NULL
);


ALTER TABLE public.markssection_marks OWNER TO myprojectuser;

--
-- Name: markssection_marks_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.markssection_marks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markssection_marks_id_seq OWNER TO myprojectuser;

--
-- Name: markssection_marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.markssection_marks_id_seq OWNED BY public.markssection_marks.id;


--
-- Name: newsletter_newsletter; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.newsletter_newsletter (
    id integer NOT NULL,
    description text,
    date date NOT NULL
);


ALTER TABLE public.newsletter_newsletter OWNER TO myprojectuser;

--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.newsletter_newsletter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsletter_newsletter_id_seq OWNER TO myprojectuser;

--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.newsletter_newsletter_id_seq OWNED BY public.newsletter_newsletter.id;


--
-- Name: notice_classnotice; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.notice_classnotice (
    id integer NOT NULL,
    notice text NOT NULL,
    notice_document character varying(100) NOT NULL,
    "classRoom_id" integer NOT NULL
);


ALTER TABLE public.notice_classnotice OWNER TO myprojectuser;

--
-- Name: notice_classnotice_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.notice_classnotice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_classnotice_id_seq OWNER TO myprojectuser;

--
-- Name: notice_classnotice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.notice_classnotice_id_seq OWNED BY public.notice_classnotice.id;


--
-- Name: notice_studentnotice; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.notice_studentnotice (
    id integer NOT NULL,
    notice text NOT NULL,
    notice_document character varying(100) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.notice_studentnotice OWNER TO myprojectuser;

--
-- Name: notice_studentnotice_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.notice_studentnotice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_studentnotice_id_seq OWNER TO myprojectuser;

--
-- Name: notice_studentnotice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.notice_studentnotice_id_seq OWNED BY public.notice_studentnotice.id;


--
-- Name: schoolinfo_schoolinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.schoolinfo_schoolinfo (
    "schoolName" character varying(100) NOT NULL,
    addresss character varying(100) NOT NULL,
    "principalName" character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    "zipCode" integer NOT NULL,
    "schoolID" integer NOT NULL,
    longitude integer NOT NULL,
    latitude integer NOT NULL,
    "contactNumber" integer NOT NULL,
    "webSiteURL" character varying(100) NOT NULL,
    img character varying(100) NOT NULL,
    logo character varying(100) NOT NULL
);


ALTER TABLE public.schoolinfo_schoolinfo OWNER TO myprojectuser;

--
-- Name: transport_driver; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.transport_driver (
    employee_id integer NOT NULL,
    driver_name character varying(30) NOT NULL,
    dob date,
    license_no bigint NOT NULL,
    mobile_no bigint NOT NULL,
    batch_no bigint NOT NULL,
    contact_address character varying(30) NOT NULL,
    permanent_address character varying(30) NOT NULL,
    "driverPic" character varying(100) NOT NULL,
    "driverLicense" character varying(100) NOT NULL,
    "driverID" character varying(100) NOT NULL,
    vehicle_id integer NOT NULL
);


ALTER TABLE public.transport_driver OWNER TO myprojectuser;

--
-- Name: transport_routes; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.transport_routes (
    route_code bigint NOT NULL,
    start_place character varying(30) NOT NULL,
    end_place character varying(30) NOT NULL,
    shift_time character varying(30) NOT NULL,
    stoppage_names character varying(30) NOT NULL,
    stoppage_id integer NOT NULL,
    remarks character varying(50) NOT NULL,
    route_distance integer NOT NULL,
    longitude numeric(5,2) NOT NULL,
    lattitude numeric(5,2) NOT NULL,
    vehicle_id integer NOT NULL
);


ALTER TABLE public.transport_routes OWNER TO myprojectuser;

--
-- Name: transport_vehicle; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.transport_vehicle (
    vehicle_no bigint NOT NULL,
    device_id bigint NOT NULL,
    service_id bigint NOT NULL,
    no_of_seat integer NOT NULL,
    maximum_allowed integer NOT NULL,
    vehicle_type character varying(30) NOT NULL,
    insurance_company character varying(30) NOT NULL,
    contact_person character varying(30) NOT NULL,
    insurance_date date,
    permit_valid_date date,
    pollution_cert_exp_date date,
    fitness_service_date date,
    service_date date
);


ALTER TABLE public.transport_vehicle OWNER TO myprojectuser;

--
-- Name: visitors_visitor; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.visitors_visitor (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    mobile_no bigint NOT NULL,
    date_time timestamp with time zone NOT NULL,
    contact_to character varying(30) NOT NULL,
    address character varying(50) NOT NULL,
    purpose text NOT NULL,
    photo character varying(100) NOT NULL,
    document character varying(100) NOT NULL
);


ALTER TABLE public.visitors_visitor OWNER TO myprojectuser;

--
-- Name: visitors_visitor_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.visitors_visitor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visitors_visitor_id_seq OWNER TO myprojectuser;

--
-- Name: visitors_visitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.visitors_visitor_id_seq OWNED BY public.visitors_visitor.id;


--
-- Name: accounts_userprofile id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_userprofile_id_seq'::regclass);


--
-- Name: attendence_studentattendence id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_studentattendence ALTER COLUMN id SET DEFAULT nextval('public.attendence_studentattendence_id_seq'::regclass);


--
-- Name: attendence_teacherattendence id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_teacherattendence ALTER COLUMN id SET DEFAULT nextval('public.attendence_teacherattendence_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: classform_classroom id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom ALTER COLUMN id SET DEFAULT nextval('public.classform_classroom_id_seq'::regclass);


--
-- Name: classform_classroomstudent id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent ALTER COLUMN id SET DEFAULT nextval('public.classform_classroomstudent_id_seq'::regclass);


--
-- Name: classform_reportcard id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_reportcard ALTER COLUMN id SET DEFAULT nextval('public.classform_reportcard_id_seq'::regclass);


--
-- Name: classform_studentrouteattendence id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_studentrouteattendence ALTER COLUMN id SET DEFAULT nextval('public.classform_studentrouteattendence_id_seq'::regclass);


--
-- Name: dailythought_thoughts id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.dailythought_thoughts ALTER COLUMN id SET DEFAULT nextval('public.dailythought_thoughts_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: fees_classsectionfees id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees ALTER COLUMN id SET DEFAULT nextval('public.fees_classsectionfees_id_seq'::regclass);


--
-- Name: fees_fee id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee ALTER COLUMN id SET DEFAULT nextval('public.fees_fee_id_seq'::regclass);


--
-- Name: fees_feecategory id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecategory ALTER COLUMN id SET DEFAULT nextval('public.fees_feecategory_id_seq'::regclass);


--
-- Name: fees_feecycle id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecycle ALTER COLUMN id SET DEFAULT nextval('public.fees_feecycle_id_seq'::regclass);


--
-- Name: fees_feediscount id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feediscount ALTER COLUMN id SET DEFAULT nextval('public.fees_feediscount_id_seq'::regclass);


--
-- Name: fees_fine id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fine ALTER COLUMN id SET DEFAULT nextval('public.fees_fine_id_seq'::regclass);


--
-- Name: gallery_album id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.gallery_album ALTER COLUMN id SET DEFAULT nextval('public.gallery_album_id_seq'::regclass);


--
-- Name: gallery_photo id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.gallery_photo ALTER COLUMN id SET DEFAULT nextval('public.gallery_photo_id_seq'::regclass);


--
-- Name: gallery_video id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.gallery_video ALTER COLUMN id SET DEFAULT nextval('public.gallery_video_id_seq'::regclass);


--
-- Name: holiday_holiday id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.holiday_holiday ALTER COLUMN id SET DEFAULT nextval('public.holiday_holiday_id_seq'::regclass);


--
-- Name: homework_homework id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_homework ALTER COLUMN id SET DEFAULT nextval('public.homework_homework_id_seq'::regclass);


--
-- Name: homework_syllabus id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_syllabus ALTER COLUMN id SET DEFAULT nextval('public.homework_syllabus_id_seq'::regclass);


--
-- Name: leave_employeeleave id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.leave_employeeleave ALTER COLUMN id SET DEFAULT nextval('public.leave_employeeleave_id_seq'::regclass);


--
-- Name: leave_studentleave id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.leave_studentleave ALTER COLUMN id SET DEFAULT nextval('public.leave_studentleave_id_seq'::regclass);


--
-- Name: markssection_additionalsubjectmapping id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping ALTER COLUMN id SET DEFAULT nextval('public.markssection_additionalsubjectmapping_id_seq'::regclass);


--
-- Name: markssection_exam id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exam ALTER COLUMN id SET DEFAULT nextval('public.markssection_exam_id_seq'::regclass);


--
-- Name: markssection_exammapping id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping ALTER COLUMN id SET DEFAULT nextval('public.markssection_exammapping_id_seq'::regclass);


--
-- Name: markssection_examtype id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_examtype ALTER COLUMN id SET DEFAULT nextval('public.markssection_examtype_id_seq'::regclass);


--
-- Name: markssection_marks id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks ALTER COLUMN id SET DEFAULT nextval('public.markssection_marks_id_seq'::regclass);


--
-- Name: newsletter_newsletter id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.newsletter_newsletter ALTER COLUMN id SET DEFAULT nextval('public.newsletter_newsletter_id_seq'::regclass);


--
-- Name: notice_classnotice id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_classnotice ALTER COLUMN id SET DEFAULT nextval('public.notice_classnotice_id_seq'::regclass);


--
-- Name: notice_studentnotice id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_studentnotice ALTER COLUMN id SET DEFAULT nextval('public.notice_studentnotice_id_seq'::regclass);


--
-- Name: visitors_visitor id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.visitors_visitor ALTER COLUMN id SET DEFAULT nextval('public.visitors_visitor_id_seq'::regclass);


--
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.accounts_userprofile (id, user_type, mobile_no, user_id, image, "fullName", addmission_number, emp_id) FROM stdin;
12	Admin	4545445449	4	profile_pics/customer-3_EWBaFFT.jpg	Smith D'souza	0	0
1	Teacher	4659898989	1	profile_pics/customer-1.jpg	Yash Boura	0	1223
14	Student	2323232326	14	profile_pics/whysection.jpg	Suman Thakur	2231	0
13	Admin	8989898989	2	profile_pics/carousel3.jpg	Admin	0	0
\.


--
-- Data for Name: attendence_studentattendence; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.attendence_studentattendence (id, status, date, student_id) FROM stdin;
1	present	2019-12-03	1
2	present	2019-12-03	2
3	present	2019-12-03	3
4	present	2019-12-03	1
5	present	2019-12-03	2
6	present	2019-12-03	3
8	absent	2019-12-18	4
7	absent	2019-12-18	1
9	leave	2019-12-25	1
10	present	2019-12-25	2
11	absent	2019-12-25	3
12	present	2020-01-22	1
13	absent	2020-01-22	2
14	present	2020-01-22	3
15	present	2019-12-30	1
16	present	2020-01-07	7
17	present	2020-01-08	1
18	absent	2020-01-08	2
19	present	2020-01-08	3
20	absent	2020-01-08	8
21	present	2020-01-10	1
22	Absent	2020-01-25	1
23	Present	2020-01-01	1
\.


--
-- Data for Name: attendence_teacherattendence; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.attendence_teacherattendence (id, status, date, teacher_id, available_casual_leave, available_sick_leave, taken_casual_leave, taken_sick_leave, total_no_of_days_present) FROM stdin;
2	present	2019-12-11	1223	10	10	0	0	0
3	absent	2019-12-11	6577	10	10	0	0	0
4	present	2019-12-11	10101012	10	10	0	0	0
5	Absent	2019-12-11	10101012	10	10	0	0	0
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user profile	1	add_userprofile
2	Can change user profile	1	change_userprofile
3	Can delete user profile	1	delete_userprofile
4	Can view user profile	1	view_userprofile
5	Can add log entry	2	add_logentry
6	Can change log entry	2	change_logentry
7	Can delete log entry	2	delete_logentry
8	Can view log entry	2	view_logentry
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add user	5	add_user
18	Can change user	5	change_user
19	Can delete user	5	delete_user
20	Can view user	5	view_user
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add student info	8	add_studentinfo
30	Can change student info	8	change_studentinfo
31	Can delete student info	8	delete_studentinfo
32	Can view student info	8	view_studentinfo
33	Can add parent info	9	add_parentinfo
34	Can change parent info	9	change_parentinfo
35	Can delete parent info	9	delete_parentinfo
36	Can view parent info	9	view_parentinfo
37	Can add documents	10	add_documents
38	Can change documents	10	change_documents
39	Can delete documents	10	delete_documents
40	Can view documents	10	view_documents
41	Can add current address	11	add_currentaddress
42	Can change current address	11	change_currentaddress
43	Can delete current address	11	delete_currentaddress
44	Can view current address	11	view_currentaddress
45	Can add permanent address	12	add_permanentaddress
46	Can change permanent address	12	change_permanentaddress
47	Can delete permanent address	12	delete_permanentaddress
48	Can view permanent address	12	view_permanentaddress
49	Can add employee documents	13	add_employeedocuments
50	Can change employee documents	13	change_employeedocuments
51	Can delete employee documents	13	delete_employeedocuments
52	Can view employee documents	13	view_employeedocuments
53	Can add employee	14	add_employee
54	Can change employee	14	change_employee
55	Can delete employee	14	delete_employee
56	Can view employee	14	view_employee
57	Can add teacher	15	add_teacher
58	Can change teacher	15	change_teacher
59	Can delete teacher	15	delete_teacher
60	Can view teacher	15	view_teacher
61	Can add teacher	16	add_teacher
62	Can change teacher	16	change_teacher
63	Can delete teacher	16	delete_teacher
64	Can view teacher	16	view_teacher
65	Can add employee documents	17	add_employeedocuments
66	Can change employee documents	17	change_employeedocuments
67	Can delete employee documents	17	delete_employeedocuments
68	Can view employee documents	17	view_employeedocuments
69	Can add employee	18	add_employee
70	Can change employee	18	change_employee
71	Can delete employee	18	delete_employee
72	Can view employee	18	view_employee
73	Can add permanent address	19	add_permanentaddress
74	Can change permanent address	19	change_permanentaddress
75	Can delete permanent address	19	delete_permanentaddress
76	Can view permanent address	19	view_permanentaddress
77	Can add current address	20	add_currentaddress
78	Can change current address	20	change_currentaddress
79	Can delete current address	20	delete_currentaddress
80	Can view current address	20	view_currentaddress
81	Can add class room	21	add_classroom
82	Can change class room	21	change_classroom
83	Can delete class room	21	delete_classroom
84	Can view class room	21	view_classroom
85	Can add class room student	22	add_classroomstudent
86	Can change class room student	22	change_classroomstudent
87	Can delete class room student	22	delete_classroomstudent
88	Can view class room student	22	view_classroomstudent
89	Can add student attendence	23	add_studentattendence
90	Can change student attendence	23	change_studentattendence
91	Can delete student attendence	23	delete_studentattendence
92	Can view student attendence	23	view_studentattendence
93	Can add teacher attendence	24	add_teacherattendence
94	Can change teacher attendence	24	change_teacherattendence
95	Can delete teacher attendence	24	delete_teacherattendence
96	Can view teacher attendence	24	view_teacherattendence
97	Can add exam type	25	add_examtype
98	Can change exam type	25	change_examtype
99	Can delete exam type	25	delete_examtype
100	Can view exam type	25	view_examtype
101	Can add subjects to class	26	add_subjectstoclass
102	Can change subjects to class	26	change_subjectstoclass
103	Can delete subjects to class	26	delete_subjectstoclass
104	Can view subjects to class	26	view_subjectstoclass
105	Can add marks	27	add_marks
106	Can change marks	27	change_marks
107	Can delete marks	27	delete_marks
108	Can view marks	27	view_marks
109	Can add exam	28	add_exam
110	Can change exam	28	change_exam
111	Can delete exam	28	delete_exam
112	Can view exam	28	view_exam
113	Can add exam mapping	29	add_exammapping
114	Can change exam mapping	29	change_exammapping
115	Can delete exam mapping	29	delete_exammapping
116	Can view exam mapping	29	view_exammapping
117	Can add additional subject	30	add_additionalsubject
118	Can change additional subject	30	change_additionalsubject
119	Can delete additional subject	30	delete_additionalsubject
120	Can view additional subject	30	view_additionalsubject
121	Can add marks	31	add_marks
122	Can change marks	31	change_marks
123	Can delete marks	31	delete_marks
124	Can view marks	31	view_marks
125	Can add exam	32	add_exam
126	Can change exam	32	change_exam
127	Can delete exam	32	delete_exam
128	Can view exam	32	view_exam
129	Can add exam mapping	33	add_exammapping
130	Can change exam mapping	33	change_exammapping
131	Can delete exam mapping	33	delete_exammapping
132	Can view exam mapping	33	view_exammapping
133	Can add exam type	34	add_examtype
134	Can change exam type	34	change_examtype
135	Can delete exam type	34	delete_examtype
136	Can view exam type	34	view_examtype
137	Can add additional subject	35	add_additionalsubject
138	Can change additional subject	35	change_additionalsubject
139	Can delete additional subject	35	delete_additionalsubject
140	Can view additional subject	35	view_additionalsubject
141	Can add additional subject mapping	36	add_additionalsubjectmapping
142	Can change additional subject mapping	36	change_additionalsubjectmapping
143	Can delete additional subject mapping	36	delete_additionalsubjectmapping
144	Can view additional subject mapping	36	view_additionalsubjectmapping
145	Can add home work	37	add_homework
146	Can change home work	37	change_homework
147	Can delete home work	37	delete_homework
148	Can view home work	37	view_homework
149	Can add class notice	38	add_classnotice
150	Can change class notice	38	change_classnotice
151	Can delete class notice	38	delete_classnotice
152	Can view class notice	38	view_classnotice
153	Can add student notice	39	add_studentnotice
154	Can change student notice	39	change_studentnotice
155	Can delete student notice	39	delete_studentnotice
156	Can view student notice	39	view_studentnotice
157	Can add thoughts	40	add_thoughts
158	Can change thoughts	40	change_thoughts
159	Can delete thoughts	40	delete_thoughts
160	Can view thoughts	40	view_thoughts
161	Can add newsletter	41	add_newsletter
162	Can change newsletter	41	change_newsletter
163	Can delete newsletter	41	delete_newsletter
164	Can view newsletter	41	view_newsletter
165	Can add school info	42	add_schoolinfo
166	Can change school info	42	change_schoolinfo
167	Can delete school info	42	delete_schoolinfo
168	Can view school info	42	view_schoolinfo
169	Can add holiday	43	add_holiday
170	Can change holiday	43	change_holiday
171	Can delete holiday	43	delete_holiday
172	Can view holiday	43	view_holiday
173	Can add fee category	44	add_feecategory
174	Can change fee category	44	change_feecategory
175	Can delete fee category	44	delete_feecategory
176	Can view fee category	44	view_feecategory
177	Can add fee cycle	45	add_feecycle
178	Can change fee cycle	45	change_feecycle
179	Can delete fee cycle	45	delete_feecycle
180	Can view fee cycle	45	view_feecycle
181	Can add fee discount	46	add_feediscount
182	Can change fee discount	46	change_feediscount
183	Can delete fee discount	46	delete_feediscount
184	Can view fee discount	46	view_feediscount
185	Can add fine	47	add_fine
186	Can change fine	47	change_fine
187	Can delete fine	47	delete_fine
188	Can view fine	47	view_fine
189	Can add fee	48	add_fee
190	Can change fee	48	change_fee
191	Can delete fee	48	delete_fee
192	Can view fee	48	view_fee
193	Can add class section fees	49	add_classsectionfees
194	Can change class section fees	49	change_classsectionfees
195	Can delete class section fees	49	delete_classsectionfees
196	Can view class section fees	49	view_classsectionfees
197	Can add syllabus	50	add_syllabus
198	Can change syllabus	50	change_syllabus
199	Can delete syllabus	50	delete_syllabus
200	Can view syllabus	50	view_syllabus
201	Can add report card	51	add_reportcard
202	Can change report card	51	change_reportcard
203	Can delete report card	51	delete_reportcard
204	Can view report card	51	view_reportcard
205	Can add driver	52	add_driver
206	Can change driver	52	change_driver
207	Can delete driver	52	delete_driver
208	Can view driver	52	view_driver
209	Can add routes	53	add_routes
210	Can change routes	53	change_routes
211	Can delete routes	53	delete_routes
212	Can view routes	53	view_routes
213	Can add vehicle	54	add_vehicle
214	Can change vehicle	54	change_vehicle
215	Can delete vehicle	54	delete_vehicle
216	Can view vehicle	54	view_vehicle
217	Can add student route	55	add_studentroute
218	Can change student route	55	change_studentroute
219	Can delete student route	55	delete_studentroute
220	Can view student route	55	view_studentroute
221	Can add student route attendence	56	add_studentrouteattendence
222	Can change student route attendence	56	change_studentrouteattendence
223	Can delete student route attendence	56	delete_studentrouteattendence
224	Can view student route attendence	56	view_studentrouteattendence
225	Can add visitor	57	add_visitor
226	Can change visitor	57	change_visitor
227	Can delete visitor	57	delete_visitor
228	Can view visitor	57	view_visitor
229	Can add student leave	58	add_studentleave
230	Can change student leave	58	change_studentleave
231	Can delete student leave	58	delete_studentleave
232	Can view student leave	58	view_studentleave
233	Can add employee leave	59	add_employeeleave
234	Can change employee leave	59	change_employeeleave
235	Can delete employee leave	59	delete_employeeleave
236	Can view employee leave	59	view_employeeleave
237	Can add album	60	add_album
238	Can change album	60	change_album
239	Can delete album	60	delete_album
240	Can view album	60	view_album
241	Can add photo	61	add_photo
242	Can change photo	61	change_photo
243	Can delete photo	61	delete_photo
244	Can view photo	61	view_photo
245	Can add video	62	add_video
246	Can change video	62	change_video
247	Can delete video	62	delete_video
248	Can view video	62	view_video
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$150000$AH8YhH5ddait$2Knous/eaROaakLDRdHxn0y5UZZPEJKd3AlTKqFJDbQ=	2019-12-24 11:16:01.963582+00	t	Smith Singh	Smith Singh			t	t	2019-12-24 08:22:10+00
1	pbkdf2_sha256$150000$82rTUpdpjrWU$GF35Zr7myF3ziHn58LnP7q4tMZEE2ll3iBXBMYxvcxU=	2020-01-23 18:34:42.856976+00	t	Teacher	yash			t	t	2019-12-05 10:02:38+00
2	pbkdf2_sha256$150000$IKRemWv0JUjT$MdI4gKXsyUU20rqojDU99idXwXpu96diyxwtdeHpVH4=	2020-01-25 16:59:25.975884+00	t	admin				t	t	2019-12-05 10:13:06.231138+00
14	pbkdf2_sha256$150000$IECsc4HuNNSM$Uv2W8ekjjrgaGtEti5hstUqI08pll9KnsuALS3Qks1U=	2020-01-25 17:24:49.816912+00	t	Student				t	t	2020-01-23 18:18:23+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: classform_classroom; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_classroom (id, "classSection", teacher_id) FROM stdin;
1	6-B	10101012
2	6-C	6577
3	6-A	1223
\.


--
-- Data for Name: classform_classroomstudent; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_classroomstudent (id, roll_number, "classRoom_id", student_id) FROM stdin;
1	1	3	2231
2	3	3	988
3	5	3	3231
4	2	1	223
5	4	1	12345
7	1	2	122
8	6	3	323198964
\.


--
-- Data for Name: classform_reportcard; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_reportcard (id, "reportCard", class_room_student_id) FROM stdin;
\.


--
-- Data for Name: classform_studentrouteattendence; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.classform_studentrouteattendence (id, status, date, "time", student_id) FROM stdin;
1	present	2019-12-30	2020-01-20 17:03:12.372002+00	1
2	absent	2020-01-07	2020-01-20 17:29:38.487832+00	8
\.


--
-- Data for Name: dailythought_thoughts; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.dailythought_thoughts (id, thought, "timestamp") FROM stdin;
7	This a example thought of the day 	2019-12-19
8	This is again just a sample thought	2019-12-19
18	Sample thought sample thought sample thought sample thought sample thought sample thought.	2019-12-25
19	Some random thought	2020-01-08
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-12-09 17:01:36.22459+00	1223	Name:Rohan Pawar| Class:6-A| Emp.ID: 1223	2	[{"changed": {"fields": ["employee", "firstName", "lastName", "fullName", "specialization", "designation", "classTeacher"]}}]	16	2
2	2019-12-09 17:02:08.042215+00	6577	Name:Kartik Singh| Class:6-A| Emp.ID: 6577	1	[{"added": {}}]	16	2
3	2019-12-09 17:02:16.789755+00	6577	Name:Kartik Singh| Class:6-C| Emp.ID: 6577	2	[{"changed": {"fields": ["classTeacher"]}}]	16	2
4	2019-12-09 17:02:40.422453+00	10101012	Name:Jainaish Thakur| Class:6-B| Emp.ID: 10101012	2	[{"changed": {"fields": ["classTeacher"]}}]	16	2
5	2019-12-09 17:02:52.031653+00	101010	Name:| Class:| Emp.ID: 101010	3		16	2
6	2019-12-09 17:03:51.746676+00	2231	Name:Suman Thakur Add.No: 2231 Class:5-A	2	[{"changed": {"fields": ["firstName", "lastName", "fullName", "classSection"]}}]	8	2
7	2019-12-09 17:04:11.639897+00	123656	Name: Add.No: 123656 Class:	3		8	2
8	2019-12-09 17:04:25.128907+00	909090	Name: Add.No: 909090 Class:	3		8	2
9	2019-12-09 17:04:38.834341+00	223	Name:rameshsingh Add.No: 223 Class:5-B	2	[{"changed": {"fields": ["classSection"]}}]	8	2
10	2019-12-09 17:09:28.677067+00	2	Class:6-C| Teacher: Kartik Singh	1	[{"added": {}}]	21	2
11	2019-12-09 17:09:38.354674+00	3	Class:6-A| Teacher: Rohan Pawar	1	[{"added": {}}]	21	2
12	2019-12-09 17:12:44.258501+00	223	Name:rameshsingh Add.No: 223 Class:6-B	2	[{"changed": {"fields": ["classSection"]}}]	8	2
13	2019-12-09 17:13:00.383327+00	2231	Name:Suman Thakur Add.No: 2231 Class:6-A	2	[{"changed": {"fields": ["classSection"]}}]	8	2
14	2019-12-09 17:13:30.719433+00	122	Name:yash dfs Add.No: 122 Class:6-A	2	[{"changed": {"fields": ["fullName", "fName", "classSection"]}}]	8	2
15	2019-12-09 17:13:39.970985+00	122	Name:yash dfs Add.No: 122 Class:6-C	2	[{"changed": {"fields": ["classSection"]}}]	8	2
16	2019-12-09 18:42:58.418092+00	1	Class:Class:6-A| Teacher: Rohan Pawar| Student: Suman Thakur	1	[{"added": {}}]	22	2
17	2019-12-09 19:17:57.289282+00	12345	Name:rameshsingh| Add.No: 12345| Class:6-B	2	[{"changed": {"fields": ["classSection"]}}]	8	2
18	2019-12-09 19:24:44.459846+00	6	Class:Class:6-C| Teacher: Kartik Singh| Student:yash dfs	3		22	2
19	2019-12-11 07:50:18.120468+00	7	Name:Suman Thakur| Date:2019-12-18 | Status:absent	2	[{"changed": {"fields": ["status"]}}]	23	2
20	2019-12-11 09:23:39.568939+00	5	Name:Jainaish Thakur| Date:2019-12-11 | Status:Absent	1	[{"added": {}}]	24	2
21	2019-12-12 06:01:38.493429+00	1	ExamType object (1)	3		25	2
22	2019-12-12 06:04:28.414425+00	2	ExamType object (2)	3		25	2
23	2019-12-12 06:05:04.415143+00	3	ExamType object (3)	3		25	2
24	2019-12-12 06:13:35.893242+00	14	ExamType object (14)	3		25	2
25	2019-12-12 06:13:35.996596+00	13	ExamType object (13)	3		25	2
26	2019-12-12 06:13:36.003183+00	12	ExamType object (12)	3		25	2
27	2019-12-12 06:13:36.014478+00	11	ExamType object (11)	3		25	2
28	2019-12-12 06:13:36.025504+00	10	ExamType object (10)	3		25	2
29	2019-12-12 06:13:36.036728+00	9	ExamType object (9)	3		25	2
30	2019-12-12 06:13:36.047814+00	8	ExamType object (8)	3		25	2
31	2019-12-12 06:13:36.058726+00	7	ExamType object (7)	3		25	2
32	2019-12-12 06:13:36.06977+00	6	ExamType object (6)	3		25	2
33	2019-12-12 06:13:36.082541+00	5	ExamType object (5)	3		25	2
34	2019-12-12 06:13:36.091741+00	4	ExamType object (4)	3		25	2
35	2019-12-12 06:19:47.677879+00	26	ExamType object (26)	3		25	2
36	2019-12-12 06:19:47.740218+00	25	ExamType object (25)	3		25	2
37	2019-12-12 06:19:47.751171+00	24	ExamType object (24)	3		25	2
38	2019-12-12 06:19:47.762345+00	23	ExamType object (23)	3		25	2
39	2019-12-12 06:19:47.773566+00	22	ExamType object (22)	3		25	2
40	2019-12-12 06:19:47.784438+00	21	ExamType object (21)	3		25	2
41	2019-12-12 06:19:47.795625+00	20	ExamType object (20)	3		25	2
42	2019-12-12 06:19:47.806612+00	19	ExamType object (19)	3		25	2
43	2019-12-12 06:19:47.81759+00	18	ExamType object (18)	3		25	2
44	2019-12-12 06:19:47.828911+00	17	ExamType object (17)	3		25	2
45	2019-12-12 06:19:47.839627+00	16	ExamType object (16)	3		25	2
46	2019-12-12 06:19:47.85066+00	15	ExamType object (15)	3		25	2
47	2019-12-12 08:33:59.411978+00	323198964	Name:Ashok Sinha| Add.No: 323198964| Class:6-A	2	[{"changed": {"fields": ["fullName", "fName", "prevSchoolName"]}}]	8	2
48	2019-12-12 08:34:27.674646+00	3231	Name:Ashok Sinha| Add.No: 3231| Class:6-A	2	[{"changed": {"fields": ["fullName", "fName", "prevSchoolName"]}}]	8	2
49	2019-12-12 09:03:08.66342+00	37	ExamType object (37)	3		25	2
50	2019-12-12 09:03:08.830194+00	36	ExamType object (36)	3		25	2
51	2019-12-12 09:03:08.903805+00	35	ExamType object (35)	3		25	2
52	2019-12-12 09:03:08.914906+00	34	ExamType object (34)	3		25	2
53	2019-12-12 09:03:08.925947+00	33	ExamType object (33)	3		25	2
54	2019-12-12 09:03:08.937573+00	32	ExamType object (32)	3		25	2
55	2019-12-12 09:03:08.948069+00	31	ExamType object (31)	3		25	2
56	2019-12-12 09:03:08.958801+00	30	ExamType object (30)	3		25	2
57	2019-12-12 09:03:08.969917+00	29	ExamType object (29)	3		25	2
58	2019-12-12 09:03:08.98096+00	28	ExamType object (28)	3		25	2
59	2019-12-14 08:45:43.890481+00	3	Exam :Annual Exam ExamType:Theory	3		34	2
60	2019-12-14 08:45:59.910087+00	4	Exam :Annual Exam ExamType:Oral	3		34	2
61	2019-12-14 10:38:44.450412+00	6	Exam :UT-1 ExamType:Theory	1	[{"added": {}}]	34	2
62	2019-12-14 10:39:29.106453+00	12	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
63	2019-12-14 10:40:05.096371+00	13	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
64	2019-12-14 10:40:24.599171+00	14	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
65	2019-12-14 10:40:58.20926+00	15	Exam:UT-1 ExamType:Theory	1	[{"added": {}}]	33	2
66	2019-12-16 07:15:11.909235+00	4	Exam :SA-1	2	[{"changed": {"fields": ["examName", "description"]}}]	32	2
67	2019-12-16 07:15:39.20997+00	3	Exam :SA-2	2	[{"changed": {"fields": ["examName", "description"]}}]	32	2
68	2019-12-16 07:18:54.36662+00	11	Exam:SA-1 ExamType:Theory|Subject:Social Studies	2	[{"changed": {"fields": ["examType"]}}]	33	2
69	2019-12-16 07:19:07.58753+00	10	Exam:SA-1 ExamType:Theory|Subject:Science	2	[{"changed": {"fields": ["examType"]}}]	33	2
70	2019-12-16 07:19:20.088347+00	9	Exam:SA-1 ExamType:Theory|Subject:English	2	[{"changed": {"fields": ["examType"]}}]	33	2
71	2019-12-16 07:19:40.899765+00	8	Exam:SA-1 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["examType"]}}]	33	2
72	2019-12-16 07:19:50.630075+00	14	Exam:UT-1 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["subject"]}}]	33	2
73	2019-12-16 07:20:08.499008+00	6	Exam:SA-1 ExamType:Theory|Subject:Social Studies	2	[{"changed": {"fields": ["examType"]}}]	33	2
74	2019-12-16 07:21:13.074867+00	5	Exam :SA-2 ExamType:Theory	2	[{"changed": {"fields": ["examName", "examType", "minMarks", "maxMarks"]}}]	34	2
75	2019-12-16 07:21:18.97819+00	2	Exam :SA-1 ExamType:Theory	2	[]	34	2
76	2019-12-16 07:21:27.650533+00	6	Exam :UT-1 ExamType:Theory	2	[{"changed": {"fields": ["minMarks"]}}]	34	2
77	2019-12-16 07:21:33.275431+00	2	Exam :SA-1 ExamType:Theory	2	[]	34	2
78	2019-12-16 07:21:47.635593+00	1	Exam :UT-2 ExamType:Theory	2	[{"changed": {"fields": ["examType", "minMarks", "maxMarks"]}}]	34	2
79	2019-12-16 07:25:36.792945+00	7	Exam:SA-2 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["examName"]}}]	33	2
80	2019-12-16 07:25:50.574291+00	6	Exam:SA-2 ExamType:Theory|Subject:Social Studies	2	[{"changed": {"fields": ["examName", "examType"]}}]	33	2
81	2019-12-16 07:26:17.157325+00	7	Exam:SA-2 ExamType:Theory|Subject:Mathematics	2	[]	33	2
82	2019-12-16 07:26:41.350543+00	5	Exam:SA-2 ExamType:Theory|Subject:Science	2	[{"changed": {"fields": ["examName"]}}]	33	2
83	2019-12-16 07:26:52.695319+00	4	Exam:SA-2 ExamType:Theory|Subject:English	2	[{"changed": {"fields": ["examName"]}}]	33	2
84	2019-12-16 07:27:13.255717+00	2	Exam:UT-2 ExamType:Theory|Subject:Mathematics	2	[{"changed": {"fields": ["subject"]}}]	33	2
85	2019-12-16 07:27:51.167669+00	16	Exam:UT-2 ExamType:Theory|Subject:Social Studies	1	[{"added": {}}]	33	2
86	2019-12-16 07:29:53.49678+00	4	Suman Thakur | Exam:Theory UT-2 | Subject:Mathematics	1	[{"added": {}}]	31	2
87	2019-12-16 07:30:08.017209+00	5	Suman Thakur | Exam:Theory SA-2 | Subject:Science	1	[{"added": {}}]	31	2
88	2019-12-16 07:30:23.316381+00	6	Suman Thakur | Exam:Theory SA-2 | Subject:Social Studies	1	[{"added": {}}]	31	2
89	2019-12-16 07:30:51.223063+00	7	Suman Thakur | Exam:Theory SA-2 | Subject:English	1	[{"added": {}}]	31	2
90	2019-12-16 07:31:31.26615+00	8	Suman Thakur | Exam:Theory SA-2 | Subject:Mathematics	1	[{"added": {}}]	31	2
91	2019-12-16 07:32:06.766127+00	9	Suman Thakur | Exam:Theory UT-2 | Subject:English	1	[{"added": {}}]	31	2
92	2019-12-16 07:32:17.192105+00	1	Suman Thakur | Exam:Theory UT-2 | Subject:Science	2	[{"changed": {"fields": ["marks"]}}]	31	2
93	2019-12-16 07:32:29.736079+00	4	Suman Thakur | Exam:Theory UT-2 | Subject:Mathematics	2	[{"changed": {"fields": ["marks"]}}]	31	2
94	2019-12-16 07:35:20.960475+00	10	Suman Thakur | Exam:Theory UT-2 | Subject:Social Studies	1	[{"added": {}}]	31	2
95	2019-12-16 07:36:08.664446+00	11	Suman Thakur | Exam:Theory SA-1 | Subject:English	1	[{"added": {}}]	31	2
96	2019-12-16 07:36:29.756268+00	12	Suman Thakur | Exam:Theory SA-1 | Subject:Social Studies	1	[{"added": {}}]	31	2
97	2019-12-16 07:36:46.399048+00	13	Suman Thakur | Exam:Theory SA-1 | Subject:Science	1	[{"added": {}}]	31	2
98	2019-12-16 07:37:09.690084+00	14	Suman Thakur | Exam:Theory SA-1 | Subject:Mathematics	1	[{"added": {}}]	31	2
99	2019-12-16 07:38:35.467898+00	15	Suman Thakur | Exam:Theory UT-1 | Subject:English	1	[{"added": {}}]	31	2
100	2019-12-16 07:38:45.450171+00	16	Suman Thakur | Exam:Theory UT-1 | Subject:Social Studies	1	[{"added": {}}]	31	2
101	2019-12-16 07:38:56.053555+00	17	Suman Thakur | Exam:Theory UT-1 | Subject:Science	1	[{"added": {}}]	31	2
102	2019-12-16 07:39:13.563926+00	18	Suman Thakur | Exam:Theory UT-1 | Subject:Science	1	[{"added": {}}]	31	2
103	2019-12-16 07:39:25.131619+00	18	Suman Thakur | Exam:Theory UT-1 | Subject:Mathematics	2	[{"changed": {"fields": ["subject"]}}]	31	2
104	2019-12-16 17:26:18.841325+00	14	Suman Thakur | Exam:Theory SA-1 | Subject:Mathematics	2	[{"changed": {"fields": ["marks"]}}]	31	2
105	2019-12-16 17:26:31.409235+00	7	Suman Thakur | Exam:Theory SA-2 | Subject:English	2	[{"changed": {"fields": ["marks"]}}]	31	2
106	2019-12-16 17:28:12.03869+00	13	Suman Thakur | Exam:Theory SA-1 | Subject:Science	2	[{"changed": {"fields": ["marks"]}}]	31	2
107	2019-12-17 09:28:43.913242+00	19	Suman Thakur | Exam:Theory Final | Subject:English	2	[]	31	2
108	2019-12-17 09:29:00.405342+00	22	Suman Thakur | Exam:Theory Final | Subject:Science	1	[{"added": {}}]	31	2
109	2019-12-17 09:29:18.78414+00	23	Suman Thakur | Exam:Theory Final | Subject:Social Studies	1	[{"added": {}}]	31	2
110	2019-12-17 09:29:35.452872+00	24	Suman Thakur | Exam:Theory Final | Subject:Mathematics	1	[{"added": {}}]	31	2
111	2019-12-17 09:52:41.751742+00	1	AdditionalSubjectMapping object (1)	2	[{"changed": {"fields": ["examName", "examType", "marks"]}}]	36	2
112	2019-12-17 09:53:09.78701+00	2	AdditionalSubjectMapping object (2)	1	[{"added": {}}]	36	2
113	2019-12-17 09:53:30.922688+00	3	AdditionalSubjectMapping object (3)	1	[{"added": {}}]	36	2
114	2019-12-20 12:38:02.684136+00	2	FeeCategory object (2)	3		44	2
115	2019-12-21 08:00:38.030724+00	1	Fee object (1)	2	[{"changed": {"fields": ["monthsPaid"]}}]	48	2
116	2019-12-21 08:01:58.846742+00	1	Fee object (1)	2	[]	48	2
117	2019-12-21 11:08:04.565503+00	2	Class:6-B| Teacher: Jainaish Thakur FeeCategory object (3) 23231	3		49	2
118	2019-12-21 11:08:05.005115+00	1	Class:6-B| Teacher: Jainaish Thakur FeeCategory object (3) 23231	3		49	2
119	2019-12-21 11:09:02.296727+00	1	Class:6-A| Student:Suman Thakur 46567 Jan,Feb	2	[{"changed": {"fields": ["amount", "monthsPaid"]}}]	48	2
120	2019-12-21 11:11:52.503737+00	2	Class:6-A| Student:Ashok Sinha 4545 Mar,Apr,Sep	1	[{"added": {}}]	48	2
121	2019-12-21 11:14:14.845832+00	1	Class:6-A| Student:Suman Thakur 46567 Jan,Feb	2	[{"changed": {"fields": ["classSection"]}}]	48	2
122	2019-12-21 12:56:57.448164+00	2	Class:6-A| Student:Ashok Sinha 4545 Mar,Apr,Sep	2	[{"changed": {"fields": ["submissionDate"]}}]	48	2
123	2019-12-21 12:57:07.920284+00	2	Class:6-A| Student:Ashok Sinha 4545 Mar,Apr,Sep	2	[{"changed": {"fields": ["submissionDate"]}}]	48	2
124	2019-12-23 18:45:11.605076+00	16	Newsletter object (16)	3		41	2
125	2019-12-23 18:45:11.769739+00	15	Newsletter object (15)	3		41	2
126	2019-12-23 18:45:11.78068+00	14	Newsletter object (14)	3		41	2
127	2019-12-23 18:45:11.791735+00	13	Newsletter object (13)	3		41	2
128	2019-12-23 18:45:11.802808+00	12	Newsletter object (12)	3		41	2
129	2019-12-23 18:45:11.81397+00	11	Newsletter object (11)	3		41	2
130	2019-12-23 18:46:14.376471+00	17	Newsletter object (17)	2	[{"changed": {"fields": ["description"]}}]	41	2
131	2019-12-24 06:30:13.196793+00	68	Newsletter object (68)	3		41	2
132	2019-12-24 06:30:13.296041+00	67	Newsletter object (67)	3		41	2
133	2019-12-24 06:30:13.307094+00	66	Newsletter object (66)	3		41	2
134	2019-12-24 06:30:13.318102+00	65	Newsletter object (65)	3		41	2
135	2019-12-24 06:30:13.329233+00	64	Newsletter object (64)	3		41	2
136	2019-12-24 06:30:13.340464+00	63	Newsletter object (63)	3		41	2
137	2019-12-24 06:30:13.351355+00	62	Newsletter object (62)	3		41	2
138	2019-12-24 06:30:13.362535+00	61	Newsletter object (61)	3		41	2
139	2019-12-24 06:30:13.373638+00	60	Newsletter object (60)	3		41	2
140	2019-12-24 06:30:13.384581+00	59	Newsletter object (59)	3		41	2
141	2019-12-24 06:30:13.395809+00	58	Newsletter object (58)	3		41	2
142	2019-12-24 06:30:13.406984+00	57	Newsletter object (57)	3		41	2
143	2019-12-24 06:30:13.429215+00	56	Newsletter object (56)	3		41	2
144	2019-12-24 06:30:13.44019+00	55	Newsletter object (55)	3		41	2
145	2019-12-24 06:30:13.451409+00	54	Newsletter object (54)	3		41	2
146	2019-12-24 06:30:13.46255+00	53	Newsletter object (53)	3		41	2
147	2019-12-24 06:30:13.473394+00	52	Newsletter object (52)	3		41	2
148	2019-12-24 06:30:13.48434+00	51	Newsletter object (51)	3		41	2
149	2019-12-24 06:30:13.495345+00	50	Newsletter object (50)	3		41	2
150	2019-12-24 06:30:13.507209+00	49	Newsletter object (49)	3		41	2
151	2019-12-24 06:30:13.51765+00	48	Newsletter object (48)	3		41	2
152	2019-12-24 06:30:13.52873+00	47	Newsletter object (47)	3		41	2
153	2019-12-24 06:30:13.539686+00	46	Newsletter object (46)	3		41	2
154	2019-12-24 06:30:13.550886+00	45	Newsletter object (45)	3		41	2
155	2019-12-24 06:30:13.561945+00	44	Newsletter object (44)	3		41	2
156	2019-12-24 06:30:13.573227+00	43	Newsletter object (43)	3		41	2
157	2019-12-24 06:30:13.584046+00	42	Newsletter object (42)	3		41	2
158	2019-12-24 06:30:13.594898+00	41	Newsletter object (41)	3		41	2
159	2019-12-24 06:30:13.607071+00	40	Newsletter object (40)	3		41	2
160	2019-12-24 06:30:13.617211+00	39	Newsletter object (39)	3		41	2
161	2019-12-24 06:30:13.628221+00	38	Newsletter object (38)	3		41	2
162	2019-12-24 06:30:13.640472+00	37	Newsletter object (37)	3		41	2
163	2019-12-24 06:30:13.650492+00	36	Newsletter object (36)	3		41	2
164	2019-12-24 06:30:13.661446+00	35	Newsletter object (35)	3		41	2
165	2019-12-24 06:30:13.673882+00	34	Newsletter object (34)	3		41	2
166	2019-12-24 06:30:13.683691+00	33	Newsletter object (33)	3		41	2
167	2019-12-24 06:30:13.694744+00	32	Newsletter object (32)	3		41	2
168	2019-12-24 06:30:13.706195+00	31	Newsletter object (31)	3		41	2
169	2019-12-24 06:30:13.716789+00	30	Newsletter object (30)	3		41	2
170	2019-12-24 06:30:13.728081+00	29	Newsletter object (29)	3		41	2
171	2019-12-24 06:30:13.740145+00	28	Newsletter object (28)	3		41	2
172	2019-12-24 06:30:13.750229+00	27	Newsletter object (27)	3		41	2
173	2019-12-24 06:30:13.761449+00	26	Newsletter object (26)	3		41	2
174	2019-12-24 06:30:13.772722+00	25	Newsletter object (25)	3		41	2
175	2019-12-24 06:30:13.783352+00	24	Newsletter object (24)	3		41	2
176	2019-12-24 06:30:13.794753+00	23	Newsletter object (23)	3		41	2
177	2019-12-24 06:30:13.805353+00	22	Newsletter object (22)	3		41	2
178	2019-12-24 06:30:13.816405+00	21	Newsletter object (21)	3		41	2
179	2019-12-24 06:30:13.827511+00	20	Newsletter object (20)	3		41	2
180	2019-12-24 06:30:13.838665+00	19	Newsletter object (19)	3		41	2
181	2019-12-24 06:30:13.849685+00	18	Newsletter object (18)	3		41	2
182	2019-12-24 06:30:13.860775+00	17	Newsletter object (17)	3		41	2
183	2019-12-24 06:38:01.499269+00	71	Newsletter object (71)	3		41	2
184	2019-12-24 06:38:01.592853+00	70	Newsletter object (70)	3		41	2
185	2019-12-24 06:46:13.073836+00	69	Newsletter object (69)	3		41	2
186	2019-12-24 06:52:10.650944+00	74	Newsletter object (74)	3		41	2
187	2019-12-24 06:53:21.050819+00	75	Newsletter object (75)	3		41	2
188	2019-12-24 07:18:04.610428+00	91	Newsletter object (91)	3		41	2
189	2019-12-24 07:18:04.660126+00	90	Newsletter object (90)	3		41	2
190	2019-12-24 07:18:04.693309+00	89	Newsletter object (89)	3		41	2
191	2019-12-24 07:18:04.726586+00	88	Newsletter object (88)	3		41	2
192	2019-12-24 07:18:04.759615+00	87	Newsletter object (87)	3		41	2
193	2019-12-24 07:18:04.792914+00	86	Newsletter object (86)	3		41	2
194	2019-12-24 07:18:04.826078+00	85	Newsletter object (85)	3		41	2
195	2019-12-24 07:18:04.859092+00	84	Newsletter object (84)	3		41	2
196	2019-12-24 07:18:04.892283+00	83	Newsletter object (83)	3		41	2
197	2019-12-24 07:18:04.925617+00	82	Newsletter object (82)	3		41	2
198	2019-12-24 07:18:04.958927+00	81	Newsletter object (81)	3		41	2
199	2019-12-24 07:18:04.992237+00	80	Newsletter object (80)	3		41	2
200	2019-12-24 07:18:05.025334+00	79	Newsletter object (79)	3		41	2
201	2019-12-24 07:18:05.058425+00	78	Newsletter object (78)	3		41	2
202	2019-12-24 07:18:05.091599+00	77	Newsletter object (77)	3		41	2
203	2019-12-24 07:18:05.124778+00	76	Newsletter object (76)	3		41	2
204	2019-12-24 07:18:05.158047+00	73	Newsletter object (73)	3		41	2
205	2019-12-24 07:18:05.19123+00	72	Newsletter object (72)	3		41	2
206	2019-12-24 07:39:54.917331+00	92	Newsletter object (92)	3		41	2
207	2019-12-24 08:19:38.410104+00	2	Rohan	2	[{"changed": {"fields": ["image"]}}]	1	2
208	2019-12-24 08:28:19.625049+00	3	Smith	3		1	2
209	2019-12-24 08:31:39.151991+00	4	Testing	3		1	2
210	2019-12-24 08:47:11.179005+00	8	Test12345	3		1	2
211	2019-12-24 08:47:11.19098+00	7	Test123	3		1	2
212	2019-12-24 08:47:11.202384+00	6	Testing1234	3		1	2
213	2019-12-24 08:47:11.213167+00	5	Testing123	3		1	2
214	2019-12-24 10:04:04.372423+00	1	yash	2	[{"changed": {"fields": ["image"]}}]	1	2
215	2019-12-24 10:04:34.517945+00	12	Smith	2	[{"changed": {"fields": ["user", "mobile_no"]}}]	1	2
216	2019-12-24 11:09:26.943368+00	11	kakkl	3		5	2
217	2019-12-24 11:09:26.97819+00	12	kakklqwqw	3		5	2
218	2019-12-24 11:09:26.989224+00	13	kakklqwqwqw	3		5	2
219	2019-12-24 11:09:27.000498+00	3	Rohan	3		5	2
220	2019-12-24 11:09:27.011345+00	8	Test123	3		5	2
221	2019-12-24 11:09:27.022454+00	9	Test12345	3		5	2
222	2019-12-24 11:09:27.03351+00	5	Testing	3		5	2
223	2019-12-24 11:09:27.044536+00	6	Testing123	3		5	2
224	2019-12-24 11:09:27.055639+00	7	Testing1234	3		5	2
225	2019-12-24 11:09:27.066891+00	10	Testing123456	3		5	2
226	2019-12-24 11:15:33.147539+00	4	Smith	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	5	2
227	2019-12-24 11:26:38.919266+00	12	Smith	2	[{"changed": {"fields": ["fullName"]}}]	1	4
228	2019-12-25 16:32:06.657628+00	116	Newsletter object (116)	3		41	2
229	2019-12-25 16:32:06.770873+00	115	Newsletter object (115)	3		41	2
230	2019-12-25 16:32:06.782015+00	114	Newsletter object (114)	3		41	2
231	2019-12-25 16:32:06.79303+00	113	Newsletter object (113)	3		41	2
232	2019-12-25 16:32:06.837458+00	112	Newsletter object (112)	3		41	2
233	2019-12-25 16:32:06.848541+00	111	Newsletter object (111)	3		41	2
234	2019-12-25 16:32:06.859622+00	110	Newsletter object (110)	3		41	2
235	2019-12-25 16:32:06.881317+00	109	Newsletter object (109)	3		41	2
236	2019-12-25 16:32:06.892538+00	108	Newsletter object (108)	3		41	2
237	2019-12-25 16:32:06.90375+00	107	Newsletter object (107)	3		41	2
238	2019-12-25 16:32:06.914821+00	106	Newsletter object (106)	3		41	2
239	2019-12-25 16:32:06.925903+00	105	Newsletter object (105)	3		41	2
240	2019-12-25 16:32:06.936956+00	104	Newsletter object (104)	3		41	2
241	2019-12-25 16:32:06.948028+00	103	Newsletter object (103)	3		41	2
242	2019-12-25 16:32:06.95906+00	102	Newsletter object (102)	3		41	2
243	2019-12-25 16:32:06.97032+00	101	Newsletter object (101)	3		41	2
244	2019-12-25 16:32:06.981284+00	100	Newsletter object (100)	3		41	2
245	2019-12-25 16:32:06.992046+00	99	Newsletter object (99)	3		41	2
246	2019-12-25 16:32:07.003077+00	98	Newsletter object (98)	3		41	2
247	2019-12-25 16:32:07.014125+00	97	Newsletter object (97)	3		41	2
248	2019-12-25 16:32:07.049846+00	96	Newsletter object (96)	3		41	2
249	2019-12-25 16:32:07.082495+00	95	Newsletter object (95)	3		41	2
250	2019-12-25 16:32:07.108948+00	94	Newsletter object (94)	3		41	2
251	2019-12-25 16:32:14.552087+00	93	Newsletter object (93)	2	[{"changed": {"fields": ["date"]}}]	41	2
252	2019-12-25 17:07:20.070478+00	1	yash	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	5	2
253	2020-01-07 17:10:45.389201+00	4	Exam :SEA-1	2	[{"changed": {"fields": ["examName"]}}]	32	1
254	2020-01-07 17:10:52.817174+00	3	Exam :SEA-2	2	[{"changed": {"fields": ["examName"]}}]	32	1
255	2020-01-07 17:11:17.439557+00	5	Exam :Annual	2	[{"changed": {"fields": ["examName"]}}]	32	1
256	2020-01-07 17:11:45.426595+00	6	Exam :Half Yearly	1	[{"added": {}}]	32	1
257	2020-01-07 17:12:16.156726+00	7	Exam :Note Book 1	1	[{"added": {}}]	32	1
258	2020-01-07 17:12:28.722339+00	7	Exam :Note Book-1	2	[{"changed": {"fields": ["examName"]}}]	32	1
259	2020-01-07 17:12:43.287043+00	8	Exam :Note Book-2	1	[{"added": {}}]	32	1
260	2020-01-07 17:14:42.902888+00	8	Exam :Note Book-1 ExamType:Theory	1	[{"added": {}}]	34	1
261	2020-01-07 17:14:57.07902+00	9	Exam :Note Book-2 ExamType:Theory	1	[{"added": {}}]	34	1
262	2020-01-07 17:35:41.17161+00	6	Exam :Half Yearly	2	[]	32	1
263	2020-01-07 17:36:06.56576+00	10	Exam :Half Yearly ExamType:Theory	1	[{"added": {}}]	34	1
264	2020-01-07 18:03:29.174787+00	6	Exam :Half-Yearly	2	[{"changed": {"fields": ["examName"]}}]	32	1
265	2020-01-12 07:07:46.336188+00	4	Class:6-A| Student:Suman Thakur 32000 Sept	3		48	1
266	2020-01-12 07:07:56.468492+00	3	Class:6-A| Student:Suman Thakur 32000 Sept	3		48	1
267	2020-01-12 07:09:35.805878+00	5	Class:6-A| Student:Suman Thakur 32000 Sept	3		48	1
268	2020-01-17 18:17:47.309816+00	899	Name:ShubhamShahi| Cateogry:driver| Emp.ID: 899	2	[{"changed": {"fields": ["empCategory"]}}]	18	1
269	2020-01-19 06:27:39.576583+00	3	Vehicle object (3)	1	[{"added": {}}]	54	1
270	2020-01-19 10:44:35.895182+00	3	Vehicle object (3)	2	[{"changed": {"fields": ["insurance_company"]}}]	54	1
271	2020-01-19 19:42:15.036373+00	2231	StudentRoute object (2231)	1	[{"added": {}}]	55	1
272	2020-01-20 17:16:45.236692+00	1	Routes object (1)	1	[{"added": {}}]	53	1
273	2020-01-20 17:17:03.867864+00	323198964	StudentRoute object (323198964)	1	[{"added": {}}]	55	1
274	2020-01-20 17:29:33.792675+00	8	Class:6-A| Student:Ashok Sinha	1	[{"added": {}}]	22	1
275	2020-01-21 17:59:45.990277+00	2	Visitor object (2)	3		57	1
276	2020-01-21 18:35:25.438867+00	1	Visitor object (1)	2	[{"changed": {"fields": ["photo", "document"]}}]	57	1
277	2020-01-21 18:35:49.201645+00	3	Visitor object (3)	2	[{"changed": {"fields": ["photo"]}}]	57	1
278	2020-01-22 16:25:10.786137+00	1	yash	2	[{"changed": {"fields": ["user_type"]}}]	1	1
279	2020-01-22 18:00:32.240853+00	1	Teacher	2	[{"changed": {"fields": ["password"]}}]	5	2
280	2020-01-22 18:13:03.77736+00	13	admin	1	[{"added": {}}]	1	2
281	2020-01-22 18:13:34.634447+00	13	admin	2	[{"changed": {"fields": ["user_type"]}}]	1	2
282	2020-01-22 19:19:16.248036+00	1	Teacher	2	[{"changed": {"fields": ["emp_id"]}}]	1	1
283	2020-01-23 18:18:23.257748+00	14	Student	1	[{"added": {}}]	5	1
284	2020-01-23 18:19:49.161521+00	14	Student	1	[{"added": {}}]	1	1
285	2020-01-23 19:11:30.679096+00	2	StudentLeave object (2)	1	[{"added": {}}]	58	1
286	2020-01-23 19:48:01.140535+00	2	StudentLeave object (2)	2	[{"changed": {"fields": ["approved"]}}]	58	1
287	2020-01-23 19:48:07.023967+00	1	StudentLeave object (1)	2	[{"changed": {"fields": ["approved"]}}]	58	1
288	2020-01-23 19:48:19.501293+00	1	StudentLeave object (1)	2	[{"changed": {"fields": ["approved"]}}]	58	1
289	2020-01-23 19:48:52.787878+00	1	StudentLeave object (1)	2	[{"changed": {"fields": ["rejected"]}}]	58	1
290	2020-01-23 19:48:58.583787+00	2	StudentLeave object (2)	2	[{"changed": {"fields": ["approved"]}}]	58	1
291	2020-01-23 19:54:43.655888+00	2	StudentLeave object (2)	2	[{"changed": {"fields": ["description"]}}]	58	1
292	2020-01-23 20:00:55.249438+00	13	admin	2	[{"changed": {"fields": ["user_type"]}}]	1	2
293	2020-01-24 15:48:33.353878+00	14	Student	2	[{"changed": {"fields": ["is_superuser"]}}]	5	2
294	2020-01-24 16:34:01.888956+00	14	Student	2	[{"changed": {"fields": ["is_staff"]}}]	5	2
295	2020-01-24 17:04:55.978465+00	2	ClassNotice object (2)	2	[{"changed": {"fields": ["notice"]}}]	38	14
296	2020-01-24 17:05:02.631516+00	1	ClassNotice object (1)	2	[{"changed": {"fields": ["notice"]}}]	38	14
297	2020-01-24 17:05:21.014203+00	1	ClassNotice object (1)	2	[{"changed": {"fields": ["notice"]}}]	38	14
298	2020-01-24 17:51:52.948526+00	2	ClassNotice object (2)	2	[{"changed": {"fields": ["notice_document"]}}]	38	14
299	2020-01-24 18:29:24.846491+00	1	Syllabus object (1)	1	[{"added": {}}]	50	14
300	2020-01-25 06:44:37.884086+00	1233	Routes object (1233)	2	[{"changed": {"fields": ["vehicle"]}}]	53	14
301	2020-01-25 06:44:44.033602+00	1	Routes object (1)	2	[{"changed": {"fields": ["vehicle"]}}]	53	14
302	2020-01-25 06:45:05.786587+00	899	Driver object (899)	2	[{"changed": {"fields": ["vehicle"]}}]	52	14
303	2020-01-25 12:19:23.884673+00	1	Photo object (1)	1	[{"added": {}}]	61	14
304	2020-01-25 12:19:31.733407+00	2	Photo object (2)	1	[{"added": {}}]	61	14
305	2020-01-25 12:19:47.897665+00	3	Photo object (3)	1	[{"added": {}}]	61	14
306	2020-01-25 17:16:22.757115+00	22	Name:Suman Thakur| Date:2020-01-25 | Status:Absent	1	[{"added": {}}]	23	2
307	2020-01-25 17:16:37.950612+00	23	Name:Suman Thakur| Date:2020-01-01 | Status:Present	1	[{"added": {}}]	23	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	accounts	userprofile
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
8	form	studentinfo
9	form	parentinfo
10	form	documents
11	form	currentaddress
12	form	permanentaddress
13	teacherform	employeedocuments
14	teacherform	employee
15	teacherform	teacher
16	employeeform	teacher
17	employeeform	employeedocuments
18	employeeform	employee
19	employeeform	permanentaddress
20	employeeform	currentaddress
21	classform	classroom
22	classform	classroomstudent
23	attendence	studentattendence
24	attendence	teacherattendence
25	marks	examtype
26	marks	subjectstoclass
27	marks	marks
28	marks	exam
29	marks	exammapping
30	marks	additionalsubject
31	markssection	marks
32	markssection	exam
33	markssection	exammapping
34	markssection	examtype
35	markssection	additionalsubject
36	markssection	additionalsubjectmapping
37	homework	homework
38	notice	classnotice
39	notice	studentnotice
40	dailythought	thoughts
41	newsletter	newsletter
42	schoolinfo	schoolinfo
43	holiday	holiday
44	fees	feecategory
45	fees	feecycle
46	fees	feediscount
47	fees	fine
48	fees	fee
49	fees	classsectionfees
50	homework	syllabus
51	classform	reportcard
52	transport	driver
53	transport	routes
54	transport	vehicle
55	form	studentroute
56	classform	studentrouteattendence
57	visitors	visitor
58	leave	studentleave
59	leave	employeeleave
60	gallery	album
61	gallery	photo
62	gallery	video
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-03 06:38:19.830653+00
2	auth	0001_initial	2019-12-03 06:38:20.198801+00
3	accounts	0001_initial	2019-12-03 06:38:20.837133+00
4	accounts	0002_auto_20191202_1037	2019-12-03 06:38:20.98694+00
5	admin	0001_initial	2019-12-03 06:38:21.118142+00
6	admin	0002_logentry_remove_auto_add	2019-12-03 06:38:21.238454+00
7	admin	0003_logentry_add_action_flag_choices	2019-12-03 06:38:21.270029+00
8	contenttypes	0002_remove_content_type_name	2019-12-03 06:38:21.315389+00
9	auth	0002_alter_permission_name_max_length	2019-12-03 06:38:21.337847+00
10	auth	0003_alter_user_email_max_length	2019-12-03 06:38:21.368507+00
11	auth	0004_alter_user_username_opts	2019-12-03 06:38:21.400553+00
12	auth	0005_alter_user_last_login_null	2019-12-03 06:38:21.419576+00
13	auth	0006_require_contenttypes_0002	2019-12-03 06:38:21.429578+00
14	auth	0007_alter_validators_add_error_messages	2019-12-03 06:38:21.46006+00
15	auth	0008_alter_user_username_max_length	2019-12-03 06:38:21.528431+00
16	auth	0009_alter_user_last_name_max_length	2019-12-03 06:38:21.558244+00
17	auth	0010_alter_group_name_max_length	2019-12-03 06:38:21.589089+00
18	auth	0011_update_proxy_permissions	2019-12-03 06:38:21.610388+00
19	sessions	0001_initial	2019-12-03 06:38:21.695526+00
20	form	0001_initial	2019-12-03 09:45:02.038996+00
21	form	0002_auto_20191204_1534	2019-12-04 10:04:48.559332+00
22	form	0003_auto_20191204_1656	2019-12-04 11:26:51.125674+00
23	form	0004_studentinfo_fname	2019-12-04 12:21:26.200659+00
24	form	0005_auto_20191204_1803	2019-12-04 12:33:45.888357+00
25	form	0006_auto_20191204_2230	2019-12-04 17:00:32.022084+00
26	form	0007_auto_20191204_2234	2019-12-04 17:04:43.976883+00
27	form	0008_currentaddress_city	2019-12-04 19:50:26.538903+00
28	form	0009_auto_20191205_0127	2019-12-04 19:57:33.324896+00
29	teacherform	0001_initial	2019-12-05 11:21:18.625715+00
30	employeeform	0001_initial	2019-12-06 07:35:01.685337+00
31	employeeform	0002_currentaddress_permanentaddress	2019-12-06 09:34:42.273471+00
32	employeeform	0003_auto_20191206_1619	2019-12-06 10:49:45.201609+00
33	form	0010_auto_20191206_1628	2019-12-06 10:59:02.936836+00
34	employeeform	0004_auto_20191206_1630	2019-12-06 11:00:37.214343+00
35	classform	0001_initial	2019-12-07 09:31:31.682729+00
36	employeeform	0005_auto_20191209_1730	2019-12-09 12:00:50.349272+00
37	attendence	0001_initial	2019-12-09 12:00:51.355304+00
38	classform	0002_auto_20191209_2352	2019-12-09 18:22:49.774506+00
39	classform	0003_auto_20191210_0002	2019-12-09 18:32:10.116961+00
40	classform	0004_auto_20191210_0011	2019-12-09 18:42:01.883328+00
41	attendence	0002_auto_20191210_1307	2019-12-10 07:37:36.597976+00
42	attendence	0003_auto_20191210_1737	2019-12-10 12:07:57.832733+00
43	attendence	0004_auto_20191210_2341	2019-12-10 18:11:17.33577+00
44	marks	0001_initial	2019-12-11 20:00:57.477451+00
45	marks	0002_auto_20191213_1719	2019-12-13 11:49:54.244371+00
46	markssection	0001_initial	2019-12-13 11:54:48.637545+00
47	markssection	0002_marks_examname	2019-12-13 13:03:20.095388+00
48	markssection	0003_auto_20191213_2340	2019-12-13 18:10:29.115281+00
49	homework	0001_initial	2019-12-18 07:20:48.724438+00
50	notice	0001_initial	2019-12-18 08:52:37.884812+00
51	dailythought	0001_initial	2019-12-19 07:50:44.575603+00
52	newsletter	0001_initial	2019-12-19 08:47:48.967396+00
53	newsletter	0002_auto_20191219_1419	2019-12-19 08:49:15.405205+00
54	newsletter	0003_auto_20191219_1420	2019-12-19 08:50:21.058556+00
55	schoolinfo	0001_initial	2019-12-19 10:35:18.466848+00
56	schoolinfo	0002_auto_20191219_1605	2019-12-19 10:35:18.50683+00
57	holiday	0001_initial	2019-12-19 11:56:27.569884+00
58	fees	0001_initial	2019-12-20 11:26:55.13996+00
59	newsletter	0004_auto_20191220_1656	2019-12-20 11:26:55.747336+00
60	fees	0002_auto_20191221_1512	2019-12-21 09:43:01.728073+00
61	newsletter	0005_auto_20191221_1512	2019-12-21 09:43:02.132809+00
62	newsletter	0005_auto_20191221_2021	2019-12-23 16:47:47.453213+00
63	newsletter	0006_auto_20191221_2047	2019-12-23 16:47:47.620493+00
64	newsletter	0007_merge_20191223_2217	2019-12-23 16:47:47.635334+00
65	accounts	0003_userprofile_image	2019-12-24 07:50:35.513395+00
66	fees	0003_fine_submissiondate	2019-12-24 07:50:36.620064+00
67	newsletter	0008_auto_20191224_1320	2019-12-24 07:50:36.648315+00
68	accounts	0004_auto_20191224_1412	2019-12-24 08:42:12.6633+00
69	accounts	0005_auto_20191224_1638	2019-12-24 11:08:57.59977+00
70	accounts	0006_userprofile_fullname	2019-12-24 11:23:22.837985+00
71	form	0011_remove_parentinfo_gaurdianname	2019-12-24 20:12:02.712169+00
72	newsletter	0007_merge_20191223_1057	2019-12-24 20:12:03.023635+00
73	newsletter	0008_auto_20191223_1057	2019-12-24 20:12:03.135603+00
74	newsletter	0009_merge_20191225_0141	2019-12-24 20:12:03.148927+00
75	form	0012_auto_20191225_2229	2019-12-25 16:59:30.813762+00
76	homework	0002_syllabus	2019-12-25 16:59:31.550471+00
77	fees	0004_fee_feeslip	2020-01-11 18:02:10.077918+00
78	classform	0005_reportcard	2020-01-12 07:24:28.273902+00
79	transport	0001_initial	2020-01-16 18:42:58.431806+00
80	transport	0002_vehicle_service_date	2020-01-17 17:23:54.72671+00
81	transport	0003_auto_20200118_1138	2020-01-18 06:08:55.465855+00
82	transport	0004_auto_20200118_1141	2020-01-18 06:11:25.924134+00
83	form	0013_studentroute	2020-01-18 07:06:18.701966+00
84	form	0014_delete_studentroute	2020-01-19 19:40:00.11844+00
85	form	0015_studentroute	2020-01-19 19:40:44.384606+00
86	classform	0006_studentrouteattendence	2020-01-19 20:04:33.794983+00
87	classform	0007_auto_20200121_2327	2020-01-21 17:57:40.326464+00
88	visitors	0001_initial	2020-01-21 17:57:41.277864+00
89	accounts	0007_auto_20200122_2010	2020-01-22 14:40:14.994414+00
90	visitors	0002_auto_20200122_2010	2020-01-22 14:40:15.248125+00
91	leave	0001_initial	2020-01-22 17:58:42.488318+00
92	visitors	0003_auto_20200122_2328	2020-01-22 17:58:42.964977+00
93	accounts	0008_auto_20200123_0048	2020-01-22 19:18:12.560803+00
94	visitors	0004_auto_20200123_0048	2020-01-22 19:18:12.636639+00
95	leave	0002_auto_20200124_0025	2020-01-23 18:55:14.744405+00
96	visitors	0005_auto_20200124_0025	2020-01-23 18:55:14.842391+00
97	leave	0003_auto_20200124_0049	2020-01-23 19:19:44.192401+00
98	visitors	0006_auto_20200124_0049	2020-01-23 19:19:44.247566+00
99	gallery	0001_initial	2020-01-23 20:34:15.08381+00
100	visitors	0007_auto_20200124_0204	2020-01-23 20:34:15.159386+00
101	gallery	0002_auto_20200125_1155	2020-01-25 06:25:48.56066+00
102	transport	0005_auto_20200125_1200	2020-01-25 06:30:26.184705+00
103	visitors	0008_auto_20200125_1155	2020-01-25 06:30:26.294705+00
104	visitors	0009_auto_20200125_1158	2020-01-25 06:30:26.32854+00
105	visitors	0010_auto_20200125_1200	2020-01-25 06:30:26.345115+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
cois2qxzv7bjwhag2wlrgt0otvb80t79	NjkyMGJhYzZiYzU5ZWE0NTJmZTI5OWQxZjU3NDM1NzBhNjU0NGE1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDk1ODlmNDZkMjI0Zjc1YTZjNTYwOTVhZDE0NDdiNDBlNjY4ZDVmOSJ9	2020-02-08 17:24:49.828912+00
azgkr0emzy4vcu4fevabf9x8a4p299w4	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:42:36.547035+00
4u8s6xbhnx8tslywobqfrhu3zkjbfzf1	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:44:58.656373+00
rl9itx9w57tddbug8d59ta151t5n8gvp	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:45:31.572683+00
5pim89hg8ejuvibd95cu4m226cwsm1pq	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:50:33.060822+00
i1fvoj2x1ph1h73f5befzfx50yz2hkgs	ODAyMDJmMjExZGM0MGRmNDQ0MzJmZTk0YjhiNGRmOTMxYzlhZjU5ZDp7fQ==	2020-01-07 08:52:16.08979+00
\.


--
-- Data for Name: employeeform_currentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_currentaddress (employee_id, "Address", "Address1", "Address2", "zipCode", state, city) FROM stdin;
101010				0		
10101012				0		
4451212				0		
45465456				0		
\.


--
-- Data for Name: employeeform_employee; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_employee ("empID", "firstName", "lastName", "fullName", father_name, mother_name, "partnerName", gender, email, "currentAddress", "permanentAddress", dob, "joiningDate", "bloodGroup", mobile_number, marital_status, experience, "aadharNumber", "empCategory") FROM stdin;
1223	Rohan	Pawar	RohanPawar	Ramesh	Radha	Priya	Male	sdsdds@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	2 years	13133126	teacher
6577	Kartik	Singh	KartikSingh	Ramesh	Radha	Priya	Male	sdsdds@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	2 years	13133126	teacher
89	Aryan	Tukrul	AryanTukrul	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	teacher
89999	Aryan	Tukrul	AryanTukrul	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	teacher
78788	Aryan	Tukrul	AryanTukrul	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	teacher
786	Aakash	Boura	AakashBoura	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	manager
101010	Jainaish	Thakur	Jainaish Thakur	wewewewewew	wewewewe	wewewe	Male	sdsd@gmail.com	wewee ewewe,Mumbai,Maharashtra-420123	wewee ewewe,Mumbai,Maharashtra-420123	2019-12-25	2019-11-25	B+	4646464646	Unmarried	8 years	131313131	teacher
10101012	Jainaish	Thakur	Jainaish Thakur	wewewewewew	wewewewe	wewewe	Male	sdsd@gmail.com	wewee ewewe,Mumbai,Maharashtra-420123	wewee ewewe,Mumbai,Maharashtra-420123	2019-12-25	2019-11-25	B+	4646464646	Unmarried	8 years	131313131	teacher
445454											\N	\N		0			0	
4451212	test	test	test test	uyuyu	yuyuy	uyuyuy	Male	aa@gmail.com	yuuyuy uyuy,yuyuy,yuyu-yuy	yuuyuy uyuy,yuyuy,yuyu-yuy	2019-11-26	2019-12-02	A	45465464	qwqw	yuuyuy	46546546464	receptionist
45465456	test2	test2	test2 test2	kjjkj	jkjkj	jkjkj	Male	aa@gmail.com	jkkjk jkj,jkjk,jkkjk-jkj	jkkjk jkj,jkjk,jkkjk-jkj	2019-12-10	2019-12-09	A	31212121	kjkj	jkjkj	546464646	coordinator
899	Shubham	Shahi	ShubhamShahi	Sachin	Priya	Priya	Female	ewqeqwe@gmail.com	wer,ererer aswewewe,Mumbai,Maharashtra-420123	wer,ererer aswewewe,Mumbai,Maharashtra-420123	2019-11-24	2019-12-09	A+	31323226	Married	5 years	13133126	driver
\.


--
-- Data for Name: employeeform_employeedocuments; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_employeedocuments (employee_id, photo, "qualificationDoc", "IdProof", "addressProof", "otherDoc") FROM stdin;
1223	uploads/emp/photograph/Blazer.jpg	uploads/emp/qualificationDocs/mobile.jpg	uploads/emp/idProof/shirt.jpg	uploads/emp/addressProof/USB.jpg	uploads/emp/otherDoc/jeans.jpg
6577	uploads/emp/photograph/Blazer_8LqQFDd.jpg	uploads/emp/qualificationDocs/mobile_ZRQqISG.jpg	uploads/emp/idProof/shirt_a1gLma8.jpg	uploads/emp/addressProof/USB_hC0NQHw.jpg	uploads/emp/otherDoc/jeans_p8u7ODp.jpg
899	uploads/emp/photograph/Blazer_4YzoY1D.jpg	uploads/emp/qualificationDocs/mobile_Okaa7Yw.jpg	uploads/emp/idProof/shirt_bPWp85W.jpg	uploads/emp/addressProof/USB_Mtf3VbN.jpg	uploads/emp/otherDoc/jeans_viSsUqq.jpg
89	uploads/emp/photograph/Blazer_oXDBYyi.jpg	uploads/emp/qualificationDocs/mobile_qp4gBS8.jpg	uploads/emp/idProof/shirt_MurkfaR.jpg	uploads/emp/addressProof/USB_x7nwVMb.jpg	uploads/emp/otherDoc/jeans_kjqnppq.jpg
89999	uploads/emp/photograph/Blazer_kF86ugO.jpg	uploads/emp/qualificationDocs/mobile_3a0sILN.jpg	uploads/emp/idProof/shirt_ZlLdncs.jpg	uploads/emp/addressProof/USB_rR4ohcC.jpg	uploads/emp/otherDoc/jeans_t9ANcNr.jpg
78788	uploads/emp/photograph/Blazer_RcCM1gs.jpg	uploads/emp/qualificationDocs/mobile_FNf86sY.jpg	uploads/emp/idProof/shirt_X1Vt9hz.jpg	uploads/emp/addressProof/USB_nKn5xjW.jpg	uploads/emp/otherDoc/jeans_xeB2fsX.jpg
786	uploads/emp/photograph/Blazer_7faKlTx.jpg	uploads/emp/qualificationDocs/mobile_W6pKLZK.jpg	uploads/emp/idProof/shirt_Ve39DP5.jpg	uploads/emp/addressProof/USB_hhAErba.jpg	uploads/emp/otherDoc/jeans_bwdQoG7.jpg
10101012	uploads/emp/photograph/shirt.jpg	uploads/emp/qualificationDocs/bat.jpg	uploads/emp/idProof/shirt_1AkdrCo.jpg	uploads/emp/addressProof/bat.jpg	uploads/emp/otherDoc/bat.jpg
4451212	emp/test test/bat.jpg	emp/test test/bat_qYtvtYG.jpg	emp/test test/bat_kYWrH1f.jpg	emp/test test/bat_J89bs8c.jpg	emp/test test/bat_SlCtcfs.jpg
45465456	emp/test2 test2/bat.jpg	emp/test2 test2/bat_cqf3ATX.jpg	emp/test2 test2/bat_ISrmMO8.jpg	emp/test2 test2/bat_31EPcvS.jpg	emp/test2 test2/bat_NRohnvE.jpg
\.


--
-- Data for Name: employeeform_permanentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_permanentaddress (employee_id, "Address", "Address1", "Address2", "zipCode", state, city) FROM stdin;
101010				0		
10101012				0		
4451212				0		
45465456				0		
\.


--
-- Data for Name: employeeform_teacher; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.employeeform_teacher (employee_id, "firstName", "lastName", "fullName", specialization, designation, "classTeacher") FROM stdin;
1223	Rohan	Pawar	Rohan Pawar	sdsdsdsds	Ss	6-A
6577	Kartik	Singh	Kartik Singh	sdsdsdsd	Ss	6-C
10101012	Jainaish	Thakur	Jainaish Thakur	sdsdsdsd	464	6-B
\.


--
-- Data for Name: fees_classsectionfees; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_classsectionfees (id, fees, "classSection_id", "feeCategory_id") FROM stdin;
3	23231	1	3
4	121212	3	1
\.


--
-- Data for Name: fees_fee; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_fee (id, "regNo", payment_method, "submissionDate", "monthsPaid", "classSection_id", student_id, amount, "feeSlip") FROM stdin;
1	989898	uiuiu	2019-12-20	Jan,Feb	3	1	46567	
2	54545	nkkj	2019-11-13	Mar,Apr,Sep	3	3	4545	
6	12121	Check	2020-01-12	Sept	3	1	32000	fee-slip/2231/fee-slip_JKQv1r1
\.


--
-- Data for Name: fees_feecategory; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_feecategory (id, once, submission_type, description) FROM stdin;
1	t	once	sdsds
3	f	Monthly	aaaa
\.


--
-- Data for Name: fees_feecycle; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_feecycle (id, "lastSubmissionDate", "firstSubmissionDate", cycle) FROM stdin;
1	2019-12-27	2019-12-17	monthly
\.


--
-- Data for Name: fees_feediscount; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_feediscount (id, discount, category, description, total_off, student_id) FROM stdin;
13	5		sdsdsd	2304	1
14	5		sdsdsd	2304	1
15	5		sdsdsd	2304	1
\.


--
-- Data for Name: fees_fine; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.fees_fine (id, fine, category, description, student_id, "submissionDate") FROM stdin;
2	45454	tets	sdsdsd	1	2019-12-24
\.


--
-- Data for Name: form_currentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_currentaddress (student_id, "Address", "zipCode", state, city, "Address1", "Address2") FROM stdin;
122		0				
2231		0				
12345		0				
9766	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
19766	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
1	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
2	sdsdsd, sdsd	121212	asas	asasas	sdsdsd	sdsd
\.


--
-- Data for Name: form_documents; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_documents (student_id, photo, "idProof", "castCertificate", domicile, tc, "characterCertificate") FROM stdin;
122	uploads/photograph/bat.jpg	uploads/idProof/tabletennis.jpg	uploads/castCertificate/tabletennis.jpg	uploads/domicile/USB.jpg	uploads/tc/USB.jpg	uploads/characterCertificate/shirt.jpg
\.


--
-- Data for Name: form_parentinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_parentinfo (student_id, "fatherName", "motherName", "Fatherdob", "Motherdob", "MobileNumber", "altMobileNumber", "gaurdianQual", "guardianOccup", email, "motherQual", "motherOccup") FROM stdin;
122	asasas	asasas	2019-11-25	2019-11-25	4563	3449	asasas	asasas	asasas	asasas	
2231	suresh	priya	2019-12-24	2019-12-09	4654646465	4646464855	hjhjhjhj	ererererer	aysy@gmail.com	xcxcxcxcxc	
12345	suresh	priya	2019-12-24	2019-12-09	4654646465	4646464855	hjhjhjhj	ererererer	aysy@gmail.com	xcxcxcxcxc	
19766	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
1	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
2	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
9766	Raghav	Sita	2014-08-01	2014-12-12	23232323232	2323232323	klklklk	lkklklkl	df@gmail.com	dfdfdfdfd	dfdfdfdf
\.


--
-- Data for Name: form_permanentaddress; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_permanentaddress (student_id, "Address", "zipCode", state, city, "Address1", "Address2") FROM stdin;
122		0				
12345		0				
19766	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
2231	E 303, Something	401330	Maharashtra	Mumbai		
1	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
2	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
9766	sdsdsd, sdsd	121212	asasas	asas	sdsdsd	sdsd
\.


--
-- Data for Name: form_studentinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_studentinfo ("firstName", "lastName", gender, dob, "classSection", "admissionNumber", "mobileNumber", religion, caste, "tcNumber", "aadharNumber", "feeWaiverCategory", "siblingID", "prevSchoolName", "fullName") FROM stdin;
Soham	Singh	Male	2000-07-01		9766	5656565656	Hindu	Brahmin	464646	464646	hkhkhkh	23331		
asasas	asas	Male	2019-12-02	False	98	121212	asasas	asasas	456	56	asasas	34567	asasas	asasasas 
kartik	eret	Female	2019-12-02	False	988	121212	asasas	asasas	456	56	asasas	34567	asasas	kartik eret 
ramesh	singh	Male	2019-11-24	6-B	223	78965423198	Hindu	Brahman	454545454	546464646	Some Category	464646	euadsdcxvv	rameshsingh
Suman	Thakur	Male	2019-11-24	6-A	2231	78965423198	Hindu	Brahman	454545454	546464646	Some Category	464646	euadsdcxvv	Suman Thakur
yash	dff	Male	2019-12-02	6-C	122	121212	asasas	asasas	456	56	asasas	34567	asasas	yash dfs
			\N	6-A	4646464	0			0	0		0		
ramesh	singh	Male	2019-11-24	6-B	12345	78965423198	Hindu	Brahman	454545454	546464646	Some Category	464646	euadsdcxvv	rameshsingh
Ashok	Sinha	Male	2019-12-03	6-A	323198964	545454545	jljlj	jljlj	4646464	4646464	jkjkj	797979	asasas	Ashok Sinha
Ashok	Sinha	Male	2019-12-03	6-A	3231	545454545	jljlj	jljlj	4646464	4646464	jkjkj	797979	asasas	Ashok Sinha
Soham	Singh	Male	2000-07-01		19766	5656565656	Hindu	Brahmin	464646	464646	hkhkhkh	23331	sdsdsdsd	Soham Singh
Soham	Singh	Male	2000-07-01		1	5656565656	Hindu	Brahmin	464646	464646	hkhkhkh	23331	sdsdsdsd	Soham Singh
Dhruv	D’Sourza	Male	2001-05-01		2	1212121212	Muslim	Sdsd	464646	464646	hkhkhkh	23331	sdsdsdsd	Dhruv D’Sourza
\.


--
-- Data for Name: form_studentroute; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.form_studentroute (student_id, route_code, route_stoppage, shift) FROM stdin;
2231	123	Andheri	Morning
323198964	1	Dwarka	Evening
\.


--
-- Data for Name: gallery_album; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.gallery_album (id, album_name, file) FROM stdin;
\.


--
-- Data for Name: gallery_photo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.gallery_photo (id, photo_name, file) FROM stdin;
1	Mechanical	gallery/photos/Mechanical/mechanical.jpg
2	Image 2	gallery/photos/Image 2/whysection.jpg
3	image 3	gallery/photos/image 3/collegeabout.jpg
\.


--
-- Data for Name: gallery_video; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.gallery_video (id, video_name, file) FROM stdin;
\.


--
-- Data for Name: holiday_holiday; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.holiday_holiday (id, title, "startDate", "endDate") FROM stdin;
1	ssdsd	2019-12-02	2019-12-04
2	ssdsd	2019-12-02	2019-12-04
3	fdfdf	2019-12-02	2019-12-04
\.


--
-- Data for Name: homework_homework; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.homework_homework (id, description, subject, document, date_published, "classRoom_id") FROM stdin;
7	Something	English	homework/6-A/pip.txt	2019-12-18	3
8	dejvhjnvbn	Mathematics	homework/6-A/pip_AcUQsMI.txt	2019-12-18	3
10	asasas	Social Studies		2019-12-19	3
15	\r\n           \r\n          ghghg		homework/6-A/logo.png	2019-12-25	3
\.


--
-- Data for Name: homework_syllabus; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.homework_syllabus (id, description, document, date_published, "classRoom_id") FROM stdin;
1	Syllabus description Syllabus description Syllabus description Syllabus description Syllabus description Syllabus description	syllabus/6-A/mechanical.jpg	2020-01-24	3
\.


--
-- Data for Name: leave_employeeleave; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.leave_employeeleave (id, description, subject, date_from, date_to, employee_id, approved, rejected) FROM stdin;
1	Leave	Leave	2020-01-23	2020-01-24	101010	f	f
\.


--
-- Data for Name: leave_studentleave; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.leave_studentleave (id, description, subject, date_from, date_to, student_id, approved, rejected) FROM stdin;
1	Leave Description	Leave Reason 1	2020-01-01	2020-01-04	2231	f	f
2	Leave Description Leave Description Leave DescriptionLeave Description Leave DescriptionLeave DescriptionLeave DescriptionLeave Description	Medical	2020-01-24	2020-01-24	323198964	f	f
\.


--
-- Data for Name: markssection_additionalsubjectmapping; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_additionalsubjectmapping (id, subject, marks, "classroomStudent_id", "examName_id", "examType_id") FROM stdin;
1	Drawing	63	1	4	2
2	Drawing	68	1	3	5
3	Drawing	72	1	5	7
\.


--
-- Data for Name: markssection_exam; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_exam (id, "examName", description) FROM stdin;
1	UT-1	Unit Test
2	UT-2	Unit Test
4	SEA-1	half yearly exam
3	SEA-2	annual exam
5	Annual	Final Exam
7	Note Book-1	Note Book 1
8	Note Book-2	Note Book 2
6	Half-Yearly	Half Yearly Exam
\.


--
-- Data for Name: markssection_exammapping; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_exammapping (id, subject, classroom_id, "examName_id", "examType_id") FROM stdin;
1	English	3	2	1
3	Science	3	2	1
12	English	3	1	6
13	Science	3	1	6
15	Social Studies	3	1	6
11	Social Studies	3	4	2
10	Science	3	4	2
9	English	3	4	2
8	Mathematics	3	4	2
14	Mathematics	3	1	6
6	Social Studies	3	3	5
7	Mathematics	3	3	5
5	Science	3	3	5
4	English	3	3	5
2	Mathematics	3	2	1
16	Social Studies	3	2	1
17	English	3	5	7
18	Mathematics	3	5	7
19	Social Studies	3	5	7
20	Science	3	5	7
\.


--
-- Data for Name: markssection_examtype; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_examtype (id, "examType", "minMarks", "maxMarks", priority, "examName_id") FROM stdin;
5	Theory	24	80	3	3
6	Theory	8	20	\N	1
2	Theory	24	80	1	4
1	Theory	8	20	3	2
7	Theory	33	100	1	5
8	Theory	3	10	\N	7
9	Theory	2	10	\N	8
10	Theory	33	100	\N	6
\.


--
-- Data for Name: markssection_marks; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.markssection_marks (id, subject, marks, "classroomStudent_id", "examType_id", "examName_id") FROM stdin;
2	Science	45	2	1	2
3	Science	48	3	1	2
5	Science	68	1	5	3
6	Social Studies	75	1	5	3
8	Mathematics	65	1	5	3
9	English	15	1	1	2
1	Science	14	1	1	2
4	Mathematics	19	1	5	2
10	Social Studies	16	1	1	2
11	English	70	1	2	4
12	Social Studies	68	1	2	4
15	English	15	1	6	1
16	Social Studies	18	1	6	1
17	Science	14	1	6	1
18	Mathematics	12	1	6	1
14	Mathematics	23	1	2	4
7	English	19	1	5	3
13	Science	11	1	2	4
20	English	45	2	7	5
21	English	54	3	7	5
19	English	56	1	7	5
22	Science	74	1	7	5
23	Social Studies	69	1	7	5
24	Mathematics	62	1	7	5
\.


--
-- Data for Name: newsletter_newsletter; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.newsletter_newsletter (id, description, date) FROM stdin;
93	<div align="center"><i><b>\r\n       \r\n      This is sample news for testing</b></i></div><div align="left"><a href="https://www.google.com/">https://www.google.com/</a><i><b>. </b></i>This is a sample link<i><b>. <br></b></i></div><div align="left"><ul><li><i>Testing</i></li><li><i>Testing 2</i></li><li><i>Testing 3<b><br></b></i></li></ul></div>	2019-12-25
\.


--
-- Data for Name: notice_classnotice; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.notice_classnotice (id, notice, notice_document, "classRoom_id") FROM stdin;
1	Notice 2 sample notice text	notice/6-A/pip_zHyqtqm.txt	3
2	Notice 1 sample notice text	notice/6-A/whysection.jpg	3
\.


--
-- Data for Name: notice_studentnotice; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.notice_studentnotice (id, notice, notice_document, student_id) FROM stdin;
1	Testing	notice/2231/pip.txt	1
\.


--
-- Data for Name: schoolinfo_schoolinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.schoolinfo_schoolinfo ("schoolName", addresss, "principalName", email, city, state, "zipCode", "schoolID", longitude, latitude, "contactNumber", "webSiteURL", img, logo) FROM stdin;
asasas	jkjkj	asas	gh@gmail.com	kkjk	jkjk	545	78787	78	989	8989898	kjkhk	schoolInfo/asasas/try_IDd1vvB.py	schoolInfo/asasas/Screenshot_from_2019-11-22_22-07-42_oN3gKuU.png
\.


--
-- Data for Name: transport_driver; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.transport_driver (employee_id, driver_name, dob, license_no, mobile_no, batch_no, contact_address, permanent_address, "driverPic", "driverLicense", "driverID", vehicle_id) FROM stdin;
899	Shubham Shahi	2019-12-30	1132323	5656566565	122	wewewe	wewewe	emp/899/Fee_Recipt.xlsx	emp/899/Fee_Recipt_FJUNrbk.xlsx	emp/899/Fee_Recipt_jjeUH89.xlsx	1231
\.


--
-- Data for Name: transport_routes; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.transport_routes (route_code, start_place, end_place, shift_time, stoppage_names, stoppage_id, remarks, route_distance, longitude, lattitude, vehicle_id) FROM stdin;
123	Virar	Borivali	Morning	Vasai, Naigaon	1233	Remark	23	23.10	23.10	1231
1	Delhi	Delhi	Evening	Anyplace	1	adsdsd	12	21.20	31.10	1231
\.


--
-- Data for Name: transport_vehicle; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.transport_vehicle (vehicle_no, device_id, service_id, no_of_seat, maximum_allowed, vehicle_type, insurance_company, contact_person, insurance_date, permit_valid_date, pollution_cert_exp_date, fitness_service_date, service_date) FROM stdin;
1231	12321	123	23	23	Bus	Company	Ramesh	2019-12-31	2020-01-14	2020-02-05	2020-01-28	2020-01-28
686	2363	6532	45	40	Mini-Bus	Some Company	Sandeep	2020-01-19	2020-01-19	2020-01-19	2020-01-19	2020-01-19
\.


--
-- Data for Name: visitors_visitor; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.visitors_visitor (id, name, mobile_no, date_time, contact_to, address, purpose, photo, document) FROM stdin;
1	YAsh	65646464	2020-01-21 17:57:51+00	kjkjkh	sssf	khkhkhk	visitor/YAsh/whysection.jpg	visitor/YAsh/whysection_b7WELmr.jpg
3	YAsh	65646464	2020-01-21 17:59:19+00	kjkjkh	sssf	khkhkhk	visitor/YAsh/whysection_lcRiEWW.jpg	visitor/YAsh/YashBoura_Resume_COYzHFG.pdf
\.


--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 14, true);


--
-- Name: attendence_studentattendence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.attendence_studentattendence_id_seq', 23, true);


--
-- Name: attendence_teacherattendence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.attendence_teacherattendence_id_seq', 5, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 248, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 14, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: classform_classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_classroom_id_seq', 6, true);


--
-- Name: classform_classroomstudent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_classroomstudent_id_seq', 8, true);


--
-- Name: classform_reportcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_reportcard_id_seq', 1, false);


--
-- Name: classform_studentrouteattendence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.classform_studentrouteattendence_id_seq', 2, true);


--
-- Name: dailythought_thoughts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.dailythought_thoughts_id_seq', 19, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 307, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 62, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 105, true);


--
-- Name: fees_classsectionfees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_classsectionfees_id_seq', 4, true);


--
-- Name: fees_fee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_fee_id_seq', 6, true);


--
-- Name: fees_feecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_feecategory_id_seq', 3, true);


--
-- Name: fees_feecycle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_feecycle_id_seq', 1, true);


--
-- Name: fees_feediscount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_feediscount_id_seq', 15, true);


--
-- Name: fees_fine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.fees_fine_id_seq', 2, true);


--
-- Name: gallery_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.gallery_album_id_seq', 1, true);


--
-- Name: gallery_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.gallery_photo_id_seq', 3, true);


--
-- Name: gallery_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.gallery_video_id_seq', 2, true);


--
-- Name: holiday_holiday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.holiday_holiday_id_seq', 3, true);


--
-- Name: homework_homework_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.homework_homework_id_seq', 15, true);


--
-- Name: homework_syllabus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.homework_syllabus_id_seq', 1, true);


--
-- Name: leave_employeeleave_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.leave_employeeleave_id_seq', 1, true);


--
-- Name: leave_studentleave_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.leave_studentleave_id_seq', 2, true);


--
-- Name: markssection_additionalsubjectmapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_additionalsubjectmapping_id_seq', 3, true);


--
-- Name: markssection_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_exam_id_seq', 8, true);


--
-- Name: markssection_exammapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_exammapping_id_seq', 20, true);


--
-- Name: markssection_examtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_examtype_id_seq', 10, true);


--
-- Name: markssection_marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.markssection_marks_id_seq', 24, true);


--
-- Name: newsletter_newsletter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.newsletter_newsletter_id_seq', 116, true);


--
-- Name: notice_classnotice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.notice_classnotice_id_seq', 2, true);


--
-- Name: notice_studentnotice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.notice_studentnotice_id_seq', 1, true);


--
-- Name: visitors_visitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.visitors_visitor_id_seq', 3, true);


--
-- Name: accounts_userprofile accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: attendence_studentattendence attendence_studentattendence_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_studentattendence
    ADD CONSTRAINT attendence_studentattendence_pkey PRIMARY KEY (id);


--
-- Name: attendence_teacherattendence attendence_teacherattendence_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_teacherattendence
    ADD CONSTRAINT attendence_teacherattendence_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: classform_classroom classform_classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom
    ADD CONSTRAINT classform_classroom_pkey PRIMARY KEY (id);


--
-- Name: classform_classroom classform_classroom_teacher_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom
    ADD CONSTRAINT classform_classroom_teacher_id_key UNIQUE (teacher_id);


--
-- Name: classform_classroomstudent classform_classroomstudent_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT classform_classroomstudent_pkey PRIMARY KEY (id);


--
-- Name: classform_classroomstudent classform_classroomstudent_student_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT classform_classroomstudent_student_id_key UNIQUE (student_id);


--
-- Name: classform_reportcard classform_reportcard_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_reportcard
    ADD CONSTRAINT classform_reportcard_pkey PRIMARY KEY (id);


--
-- Name: classform_studentrouteattendence classform_studentrouteattendence_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_studentrouteattendence
    ADD CONSTRAINT classform_studentrouteattendence_pkey PRIMARY KEY (id);


--
-- Name: dailythought_thoughts dailythought_thoughts_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.dailythought_thoughts
    ADD CONSTRAINT dailythought_thoughts_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: employeeform_currentaddress employeeform_currentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_currentaddress
    ADD CONSTRAINT employeeform_currentaddress_pkey PRIMARY KEY (employee_id);


--
-- Name: employeeform_employee employeeform_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_employee
    ADD CONSTRAINT employeeform_employee_pkey PRIMARY KEY ("empID");


--
-- Name: employeeform_employeedocuments employeeform_employeedocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_employeedocuments
    ADD CONSTRAINT employeeform_employeedocuments_pkey PRIMARY KEY (employee_id);


--
-- Name: employeeform_permanentaddress employeeform_permanentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_permanentaddress
    ADD CONSTRAINT employeeform_permanentaddress_pkey PRIMARY KEY (employee_id);


--
-- Name: employeeform_teacher employeeform_teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_teacher
    ADD CONSTRAINT employeeform_teacher_pkey PRIMARY KEY (employee_id);


--
-- Name: fees_classsectionfees fees_classsectionfees_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees
    ADD CONSTRAINT fees_classsectionfees_pkey PRIMARY KEY (id);


--
-- Name: fees_fee fees_fee_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee
    ADD CONSTRAINT fees_fee_pkey PRIMARY KEY (id);


--
-- Name: fees_feecategory fees_feecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecategory
    ADD CONSTRAINT fees_feecategory_pkey PRIMARY KEY (id);


--
-- Name: fees_feecycle fees_feecycle_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feecycle
    ADD CONSTRAINT fees_feecycle_pkey PRIMARY KEY (id);


--
-- Name: fees_feediscount fees_feediscount_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feediscount
    ADD CONSTRAINT fees_feediscount_pkey PRIMARY KEY (id);


--
-- Name: fees_fine fees_fine_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fine
    ADD CONSTRAINT fees_fine_pkey PRIMARY KEY (id);


--
-- Name: form_currentaddress form_currentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_currentaddress
    ADD CONSTRAINT form_currentaddress_pkey PRIMARY KEY (student_id);


--
-- Name: form_documents form_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_documents
    ADD CONSTRAINT form_documents_pkey PRIMARY KEY (student_id);


--
-- Name: form_parentinfo form_parentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_parentinfo
    ADD CONSTRAINT form_parentinfo_pkey PRIMARY KEY (student_id);


--
-- Name: form_permanentaddress form_permanentaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_permanentaddress
    ADD CONSTRAINT form_permanentaddress_pkey PRIMARY KEY (student_id);


--
-- Name: form_studentinfo form_studentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_studentinfo
    ADD CONSTRAINT form_studentinfo_pkey PRIMARY KEY ("admissionNumber");


--
-- Name: form_studentroute form_studentroute_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_studentroute
    ADD CONSTRAINT form_studentroute_pkey PRIMARY KEY (student_id);


--
-- Name: gallery_album gallery_album_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.gallery_album
    ADD CONSTRAINT gallery_album_pkey PRIMARY KEY (id);


--
-- Name: gallery_photo gallery_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.gallery_photo
    ADD CONSTRAINT gallery_photo_pkey PRIMARY KEY (id);


--
-- Name: gallery_video gallery_video_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.gallery_video
    ADD CONSTRAINT gallery_video_pkey PRIMARY KEY (id);


--
-- Name: holiday_holiday holiday_holiday_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.holiday_holiday
    ADD CONSTRAINT holiday_holiday_pkey PRIMARY KEY (id);


--
-- Name: homework_homework homework_homework_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_homework
    ADD CONSTRAINT homework_homework_pkey PRIMARY KEY (id);


--
-- Name: homework_syllabus homework_syllabus_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_syllabus
    ADD CONSTRAINT homework_syllabus_pkey PRIMARY KEY (id);


--
-- Name: leave_employeeleave leave_employeeleave_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.leave_employeeleave
    ADD CONSTRAINT leave_employeeleave_pkey PRIMARY KEY (id);


--
-- Name: leave_studentleave leave_studentleave_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.leave_studentleave
    ADD CONSTRAINT leave_studentleave_pkey PRIMARY KEY (id);


--
-- Name: markssection_additionalsubjectmapping markssection_additionalsubjectmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT markssection_additionalsubjectmapping_pkey PRIMARY KEY (id);


--
-- Name: markssection_exam markssection_exam_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exam
    ADD CONSTRAINT markssection_exam_pkey PRIMARY KEY (id);


--
-- Name: markssection_exammapping markssection_exammapping_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT markssection_exammapping_pkey PRIMARY KEY (id);


--
-- Name: markssection_examtype markssection_examtype_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_examtype
    ADD CONSTRAINT markssection_examtype_pkey PRIMARY KEY (id);


--
-- Name: markssection_marks markssection_marks_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT markssection_marks_pkey PRIMARY KEY (id);


--
-- Name: newsletter_newsletter newsletter_newsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.newsletter_newsletter
    ADD CONSTRAINT newsletter_newsletter_pkey PRIMARY KEY (id);


--
-- Name: notice_classnotice notice_classnotice_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_classnotice
    ADD CONSTRAINT notice_classnotice_pkey PRIMARY KEY (id);


--
-- Name: notice_studentnotice notice_studentnotice_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_studentnotice
    ADD CONSTRAINT notice_studentnotice_pkey PRIMARY KEY (id);


--
-- Name: schoolinfo_schoolinfo schoolinfo_schoolinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.schoolinfo_schoolinfo
    ADD CONSTRAINT schoolinfo_schoolinfo_pkey PRIMARY KEY ("schoolID");


--
-- Name: transport_driver transport_driver_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_driver
    ADD CONSTRAINT transport_driver_pkey PRIMARY KEY (employee_id);


--
-- Name: transport_routes transport_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_routes
    ADD CONSTRAINT transport_routes_pkey PRIMARY KEY (stoppage_id);


--
-- Name: transport_vehicle transport_vehicle_vehicle_no_27389713_pk; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_vehicle
    ADD CONSTRAINT transport_vehicle_vehicle_no_27389713_pk PRIMARY KEY (vehicle_no);


--
-- Name: transport_vehicle transport_vehicle_vehicle_no_27389713_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_vehicle
    ADD CONSTRAINT transport_vehicle_vehicle_no_27389713_uniq UNIQUE (vehicle_no);


--
-- Name: visitors_visitor visitors_visitor_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.visitors_visitor
    ADD CONSTRAINT visitors_visitor_pkey PRIMARY KEY (id);


--
-- Name: attendence_studentattendence_student_id_3f6e948f; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX attendence_studentattendence_student_id_3f6e948f ON public.attendence_studentattendence USING btree (student_id);


--
-- Name: attendence_teacherattendence_teacher_id_3478c5fb; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX attendence_teacherattendence_teacher_id_3478c5fb ON public.attendence_teacherattendence USING btree (teacher_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: classform_classroomstudent_classRoom_id_f067618b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "classform_classroomstudent_classRoom_id_f067618b" ON public.classform_classroomstudent USING btree ("classRoom_id");


--
-- Name: classform_reportcard_class_room_student_id_08f4446a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX classform_reportcard_class_room_student_id_08f4446a ON public.classform_reportcard USING btree (class_room_student_id);


--
-- Name: classform_studentrouteattendence_student_id_a60d2530; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX classform_studentrouteattendence_student_id_a60d2530 ON public.classform_studentrouteattendence USING btree (student_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fees_classsectionfees_classSection_id_a29d9f99; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "fees_classsectionfees_classSection_id_a29d9f99" ON public.fees_classsectionfees USING btree ("classSection_id");


--
-- Name: fees_classsectionfees_feeCategory_id_0f8cfa84; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "fees_classsectionfees_feeCategory_id_0f8cfa84" ON public.fees_classsectionfees USING btree ("feeCategory_id");


--
-- Name: fees_fee_classSection_id_7c0b3dc5; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "fees_fee_classSection_id_7c0b3dc5" ON public.fees_fee USING btree ("classSection_id");


--
-- Name: fees_fee_student_id_664ca066; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX fees_fee_student_id_664ca066 ON public.fees_fee USING btree (student_id);


--
-- Name: fees_feediscount_student_id_d0d7a89a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX fees_feediscount_student_id_d0d7a89a ON public.fees_feediscount USING btree (student_id);


--
-- Name: fees_fine_student_id_bb221b6a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX fees_fine_student_id_bb221b6a ON public.fees_fine USING btree (student_id);


--
-- Name: homework_homework_classRoom_id_eec0049c; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "homework_homework_classRoom_id_eec0049c" ON public.homework_homework USING btree ("classRoom_id");


--
-- Name: homework_syllabus_classRoom_id_f958b607; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "homework_syllabus_classRoom_id_f958b607" ON public.homework_syllabus USING btree ("classRoom_id");


--
-- Name: leave_employeeleave_employee_id_a6e65c57; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX leave_employeeleave_employee_id_a6e65c57 ON public.leave_employeeleave USING btree (employee_id);


--
-- Name: leave_studentleave_student_id_598813f5; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX leave_studentleave_student_id_598813f5 ON public.leave_studentleave USING btree (student_id);


--
-- Name: markssection_additionalsub_classroomStudent_id_ea5fd49a; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_additionalsub_classroomStudent_id_ea5fd49a" ON public.markssection_additionalsubjectmapping USING btree ("classroomStudent_id");


--
-- Name: markssection_additionalsubjectmapping_examName_id_03059aa6; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_additionalsubjectmapping_examName_id_03059aa6" ON public.markssection_additionalsubjectmapping USING btree ("examName_id");


--
-- Name: markssection_additionalsubjectmapping_examType_id_9bff92ac; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_additionalsubjectmapping_examType_id_9bff92ac" ON public.markssection_additionalsubjectmapping USING btree ("examType_id");


--
-- Name: markssection_exammapping_classroom_id_926ae5dd; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX markssection_exammapping_classroom_id_926ae5dd ON public.markssection_exammapping USING btree (classroom_id);


--
-- Name: markssection_exammapping_examName_id_1828a436; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_exammapping_examName_id_1828a436" ON public.markssection_exammapping USING btree ("examName_id");


--
-- Name: markssection_exammapping_examType_id_e9df93e5; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_exammapping_examType_id_e9df93e5" ON public.markssection_exammapping USING btree ("examType_id");


--
-- Name: markssection_examtype_examName_id_39dd8ebe; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_examtype_examName_id_39dd8ebe" ON public.markssection_examtype USING btree ("examName_id");


--
-- Name: markssection_marks_classroomStudent_id_969d9022; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_marks_classroomStudent_id_969d9022" ON public.markssection_marks USING btree ("classroomStudent_id");


--
-- Name: markssection_marks_examName_id_9a0c8aa8; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_marks_examName_id_9a0c8aa8" ON public.markssection_marks USING btree ("examName_id");


--
-- Name: markssection_marks_examType_id_b678d74e; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "markssection_marks_examType_id_b678d74e" ON public.markssection_marks USING btree ("examType_id");


--
-- Name: notice_classnotice_classRoom_id_c977d857; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "notice_classnotice_classRoom_id_c977d857" ON public.notice_classnotice USING btree ("classRoom_id");


--
-- Name: notice_studentnotice_student_id_6137d249; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX notice_studentnotice_student_id_6137d249 ON public.notice_studentnotice USING btree (student_id);


--
-- Name: transport_driver_vehicle_id_e59a43bd; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX transport_driver_vehicle_id_e59a43bd ON public.transport_driver USING btree (vehicle_id);


--
-- Name: transport_routes_vehicle_id_1e85b02c; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX transport_routes_vehicle_id_1e85b02c ON public.transport_routes USING btree (vehicle_id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_92240672_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attendence_studentattendence attendence_studentat_student_id_3f6e948f_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_studentattendence
    ADD CONSTRAINT attendence_studentat_student_id_3f6e948f_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attendence_teacherattendence attendence_teacherat_teacher_id_3478c5fb_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.attendence_teacherattendence
    ADD CONSTRAINT attendence_teacherat_teacher_id_3478c5fb_fk_employeef FOREIGN KEY (teacher_id) REFERENCES public.employeeform_teacher(employee_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_classroom classform_classroom_teacher_id_38184a16_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroom
    ADD CONSTRAINT classform_classroom_teacher_id_38184a16_fk_employeef FOREIGN KEY (teacher_id) REFERENCES public.employeeform_teacher(employee_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_classroomstudent classform_classrooms_classRoom_id_f067618b_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT "classform_classrooms_classRoom_id_f067618b_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_classroomstudent classform_classrooms_student_id_7965796d_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_classroomstudent
    ADD CONSTRAINT classform_classrooms_student_id_7965796d_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_reportcard classform_reportcard_class_room_student_i_08f4446a_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_reportcard
    ADD CONSTRAINT classform_reportcard_class_room_student_i_08f4446a_fk_classform FOREIGN KEY (class_room_student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classform_studentrouteattendence classform_studentrou_student_id_a60d2530_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.classform_studentrouteattendence
    ADD CONSTRAINT classform_studentrou_student_id_a60d2530_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_currentaddress employeeform_current_employee_id_191a1e2b_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_currentaddress
    ADD CONSTRAINT employeeform_current_employee_id_191a1e2b_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_employeedocuments employeeform_employe_employee_id_f234cb72_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_employeedocuments
    ADD CONSTRAINT employeeform_employe_employee_id_f234cb72_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_permanentaddress employeeform_permane_employee_id_e69075c3_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_permanentaddress
    ADD CONSTRAINT employeeform_permane_employee_id_e69075c3_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeeform_teacher employeeform_teacher_employee_id_0c159000_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.employeeform_teacher
    ADD CONSTRAINT employeeform_teacher_employee_id_0c159000_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_classsectionfees fees_classsectionfee_classSection_id_a29d9f99_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees
    ADD CONSTRAINT "fees_classsectionfee_classSection_id_a29d9f99_fk_classform" FOREIGN KEY ("classSection_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_classsectionfees fees_classsectionfee_feeCategory_id_0f8cfa84_fk_fees_feec; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_classsectionfees
    ADD CONSTRAINT "fees_classsectionfee_feeCategory_id_0f8cfa84_fk_fees_feec" FOREIGN KEY ("feeCategory_id") REFERENCES public.fees_feecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_fee fees_fee_classSection_id_7c0b3dc5_fk_classform_classroom_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee
    ADD CONSTRAINT "fees_fee_classSection_id_7c0b3dc5_fk_classform_classroom_id" FOREIGN KEY ("classSection_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_fee fees_fee_student_id_664ca066_fk_classform_classroomstudent_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fee
    ADD CONSTRAINT fees_fee_student_id_664ca066_fk_classform_classroomstudent_id FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_feediscount fees_feediscount_student_id_d0d7a89a_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_feediscount
    ADD CONSTRAINT fees_feediscount_student_id_d0d7a89a_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fees_fine fees_fine_student_id_bb221b6a_fk_classform_classroomstudent_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.fees_fine
    ADD CONSTRAINT fees_fine_student_id_bb221b6a_fk_classform_classroomstudent_id FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_currentaddress form_currentaddress_student_id_3af6431c_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_currentaddress
    ADD CONSTRAINT form_currentaddress_student_id_3af6431c_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_documents form_documents_student_id_34de472a_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_documents
    ADD CONSTRAINT form_documents_student_id_34de472a_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_parentinfo form_parentinfo_student_id_0ab3a289_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_parentinfo
    ADD CONSTRAINT form_parentinfo_student_id_0ab3a289_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_permanentaddress form_permanentaddres_student_id_598730f4_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_permanentaddress
    ADD CONSTRAINT form_permanentaddres_student_id_598730f4_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: form_studentroute form_studentroute_student_id_8ad881cb_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.form_studentroute
    ADD CONSTRAINT form_studentroute_student_id_8ad881cb_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homework_homework homework_homework_classRoom_id_eec0049c_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_homework
    ADD CONSTRAINT "homework_homework_classRoom_id_eec0049c_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: homework_syllabus homework_syllabus_classRoom_id_f958b607_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.homework_syllabus
    ADD CONSTRAINT "homework_syllabus_classRoom_id_f958b607_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leave_employeeleave leave_employeeleave_employee_id_a6e65c57_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.leave_employeeleave
    ADD CONSTRAINT leave_employeeleave_employee_id_a6e65c57_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leave_studentleave leave_studentleave_student_id_598813f5_fk_form_stud; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.leave_studentleave
    ADD CONSTRAINT leave_studentleave_student_id_598813f5_fk_form_stud FOREIGN KEY (student_id) REFERENCES public.form_studentinfo("admissionNumber") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_additionalsubjectmapping markssection_additio_classroomStudent_id_ea5fd49a_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT "markssection_additio_classroomStudent_id_ea5fd49a_fk_classform" FOREIGN KEY ("classroomStudent_id") REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_additionalsubjectmapping markssection_additio_examName_id_03059aa6_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT "markssection_additio_examName_id_03059aa6_fk_markssect" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_additionalsubjectmapping markssection_additio_examType_id_9bff92ac_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_additionalsubjectmapping
    ADD CONSTRAINT "markssection_additio_examType_id_9bff92ac_fk_markssect" FOREIGN KEY ("examType_id") REFERENCES public.markssection_examtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_exammapping markssection_exammap_classroom_id_926ae5dd_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT markssection_exammap_classroom_id_926ae5dd_fk_classform FOREIGN KEY (classroom_id) REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_exammapping markssection_exammap_examName_id_1828a436_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT "markssection_exammap_examName_id_1828a436_fk_markssect" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_exammapping markssection_exammap_examType_id_e9df93e5_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_exammapping
    ADD CONSTRAINT "markssection_exammap_examType_id_e9df93e5_fk_markssect" FOREIGN KEY ("examType_id") REFERENCES public.markssection_examtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_examtype markssection_examtyp_examName_id_39dd8ebe_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_examtype
    ADD CONSTRAINT "markssection_examtyp_examName_id_39dd8ebe_fk_markssect" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_marks markssection_marks_classroomStudent_id_969d9022_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT "markssection_marks_classroomStudent_id_969d9022_fk_classform" FOREIGN KEY ("classroomStudent_id") REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_marks markssection_marks_examName_id_9a0c8aa8_fk_markssection_exam_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT "markssection_marks_examName_id_9a0c8aa8_fk_markssection_exam_id" FOREIGN KEY ("examName_id") REFERENCES public.markssection_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: markssection_marks markssection_marks_examType_id_b678d74e_fk_markssect; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.markssection_marks
    ADD CONSTRAINT "markssection_marks_examType_id_b678d74e_fk_markssect" FOREIGN KEY ("examType_id") REFERENCES public.markssection_examtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notice_classnotice notice_classnotice_classRoom_id_c977d857_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_classnotice
    ADD CONSTRAINT "notice_classnotice_classRoom_id_c977d857_fk_classform" FOREIGN KEY ("classRoom_id") REFERENCES public.classform_classroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notice_studentnotice notice_studentnotice_student_id_6137d249_fk_classform; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.notice_studentnotice
    ADD CONSTRAINT notice_studentnotice_student_id_6137d249_fk_classform FOREIGN KEY (student_id) REFERENCES public.classform_classroomstudent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: transport_driver transport_driver_employee_id_c69d8019_fk_employeef; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.transport_driver
    ADD CONSTRAINT transport_driver_employee_id_c69d8019_fk_employeef FOREIGN KEY (employee_id) REFERENCES public.employeeform_employee("empID") DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

