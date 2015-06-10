--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: box2d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d;


--
-- Name: st_box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_in(cstring) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_in';


--
-- Name: st_box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_out(box2d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_out';


--
-- Name: box2d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d (
    INTERNALLENGTH = 16,
    INPUT = st_box2d_in,
    OUTPUT = st_box2d_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- Name: box3d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d;


--
-- Name: st_box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_in(cstring) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_in';


--
-- Name: st_box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_out(box3d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_out';


--
-- Name: box3d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d (
    INTERNALLENGTH = 48,
    INPUT = st_box3d_in,
    OUTPUT = st_box3d_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: box3d_extent; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent;


--
-- Name: box3d_extent_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_in(cstring) RETURNS box3d_extent
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_in';


--
-- Name: box3d_extent_out(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_out(box3d_extent) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_extent_out';


--
-- Name: box3d_extent; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent (
    INTERNALLENGTH = 48,
    INPUT = box3d_extent_in,
    OUTPUT = box3d_extent_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: chip; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE chip;


--
-- Name: st_chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_in(cstring) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_in';


--
-- Name: st_chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_out(chip) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_out';


--
-- Name: chip; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE chip (
    INTERNALLENGTH = variable,
    INPUT = st_chip_in,
    OUTPUT = st_chip_out,
    ALIGNMENT = double,
    STORAGE = extended
);


--
-- Name: geometry; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry;


--
-- Name: st_geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_analyze';


--
-- Name: st_geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_in(cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_in';


--
-- Name: st_geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_out(geometry) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_out';


--
-- Name: st_geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_recv(internal) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_recv';


--
-- Name: st_geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_send(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_send';


--
-- Name: geometry; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry (
    INTERNALLENGTH = variable,
    INPUT = st_geometry_in,
    OUTPUT = st_geometry_out,
    RECEIVE = st_geometry_recv,
    SEND = st_geometry_send,
    ANALYZE = st_geometry_analyze,
    DELIMITER = ':',
    ALIGNMENT = int4,
    STORAGE = main
);


--
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry_dump AS (
	path integer[],
	geom geometry
);


--
-- Name: pgis_abs; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs;


--
-- Name: pgis_abs_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_in(cstring) RETURNS pgis_abs
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_abs_in';


--
-- Name: pgis_abs_out(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_out(pgis_abs) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_abs_out';


--
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs (
    INTERNALLENGTH = 8,
    INPUT = pgis_abs_in,
    OUTPUT = pgis_abs_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: spheroid; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid;


--
-- Name: st_spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_in(cstring) RETURNS spheroid
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_in';


--
-- Name: st_spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_out(spheroid) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_out';


--
-- Name: spheroid; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid (
    INTERNALLENGTH = 65,
    INPUT = st_spheroid_in,
    OUTPUT = st_spheroid_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: _st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgeojson(integer, geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asGeoJson';


--
-- Name: _st_asgml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'LWGEOM_asGML';


--
-- Name: _st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asGML';


--
-- Name: _st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_askml(integer, geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asKML';


--
-- Name: _st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_contains(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'contains';


--
-- Name: _st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_containsproperly(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'containsproperly';


--
-- Name: _st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_coveredby(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'coveredby';


--
-- Name: _st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_covers(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'covers';


--
-- Name: _st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_crosses(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'crosses';


--
-- Name: _st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dwithin(geometry, geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dwithin';


--
-- Name: _st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_intersects(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'intersects';


--
-- Name: _st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_linecrossingdirection(geometry, geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_LineCrossingDirection';


--
-- Name: _st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_overlaps(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'overlaps';


--
-- Name: _st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_touches(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'touches';


--
-- Name: _st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_within(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'within';


--
-- Name: addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addBBOX';


--
-- Name: addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


--
-- Name: addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


--
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


--
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_affine';


--
-- Name: area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


--
-- Name: area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


--
-- Name: asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


--
-- Name: asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


--
-- Name: asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


--
-- Name: asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


--
-- Name: asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkt(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asEWKT';


--
-- Name: asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- Name: asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- Name: ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


--
-- Name: ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


--
-- Name: askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), 15)$_$;


--
-- Name: askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), $2)$_$;


--
-- Name: askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, transform($2,4326), $3)$_$;


--
-- Name: askml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT AsUKML(transform($1,4326),$2,$3)$_$;


--
-- Name: assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION astext(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asText';


--
-- Name: asukml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asukml(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'LWGEOM_asKML';


--
-- Name: asukml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asukml(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'LWGEOM_asKML';


--
-- Name: asukml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asukml(geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'LWGEOM_asKML';


--
-- Name: azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION azimuth(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_azimuth';


--
-- Name: boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION boundary(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'boundary';


--
-- Name: box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(box3d) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX';


--
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(geometry) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX';


--
-- Name: box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(box3d) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


--
-- Name: box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


--
-- Name: box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_contain(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_contain';


--
-- Name: box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_contained(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_contained';


--
-- Name: box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_in(cstring) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_in';


--
-- Name: box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_intersects(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_intersects';


--
-- Name: box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_left(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_left';


--
-- Name: box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_out(box2d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_out';


--
-- Name: box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overlap(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_overlap';


--
-- Name: box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overleft(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_overleft';


--
-- Name: box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overright(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_overright';


--
-- Name: box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_right(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_right';


--
-- Name: box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_same(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_same';


--
-- Name: box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(box2d) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_BOX3D';


--
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX3D';


--
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_in';


--
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_out';


--
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT box($1)$_$;


--
-- Name: buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'buffer';


--
-- Name: buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'buffer';


--
-- Name: buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buildarea(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_buildarea';


--
-- Name: bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bytea(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_bytea';


--
-- Name: cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cache_bbox() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'cache_bbox';


--
-- Name: centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION centroid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'centroid';


--
-- Name: checkauth(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text) RETURNS integer
    LANGUAGE sql
    AS $_$ SELECT CheckAuth('', $1, $2) $_$;


--
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauthtrigger() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'check_authorization';


--
-- Name: chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_in(cstring) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_in';


--
-- Name: chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_out(chip) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_out';


--
-- Name: collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collect(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_collect';


--
-- Name: collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collect_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_collect_garray';


--
-- Name: collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collector(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_collect';


--
-- Name: combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box2d, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_combine';


--
-- Name: combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


--
-- Name: combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


--
-- Name: compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION compression(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getCompression';


--
-- Name: contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION contains(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'contains';


--
-- Name: convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION convexhull(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'convexhull';


--
-- Name: crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosses(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'crosses';


--
-- Name: datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION datatype(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getDatatype';


--
-- Name: difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION difference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'difference';


--
-- Name: dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dimension(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dimension';


--
-- Name: disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disjoint(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'disjoint';


--
-- Name: distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_mindistance2d';


--
-- Name: distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance_sphere(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_sphere';


--
-- Name: dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dropBBOX';


--
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('','',$1) $_$;


--
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying, character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('',$1,$2) $_$;


--
-- Name: dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dump(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'LWGEOM_dump';


--
-- Name: dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dumprings(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump_rings';


--
-- Name: endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION endpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_endpoint_linestring';


--
-- Name: envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION envelope(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_envelope';


--
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION equals(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomequals';


--
-- Name: estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


--
-- Name: estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


--
-- Name: expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box2d, double precision) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_expand';


--
-- Name: expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box3d, double precision) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_expand';


--
-- Name: expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_expand';


--
-- Name: exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION exteriorring(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_exteriorring_polygon';


--
-- Name: factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION factor(chip) RETURNS real
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getFactor';


--
-- Name: force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_2d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_2d';


--
-- Name: force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


--
-- Name: force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dm(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dm';


--
-- Name: force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dz(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


--
-- Name: force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_4d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_4d';


--
-- Name: force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_collection(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_collection';


--
-- Name: forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION forcerhr(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_forceRHR_poly';


--
-- Name: geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geom_accum(geometry[], geometry) RETURNS geometry[]
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_accum';


--
-- Name: geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_bytea';


--
-- Name: geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box2d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_LWGEOM';


--
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


--
-- Name: geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(chip) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_to_LWGEOM';


--
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


--
-- Name: geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_above(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_above';


--
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_analyze';


--
-- Name: geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_below(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_below';


--
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_cmp(geometry, geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_cmp';


--
-- Name: geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contain(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contain';


--
-- Name: geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contained(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contained';


--
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_eq(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_eq';


--
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_ge(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_ge';


--
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_gt';


--
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_in';


--
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_le(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_le';


--
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_left(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_left';


--
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_lt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_lt';


--
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_out';


--
-- Name: geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overabove(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overabove';


--
-- Name: geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overbelow(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overbelow';


--
-- Name: geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overlap(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overlap';


--
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overleft(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overleft';


--
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overright(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overright';


--
-- Name: geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_recv(internal) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_recv';


--
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_right(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_right';


--
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_same(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_same';


--
-- Name: geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_send(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_send';


--
-- Name: geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_geometryn_collection';


--
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getTYPE';


--
-- Name: geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOMFromWKB';


--
-- Name: geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


--
-- Name: geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geometryfromtext($1)$_$;


--
-- Name: geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geometryfromtext($1, $2)$_$;


--
-- Name: geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_WKB';


--
-- Name: geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT setSRID(GeomFromWKB($1), $2)$_$;


--
-- Name: geomunion(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomunion(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomunion';


--
-- Name: geosnoop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geosnoop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'GEOSnoop';


--
-- Name: getbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getbbox(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


--
-- Name: getsrid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getsrid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getSRID';


--
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gettransactionid() RETURNS xid
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'getTransactionID';


--
-- Name: hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hasbbox(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasBBOX';


--
-- Name: height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION height(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getHeight';


--
-- Name: interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION interiorringn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_interiorringn_polygon';


--
-- Name: intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersection(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'intersection';


--
-- Name: intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersects(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'intersects';


--
-- Name: isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isclosed(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isclosed_linestring';


--
-- Name: isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isempty(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isempty';


--
-- Name: isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isring(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'isring';


--
-- Name: issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issimple(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'issimple';


--
-- Name: isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isvalid(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'isvalid';


--
-- Name: length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_linestring';


--
-- Name: length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_linestring';


--
-- Name: length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_linestring';


--
-- Name: length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


--
-- Name: length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


--
-- Name: line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_interpolate_point(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_interpolate_point';


--
-- Name: line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_locate_point(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_locate_point';


--
-- Name: line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_substring(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_substring';


--
-- Name: linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefrommultipoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_from_mpoint';


--
-- Name: linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linemerge(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'linemerge';


--
-- Name: linestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1)$_$;


--
-- Name: linestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1, $2)$_$;


--
-- Name: linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_along_measure(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- Name: locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_locate_between_m';


--
-- Name: lockrow(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00'); $_$;


--
-- Name: lockrow(text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00'); $_$;


--
-- Name: lockrow(text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, timestamp without time zone) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, $4); $_$;


--
-- Name: lwgeom_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_compress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_compress';


--
-- Name: lwgeom_gist_consistent(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_consistent(internal, geometry, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_consistent';


--
-- Name: lwgeom_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_decompress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_decompress';


--
-- Name: lwgeom_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_penalty';


--
-- Name: lwgeom_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_picksplit(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_picksplit';


--
-- Name: lwgeom_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_same(box2d, box2d, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_same';


--
-- Name: lwgeom_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_union(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_union';


--
-- Name: m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_m_point';


--
-- Name: makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox2d(geometry, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_construct';


--
-- Name: makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox3d(geometry, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_construct';


--
-- Name: makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline';


--
-- Name: makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline_garray';


--
-- Name: makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepointm(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint3dm';


--
-- Name: makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


--
-- Name: makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry, geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


--
-- Name: max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION max_distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_maxdistance2d_linestring';


--
-- Name: mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mem_size(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_mem_size';


--
-- Name: mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multi(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_multi';


--
-- Name: multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: multilinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


--
-- Name: multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;


--
-- Name: multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;


--
-- Name: multipointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1, $2)$_$;


--
-- Name: multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;


--
-- Name: multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;


--
-- Name: ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ndims(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_ndims';


--
-- Name: noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION noop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_noop';


--
-- Name: npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION npoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_npoints';


--
-- Name: nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_nrings';


--
-- Name: numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numgeometries(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numgeometries_collection';


--
-- Name: numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorring(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


--
-- Name: numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


--
-- Name: numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numpoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numpoints_linestring';


--
-- Name: overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "overlaps"(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'overlaps';


--
-- Name: perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter_poly';


--
-- Name: perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter2d_poly';


--
-- Name: perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter_poly';


--
-- Name: pgis_geometry_accum_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_finalfn(pgis_abs) RETURNS geometry[]
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_accum_finalfn';


--
-- Name: pgis_geometry_accum_transfn(pgis_abs, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_transfn(pgis_abs, geometry) RETURNS pgis_abs
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_accum_transfn';


--
-- Name: pgis_geometry_collect_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_collect_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_collect_finalfn';


--
-- Name: pgis_geometry_makeline_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_makeline_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_makeline_finalfn';


--
-- Name: pgis_geometry_polygonize_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_polygonize_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_polygonize_finalfn';


--
-- Name: pgis_geometry_union_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_union_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_union_finalfn';


--
-- Name: point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_inside_circle_point';


--
-- Name: pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_pointn_linestring';


--
-- Name: pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointonsurface(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pointonsurface';


--
-- Name: polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1)$_$;


--
-- Name: polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;


--
-- Name: polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonize_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'polygonize_garray';


--
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_geos_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_geos_version';


--
-- Name: postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_joinsel';


--
-- Name: postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_sel';


--
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_build_date() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_lib_build_date';


--
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_lib_version';


--
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_proj_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_proj_version';


--
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_build_date() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '2010-03-11 19:13:40'::text AS version$$;


--
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '1.4.2'::text AS version$$;


--
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_scripts_released';


--
-- Name: postgis_uses_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_uses_stats() RETURNS boolean
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_uses_stats';


--
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_version';


--
-- Name: relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_full';


--
-- Name: relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_pattern';


--
-- Name: removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION removepoint(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_removepoint';


--
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rename_geometry_table_constraints() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$;


--
-- Name: reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION reverse(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_reverse';


--
-- Name: rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotate(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT rotateZ($1, $2)$_$;


--
-- Name: rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatex(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


--
-- Name: rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatey(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


--
-- Name: rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatez(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


--
-- Name: scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT scale($1, $2, $3, 1)$_$;


--
-- Name: scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


--
-- Name: se_envelopesintersect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_envelopesintersect(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 && $2
	$_$;


--
-- Name: se_is3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_is3d(geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT CASE ST_zmflag($1)
	       WHEN 0 THEN false
	       WHEN 1 THEN false
	       WHEN 2 THEN true
	       WHEN 3 THEN true
	       ELSE false
	   END
	$_$;


--
-- Name: se_ismeasured(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_ismeasured(geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT CASE ST_zmflag($1)
	       WHEN 0 THEN false
	       WHEN 1 THEN true
	       WHEN 2 THEN false
	       WHEN 3 THEN true
	       ELSE false
	   END
	$_$;


--
-- Name: se_locatealong(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatealong(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- Name: se_locatebetween(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatebetween(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_locate_between_m';


--
-- Name: se_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_m_point';


--
-- Name: se_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_z_point';


--
-- Name: segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION segmentize(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_segmentize2d';


--
-- Name: setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setfactor(chip, real) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_setFactor';


--
-- Name: setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setpoint(geometry, integer, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setpoint_linestring';


--
-- Name: setsrid(chip, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(chip, integer) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_setSRID';


--
-- Name: setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setSRID';


--
-- Name: shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION shift_longitude(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_longitude_shift';


--
-- Name: simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION simplify(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_simplify2d';


--
-- Name: snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $2)$_$;


--
-- Name: snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $3)$_$;


--
-- Name: snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid';


--
-- Name: snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid_pointoff';


--
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_in';


--
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_out';


--
-- Name: srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getSRID';


--
-- Name: srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getSRID';


--
-- Name: st_addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addBBOX';


--
-- Name: st_addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


--
-- Name: st_addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


--
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


--
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_affine';


--
-- Name: st_area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


--
-- Name: st_area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


--
-- Name: st_asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


--
-- Name: st_asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


--
-- Name: st_asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


--
-- Name: st_asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


--
-- Name: st_asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkt(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asEWKT';


--
-- Name: st_asgeojson(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$;


--
-- Name: st_asgeojson(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$;


--
-- Name: st_asgeojson(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$;


--
-- Name: st_asgeojson(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$;


--
-- Name: st_asgeojson(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, $3)$_$;


--
-- Name: st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, $4)$_$;


--
-- Name: st_asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- Name: st_asgml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$;


--
-- Name: st_asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- Name: st_asgml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$;


--
-- Name: st_asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3)$_$;


--
-- Name: st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$;


--
-- Name: st_ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


--
-- Name: st_ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


--
-- Name: st_askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), 15)$_$;


--
-- Name: st_askml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), 15)$_$;


--
-- Name: st_askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), $2)$_$;


--
-- Name: st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), $3)$_$;


--
-- Name: st_askml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT AsUKML(transform($1,4326),$2,$3)$_$;


--
-- Name: st_assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: st_assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: st_assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: st_astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asText';


--
-- Name: st_asukml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asukml(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'LWGEOM_asKML';


--
-- Name: st_asukml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asukml(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'LWGEOM_asKML';


--
-- Name: st_asukml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asukml(geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'LWGEOM_asKML';


--
-- Name: st_azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_azimuth(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_azimuth';


--
-- Name: st_boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_boundary(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'boundary';


--
-- Name: st_box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(box3d) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX';


--
-- Name: st_box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(geometry) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX';


--
-- Name: st_box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


--
-- Name: st_box2d(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d_extent) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


--
-- Name: st_box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


--
-- Name: st_box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_contain(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_contain';


--
-- Name: st_box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_contained(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_contained';


--
-- Name: st_box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_intersects(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_intersects';


--
-- Name: st_box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_left(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_left';


--
-- Name: st_box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overlap(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_overlap';


--
-- Name: st_box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overleft(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_overleft';


--
-- Name: st_box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overright(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_overright';


--
-- Name: st_box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_right(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_right';


--
-- Name: st_box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_same(box2d, box2d) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2D_same';


--
-- Name: st_box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(box2d) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_BOX3D';


--
-- Name: st_box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX3D';


--
-- Name: st_box3d_extent(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_extent(box3d_extent) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_extent_to_BOX3D';


--
-- Name: st_buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'buffer';


--
-- Name: st_buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'buffer';


--
-- Name: st_buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buildarea(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_buildarea';


--
-- Name: st_bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bytea(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_bytea';


--
-- Name: st_cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_cache_bbox() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'cache_bbox';


--
-- Name: st_centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_centroid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'centroid';


--
-- Name: st_collect(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_collect_garray';


--
-- Name: st_collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_collect';


--
-- Name: st_collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_collect_garray';


--
-- Name: st_collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collector(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_collect';


--
-- Name: st_combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box2d, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_combine';


--
-- Name: st_combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


--
-- Name: st_combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


--
-- Name: st_compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_compression(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getCompression';


--
-- Name: st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_contains(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$;


--
-- Name: st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_containsproperly(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_ContainsProperly($1,$2)$_$;


--
-- Name: st_convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_convexhull(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'convexhull';


--
-- Name: st_coorddim(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coorddim(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_ndims';


--
-- Name: st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$;


--
-- Name: st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$;


--
-- Name: st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_crosses(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$;


--
-- Name: st_curvetoline(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_CurveToLine($1, 32)$_$;


--
-- Name: st_curvetoline(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_curve_segmentize';


--
-- Name: st_datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_datatype(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getDatatype';


--
-- Name: st_difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_difference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'difference';


--
-- Name: st_dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dimension(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dimension';


--
-- Name: st_disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_disjoint(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'disjoint';


--
-- Name: st_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_mindistance2d';


--
-- Name: st_distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_sphere(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_sphere';


--
-- Name: st_dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dropbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dropBBOX';


--
-- Name: st_dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dump(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump';


--
-- Name: st_dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dumprings(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump_rings';


--
-- Name: st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geometry, geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3)$_$;


--
-- Name: st_endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_endpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_endpoint_linestring';


--
-- Name: st_envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_envelope(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_envelope';


--
-- Name: st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_equals(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomequals';


--
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


--
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


--
-- Name: st_expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box2d, double precision) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_expand';


--
-- Name: st_expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box3d, double precision) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_expand';


--
-- Name: st_expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_expand';


--
-- Name: st_exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_exteriorring(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_exteriorring_polygon';


--
-- Name: st_factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_factor(chip) RETURNS real
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getFactor';


--
-- Name: st_force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_2d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_2d';


--
-- Name: st_force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


--
-- Name: st_force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dm(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dm';


--
-- Name: st_force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dz(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


--
-- Name: st_force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_4d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_4d';


--
-- Name: st_force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_collection(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_collection';


--
-- Name: st_forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_forcerhr(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_forceRHR_poly';


--
-- Name: st_geohash(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_GeoHash($1, 0)$_$;


--
-- Name: st_geohash(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_GeoHash';


--
-- Name: st_geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geom_accum(geometry[], geometry) RETURNS geometry[]
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_accum';


--
-- Name: st_geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: st_geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_bytea';


--
-- Name: st_geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box2d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_LWGEOM';


--
-- Name: st_geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


--
-- Name: st_geometry(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d_extent) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


--
-- Name: st_geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(chip) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_to_LWGEOM';


--
-- Name: st_geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


--
-- Name: st_geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_above(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_above';


--
-- Name: st_geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_below(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_below';


--
-- Name: st_geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_cmp(geometry, geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_cmp';


--
-- Name: st_geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contain(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contain';


--
-- Name: st_geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contained(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contained';


--
-- Name: st_geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_eq(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_eq';


--
-- Name: st_geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_ge(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_ge';


--
-- Name: st_geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_gt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_gt';


--
-- Name: st_geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_le(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_le';


--
-- Name: st_geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_left(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_left';


--
-- Name: st_geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_lt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_lt';


--
-- Name: st_geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overabove(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overabove';


--
-- Name: st_geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overbelow(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overbelow';


--
-- Name: st_geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overlap(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overlap';


--
-- Name: st_geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overleft(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overleft';


--
-- Name: st_geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overright(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overright';


--
-- Name: st_geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_right(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_right';


--
-- Name: st_geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_same(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_same';


--
-- Name: st_geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_geometryn_collection';


--
-- Name: st_geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometrytype(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geometry_geometrytype';


--
-- Name: st_geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOMFromWKB';


--
-- Name: st_geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


--
-- Name: st_geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_WKB';


--
-- Name: st_geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$;


--
-- Name: st_hasarc(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasarc(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_has_arc';


--
-- Name: st_hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasbbox(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasBBOX';


--
-- Name: st_height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_height(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getHeight';


--
-- Name: st_interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_interiorringn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_interiorringn_polygon';


--
-- Name: st_intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'intersection';


--
-- Name: st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$;


--
-- Name: st_isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isclosed(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isclosed_linestring';


--
-- Name: st_isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isempty(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isempty';


--
-- Name: st_isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isring(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'isring';


--
-- Name: st_issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_issimple(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'issimple';


--
-- Name: st_isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalid(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'isvalid';


--
-- Name: st_isvalidreason(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalidreason(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'isvalidreason';


--
-- Name: st_length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_linestring';


--
-- Name: st_length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_linestring';


--
-- Name: st_length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_linestring';


--
-- Name: st_length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


--
-- Name: st_length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


--
-- Name: st_line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_interpolate_point(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_interpolate_point';


--
-- Name: st_line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_locate_point(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_locate_point';


--
-- Name: st_line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_substring(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_substring';


--
-- Name: st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linecrossingdirection(geometry, geometry) RETURNS integer
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT CASE WHEN NOT $1 && $2 THEN 0 ELSE _ST_LineCrossingDirection($1,$2) END $_$;


--
-- Name: st_linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefrommultipoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_from_mpoint';


--
-- Name: st_linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'LINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: st_linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linemerge(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'linemerge';


--
-- Name: st_linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_linetocurve(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linetocurve(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_desegmentize';


--
-- Name: st_locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_along_measure(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- Name: st_locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_locate_between_m';


--
-- Name: st_locatebetweenelevations(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locatebetweenelevations(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_LocateBetweenElevations';


--
-- Name: st_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_m_point';


--
-- Name: st_makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox2d(geometry, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_construct';


--
-- Name: st_makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox3d(geometry, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_construct';


--
-- Name: st_makeline(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline_garray';


--
-- Name: st_makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline';


--
-- Name: st_makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline_garray';


--
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: st_makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepointm(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint3dm';


--
-- Name: st_makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


--
-- Name: st_makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry, geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


--
-- Name: st_max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_max_distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_maxdistance2d_linestring';


--
-- Name: st_mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mem_size(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_mem_size';


--
-- Name: st_minimumboundingcircle(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MinimumBoundingCircle($1, 48)$_$;


--
-- Name: st_mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: st_mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN GeomFromText($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: st_mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multi(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_multi';


--
-- Name: st_multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


--
-- Name: st_multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;


--
-- Name: st_multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;


--
-- Name: st_multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;


--
-- Name: st_multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;


--
-- Name: st_ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ndims(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_ndims';


--
-- Name: st_noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_noop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_noop';


--
-- Name: st_npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_npoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_npoints';


--
-- Name: st_nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_nrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_nrings';


--
-- Name: st_numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numgeometries(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numgeometries_collection';


--
-- Name: st_numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorring(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


--
-- Name: st_numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


--
-- Name: st_numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numpoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numpoints_linestring';


--
-- Name: st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_orderingequals(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 && $2 AND $1 ~= $2
	$_$;


--
-- Name: st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_overlaps(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$;


--
-- Name: st_perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter2d_poly';


--
-- Name: st_perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter2d_poly';


--
-- Name: st_perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter_poly';


--
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: st_point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_inside_circle_point';


--
-- Name: st_pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_pointn_linestring';


--
-- Name: st_pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointonsurface(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pointonsurface';


--
-- Name: st_polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POLYGON'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_polygon(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygon(geometry, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT setSRID(makepolygon($1), $2)
	$_$;


--
-- Name: st_polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_PolyFromText($1)$_$;


--
-- Name: st_polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;


--
-- Name: st_polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_polygonize(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'polygonize_garray';


--
-- Name: st_polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'polygonize_garray';


--
-- Name: st_postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_joinsel';


--
-- Name: st_postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_sel';


--
-- Name: st_relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_full';


--
-- Name: st_relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_pattern';


--
-- Name: st_removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_removepoint(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_removepoint';


--
-- Name: st_reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_reverse(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_reverse';


--
-- Name: st_rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotate(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT rotateZ($1, $2)$_$;


--
-- Name: st_rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatex(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


--
-- Name: st_rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatey(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


--
-- Name: st_rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatez(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


--
-- Name: st_scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT scale($1, $2, $3, 1)$_$;


--
-- Name: st_scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


--
-- Name: st_segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_segmentize(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_segmentize2d';


--
-- Name: st_setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setfactor(chip, real) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_setFactor';


--
-- Name: st_setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setpoint(geometry, integer, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setpoint_linestring';


--
-- Name: st_setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setsrid(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setSRID';


--
-- Name: st_shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_shift_longitude(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_longitude_shift';


--
-- Name: st_simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplify(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_simplify2d';


--
-- Name: st_simplifypreservetopology(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplifypreservetopology(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'topologypreservesimplify';


--
-- Name: st_snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$;


--
-- Name: st_snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$;


--
-- Name: st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid';


--
-- Name: st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid_pointoff';


--
-- Name: st_srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getSRID';


--
-- Name: st_srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getSRID';


--
-- Name: st_startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_startpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_startpoint_linestring';


--
-- Name: st_summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_summary(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_summary';


--
-- Name: st_symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


--
-- Name: st_symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symmetricdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


--
-- Name: st_text(boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_text(boolean) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'BOOL_to_text';


--
-- Name: st_text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_text(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_text';


--
-- Name: st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_touches(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$;


--
-- Name: st_transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transform(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'transform';


--
-- Name: st_translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT translate($1, $2, $3, 0)$_$;


--
-- Name: st_translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


--
-- Name: st_transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


--
-- Name: st_union(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_union_geometry_array';


--
-- Name: st_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomunion';


--
-- Name: st_unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_unite_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_union_geometry_array';


--
-- Name: st_width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_width(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getWidth';


--
-- Name: st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_within(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Within($1,$2)$_$;


--
-- Name: st_wkbtosql(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkbtosql(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_WKB';


--
-- Name: st_wkttosql(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkttosql(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_x(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_x_point';


--
-- Name: st_xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmax';


--
-- Name: st_xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmin';


--
-- Name: st_y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_y(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_y_point';


--
-- Name: st_ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymax';


--
-- Name: st_ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymin';


--
-- Name: st_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_z_point';


--
-- Name: st_zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmax';


--
-- Name: st_zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmflag(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_zmflag';


--
-- Name: st_zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmin';


--
-- Name: startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION startpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_startpoint_linestring';


--
-- Name: summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION summary(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_summary';


--
-- Name: symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


--
-- Name: symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symmetricdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


--
-- Name: text(boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(boolean) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '/opt/local/lib/postgresql84/postgis-1.5', 'BOOL_to_text';


--
-- Name: text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_text';


--
-- Name: touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION touches(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'touches';


--
-- Name: transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transform(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'transform';


--
-- Name: transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transform_geometry(geometry, text, text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'transform_geom';


--
-- Name: translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT translate($1, $2, $3, 0)$_$;


--
-- Name: translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


--
-- Name: transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


--
-- Name: unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unite_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_union_geometry_array';


--
-- Name: update_geometry_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION update_geometry_stats() RETURNS text
    LANGUAGE sql
    AS $$ SELECT 'update_geometry_stats() has been obsoleted. Statistics are automatically built running the ANALYZE command'::text$$;


--
-- Name: update_geometry_stats(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION update_geometry_stats(character varying, character varying) RETURNS text
    LANGUAGE sql
    AS $$SELECT update_geometry_stats();$$;


--
-- Name: width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION width(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getWidth';


--
-- Name: within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION within(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'within';


--
-- Name: x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION x(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_x_point';


--
-- Name: xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmax';


--
-- Name: xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmin';


--
-- Name: y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION y(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_y_point';


--
-- Name: ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymax';


--
-- Name: ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymin';


--
-- Name: z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_z_point';


--
-- Name: zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmax';


--
-- Name: zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmflag(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_zmflag';


--
-- Name: zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmin';


--
-- Name: accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- Name: accum_old(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum_old(geometry) (
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


--
-- Name: collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- Name: extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- Name: extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent3d(geometry) (
    SFUNC = public.combine_bbox,
    STYPE = box3d
);


--
-- Name: makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- Name: memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- Name: memgeomunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memgeomunion(geometry) (
    SFUNC = geomunion,
    STYPE = geometry
);


--
-- Name: polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- Name: st_accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- Name: st_accum_old(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum_old(geometry) (
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


--
-- Name: st_collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- Name: st_extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- Name: st_extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent3d(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d
);


--
-- Name: st_makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- Name: st_memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- Name: st_memunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memunion(geometry) (
    SFUNC = public.st_union,
    STYPE = geometry
);


--
-- Name: st_polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- Name: st_union(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_union(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_union_finalfn
);


--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = st_geometry_overlap,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = st_postgis_gist_sel,
    JOIN = st_postgis_gist_joinsel
);


--
-- Name: &<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &< (
    PROCEDURE = st_geometry_overleft,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &<| (
    PROCEDURE = st_geometry_overbelow,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |&>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: &>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &> (
    PROCEDURE = st_geometry_overright,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = st_geometry_lt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: <<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR << (
    PROCEDURE = st_geometry_left,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <<| (
    PROCEDURE = st_geometry_below,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |>>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = st_geometry_le,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = st_geometry_eq,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = st_geometry_gt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = st_geometry_ge,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >> (
    PROCEDURE = st_geometry_right,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = st_geometry_contained,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |&> (
    PROCEDURE = st_geometry_overabove,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |>> (
    PROCEDURE = st_geometry_above,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = st_geometry_contain,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~= (
    PROCEDURE = st_geometry_same,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~=,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS btree_geometry_ops
    DEFAULT FOR TYPE geometry USING btree AS
    OPERATOR 1 <(geometry,geometry) ,
    OPERATOR 2 <=(geometry,geometry) ,
    OPERATOR 3 =(geometry,geometry) ,
    OPERATOR 4 >=(geometry,geometry) ,
    OPERATOR 5 >(geometry,geometry) ,
    FUNCTION 1 (geometry, geometry) geometry_cmp(geometry,geometry);


--
-- Name: gist_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_geometry_ops
    DEFAULT FOR TYPE geometry USING gist AS
    STORAGE box2d ,
    OPERATOR 1 <<(geometry,geometry) ,
    OPERATOR 2 &<(geometry,geometry) ,
    OPERATOR 3 &&(geometry,geometry) ,
    OPERATOR 4 &>(geometry,geometry) ,
    OPERATOR 5 >>(geometry,geometry) ,
    OPERATOR 6 ~=(geometry,geometry) ,
    OPERATOR 7 ~(geometry,geometry) ,
    OPERATOR 8 @(geometry,geometry) ,
    OPERATOR 9 &<|(geometry,geometry) ,
    OPERATOR 10 <<|(geometry,geometry) ,
    OPERATOR 11 |>>(geometry,geometry) ,
    OPERATOR 12 |&>(geometry,geometry) ,
    FUNCTION 1 (geometry, geometry) lwgeom_gist_consistent(internal,geometry,integer) ,
    FUNCTION 2 (geometry, geometry) lwgeom_gist_union(bytea,internal) ,
    FUNCTION 3 (geometry, geometry) lwgeom_gist_compress(internal) ,
    FUNCTION 4 (geometry, geometry) lwgeom_gist_decompress(internal) ,
    FUNCTION 5 (geometry, geometry) lwgeom_gist_penalty(internal,internal,internal) ,
    FUNCTION 6 (geometry, geometry) lwgeom_gist_picksplit(internal,internal) ,
    FUNCTION 7 (geometry, geometry) lwgeom_gist_same(box2d,box2d,internal);


SET search_path = pg_catalog;

--
-- Name: CAST (public.box2d AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.box3d) WITH FUNCTION public.st_box3d(public.box2d) AS IMPLICIT;


--
-- Name: CAST (public.box2d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.geometry) WITH FUNCTION public.st_geometry(public.box2d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.st_box(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.box2d) WITH FUNCTION public.st_box2d(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.st_geometry(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d_extent AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.box2d) WITH FUNCTION public.st_box2d(public.box3d_extent) AS IMPLICIT;


--
-- Name: CAST (public.box3d_extent AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.box3d) WITH FUNCTION public.st_box3d_extent(public.box3d_extent) AS IMPLICIT;


--
-- Name: CAST (public.box3d_extent AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.geometry) WITH FUNCTION public.st_geometry(public.box3d_extent) AS IMPLICIT;


--
-- Name: CAST (bytea AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (bytea AS public.geometry) WITH FUNCTION public.st_geometry(bytea) AS IMPLICIT;


--
-- Name: CAST (public.chip AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.chip AS public.geometry) WITH FUNCTION public.st_geometry(public.chip) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.st_box(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box2d) WITH FUNCTION public.st_box2d(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.st_box3d(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS bytea); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS bytea) WITH FUNCTION public.st_bytea(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.st_text(public.geometry) AS IMPLICIT;


--
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.st_geometry(text) AS IMPLICIT;


SET search_path = public, pg_catalog;

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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_geometry CHECK ((ndims(geometry) = 2)),
    CONSTRAINT enforce_srid_geometry CHECK ((srid(geometry) = 4326))
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
-- Name: bbox; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW bbox AS
SELECT DISTINCT ((10000 * shapes.gid) + feature_object_types.category_id) AS gid, shapes.fid, feature_object_types.category_id AS object_type, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, CASE WHEN ((((xmax((envelope(shapes.geometry))::box3d) - xmin((envelope(shapes.geometry))::box3d)) > (120)::double precision) AND (xmax((envelope(shift_longitude(shapes.geometry)))::box3d) < (270)::double precision)) AND (ymin((envelope(shapes.geometry))::box3d) > ((-90))::double precision)) THEN envelope(shift_longitude(shapes.geometry)) WHEN ((((xmax((envelope(shapes.geometry))::box3d) - xmin((envelope(shapes.geometry))::box3d)) > (120)::double precision) AND (xmax((envelope(shift_longitude(shapes.geometry)))::box3d) >= (270)::double precision)) AND (ymin((envelope(shapes.geometry))::box3d) > ((-90))::double precision)) THEN translate(envelope(shift_longitude(shapes.geometry)), ((-360))::double precision, (0)::double precision, (0)::double precision) ELSE envelope(shapes.geometry) END AS geometry FROM shapes, category_features feature_object_types, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2 WHERE ((((((((shapes.fid = features.fid) AND (features.id = feature_object_types.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) ORDER BY ((10000 * shapes.gid) + feature_object_types.category_id), shapes.fid, feature_object_types.category_id, sp1.name, feature_names.name, sp2.name, geometrytype(shapes.geometry), CASE WHEN ((((xmax((envelope(shapes.geometry))::box3d) - xmin((envelope(shapes.geometry))::box3d)) > (120)::double precision) AND (xmax((envelope(shift_longitude(shapes.geometry)))::box3d) < (270)::double precision)) AND (ymin((envelope(shapes.geometry))::box3d) > ((-90))::double precision)) THEN envelope(shift_longitude(shapes.geometry)) WHEN ((((xmax((envelope(shapes.geometry))::box3d) - xmin((envelope(shapes.geometry))::box3d)) > (120)::double precision) AND (xmax((envelope(shift_longitude(shapes.geometry)))::box3d) >= (270)::double precision)) AND (ymin((envelope(shapes.geometry))::box3d) > ((-90))::double precision)) THEN translate(envelope(shift_longitude(shapes.geometry)), ((-360))::double precision, (0)::double precision, (0)::double precision) ELSE envelope(shapes.geometry) END;


--
-- Name: bbox_test; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW bbox_test AS
SELECT DISTINCT ((10000 * shapes.gid) + feature_object_types.category_id) AS gid, shapes.fid, feature_object_types.category_id AS object_type, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, CASE WHEN ((((xmax((envelope(shapes.geometry))::box3d) - xmin((envelope(shapes.geometry))::box3d)) > (120)::double precision) AND (xmax((envelope(shift_longitude(shapes.geometry)))::box3d) < (270)::double precision)) AND (ymin((envelope(shapes.geometry))::box3d) > ((-90))::double precision)) THEN envelope(shift_longitude(shapes.geometry)) WHEN ((((xmax((envelope(shapes.geometry))::box3d) - xmin((envelope(shapes.geometry))::box3d)) > (120)::double precision) AND (xmax((envelope(shift_longitude(shapes.geometry)))::box3d) >= (270)::double precision)) AND (ymin((envelope(shapes.geometry))::box3d) > ((-90))::double precision)) THEN translate(envelope(shift_longitude(shapes.geometry)), ((-360))::double precision, (0)::double precision, (0)::double precision) ELSE envelope(shapes.geometry) END AS geometry FROM shapes, category_features feature_object_types, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2 WHERE ((((((((shapes.fid = features.fid) AND (features.id = feature_object_types.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) ORDER BY ((10000 * shapes.gid) + feature_object_types.category_id), shapes.fid, feature_object_types.category_id, sp1.name, feature_names.name, sp2.name, geometrytype(shapes.geometry), CASE WHEN ((((xmax((envelope(shapes.geometry))::box3d) - xmin((envelope(shapes.geometry))::box3d)) > (120)::double precision) AND (xmax((envelope(shift_longitude(shapes.geometry)))::box3d) < (270)::double precision)) AND (ymin((envelope(shapes.geometry))::box3d) > ((-90))::double precision)) THEN envelope(shift_longitude(shapes.geometry)) WHEN ((((xmax((envelope(shapes.geometry))::box3d) - xmin((envelope(shapes.geometry))::box3d)) > (120)::double precision) AND (xmax((envelope(shift_longitude(shapes.geometry)))::box3d) >= (270)::double precision)) AND (ymin((envelope(shapes.geometry))::box3d) > ((-90))::double precision)) THEN translate(envelope(shift_longitude(shapes.geometry)), ((-360))::double precision, (0)::double precision, (0)::double precision) ELSE envelope(shapes.geometry) END;


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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    updated_at timestamp without time zone,
    info_source_type character varying(255) NOT NULL
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
    source_url character varying(255),
    language_id integer NOT NULL
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
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'deva'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: devanagari_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW devanagari_poly AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'deva'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: devanagari_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW devanagari_pt AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'deva'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


--
-- Name: electricity_use_10_million_watt_hours; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE electricity_use_10_million_watt_hours (
    gid integer NOT NULL,
    name character varying(27),
    elect_use double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_geometry CHECK ((ndims(geometry) = 2)),
    CONSTRAINT enforce_geotype_geometry CHECK (((geometrytype(geometry) = 'POINT'::text) OR (geometry IS NULL))),
    CONSTRAINT enforce_srid_geometry CHECK ((srid(geometry) = 4326))
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


SET default_with_oids = true;

--
-- Name: geometry_columns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geometry_columns (
    f_table_catalog character varying(256) NOT NULL,
    f_table_schema character varying(256) NOT NULL,
    f_table_name character varying(256) NOT NULL,
    f_geometry_column character varying(256) NOT NULL,
    coord_dimension integer NOT NULL,
    srid integer NOT NULL,
    type character varying(30) NOT NULL
);


SET default_with_oids = false;

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
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 4326))
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
    CONSTRAINT enforce_dims_geometry CHECK ((ndims(geometry) = 2)),
    CONSTRAINT enforce_srid_geometry CHECK ((srid(geometry) = 4326))
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
SELECT DISTINCT shapes.gid, shapes.fid, feature_object_types.category_id AS object_type, 'roman.popular'::character varying AS language, feature_names.name, geometrytype(shapes.geometry) AS geotype, shapes.geometry FROM shapes, category_features feature_object_types, features, feature_names, simple_props, cached_feature_names WHERE ((((((shapes.fid = features.fid) AND (features.id = feature_object_types.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (simple_props.id = cached_feature_names.view_id)) AND ((simple_props.code)::text = 'roman.popular'::text)) ORDER BY shapes.gid, shapes.fid, feature_object_types.category_id, 'roman.popular'::character varying, feature_names.name, geometrytype(shapes.geometry), shapes.geometry;


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
SELECT roman_popular.fid, roman_popular.object_type, roman_popular.language, ("substring"((roman_popular.name)::text, 1, 25))::character varying AS name, roman_popular.geotype, roman_popular.geometry, roman_popular.gid FROM roman_popular WHERE (roman_popular.geotype = 'POINT'::text);


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
-- Name: roman_popular_bbox; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_popular_bbox AS
SELECT roman_popular.gid, roman_popular.fid, roman_popular.object_type, roman_popular.language, roman_popular.name, roman_popular.geotype, envelope(roman_popular.geometry) AS geometry FROM roman_popular;


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
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: roman_popular_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_popular_poly AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: roman_popular_poly_low_res; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_popular_poly_low_res AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, simplify(shapes.geometry, (0.1)::double precision) AS simplify FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: roman_popular_poly_med_res; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_popular_poly_med_res AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, simplify(shapes.geometry, (0.01)::double precision) AS simplify FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: roman_popular_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_popular_pt AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


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
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.scholar'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: roman_scholarly_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_scholarly_poly AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.scholar'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: roman_scholarly_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW roman_scholarly_pt AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'roman.scholar'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


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
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'simp.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: simple_chinese_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW simple_chinese_poly AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'simp.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: simple_chinese_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW simple_chinese_pt AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'simp.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


--
-- Name: simple_names; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW simple_names AS
SELECT a.feature_id AS fid, b.name FROM cached_feature_names a, feature_names b, simple_props sp1, simple_props sp2 WHERE (((((a.feature_name_id = b.id) AND (sp1.id = a.view_id)) AND ((sp1.code)::text = 'roman.popular'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (b.writing_system_id = sp2.id));


--
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048),
    CONSTRAINT spatial_ref_sys_srid_check CHECK (((srid > 0) AND (srid < 999000)))
);


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
SELECT DISTINCT ((10000 * shapes.gid) + feature_object_types.category_id) AS gid, shapes.fid, feature_object_types.category_id AS object_type, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.geometry FROM shapes, category_features feature_object_types, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2 WHERE ((((((((shapes.fid = features.fid) AND (features.id = feature_object_types.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND ((sp1.code)::text = 'pri.tib.sec.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) ORDER BY ((10000 * shapes.gid) + feature_object_types.category_id), shapes.fid, feature_object_types.category_id, sp1.name, feature_names.name, sp2.name, geometrytype(shapes.geometry), shapes.geometry;


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
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'trad.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTILINESTRING'::text));


--
-- Name: traditional_chinese_poly; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW traditional_chinese_poly AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'trad.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'MULTIPOLYGON'::text));


--
-- Name: traditional_chinese_pt; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW traditional_chinese_pt AS
SELECT DISTINCT ((10000 * shapes.gid) + category_features.category_id) AS gid, shapes.fid, category_features.category_id AS object_type, symbol_type.symbol, sp1.name AS language, feature_names.name, sp2.name AS writing, geometrytype(shapes.geometry) AS geotype, shapes.area, shapes.geometry FROM shapes, category_features, features, feature_names, simple_props sp1, cached_feature_names, simple_props sp2, symbol_type WHERE (((((((((((shapes.fid = features.fid) AND (features.id = category_features.feature_id)) AND (cached_feature_names.feature_id = features.id)) AND (cached_feature_names.feature_name_id = feature_names.id)) AND (sp1.id = cached_feature_names.view_id)) AND (category_features.category_id = symbol_type.object_type)) AND ((sp1.code)::text = 'trad.chi'::text)) AND ((sp2.type)::text ~~ 'WritingSystem'::text)) AND (feature_names.writing_system_id = sp2.id)) AND shapes.is_public) AND (geometrytype(shapes.geometry) = 'POINT'::text));


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
-- Name: us_districts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE us_districts (
    gid integer NOT NULL,
    statefp character varying(2),
    cd113fp character varying(2),
    affgeoid character varying(13),
    geoid character varying(4),
    lsad character varying(2),
    cdsessn character varying(3),
    aland double precision,
    awater double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4269))
);


--
-- Name: us_districts_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE us_districts_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: us_districts_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE us_districts_gid_seq OWNED BY us_districts.gid;


--
-- Name: us_states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE us_states (
    gid integer NOT NULL,
    statefp character varying(2),
    statens character varying(8),
    affgeoid character varying(11),
    geoid character varying(2),
    stusps character varying(2),
    name character varying(100),
    lsad character varying(2),
    aland double precision,
    awater double precision,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4269))
);


--
-- Name: us_states_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE us_states_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: us_states_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE us_states_gid_seq OWNED BY us_states.gid;


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
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY us_districts ALTER COLUMN gid SET DEFAULT nextval('us_districts_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY us_states ALTER COLUMN gid SET DEFAULT nextval('us_states_gid_seq'::regclass);


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
-- Name: geometry_columns_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geometry_columns
    ADD CONSTRAINT geometry_columns_pk PRIMARY KEY (f_table_catalog, f_table_schema, f_table_name, f_geometry_column);


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
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


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
-- Name: us_districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY us_districts
    ADD CONSTRAINT us_districts_pkey PRIMARY KEY (gid);


--
-- Name: us_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY us_states
    ADD CONSTRAINT us_states_pkey PRIMARY KEY (gid);


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
-- Name: us_districts_the_geom_gist; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX us_districts_the_geom_gist ON us_districts USING gist (the_geom);


--
-- Name: us_states_the_geom_gist; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX us_states_the_geom_gist ON us_states USING gist (the_geom);


--
-- Name: xml_documents_feature_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX xml_documents_feature_id_idx ON xml_documents USING btree (feature_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO public;

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

INSERT INTO schema_migrations (version) VALUES ('20150402063417');

INSERT INTO schema_migrations (version) VALUES ('20150516040220');

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

