--
-- PostgreSQL database dump
--

\restrict Yfd7pfDrRS83rNf7zIf2O4cWhlak2BhUdv3sfXboVDgoeefgDUBvop26lUa0FFa

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: bloqueos_calendario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bloqueos_calendario (
    id_bloqueo integer NOT NULL,
    fecha date NOT NULL,
    motivo character varying(255) NOT NULL
);


ALTER TABLE public.bloqueos_calendario OWNER TO postgres;

--
-- Name: bloqueos_calendario_id_bloqueo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bloqueos_calendario_id_bloqueo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bloqueos_calendario_id_bloqueo_seq OWNER TO postgres;

--
-- Name: bloqueos_calendario_id_bloqueo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bloqueos_calendario_id_bloqueo_seq OWNED BY public.bloqueos_calendario.id_bloqueo;


--
-- Name: citas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citas (
    id_cita integer NOT NULL,
    id_usuario integer NOT NULL,
    descripcion text NOT NULL,
    fecha_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_atencion date,
    hora_atencion time without time zone,
    estado character varying(20) DEFAULT 'PENDIENTE'::character varying,
    motivo_rechazo text,
    monto numeric(10,2),
    CONSTRAINT citas_estado_check CHECK (((estado)::text = ANY ((ARRAY['PENDIENTE'::character varying, 'APROBADA'::character varying, 'RECHAZADA'::character varying, 'FINALIZADA'::character varying, 'CANCELADA'::character varying])::text[])))
);


ALTER TABLE public.citas OWNER TO postgres;

--
-- Name: citas_id_cita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citas_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.citas_id_cita_seq OWNER TO postgres;

--
-- Name: citas_id_cita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas_id_cita_seq OWNED BY public.citas.id_cita;


--
-- Name: cuotas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuotas (
    id_cuota integer NOT NULL,
    id_pago integer NOT NULL,
    numero_cuota integer NOT NULL,
    fecha_vencimiento date,
    monto numeric(10,2) NOT NULL,
    estado character varying(20) DEFAULT 'PENDIENTE'::character varying,
    CONSTRAINT cuotas_estado_check CHECK (((estado)::text = ANY ((ARRAY['PENDIENTE'::character varying, 'PAGADA'::character varying])::text[])))
);


ALTER TABLE public.cuotas OWNER TO postgres;

--
-- Name: cuotas_id_cuota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuotas_id_cuota_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuotas_id_cuota_seq OWNER TO postgres;

--
-- Name: cuotas_id_cuota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuotas_id_cuota_seq OWNED BY public.cuotas.id_cuota;


