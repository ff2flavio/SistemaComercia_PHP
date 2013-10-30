--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3rc1
-- Dumped by pg_dump version 9.3rc1
-- Started on 2013-09-08 22:44:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 16526)
-- Name: bitacoras; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bitacoras;


ALTER SCHEMA bitacoras OWNER TO postgres;

--
-- TOC entry 231 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 231
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 210 (class 1259 OID 49223)
-- Name: almacen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE almacen (
    idalmacen integer NOT NULL,
    detalle character varying(100) NOT NULL
);


ALTER TABLE public.almacen OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 49229)
-- Name: almacen_detalle_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE almacen_detalle_producto (
    idalmacen integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad numeric(10,4) DEFAULT 0.00 NOT NULL,
    cantidad_max numeric(10,4) DEFAULT 0.00 NOT NULL,
    cantidad_min numeric(10,4) DEFAULT 0.00 NOT NULL
);


ALTER TABLE public.almacen_detalle_producto OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 49221)
-- Name: almacen_idalmacen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE almacen_idalmacen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.almacen_idalmacen_seq OWNER TO postgres;

--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 209
-- Name: almacen_idalmacen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE almacen_idalmacen_seq OWNED BY almacen.idalmacen;


--
-- TOC entry 204 (class 1259 OID 49184)
-- Name: asistencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asistencia (
    idpersona integer NOT NULL,
    idhorario integer NOT NULL,
    "fechaHora" timestamp with time zone DEFAULT now() NOT NULL,
    ip character varying(15) NOT NULL
);


ALTER TABLE public.asistencia OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 57379)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria (
    idcategoria integer NOT NULL,
    detalle character varying(50) NOT NULL,
    idcategoria_sub integer
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 57377)
-- Name: categoria_idcategoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_idcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_idcategoria_seq OWNER TO postgres;

--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 214
-- Name: categoria_idcategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_idcategoria_seq OWNED BY categoria.idcategoria;


--
-- TOC entry 220 (class 1259 OID 57452)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE compra (
    idcompra integer NOT NULL,
    idpersona_empleado integer NOT NULL,
    idpersona_proveedor integer NOT NULL,
    idpersona_aprobacion integer NOT NULL,
    "fechaRegistro" timestamp with time zone DEFAULT now() NOT NULL,
    detalle text,
    total money NOT NULL,
    anulado boolean DEFAULT false NOT NULL,
    idcomprobante_numero integer NOT NULL,
    fecha timestamp with time zone NOT NULL,
    idmoneda_cambio integer NOT NULL
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 57458)
-- Name: compra_detalle_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE compra_detalle_producto (
    idcompra integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad numeric(10,4) NOT NULL,
    precio money NOT NULL,
    descuento money DEFAULT 0.00 NOT NULL,
    subtotal money NOT NULL
);


ALTER TABLE public.compra_detalle_producto OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 57450)
-- Name: compra_idcompra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE compra_idcompra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_idcompra_seq OWNER TO postgres;

--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 219
-- Name: compra_idcompra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE compra_idcompra_seq OWNED BY compra.idcompra;


--
-- TOC entry 193 (class 1259 OID 24588)
-- Name: comprobante_tipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comprobante_tipo (
    idcomprobante integer NOT NULL,
    detalle character varying(30) NOT NULL,
    abreviatura character varying(5),
    descripcion text,
    estado boolean DEFAULT true NOT NULL
);


ALTER TABLE public.comprobante_tipo OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 24586)
-- Name: comprobante_tipo_idcomprobante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comprobante_tipo_idcomprobante_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comprobante_tipo_idcomprobante_seq OWNER TO postgres;

--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 192
-- Name: comprobante_tipo_idcomprobante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comprobante_tipo_idcomprobante_seq OWNED BY comprobante_tipo.idcomprobante;


--
-- TOC entry 179 (class 1259 OID 16440)
-- Name: contacto_tipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contacto_tipo (
    idcontacto_tipo integer NOT NULL,
    detalle character varying(40) NOT NULL
);


ALTER TABLE public.contacto_tipo OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16438)
-- Name: contacto_tipo_idcontacto_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contacto_tipo_idcontacto_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacto_tipo_idcontacto_tipo_seq OWNER TO postgres;

--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 178
-- Name: contacto_tipo_idcontacto_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contacto_tipo_idcontacto_tipo_seq OWNED BY contacto_tipo.idcontacto_tipo;


--
-- TOC entry 176 (class 1259 OID 16417)
-- Name: documento_tipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documento_tipo (
    iddocumento_tipo integer NOT NULL,
    detalle character varying(30) NOT NULL
);


ALTER TABLE public.documento_tipo OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16415)
-- Name: documento_tipo_iddocumento_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documento_tipo_iddocumento_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documento_tipo_iddocumento_tipo_seq OWNER TO postgres;

--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 175
-- Name: documento_tipo_iddocumento_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documento_tipo_iddocumento_tipo_seq OWNED BY documento_tipo.iddocumento_tipo;


--
-- TOC entry 199 (class 1259 OID 32780)
-- Name: estado_civil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_civil (
    idestado_civil integer NOT NULL,
    detalle character varying(10) NOT NULL
);


ALTER TABLE public.estado_civil OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 32778)
-- Name: estado_civil_idestado_civil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_civil_idestado_civil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_civil_idestado_civil_seq OWNER TO postgres;

--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 198
-- Name: estado_civil_idestado_civil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_civil_idestado_civil_seq OWNED BY estado_civil.idestado_civil;


--
-- TOC entry 203 (class 1259 OID 49172)
-- Name: horario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE horario (
    idhorario integer NOT NULL,
    fecha date NOT NULL,
    "horaIngreso" time with time zone NOT NULL,
    "horaSalida" time with time zone NOT NULL,
    estado boolean DEFAULT false NOT NULL,
    idturno integer NOT NULL
);


ALTER TABLE public.horario OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 49170)
-- Name: horario_idhorario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE horario_idhorario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horario_idhorario_seq OWNER TO postgres;

--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 202
-- Name: horario_idhorario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE horario_idhorario_seq OWNED BY horario.idhorario;


--
-- TOC entry 228 (class 1259 OID 57573)
-- Name: impuesto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE impuesto (
    idimpuesto integer NOT NULL,
    detalle character varying(50) NOT NULL,
    abreviatura character varying(5) NOT NULL
);


ALTER TABLE public.impuesto OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 57581)
-- Name: impuesto_detalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE impuesto_detalle (
    idimpuesto_detalle integer NOT NULL,
    idimpuesto integer NOT NULL,
    valor numeric(10,4) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.impuesto_detalle OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 57579)
-- Name: impuesto_detalle_idimpuesto_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE impuesto_detalle_idimpuesto_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.impuesto_detalle_idimpuesto_detalle_seq OWNER TO postgres;

--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 229
-- Name: impuesto_detalle_idimpuesto_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE impuesto_detalle_idimpuesto_detalle_seq OWNED BY impuesto_detalle.idimpuesto_detalle;


--
-- TOC entry 227 (class 1259 OID 57571)
-- Name: impuesto_idimpuesto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE impuesto_idimpuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.impuesto_idimpuesto_seq OWNER TO postgres;

--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 227
-- Name: impuesto_idimpuesto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE impuesto_idimpuesto_seq OWNED BY impuesto.idimpuesto;


--
-- TOC entry 218 (class 1259 OID 57423)
-- Name: kardex; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kardex (
    idkardex integer NOT NULL,
    idalmacen integer NOT NULL,
    "fechaHora" timestamp with time zone DEFAULT now() NOT NULL,
    costo money NOT NULL,
    idpersona integer NOT NULL,
    idcomprobante_numero integer NOT NULL,
    idmoneda_cambio integer NOT NULL
);


ALTER TABLE public.kardex OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 57515)
-- Name: kardex_detalle_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kardex_detalle_producto (
    idkardex integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad numeric(10,4) NOT NULL,
    precio money NOT NULL,
    subtotal money NOT NULL
);


ALTER TABLE public.kardex_detalle_producto OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 57421)
-- Name: kardex_idkardex_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kardex_idkardex_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kardex_idkardex_seq OWNER TO postgres;

--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 217
-- Name: kardex_idkardex_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kardex_idkardex_seq OWNED BY kardex.idkardex;


--
-- TOC entry 208 (class 1259 OID 49210)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE marca (
    idmarca integer NOT NULL,
    detalle character varying(50) NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 49208)
-- Name: marca_idmarca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE marca_idmarca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_idmarca_seq OWNER TO postgres;

--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 207
-- Name: marca_idmarca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE marca_idmarca_seq OWNED BY marca.idmarca;


--
-- TOC entry 188 (class 1259 OID 16500)
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu (
    idmenu integer NOT NULL,
    detalle character varying(40) NOT NULL,
    src character varying(40) NOT NULL,
    img character varying(60),
    idmenu_sub integer
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16498)
-- Name: menu_idmenu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_idmenu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_idmenu_seq OWNER TO postgres;

--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 187
-- Name: menu_idmenu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_idmenu_seq OWNED BY menu.idmenu;


--
-- TOC entry 224 (class 1259 OID 57537)
-- Name: moneda; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE moneda (
    idmoneda integer NOT NULL,
    detalle character varying(30) NOT NULL,
    abreviatura character varying(5) NOT NULL,
    signo character varying(5) NOT NULL
);


ALTER TABLE public.moneda OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 57545)
-- Name: moneda_cambio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE moneda_cambio (
    idmoneda_cambio integer NOT NULL,
    idmoneda integer NOT NULL,
    fecha timestamp with time zone NOT NULL,
    cambio money NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.moneda_cambio OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 57543)
-- Name: moneda_cambio_idmoneda_cambio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE moneda_cambio_idmoneda_cambio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moneda_cambio_idmoneda_cambio_seq OWNER TO postgres;

--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 225
-- Name: moneda_cambio_idmoneda_cambio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE moneda_cambio_idmoneda_cambio_seq OWNED BY moneda_cambio.idmoneda_cambio;


--
-- TOC entry 223 (class 1259 OID 57535)
-- Name: moneda_idmoneda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE moneda_idmoneda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moneda_idmoneda_seq OWNER TO postgres;

--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 223
-- Name: moneda_idmoneda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE moneda_idmoneda_seq OWNED BY moneda.idmoneda;


--
-- TOC entry 197 (class 1259 OID 24629)
-- Name: numero; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE numero (
    idnumero integer NOT NULL,
    detalle character varying(10) NOT NULL,
    idserie integer NOT NULL
);


ALTER TABLE public.numero OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24627)
-- Name: numero_idnumero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE numero_idnumero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.numero_idnumero_seq OWNER TO postgres;

--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 196
-- Name: numero_idnumero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE numero_idnumero_seq OWNED BY numero.idnumero;


--
-- TOC entry 172 (class 1259 OID 16396)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona (
    idpersona integer NOT NULL,
    idpersona_tipo integer NOT NULL,
    nombre character varying(200) NOT NULL,
    direccion character varying(200) NOT NULL,
    usuario character varying(32) NOT NULL,
    clave character varying(32) NOT NULL,
    idestado_civil integer DEFAULT 1 NOT NULL,
    sexo boolean DEFAULT true NOT NULL,
    "fechaRegistro" timestamp with time zone DEFAULT now() NOT NULL,
    "fechaNacimiento" date
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16446)
-- Name: persona_detalle_contacto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona_detalle_contacto (
    idpersona integer NOT NULL,
    idcontacto_tipo integer NOT NULL,
    detalle character varying(100) NOT NULL
);


ALTER TABLE public.persona_detalle_contacto OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16423)
-- Name: persona_detalle_documento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona_detalle_documento (
    idpersona integer NOT NULL,
    iddocumento_tipo integer NOT NULL,
    detalle character varying(30) NOT NULL
);


ALTER TABLE public.persona_detalle_documento OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16469)
-- Name: persona_detalle_grupo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona_detalle_grupo (
    idpersona integer NOT NULL,
    idpersona_grupo integer NOT NULL,
    "fechaInicio" timestamp with time zone DEFAULT now() NOT NULL,
    "fechaFin" timestamp with time zone
);


ALTER TABLE public.persona_detalle_grupo OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16483)
-- Name: persona_detalle_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona_detalle_rol (
    idpersona integer NOT NULL,
    idrol integer NOT NULL
);


ALTER TABLE public.persona_detalle_rol OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16463)
-- Name: persona_grupo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona_grupo (
    idpersona_grupo integer NOT NULL,
    detalle character varying(10) NOT NULL
);


ALTER TABLE public.persona_grupo OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16461)
-- Name: persona_grupo_idpersona_grupo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_grupo_idpersona_grupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_grupo_idpersona_grupo_seq OWNER TO postgres;

--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 181
-- Name: persona_grupo_idpersona_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_grupo_idpersona_grupo_seq OWNED BY persona_grupo.idpersona_grupo;


--
-- TOC entry 171 (class 1259 OID 16394)
-- Name: persona_idpersona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_idpersona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_idpersona_seq OWNER TO postgres;

--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 171
-- Name: persona_idpersona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_idpersona_seq OWNED BY persona.idpersona;


--
-- TOC entry 174 (class 1259 OID 16404)
-- Name: persona_tipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona_tipo (
    idpersona_tipo integer NOT NULL,
    detalle character varying(30) NOT NULL
);


ALTER TABLE public.persona_tipo OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16402)
-- Name: persona_tipo_idpersona_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_tipo_idpersona_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_tipo_idpersona_tipo_seq OWNER TO postgres;

--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 173
-- Name: persona_tipo_idpersona_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_tipo_idpersona_tipo_seq OWNED BY persona_tipo.idpersona_tipo;


--
-- TOC entry 206 (class 1259 OID 49202)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE producto (
    idproducto integer NOT NULL,
    idmarca integer NOT NULL,
    idunidad_medida integer NOT NULL,
    nombre character varying(100) NOT NULL,
    detalle text,
    idcategoria integer NOT NULL
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 49200)
-- Name: producto_idproducto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE producto_idproducto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_idproducto_seq OWNER TO postgres;

--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 205
-- Name: producto_idproducto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE producto_idproducto_seq OWNED BY producto.idproducto;


--
-- TOC entry 185 (class 1259 OID 16477)
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol (
    idrol integer NOT NULL,
    detalle character varying(45) NOT NULL
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16511)
-- Name: rol_detalle_menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol_detalle_menu (
    idrol integer NOT NULL,
    idmenu integer NOT NULL
);


ALTER TABLE public.rol_detalle_menu OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16475)
-- Name: rol_idrol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rol_idrol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_idrol_seq OWNER TO postgres;

--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 184
-- Name: rol_idrol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rol_idrol_seq OWNED BY rol.idrol;


--
-- TOC entry 195 (class 1259 OID 24614)
-- Name: serie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE serie (
    idserie integer NOT NULL,
    detalle character varying(10) NOT NULL,
    "fechaRegistro" timestamp with time zone DEFAULT now() NOT NULL,
    estado boolean DEFAULT false NOT NULL,
    idcomprobante integer NOT NULL
);


ALTER TABLE public.serie OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 24612)
-- Name: serie_idserie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE serie_idserie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.serie_idserie_seq OWNER TO postgres;

--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 194
-- Name: serie_idserie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE serie_idserie_seq OWNED BY serie.idserie;


--
-- TOC entry 201 (class 1259 OID 49164)
-- Name: turno; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE turno (
    idturno integer NOT NULL,
    detalle character varying(9) NOT NULL,
    abreviatura character varying(3) NOT NULL
);


ALTER TABLE public.turno OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 49162)
-- Name: turno_idturno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE turno_idturno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.turno_idturno_seq OWNER TO postgres;

--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 200
-- Name: turno_idturno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE turno_idturno_seq OWNED BY turno.idturno;


--
-- TOC entry 213 (class 1259 OID 49236)
-- Name: unidad_medida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_medida (
    idunidad_medida integer NOT NULL,
    detalle character varying(20) NOT NULL,
    abreviatura character varying(5)
);


ALTER TABLE public.unidad_medida OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 49234)
-- Name: unidad_medida_idunidad_medida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_medida_idunidad_medida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_medida_idunidad_medida_seq OWNER TO postgres;

--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 212
-- Name: unidad_medida_idunidad_medida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_medida_idunidad_medida_seq OWNED BY unidad_medida.idunidad_medida;


--
-- TOC entry 191 (class 1259 OID 16529)
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE venta (
    idventa integer NOT NULL,
    idpersona_empleado integer NOT NULL,
    idpersona_cliente integer NOT NULL,
    idpersona_pagador integer NOT NULL,
    "fechaRegistro" timestamp with time zone DEFAULT now() NOT NULL,
    detalle text,
    total money NOT NULL,
    anulado boolean DEFAULT false NOT NULL,
    idcomprobante_numero integer NOT NULL,
    fecha timestamp with time zone,
    idmoneda_cambio integer NOT NULL,
    idimpuesto_detalle integer
);


ALTER TABLE public.venta OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 57405)
-- Name: venta_detalle_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE venta_detalle_producto (
    idventa integer NOT NULL,
    idproducto integer NOT NULL,
    cantidad numeric(10,4) NOT NULL,
    precio money,
    descuento money DEFAULT 0.00 NOT NULL,
    subtotal money
);


ALTER TABLE public.venta_detalle_producto OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16527)
-- Name: venta_idventa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venta_idventa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venta_idventa_seq OWNER TO postgres;

--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 190
-- Name: venta_idventa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venta_idventa_seq OWNED BY venta.idventa;


