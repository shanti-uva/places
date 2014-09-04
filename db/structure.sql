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
-- Name: topology; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA topology;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET search_path = public, pg_catalog;

--
-- Name: shapetrig(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION shapetrig() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF (GeometryType(NEW.geometry) = 'POLYGON') THEN
      NEW.geometry = Multi(New.geometry);
      NEW.area = Area(New.geometry);
    END IF;
    IF (GeometryType(NEW.geometry) = 'LINESTRING') THEN
      NEW.geometry = Multi(New.geometry);
    END IF;
    RETURN NEW;
  END;
$$;


--
-- Name: st_askml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT AsUKML(transform($1,4326),$2,$3)$_$;


--
-- Name: trtibet(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION trtibet(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  trrec RECORD;
  rname TEXT;
BEGIN
  rname := name;
  FOR trrec IN SELECT * FROM trtibet WHERE position(std IN name) > 0 ORDER BY length(std) DESC LOOP
    rname := replace(rname, trrec.std, trrec.pc);
  END LOOP;
  RETURN rname;
END;
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Birth_rate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Birth_rate" (
    gid integer NOT NULL,
    name character varying(27),
    pop_total double precision,
    births_199 double precision,
    rate double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Births_and_deaths; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Births_and_deaths" (
    gid integer NOT NULL,
    name character varying(27),
    births_1990 double precision,
    deaths_1990 double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Death_rate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Death_rate" (
    gid integer NOT NULL,
    name character varying(27),
    pop_total double precision,
    death_1990 double precision,
    rate double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Economical_activity; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Economical_activity" (
    gid integer NOT NULL,
    name character varying(27),
    agriculture double precision,
    industry double precision,
    mining double precision,
    constructio double precision,
    government_ double precision,
    other integer,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Ethnic_distribution; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Ethnic_distribution" (
    gid integer NOT NULL,
    name character varying(27),
    population_ double precision,
    "Han" double precision,
    "Tibetans" double precision,
    "Mongols" double precision,
    "Hui" double precision,
    other integer,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Han_rate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Han_rate" (
    gid integer NOT NULL,
    name character varying(27),
    pop_total double precision,
    pop_han double precision,
    rate double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Illiteracy_per_gender; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Illiteracy_per_gender" (
    gid integer NOT NULL,
    name character varying(27),
    pop_total double precision,
    illit_male double precision,
    illit_fem double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Illiteracy_rate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Illiteracy_rate" (
    gid integer NOT NULL,
    name character varying(27),
    pop_total double precision,
    pop_illet double precision,
    rate double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Immigration_rate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Immigration_rate" (
    gid integer NOT NULL,
    name character varying(27),
    pop_total integer,
    immig double precision,
    rate double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Population_density; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Population_density" (
    gid integer NOT NULL,
    name character varying(27),
    pop_total double precision,
    sq_km double precision,
    density double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Population_per_gender; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Population_per_gender" (
    gid integer NOT NULL,
    name character varying(27),
    males_1990 double precision,
    females_199 double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: Tibetan_rate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Tibetan_rate" (
    gid integer NOT NULL,
    name character varying(27),
    pop_total double precision,
    pop_tib double precision,
    rate double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: altitudes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE altitudes (
    id integer NOT NULL,
    feature_id integer NOT NULL,
    maximum integer,
    minimum integer,
    average integer,
    unit_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    estimate character varying(255)
);


--
-- Name: altitudes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE altitudes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: altitudes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE altitudes_id_seq OWNED BY altitudes.id;


--
-- Name: authors_descriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authors_descriptions (
    description_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- Name: authors_notes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authors_notes (
    note_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- Name: bellezza; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bellezza (
    gid integer NOT NULL,
    objectid integer,
    sort_no numeric,
    type character varying(254),
    site_no character varying(254),
    name_wylie character varying(254),
    name_eng character varying(254),
    county character varying(254),
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: bellezza_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bellezza_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bellezza_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bellezza_gid_seq OWNED BY bellezza.gid;


--
-- Name: blurbs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE blurbs (
    id integer NOT NULL,
    code character varying(255),
    title character varying(255),
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: blurbs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE blurbs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blurbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE blurbs_id_seq OWNED BY blurbs.id;


--
-- Name: cached_category_counts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cached_category_counts (
    id integer NOT NULL,
    category_id integer NOT NULL,
    count integer NOT NULL,
    cache_updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    count_with_shapes integer NOT NULL
);


--
-- Name: cached_category_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cached_category_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cached_category_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cached_category_counts_id_seq OWNED BY cached_category_counts.id;


--
-- Name: cached_feature_names; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cached_feature_names (
    id integer NOT NULL,
    feature_id integer NOT NULL,
    view_id integer NOT NULL,
    feature_name_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cached_feature_names_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cached_feature_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cached_feature_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cached_feature_names_id_seq OWNED BY cached_feature_names.id;


--
-- Name: cached_feature_relation_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cached_feature_relation_categories (
    id integer NOT NULL,
    feature_id integer,
    related_feature_id integer,
    category_id integer,
    perspective_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    feature_relation_type_id integer,
    feature_is_parent boolean
);


--
-- Name: cached_feature_relation_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cached_feature_relation_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cached_feature_relation_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cached_feature_relation_categories_id_seq OWNED BY cached_feature_relation_categories.id;


--
-- Name: captions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE captions (
    id integer NOT NULL,
    language_id integer NOT NULL,
    content text NOT NULL,
    author_id integer NOT NULL,
    feature_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: captions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE captions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: captions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE captions_id_seq OWNED BY captions.id;


--
-- Name: feature_object_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE feature_object_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_features; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE category_features (
    id integer DEFAULT nextval('feature_object_types_id_seq'::regclass) NOT NULL,
    feature_id integer NOT NULL,
    category_id integer NOT NULL,
    perspective_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer DEFAULT 0 NOT NULL,
    type character varying(255),
    string_value character varying(255),
    numeric_value integer,
    show_parent boolean DEFAULT false NOT NULL,
    show_root boolean DEFAULT true NOT NULL,
    label character varying(255),
    prefix_label boolean DEFAULT true NOT NULL
);


--
-- Name: citations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE citations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: citations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE citations (
    id integer DEFAULT nextval('citations_id_seq'::regclass) NOT NULL,
    info_source_id integer,
    citable_type character varying(255),
    citable_id integer,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: complex_dates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE complex_dates (
    id integer NOT NULL,
    year integer,
    year_certainty_id integer,
    season_id integer,
    season_certainty_id integer,
    month integer,
    month_certainty_id integer,
    day integer,
    day_certainty_id integer,
    day_of_week_id integer,
    day_of_week_certainty_id integer,
    time_of_day_id integer,
    time_of_day_certainty_id integer,
    hour integer,
    hour_certainty_id integer,
    minute integer,
    minute_certainty_id integer,
    animal_id integer,
    animal_certainty_id integer,
    calendrical_id integer,
    calendrical_certainty_id integer,
    element_certainty_id integer,
    element_id integer,
    gender_id integer,
    gender_certainty_id integer,
    intercalary_month_id integer,
    intercalary_day_id integer,
    rabjung_id integer,
    rabjung_certainty_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    year_end integer,
    season_end_id integer,
    month_end integer,
    day_end integer,
    day_of_week_end_id integer,
    time_of_day_end_id integer,
    hour_end integer,
    minute_end integer,
    rabjung_end_id integer,
    intercalary_month_end_id integer,
    intercalary_day_end_id integer
);


--
-- Name: complex_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE complex_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complex_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE complex_dates_id_seq OWNED BY complex_dates.id;


--
-- Name: contestations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contestations (
    id integer NOT NULL,
    feature_id integer NOT NULL,
    contested boolean DEFAULT true NOT NULL,
    administrator_id integer,
    claimant_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: contestations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contestations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contestations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contestations_id_seq OWNED BY contestations.id;


--
-- Name: cumulative_category_feature_associations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cumulative_category_feature_associations (
    id integer NOT NULL,
    feature_id integer NOT NULL,
    category_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cumulative_category_feature_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cumulative_category_feature_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cumulative_category_feature_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cumulative_category_feature_associations_id_seq OWNED BY cumulative_category_feature_associations.id;


--
-- Name: descriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE descriptions (
    id integer NOT NULL,
    feature_id integer NOT NULL,
    content text NOT NULL,
    is_primary boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying(255),
    source_url character varying(255)
);


--
-- Name: descriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE descriptions_id_seq OWNED BY descriptions.id;


--
-- Name: feature_names_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE feature_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feature_names; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE feature_names (
    id integer DEFAULT nextval('feature_names_id_seq'::regclass) NOT NULL,
    feature_id integer NOT NULL,
    name character varying(255) NOT NULL,
    feature_name_type_id integer,
    ancestor_ids character varying(255),
    "position" integer DEFAULT 0,
    etymology text,
    writing_system_id integer,
    language_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_primary_for_romanization boolean DEFAULT false
);


--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: features; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE features (
    id integer DEFAULT nextval('features_id_seq'::regclass) NOT NULL,
    is_public smallint DEFAULT (0)::smallint,
    "position" integer DEFAULT 0,
    ancestor_ids character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    old_pid character varying(255),
    is_blank boolean DEFAULT false NOT NULL,
    fid integer NOT NULL,
    is_name_position_overriden boolean DEFAULT false NOT NULL
);


--
-- Name: shapes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shapes (
    gid integer NOT NULL,
    geometry geometry,
    fid integer,
    "position" integer DEFAULT 0 NOT NULL,
    area real,
    altitude integer,
    is_public boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT enforce_dims_geometry CHECK ((st_ndims(geometry) = 2)),
    CONSTRAINT enforce_srid_geometry CHECK ((st_srid(geometry) = 4326))
);


--
-- Name: simple_props_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE simple_props_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: simple_props; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE simple_props (
    id integer DEFAULT nextval('simple_props_id_seq'::regclass) NOT NULL,
    name character varying(255),
    code character varying(255),
    description text,
    notes text,
    type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: symbol_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE symbol_type (
    object_type integer,
    symbol character varying
);


--
-- Name: devanagari_line; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW devanagari_line AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'deva'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: devanagari_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW devanagari_poly AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'deva'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: devanagari_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW devanagari_pt AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'deva'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


--
-- Name: electricity_use_10_million_watt_hours; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE electricity_use_10_million_watt_hours (
    gid integer NOT NULL,
    name character varying(27),
    elect_use double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: external_pictures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE external_pictures (
    id integer NOT NULL,
    url character varying(255) NOT NULL,
    caption text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    place_id integer
);


--
-- Name: external_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE external_pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: external_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE external_pictures_id_seq OWNED BY external_pictures.id;


--
-- Name: feature_geo_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE feature_geo_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feature_geo_codes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE feature_geo_codes (
    id integer DEFAULT nextval('feature_geo_codes_id_seq'::regclass) NOT NULL,
    feature_id integer,
    geo_code_type_id integer,
    timespan_id integer,
    geo_code_value character varying(255),
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: feature_name_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE feature_name_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feature_name_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE feature_name_relations (
    id integer DEFAULT nextval('feature_name_relations_id_seq'::regclass) NOT NULL,
    child_node_id integer NOT NULL,
    parent_node_id integer NOT NULL,
    ancestor_ids character varying(255),
    is_phonetic smallint DEFAULT (0)::smallint,
    is_orthographic smallint DEFAULT (0)::smallint,
    is_translation smallint DEFAULT (0)::smallint,
    is_alt_spelling smallint DEFAULT (0)::smallint,
    phonetic_system_id integer,
    orthographic_system_id integer,
    alt_spelling_system_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: feature_relation_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE feature_relation_types (
    id integer NOT NULL,
    is_symmetric boolean,
    label character varying(255) NOT NULL,
    asymmetric_label character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    code character varying(255) NOT NULL,
    is_hierarchical boolean DEFAULT false NOT NULL,
    asymmetric_code character varying(255)
);


--
-- Name: feature_relation_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE feature_relation_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feature_relation_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE feature_relation_types_id_seq OWNED BY feature_relation_types.id;


--
-- Name: feature_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE feature_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feature_relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE feature_relations (
    id integer DEFAULT nextval('feature_relations_id_seq'::regclass) NOT NULL,
    child_node_id integer NOT NULL,
    parent_node_id integer NOT NULL,
    ancestor_ids character varying(255),
    notes text,
    role character varying(20),
    perspective_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    feature_relation_type_id integer NOT NULL
);


--
-- Name: features_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE features_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: features_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE features_gid_seq OWNED BY shapes.gid;


--
-- Name: fontdemo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fontdemo (
    font character varying(50),
    text character varying(100),
    x double precision,
    y double precision,
    geometry geometry,
    gid integer NOT NULL,
    CONSTRAINT enforce_dims_geometry CHECK ((st_ndims(geometry) = 2)),
    CONSTRAINT enforce_geotype_geometry CHECK (((geometrytype(geometry) = 'POINT'::text) OR (geometry IS NULL))),
    CONSTRAINT enforce_srid_geometry CHECK ((st_srid(geometry) = 4326))
);


--
-- Name: fontdemo_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fontdemo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fontdemo_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fontdemo_gid_seq OWNED BY fontdemo.gid;


--
-- Name: gis_id_xref; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE gis_id_xref (
    gis_id integer,
    fid integer
);


--
-- Name: grain_output_tons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grain_output_tons (
    gid integer NOT NULL,
    name character varying(27),
    output_tons double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


SET default_with_oids = true;

--
-- Name: illiteracy_per_gender; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE illiteracy_per_gender (
    name text,
    pop_total double precision,
    illit_male double precision,
    illit_fem double precision,
    geometry geometry,
    CONSTRAINT enforce_dims_geometry CHECK ((st_ndims(geometry) = 2)),
    CONSTRAINT enforce_srid_geometry CHECK ((st_srid(geometry) = 4326))
);


SET default_with_oids = false;

--
-- Name: illustrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE illustrations (
    id integer NOT NULL,
    feature_id integer NOT NULL,
    picture_id integer NOT NULL,
    picture_type character varying(255) NOT NULL,
    is_primary boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: illustrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE illustrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: illustrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE illustrations_id_seq OWNED BY illustrations.id;


--
-- Name: importation_tasks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE importation_tasks (
    id integer NOT NULL,
    task_code character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: importation_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE importation_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: importation_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE importation_tasks_id_seq OWNED BY importation_tasks.id;


--
-- Name: imported_spreadsheets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE imported_spreadsheets (
    id integer NOT NULL,
    filename character varying(255) NOT NULL,
    task_id integer NOT NULL,
    imported_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: imported_spreadsheets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE imported_spreadsheets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: imported_spreadsheets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE imported_spreadsheets_id_seq OWNED BY imported_spreadsheets.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE imports (
    id integer NOT NULL,
    spreadsheet_id integer NOT NULL,
    item_id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE imports_id_seq OWNED BY imports.id;


--
-- Name: info_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE info_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: info_sources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE info_sources (
    id integer DEFAULT nextval('info_sources_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    title character varying(255),
    agent character varying(255),
    date_published date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: khrom_empire_garrisons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE khrom_empire_garrisons (
    gid integer NOT NULL,
    "AREA" double precision,
    "PERIMETER" double precision,
    "VKHROM_" integer,
    "VKHROM_ID" integer,
    "GIS_ID" double precision,
    khrom__gar character varying(254),
    "Region_s_" character varying(254),
    "Location_n" character varying(254),
    source character varying(254),
    "X_Deg" double precision,
    "X_Min" double precision,
    "Y_Deg" double precision,
    "Y_Min" double precision,
    "F10" character varying(254),
    "X_dd" double precision,
    "Y_dd" double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: landcover; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE landcover (
    type character varying(40),
    the_geom geometry,
    gid integer NOT NULL
);


--
-- Name: landcover_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE landcover_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: landcover_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE landcover_gid_seq OWNED BY landcover.gid;


--
-- Name: lhasa_temples; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lhasa_temples (
    gid integer NOT NULL,
    id integer,
    gis_id integer,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: lhasa_temples_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lhasa_temples_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lhasa_temples_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lhasa_temples_gid_seq OWNED BY lhasa_temples.gid;


--
-- Name: maketest2; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW maketest2 AS
 SELECT DISTINCT shapes.gid,
    shapes.fid,
    feature_object_types.category_id AS object_type,
    'roman.popular'::character varying AS language,
    feature_names.name,
    geometrytype(shapes.geometry) AS geotype,
    shapes.geometry
   FROM shapes,
    category_features feature_object_types,
    features,
    feature_names,
    simple_props,
    cached_feature_names
  WHERE ((((((shapes.fid = features.fid) AND (features.id = feature_object_types.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (simple_props.id = cached_feature_names.view_id)) AND ((simple_props.code)::text = 'roman.popular'::text))
  ORDER BY shapes.gid, shapes.fid, feature_object_types.category_id, 'roman.popular'::character varying, feature_names.name, geometrytype(shapes.geometry), shapes.geometry;


--
-- Name: note_titles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE note_titles (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: note_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE note_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: note_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE note_titles_id_seq OWNED BY note_titles.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE notes (
    id integer NOT NULL,
    notable_type character varying(255),
    notable_id integer,
    note_title_id integer,
    custom_note_title character varying(255),
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    association_type character varying(255),
    is_public boolean DEFAULT true
);


--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notes_id_seq OWNED BY notes.id;


--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE open_id_authentication_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE open_id_authentication_nonces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    citation_id integer,
    volume integer,
    start_page integer,
    start_line integer,
    end_page integer,
    end_line integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE people (
    id integer NOT NULL,
    fullname character varying(255) NOT NULL
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permissions (
    id integer NOT NULL,
    title character varying(60) NOT NULL,
    description text
);


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: permissions_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permissions_roles (
    permission_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- Name: perspectives; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE perspectives (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description text,
    notes text,
    is_public boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: perspectives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE perspectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: perspectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE perspectives_id_seq OWNED BY perspectives.id;


--
-- Name: roman_popular; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roman_popular (
    fid integer,
    object_type integer,
    language character varying(255),
    name character varying(255),
    geotype text,
    geometry geometry,
    gid integer NOT NULL
);


--
-- Name: points_only; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW points_only AS
 SELECT roman_popular.fid,
    roman_popular.object_type,
    roman_popular.language,
    ("substring"((roman_popular.name)::text, 1, 25))::character varying AS name,
    roman_popular.geotype,
    roman_popular.geometry,
    roman_popular.gid
   FROM roman_popular
  WHERE (roman_popular.geotype = 'POINT'::text);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    title character varying(20) NOT NULL,
    description text
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles_users (
    role_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: roman_popular_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roman_popular_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roman_popular_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roman_popular_gid_seq OWNED BY roman_popular.gid;


--
-- Name: roman_popular_line; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_popular_line AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: roman_popular_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_popular_poly AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: roman_popular_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_popular_pt AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


--
-- Name: roman_scholarly; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roman_scholarly (
    fid integer,
    object_type integer,
    language character varying(255),
    name character varying(255),
    geotype text,
    geometry geometry,
    gid integer NOT NULL
);


--
-- Name: roman_scholarly_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roman_scholarly_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roman_scholarly_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roman_scholarly_gid_seq OWNED BY roman_scholarly.gid;


--
-- Name: roman_scholarly_line; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_scholarly_line AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.scholar'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: roman_scholarly_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_scholarly_poly AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.scholar'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: roman_scholarly_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_scholarly_pt AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.scholar'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: simple_chinese; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE simple_chinese (
    fid integer,
    object_type integer,
    language character varying(255),
    name character varying(255),
    geotype text,
    geometry geometry,
    gid integer NOT NULL
);


--
-- Name: simple_chinese_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE simple_chinese_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: simple_chinese_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE simple_chinese_gid_seq OWNED BY simple_chinese.gid;


--
-- Name: simple_chinese_line; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW simple_chinese_line AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'simp.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: simple_chinese_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW simple_chinese_poly AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'simp.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: simple_chinese_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW simple_chinese_pt AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'simp.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


--
-- Name: simple_names; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW simple_names AS
 SELECT a.feature_id AS fid,
    b.name
   FROM cached_feature_names a,
    feature_names b,
    simple_props sp1,
    simple_props sp2
  WHERE (((((a.feature_name_id = b.id) AND (sp1.id = a.view_id)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (b.writing_system_id = sp2.id));


--
-- Name: summaries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE summaries (
    id integer NOT NULL,
    language_id integer NOT NULL,
    content text NOT NULL,
    author_id integer NOT NULL,
    feature_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: summaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE summaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: summaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE summaries_id_seq OWNED BY summaries.id;


--
-- Name: test2_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE test2_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test2; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE test2 (
    gid integer DEFAULT nextval('test2_gid_seq'::regclass) NOT NULL,
    fid integer,
    object_type integer,
    language character varying(255),
    name character varying(255),
    geotype text,
    geometry geometry
);


--
-- Name: tibetan_chinese; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW tibetan_chinese AS
 SELECT DISTINCT ((10000 * shapes.gid) + feature_object_types.category_id) AS gid,
    shapes.fid,
    feature_object_types.category_id AS object_type,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.geometry
   FROM shapes,
    category_features feature_object_types,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2
  WHERE ((((((((shapes.fid = features.fid) AND (features.id = feature_object_types.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND ((sp1.code)::text = 'pri.tib.sec.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id))
  ORDER BY ((10000 * shapes.gid) + feature_object_types.category_id), shapes.fid, feature_object_types.category_id, sp1.name, feature_names.name, sp2.name, geometrytype(shapes.geometry), shapes.geometry;


--
-- Name: tibetan_chinese_line; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW tibetan_chinese_line AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END AS name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'pri.tib.sec.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: tibetan_chinese_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW tibetan_chinese_poly AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END AS name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'pri.tib.sec.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: tibetan_chinese_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW tibetan_chinese_pt AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END AS name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'pri.tib.sec.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


--
-- Name: tibetan_roman; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tibetan_roman (
    fid integer,
    object_type integer,
    language character varying(255),
    name character varying(255),
    geotype text,
    geometry geometry,
    gid integer NOT NULL
);


--
-- Name: tibetan_roman_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tibetan_roman_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tibetan_roman_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tibetan_roman_gid_seq OWNED BY tibetan_roman.gid;


--
-- Name: tibetan_roman_line; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW tibetan_roman_line AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END AS name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'pri.tib.sec.roman'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: tibetan_roman_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW tibetan_roman_poly AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END AS name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'pri.tib.sec.roman'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: tibetan_roman_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW tibetan_roman_pt AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END AS name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'pri.tib.sec.roman'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


--
-- Name: tibetan_test_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW tibetan_test_poly AS
 SELECT DISTINCT ((10000 * shapes.gid) + feature_object_types.category_id) AS gid,
    shapes.fid,
    feature_object_types.category_id AS object_type,
    sp1.name AS language,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END AS name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.geometry
   FROM shapes,
    category_features feature_object_types,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2
  WHERE (((((((((shapes.fid = features.fid) AND (features.id = feature_object_types.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND ((sp1.code)::text = 'pri.tib.sec.roman'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text))
  ORDER BY ((10000 * shapes.gid) + feature_object_types.category_id), shapes.fid, feature_object_types.category_id, sp1.name,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END, sp2.name, geometrytype(shapes.geometry), shapes.geometry;


--
-- Name: tibetan_test_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW tibetan_test_pt AS
 SELECT DISTINCT ((10000 * shapes.gid) + feature_object_types.category_id) AS gid,
    shapes.fid,
    feature_object_types.category_id AS object_type,
    sp1.name AS language,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END AS name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.geometry
   FROM shapes,
    category_features feature_object_types,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2
  WHERE (((((((((shapes.fid = features.fid) AND (features.id = feature_object_types.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND ((sp1.code)::text = 'pri.tib.sec.roman'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND (geometrytype(shapes.geometry) = 'POINT'::text))
  ORDER BY ((10000 * shapes.gid) + feature_object_types.category_id), shapes.fid, feature_object_types.category_id, sp1.name,
        CASE
            WHEN ((sp2.name)::text = 'Tibetan script'::text) THEN (trtibet((feature_names.name)::text))::character varying
            ELSE feature_names.name
        END, sp2.name, geometrytype(shapes.geometry), shapes.geometry;


--
-- Name: time_units; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE time_units (
    id integer NOT NULL,
    date_id integer,
    start_date_id integer,
    end_date_id integer,
    calendar_id integer,
    is_range boolean,
    dateable_id integer,
    dateable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    frequency_id integer
);


--
-- Name: time_units_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE time_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: time_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE time_units_id_seq OWNED BY time_units.id;


--
-- Name: timespans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE timespans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: timespans; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE timespans (
    id integer DEFAULT nextval('timespans_id_seq'::regclass) NOT NULL,
    start_date date,
    end_date date,
    start_date_fuzz integer,
    end_date_fuzz integer,
    is_current smallint DEFAULT (1)::smallint,
    dateable_id integer,
    dateable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tlatlong; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tlatlong (
    gid integer NOT NULL,
    valueid bigint,
    polyid bigint,
    area double precision,
    perimeter double precision,
    "tlatlong#" integer,
    "tlatlong-i" integer,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: tlatlong_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tlatlong_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tlatlong_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tlatlong_gid_seq OWNED BY tlatlong.gid;


--
-- Name: traditional_chinese; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE traditional_chinese (
    fid integer,
    object_type integer,
    language character varying(255),
    name character varying(255),
    geotype text,
    geometry geometry,
    gid integer NOT NULL
);


--
-- Name: traditional_chinese_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE traditional_chinese_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: traditional_chinese_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE traditional_chinese_gid_seq OWNED BY traditional_chinese.gid;


--
-- Name: traditional_chinese_line; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW traditional_chinese_line AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'trad.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: traditional_chinese_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW traditional_chinese_poly AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'trad.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: traditional_chinese_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW traditional_chinese_pt AS
 SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid,
    shapes.fid,
    category_features.category_id AS object_type,
    symbol_type.symbol,
    sp1.name AS language,
    feature_names.name,
    sp2.name AS writing,
    geometrytype(shapes.geometry) AS geotype,
    shapes.area,
    shapes.geometry
   FROM shapes,
    category_features,
    features,
    feature_names,
    simple_props sp1,
    cached_feature_names,
    simple_props sp2,
    symbol_type
  WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'trad.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


--
-- Name: trtibet; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trtibet (
    pc character varying(1),
    std character varying(7)
);


--
-- Name: ulatlong; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ulatlong (
    gid integer NOT NULL,
    valueid bigint,
    polyid bigint,
    area double precision,
    perimeter double precision,
    "ulatlong#" integer,
    "ulatlong-i" integer,
    vugompa_ bigint,
    vugompa_id bigint,
    h465utm_ numeric(20,0),
    h465utm_id numeric(20,0),
    gis_id numeric(20,0),
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: ulatlong_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ulatlong_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ulatlong_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ulatlong_gid_seq OWNED BY ulatlong.gid;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    login character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    person_id integer NOT NULL,
    crypted_password character varying(40),
    salt character varying(40),
    remember_token character varying(255),
    remember_token_expires_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    identity_url character varying(255),
    shibboleth_id character varying(255)
);


--
-- Name: web_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE web_pages (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    citation_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: web_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE web_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: web_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE web_pages_id_seq OWNED BY web_pages.id;


--
-- Name: xml_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE xml_documents_id_seq
    START WITH 5272
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: xml_documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE xml_documents (
    id integer DEFAULT nextval('xml_documents_id_seq'::regclass) NOT NULL,
    feature_id integer NOT NULL,
    document text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY altitudes ALTER COLUMN id SET DEFAULT nextval('altitudes_id_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bellezza ALTER COLUMN gid SET DEFAULT nextval('bellezza_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY blurbs ALTER COLUMN id SET DEFAULT nextval('blurbs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cached_category_counts ALTER COLUMN id SET DEFAULT nextval('cached_category_counts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cached_feature_names ALTER COLUMN id SET DEFAULT nextval('cached_feature_names_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cached_feature_relation_categories ALTER COLUMN id SET DEFAULT nextval('cached_feature_relation_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY captions ALTER COLUMN id SET DEFAULT nextval('captions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY complex_dates ALTER COLUMN id SET DEFAULT nextval('complex_dates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contestations ALTER COLUMN id SET DEFAULT nextval('contestations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cumulative_category_feature_associations ALTER COLUMN id SET DEFAULT nextval('cumulative_category_feature_associations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY descriptions ALTER COLUMN id SET DEFAULT nextval('descriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY external_pictures ALTER COLUMN id SET DEFAULT nextval('external_pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY feature_relation_types ALTER COLUMN id SET DEFAULT nextval('feature_relation_types_id_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fontdemo ALTER COLUMN gid SET DEFAULT nextval('fontdemo_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY illustrations ALTER COLUMN id SET DEFAULT nextval('illustrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY importation_tasks ALTER COLUMN id SET DEFAULT nextval('importation_tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY imported_spreadsheets ALTER COLUMN id SET DEFAULT nextval('imported_spreadsheets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY imports ALTER COLUMN id SET DEFAULT nextval('imports_id_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY landcover ALTER COLUMN gid SET DEFAULT nextval('landcover_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lhasa_temples ALTER COLUMN gid SET DEFAULT nextval('lhasa_temples_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY note_titles ALTER COLUMN id SET DEFAULT nextval('note_titles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notes ALTER COLUMN id SET DEFAULT nextval('notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY perspectives ALTER COLUMN id SET DEFAULT nextval('perspectives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roman_popular ALTER COLUMN gid SET DEFAULT nextval('roman_popular_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roman_scholarly ALTER COLUMN gid SET DEFAULT nextval('roman_scholarly_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shapes ALTER COLUMN gid SET DEFAULT nextval('features_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY simple_chinese ALTER COLUMN gid SET DEFAULT nextval('simple_chinese_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY summaries ALTER COLUMN id SET DEFAULT nextval('summaries_id_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tibetan_roman ALTER COLUMN gid SET DEFAULT nextval('tibetan_roman_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY time_units ALTER COLUMN id SET DEFAULT nextval('time_units_id_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tlatlong ALTER COLUMN gid SET DEFAULT nextval('tlatlong_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY traditional_chinese ALTER COLUMN gid SET DEFAULT nextval('traditional_chinese_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ulatlong ALTER COLUMN gid SET DEFAULT nextval('ulatlong_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY web_pages ALTER COLUMN id SET DEFAULT nextval('web_pages_id_seq'::regclass);


--
-- Name: Birth_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Birth_rate"
    ADD CONSTRAINT "Birth_rate_pkey" PRIMARY KEY (gid);


--
-- Name: Births_and_deaths_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Births_and_deaths"
    ADD CONSTRAINT "Births_and_deaths_pkey" PRIMARY KEY (gid);


--
-- Name: Death_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Death_rate"
    ADD CONSTRAINT "Death_rate_pkey" PRIMARY KEY (gid);


--
-- Name: Economical_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Economical_activity"
    ADD CONSTRAINT "Economical_activity_pkey" PRIMARY KEY (gid);


--
-- Name: Ethnic_distribution_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Ethnic_distribution"
    ADD CONSTRAINT "Ethnic_distribution_pkey" PRIMARY KEY (gid);


--
-- Name: Han_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Han_rate"
    ADD CONSTRAINT "Han_rate_pkey" PRIMARY KEY (gid);


--
-- Name: Illiteracy_per_gender_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Illiteracy_per_gender"
    ADD CONSTRAINT "Illiteracy_per_gender_pkey" PRIMARY KEY (gid);


--
-- Name: Illiteracy_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Illiteracy_rate"
    ADD CONSTRAINT "Illiteracy_rate_pkey" PRIMARY KEY (gid);


--
-- Name: Immigration_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Immigration_rate"
    ADD CONSTRAINT "Immigration_rate_pkey" PRIMARY KEY (gid);


--
-- Name: Population_density_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Population_density"
    ADD CONSTRAINT "Population_density_pkey" PRIMARY KEY (gid);


--
-- Name: Population_per_gender_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Population_per_gender"
    ADD CONSTRAINT "Population_per_gender_pkey" PRIMARY KEY (gid);


--
-- Name: Tibetan_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Tibetan_rate"
    ADD CONSTRAINT "Tibetan_rate_pkey" PRIMARY KEY (gid);


--
-- Name: altitudes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY altitudes
    ADD CONSTRAINT altitudes_pkey PRIMARY KEY (id);


--
-- Name: bellezza_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bellezza
    ADD CONSTRAINT bellezza_pkey PRIMARY KEY (gid);


--
-- Name: blurbs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY blurbs
    ADD CONSTRAINT blurbs_pkey PRIMARY KEY (id);


--
-- Name: cached_category_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cached_category_counts
    ADD CONSTRAINT cached_category_counts_pkey PRIMARY KEY (id);


--
-- Name: cached_feature_names_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cached_feature_names
    ADD CONSTRAINT cached_feature_names_pkey PRIMARY KEY (id);


--
-- Name: cached_feature_relation_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cached_feature_relation_categories
    ADD CONSTRAINT cached_feature_relation_categories_pkey PRIMARY KEY (id);


--
-- Name: captions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY captions
    ADD CONSTRAINT captions_pkey PRIMARY KEY (id);


--
-- Name: citations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (id);


--
-- Name: complex_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY complex_dates
    ADD CONSTRAINT complex_dates_pkey PRIMARY KEY (id);


--
-- Name: contestations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contestations
    ADD CONSTRAINT contestations_pkey PRIMARY KEY (id);


--
-- Name: cumulative_category_feature_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cumulative_category_feature_associations
    ADD CONSTRAINT cumulative_category_feature_associations_pkey PRIMARY KEY (id);


--
-- Name: descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY descriptions
    ADD CONSTRAINT descriptions_pkey PRIMARY KEY (id);


--
-- Name: electricity_use_10_million_watt_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY electricity_use_10_million_watt_hours
    ADD CONSTRAINT electricity_use_10_million_watt_hours_pkey PRIMARY KEY (gid);


--
-- Name: external_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY external_pictures
    ADD CONSTRAINT external_pictures_pkey PRIMARY KEY (id);


--
-- Name: feature_geo_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY feature_geo_codes
    ADD CONSTRAINT feature_geo_codes_pkey PRIMARY KEY (id);


--
-- Name: feature_name_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY feature_name_relations
    ADD CONSTRAINT feature_name_relations_pkey PRIMARY KEY (id);


--
-- Name: feature_names_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY feature_names
    ADD CONSTRAINT feature_names_pkey PRIMARY KEY (id);


--
-- Name: feature_object_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY category_features
    ADD CONSTRAINT feature_object_types_pkey PRIMARY KEY (id);


--
-- Name: feature_relation_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY feature_relation_types
    ADD CONSTRAINT feature_relation_types_pkey PRIMARY KEY (id);


--
-- Name: feature_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY feature_relations
    ADD CONSTRAINT feature_relations_pkey PRIMARY KEY (id);


--
-- Name: features_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: fontdemo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fontdemo
    ADD CONSTRAINT fontdemo_pkey PRIMARY KEY (gid);


--
-- Name: grain_output_tons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grain_output_tons
    ADD CONSTRAINT grain_output_tons_pkey PRIMARY KEY (gid);


--
-- Name: illustrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY illustrations
    ADD CONSTRAINT illustrations_pkey PRIMARY KEY (id);


--
-- Name: importation_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY importation_tasks
    ADD CONSTRAINT importation_tasks_pkey PRIMARY KEY (id);


--
-- Name: imported_spreadsheets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY imported_spreadsheets
    ADD CONSTRAINT imported_spreadsheets_pkey PRIMARY KEY (id);


--
-- Name: imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: info_sources_code_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY info_sources
    ADD CONSTRAINT info_sources_code_key UNIQUE (code);


--
-- Name: info_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY info_sources
    ADD CONSTRAINT info_sources_pkey PRIMARY KEY (id);


--
-- Name: khrom_empire_garrisons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY khrom_empire_garrisons
    ADD CONSTRAINT khrom_empire_garrisons_pkey PRIMARY KEY (gid);


--
-- Name: landcover_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY landcover
    ADD CONSTRAINT landcover_pkey PRIMARY KEY (gid);


--
-- Name: lhasa_temples_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lhasa_temples
    ADD CONSTRAINT lhasa_temples_pkey PRIMARY KEY (gid);


--
-- Name: note_titles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY note_titles
    ADD CONSTRAINT note_titles_pkey PRIMARY KEY (id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: perspectives_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY perspectives
    ADD CONSTRAINT perspectives_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roman_popular_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roman_popular
    ADD CONSTRAINT roman_popular_pkey PRIMARY KEY (gid);


--
-- Name: roman_scholarly_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roman_scholarly
    ADD CONSTRAINT roman_scholarly_pkey PRIMARY KEY (gid);


--
-- Name: shapes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shapes
    ADD CONSTRAINT shapes_pkey PRIMARY KEY (gid);


--
-- Name: simple_chinese_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY simple_chinese
    ADD CONSTRAINT simple_chinese_pkey PRIMARY KEY (gid);


--
-- Name: simple_props_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY simple_props
    ADD CONSTRAINT simple_props_pkey PRIMARY KEY (id);


--
-- Name: summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY summaries
    ADD CONSTRAINT summaries_pkey PRIMARY KEY (id);


--
-- Name: tibetan_roman_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tibetan_roman
    ADD CONSTRAINT tibetan_roman_pkey PRIMARY KEY (gid);


--
-- Name: time_units_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY time_units
    ADD CONSTRAINT time_units_pkey PRIMARY KEY (id);


--
-- Name: timespans_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY timespans
    ADD CONSTRAINT timespans_pkey PRIMARY KEY (id);


--
-- Name: tlatlong_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tlatlong
    ADD CONSTRAINT tlatlong_pkey PRIMARY KEY (gid);


--
-- Name: traditional_chinese_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY traditional_chinese
    ADD CONSTRAINT traditional_chinese_pkey PRIMARY KEY (gid);


--
-- Name: ulatlong_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ulatlong
    ADD CONSTRAINT ulatlong_pkey PRIMARY KEY (gid);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: web_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web_pages
    ADD CONSTRAINT web_pages_pkey PRIMARY KEY (id);


--
-- Name: xml_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY xml_documents
    ADD CONSTRAINT xml_documents_pkey PRIMARY KEY (id);


--
-- Name: bellezza_geom; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX bellezza_geom ON bellezza USING gist (the_geom);


--
-- Name: by_category_feature; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX by_category_feature ON cumulative_category_feature_associations USING btree (category_id, feature_id);


--
-- Name: citations_1_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX citations_1_idx ON citations USING btree (citable_id, citable_type);


--
-- Name: citations_info_source_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX citations_info_source_id_idx ON citations USING btree (info_source_id);


--
-- Name: feature_name_relations_child_node_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_name_relations_child_node_id_idx ON feature_name_relations USING btree (child_node_id);


--
-- Name: feature_name_relations_parent_node_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_name_relations_parent_node_id_idx ON feature_name_relations USING btree (parent_node_id);


--
-- Name: feature_names_ancestor_ids_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_names_ancestor_ids_idx ON feature_names USING btree (ancestor_ids);


--
-- Name: feature_names_feature_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_names_feature_id_idx ON feature_names USING btree (feature_id);


--
-- Name: feature_names_name_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_names_name_idx ON feature_names USING btree (name);


--
-- Name: feature_object_types_feature_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_object_types_feature_id_idx ON category_features USING btree (feature_id);


--
-- Name: feature_object_types_object_type_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_object_types_object_type_id_idx ON category_features USING btree (category_id);


--
-- Name: feature_object_types_perspective_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_object_types_perspective_id_idx ON category_features USING btree (perspective_id);


--
-- Name: feature_relations_ancestor_ids_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_relations_ancestor_ids_idx ON feature_relations USING btree (ancestor_ids);


--
-- Name: feature_relations_child_node_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_relations_child_node_id_idx ON feature_relations USING btree (child_node_id);


--
-- Name: feature_relations_parent_node_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_relations_parent_node_id_idx ON feature_relations USING btree (parent_node_id);


--
-- Name: feature_relations_perspective_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_relations_perspective_id_idx ON feature_relations USING btree (perspective_id);


--
-- Name: feature_relations_role_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX feature_relations_role_idx ON feature_relations USING btree (role);


--
-- Name: features_ancestor_ids_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX features_ancestor_ids_idx ON features USING btree (ancestor_ids);


--
-- Name: features_fid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX features_fid ON features USING btree (fid);


--
-- Name: features_geometry_gist; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX features_geometry_gist ON shapes USING gist (geometry);


--
-- Name: features_is_public_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX features_is_public_idx ON features USING btree (is_public);


--
-- Name: index_cached_category_counts_on_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_cached_category_counts_on_category_id ON cached_category_counts USING btree (category_id);


--
-- Name: index_cached_feature_names_on_feature_id_and_view_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_cached_feature_names_on_feature_id_and_view_id ON cached_feature_names USING btree (feature_id, view_id);


--
-- Name: index_people_on_fullname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_people_on_fullname ON people USING btree (fullname);


--
-- Name: index_permissions_on_title; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_permissions_on_title ON permissions USING btree (title);


--
-- Name: index_permissions_roles_on_permission_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_permissions_roles_on_permission_id_and_role_id ON permissions_roles USING btree (permission_id, role_id);


--
-- Name: index_perspectives_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_perspectives_on_code ON perspectives USING btree (code);


--
-- Name: index_roles_on_title; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_roles_on_title ON roles USING btree (title);


--
-- Name: index_roles_users_on_role_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_roles_users_on_role_id_and_user_id ON roles_users USING btree (role_id, user_id);


--
-- Name: landcover_geom; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX landcover_geom ON landcover USING gist (the_geom);


--
-- Name: roman_popular_fid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX roman_popular_fid ON roman_popular USING btree (fid);


--
-- Name: roman_popular_gist; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX roman_popular_gist ON roman_popular USING gist (geometry);


--
-- Name: roman_popular_language; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX roman_popular_language ON roman_popular USING btree (language);


--
-- Name: roman_popular_object_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX roman_popular_object_type ON roman_popular USING btree (object_type);


--
-- Name: roman_scholarly_fid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX roman_scholarly_fid ON roman_scholarly USING btree (fid);


--
-- Name: roman_scholarly_gist; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX roman_scholarly_gist ON roman_scholarly USING gist (geometry);


--
-- Name: roman_scholarly_language; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX roman_scholarly_language ON roman_scholarly USING btree (language);


--
-- Name: roman_scholarly_object_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX roman_scholarly_object_type ON roman_scholarly USING btree (object_type);


--
-- Name: shapes_fid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX shapes_fid ON shapes USING btree (fid);


--
-- Name: shapes_geotype; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX shapes_geotype ON shapes USING btree (geometrytype(geometry));


--
-- Name: simple_chinese_fid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX simple_chinese_fid ON simple_chinese USING btree (fid);


--
-- Name: simple_chinese_gist; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX simple_chinese_gist ON simple_chinese USING gist (geometry);


--
-- Name: simple_chinese_language; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX simple_chinese_language ON simple_chinese USING btree (language);


--
-- Name: simple_chinese_object_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX simple_chinese_object_type ON simple_chinese USING btree (object_type);


--
-- Name: simple_props_code_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX simple_props_code_idx ON simple_props USING btree (code);


--
-- Name: simple_props_type_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX simple_props_type_idx ON simple_props USING btree (type);


--
-- Name: test2_fid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX test2_fid ON test2 USING btree (fid);


--
-- Name: test2_gist; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX test2_gist ON test2 USING gist (geometry);


--
-- Name: test2_language; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX test2_language ON test2 USING btree (language);


--
-- Name: test2_object_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX test2_object_type ON test2 USING btree (object_type);


--
-- Name: tibetan_roman_language; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX tibetan_roman_language ON tibetan_roman USING btree (language);


--
-- Name: tibetan_roman_object_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX tibetan_roman_object_type ON tibetan_roman USING btree (object_type);


--
-- Name: timespans_1_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX timespans_1_idx ON timespans USING btree (dateable_id, dateable_type);


--
-- Name: timespans_end_date_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX timespans_end_date_idx ON timespans USING btree (end_date);


--
-- Name: timespans_start_date_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX timespans_start_date_idx ON timespans USING btree (start_date);


--
-- Name: traditional_chinese_fid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX traditional_chinese_fid ON traditional_chinese USING btree (fid);


--
-- Name: traditional_chinese_gist; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX traditional_chinese_gist ON traditional_chinese USING gist (geometry);


--
-- Name: traditional_chinese_language; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX traditional_chinese_language ON traditional_chinese USING btree (language);


--
-- Name: traditional_chinese_object_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX traditional_chinese_object_type ON traditional_chinese USING btree (object_type);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: xml_documents_feature_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX xml_documents_feature_id_idx ON xml_documents USING btree (feature_id);


--
-- Name: shapetrig; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER shapetrig BEFORE INSERT ON shapes FOR EACH ROW EXECUTE PROCEDURE shapetrig();


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public, topology;

INSERT INTO schema_migrations (version) VALUES ('1');

INSERT INTO schema_migrations (version) VALUES ('10');

INSERT INTO schema_migrations (version) VALUES ('11');

INSERT INTO schema_migrations (version) VALUES ('12');

INSERT INTO schema_migrations (version) VALUES ('13');

INSERT INTO schema_migrations (version) VALUES ('14');

INSERT INTO schema_migrations (version) VALUES ('15');

INSERT INTO schema_migrations (version) VALUES ('16');

INSERT INTO schema_migrations (version) VALUES ('2');

INSERT INTO schema_migrations (version) VALUES ('20081205024814');

INSERT INTO schema_migrations (version) VALUES ('20090131020152');

INSERT INTO schema_migrations (version) VALUES ('20090205174900');

INSERT INTO schema_migrations (version) VALUES ('20090419180020');

INSERT INTO schema_migrations (version) VALUES ('20090419183932');

INSERT INTO schema_migrations (version) VALUES ('20090421231344');

INSERT INTO schema_migrations (version) VALUES ('20090421232230');

INSERT INTO schema_migrations (version) VALUES ('20090423141755');

INSERT INTO schema_migrations (version) VALUES ('20090506231723');

INSERT INTO schema_migrations (version) VALUES ('20090506233711');

INSERT INTO schema_migrations (version) VALUES ('20090531042318');

INSERT INTO schema_migrations (version) VALUES ('20090714190122');

INSERT INTO schema_migrations (version) VALUES ('20090721230723');

INSERT INTO schema_migrations (version) VALUES ('20090812002650');

INSERT INTO schema_migrations (version) VALUES ('20091026154943');

INSERT INTO schema_migrations (version) VALUES ('20091028161439');

INSERT INTO schema_migrations (version) VALUES ('20091102172224');

INSERT INTO schema_migrations (version) VALUES ('20091102183422');

INSERT INTO schema_migrations (version) VALUES ('20091102185045');

INSERT INTO schema_migrations (version) VALUES ('20091106180440');

INSERT INTO schema_migrations (version) VALUES ('20091110192155');

INSERT INTO schema_migrations (version) VALUES ('20100201224350');

INSERT INTO schema_migrations (version) VALUES ('20100305012701');

INSERT INTO schema_migrations (version) VALUES ('20100305012837');

INSERT INTO schema_migrations (version) VALUES ('20100305012933');

INSERT INTO schema_migrations (version) VALUES ('20100315223628');

INSERT INTO schema_migrations (version) VALUES ('20100329230430');

INSERT INTO schema_migrations (version) VALUES ('20100329230650');

INSERT INTO schema_migrations (version) VALUES ('20100330225822');

INSERT INTO schema_migrations (version) VALUES ('20100405205610');

INSERT INTO schema_migrations (version) VALUES ('20100414163429');

INSERT INTO schema_migrations (version) VALUES ('20100415154122');

INSERT INTO schema_migrations (version) VALUES ('20100427233105');

INSERT INTO schema_migrations (version) VALUES ('20100427233413');

INSERT INTO schema_migrations (version) VALUES ('20100428004110');

INSERT INTO schema_migrations (version) VALUES ('20100428184445');

INSERT INTO schema_migrations (version) VALUES ('20100429003439');

INSERT INTO schema_migrations (version) VALUES ('20100521170006');

INSERT INTO schema_migrations (version) VALUES ('20100525173430');

INSERT INTO schema_migrations (version) VALUES ('20100525230844');

INSERT INTO schema_migrations (version) VALUES ('20100526225124');

INSERT INTO schema_migrations (version) VALUES ('20100526225546');

INSERT INTO schema_migrations (version) VALUES ('20100602170131');

INSERT INTO schema_migrations (version) VALUES ('20100609203100');

INSERT INTO schema_migrations (version) VALUES ('20100623234636');

INSERT INTO schema_migrations (version) VALUES ('20100810160957');

INSERT INTO schema_migrations (version) VALUES ('20100812214612');

INSERT INTO schema_migrations (version) VALUES ('20101007200406');

INSERT INTO schema_migrations (version) VALUES ('20110217172044');

INSERT INTO schema_migrations (version) VALUES ('20110628205752');

INSERT INTO schema_migrations (version) VALUES ('20110629163847');

INSERT INTO schema_migrations (version) VALUES ('20110923232332');

INSERT INTO schema_migrations (version) VALUES ('20111124195857');

INSERT INTO schema_migrations (version) VALUES ('20130709224661');

INSERT INTO schema_migrations (version) VALUES ('20130709224662');

INSERT INTO schema_migrations (version) VALUES ('20130815172801');

INSERT INTO schema_migrations (version) VALUES ('20130815172802');

INSERT INTO schema_migrations (version) VALUES ('20130815184610');

INSERT INTO schema_migrations (version) VALUES ('20130819194652');

INSERT INTO schema_migrations (version) VALUES ('20130819194653');

INSERT INTO schema_migrations (version) VALUES ('20130926064841');

INSERT INTO schema_migrations (version) VALUES ('20130926064842');

INSERT INTO schema_migrations (version) VALUES ('20131014181443');

INSERT INTO schema_migrations (version) VALUES ('20131023052437');

INSERT INTO schema_migrations (version) VALUES ('20140723222058');

INSERT INTO schema_migrations (version) VALUES ('20140816062774');

INSERT INTO schema_migrations (version) VALUES ('26');

INSERT INTO schema_migrations (version) VALUES ('27');

INSERT INTO schema_migrations (version) VALUES ('28');

INSERT INTO schema_migrations (version) VALUES ('29');

INSERT INTO schema_migrations (version) VALUES ('3');

INSERT INTO schema_migrations (version) VALUES ('30');

INSERT INTO schema_migrations (version) VALUES ('4');

INSERT INTO schema_migrations (version) VALUES ('5');

INSERT INTO schema_migrations (version) VALUES ('6');

INSERT INTO schema_migrations (version) VALUES ('7');

INSERT INTO schema_migrations (version) VALUES ('8');

INSERT INTO schema_migrations (version) VALUES ('9');