--
-- Name: documentos_paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documentos_paciente (
    id_documento integer NOT NULL,
    id_usuario integer NOT NULL,
    archivo character varying(255) NOT NULL,
    tipo character varying(50),
    fecha_subida timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.documentos_paciente OWNER TO postgres;

--
-- Name: documentos_paciente_id_documento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documentos_paciente_id_documento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documentos_paciente_id_documento_seq OWNER TO postgres;

--
-- Name: documentos_paciente_id_documento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documentos_paciente_id_documento_seq OWNED BY public.documentos_paciente.id_documento;


--
-- Name: notas_paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_paciente (
    id_nota integer NOT NULL,
    id_usuario integer NOT NULL,
    descripcion text NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.notas_paciente OWNER TO postgres;

--
-- Name: notas_paciente_id_nota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_paciente_id_nota_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notas_paciente_id_nota_seq OWNER TO postgres;

--
-- Name: notas_paciente_id_nota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_paciente_id_nota_seq OWNED BY public.notas_paciente.id_nota;


--
-- Name: odontogramas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.odontogramas (
    id_odontograma integer NOT NULL,
    id_usuario integer NOT NULL,
    imagen character varying(255) NOT NULL,
    fecha_subida timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.odontogramas OWNER TO postgres;

--
-- Name: odontogramas_id_odontograma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.odontogramas_id_odontograma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.odontogramas_id_odontograma_seq OWNER TO postgres;

--
-- Name: odontogramas_id_odontograma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.odontogramas_id_odontograma_seq OWNED BY public.odontogramas.id_odontograma;


--
-- Name: pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos (
    id_pago integer NOT NULL,
    id_cita integer NOT NULL,
    metodo_pago character varying(20),
    tipo_pago character varying(20),
    numero_cuotas integer DEFAULT 1,
    monto_total numeric(10,2) NOT NULL,
    monto_cuota numeric(10,2),
    estado character varying(20) DEFAULT 'PENDIENTE'::character varying,
    CONSTRAINT pagos_estado_check CHECK (((estado)::text = ANY ((ARRAY['PENDIENTE'::character varying, 'PARCIAL'::character varying, 'PAGADO'::character varying])::text[]))),
    CONSTRAINT pagos_metodo_pago_check CHECK (((metodo_pago)::text = ANY ((ARRAY['EFECTIVO'::character varying, 'YAPE'::character varying, 'PLIN'::character varying, 'TARJETA'::character varying])::text[]))),
    CONSTRAINT pagos_tipo_pago_check CHECK (((tipo_pago)::text = ANY ((ARRAY['CONTADO'::character varying, 'CUOTAS'::character varying])::text[])))
);


ALTER TABLE public.pagos OWNER TO postgres;

--
-- Name: pagos_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagos_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagos_id_pago_seq OWNER TO postgres;

--
-- Name: pagos_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagos_id_pago_seq OWNED BY public.pagos.id_pago;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    correo character varying(150) NOT NULL,
    password character varying(255) NOT NULL,
    telefono character varying(20),
    residencia character varying(150),
    foto character varying(255),
    rol character varying(20) NOT NULL,
    estado character varying(20) DEFAULT 'ACTIVO'::character varying,
    CONSTRAINT usuarios_estado_check CHECK (((estado)::text = ANY ((ARRAY['ACTIVO'::character varying, 'INACTIVO'::character varying])::text[]))),
    CONSTRAINT usuarios_rol_check CHECK (((rol)::text = ANY ((ARRAY['ADMIN'::character varying, 'CLIENTE'::character varying])::text[])))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- Name: bloqueos_calendario id_bloqueo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloqueos_calendario ALTER COLUMN id_bloqueo SET DEFAULT nextval('public.bloqueos_calendario_id_bloqueo_seq'::regclass);


--
-- Name: citas id_cita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas ALTER COLUMN id_cita SET DEFAULT nextval('public.citas_id_cita_seq'::regclass);


--
-- Name: cuotas id_cuota; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuotas ALTER COLUMN id_cuota SET DEFAULT nextval('public.cuotas_id_cuota_seq'::regclass);


--
-- Name: documentos_paciente id_documento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_paciente ALTER COLUMN id_documento SET DEFAULT nextval('public.documentos_paciente_id_documento_seq'::regclass);


--
-- Name: notas_paciente id_nota; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_paciente ALTER COLUMN id_nota SET DEFAULT nextval('public.notas_paciente_id_nota_seq'::regclass);


--
-- Name: odontogramas id_odontograma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odontogramas ALTER COLUMN id_odontograma SET DEFAULT nextval('public.odontogramas_id_odontograma_seq'::regclass);


--
-- Name: pagos id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos ALTER COLUMN id_pago SET DEFAULT nextval('public.pagos_id_pago_seq'::regclass);


--
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- Data for Name: bloqueos_calendario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bloqueos_calendario (id_bloqueo, fecha, motivo) FROM stdin;
1	2026-07-18	Mantenimiento de equipo medico
2	2026-07-19	Dia no laborable
\.


--
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citas (id_cita, id_usuario, descripcion, fecha_solicitud, fecha_atencion, hora_atencion, estado, motivo_rechazo, monto) FROM stdin;
1	2	tengo diente picado, quiero curación	2026-07-15 03:29:48.927834	2026-07-17	18:25:00	APROBADA	\N	50.00
\.


--
-- Data for Name: cuotas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuotas (id_cuota, id_pago, numero_cuota, fecha_vencimiento, monto, estado) FROM stdin;
\.


--
-- Data for Name: documentos_paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documentos_paciente (id_documento, id_usuario, archivo, tipo, fecha_subida) FROM stdin;
\.


--
-- Data for Name: notas_paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notas_paciente (id_nota, id_usuario, descripcion, fecha) FROM stdin;
\.


--
-- Data for Name: odontogramas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.odontogramas (id_odontograma, id_usuario, imagen, fecha_subida) FROM stdin;
\.


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos (id_pago, id_cita, metodo_pago, tipo_pago, numero_cuotas, monto_total, monto_cuota, estado) FROM stdin;
1	1	EFECTIVO	CONTADO	1	50.00	\N	PAGADO
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nombre, apellido, correo, password, telefono, residencia, foto, rol, estado) FROM stdin;
1	Administrador	Sistema	admin@odontosystem.com	admin123	999999999	Ica	\N	ADMIN	ACTIVO
2	Sebastian Andre	Salas Salas	sebas@gmail.com	sebas123	956640600	Ica	\N	CLIENTE	ACTIVO
\.


--
-- Name: bloqueos_calendario_id_bloqueo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bloqueos_calendario_id_bloqueo_seq', 2, true);


--
-- Name: citas_id_cita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas_id_cita_seq', 1, true);


--
-- Name: cuotas_id_cuota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuotas_id_cuota_seq', 1, false);


--
-- Name: documentos_paciente_id_documento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documentos_paciente_id_documento_seq', 1, false);


--
-- Name: notas_paciente_id_nota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notas_paciente_id_nota_seq', 1, false);


--
-- Name: odontogramas_id_odontograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.odontogramas_id_odontograma_seq', 1, false);


--
-- Name: pagos_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_id_pago_seq', 1, true);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 2, true);


--
-- Name: bloqueos_calendario bloqueos_calendario_fecha_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloqueos_calendario
    ADD CONSTRAINT bloqueos_calendario_fecha_key UNIQUE (fecha);


--
-- Name: bloqueos_calendario bloqueos_calendario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloqueos_calendario
    ADD CONSTRAINT bloqueos_calendario_pkey PRIMARY KEY (id_bloqueo);


--
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id_cita);


--
-- Name: cuotas cuotas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuotas
    ADD CONSTRAINT cuotas_pkey PRIMARY KEY (id_cuota);


--
-- Name: documentos_paciente documentos_paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_paciente
    ADD CONSTRAINT documentos_paciente_pkey PRIMARY KEY (id_documento);


--
-- Name: notas_paciente notas_paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_paciente
    ADD CONSTRAINT notas_paciente_pkey PRIMARY KEY (id_nota);


--
-- Name: odontogramas odontogramas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odontogramas
    ADD CONSTRAINT odontogramas_pkey PRIMARY KEY (id_odontograma);


--
-- Name: pagos pagos_id_cita_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_id_cita_key UNIQUE (id_cita);


--
-- Name: pagos pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id_pago);


--
-- Name: usuarios usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: citas fk_cita_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_cita_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: cuotas fk_cuota_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuotas
    ADD CONSTRAINT fk_cuota_pago FOREIGN KEY (id_pago) REFERENCES public.pagos(id_pago) ON DELETE CASCADE;


--
-- Name: documentos_paciente fk_documento_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos_paciente
    ADD CONSTRAINT fk_documento_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: notas_paciente fk_nota_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_paciente
    ADD CONSTRAINT fk_nota_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: odontogramas fk_odontograma_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odontogramas
    ADD CONSTRAINT fk_odontograma_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: pagos fk_pago_cita; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT fk_pago_cita FOREIGN KEY (id_cita) REFERENCES public.citas(id_cita) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict Yfd7pfDrRS83rNf7zIf2O4cWhlak2BhUdv3sfXboVDgoeefgDUBvop26lUa0FFa