--
-- TOC entry 2039 (class 2604 OID 49226)
-- Name: idalmacen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY almacen ALTER COLUMN idalmacen SET DEFAULT nextval('almacen_idalmacen_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 57382)
-- Name: idcategoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN idcategoria SET DEFAULT nextval('categoria_idcategoria_seq'::regclass);


--
-- TOC entry 2048 (class 2604 OID 57455)
-- Name: idcompra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra ALTER COLUMN idcompra SET DEFAULT nextval('compra_idcompra_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 24591)
-- Name: idcomprobante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante_tipo ALTER COLUMN idcomprobante SET DEFAULT nextval('comprobante_tipo_idcomprobante_seq'::regclass);


--
-- TOC entry 2018 (class 2604 OID 16443)
-- Name: idcontacto_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_tipo ALTER COLUMN idcontacto_tipo SET DEFAULT nextval('contacto_tipo_idcontacto_tipo_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 16420)
-- Name: iddocumento_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documento_tipo ALTER COLUMN iddocumento_tipo SET DEFAULT nextval('documento_tipo_iddocumento_tipo_seq'::regclass);


--
-- TOC entry 2032 (class 2604 OID 32783)
-- Name: idestado_civil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado_civil ALTER COLUMN idestado_civil SET DEFAULT nextval('estado_civil_idestado_civil_seq'::regclass);


--
-- TOC entry 2034 (class 2604 OID 49175)
-- Name: idhorario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horario ALTER COLUMN idhorario SET DEFAULT nextval('horario_idhorario_seq'::regclass);


--
-- TOC entry 2054 (class 2604 OID 57576)
-- Name: idimpuesto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY impuesto ALTER COLUMN idimpuesto SET DEFAULT nextval('impuesto_idimpuesto_seq'::regclass);


--
-- TOC entry 2055 (class 2604 OID 57584)
-- Name: idimpuesto_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY impuesto_detalle ALTER COLUMN idimpuesto_detalle SET DEFAULT nextval('impuesto_detalle_idimpuesto_detalle_seq'::regclass);


--
-- TOC entry 2046 (class 2604 OID 57426)
-- Name: idkardex; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex ALTER COLUMN idkardex SET DEFAULT nextval('kardex_idkardex_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 49213)
-- Name: idmarca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marca ALTER COLUMN idmarca SET DEFAULT nextval('marca_idmarca_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 16503)
-- Name: idmenu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN idmenu SET DEFAULT nextval('menu_idmenu_seq'::regclass);


--
-- TOC entry 2052 (class 2604 OID 57540)
-- Name: idmoneda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moneda ALTER COLUMN idmoneda SET DEFAULT nextval('moneda_idmoneda_seq'::regclass);


--
-- TOC entry 2053 (class 2604 OID 57548)
-- Name: idmoneda_cambio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moneda_cambio ALTER COLUMN idmoneda_cambio SET DEFAULT nextval('moneda_cambio_idmoneda_cambio_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 24632)
-- Name: idnumero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numero ALTER COLUMN idnumero SET DEFAULT nextval('numero_idnumero_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 16399)
-- Name: idpersona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona ALTER COLUMN idpersona SET DEFAULT nextval('persona_idpersona_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 16466)
-- Name: idpersona_grupo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_grupo ALTER COLUMN idpersona_grupo SET DEFAULT nextval('persona_grupo_idpersona_grupo_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 16407)
-- Name: idpersona_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_tipo ALTER COLUMN idpersona_tipo SET DEFAULT nextval('persona_tipo_idpersona_tipo_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 49205)
-- Name: idproducto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto ALTER COLUMN idproducto SET DEFAULT nextval('producto_idproducto_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 16480)
-- Name: idrol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol ALTER COLUMN idrol SET DEFAULT nextval('rol_idrol_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 24617)
-- Name: idserie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY serie ALTER COLUMN idserie SET DEFAULT nextval('serie_idserie_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 49167)
-- Name: idturno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY turno ALTER COLUMN idturno SET DEFAULT nextval('turno_idturno_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 49239)
-- Name: idunidad_medida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_medida ALTER COLUMN idunidad_medida SET DEFAULT nextval('unidad_medida_idunidad_medida_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 16532)
-- Name: idventa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta ALTER COLUMN idventa SET DEFAULT nextval('venta_idventa_seq'::regclass);


--
-- TOC entry 2319 (class 0 OID 49223)
-- Dependencies: 210
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY almacen (idalmacen, detalle) FROM stdin;
\.


--
-- TOC entry 2320 (class 0 OID 49229)
-- Dependencies: 211
-- Data for Name: almacen_detalle_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY almacen_detalle_producto (idalmacen, idproducto, cantidad, cantidad_max, cantidad_min) FROM stdin;
\.


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 209
-- Name: almacen_idalmacen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('almacen_idalmacen_seq', 1, false);


--
-- TOC entry 2313 (class 0 OID 49184)
-- Dependencies: 204
-- Data for Name: asistencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY asistencia (idpersona, idhorario, "fechaHora", ip) FROM stdin;
\.


--
-- TOC entry 2324 (class 0 OID 57379)
-- Dependencies: 215
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categoria (idcategoria, detalle, idcategoria_sub) FROM stdin;
\.


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 214
-- Name: categoria_idcategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_idcategoria_seq', 1, false);


--
-- TOC entry 2329 (class 0 OID 57452)
-- Dependencies: 220
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY compra (idcompra, idpersona_empleado, idpersona_proveedor, idpersona_aprobacion, "fechaRegistro", detalle, total, anulado, idcomprobante_numero, fecha, idmoneda_cambio) FROM stdin;
\.


--
-- TOC entry 2330 (class 0 OID 57458)
-- Dependencies: 221
-- Data for Name: compra_detalle_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY compra_detalle_producto (idcompra, idproducto, cantidad, precio, descuento, subtotal) FROM stdin;
\.


--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 219
-- Name: compra_idcompra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('compra_idcompra_seq', 1, false);


--
-- TOC entry 2302 (class 0 OID 24588)
-- Dependencies: 193
-- Data for Name: comprobante_tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comprobante_tipo (idcomprobante, detalle, abreviatura, descripcion, estado) FROM stdin;
2	BOLETA	B/N	Es un comprobante de pago que se emite en operaciones con consumidores o usuarios finales. No permite ejercer el derecho al crédito fiscal, ni sustentar gasto o costo para efecto tributario.\r\nPor ejemplo: Si usted compra los víveres para la semana en una tienda de abarrotes, debe exigir que le otorguen una boleta de venta. Lo mismo si acude a una peluquería o salón de belleza, o va a comer a un restaurante o compra un libro.\r\n\r\nCuando el importe de la venta efectuada o del servicio prestado supere los setecientos nuevos soles (S/. 700.00) por operación será necesario consignar en la boleta de venta los datos de identificación del adquirente o usuario: apellidos y nombres completos, y el número de su documento de identidad. \r\n\r\nBase Legal: \r\nNumeral 3 del artículo 4º y numeral 3.10 del Artículo 8º de la Resolución de Superintendencia N° 007-99/SUNAT y modificatorias.	t
1	FACTURA	F/N	Es el comprobante de pago que se emite en las operaciones entre empresas o personas que necesitan acreditar costo o gasto para efecto tributario, sustentar el pago del IGV por la operación efectuada y poder ejercer, de esta manera, el derecho al crédito fiscal. Por ejemplo, cuando una empresa compra papel y tóner para sus impresoras debe exigir que le otorguen una factura.  \r\n\r\nBase Legal: \r\nNumeral 1 del Artículo 4º de la Resolución de Superintendencia N° 007-99/SUNAT y modificatorias.	t
3	TICKET	T/N	Este comprobante de pago puede ser emitido únicamente en moneda nacional. \r\n\r\nCuando es emitido en operaciones con consumidores o usuarios finales, no permite ejercer el derecho a crédito fiscal, crédito deducible ni sustentar gasto o costo para efecto tributario. \r\n\r\nCuando el comprador requiera sustentar crédito fiscal, costo o gasto para efecto tributario o crédito deducible deberá: identificar al adquiriente o usuario con su número de RUC, consignar los apellidos y nombres o denominación o razón social, discriminando el monto del tributo que grava la operación.\r\n\r\nLos tickets pueden también ser emitidos a través de sistemas informáticos, siempre que el emisor haya obtenido la autorización de uso correspondiente a través del Formulario N° 845. Tal es el caso de supermercados, tiendas por departamento, farmacias, estaciones de combustible, restaurantes, entre otros tipos de negocios que emplean sistemas autorizados. Estos tickets deben cumplir los mismos requisitos que los tickets emitidos por máquinas registradoras.   \r\n\r\nBase Legal: \r\nNumeral 5 del artículo 4º y numeral 5 del Artículo 8º de la Resolución de Superintendencia N° 007-99/SUNAT y modificatorias	t
4	RECIBO POR HONORARIOS	RH/N	Es el comprobante de pago que emiten las personas naturales que se dedican en forma individual al ejercicio de cualquier profesión, arte, ciencia u oficio. Por ejemplo: médicos, abogados, gasfiteros, artistas, albañiles, entre otros. \r\n\r\nPueden ser utilizados a fin de sustentar gasto o costo para efecto tributario y para sustentar crédito deducible.\r\n\r\nBase Legal: \r\nNumeral 2 del Artículo 4º de la Resolución de Superintendencia N° 007-99/SUNAT y modificatorias.\r\nArtículo 33° del TUO de la Ley del Impuesto a la Renta aprobado por Decreto Supremo N° 054-99-EF.	t
5	LIQUIDACIÓN DE COMPRA	L/N	Este comprobante de pago es emitido por todos aquellos que realizan adquisiciones a personas naturales productoras y/o acopiadoras de productos primarios derivados de la actividad agropecuaria, pesca artesanal, extracción de madera, de productos silvestres, minería aurífera artesanal, artesanía y desperdicios y desechos metálicos y no metálicos, desechos de papel y desperdicios de caucho que no cuentan con número de RUC. Tal es el caso de las personas o empresas que realizan compras a pequeños mineros, artesanos o agricultores los que, por encontrarse en lugares muy alejados a los centros urbanos, se ven imposibilitados de obtener su número de RUC y así poder emitir sus comprobantes de pago. \r\n\r\nLas Liquidaciones de Compra solo pueden ser emitidas por los contribuyentes del Régimen General y del Régimen Especial del Impuesto a la Renta.\r\n\r\nNota: Hasta el 31 de diciembre del 2013, a las operaciones que se realicen con los productos primarios derivados de la actividad agropecuaria de la aplicación del Régimen de retención del Impuesto a la Renta en operaciones con liquidaciones de compra (Resolución de Superintendencia N° 124-2013/SUNAT publicada el 13 de abril de 2013). \r\n\r\n\r\nBase Legal: \r\nNumeral 4 del artículo 4º e inciso 1.3 del numeral 1 del artículo 6° de la Resolución de Superintendencia N° 007-99/SUNAT y modificatorias.	t
\.


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 192
-- Name: comprobante_tipo_idcomprobante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comprobante_tipo_idcomprobante_seq', 5, true);


--
-- TOC entry 2288 (class 0 OID 16440)
-- Dependencies: 179
-- Data for Name: contacto_tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacto_tipo (idcontacto_tipo, detalle) FROM stdin;
1	Correo Electronico Principal
2	Correo Electronico Secundario
3	Correo Electronico Empresarial
4	Telefono 1
5	Telefono 2
6	Celular Movistar
7	Celular Claro
8	Celular Nextel
9	Celular RPM
10	Celular RPC
\.


--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 178
-- Name: contacto_tipo_idcontacto_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contacto_tipo_idcontacto_tipo_seq', 10, true);


--
-- TOC entry 2285 (class 0 OID 16417)
-- Dependencies: 176
-- Data for Name: documento_tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documento_tipo (iddocumento_tipo, detalle) FROM stdin;
1	DNI
2	Pasaporte
3	Carnet de Extrangeria
4	RUC
\.


--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 175
-- Name: documento_tipo_iddocumento_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documento_tipo_iddocumento_tipo_seq', 4, true);


--
-- TOC entry 2308 (class 0 OID 32780)
-- Dependencies: 199
-- Data for Name: estado_civil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado_civil (idestado_civil, detalle) FROM stdin;
1	Soltero
2	Casado
3	Viudo
4	Divorciado
\.


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 198
-- Name: estado_civil_idestado_civil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_civil_idestado_civil_seq', 4, true);


--
-- TOC entry 2312 (class 0 OID 49172)
-- Dependencies: 203
-- Data for Name: horario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY horario (idhorario, fecha, "horaIngreso", "horaSalida", estado, idturno) FROM stdin;
\.


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 202
-- Name: horario_idhorario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('horario_idhorario_seq', 1, false);


--
-- TOC entry 2337 (class 0 OID 57573)
-- Dependencies: 228
-- Data for Name: impuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY impuesto (idimpuesto, detalle, abreviatura) FROM stdin;
\.


--
-- TOC entry 2339 (class 0 OID 57581)
-- Dependencies: 230
-- Data for Name: impuesto_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY impuesto_detalle (idimpuesto_detalle, idimpuesto, valor, estado) FROM stdin;
\.


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 229
-- Name: impuesto_detalle_idimpuesto_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('impuesto_detalle_idimpuesto_detalle_seq', 1, false);


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 227
-- Name: impuesto_idimpuesto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('impuesto_idimpuesto_seq', 1, false);


--
-- TOC entry 2327 (class 0 OID 57423)
-- Dependencies: 218
-- Data for Name: kardex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kardex (idkardex, idalmacen, "fechaHora", costo, idpersona, idcomprobante_numero, idmoneda_cambio) FROM stdin;
\.


--
-- TOC entry 2331 (class 0 OID 57515)
-- Dependencies: 222
-- Data for Name: kardex_detalle_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kardex_detalle_producto (idkardex, idproducto, cantidad, precio, subtotal) FROM stdin;
\.


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 217
-- Name: kardex_idkardex_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kardex_idkardex_seq', 1, false);


--
-- TOC entry 2317 (class 0 OID 49210)
-- Dependencies: 208
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY marca (idmarca, detalle) FROM stdin;
\.


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 207
-- Name: marca_idmarca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('marca_idmarca_seq', 1, false);


--
-- TOC entry 2297 (class 0 OID 16500)
-- Dependencies: 188
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menu (idmenu, detalle, src, img, idmenu_sub) FROM stdin;
1	Mantenimientos	mantenimientos	\N	\N
2	Ventas	ventas	\N	\N
3	Compras	compras	\N	\N
4	Alamacen	almacen	\N	\N
5	Reportes	reportes	\N	\N
6	G. Clientes	gestion_clientes	\N	1
7	G. Proveedores	gestion_proveedores	\N	1
8	G. Productos	gestion_productos	\N	1
9	G. Categorias	gestion_categorias	\N	1
10	G. Marcas	gestion_marcas	\N	1
\.


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 187
-- Name: menu_idmenu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_idmenu_seq', 10, true);


--
-- TOC entry 2333 (class 0 OID 57537)
-- Dependencies: 224
-- Data for Name: moneda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY moneda (idmoneda, detalle, abreviatura, signo) FROM stdin;
\.


--
-- TOC entry 2335 (class 0 OID 57545)
-- Dependencies: 226
-- Data for Name: moneda_cambio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY moneda_cambio (idmoneda_cambio, idmoneda, fecha, cambio, estado) FROM stdin;
\.


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 225
-- Name: moneda_cambio_idmoneda_cambio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('moneda_cambio_idmoneda_cambio_seq', 1, false);


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 223
-- Name: moneda_idmoneda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('moneda_idmoneda_seq', 1, false);


--
-- TOC entry 2306 (class 0 OID 24629)
-- Dependencies: 197
-- Data for Name: numero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY numero (idnumero, detalle, idserie) FROM stdin;
\.


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 196
-- Name: numero_idnumero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numero_idnumero_seq', 1, false);


--
-- TOC entry 2281 (class 0 OID 16396)
-- Dependencies: 172
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona (idpersona, idpersona_tipo, nombre, direccion, usuario, clave, idestado_civil, sexo, "fechaRegistro", "fechaNacimiento") FROM stdin;
2	2	Maria Daniela Jauregui Solis	Sin direccion	dajso	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
3	1	Raúl Eduardo Rojas Uriarte	Urb. San Isidro	ruriarte	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
4	2	Etica GNU	Sin direccion	eticagnu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
9	1	Jesus Mendieta Garay	Sin direccion\r	jmedina	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
1	1	Ivan Wilfredo Uriarte Uriarte	Elmer Faucett #375. Urb. La Primavera 1 Etapa.	pilmee	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
39	1	Jesus Mendieta Garay 		jesus_mendieta_garay	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
40	1	Ivan Wilfredo Uriarte Uriarte	Elmer Faucett #375. Urb. Primavera 1 Etapa.	ivan_wilfredo_uriarte_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
41	1	Joseluis Paniagua 		joseluis_paniagua	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
42	1	Johan Vilela Bayona	zarate	johan_vilela_bayona	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
43	1	Rigoberto Benigno Inga Gordaliza	los sauces	rigoberto_benigno_inga	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
44	1	Miguel Angel Barroneto Castillo	av.tingoha	miguel_angel_barroneto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
45	1	Marco Antonio Acero Kuncho		marco_antonio_acero_ku	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
46	1	Victor Antonio Vicente Mendoza	olmos san 	victor_antonio_vicente	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
47	1	Segundo Cabrera Abanto		segundo_cabrera_abanto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
48	1	Wilfredo Vegas Zapata		wilfredo_vegas_zapata	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
49	1	Joseluis Ortega Caceres	calle cont	joseluis_ortega_cacere	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
50	1	Azucena Jibaja Ojeda		azucena_jibaja_ojeda	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
51	1	Ana Ventura Gomez		ana_ventura_gomez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
52	1	Mario Julio Rojas Caballero	jr.adolfo 	mario_julio_rojas_caba	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
53	1	Anderson Reyuga	av.contry 	anderson_reyuga	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
54	1	Joseluis Inpante Llanos		joseluis_inpante_llano	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
55	1	Elsa Marina Saavedra Paz		elsa_marina_saavedra_p	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
56	1	Alberto Marcial Vigo Gutierrez		alberto_marcial_vigo_g	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
57	1	Jose Orlando Alarcon Rubio	comas -380	jose_orlando_alarcon_r	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
58	1	Daniel Hemera	jr. arica 	daniel_hemera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
59	1	Victor Emiliano Suto Collazos	ate.maz.lo	victor_emiliano_suto_c	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
60	1	Angel Anthony Soberon Vera		angel_anthony_soberon_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
61	1	Julio Carranza Victoriano	rimac n�5	julio_carranza_victori	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
62	1	Maria Cecilia Lozada 		maria_cecilia_lozada	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
63	1	Daniel Ruiz Sol		daniel_ruiz_sol	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
64	1	Jorge Luis Tuesta Perez		jorge_luis_tuesta_pere	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
65	1	Delein Herrera Misa		delein_herrera_misa	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
66	1	Paul Burneo Valdiviezo		paul_burneo_valdiviezo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
267	1	David Muller		david_muller	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
67	1	Emerson Cuntrera Vasquez		emerson_cuntrera_vasqu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
68	1	Fenando Itaymundo Iturrizaga Neyra		fenando_itaymundo_itur	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
69	1	Juan Paul Mayo Bonilla	jr.arequip	juan_paul_mayo_bonilla	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
70	1	Wildon Jimmi Diaz Calderon		wildon_jimmi_diaz_cald	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
71	1	Rodolfo Yugra Velarde	las mangol	rodolfo_yugra_velarde	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
72	1	Betty Veronica Arteaga Lavado	san pablo 	betty_veronica_arteaga	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
73	1	Cesar Espinoza Coral	av.tejado 	cesar_espinoza_coral	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
74	1	Christian Alberto Vasquez Nassi	calle.guad	christian_alberto_vasq	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
75	1	Manuel Hernan Avila Arias		manuel_hernan_avila_ar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
76	1	Emiliano Montoya Mesia		emiliano_montoya_mesia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
77	1	Yoshiro Chair Villegas		yoshiro_chair_villegas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
78	1	Edgar Gustavo Veinsquez Mila		edgar_gustavo_veinsque	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
79	1	Hector Yucra Guerrero		hector_yucra_guerrero	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
80	1	Charles Eduard Rivas Vilchet	huancaveli	charles_eduard_rivas_v	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
81	1	Julio Enrique Lopez Carriedo		julio_enrique_lopez_ca	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
82	1	Irwin Montalvo Ramos 	av.mexico 	irwin_montalvo_ramos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
83	1	Victor Gonzales Alarcon		victor_gonzales_alarco	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
84	1	Juan Paullet Lara Guzman 		juan_paullet_lara_guzm	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
85	1	Oscar Miranda		oscar_miranda	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
86	1	Jhon Carlos Cabanillas Tafur	jr.jose ol	jhon_carlos_cabanillas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
87	1	Juan Carlos Acosta Pachamango		juan_carlos_acosta_pac	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
88	1	Joseluis Sobrino Sanda�A 	maz.lot.6 	joseluis_sobrino_sanda	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
89	1	Luis Martin Diestra Zavaleta	san nmarti	luis_martin_diestra_za	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
90	1	Luis Campo Calestro		luis_campo_calestro	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
91	1	Teresa Benito Jara		teresa_benito_jara	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
92	1	Leiby Silva Chinchay		leiby_silva_chinchay	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
93	1	Victor Galvez Mori	san martin	victor_galvez_mori	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
94	1	Asuncion Idrogo Herrera	san juan d	asuncion_idrogo_herrer	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
95	1	Juan Godoy Salazar		juan_godoy_salazar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
96	1	Carson Burns	2932 s.e 	carson_burns	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
97	1	Maria Mu�Oz Rodrigo		maria_mu�oz_rodrigo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
98	1	Luis Antonio Espinoza Anosemema		luis_antonio_espinoza_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
99	1	Rafael Pingo Salazar	bulsnosi #	rafael_pingo_salazar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
100	1	Mercedes Vilchez Madrid		mercedes_vilchez_madri	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
101	1	Raul Augusto Aguirre Roman		raul_augusto_aguirre_r	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
102	1	Martin Martell Lopez		martin_martell_lopez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
103	1	Idelso Chavez Fernandez		idelso_chavez_fernande	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
104	1	Eladia Quispe Quijano		eladia_quispe_quijano	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
105	1	Albano Isidroho Aponte Meza		albano_isidroho_aponte	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
106	1	Jose Yaipen Llontop		jose_yaipen_llontop	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
107	1	Rolando Jose Rondinel Palomino		rolando_jose_rondinel_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
108	1	Fran Vilchez Balcazak		fran_vilchez_balcazak	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
109	1	Sergio Montes Perez		sergio_montes_perez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
110	1	Dionicio Albites Llerena	huancaveli	dionicio_albites_llere	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
111	1	Carre�O Estela Albites Posas	huancaveli	carre�o_estela_albites	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
112	1	Julio Cesar Luque Carassa	manuel cor	julio_cesar_luque_cara	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
113	1	Gianino Terreros Galarza	jr. junin 	gianino_terreros_galar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
114	1	Juan Fernandez Fernandez		juan_fernandez_fernand	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
115	1	Angel Antonio Sanchez Sanchez 	07 de ener	angel_antonio_sanchez_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
116	1	Segundo Tantalean Carranza	calle. aya	segundo_tantalean_carr	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
117	1	Romel Merino Ramirez		romel_merino_ramirez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
118	1	Marco Antonio Acero Kunchio		marco_antonio_acero_ku	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
119	1	Daniel Saldarriaga Cruz		daniel_saldarriaga_cru	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
120	1	Kelly Diaz Gueara		kelly_diaz_gueara	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
121	1	Gustavo Herrera 		gustavo_herrera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
122	1	Gerardo Granda Guzman		gerardo_granda_guzman	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
123	1	Alex Vargas		alex_vargas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
124	1	Elton Jhon Bran Zurita		elton_jhon_bran_zurita	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
125	1	Marco Antonio Aranguren Flores	san juan d	marco_antonio_arangure	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
126	1	Carlos Francisco Auzlus Silva	av.cesar v	carlos_francisco_auzlu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
127	1	Victor Chimoy Sierra		victor_chimoy_sierra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
128	1	Arturo Amaya Correa		arturo_amaya_correa	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
129	1	Hiezzer Mrella Vasquez Diaz	jr.san ped	hiezzer_mrella_vasquez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
130	1	Javier Carrin Diaz	jr.serafin	javier_carrin_diaz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
131	1	Javier Carrin Diaz 	jr. serafi	javier_carrin_diaz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
132	1	Lucy Tania Salazar Herrera		lucy_tania_salazar_her	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
133	1	Suan Nu�Ez Cuba		suan_nu�ez_cuba	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
134	1	Joine Lopez Zapata		joine_lopez_zapata	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
135	1	Maria Lozada Saucedo	sanchez ce	maria_lozada_saucedo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
136	1	Manuel Alejandro Espejo Zeballos		manuel_alejandro_espej	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
137	1	Juan Francisco Cieza Tuarez	san franci	juan_francisco_cieza_t	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
138	1	Cesar Tellado Costan		cesar_tellado_costan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
139	1	Jose Maria Rea�O Fuentes	los manta 	jose_maria_rea�o_fuent	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
140	1	Franco Luigui Florian Heras		franco_luigui_florian_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
141	1	Jorge Ibanza 		jorge_ibanza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
142	1	Edwin Davila Ruiz		edwin_davila_ruiz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
143	1	Adam Llempen Sanchez		adam_llempen_sanchez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
144	1	Alexis Paul Pintado Perez	apintado@b	alexis_paul_pintado_pe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
145	1	Alex Cieza Silva		alex_cieza_silva	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
146	1	Karla Document Duran	urb.el pac	karla_document_duran	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
147	1	Fredy Carlos Sotomayor Espinoza	jr.padro #	fredy_carlos_sotomayor	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
148	1	Mariano Yaipen Salazar	andomaylos	mariano_yaipen_salazar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
149	1	Segundo Rumar Rojas	av.colonia	segundo_rumar_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
150	1	Agustin Alva Diaz	urb. boliv	agustin_alva_diaz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
151	1	Rosa Uculmana Villogomez		rosa_uculmana_villogom	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
152	1	Adriano Francisco Ruiz Garcia		adriano_francisco_ruiz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
153	1	Maritza Claudia Cupe Rodriguez	urb.prader	maritza_claudia_cupe_r	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
154	1	Eusebro Gil Cojal 	jr.cesar v	eusebro_gil_cojal	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
155	1	Victor Avellaneda Estrella 		victor_avellaneda_estr	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
156	1	Daniel Guerrero Neyra 		daniel_guerrero_neyra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
157	1	Frollan Edmundo Chavez Angulo	jr. vega 1	frollan_edmundo_chavez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
158	1	Juan Jose Casta�Eda Leon		juan_jose_casta�eda_le	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
159	1	Agusto Novoa Lizamaga		agusto_novoa_lizamaga	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
160	1	Pedro Arroyo Perez		pedro_arroyo_perez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
161	1	Fredy Soveno Mandajano		fredy_soveno_mandajano	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
162	1	David Salazar Vigo		david_salazar_vigo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
163	1	Javier Romero Vizcardo		javier_romero_vizcardo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
164	1	Joseluis Mateo Medina		joseluis_mateo_medina	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
165	1	Darwin Chorly Villanueva Diaz	jr.bolivar	darwin_chorly_villanue	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
166	1	Angel Melandro Taboada Ino�An		angel_melandro_taboada	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
167	1	Luis Segura Gonzales		luis_segura_gonzales	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
168	1	Daniel Herrera Del Castillo		daniel_herrera_del_cas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
169	1	Esly Montenegro Acu�A		esly_montenegro_acu�a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
170	1	Martin Horna Galvez		martin_horna_galvez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
171	1	Francisco Paolo Martinez Huamanchumo		francisco_paolo_martin	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
172	1	Erick Chira Melgar 		erick_chira_melgar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
173	1	Juan Chavarry Rodriguez		juan_chavarry_rodrigue	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
174	1	Arturo Naya Ruiz 		arturo_naya_ruiz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
175	1	Jose Banda Perez		jose_banda_perez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
176	1	Julio Cesar Horna Agueda		julio_cesar_horna_ague	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
177	1	Pablo Nieto Tantalean		pablo_nieto_tantalean	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
178	1	Jhan Verastegui Rivera		jhan_verastegui_rivera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
179	1	Joyle Diaz Terrones		joyle_diaz_terrones	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
180	1	Joyle Diaz Terrones		joyle_diaz_terrones	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
181	1	Leonardo Huanca Tacuri		leonardo_huanca_tacuri	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
182	1	David Huanca 		david_huanca	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
183	1	Luis Guillermo Rolla Chang		luis_guillermo_rolla_c	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
184	1	Felix Martinez Velarde		felix_martinez_velarde	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
185	1	Emily Cabrera Veza		emily_cabrera_veza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
186	1	 Leonardo Coronel Figueroa		leonardo_coronel_figue	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
187	1	Yosep Girao Grecco		yosep_girao_grecco	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
188	1	Andres Oregan		andres_oregan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
189	1	Leslie Torres Villacorta	jr.mayo 36	leslie_torres_villacor	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
190	1	Enriquie Bayoma Pumzaca		enriquie_bayoma_pumzac	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
191	1	Rodolfo Yugra Velarde		rodolfo_yugra_velarde	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
192	1	Eduardo Cuba Huarcaya 	av. las am	eduardo_cuba_huarcaya	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
193	1	Alfredo Bazan Mez		alfredo_bazan_mez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
194	1	Jhony Rojas Estrada		jhony_rojas_estrada	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
195	1	Ruth Elizabeth Cabrejo Gonzales		ruth_elizabeth_cabrejo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
196	1	Carlos Alberto Rorres Abanto	urb.miguel	carlos_alberto_rorres_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
197	1	Cristhian Aguilar Abad	cpc_@hotma	cristhian_aguilar_abad	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
198	1	Enrique Vara Cardenas	mz. n lote	enrique_vara_cardenas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
199	1	Miguel Yartin Araujo		miguel_yartin_araujo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
200	1	Roy Mayorca Rodriguez		roy_mayorca_rodriguez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
201	1	Cintya Salazar Rojas		cintya_salazar_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
202	1	Angel Arnaldo Cornejo Davila	av. mesone	angel_arnaldo_cornejo_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
203	1	Jose Moreno	jr.electro	jose_moreno	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
204	1	Luis Jesus Alvarez Tu�Oque	av.pedro t	luis_jesus_alvarez_tu�	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
205	1	Leonel Rodas Vasquez		leonel_rodas_vasquez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
206	1	Sergio Quispe Gomez		sergio_quispe_gomez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
207	1	Mario Anibal Garcia De Los Rios 		mario_anibal_garcia_de	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
208	1	Elizabeth Lopez Alamo		elizabeth_lopez_alamo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
209	1	Marco Vilchez Prieto		marco_vilchez_prieto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
210	1	Carlos Acosta Lulesma		carlos_acosta_lulesma	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
211	1	Esteban Eduardo Yabar Due�As		esteban_eduardo_yabar_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
212	1	Yessenia Rios Pasco		yessenia_rios_pasco	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
213	1	Jorge Moreno Kong		jorge_moreno_kong	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
214	1	Jose Manuel Urbina Sandoval		jose_manuel_urbina_san	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
215	1	Ricardo Rios Lozada		ricardo_rios_lozada	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
216	1	Rosana Garcia Perez		rosana_garcia_perez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
217	1	Lucila Magaly Cerna Chala		lucila_magaly_cerna_ch	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
218	1	Stefanie Portuando Hernando		stefanie_portuando_her	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
219	1	Katia Aita Cubas 		katia_aita_cubas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
220	1	Jovita Veronica Sanchez Tapia		jovita_veronica_sanche	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
221	1	Diomedes Dias Quispe		diomedes_dias_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
222	1	Marco Antonio Aguirre Camacho	mariscal u	marco_antonio_aguirre_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
223	1	Marileine Nieto Rojas		marileine_nieto_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
224	1	Tahama Moran Macera 	av. del ri	tahama_moran_macera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
225	1	Jesus Orlando Orovila Flores	yupac yupa	jesus_orlando_orovila_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
226	1	Carlos Guerrero	av. qui�on	carlos_guerrero	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
227	1	Javier Garcia Ruesta 	jr. apurim	javier_garcia_ruesta	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
228	1	Ramiro Vanessa Ortiz Quintana		ramiro_vanessa_ortiz_q	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
229	1	Rosa Angelica Zeta Chapa		rosa_angelica_zeta_cha	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
230	1	Cesar Quintanilla Cacha		cesar_quintanilla_cach	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
231	1	Augusto Soto Wetzhh		augusto_soto_wetzhh	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
232	1	Roxana Bola�Os Grau		roxana_bola�os_grau	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
233	1	Roberto Mena		roberto_mena	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
234	1	Hernan Ramiro Rios Requelme		hernan_ramiro_rios_req	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
235	1	Luis Humberto Gomez Castillo		luis_humberto_gomez_ca	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
236	1	Anibal Yamunaque Silva		anibal_yamunaque_silva	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
237	1	Pierina Miranda Valle	manuel uba	pierina_miranda_valle	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
238	1	Vicente Egviguren Prneli		vicente_egviguren_prne	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
239	1	Jenny Cerna Quilcate		jenny_cerna_quilcate	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
240	1	Eduardo Inazabal Alerne		eduardo_inazabal_alern	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
241	1	Santos Infante Chalan	av.cajamar	santos_infante_chalan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
242	1	David Gamarra Marique		david_gamarra_marique	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
243	1	Margot Chavez Calsas		margot_chavez_calsas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
244	1	Percy Huaman Galeina		percy_huaman_galeina	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
245	1	Elvis Aguinaga Concho	jr.monto r	elvis_aguinaga_concho	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
246	1	Julio Luis Bendezu Mora	s.j.m	julio_luis_bendezu_mor	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
247	1	Jorge De La Cruz Rojas	pasaje. pe	jorge_de_la_cruz_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
248	1	Santos Gomez Sanchez	benito jua	santos_gomez_sanchez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
249	1	Ruben Barrera Fortunato	jr torres 	ruben_barrera_fortunat	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
250	1	Violeta Montenegro Mechuto	cusco # 11	violeta_montenegro_mec	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
251	1	Juan Culqui Mendoza		juan_culqui_mendoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
252	1	Ricardo Caballero Curo		ricardo_caballero_curo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
253	1	Susan Campos Barrientes	urb. bello	susan_campos_barriente	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
254	1	Jorge Ignacio Torres		jorge_ignacio_torres	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
255	1	Paul Henry Gonzales Mi�An	libertad #	paul_henry_gonzales_mi	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
256	1	Grimaldo Vasquez Tan		grimaldo_vasquez_tan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
257	1	Ramiro Quevara Gonzales		ramiro_quevara_gonzale	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
258	1	Nancy Carranzallanos		nancy_carranzallanos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
259	1	Ulises Sanchez Mendoza 		ulises_sanchez_mendoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
260	1	William Chunga Trelles 	av. los ro	william_chunga_trelles	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
261	1	Fernando Flores Panduro		fernando_flores_pandur	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
262	1	Maria Fernanda Arroyo Gorn	av. buena 	maria_fernanda_arroyo_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
263	1	Christian Molliinero Arenas	av. brasil	christian_molliinero_a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
264	1	Miguel Tello Prieto		miguel_tello_prieto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
265	1	Luis Miguel Palomino Ramirez	segundo ca	luis_miguel_palomino_r	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
266	1	Luis Maldonado Roman		luis_maldonado_roman	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
268	1	Giovene Perez Campomanes 		giovene_perez_campoman	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
269	1	Jhon Leon Cruzado		jhon_leon_cruzado	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
270	1	Manuel Enrique Chavez Flores		manuel_enrique_chavez_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
271	1	Raul Ezequiel Go�I Chacaltana 		raul_ezequiel_go�i_cha	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
272	1	Janett Victoria Torres Vergara		janett_victoria_torres	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
273	1	Julio Leon Cuera		julio_leon_cuera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
274	1	Edwin Rojas Jimenez		edwin_rojas_jimenez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
275	1	Tatiana Vallejos Tiparra		tatiana_vallejos_tipar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
276	1	Francisco Perez Romero		francisco_perez_romero	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
277	1	Mauro Alvarez Rivadeneira		mauro_alvarez_rivadene	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
278	1	Angel Martin Orellano Ramirez 	los martir	angel_martin_orellano_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
279	1	Jose Rodriguez 		jose_rodriguez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
280	1	Wilbert Marin Soto	av.bolivar	wilbert_marin_soto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
281	1	Victor Hugo Aguilar Leon		victor_hugo_aguilar_le	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
282	1	Ricardo Manuel Delgado Arana		ricardo_manuel_delgado	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
283	1	Jean Paul Echevarria Huaman	san isidro	jean_paul_echevarria_h	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
284	1	Jmmy Alexander Pacheco Marchan 		jmmy_alexander_pacheco	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
285	1	Jaime Luis Puma Pizarro	miguel gra	jaime_luis_puma_pizarr	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
286	1	Portocarrero Cesar Del Carpio		portocarrero_cesar_del	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
287	1	Santiago Martin Espinoza Vargas 		santiago_martin_espino	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
288	1	Alfredo Paul Lopez Acosta	urb. covic	alfredo_paul_lopez_aco	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
289	1	Joel Santana Llanos 		joel_santana_llanos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
290	1	Percy Rivera Agurto		percy_rivera_agurto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
291	1	Ruben Dario Hi�Api Del Castillo		ruben_dario_hi�api_del	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
292	1	Elva Huaman Gormas		elva_huaman_gormas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
293	1	Judit Taijo Ramos		judit_taijo_ramos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
294	1	Luis Villavilencio Arteaga		luis_villavilencio_art	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
295	1	Hugo Alfredo Molocho Estela		hugo_alfredo_molocho_e	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
296	1	Hugo Molocho Estela		hugo_molocho_estela	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
297	1	Franciso Santiago Espinoza Orrego		franciso_santiago_espi	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
298	1	Jesus Manuel Izaguirre		jesus_manuel_izaguirre	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
299	1	Wilson Ortiz Veloz		wilson_ortiz_veloz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
300	1	Julio Cesar Cespedes Ramirez		julio_cesar_cespedes_r	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
301	1	Merarda Agurto De Julca		merarda_agurto_de_julc	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
302	1	Gerardo Humberto Llanos Bocanegra		gerardo_humberto_llano	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
303	1	Wilder Isla Idone 		wilder_isla_idone	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
304	1	Nancy Rodriguez Zavaleta		nancy_rodriguez_zavale	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
305	1	Pedro Menesos		pedro_menesos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
306	1	Javier Gonzales		javier_gonzales	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
307	1	Lucia Aguinaga Gastelo		lucia_aguinaga_gastelo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
308	1	Marco Antonio Aranguren Flores 	s.j.m	marco_antonio_arangure	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
309	1	Marcos Perez Paita	jr. 8 de o	marcos_perez_paita	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
310	1	Simon Andrade Espinoza	av. tacna 	simon_andrade_espinoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
311	1	Arnado Arevalo		arnado_arevalo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
312	1	Yesy Lalupu Valladolid		yesy_lalupu_valladolid	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
313	1	Elber Paz Saavedra		elber_paz_saavedra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
314	1	Eduardo Rando Espinoza Lopez		eduardo_rando_espinoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
315	1	Luis Alberto Ortiz Gonzales		luis_alberto_ortiz_gon	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
316	1	Edson Reynoso Amaro	zarate 	edson_reynoso_amaro	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
317	1	Julio Cesar Maximiliano Rosas		julio_cesar_maximilian	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
318	1	Joseluis Kcomt Kcomt	alvarez ca	joseluis_kcomt_kcomt	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
319	1	Victor Jose Rojas Rosas		victor_jose_rojas_rosa	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
320	1	Marco Antonio Fajardo Chavez		marco_antonio_fajardo_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
321	1	Jose Rodriguez Lau		jose_rodriguez_lau	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
322	1	Ronald Garcia Hoyos		ronald_garcia_hoyos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
323	1	Jony Anccasi Ramos		jony_anccasi_ramos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
324	1	Rosario Aldivia Zuasnabar 		rosario_aldivia_zuasna	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
325	1	Unther Mauricio Gomez Vargas	manco capa	unther_mauricio_gomez_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
326	1	Alexander Gonzales Burga		alexander_gonzales_bur	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
327	1	Alexander Quilcate Vigo 		alexander_quilcate_vig	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
328	1	Herless Salinas Herquinio		herless_salinas_herqui	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
329	1	Miduard Cespedes Corazas		miduard_cespedes_coraz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
330	1	Edward Gonzales Arevalo		edward_gonzales_areval	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
331	1	Cesar Torres Coronado		cesar_torres_coronado	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
332	1	Miguel Angel Vega Bustamante 		miguel_angel_vega_bust	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
333	1	Roberto Montes Mellendez		roberto_montes_mellend	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
334	1	Lex Vargas		lex_vargas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
335	1	Edduard Ordinola Sullan		edduard_ordinola_sulla	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
336	1	David Gamarra Marique		david_gamarra_marique	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
337	1	Luis Bryan Gonzales Custodio		luis_bryan_gonzales_cu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
338	1	Ruben Cruz Calderon		ruben_cruz_calderon	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
339	1	Rene Luciano Damian Soriano	leon pined	rene_luciano_damian_so	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
340	1	Marco Antonio Avila Tapia		marco_antonio_avila_ta	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
341	1	Jorge Heucostroza Macuri		jorge_heucostroza_macu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
342	1	Jose Flores Del Castillo		jose_flores_del_castil	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
343	1	Milton Giron		milton_giron	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
344	1	Hildelarzo Guevara Vargas		hildelarzo_guevara_var	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
345	1	Jose Zumareta Gonzales		jose_zumareta_gonzales	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
346	1	Mirtha Hullcachuari Quispe 		mirtha_hullcachuari_qu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
347	1	Fabian Orlando Aznaran Espinales		fabian_orlando_aznaran	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
348	1	Joseluis Haro Mendoza	jr arequip	joseluis_haro_mendoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
349	1	Moises Guzman Santamaria		moises_guzman_santamar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
350	1	Julio Castro Campos		julio_castro_campos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
351	1	Eleuterio Olanda Rojas		eleuterio_olanda_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
352	1	Antonio Tamarit		antonio_tamarit	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
353	1	Vilma Lopez Velasquez		vilma_lopez_velasquez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
354	1	Pedro Vigo Limay		pedro_vigo_limay	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
355	1	Marco Rafael Teran Arribasplata		marco_rafael_teran_arr	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
356	1	Manuel Mandubi Santamaria		manuel_mandubi_santama	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
357	1	Federico Gallegos Melo		federico_gallegos_melo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
358	1	Cesar Gomez		cesar_gomez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
359	1	Enrique Alberto Bayona Pumzaca		enrique_alberto_bayona	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
360	1	Arturo Minaya Ruiz	nicaragua 	arturo_minaya_ruiz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
361	1	Amado Mendoza Argomedo 		amado_mendoza_argomedo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
362	1	Miguel Angel Pajuelo Way		miguel_angel_pajuelo_w	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
363	1	Armando Pastor Senguin		armando_pastor_senguin	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
364	1	Oscar Guzman Caicedo		oscar_guzman_caicedo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
365	1	Cesar Julio Carrera Malque	za�a	cesar_julio_carrera_ma	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
366	1	Anacleto Lira Oscar		anacleto_lira_oscar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
367	1	Justiniano Chuqimango Valera		justiniano_chuqimango_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
368	1	Roberto Millan Acero		roberto_millan_acero	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
369	1	Conrado Machuca Hidalgo		conrado_machuca_hidalg	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
370	1	Ivan Cruzado		ivan_cruzado	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
371	1	Arturo Gonzales Ubillus		arturo_gonzales_ubillu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
372	1	Carlos Quispe Mendoza		carlos_quispe_mendoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
373	1	Paul Odar Arroyo		paul_odar_arroyo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
374	1	Roberto Zanabria Motta		roberto_zanabria_motta	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
375	1	Roxana Ordo�As Mendoza		roxana_ordo�as_mendoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
376	1	Fercio Flores Llontop		fercio_flores_llontop	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
377	1	Isuro Perez Quispe		isuro_perez_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
378	1	Victor Reyes Manayay		victor_reyes_manayay	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
379	1	Victor Reyes Manayay		victor_reyes_manayay	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
380	1	Marlo Tesen Quispe		marlo_tesen_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
381	1	Mario Obando Flores		mario_obando_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
382	1	Marco Gonzales Aguilar		marco_gonzales_aguilar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
383	1	Merlyn Osorio Vilches		merlyn_osorio_vilches	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
384	1	Luis Alberto Mamani		luis_alberto_mamani	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
385	1	Jorge Luis Pe�A Quintero		jorge_luis_pe�a_quinte	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
386	1	Hugo Garces Parra		hugo_garces_parra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
387	1	David Rojas Falen 		david_rojas_falen	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
388	1	Patricia Santivan		patricia_santivan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
389	1	Ivan Jose Vasquez Zegarra		ivan_jose_vasquez_zega	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
390	1	Erick Mejia Torres		erick_mejia_torres	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
391	1	Juan Gamarra �Iquen		juan_gamarra_�iquen	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
392	1	Samuel Cubas Quispe		samuel_cubas_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
393	1	Jose Bazan Oblitas		jose_bazan_oblitas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
394	1	Eduardo Quino Flores		eduardo_quino_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
395	1	Jesus Sanchez Sampen		jesus_sanchez_sampen	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
396	1	Juan Pisfil Capu�Ay		juan_pisfil_capu�ay	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
397	1	Elio Tronco Zapata		elio_tronco_zapata	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
398	1	Francisco Huayra Aguilar		francisco_huayra_aguil	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
399	1	Marco Torres Serrano		marco_torres_serrano	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
400	1	Percy Angulo Mejia		percy_angulo_mejia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
401	1	Valeriano Tacza Paulino		valeriano_tacza_paulin	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
402	1	Jose Guitierrez Montes 		jose_guitierrez_montes	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
403	1	Renso Ayon Infante		renso_ayon_infante	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
404	1	Erick Merino Villacorta		erick_merino_villacort	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
405	1	Lorena Escobar Flores		lorena_escobar_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
406	1	Tomas Arango Ayala 		tomas_arango_ayala	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
407	1	Carlos Rojas		carlos_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
408	1	Zenon Valentin Perez		zenon_valentin_perez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
409	1	Joseluis Velasco Odar		joseluis_velasco_odar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
410	1	Eduar Hoyos Perez		eduar_hoyos_perez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
411	1	Maria Jesus Berrties Chafloque		maria_jesus_berrties_c	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
412	1	Jorge Soto R.		jorge_soto_r.	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
413	1	Yosmer Perez Diaz		yosmer_perez_diaz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
414	1	Rogger Chichupe Rojas		rogger_chichupe_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
415	1	Alberto Llunena Garcia		alberto_llunena_garcia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
416	1	Tito Ortiz Pinedo		tito_ortiz_pinedo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
417	1	Frey Yaipen Rojas		frey_yaipen_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
418	1	Rodrigo Parra Mendoza		rodrigo_parra_mendoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
419	1	 Carlos Parra Aguirre		carlos_parra_aguirre	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
420	1	Marco Cuadros		marco_cuadros	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
421	1	Luis Felipe Palomino		luis_felipe_palomino	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
422	1	Els Cachay Barreto		els_cachay_barreto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
423	1	Roberto Marineo Horna		roberto_marineo_horna	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
424	1	Abelardo Salazar Castillo		abelardo_salazar_casti	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
425	1	Juan Segundo Hidrogo Ramirez		juan_segundo_hidrogo_r	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
426	1	Raul Robles Ramos		raul_robles_ramos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
427	1	Jose Leonardo Delgado Fuentes		jose_leonardo_delgado_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
428	1	Juan Medina A 		juan_medina_a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
429	1	Isabel Fabiola Castillo Sifuentes		isabel_fabiola_castill	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
430	1	Angie Mucha Arellano		angie_mucha_arellano	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
431	1	Mima Inga Paredes		mima_inga_paredes	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
432	1	Juan Fernandez Fernandez		juan_fernandez_fernand	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
433	1	Victor Rojas Rosas		victor_rojas_rosas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
434	1	Rolando Suppe Chavez 		rolando_suppe_chavez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
435	1	Jos� Lu�S Kcomt Kcomt		jos�_lu�s_kcomt_kcomt	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
436	1	Abel Ferrer Guerra		abel_ferrer_guerra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
437	1	Rolando Garc�A Garc�A		rolando_garc�a_garc�a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
438	1	Ricardo Zambrano Escobal		ricardo_zambrano_escob	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
439	1	Ronal Horna Culqui		ronal_horna_culqui	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
440	1	Javier Ezcurra		javier_ezcurra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
441	1	Eric Chira Melgar 		eric_chira_melgar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
442	1	Gregorio Gutierrez Huaman		gregorio_gutierrez_hua	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
443	1	Jos� Manuel Carbajal Perez 		jos�_manuel_carbajal_p	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
444	1	Manuel Enoque Atoncio		manuel_enoque_atoncio	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
445	1	Alex Vargas		alex_vargas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
446	1	Gaiuy Tuesta Monteza		gaiuy_tuesta_monteza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
447	1	David Arizola		david_arizola	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
448	1	Roberto Vega Garay		roberto_vega_garay	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
449	1	Ronal Perez Heredia		ronal_perez_heredia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
450	1	Mario Marrufo Tapia		mario_marrufo_tapia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
451	1	Martin Garc�A Perez		martin_garc�a_perez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
452	1	Germ�N Alvarado Caballero		germ�n_alvarado_caball	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
453	1	Cesar Quispe 		cesar_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
454	1	Victor Iba�Ez Bernui		victor_iba�ez_bernui	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
455	1	Abner Leon Bobadilla		abner_leon_bobadilla	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
456	1	Edgardo Huamanchumo Choncen		edgardo_huamanchumo_ch	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
457	1	Cesar Enrriquez Pimentel		cesar_enrriquez_piment	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
458	1	Cesar Lozano Flores		cesar_lozano_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
459	1	Mart�N Farf�N Bernilla		mart�n_farf�n_bernilla	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
460	1	Francisco Alba		francisco_alba	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
461	1	Yuny Diaz 		yuny_diaz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
462	1	Carlos Ramirez Ramirez		carlos_ramirez_ramirez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
463	1	Wilson Chavez Guerrero		wilson_chavez_guerrero	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
464	1	Oscar Pisco Gonzales		oscar_pisco_gonzales	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
465	1	Adriana Carontes Vidal		adriana_carontes_vidal	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
466	1	Iv�N Diaz Gonzales		iv�n_diaz_gonzales	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
467	1	Elmer Neira Ramirez 		elmer_neira_ramirez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
468	1	Luis Salazar Plasencia		luis_salazar_plasencia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
469	1	Jose Bendez 		jose_bendez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
470	1	Carsten Ley		carsten_ley	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
471	1	Jose No Distingo		jose_no_distingo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
472	1	Misael Josep Chong Rios		misael_josep_chong_rio	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
473	1	Francisco Flores Loreto		francisco_flores_loret	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
474	1	Paola Lisseth Huaman Mendoza		paola_lisseth_huaman_m	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
475	1	Luis Alberto Casttillo Lecaros		luis_alberto_casttillo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
476	1	Arturo Rosado Fuentes		arturo_rosado_fuentes	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
477	1	Luc�A Raquel Castro Montoya		luc�a_raquel_castro_mo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
478	1	Edgardo Lawi Ruiz		edgardo_lawi_ruiz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
479	1	Luis Vargas Rodriguez		luis_vargas_rodriguez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
480	1	Segundo Odar Verona		segundo_odar_verona	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
481	1	Cesar Angelo Reyes Contreras		cesar_angelo_reyes_con	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
482	1	Carlos Monceda Ascenio		carlos_monceda_ascenio	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
483	1	Edward Alegr�A Rubi�Os		edward_alegr�a_rubi�os	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
484	1	Rolando Garc�A Garc�A		rolando_garc�a_garc�a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
485	1	Jerika Serna Curo		jerika_serna_curo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
486	1	Aylen Zo� Rojas Lopez		aylen_zo�_rojas_lopez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
487	1	Jos� Zantisteban Morales		jos�_zantisteban_moral	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
488	1	Belly Manolo Su�Rez D�Az		belly_manolo_su�rez_d�	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
489	1	Angel Alanoca		angel_alanoca	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
490	1	Julio Magallanes		julio_magallanes	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
491	1	Orlando Nu�Ez Moreno		orlando_nu�ez_moreno	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
492	1	Jaime Garc�A		jaime_garc�a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
493	1	Seugundo Izquierdo Cortegance		seugundo_izquierdo_cor	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
494	1	Joseluis Gavi�A Huamancondor		joseluis_gavi�a_huaman	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
495	1	Erick Zanala Olivos		erick_zanala_olivos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
496	1	Gregorio Flores Gaicedo		gregorio_flores_gaiced	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
497	1	Luis Ipanaque Melendres		luis_ipanaque_melendre	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
498	1	Jose Uriarte		jose_uriarte	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
499	1	Javier Flores Guanilo		javier_flores_guanilo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
500	1	Tony Mandura Sanchez		tony_mandura_sanchez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
501	1	 Jose Antonio Ernandez Quiroz		jose_antonio_ernandez_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
502	1	Roberto Marines Llevena		roberto_marines_lleven	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
503	1	Roberto Valdivia Terry		roberto_valdivia_terry	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
504	1	Antonio Delgado Fernandez		antonio_delgado_fernan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
505	1	Evaristo Serrato Pupuche		evaristo_serrato_pupuc	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
506	1	Juan Alberto Chavarri Rodriguez		juan_alberto_chavarri_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
507	1	Tania Espinoza Fiestas		tania_espinoza_fiestas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
508	1	Roberto Reategui Salda�A		roberto_reategui_salda	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
509	1	Jilmer Delgado 		jilmer_delgado	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
510	1	Carlos Pe�A		carlos_pe�a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
511	1	Victor Piscoya Ino�An		victor_piscoya_ino�an	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
512	1	Demetrio Eslava		demetrio_eslava	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
513	1	Celinda Berru Garcia		celinda_berru_garcia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
514	1	Manuel Taco Montalgo		manuel_taco_montalgo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
515	1	Greni Cata�Eda Cris�Logo		greni_cata�eda_cris�lo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
516	1	Carlos Enrique Caza Carmona		carlos_enrique_caza_ca	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
517	1	Manuel Serrato Serrato		manuel_serrato_serrato	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
518	1	Miguel Angel Agapito Pisfil		miguel_angel_agapito_p	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
519	1	Pechaza Perleche		pechaza_perleche	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
520	1	Alfredo Bazan Meza		alfredo_bazan_meza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
521	1	Luigi Augusto Giron Martinez		luigi_augusto_giron_ma	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
522	1	Jos� Bustamante Medina		jos�_bustamante_medina	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
523	1	Cristian Garcia Quiroz		cristian_garcia_quiroz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
524	1	Davila Bed�N Ascurra		davila_bed�n_ascurra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
525	1	Patricia Morales Cubas		patricia_morales_cubas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
526	1	Miguel Izquierdo Castrejon		miguel_izquierdo_castr	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
527	1	Rafael Ernesto Sandoval Saldarriaga		rafael_ernesto_sandova	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
528	1	Marco Antonio Arias Guevara		marco_antonio_arias_gu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
529	1	Michael Mantos Campo		michael_mantos_campo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
530	1	Percy Ortiz Guerra		percy_ortiz_guerra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
531	1	Jorge Armando Pastor Serquen		jorge_armando_pastor_s	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
532	1	Jorge Mu�Oz Bravo		jorge_mu�oz_bravo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
533	1	Vicente Nu�Ez 		vicente_nu�ez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
534	1	German Santamaria Paldera		german_santamaria_pald	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
535	1	Jeancor Diaz Morales		jeancor_diaz_morales	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
536	1	Lore Santisteban Morales		lore_santisteban_moral	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
537	1	Mar�A Paz Saavedra		mar�a_paz_saavedra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
538	1	Joseluis Espinola		joseluis_espinola	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
539	1	Alejandro Cadenillas Ponte		alejandro_cadenillas_p	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
540	1	Robert Wilson Quevedo Linanet		robert_wilson_quevedo_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
541	1	Gaiuy Tuesta Marteza		gaiuy_tuesta_marteza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
542	1	Nombres Apellidos		nombres_apellidos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
543	1	Katty Bravo		katty_bravo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
544	1	Julio Cesar Carrera Malque		julio_cesar_carrera_ma	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
545	1	Vladimir Saturno Alvarez		vladimir_saturno_alvar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
546	1	Jessica Infanzon Rojas		jessica_infanzon_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
547	1	Lidia Maximina Solano Garcia		lidia_maximina_solano_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
548	1	Carlos Hernandez Torres		carlos_hernandez_torre	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
549	1	Stalin Joel Vasquez Ruiz		stalin_joel_vasquez_ru	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
550	1	Lino Reynaldo Reyna Cornejo		lino_reynaldo_reyna_co	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
551	1	Gledis Sabina Ramos Horna		gledis_sabina_ramos_ho	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
552	1	Ana Maria Qui��Ones Vasquez		ana_maria_qui��ones_va	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
553	1	Edmundo Evaristo Carranza Rubio		edmundo_evaristo_carra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
554	1	Arturo Silvano Vega Rojas		arturo_silvano_vega_ro	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
555	1	Ana Maria Vizcarra Idrogo		ana_maria_vizcarra_idr	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
556	1	Calef Willian Echevarria Alanya		calef_willian_echevarr	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
557	1	Antonio Fernandez Delgado		antonio_fernandez_delg	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
558	1	Carmen Albites Llerem		carmen_albites_llerem	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
559	1	Edwin Revilla Mogrovejo		edwin_revilla_mogrovej	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
560	1	Gerardo Humberto Lamas Bocanegra		gerardo_humberto_lamas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
561	1	Sonia Isabel Diaz Cordoba		sonia_isabel_diaz_cord	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
562	1	Jose Yaipen Llontop		jose_yaipen_llontop	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
563	1	Carmen Albites Posas		carmen_albites_posas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
564	1	Dionisio Albites Lleren		dionisio_albites_llere	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
565	1	Luis Antonio Espinosa Anosemena		luis_antonio_espinosa_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
566	1	Frank Vilchez Balcazar		frank_vilchez_balcazar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
567	1	Sergio Montes Perez		sergio_montes_perez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
568	1	Maria Mu��Oz Rodrigo		maria_mu��oz_rodrigo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
569	1	Rolando Rondinel Palomino		rolando_rondinel_palom	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
570	1	Josue Escobedo Ramos		josue_escobedo_ramos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
571	1	Fernando Ramirez Navarro		fernando_ramirez_navar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
572	1	Eva Maria Jayo Huamani		eva_maria_jayo_huamani	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
573	1	Freddy De La Cruz Mesias		freddy_de_la_cruz_mesi	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
574	1	Jose Luis Cabrera Tafur		jose_luis_cabrera_tafu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
575	1	Eladin Quispe Yetano		eladin_quispe_yetano	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
576	1	Jose Edgar Santa Cruz Solano		jose_edgar_santa_cruz_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
577	1	Raul Augusto Rodriguez Roman		raul_augusto_rodriguez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
578	1	Francisco Pretel Rojas		francisco_pretel_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
579	1	Arturo Torres Seminario		arturo_torres_seminari	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
580	1	Jhony Ignacio Flores		jhony_ignacio_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
581	1	Daniel Ivan Mamani Maldonado		daniel_ivan_mamani_mal	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
582	1	Ermes Yran Saucedo Guzman		ermes_yran_saucedo_guz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
583	1	Reynaldo Alejandro Fuentes Alto		reynaldo_alejandro_fue	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
584	1	Edwin Ronald Villanueva Flores		edwin_ronald_villanuev	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
585	1	Daniel Ivan Mamani Maldonado		daniel_ivan_mamani_mal	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
586	1	Isabel Blass		isabel_blass	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
587	1	Cesar Montenegro		cesar_montenegro	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
588	1	Eduardo Flores Ramines		eduardo_flores_ramines	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
589	1	Alejandro Fuentes Alto		alejandro_fuentes_alto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
590	1	Catherin Reategui Meza		catherin_reategui_meza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
591	1	Mauro Alvaro Rivadeneira		mauro_alvaro_rivadenei	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
592	1	Leticia Gemin Chavez		leticia_gemin_chavez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
593	1	Pablo Nino Tantalean		pablo_nino_tantalean	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
594	1	Alicia Abanto Baldera		alicia_abanto_baldera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
595	1	Antonio Fernando Delgado		antonio_fernando_delga	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
596	1	Wendy Ruidiez Saavedra		wendy_ruidiez_saavedra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
597	1	Teresa Benitez Infantes		teresa_benitez_infante	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
598	1	Margot Nieves Silopu		margot_nieves_silopu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
599	1	Carmen Vilchez Atarama		carmen_vilchez_atarama	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
600	1	Elvis Vasquez Escobedo		elvis_vasquez_escobedo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
601	1	Natividad Albines De Herrera		natividad_albines_de_h	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
602	1	Raul Asam Lizama		raul_asam_lizama	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
603	1	Cesar Ignacio Barrio De Mendoza		cesar_ignacio_barrio_d	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
604	1	Horacio Abarca Salazar		horacio_abarca_salazar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
605	1	Augusto Santos Carrasco		augusto_santos_carrasc	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
606	1	Walter Cortegana		walter_cortegana	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
607	1	Cruz Guervara Jony		cruz_guervara_jony	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
608	1	Huber Giovanni Marin Garcia		huber_giovanni_marin_g	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
609	1	Elizabeth De Lourdes Miranda Palomino		elizabeth_de_lourdes_m	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
610	1	Jony Hander Cruz Guevara		jony_hander_cruz_gueva	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
611	1	Esperanza Ascencio Balladares		esperanza_ascencio_bal	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
612	1	Noe Fernandez Izquierdo		noe_fernandez_izquierd	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
613	1	Andreas Furrer		andreas_furrer	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
614	1	Elinton Michael Perez Cubas	jr. tacna 574 - chulucanas	elinton_michael_perez_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
615	1	Pedro Wilfredo Tipacti Baldera		pedro_wilfredo_tipacti	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
616	1	Maria Del Carmen Quispe Quiroz	av. francisco bolognesi 301 - chocope	maria_del_carmen_quisp	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
617	1	Ines Saavedra Atoche		ines_saavedra_atoche	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
618	1	Juan Nu��Ez Cubas		juan_nu��ez_cubas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
619	1	Pedro Zoe Flores Benites		pedro_zoe_flores_benit	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
620	1	Josue Jacob Asau Pacchioni		josue_jacob_asau_pacch	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
621	1	Abrahan Edilberto Ascue Tocre		abrahan_edilberto_ascu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
622	1	Jose Ricardo Bejarano Panaque		jose_ricardo_bejarano_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
623	1	Elizhabeth Lopez Alama		elizhabeth_lopez_alama	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
624	1	Jorge Torres Garcia		jorge_torres_garcia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
625	1	Ricardo Matril Carrasco		ricardo_matril_carrasc	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
626	1	Moises Beltran Santamaria		moises_beltran_santama	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
627	1	Alexander Enriquez Rojas		alexander_enriquez_roj	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
628	1	Juan Del Carpio Champal		juan_del_carpio_champa	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
629	1	Jose Sobrino Salda��A		jose_sobrino_salda��a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
630	1	Juan Lama Guzman		juan_lama_guzman	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
631	1	Oscar Miranda Guerrero		oscar_miranda_guerrero	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
632	1	Yashira Chavez Villegas		yashira_chavez_villega	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
633	1	Edgar Velasquez Milla		edgar_velasquez_milla	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
634	1	Adriano Ruiz		adriano_ruiz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
635	1	Emerson Contrera Vasquez		emerson_contrera_vasqu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
636	1	Jorge Luis Herrera Tuesta		jorge_luis_herrera_tue	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
637	1	Fernando Raymundo Iturregui Neyra		fernando_raymundo_itur	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
638	1	Elio Zapata Granda		elio_zapata_granda	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
639	1	Daniel Modesto Escobedo Diaz		daniel_modesto_escobed	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
640	1	Victor Emiliano Soto Gutierrez		victor_emiliano_soto_g	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
641	1	Daniel Herrera		daniel_herrera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
642	1	Anderson Reyna Diaz		anderson_reyna_diaz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
643	1	Ana Ventura Galle		ana_ventura_galle	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
644	1	Jose Luis Infante Llanos		jose_luis_infante_llan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
645	1	Jose Luis Paniagua Saldarriaga		jose_luis_paniagua_sal	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
646	1	Rodolfo Yunga Velande		rodolfo_yunga_velande	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
647	1	Marco Antonio Aguirre Camacho		marco_antonio_aguirre_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
648	1	Henry Jame Laban Galvez		henry_jame_laban_galve	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
649	1	Miguel Angel Barrionuevo Castillo		miguel_angel_barrionue	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
650	1	Jose Luis Sanchez Morales		jose_luis_sanchez_mora	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
651	1	Jose Eugenio Santiesteban Morales	jr. la libertad 743 dpto. 402 - magdalena del mar	jose_eugenio_santieste	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
652	1	Jose Chujutall Pe��A		jose_chujutall_pe��a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
653	1	Michael Lopez Carranza		michael_lopez_carranza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
654	1	Fiorella Ponce Torres		fiorella_ponce_torres	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
655	1	Janice Cordova Flores		janice_cordova_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
656	1	Luz Rodriguez Silva		luz_rodriguez_silva	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
657	1	Elaine Chong Garcia		elaine_chong_garcia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
658	1	Jhosep Antony Remigio Checa Tamayo		jhosep_antony_remigio_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
659	1	Miluska Vasquez Gonzales		miluska_vasquez_gonzal	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
660	1	Junior Agudo Rodriguez		junior_agudo_rodriguez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
661	1	Jhoana Valles Garate		jhoana_valles_garate	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
662	1	Javier Gatica Rios		javier_gatica_rios	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
663	1	Oscar David Guzman Caicedo		oscar_david_guzman_cai	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
664	1	Yury Merill Yaipen Quintanilla		yury_merill_yaipen_qui	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
665	1	Yuri Gilbert Cortez Montano		yuri_gilbert_cortez_mo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
666	1	Wilson Neira Flores		wilson_neira_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
667	1	Angela Panduro Pe��A		angela_panduro_pe��a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
668	1	Kenia Salazar Pezo		kenia_salazar_pezo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
669	1	Yefry Cordova Rodriguez		yefry_cordova_rodrigue	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
670	1	Manuel Ushi��Ahua Navarro		manuel_ushi��ahua_nava	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
671	1	Pool Masias Tello		pool_masias_tello	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
672	1	Delfin Chavez Bardales		delfin_chavez_bardales	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
673	1	Mario Antonio Alero Kuncho		mario_antonio_alero_ku	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
674	1	Jose Maria Rea��O Fuentes		jose_maria_rea��o_fuen	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
675	1	Kelly Villalobos Santacruz		kelly_villalobos_santa	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
676	1	Juan Carlos Acosta Pachamango	av. federico villareal 637 - el palomar	juan_carlos_acosta_pac	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
677	1	Asar Agusto Villanueva Novoa		asar_agusto_villanueva	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
678	1	Giancarlo Prieto Cordiglia Hernandez		giancarlo_prieto_cordi	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
679	1	Jose Panta Vilela		jose_panta_vilela	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
680	1	Carlos Guillermo Avila Alvarado		carlos_guillermo_avila	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
681	1	Daniel Antonio Menacho Salinas		daniel_antonio_menacho	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
682	1	Patricia Felicia Inchaustegui Saavedra		patricia_felicia_incha	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
683	1	Royee Francis Morales Melendez		royee_francis_morales_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
684	1	Diego Guillermo Espinoza Benites		diego_guillermo_espino	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
685	1	Diego Loor Faubia Alciviades		diego_loor_faubia_alci	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
686	1	Luis Romayna Ahuite	san jose 1675 -villa maria del triunfo	luis_romayna_ahuite	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
687	1	Aquiles Quiroz Aguinaga	c. las margaritas 215 - la victoria baja	aquiles_quiroz_aguinag	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
688	1	Isabel Garcia Torres	av. m. indacochea 364	isabel_garcia_torres	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
689	1	Jose Antonio Sanchez Chachapoyas	caserio el molino - chancayba��os	jose_antonio_sanchez_c	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
690	1	Luis Guillermo Rocca Chang		luis_guillermo_rocca_c	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
691	1	Elisa Lozano Aguilar		elisa_lozano_aguilar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
692	1	Lelis Reyes Paz		lelis_reyes_paz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
693	1	Eduardo Garces Zevallos		eduardo_garces_zevallo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
694	1	Belgica Gastulo Martinez		belgica_gastulo_martin	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
695	1	Kezra Katherine Garay Sandy		kezra_katherine_garay_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
696	1	Oscar Alberto Mauro Oyola		oscar_alberto_mauro_oy	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
697	1	Hugo Cesar Rojas Sanchez		hugo_cesar_rojas_sanch	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
698	1	Josepil Alotto		josepil_alotto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
699	1	Amallo Rios Concepcion		amallo_rios_concepcion	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
700	1	Jaun Antonio Berrocal Palma		jaun_antonio_berrocal_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
701	1	Liliana Berru Ventura		liliana_berru_ventura	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
702	1	Jorge Iba��Ez Lujan		jorge_iba��ez_lujan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
703	1	Segundo Ricardo Lambrano Escobar		segundo_ricardo_lambra	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
704	1	Franco Florido Mera		franco_florido_mera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
705	1	Juan Carlos Campos Goichochea		juan_carlos_campos_goi	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
706	1	Jorge Tuesta		jorge_tuesta	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
707	1	Elias Santos Huaman		elias_santos_huaman	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
708	1	Jesus Ericson Fernandez Cabrera		jesus_ericson_fernande	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
709	1	Jose Fernandez Calderon		jose_fernandez_caldero	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
710	1	Esteban Jose Chumpitaz Rios		esteban_jose_chumpitaz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
711	1	Jorge Vasquez Villanueva		jorge_vasquez_villanue	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
712	1	Jose Torres Torres		jose_torres_torres	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
713	1	Raul Camacho		raul_camacho	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
714	1	Cesar Mellado Castan		cesar_mellado_castan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
715	1	Carlos Cobe��As Soria		carlos_cobe��as_soria	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
716	1	Abel Perez Clerisa		abel_perez_clerisa	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
717	1	Roger Vilitacio Poldo		roger_vilitacio_poldo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
718	1	Francisco Farro Fernandez		francisco_farro_fernan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
719	1	Rene Storh		rene_storh	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
720	1	Rigoberto Ledeyma Toledo		rigoberto_ledeyma_tole	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
721	1	Marcos Cruzado Sanchez		marcos_cruzado_sanchez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
722	1	Oscar Ivan Lanazen Caicay		oscar_ivan_lanazen_cai	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
723	1	Walter Fernandez Gonzales Falen		walter_fernandez_gonza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
724	1	Greny Casta��Eda Crisologo		greny_casta��eda_criso	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
725	1	Manuel Soza Flores		manuel_soza_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
726	1	Javier Carlin Diaz		javier_carlin_diaz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
727	1	Jose Luis Morales Sanchez		jose_luis_morales_sanc	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
728	1	Roxana Ordo��Ez Mendoza		roxana_ordo��ez_mendoz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
729	1	Esauro Perez Quispe		esauro_perez_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
730	1	Sebastian Vargas Infantes		sebastian_vargas_infan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
731	1	Moises Bertman Santamaria		moises_bertman_santama	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
732	1	Juan Bautista Ramirez Pe��A		juan_bautista_ramirez_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
733	1	Jose Luis Muro Mendoza		jose_luis_muro_mendoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
734	1	Miguel Martin Araujo		miguel_martin_araujo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
735	1	Pablo Ni��O Tantalean		pablo_ni��o_tantalean	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
736	1	Nover Martin Horna Galvez		nover_martin_horna_gal	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
737	1	Eliazen Olano Sancehz		eliazen_olano_sancehz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
738	1	Enrique Vera Cardenas		enrique_vera_cardenas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
739	1	Luis Castillo		luis_castillo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
740	1	Ricardo Castrejon		ricardo_castrejon	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
741	1	Angel Milandro Taboada		angel_milandro_taboada	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
742	1	Javier Romero Vizcardo		javier_romero_vizcardo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
743	1	Abel Perez Ceibisa		abel_perez_ceibisa	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
744	1	Gustavo Herrera Dextre		gustavo_herrera_dextre	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
745	1	Vilma Lopez Velasquez		vilma_lopez_velasquez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
746	1	Santiago Avalo Manrique		santiago_avalo_manriqu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
747	1	Jorge Luis Pe��A Quintero		jorge_luis_pe��a_quint	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
748	1	Mario Abanto Flores		mario_abanto_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
749	1	Suasan Campos Ocementes		suasan_campos_ocemente	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
750	1	Billy Manolo Suarez Dias		billy_manolo_suarez_di	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
751	1	Raul Henry Gonzales Mi��On		raul_henry_gonzales_mi	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
752	1	Angel Alamos		angel_alamos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
753	1	Edgar Roldan Quispe		edgar_roldan_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
754	1	Edgar Roldan Quispe		edgar_roldan_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
755	1	Grinaldo Vasquez Tan		grinaldo_vasquez_tan	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
756	1	Orlando Nu��Es Moreno		orlando_nu��es_moreno	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
757	1	Jaime Garcia		jaime_garcia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
758	1	Alcides Segundo Izquierdo		alcides_segundo_izquie	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
759	1	Julio Maya Llanes		julio_maya_llanes	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
760	1	Jose Hinostraza Maculi		jose_hinostraza_maculi	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
761	1	Milton Renteria		milton_renteria	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
762	1	Edgar Roldan Quispe		edgar_roldan_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
763	1	Jaime Garcia		jaime_garcia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
764	1	Francisco Alba Arteaga	psj. 1ro de septiembre comite 9 lt. 37	francisco_alba_arteaga	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
765	1	Rafael Angel Diaz Monteza	centro patapo mz 43 lt 27	rafael_angel_diaz_mont	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
766	1	Delegacion Cuzco		delegacion_cuzco	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
767	1	Ramiro Guevara Gonzales		ramiro_guevara_gonzale	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
768	1	Jose Luis Gavinta Huamancondor		jose_luis_gavinta_huam	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
769	1	Juan Carlos		juan_carlos	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
770	1	Roger Vintaur Puso		roger_vintaur_puso	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
771	1	Pedro Hurtado Castillo		pedro_hurtado_castillo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
772	1	Guillermo Vasquez		guillermo_vasquez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
773	1	Lorena Pelaez Chavez		lorena_pelaez_chavez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
774	1	Jesus Maria Palacios Palacios		jesus_maria_palacios_p	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
775	1	Manuel Cueva		manuel_cueva	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
776	1	Edgardo Alfonso Ezcurra Cabrera	jr. arriaga 143	edgardo_alfonso_ezcurr	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
777	1	Eduardo Alberto Nu��Ez Zegarra		eduardo_alberto_nu��ez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
778	1	Daniel Ortega Vilchez		daniel_ortega_vilchez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
779	1	Francisco Flores Moretto		francisco_flores_moret	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
780	1	Paola Lisseth Huamani Mendoza		paola_lisseth_huamani_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
781	1	Luis Alberto Castillo		luis_alberto_castillo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
782	1	Maximo Gutierrez Siguenza		maximo_gutierrez_sigue	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
783	1	Lucia Raquel Castro Montoya		lucia_raquel_castro_mo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
784	1	Edgardo Lavi Ruiz		edgardo_lavi_ruiz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
785	1	Cesar Alvarez Rivadeneira		cesar_alvarez_rivadene	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
786	1	Pastor Chate Mendoza		pastor_chate_mendoza	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
787	1	Ancasimo Gallardo		ancasimo_gallardo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
788	1	Zenon Valentin Vilca Perez		zenon_valentin_vilca_p	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
789	1	Diomedes Diaz Quispe		diomedes_diaz_quispe	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
790	1	Lino Castro Coronado		lino_castro_coronado	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
791	1	Tomas Araujo Ayala		tomas_araujo_ayala	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
792	1	Luis Astillaga		luis_astillaga	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
793	1	Mario Cordoba		mario_cordoba	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
794	1	Jesus Orlando Flores		jesus_orlando_flores	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
795	1	Angelo Torres Celis		angelo_torres_celis	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
796	1	D Delegacion Cuzco		d_delegacion_cuzco	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
797	1	Jesus Alvarez Zu��Oque		jesus_alvarez_zu��oque	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
798	1	Mario Benites Chafloque		mario_benites_chafloqu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
799	1	Roger Vicitacion		roger_vicitacion	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
800	1	Federico Rojas Garcia		federico_rojas_garcia	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
801	1	Carlos Cancigo		carlos_cancigo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
802	1	Andy Huaman Perla		andy_huaman_perla	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
803	1	Rolando Javier Garcia Garcia		rolando_javier_garcia_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
804	1	Jorge De La Cruz Rojas		jorge_de_la_cruz_rojas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
805	1	D Delegacion		d_delegacion	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
806	1	Mario Garcia Garavito		mario_garcia_garavito	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
807	1	Gonzalo Moreno Estrada		gonzalo_moreno_estrada	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
808	1	Mercedes Cigue��As Fernandez		mercedes_cigue��as_fer	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
809	1	Jhoana Lujan Cabrera		jhoana_lujan_cabrera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
810	1	Mana Andrade Nune��A		mana_andrade_nune��a	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
811	1	Kati Alta Cubas		kati_alta_cubas	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
812	1	Jorge Sulueta		jorge_sulueta	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
813	1	Cesar Loza Maldonado		cesar_loza_maldonado	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
814	1	Roxana Bolo��A Grau		roxana_bolo��a_grau	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
815	1	Cesar Lora Maldonado		cesar_lora_maldonado	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
816	1	Karlos Chavez Bravo		karlos_chavez_bravo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
817	1	Luis Humberto Gomez Custodio		luis_humberto_gomez_cu	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
818	1	Manuel Chandubi Santiyamir		manuel_chandubi_santiy	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
819	1	Eusebio Carrillo Bonifacio		eusebio_carrillo_bonif	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
820	1	Oscar Sanpen		oscar_sanpen	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
821	1	Eduar Abalos Rubi��Os		eduar_abalos_rubi��os	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
822	1	Carlos Moncada Ascencio		carlos_moncada_ascenci	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
823	1	Jorge Monsalve Sciaccaluga	rafael correa 1226	jorge_monsalve_sciacca	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
824	1	Jose Rodrigo Vivela Carmen	urb. los cedros mz. g lt. 2	jose_rodrigo_vivela_ca	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
825	1	Juan Carlos Martinez Moran	manuel jaramillo 745 zona a	juan_carlos_martinez_m	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
826	1	Martin Climaco Padilla Lay	av. nicolini 172 urb. palao mz. r lt. 18	martin_climaco_padilla	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
827	1	Felipe Ruben Palma Gonzales	jr. miguel grau 473	felipe_ruben_palma_gon	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
828	1	Gonzalo Milciades Romero Cerdan	jr. inclan 378 - pedro galvez	gonzalo_milciades_rome	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
829	1	Luis Miguel Burgos Rozas		luis_miguel_burgos_roz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
830	1	Alex Daniel Meza Laureano		alex_daniel_meza_laure	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
831	1	Alama Savala Esteben		alama_savala_esteben	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
832	1	Cecilia Carmona Vergara		cecilia_carmona_vergar	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
833	1	Lourdes Cajavilca Veramedi		lourdes_cajavilca_vera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
834	1	Carlos Torres Abanto		carlos_torres_abanto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
835	1	Jose Manuel Cerbina Sandoval		jose_manuel_cerbina_sa	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
836	1	Esteban Eduardo Yabas Due��As		esteban_eduardo_yabas_	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
837	1	Luis Tataje Cordova		luis_tataje_cordova	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
838	1	Aylen Zue Rojas Lopez		aylen_zue_rojas_lopez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
839	1	Santos Elide Ruiz Fernandez		santos_elide_ruiz_fern	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
840	1	Vicente Nu��Ez Vileta		vicente_nu��ez_vileta	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
841	1	Alienze Rojas Pasco		alienze_rojas_pasco	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
842	1	David Farias Navarro		david_farias_navarro	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
843	1	Jose Yovera Yahuana		jose_yovera_yahuana	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
844	1	Miguel Pardo		miguel_pardo	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
845	1	Pedro Pablo Bruno Martinez		pedro_pablo_bruno_mart	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
846	1	Jose Lacerna Sanchez		jose_lacerna_sanchez	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
847	1	Cristobal Brophy Soto		cristobal_brophy_soto	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
848	1	Miguel Niquen		miguel_niquen	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
849	1	Juan Carlos Palomino		juan_carlos_palomino	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
850	1	Chimbote Delegacion		chimbote_delegacion	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
851	1	Manuel Medrano Medrano		manuel_medrano_medrano	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
852	1	Elmer Cabrera Cabrera		elmer_cabrera_cabrera	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
853	1	Augusto Gordillo Bejazo		augusto_gordillo_bejaz	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
854	1	Pablo Cesar Eyzaguirre Nu��Ez		pablo_cesar_eyzaguirre	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
855	1	Violeta Chumioque Urcia De Ballon		violeta_chumioque_urci	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
856	1	PiLMee GaTes	Elmer Faucet	PiLMee_GaTes	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
857	1	Hildebrando Castillo Cardenas		hildebrando_castillo_c	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
858	1	Gustavo Santisteban Farronan		Gustavo_Santisteban_Fa	827ccb0eea8a706c4c34a16891f84e7b	1	t	2013-09-06 03:09:22.264+00	\N
\.


--
-- TOC entry 2289 (class 0 OID 16446)
-- Dependencies: 180
-- Data for Name: persona_detalle_contacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona_detalle_contacto (idpersona, idcontacto_tipo, detalle) FROM stdin;
\.


--
-- TOC entry 2286 (class 0 OID 16423)
-- Dependencies: 177
-- Data for Name: persona_detalle_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona_detalle_documento (idpersona, iddocumento_tipo, detalle) FROM stdin;
1	1	47357923
\.


--
-- TOC entry 2292 (class 0 OID 16469)
-- Dependencies: 183
-- Data for Name: persona_detalle_grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona_detalle_grupo (idpersona, idpersona_grupo, "fechaInicio", "fechaFin") FROM stdin;
1	1	2013-08-31 16:36:17.024+00	\N
1	2	2013-08-31 16:36:26.208+00	\N
2	2	2013-08-31 16:36:33.903+00	\N
3	2	2013-08-31 16:36:39.087+00	\N
4	2	2013-08-31 16:36:42.006+00	\N
39	1	2013-09-02 16:38:30.061+00	\N
40	2	2013-09-02 16:39:24.732+00	\N
41	2	2013-09-02 16:39:24.732+00	\N
42	2	2013-09-02 16:39:24.732+00	\N
43	2	2013-09-02 16:39:24.732+00	\N
44	2	2013-09-02 16:39:24.732+00	\N
45	2	2013-09-02 16:39:24.732+00	\N
46	2	2013-09-02 16:39:24.732+00	\N
47	2	2013-09-02 16:39:24.732+00	\N
48	2	2013-09-02 16:39:24.732+00	\N
49	2	2013-09-02 16:39:24.732+00	\N
50	2	2013-09-02 16:39:24.732+00	\N
51	2	2013-09-02 16:39:24.732+00	\N
52	2	2013-09-02 16:39:24.732+00	\N
53	2	2013-09-02 16:39:24.732+00	\N
54	2	2013-09-02 16:39:24.732+00	\N
55	2	2013-09-02 16:39:24.732+00	\N
56	2	2013-09-02 16:39:24.732+00	\N
57	2	2013-09-02 16:39:24.732+00	\N
58	2	2013-09-02 16:39:24.732+00	\N
59	2	2013-09-02 16:39:24.732+00	\N
60	2	2013-09-02 16:39:24.732+00	\N
61	2	2013-09-02 16:39:24.732+00	\N
62	2	2013-09-02 16:39:24.732+00	\N
63	2	2013-09-02 16:39:24.732+00	\N
64	2	2013-09-02 16:39:24.732+00	\N
65	2	2013-09-02 16:39:24.732+00	\N
66	2	2013-09-02 16:39:24.732+00	\N
67	2	2013-09-02 16:39:24.732+00	\N
68	2	2013-09-02 16:39:24.732+00	\N
69	2	2013-09-02 16:39:24.732+00	\N
70	2	2013-09-02 16:39:24.732+00	\N
71	2	2013-09-02 16:39:24.732+00	\N
72	2	2013-09-02 16:39:24.732+00	\N
73	2	2013-09-02 16:39:24.732+00	\N
74	2	2013-09-02 16:39:24.732+00	\N
75	2	2013-09-02 16:39:24.732+00	\N
76	2	2013-09-02 16:39:24.732+00	\N
77	2	2013-09-02 16:39:24.732+00	\N
78	2	2013-09-02 16:39:24.732+00	\N
79	2	2013-09-02 16:39:24.732+00	\N
80	2	2013-09-02 16:39:24.732+00	\N
81	2	2013-09-02 16:39:24.732+00	\N
82	2	2013-09-02 16:39:24.732+00	\N
83	2	2013-09-02 16:39:24.732+00	\N
84	2	2013-09-02 16:39:24.732+00	\N
85	2	2013-09-02 16:39:24.732+00	\N
86	2	2013-09-02 16:39:24.732+00	\N
87	2	2013-09-02 16:39:24.732+00	\N
88	2	2013-09-02 16:39:24.732+00	\N
89	2	2013-09-02 16:39:24.732+00	\N
90	2	2013-09-02 16:39:24.732+00	\N
91	2	2013-09-02 16:39:24.732+00	\N
92	2	2013-09-02 16:39:24.732+00	\N
93	2	2013-09-02 16:39:24.732+00	\N
94	2	2013-09-02 16:39:24.732+00	\N
95	2	2013-09-02 16:39:24.732+00	\N
96	2	2013-09-02 16:39:24.732+00	\N
97	2	2013-09-02 16:39:24.732+00	\N
98	2	2013-09-02 16:39:24.732+00	\N
99	2	2013-09-02 16:39:24.732+00	\N
100	2	2013-09-02 16:39:24.732+00	\N
101	2	2013-09-02 16:39:24.732+00	\N
102	2	2013-09-02 16:39:24.732+00	\N
103	2	2013-09-02 16:39:24.732+00	\N
104	2	2013-09-02 16:39:24.732+00	\N
105	2	2013-09-02 16:39:24.732+00	\N
106	2	2013-09-02 16:39:24.732+00	\N
107	2	2013-09-02 16:39:24.732+00	\N
108	2	2013-09-02 16:39:24.732+00	\N
109	2	2013-09-02 16:39:24.732+00	\N
110	2	2013-09-02 16:39:24.732+00	\N
111	2	2013-09-02 16:39:24.732+00	\N
112	2	2013-09-02 16:39:24.732+00	\N
113	2	2013-09-02 16:39:24.732+00	\N
114	2	2013-09-02 16:39:24.732+00	\N
115	2	2013-09-02 16:39:24.732+00	\N
116	2	2013-09-02 16:39:24.732+00	\N
117	2	2013-09-02 16:39:24.732+00	\N
118	2	2013-09-02 16:39:24.732+00	\N
119	2	2013-09-02 16:39:24.732+00	\N
120	2	2013-09-02 16:39:24.732+00	\N
121	2	2013-09-02 16:39:24.732+00	\N
122	2	2013-09-02 16:39:24.732+00	\N
123	2	2013-09-02 16:39:24.732+00	\N
124	2	2013-09-02 16:39:24.732+00	\N
125	2	2013-09-02 16:39:24.732+00	\N
126	2	2013-09-02 16:39:24.732+00	\N
127	2	2013-09-02 16:39:24.732+00	\N
128	2	2013-09-02 16:39:24.732+00	\N
129	2	2013-09-02 16:39:24.732+00	\N
130	2	2013-09-02 16:39:24.732+00	\N
131	2	2013-09-02 16:39:24.732+00	\N
132	2	2013-09-02 16:39:24.732+00	\N
133	2	2013-09-02 16:39:24.732+00	\N
134	2	2013-09-02 16:39:24.732+00	\N
135	2	2013-09-02 16:39:24.732+00	\N
136	2	2013-09-02 16:39:24.732+00	\N
137	2	2013-09-02 16:39:24.732+00	\N
138	2	2013-09-02 16:39:24.732+00	\N
139	2	2013-09-02 16:39:24.732+00	\N
140	2	2013-09-02 16:39:24.732+00	\N
141	2	2013-09-02 16:39:24.732+00	\N
142	2	2013-09-02 16:39:24.732+00	\N
143	2	2013-09-02 16:39:24.732+00	\N
144	2	2013-09-02 16:39:24.732+00	\N
145	2	2013-09-02 16:39:24.732+00	\N
146	2	2013-09-02 16:39:24.732+00	\N
147	2	2013-09-02 16:39:24.732+00	\N
148	2	2013-09-02 16:39:24.732+00	\N
149	2	2013-09-02 16:39:24.732+00	\N
150	2	2013-09-02 16:39:24.732+00	\N
151	2	2013-09-02 16:39:24.732+00	\N
152	2	2013-09-02 16:39:24.732+00	\N
153	2	2013-09-02 16:39:24.732+00	\N
154	2	2013-09-02 16:39:24.732+00	\N
155	2	2013-09-02 16:39:24.732+00	\N
156	2	2013-09-02 16:39:24.732+00	\N
157	2	2013-09-02 16:39:24.732+00	\N
158	2	2013-09-02 16:39:24.732+00	\N
159	2	2013-09-02 16:39:24.732+00	\N
160	2	2013-09-02 16:39:24.732+00	\N
161	2	2013-09-02 16:39:24.732+00	\N
162	2	2013-09-02 16:39:24.732+00	\N
163	2	2013-09-02 16:39:24.732+00	\N
164	2	2013-09-02 16:39:24.732+00	\N
165	2	2013-09-02 16:39:24.732+00	\N
166	2	2013-09-02 16:39:24.732+00	\N
167	2	2013-09-02 16:39:24.732+00	\N
168	2	2013-09-02 16:39:24.732+00	\N
169	2	2013-09-02 16:39:24.732+00	\N
170	2	2013-09-02 16:39:24.732+00	\N
171	2	2013-09-02 16:39:24.732+00	\N
172	2	2013-09-02 16:39:24.732+00	\N
173	2	2013-09-02 16:39:24.732+00	\N
174	2	2013-09-02 16:39:24.732+00	\N
175	2	2013-09-02 16:39:24.732+00	\N
176	2	2013-09-02 16:39:24.732+00	\N
177	2	2013-09-02 16:39:24.732+00	\N
178	2	2013-09-02 16:39:24.732+00	\N
179	2	2013-09-02 16:39:24.732+00	\N
180	2	2013-09-02 16:39:24.732+00	\N
181	2	2013-09-02 16:39:24.732+00	\N
182	2	2013-09-02 16:39:24.732+00	\N
183	2	2013-09-02 16:39:24.732+00	\N
184	2	2013-09-02 16:39:24.732+00	\N
185	2	2013-09-02 16:39:24.732+00	\N
186	2	2013-09-02 16:39:24.732+00	\N
187	2	2013-09-02 16:39:24.732+00	\N
188	2	2013-09-02 16:39:24.732+00	\N
189	2	2013-09-02 16:39:24.732+00	\N
190	2	2013-09-02 16:39:24.732+00	\N
191	2	2013-09-02 16:39:24.732+00	\N
192	2	2013-09-02 16:39:24.732+00	\N
193	2	2013-09-02 16:39:24.732+00	\N
194	2	2013-09-02 16:39:24.732+00	\N
195	2	2013-09-02 16:39:24.732+00	\N
196	2	2013-09-02 16:39:24.732+00	\N
197	2	2013-09-02 16:39:24.732+00	\N
198	2	2013-09-02 16:39:24.732+00	\N
199	2	2013-09-02 16:39:24.732+00	\N
200	2	2013-09-02 16:39:24.732+00	\N
201	2	2013-09-02 16:39:24.732+00	\N
202	2	2013-09-02 16:39:24.732+00	\N
203	2	2013-09-02 16:39:24.732+00	\N
204	2	2013-09-02 16:39:24.732+00	\N
205	2	2013-09-02 16:39:24.732+00	\N
206	2	2013-09-02 16:39:24.732+00	\N
207	2	2013-09-02 16:39:24.732+00	\N
208	2	2013-09-02 16:39:24.732+00	\N
209	2	2013-09-02 16:39:24.732+00	\N
210	2	2013-09-02 16:39:24.732+00	\N
211	2	2013-09-02 16:39:24.732+00	\N
212	2	2013-09-02 16:39:24.732+00	\N
213	2	2013-09-02 16:39:24.732+00	\N
214	2	2013-09-02 16:39:24.732+00	\N
215	2	2013-09-02 16:39:24.732+00	\N
216	2	2013-09-02 16:39:24.732+00	\N
217	2	2013-09-02 16:39:24.732+00	\N
218	2	2013-09-02 16:39:24.732+00	\N
219	2	2013-09-02 16:39:24.732+00	\N
220	2	2013-09-02 16:39:24.732+00	\N
221	2	2013-09-02 16:39:24.732+00	\N
222	2	2013-09-02 16:39:24.732+00	\N
223	2	2013-09-02 16:39:24.732+00	\N
224	2	2013-09-02 16:39:24.732+00	\N
225	2	2013-09-02 16:39:24.732+00	\N
226	2	2013-09-02 16:39:24.732+00	\N
227	2	2013-09-02 16:39:24.732+00	\N
228	2	2013-09-02 16:39:24.732+00	\N
229	2	2013-09-02 16:39:24.732+00	\N
230	2	2013-09-02 16:39:24.732+00	\N
231	2	2013-09-02 16:39:24.732+00	\N
232	2	2013-09-02 16:39:24.732+00	\N
233	2	2013-09-02 16:39:24.732+00	\N
234	2	2013-09-02 16:39:24.732+00	\N
235	2	2013-09-02 16:39:24.732+00	\N
236	2	2013-09-02 16:39:24.732+00	\N
237	2	2013-09-02 16:39:24.732+00	\N
238	2	2013-09-02 16:39:24.732+00	\N
239	2	2013-09-02 16:39:24.732+00	\N
240	2	2013-09-02 16:39:24.732+00	\N
241	2	2013-09-02 16:39:24.732+00	\N
242	2	2013-09-02 16:39:24.732+00	\N
243	2	2013-09-02 16:39:24.732+00	\N
244	2	2013-09-02 16:39:24.732+00	\N
245	2	2013-09-02 16:39:24.732+00	\N
246	2	2013-09-02 16:39:24.732+00	\N
247	2	2013-09-02 16:39:24.732+00	\N
248	2	2013-09-02 16:39:24.732+00	\N
249	2	2013-09-02 16:39:24.732+00	\N
250	2	2013-09-02 16:39:24.732+00	\N
251	2	2013-09-02 16:39:24.732+00	\N
252	2	2013-09-02 16:39:24.732+00	\N
253	2	2013-09-02 16:39:24.732+00	\N
254	2	2013-09-02 16:39:24.732+00	\N
255	2	2013-09-02 16:39:24.732+00	\N
256	2	2013-09-02 16:39:24.732+00	\N
257	2	2013-09-02 16:39:24.732+00	\N
258	2	2013-09-02 16:39:24.732+00	\N
259	2	2013-09-02 16:39:24.732+00	\N
260	2	2013-09-02 16:39:24.732+00	\N
261	2	2013-09-02 16:39:24.732+00	\N
262	2	2013-09-02 16:39:24.732+00	\N
263	2	2013-09-02 16:39:24.732+00	\N
264	2	2013-09-02 16:39:24.732+00	\N
265	2	2013-09-02 16:39:24.732+00	\N
266	2	2013-09-02 16:39:24.732+00	\N
267	2	2013-09-02 16:39:24.732+00	\N
268	2	2013-09-02 16:39:24.732+00	\N
269	2	2013-09-02 16:39:24.732+00	\N
270	2	2013-09-02 16:39:24.732+00	\N
271	2	2013-09-02 16:39:24.732+00	\N
272	2	2013-09-02 16:39:24.732+00	\N
273	2	2013-09-02 16:39:24.732+00	\N
274	2	2013-09-02 16:39:24.732+00	\N
275	2	2013-09-02 16:39:24.732+00	\N
276	2	2013-09-02 16:39:24.732+00	\N
277	2	2013-09-02 16:39:24.732+00	\N
278	2	2013-09-02 16:39:24.732+00	\N
279	2	2013-09-02 16:39:24.732+00	\N
280	2	2013-09-02 16:39:24.732+00	\N
281	2	2013-09-02 16:39:24.732+00	\N
282	2	2013-09-02 16:39:24.732+00	\N
283	2	2013-09-02 16:39:24.732+00	\N
284	2	2013-09-02 16:39:24.732+00	\N
285	2	2013-09-02 16:39:24.732+00	\N
286	2	2013-09-02 16:39:24.732+00	\N
287	2	2013-09-02 16:39:24.732+00	\N
288	2	2013-09-02 16:39:24.732+00	\N
289	2	2013-09-02 16:39:24.732+00	\N
290	2	2013-09-02 16:39:24.732+00	\N
291	2	2013-09-02 16:39:24.732+00	\N
292	2	2013-09-02 16:39:24.732+00	\N
293	2	2013-09-02 16:39:24.732+00	\N
294	2	2013-09-02 16:39:24.732+00	\N
295	2	2013-09-02 16:39:24.732+00	\N
296	2	2013-09-02 16:39:24.732+00	\N
297	2	2013-09-02 16:39:24.732+00	\N
298	2	2013-09-02 16:39:24.732+00	\N
299	2	2013-09-02 16:39:24.732+00	\N
300	2	2013-09-02 16:39:24.732+00	\N
301	2	2013-09-02 16:39:24.732+00	\N
302	2	2013-09-02 16:39:24.732+00	\N
303	2	2013-09-02 16:39:24.732+00	\N
304	2	2013-09-02 16:39:24.732+00	\N
305	2	2013-09-02 16:39:24.732+00	\N
306	2	2013-09-02 16:39:24.732+00	\N
307	2	2013-09-02 16:39:24.732+00	\N
308	2	2013-09-02 16:39:24.732+00	\N
309	2	2013-09-02 16:39:24.732+00	\N
310	2	2013-09-02 16:39:24.732+00	\N
311	2	2013-09-02 16:39:24.732+00	\N
312	2	2013-09-02 16:39:24.732+00	\N
313	2	2013-09-02 16:39:24.732+00	\N
314	2	2013-09-02 16:39:24.732+00	\N
315	2	2013-09-02 16:39:24.732+00	\N
316	2	2013-09-02 16:39:24.732+00	\N
317	2	2013-09-02 16:39:24.732+00	\N
318	2	2013-09-02 16:39:24.732+00	\N
319	2	2013-09-02 16:39:24.732+00	\N
320	2	2013-09-02 16:39:24.732+00	\N
321	2	2013-09-02 16:39:24.732+00	\N
322	2	2013-09-02 16:39:24.732+00	\N
323	2	2013-09-02 16:39:24.732+00	\N
324	2	2013-09-02 16:39:24.732+00	\N
325	2	2013-09-02 16:39:24.732+00	\N
326	2	2013-09-02 16:39:24.732+00	\N
327	2	2013-09-02 16:39:24.732+00	\N
328	2	2013-09-02 16:39:24.732+00	\N
329	2	2013-09-02 16:39:24.732+00	\N
330	2	2013-09-02 16:39:24.732+00	\N
331	2	2013-09-02 16:39:24.732+00	\N
332	2	2013-09-02 16:39:24.732+00	\N
333	2	2013-09-02 16:39:24.732+00	\N
334	2	2013-09-02 16:39:24.732+00	\N
335	2	2013-09-02 16:39:24.732+00	\N
336	2	2013-09-02 16:39:24.732+00	\N
337	2	2013-09-02 16:39:24.732+00	\N
338	2	2013-09-02 16:39:24.732+00	\N
339	2	2013-09-02 16:39:24.732+00	\N
340	2	2013-09-02 16:39:24.732+00	\N
341	2	2013-09-02 16:39:24.732+00	\N
342	2	2013-09-02 16:39:24.732+00	\N
343	2	2013-09-02 16:39:24.732+00	\N
344	2	2013-09-02 16:39:24.732+00	\N
345	2	2013-09-02 16:39:24.732+00	\N
346	2	2013-09-02 16:39:24.732+00	\N
347	2	2013-09-02 16:39:24.732+00	\N
348	2	2013-09-02 16:39:24.732+00	\N
349	2	2013-09-02 16:39:24.732+00	\N
350	2	2013-09-02 16:39:24.732+00	\N
351	2	2013-09-02 16:39:24.732+00	\N
352	2	2013-09-02 16:39:24.732+00	\N
353	2	2013-09-02 16:39:24.732+00	\N
354	2	2013-09-02 16:39:24.732+00	\N
355	2	2013-09-02 16:39:24.732+00	\N
356	2	2013-09-02 16:39:24.732+00	\N
357	2	2013-09-02 16:39:24.732+00	\N
358	2	2013-09-02 16:39:24.732+00	\N
359	2	2013-09-02 16:39:24.732+00	\N
360	2	2013-09-02 16:39:24.732+00	\N
361	2	2013-09-02 16:39:24.732+00	\N
362	2	2013-09-02 16:39:24.732+00	\N
363	2	2013-09-02 16:39:24.732+00	\N
364	2	2013-09-02 16:39:24.732+00	\N
365	2	2013-09-02 16:39:24.732+00	\N
366	2	2013-09-02 16:39:24.732+00	\N
367	2	2013-09-02 16:39:24.732+00	\N
368	2	2013-09-02 16:39:24.732+00	\N
369	2	2013-09-02 16:39:24.732+00	\N
370	2	2013-09-02 16:39:24.732+00	\N
371	2	2013-09-02 16:39:24.732+00	\N
372	2	2013-09-02 16:39:24.732+00	\N
373	2	2013-09-02 16:39:24.732+00	\N
374	2	2013-09-02 16:39:24.732+00	\N
375	2	2013-09-02 16:39:24.732+00	\N
376	2	2013-09-02 16:39:24.732+00	\N
377	2	2013-09-02 16:39:24.732+00	\N
378	2	2013-09-02 16:39:24.732+00	\N
379	2	2013-09-02 16:39:24.732+00	\N
380	2	2013-09-02 16:39:24.732+00	\N
381	2	2013-09-02 16:39:24.732+00	\N
382	2	2013-09-02 16:39:24.732+00	\N
383	2	2013-09-02 16:39:24.732+00	\N
384	2	2013-09-02 16:39:24.732+00	\N
385	2	2013-09-02 16:39:24.732+00	\N
386	2	2013-09-02 16:39:24.732+00	\N
387	2	2013-09-02 16:39:24.732+00	\N
388	2	2013-09-02 16:39:24.732+00	\N
389	2	2013-09-02 16:39:24.732+00	\N
390	2	2013-09-02 16:39:24.732+00	\N
391	2	2013-09-02 16:39:24.732+00	\N
392	2	2013-09-02 16:39:24.732+00	\N
393	2	2013-09-02 16:39:24.732+00	\N
394	2	2013-09-02 16:39:24.732+00	\N
395	2	2013-09-02 16:39:24.732+00	\N
396	2	2013-09-02 16:39:24.732+00	\N
397	2	2013-09-02 16:39:24.732+00	\N
398	2	2013-09-02 16:39:24.732+00	\N
399	2	2013-09-02 16:39:24.732+00	\N
400	2	2013-09-02 16:39:24.732+00	\N
401	2	2013-09-02 16:39:24.732+00	\N
402	2	2013-09-02 16:39:24.732+00	\N
403	2	2013-09-02 16:39:24.732+00	\N
404	2	2013-09-02 16:39:24.732+00	\N
405	2	2013-09-02 16:39:24.732+00	\N
406	2	2013-09-02 16:39:24.732+00	\N
407	2	2013-09-02 16:39:24.732+00	\N
408	2	2013-09-02 16:39:24.732+00	\N
409	2	2013-09-02 16:39:24.732+00	\N
410	2	2013-09-02 16:39:24.732+00	\N
411	2	2013-09-02 16:39:24.732+00	\N
412	2	2013-09-02 16:39:24.732+00	\N
413	2	2013-09-02 16:39:24.732+00	\N
414	2	2013-09-02 16:39:24.732+00	\N
415	2	2013-09-02 16:39:24.732+00	\N
416	2	2013-09-02 16:39:24.732+00	\N
417	2	2013-09-02 16:39:24.732+00	\N
418	2	2013-09-02 16:39:24.732+00	\N
419	2	2013-09-02 16:39:24.732+00	\N
420	2	2013-09-02 16:39:24.732+00	\N
421	2	2013-09-02 16:39:24.732+00	\N
422	2	2013-09-02 16:39:24.732+00	\N
423	2	2013-09-02 16:39:24.732+00	\N
424	2	2013-09-02 16:39:24.732+00	\N
425	2	2013-09-02 16:39:24.732+00	\N
426	2	2013-09-02 16:39:24.732+00	\N
427	2	2013-09-02 16:39:24.732+00	\N
428	2	2013-09-02 16:39:24.732+00	\N
429	2	2013-09-02 16:39:24.732+00	\N
430	2	2013-09-02 16:39:24.732+00	\N
431	2	2013-09-02 16:39:24.732+00	\N
432	2	2013-09-02 16:39:24.732+00	\N
433	2	2013-09-02 16:39:24.732+00	\N
434	2	2013-09-02 16:39:24.732+00	\N
435	2	2013-09-02 16:39:24.732+00	\N
436	2	2013-09-02 16:39:24.732+00	\N
437	2	2013-09-02 16:39:24.732+00	\N
438	2	2013-09-02 16:39:24.732+00	\N
439	2	2013-09-02 16:39:24.732+00	\N
440	2	2013-09-02 16:39:24.732+00	\N
441	2	2013-09-02 16:39:24.732+00	\N
442	2	2013-09-02 16:39:24.732+00	\N
443	2	2013-09-02 16:39:24.732+00	\N
444	2	2013-09-02 16:39:24.732+00	\N
445	2	2013-09-02 16:39:24.732+00	\N
446	2	2013-09-02 16:39:24.732+00	\N
447	2	2013-09-02 16:39:24.732+00	\N
448	2	2013-09-02 16:39:24.732+00	\N
449	2	2013-09-02 16:39:24.732+00	\N
450	2	2013-09-02 16:39:24.732+00	\N
451	2	2013-09-02 16:39:24.732+00	\N
452	2	2013-09-02 16:39:24.732+00	\N
453	2	2013-09-02 16:39:24.732+00	\N
454	2	2013-09-02 16:39:24.732+00	\N
455	2	2013-09-02 16:39:24.732+00	\N
456	2	2013-09-02 16:39:24.732+00	\N
457	2	2013-09-02 16:39:24.732+00	\N
458	2	2013-09-02 16:39:24.732+00	\N
459	2	2013-09-02 16:39:24.732+00	\N
460	2	2013-09-02 16:39:24.732+00	\N
461	2	2013-09-02 16:39:24.732+00	\N
462	2	2013-09-02 16:39:24.732+00	\N
463	2	2013-09-02 16:39:24.732+00	\N
464	2	2013-09-02 16:39:24.732+00	\N
465	2	2013-09-02 16:39:24.732+00	\N
466	2	2013-09-02 16:39:24.732+00	\N
467	2	2013-09-02 16:39:24.732+00	\N
468	2	2013-09-02 16:39:24.732+00	\N
469	2	2013-09-02 16:39:24.732+00	\N
470	2	2013-09-02 16:39:24.732+00	\N
471	2	2013-09-02 16:39:24.732+00	\N
472	2	2013-09-02 16:39:24.732+00	\N
473	2	2013-09-02 16:39:24.732+00	\N
474	2	2013-09-02 16:39:24.732+00	\N
475	2	2013-09-02 16:39:24.732+00	\N
476	2	2013-09-02 16:39:24.732+00	\N
477	2	2013-09-02 16:39:24.732+00	\N
478	2	2013-09-02 16:39:24.732+00	\N
479	2	2013-09-02 16:39:24.732+00	\N
480	2	2013-09-02 16:39:24.732+00	\N
481	2	2013-09-02 16:39:24.732+00	\N
482	2	2013-09-02 16:39:24.732+00	\N
483	2	2013-09-02 16:39:24.732+00	\N
484	2	2013-09-02 16:39:24.732+00	\N
485	2	2013-09-02 16:39:24.732+00	\N
486	2	2013-09-02 16:39:24.732+00	\N
487	2	2013-09-02 16:39:24.732+00	\N
488	2	2013-09-02 16:39:24.732+00	\N
489	2	2013-09-02 16:39:24.732+00	\N
490	2	2013-09-02 16:39:24.732+00	\N
491	2	2013-09-02 16:39:24.732+00	\N
492	2	2013-09-02 16:39:24.732+00	\N
493	2	2013-09-02 16:39:24.732+00	\N
494	2	2013-09-02 16:39:24.732+00	\N
495	2	2013-09-02 16:39:24.732+00	\N
496	2	2013-09-02 16:39:24.732+00	\N
497	2	2013-09-02 16:39:24.732+00	\N
498	2	2013-09-02 16:39:24.732+00	\N
499	2	2013-09-02 16:39:24.732+00	\N
500	2	2013-09-02 16:39:24.732+00	\N
501	2	2013-09-02 16:39:24.732+00	\N
502	2	2013-09-02 16:39:24.732+00	\N
503	2	2013-09-02 16:39:24.732+00	\N
504	2	2013-09-02 16:39:24.732+00	\N
505	2	2013-09-02 16:39:24.732+00	\N
506	2	2013-09-02 16:39:24.732+00	\N
507	2	2013-09-02 16:39:24.732+00	\N
508	2	2013-09-02 16:39:24.732+00	\N
509	2	2013-09-02 16:39:24.732+00	\N
510	2	2013-09-02 16:39:24.732+00	\N
511	2	2013-09-02 16:39:24.732+00	\N
512	2	2013-09-02 16:39:24.732+00	\N
513	2	2013-09-02 16:39:24.732+00	\N
514	2	2013-09-02 16:39:24.732+00	\N
515	2	2013-09-02 16:39:24.732+00	\N
516	2	2013-09-02 16:39:24.732+00	\N
517	2	2013-09-02 16:39:24.732+00	\N
518	2	2013-09-02 16:39:24.732+00	\N
519	2	2013-09-02 16:39:24.732+00	\N
520	2	2013-09-02 16:39:24.732+00	\N
521	2	2013-09-02 16:39:24.732+00	\N
522	2	2013-09-02 16:39:24.732+00	\N
523	2	2013-09-02 16:39:24.732+00	\N
524	2	2013-09-02 16:39:24.732+00	\N
525	2	2013-09-02 16:39:24.732+00	\N
526	2	2013-09-02 16:39:24.732+00	\N
527	2	2013-09-02 16:39:24.732+00	\N
528	2	2013-09-02 16:39:24.732+00	\N
529	2	2013-09-02 16:39:24.732+00	\N
530	2	2013-09-02 16:39:24.732+00	\N
531	2	2013-09-02 16:39:24.732+00	\N
532	2	2013-09-02 16:39:24.732+00	\N
533	2	2013-09-02 16:39:24.732+00	\N
534	2	2013-09-02 16:39:24.732+00	\N
535	2	2013-09-02 16:39:24.732+00	\N
536	2	2013-09-02 16:39:24.732+00	\N
537	2	2013-09-02 16:39:24.732+00	\N
538	2	2013-09-02 16:39:24.732+00	\N
539	2	2013-09-02 16:39:24.732+00	\N
540	2	2013-09-02 16:39:24.732+00	\N
541	2	2013-09-02 16:39:24.732+00	\N
542	2	2013-09-02 16:39:24.732+00	\N
543	2	2013-09-02 16:39:24.732+00	\N
544	2	2013-09-02 16:39:24.732+00	\N
545	2	2013-09-02 16:39:24.732+00	\N
546	2	2013-09-02 16:39:24.732+00	\N
547	2	2013-09-02 16:39:24.732+00	\N
548	2	2013-09-02 16:39:24.732+00	\N
549	2	2013-09-02 16:39:24.732+00	\N
550	2	2013-09-02 16:39:24.732+00	\N
551	2	2013-09-02 16:39:24.732+00	\N
552	2	2013-09-02 16:39:24.732+00	\N
553	2	2013-09-02 16:39:24.732+00	\N
554	2	2013-09-02 16:39:24.732+00	\N
555	2	2013-09-02 16:39:24.732+00	\N
556	2	2013-09-02 16:39:24.732+00	\N
557	2	2013-09-02 16:39:24.732+00	\N
558	2	2013-09-02 16:39:24.732+00	\N
559	2	2013-09-02 16:39:24.732+00	\N
560	2	2013-09-02 16:39:24.732+00	\N
561	2	2013-09-02 16:39:24.732+00	\N
562	2	2013-09-02 16:39:24.732+00	\N
563	2	2013-09-02 16:39:24.732+00	\N
564	2	2013-09-02 16:39:24.732+00	\N
565	2	2013-09-02 16:39:24.732+00	\N
566	2	2013-09-02 16:39:24.732+00	\N
567	2	2013-09-02 16:39:24.732+00	\N
568	2	2013-09-02 16:39:24.732+00	\N
569	2	2013-09-02 16:39:24.732+00	\N
570	2	2013-09-02 16:39:24.732+00	\N
571	2	2013-09-02 16:39:24.732+00	\N
572	2	2013-09-02 16:39:24.732+00	\N
573	2	2013-09-02 16:39:24.732+00	\N
574	2	2013-09-02 16:39:24.732+00	\N
575	2	2013-09-02 16:39:24.732+00	\N
576	2	2013-09-02 16:39:24.732+00	\N
577	2	2013-09-02 16:39:24.732+00	\N
578	2	2013-09-02 16:39:24.732+00	\N
579	2	2013-09-02 16:39:24.732+00	\N
580	2	2013-09-02 16:39:24.732+00	\N
581	2	2013-09-02 16:39:24.732+00	\N
582	2	2013-09-02 16:39:24.732+00	\N
583	2	2013-09-02 16:39:24.732+00	\N
584	2	2013-09-02 16:39:24.732+00	\N
585	2	2013-09-02 16:39:24.732+00	\N
586	2	2013-09-02 16:39:24.732+00	\N
587	2	2013-09-02 16:39:24.732+00	\N
588	2	2013-09-02 16:39:24.732+00	\N
589	2	2013-09-02 16:39:24.732+00	\N
590	2	2013-09-02 16:39:24.732+00	\N
591	2	2013-09-02 16:39:24.732+00	\N
592	2	2013-09-02 16:39:24.732+00	\N
593	2	2013-09-02 16:39:24.732+00	\N
594	2	2013-09-02 16:39:24.732+00	\N
595	2	2013-09-02 16:39:24.732+00	\N
596	2	2013-09-02 16:39:24.732+00	\N
597	2	2013-09-02 16:39:24.732+00	\N
598	2	2013-09-02 16:39:24.732+00	\N
599	2	2013-09-02 16:39:24.732+00	\N
600	2	2013-09-02 16:39:24.732+00	\N
601	2	2013-09-02 16:39:24.732+00	\N
602	2	2013-09-02 16:39:24.732+00	\N
603	2	2013-09-02 16:39:24.732+00	\N
604	2	2013-09-02 16:39:24.732+00	\N
605	2	2013-09-02 16:39:24.732+00	\N
606	2	2013-09-02 16:39:24.732+00	\N
607	2	2013-09-02 16:39:24.732+00	\N
608	2	2013-09-02 16:39:24.732+00	\N
609	2	2013-09-02 16:39:24.732+00	\N
610	2	2013-09-02 16:39:24.732+00	\N
611	2	2013-09-02 16:39:24.732+00	\N
612	2	2013-09-02 16:39:24.732+00	\N
613	2	2013-09-02 16:39:24.732+00	\N
614	2	2013-09-02 16:39:24.732+00	\N
615	2	2013-09-02 16:39:24.732+00	\N
616	2	2013-09-02 16:39:24.732+00	\N
617	2	2013-09-02 16:39:24.732+00	\N
618	2	2013-09-02 16:39:24.732+00	\N
619	2	2013-09-02 16:39:24.732+00	\N
620	2	2013-09-02 16:39:24.732+00	\N
621	2	2013-09-02 16:39:24.732+00	\N
622	2	2013-09-02 16:39:24.732+00	\N
623	2	2013-09-02 16:39:24.732+00	\N
624	2	2013-09-02 16:39:24.732+00	\N
625	2	2013-09-02 16:39:24.732+00	\N
626	2	2013-09-02 16:39:24.732+00	\N
627	2	2013-09-02 16:39:24.732+00	\N
628	2	2013-09-02 16:39:24.732+00	\N
629	2	2013-09-02 16:39:24.732+00	\N
630	2	2013-09-02 16:39:24.732+00	\N
631	2	2013-09-02 16:39:24.732+00	\N
632	2	2013-09-02 16:39:24.732+00	\N
633	2	2013-09-02 16:39:24.732+00	\N
634	2	2013-09-02 16:39:24.732+00	\N
635	2	2013-09-02 16:39:24.732+00	\N
636	2	2013-09-02 16:39:24.732+00	\N
637	2	2013-09-02 16:39:24.732+00	\N
638	2	2013-09-02 16:39:24.732+00	\N
639	2	2013-09-02 16:39:24.732+00	\N
640	2	2013-09-02 16:39:24.732+00	\N
641	2	2013-09-02 16:39:24.732+00	\N
642	2	2013-09-02 16:39:24.732+00	\N
643	2	2013-09-02 16:39:24.732+00	\N
644	2	2013-09-02 16:39:24.732+00	\N
645	2	2013-09-02 16:39:24.732+00	\N
646	2	2013-09-02 16:39:24.732+00	\N
647	2	2013-09-02 16:39:24.732+00	\N
648	2	2013-09-02 16:39:24.732+00	\N
649	2	2013-09-02 16:39:24.732+00	\N
650	2	2013-09-02 16:39:24.732+00	\N
651	2	2013-09-02 16:39:24.732+00	\N
652	2	2013-09-02 16:39:24.732+00	\N
653	2	2013-09-02 16:39:24.732+00	\N
654	2	2013-09-02 16:39:24.732+00	\N
655	2	2013-09-02 16:39:24.732+00	\N
656	2	2013-09-02 16:39:24.732+00	\N
657	2	2013-09-02 16:39:24.732+00	\N
658	2	2013-09-02 16:39:24.732+00	\N
659	2	2013-09-02 16:39:24.732+00	\N
660	2	2013-09-02 16:39:24.732+00	\N
661	2	2013-09-02 16:39:24.732+00	\N
662	2	2013-09-02 16:39:24.732+00	\N
663	2	2013-09-02 16:39:24.732+00	\N
664	2	2013-09-02 16:39:24.732+00	\N
665	2	2013-09-02 16:39:24.732+00	\N
666	2	2013-09-02 16:39:24.732+00	\N
667	2	2013-09-02 16:39:24.732+00	\N
668	2	2013-09-02 16:39:24.732+00	\N
669	2	2013-09-02 16:39:24.732+00	\N
670	2	2013-09-02 16:39:24.732+00	\N
671	2	2013-09-02 16:39:24.732+00	\N
672	2	2013-09-02 16:39:24.732+00	\N
673	2	2013-09-02 16:39:24.732+00	\N
674	2	2013-09-02 16:39:24.732+00	\N
675	2	2013-09-02 16:39:24.732+00	\N
676	2	2013-09-02 16:39:24.732+00	\N
677	2	2013-09-02 16:39:24.732+00	\N
678	2	2013-09-02 16:39:24.732+00	\N
679	2	2013-09-02 16:39:24.732+00	\N
680	2	2013-09-02 16:39:24.732+00	\N
681	2	2013-09-02 16:39:24.732+00	\N
682	2	2013-09-02 16:39:24.732+00	\N
683	2	2013-09-02 16:39:24.732+00	\N
684	2	2013-09-02 16:39:24.732+00	\N
685	2	2013-09-02 16:39:24.732+00	\N
686	2	2013-09-02 16:39:24.732+00	\N
687	2	2013-09-02 16:39:24.732+00	\N
688	2	2013-09-02 16:39:24.732+00	\N
689	2	2013-09-02 16:39:24.732+00	\N
690	2	2013-09-02 16:39:24.732+00	\N
691	2	2013-09-02 16:39:24.732+00	\N
692	2	2013-09-02 16:39:24.732+00	\N
693	2	2013-09-02 16:39:24.732+00	\N
694	2	2013-09-02 16:39:24.732+00	\N
695	2	2013-09-02 16:39:24.732+00	\N
696	2	2013-09-02 16:39:24.732+00	\N
697	2	2013-09-02 16:39:24.732+00	\N
698	2	2013-09-02 16:39:24.732+00	\N
699	2	2013-09-02 16:39:24.732+00	\N
700	2	2013-09-02 16:39:24.732+00	\N
701	2	2013-09-02 16:39:24.732+00	\N
702	2	2013-09-02 16:39:24.732+00	\N
703	2	2013-09-02 16:39:24.732+00	\N
704	2	2013-09-02 16:39:24.732+00	\N
705	2	2013-09-02 16:39:24.732+00	\N
706	2	2013-09-02 16:39:24.732+00	\N
707	2	2013-09-02 16:39:24.732+00	\N
708	2	2013-09-02 16:39:24.732+00	\N
709	2	2013-09-02 16:39:24.732+00	\N
710	2	2013-09-02 16:39:24.732+00	\N
711	2	2013-09-02 16:39:24.732+00	\N
712	2	2013-09-02 16:39:24.732+00	\N
713	2	2013-09-02 16:39:24.732+00	\N
714	2	2013-09-02 16:39:24.732+00	\N
715	2	2013-09-02 16:39:24.732+00	\N
716	2	2013-09-02 16:39:24.732+00	\N
717	2	2013-09-02 16:39:24.732+00	\N
718	2	2013-09-02 16:39:24.732+00	\N
719	2	2013-09-02 16:39:24.732+00	\N
720	2	2013-09-02 16:39:24.732+00	\N
721	2	2013-09-02 16:39:24.732+00	\N
722	2	2013-09-02 16:39:24.732+00	\N
723	2	2013-09-02 16:39:24.732+00	\N
724	2	2013-09-02 16:39:24.732+00	\N
725	2	2013-09-02 16:39:24.732+00	\N
726	2	2013-09-02 16:39:24.732+00	\N
727	2	2013-09-02 16:39:24.732+00	\N
728	2	2013-09-02 16:39:24.732+00	\N
729	2	2013-09-02 16:39:24.732+00	\N
730	2	2013-09-02 16:39:24.732+00	\N
731	2	2013-09-02 16:39:24.732+00	\N
732	2	2013-09-02 16:39:24.732+00	\N
733	2	2013-09-02 16:39:24.732+00	\N
734	2	2013-09-02 16:39:24.732+00	\N
735	2	2013-09-02 16:39:24.732+00	\N
736	2	2013-09-02 16:39:24.732+00	\N
737	2	2013-09-02 16:39:24.732+00	\N
738	2	2013-09-02 16:39:24.732+00	\N
739	2	2013-09-02 16:39:24.732+00	\N
740	2	2013-09-02 16:39:24.732+00	\N
741	2	2013-09-02 16:39:24.732+00	\N
742	2	2013-09-02 16:39:24.732+00	\N
743	2	2013-09-02 16:39:24.732+00	\N
744	2	2013-09-02 16:39:24.732+00	\N
745	2	2013-09-02 16:39:24.732+00	\N
746	2	2013-09-02 16:39:24.732+00	\N
747	2	2013-09-02 16:39:24.732+00	\N
748	2	2013-09-02 16:39:24.732+00	\N
749	2	2013-09-02 16:39:24.732+00	\N
750	2	2013-09-02 16:39:24.732+00	\N
751	2	2013-09-02 16:39:24.732+00	\N
752	2	2013-09-02 16:39:24.732+00	\N
753	2	2013-09-02 16:39:24.732+00	\N
754	2	2013-09-02 16:39:24.732+00	\N
755	2	2013-09-02 16:39:24.732+00	\N
756	2	2013-09-02 16:39:24.732+00	\N
757	2	2013-09-02 16:39:24.732+00	\N
758	2	2013-09-02 16:39:24.732+00	\N
759	2	2013-09-02 16:39:24.732+00	\N
760	2	2013-09-02 16:39:24.732+00	\N
761	2	2013-09-02 16:39:24.732+00	\N
762	2	2013-09-02 16:39:24.732+00	\N
763	2	2013-09-02 16:39:24.732+00	\N
764	2	2013-09-02 16:39:24.732+00	\N
765	2	2013-09-02 16:39:24.732+00	\N
766	2	2013-09-02 16:39:24.732+00	\N
767	2	2013-09-02 16:39:24.732+00	\N
768	2	2013-09-02 16:39:24.732+00	\N
769	2	2013-09-02 16:39:24.732+00	\N
770	2	2013-09-02 16:39:24.732+00	\N
771	2	2013-09-02 16:39:24.732+00	\N
772	2	2013-09-02 16:39:24.732+00	\N
773	2	2013-09-02 16:39:24.732+00	\N
774	2	2013-09-02 16:39:24.732+00	\N
775	2	2013-09-02 16:39:24.732+00	\N
776	2	2013-09-02 16:39:24.732+00	\N
777	2	2013-09-02 16:39:24.732+00	\N
778	2	2013-09-02 16:39:24.732+00	\N
779	2	2013-09-02 16:39:24.732+00	\N
780	2	2013-09-02 16:39:24.732+00	\N
781	2	2013-09-02 16:39:24.732+00	\N
782	2	2013-09-02 16:39:24.732+00	\N
783	2	2013-09-02 16:39:24.732+00	\N
784	2	2013-09-02 16:39:24.732+00	\N
785	2	2013-09-02 16:39:24.732+00	\N
786	2	2013-09-02 16:39:24.732+00	\N
787	2	2013-09-02 16:39:24.732+00	\N
788	2	2013-09-02 16:39:24.732+00	\N
789	2	2013-09-02 16:39:24.732+00	\N
790	2	2013-09-02 16:39:24.732+00	\N
791	2	2013-09-02 16:39:24.732+00	\N
792	2	2013-09-02 16:39:24.732+00	\N
793	2	2013-09-02 16:39:24.732+00	\N
794	2	2013-09-02 16:39:24.732+00	\N
795	2	2013-09-02 16:39:24.732+00	\N
796	2	2013-09-02 16:39:24.732+00	\N
797	2	2013-09-02 16:39:24.732+00	\N
798	2	2013-09-02 16:39:24.732+00	\N
799	2	2013-09-02 16:39:24.732+00	\N
800	2	2013-09-02 16:39:24.732+00	\N
801	2	2013-09-02 16:39:24.732+00	\N
802	2	2013-09-02 16:39:24.732+00	\N
803	2	2013-09-02 16:39:24.732+00	\N
804	2	2013-09-02 16:39:24.732+00	\N
805	2	2013-09-02 16:39:24.732+00	\N
806	2	2013-09-02 16:39:24.732+00	\N
807	2	2013-09-02 16:39:24.732+00	\N
808	2	2013-09-02 16:39:24.732+00	\N
809	2	2013-09-02 16:39:24.732+00	\N
810	2	2013-09-02 16:39:24.732+00	\N
811	2	2013-09-02 16:39:24.732+00	\N
812	2	2013-09-02 16:39:24.732+00	\N
813	2	2013-09-02 16:39:24.732+00	\N
814	2	2013-09-02 16:39:24.732+00	\N
815	2	2013-09-02 16:39:24.732+00	\N
816	2	2013-09-02 16:39:24.732+00	\N
817	2	2013-09-02 16:39:24.732+00	\N
818	2	2013-09-02 16:39:24.732+00	\N
819	2	2013-09-02 16:39:24.732+00	\N
820	2	2013-09-02 16:39:24.732+00	\N
821	2	2013-09-02 16:39:24.732+00	\N
822	2	2013-09-02 16:39:24.732+00	\N
823	2	2013-09-02 16:39:24.732+00	\N
824	2	2013-09-02 16:39:24.732+00	\N
825	2	2013-09-02 16:39:24.732+00	\N
826	2	2013-09-02 16:39:24.732+00	\N
827	2	2013-09-02 16:39:24.732+00	\N
828	2	2013-09-02 16:39:24.732+00	\N
829	2	2013-09-02 16:39:24.732+00	\N
830	2	2013-09-02 16:39:24.732+00	\N
831	2	2013-09-02 16:39:24.732+00	\N
832	2	2013-09-02 16:39:24.732+00	\N
833	2	2013-09-02 16:39:24.732+00	\N
834	2	2013-09-02 16:39:24.732+00	\N
835	2	2013-09-02 16:39:24.732+00	\N
836	2	2013-09-02 16:39:24.732+00	\N
837	2	2013-09-02 16:39:24.732+00	\N
838	2	2013-09-02 16:39:24.732+00	\N
839	2	2013-09-02 16:39:24.732+00	\N
840	2	2013-09-02 16:39:24.732+00	\N
841	2	2013-09-02 16:39:24.732+00	\N
842	2	2013-09-02 16:39:24.732+00	\N
843	2	2013-09-02 16:39:24.732+00	\N
844	2	2013-09-02 16:39:24.732+00	\N
845	2	2013-09-02 16:39:24.732+00	\N
846	2	2013-09-02 16:39:24.732+00	\N
847	2	2013-09-02 16:39:24.732+00	\N
848	2	2013-09-02 16:39:24.732+00	\N
849	2	2013-09-02 16:39:24.732+00	\N
850	2	2013-09-02 16:39:24.732+00	\N
851	2	2013-09-02 16:39:24.732+00	\N
852	2	2013-09-02 16:39:24.732+00	\N
853	2	2013-09-02 16:39:24.732+00	\N
854	2	2013-09-02 16:39:24.732+00	\N
855	2	2013-09-02 16:39:24.732+00	\N
856	2	2013-09-02 16:39:24.732+00	\N
857	2	2013-09-02 16:39:24.732+00	\N
858	2	2013-09-02 16:39:24.732+00	\N
\.


--
-- TOC entry 2295 (class 0 OID 16483)
-- Dependencies: 186
-- Data for Name: persona_detalle_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona_detalle_rol (idpersona, idrol) FROM stdin;
1	1
1	2
\.


--
-- TOC entry 2291 (class 0 OID 16463)
-- Dependencies: 182
-- Data for Name: persona_grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona_grupo (idpersona_grupo, detalle) FROM stdin;
1	Empleado
2	Cliente
3	Proveedor
\.


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 181
-- Name: persona_grupo_idpersona_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_grupo_idpersona_grupo_seq', 3, true);


--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 171
-- Name: persona_idpersona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_idpersona_seq', 858, true);


--
-- TOC entry 2283 (class 0 OID 16404)
-- Dependencies: 174
-- Data for Name: persona_tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona_tipo (idpersona_tipo, detalle) FROM stdin;
1	Persona Natural
2	Persona Jurídica
\.


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 173
-- Name: persona_tipo_idpersona_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_tipo_idpersona_tipo_seq', 2, true);


--
-- TOC entry 2315 (class 0 OID 49202)
-- Dependencies: 206
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY producto (idproducto, idmarca, idunidad_medida, nombre, detalle, idcategoria) FROM stdin;
\.


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 205
-- Name: producto_idproducto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('producto_idproducto_seq', 1, false);


--
-- TOC entry 2294 (class 0 OID 16477)
-- Dependencies: 185
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol (idrol, detalle) FROM stdin;
1	Gerencia
2	Punto de Venta
3	Supervisor
4	Almacen
\.


--
-- TOC entry 2298 (class 0 OID 16511)
-- Dependencies: 189
-- Data for Name: rol_detalle_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol_detalle_menu (idrol, idmenu) FROM stdin;
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
2	9
2	10
\.


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 184
-- Name: rol_idrol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rol_idrol_seq', 4, true);


--
-- TOC entry 2304 (class 0 OID 24614)
-- Dependencies: 195
-- Data for Name: serie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY serie (idserie, detalle, "fechaRegistro", estado, idcomprobante) FROM stdin;
\.


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 194
-- Name: serie_idserie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('serie_idserie_seq', 1, false);


--
-- TOC entry 2310 (class 0 OID 49164)
-- Dependencies: 201
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY turno (idturno, detalle, abreviatura) FROM stdin;
\.


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 200
-- Name: turno_idturno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('turno_idturno_seq', 1, false);


--
-- TOC entry 2322 (class 0 OID 49236)
-- Dependencies: 213
-- Data for Name: unidad_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unidad_medida (idunidad_medida, detalle, abreviatura) FROM stdin;
\.


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 212
-- Name: unidad_medida_idunidad_medida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_medida_idunidad_medida_seq', 1, false);


--
-- TOC entry 2300 (class 0 OID 16529)
-- Dependencies: 191
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY venta (idventa, idpersona_empleado, idpersona_cliente, idpersona_pagador, "fechaRegistro", detalle, total, anulado, idcomprobante_numero, fecha, idmoneda_cambio, idimpuesto_detalle) FROM stdin;
\.


--
-- TOC entry 2325 (class 0 OID 57405)
-- Dependencies: 216
-- Data for Name: venta_detalle_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY venta_detalle_producto (idventa, idproducto, cantidad, precio, descuento, subtotal) FROM stdin;
\.


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 190
-- Name: venta_idventa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('venta_idventa_seq', 1, false);


--
-- TOC entry 2101 (class 2606 OID 49228)
-- Name: pk_idalmacen_almacen; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT pk_idalmacen_almacen PRIMARY KEY (idalmacen);


--
-- TOC entry 2103 (class 2606 OID 49233)
-- Name: pk_idalmacen_idproudcto_almacen_detalle_producto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY almacen_detalle_producto
    ADD CONSTRAINT pk_idalmacen_idproudcto_almacen_detalle_producto PRIMARY KEY (idalmacen, idproducto);


--
-- TOC entry 2107 (class 2606 OID 57384)
-- Name: pk_idcategoria_categoria; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT pk_idcategoria_categoria PRIMARY KEY (idcategoria);


--
-- TOC entry 2113 (class 2606 OID 57457)
-- Name: pk_idcompra_compra; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT pk_idcompra_compra PRIMARY KEY (idcompra);


--
-- TOC entry 2115 (class 2606 OID 57462)
-- Name: pk_idcompra_idproducto_compra_detalle_producto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY compra_detalle_producto
    ADD CONSTRAINT pk_idcompra_idproducto_compra_detalle_producto PRIMARY KEY (idcompra, idproducto);


--
-- TOC entry 2083 (class 2606 OID 24596)
-- Name: pk_idcomprobante_tipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comprobante_tipo
    ADD CONSTRAINT pk_idcomprobante_tipo PRIMARY KEY (idcomprobante);


--
-- TOC entry 2065 (class 2606 OID 16445)
-- Name: pk_idcontacto_tipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacto_tipo
    ADD CONSTRAINT pk_idcontacto_tipo PRIMARY KEY (idcontacto_tipo);


--
-- TOC entry 2061 (class 2606 OID 16422)
-- Name: pk_iddocumento_tipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documento_tipo
    ADD CONSTRAINT pk_iddocumento_tipo PRIMARY KEY (iddocumento_tipo);


--
-- TOC entry 2089 (class 2606 OID 32785)
-- Name: pk_idestado_civil; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_civil
    ADD CONSTRAINT pk_idestado_civil PRIMARY KEY (idestado_civil);


--
-- TOC entry 2093 (class 2606 OID 49178)
-- Name: pk_idhorario_horario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT pk_idhorario_horario PRIMARY KEY (idhorario);


--
-- TOC entry 2125 (class 2606 OID 57586)
-- Name: pk_idimpuesto_detalle_impuesto_detalle; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY impuesto_detalle
    ADD CONSTRAINT pk_idimpuesto_detalle_impuesto_detalle PRIMARY KEY (idimpuesto_detalle);


--
-- TOC entry 2123 (class 2606 OID 57578)
-- Name: pk_idimpuesto_impuesto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY impuesto
    ADD CONSTRAINT pk_idimpuesto_impuesto PRIMARY KEY (idimpuesto);


--
-- TOC entry 2117 (class 2606 OID 57519)
-- Name: pk_idkardex_idproducto_kardex_detalle_producto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kardex_detalle_producto
    ADD CONSTRAINT pk_idkardex_idproducto_kardex_detalle_producto PRIMARY KEY (idkardex, idproducto);


--
-- TOC entry 2111 (class 2606 OID 57429)
-- Name: pk_idkardex_kardex; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kardex
    ADD CONSTRAINT pk_idkardex_kardex PRIMARY KEY (idkardex);


--
-- TOC entry 2099 (class 2606 OID 49215)
-- Name: pk_idmarca_marca; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY marca
    ADD CONSTRAINT pk_idmarca_marca PRIMARY KEY (idmarca);


--
-- TOC entry 2077 (class 2606 OID 16505)
-- Name: pk_idmenu; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT pk_idmenu PRIMARY KEY (idmenu);


--
-- TOC entry 2121 (class 2606 OID 57550)
-- Name: pk_idmoneda_cambio_moneda; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY moneda_cambio
    ADD CONSTRAINT pk_idmoneda_cambio_moneda PRIMARY KEY (idmoneda_cambio);


--
-- TOC entry 2119 (class 2606 OID 57542)
-- Name: pk_idmoneda_moneda; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT pk_idmoneda_moneda PRIMARY KEY (idmoneda);


--
-- TOC entry 2087 (class 2606 OID 24634)
-- Name: pk_idnumero; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY numero
    ADD CONSTRAINT pk_idnumero PRIMARY KEY (idnumero);


--
-- TOC entry 2057 (class 2606 OID 16401)
-- Name: pk_idpersona; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT pk_idpersona PRIMARY KEY (idpersona);


--
-- TOC entry 2069 (class 2606 OID 16468)
-- Name: pk_idpersona_grupo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona_grupo
    ADD CONSTRAINT pk_idpersona_grupo PRIMARY KEY (idpersona_grupo);


--
-- TOC entry 2075 (class 2606 OID 16487)
-- Name: pk_idpersona_idrol; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona_detalle_rol
    ADD CONSTRAINT pk_idpersona_idrol PRIMARY KEY (idpersona, idrol);


--
-- TOC entry 2059 (class 2606 OID 16409)
-- Name: pk_idpersona_tipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona_tipo
    ADD CONSTRAINT pk_idpersona_tipo PRIMARY KEY (idpersona_tipo);


--
-- TOC entry 2095 (class 2606 OID 49189)
-- Name: pk_idpersonaidhorario_asistencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asistencia
    ADD CONSTRAINT pk_idpersonaidhorario_asistencia PRIMARY KEY (idpersona, idhorario);


--
-- TOC entry 2097 (class 2606 OID 49207)
-- Name: pk_idproducto_producto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT pk_idproducto_producto PRIMARY KEY (idproducto);


--
-- TOC entry 2073 (class 2606 OID 16482)
-- Name: pk_idrol; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT pk_idrol PRIMARY KEY (idrol);


--
-- TOC entry 2085 (class 2606 OID 24621)
-- Name: pk_idserie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY serie
    ADD CONSTRAINT pk_idserie PRIMARY KEY (idserie);


--
-- TOC entry 2091 (class 2606 OID 49169)
-- Name: pk_idturno_turno; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY turno
    ADD CONSTRAINT pk_idturno_turno PRIMARY KEY (idturno);


--
-- TOC entry 2105 (class 2606 OID 49241)
-- Name: pk_idunidad_medida_unidad_medida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_medida
    ADD CONSTRAINT pk_idunidad_medida_unidad_medida PRIMARY KEY (idunidad_medida);


--
-- TOC entry 2109 (class 2606 OID 57410)
-- Name: pk_idventa_detalle_producto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY venta_detalle_producto
    ADD CONSTRAINT pk_idventa_detalle_producto PRIMARY KEY (idventa, idproducto);


--
-- TOC entry 2067 (class 2606 OID 16450)
-- Name: pk_persona_detalle_contacto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona_detalle_contacto
    ADD CONSTRAINT pk_persona_detalle_contacto PRIMARY KEY (idpersona, idcontacto_tipo);


--
-- TOC entry 2071 (class 2606 OID 16474)
-- Name: pk_persona_detalle_grupo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona_detalle_grupo
    ADD CONSTRAINT pk_persona_detalle_grupo PRIMARY KEY (idpersona, idpersona_grupo);


--
-- TOC entry 2063 (class 2606 OID 16427)
-- Name: pk_persona_documento_tipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona_detalle_documento
    ADD CONSTRAINT pk_persona_documento_tipo PRIMARY KEY (idpersona, iddocumento_tipo);


--
-- TOC entry 2079 (class 2606 OID 16515)
-- Name: pk_rol_detalle_menu; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol_detalle_menu
    ADD CONSTRAINT pk_rol_detalle_menu PRIMARY KEY (idrol, idmenu);


--
-- TOC entry 2081 (class 2606 OID 16539)
-- Name: pk_venta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT pk_venta PRIMARY KEY (idventa);


--
-- TOC entry 2153 (class 2606 OID 57395)
-- Name: fk_idalmacen_almacen_detalle_producto_idalmacen_almacen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY almacen_detalle_producto
    ADD CONSTRAINT fk_idalmacen_almacen_detalle_producto_idalmacen_almacen FOREIGN KEY (idalmacen) REFERENCES almacen(idalmacen) ON UPDATE CASCADE;


--
-- TOC entry 2158 (class 2606 OID 57430)
-- Name: fk_idalmacen_kardex_idalmacen_almacen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex
    ADD CONSTRAINT fk_idalmacen_kardex_idalmacen_almacen FOREIGN KEY (idalmacen) REFERENCES almacen(idalmacen) ON UPDATE CASCADE;


--
-- TOC entry 2152 (class 2606 OID 57390)
-- Name: fk_idcategoria_producto_idcategoria_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT fk_idcategoria_producto_idcategoria_categoria FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria) ON UPDATE CASCADE;


--
-- TOC entry 2155 (class 2606 OID 57385)
-- Name: fk_idcategoria_sub_categoria_idcategoria_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT fk_idcategoria_sub_categoria_idcategoria_categoria FOREIGN KEY (idcategoria_sub) REFERENCES categoria(idcategoria) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2167 (class 2606 OID 57463)
-- Name: fk_idcompra_compra_detalle_producto_idcompra_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra_detalle_producto
    ADD CONSTRAINT fk_idcompra_compra_detalle_producto_idcompra_compra FOREIGN KEY (idcompra) REFERENCES compra(idcompra) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2165 (class 2606 OID 57504)
-- Name: fk_idcomprobante_numero_compra_idcomprobante_numero_numero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT fk_idcomprobante_numero_compra_idcomprobante_numero_numero FOREIGN KEY (idcomprobante_numero) REFERENCES numero(idnumero) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2160 (class 2606 OID 57530)
-- Name: fk_idcomprobante_numero_idnumero_numero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex
    ADD CONSTRAINT fk_idcomprobante_numero_idnumero_numero FOREIGN KEY (idcomprobante_numero) REFERENCES numero(idnumero) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2142 (class 2606 OID 40995)
-- Name: fk_idcomprobante_numero_venta_idnumero_numero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_idcomprobante_numero_venta_idnumero_numero FOREIGN KEY (idcomprobante_numero) REFERENCES numero(idnumero) ON UPDATE CASCADE;


--
-- TOC entry 2145 (class 2606 OID 24640)
-- Name: fk_idcomprobante_serie_idcomprobante_comprobante_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY serie
    ADD CONSTRAINT fk_idcomprobante_serie_idcomprobante_comprobante_tipo FOREIGN KEY (idcomprobante) REFERENCES comprobante_tipo(idcomprobante) ON UPDATE CASCADE;


--
-- TOC entry 2131 (class 2606 OID 16456)
-- Name: fk_idcontacto_tipo_detalle_contacto_contacto_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_detalle_contacto
    ADD CONSTRAINT fk_idcontacto_tipo_detalle_contacto_contacto_tipo FOREIGN KEY (idcontacto_tipo) REFERENCES contacto_tipo(idcontacto_tipo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2129 (class 2606 OID 16433)
-- Name: fk_iddocumento_detalle_iddocumento_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_detalle_documento
    ADD CONSTRAINT fk_iddocumento_detalle_iddocumento_documento FOREIGN KEY (iddocumento_tipo) REFERENCES documento_tipo(iddocumento_tipo);


--
-- TOC entry 2127 (class 2606 OID 32791)
-- Name: fk_idestado_civil_persona_idestado_civil_estado_civil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fk_idestado_civil_persona_idestado_civil_estado_civil FOREIGN KEY (idestado_civil) REFERENCES estado_civil(idestado_civil) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2149 (class 2606 OID 49195)
-- Name: fk_idhorario_asistencia_idhorario_horario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asistencia
    ADD CONSTRAINT fk_idhorario_asistencia_idhorario_horario FOREIGN KEY (idhorario) REFERENCES horario(idhorario) ON UPDATE CASCADE;


--
-- TOC entry 2144 (class 2606 OID 57592)
-- Name: fk_idimpuesto_detalle_venta_idimpuesto_detalle_impuesto_detalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_idimpuesto_detalle_venta_idimpuesto_detalle_impuesto_detalle FOREIGN KEY (idimpuesto_detalle) REFERENCES impuesto_detalle(idimpuesto_detalle) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2172 (class 2606 OID 57587)
-- Name: fk_idimpuesto_impuesto_detalle_idimpuesto_impuesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY impuesto_detalle
    ADD CONSTRAINT fk_idimpuesto_impuesto_detalle_idimpuesto_impuesto FOREIGN KEY (idimpuesto) REFERENCES impuesto(idimpuesto) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2169 (class 2606 OID 57520)
-- Name: fk_idkardex_kardex_detalle_producto_idkardex_kadex; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_detalle_producto
    ADD CONSTRAINT fk_idkardex_kardex_detalle_producto_idkardex_kadex FOREIGN KEY (idkardex) REFERENCES kardex(idkardex) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2150 (class 2606 OID 49216)
-- Name: fk_idmarca_producto_idmarca_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT fk_idmarca_producto_idmarca_marca FOREIGN KEY (idmarca) REFERENCES marca(idmarca) ON UPDATE CASCADE;


--
-- TOC entry 2138 (class 2606 OID 16521)
-- Name: fk_idmenu_detalle_menu_idmenu_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_detalle_menu
    ADD CONSTRAINT fk_idmenu_detalle_menu_idmenu_menu FOREIGN KEY (idmenu) REFERENCES menu(idmenu) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2136 (class 2606 OID 16506)
-- Name: fk_idmenu_menu_idmenu_sub_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT fk_idmenu_menu_idmenu_sub_menu FOREIGN KEY (idmenu_sub) REFERENCES menu(idmenu) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2166 (class 2606 OID 57556)
-- Name: fk_idmoneda_cambio_compra_idmoneda_cambio_moneda_cambio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT fk_idmoneda_cambio_compra_idmoneda_cambio_moneda_cambio FOREIGN KEY (idmoneda_cambio) REFERENCES moneda_cambio(idmoneda_cambio) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2161 (class 2606 OID 57561)
-- Name: fk_idmoneda_cambio_kardex_idmoneda_cambio_moneda_cambio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex
    ADD CONSTRAINT fk_idmoneda_cambio_kardex_idmoneda_cambio_moneda_cambio FOREIGN KEY (idmoneda_cambio) REFERENCES moneda_cambio(idmoneda_cambio) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2143 (class 2606 OID 57566)
-- Name: fk_idmoneda_cambio_venta_idmoneda_cambio_moneda_cambio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_idmoneda_cambio_venta_idmoneda_cambio_moneda_cambio FOREIGN KEY (idmoneda_cambio) REFERENCES moneda_cambio(idmoneda_cambio) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2171 (class 2606 OID 57551)
-- Name: fk_idmoneda_moneda_cambio_idmoneda_moneda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moneda_cambio
    ADD CONSTRAINT fk_idmoneda_moneda_cambio_idmoneda_moneda FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2164 (class 2606 OID 57499)
-- Name: fk_idpersona_aprobacion_compra_idpersona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT fk_idpersona_aprobacion_compra_idpersona_persona FOREIGN KEY (idpersona_aprobacion) REFERENCES persona(idpersona) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2148 (class 2606 OID 49190)
-- Name: fk_idpersona_asistencia_idpersona_horario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asistencia
    ADD CONSTRAINT fk_idpersona_asistencia_idpersona_horario FOREIGN KEY (idpersona) REFERENCES persona(idpersona) ON UPDATE CASCADE;


--
-- TOC entry 2140 (class 2606 OID 40975)
-- Name: fk_idpersona_cliente_venta_idpersona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_idpersona_cliente_venta_idpersona_persona FOREIGN KEY (idpersona_cliente) REFERENCES persona(idpersona) ON UPDATE CASCADE;


--
-- TOC entry 2130 (class 2606 OID 16451)
-- Name: fk_idpersona_detalle_contacto_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_detalle_contacto
    ADD CONSTRAINT fk_idpersona_detalle_contacto_persona FOREIGN KEY (idpersona) REFERENCES persona(idpersona) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2128 (class 2606 OID 16428)
-- Name: fk_idpersona_detalle_idpersona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_detalle_documento
    ADD CONSTRAINT fk_idpersona_detalle_idpersona_persona FOREIGN KEY (idpersona) REFERENCES persona(idpersona);


--
-- TOC entry 2134 (class 2606 OID 16488)
-- Name: fk_idpersona_detalle_rol_id_persona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_detalle_rol
    ADD CONSTRAINT fk_idpersona_detalle_rol_id_persona_persona FOREIGN KEY (idpersona) REFERENCES persona(idpersona) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2162 (class 2606 OID 57489)
-- Name: fk_idpersona_empleado_compra_idpersona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT fk_idpersona_empleado_compra_idpersona_persona FOREIGN KEY (idpersona_empleado) REFERENCES persona(idpersona) ON UPDATE CASCADE;


--
-- TOC entry 2139 (class 2606 OID 40970)
-- Name: fk_idpersona_empleado_venta_idpersona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_idpersona_empleado_venta_idpersona_persona FOREIGN KEY (idpersona_empleado) REFERENCES persona(idpersona);


--
-- TOC entry 2133 (class 2606 OID 40990)
-- Name: fk_idpersona_grupo_persona_detalle_grupo_idpersona_grupo_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_detalle_grupo
    ADD CONSTRAINT fk_idpersona_grupo_persona_detalle_grupo_idpersona_grupo_person FOREIGN KEY (idpersona_grupo) REFERENCES persona_grupo(idpersona_grupo) ON UPDATE CASCADE;


--
-- TOC entry 2159 (class 2606 OID 57445)
-- Name: fk_idpersona_kardex_idpersona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex
    ADD CONSTRAINT fk_idpersona_kardex_idpersona_persona FOREIGN KEY (idpersona) REFERENCES persona(idpersona) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2141 (class 2606 OID 40980)
-- Name: fk_idpersona_pagador_venta_idpersona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT fk_idpersona_pagador_venta_idpersona_persona FOREIGN KEY (idpersona_pagador) REFERENCES persona(idpersona) ON UPDATE CASCADE;


--
-- TOC entry 2132 (class 2606 OID 40985)
-- Name: fk_idpersona_persona_detalle_grupo_idpersona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_detalle_grupo
    ADD CONSTRAINT fk_idpersona_persona_detalle_grupo_idpersona_persona FOREIGN KEY (idpersona) REFERENCES persona(idpersona) ON UPDATE CASCADE;


--
-- TOC entry 2163 (class 2606 OID 57494)
-- Name: fk_idpersona_proveedor_compra_idpersona_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT fk_idpersona_proveedor_compra_idpersona_persona FOREIGN KEY (idpersona_proveedor) REFERENCES persona(idpersona) ON UPDATE CASCADE;


--
-- TOC entry 2126 (class 2606 OID 16410)
-- Name: fk_idpersona_tipo_persona_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fk_idpersona_tipo_persona_tipo FOREIGN KEY (idpersona_tipo) REFERENCES persona_tipo(idpersona_tipo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2154 (class 2606 OID 57400)
-- Name: fk_idproducto_almacen_detalle_producto_idproducto_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY almacen_detalle_producto
    ADD CONSTRAINT fk_idproducto_almacen_detalle_producto_idproducto_producto FOREIGN KEY (idproducto) REFERENCES producto(idproducto) ON UPDATE CASCADE;


--
-- TOC entry 2168 (class 2606 OID 57468)
-- Name: fk_idproducto_compra_detalle_producto_idproducto_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra_detalle_producto
    ADD CONSTRAINT fk_idproducto_compra_detalle_producto_idproducto_producto FOREIGN KEY (idproducto) REFERENCES producto(idproducto) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2170 (class 2606 OID 57525)
-- Name: fk_idproducto_kardex_detalle_producto_idproducto_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kardex_detalle_producto
    ADD CONSTRAINT fk_idproducto_kardex_detalle_producto_idproducto_producto FOREIGN KEY (idproducto) REFERENCES producto(idproducto) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2157 (class 2606 OID 57416)
-- Name: fk_idproducto_venta_detalle_producto_idproducto_proudcto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta_detalle_producto
    ADD CONSTRAINT fk_idproducto_venta_detalle_producto_idproducto_proudcto FOREIGN KEY (idproducto) REFERENCES producto(idproducto) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2137 (class 2606 OID 16516)
-- Name: fk_idrol_detalle_menu_idrol_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_detalle_menu
    ADD CONSTRAINT fk_idrol_detalle_menu_idrol_rol FOREIGN KEY (idrol) REFERENCES rol(idrol) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2135 (class 2606 OID 16493)
-- Name: fk_idrol_detalle_rol_idrol_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_detalle_rol
    ADD CONSTRAINT fk_idrol_detalle_rol_idrol_rol FOREIGN KEY (idrol) REFERENCES rol(idrol) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2146 (class 2606 OID 24635)
-- Name: fk_idserie_numero_idserie_serie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numero
    ADD CONSTRAINT fk_idserie_numero_idserie_serie FOREIGN KEY (idserie) REFERENCES serie(idserie) ON UPDATE CASCADE;


--
-- TOC entry 2147 (class 2606 OID 49179)
-- Name: fk_idturno_horario_idturno_turno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT fk_idturno_horario_idturno_turno FOREIGN KEY (idturno) REFERENCES turno(idturno) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2151 (class 2606 OID 57372)
-- Name: fk_idunidad_medida_producto_idunidad_medida_unidad_medida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT fk_idunidad_medida_producto_idunidad_medida_unidad_medida FOREIGN KEY (idunidad_medida) REFERENCES unidad_medida(idunidad_medida) ON UPDATE CASCADE;


--
-- TOC entry 2156 (class 2606 OID 57411)
-- Name: fk_idventa_venta_detalle_producto_idventa_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta_detalle_producto
    ADD CONSTRAINT fk_idventa_venta_detalle_producto_idventa_venta FOREIGN KEY (idventa) REFERENCES venta(idventa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-09-08 22:44:55

--
-- PostgreSQL database dump complete
--

