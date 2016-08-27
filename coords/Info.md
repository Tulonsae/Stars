Info on Coordinate Tables
=========================

Description
-----------
This file describes various coordinate tables. Each table contains the galactic
longitude/latitude, J2000 RA/DE and (if available) parallax of the stars in the
specified catalog. In many/most cases, these are calculated. Whenever possible,
calculations are from a VizieR query.

Files
-----
|Name			|Description
|-----------------------|-----------
|Info.md		|this file
|chkdata		|directory containing useful awk scripts
|hip1loc.schema		|hip1loc schema file (mySQL), see hip1loc below
|hip1loc-sql.awk	|hip1loc awk script - creates input sql from data file
|hip2loc.schema		|hip2loc schema file (mySQL), see hip2loc below
|hip2loc-sql.awk	|hip2loc awk script - creates input sql from data file

External Files
--------------
|Name			|Description
|-----------------------|-----------
|q_hip1_gal.tsv		|VizieR query on hip_main.dat (I/239)
|hip1loc-input.sql	|hip1loc input sql - contains data from q_hip1_gal.tsv
|q_hip2_gal.tsv		|VizieR query on hip2.dat (I/311)
|hip2loc-input.sql	|hip2loc input sql - contains data from q_hip2_gal.tsv

hip1loc
-------
### Instructions
To reproduce query, see beginning of q_hip1_gal.tsv for query parameters and
go to http://vizier.u-strasbg.fr/viz-bin/VizieR

* From Tulonsae:

        curl -O https://tulonsae.org/stars/hipparcos/q_hip1_gal.tsv.gz
        gunzip q_hip1_gal.tsv.gz
        tail -n +62 q_hip1_gal.tsv | awk -f hip1loc-sql.awk > hip1loc-input.sql

    Or

        curl -O https://tulonsae.org/stars/coords/hip1loc-input.sql.gz
        gunzip hip1loc-input.sql.gz

### Data Fields
Data retrieved 24-Aug-2016, using VizieR query from catalog hip_main (I/239).

|Field	|Columns|Description
|-------|-------|-----------
|Glon	|1-8	|galactic longitude, decimal degrees
|Glat	|10-17	|galactic latitude, decimal degrees
|RAJ2000|19-28	|right ascension, epoch J2000, decimal degrees
|DEJ2000|30-39	|declination, epoch J2000, decimal degrees
|HIP	|41-46	|HIP number (range: 1-120404)
|Vmag	|48-52	|V magnitude
|Plx	|54-60	|parallax, milli-second of arc
|BTmag	|62-67	|BT magnitude
|VTmag	|69-74	|VT magnitude
|B-V	|76-81	|B-V magnitude
|V-I	|83-87	|V-I magnitude
|SpType	|89-100	|Spectral Type

### Schema
|Column	|Data Type					|From Data Field
|-------|-----------------------------------------------|---------------
|HIP	|unsigned mediumint, not null, primary key	|HIP
|Plx	|decimal(5,2), default null			|Plx
|GLon	|decimal(7,4), default null			|Glon
|GLat	|decimal(6,4), default null			|Glat
|RA	|decimal(9,6), default null			|RAJ2000
|DE	|decimal(8,6), default null			|DEJ2000
|SpType	|varchar(12), default null			|SpType
|Vmag	|decimal(4,2), default null			|Vmag
|BTmag	|decimal(5,3), default null			|BTmag
|VTmag	|decimal(5,3), default null			|VTmag
|BV	|decimal(4,3), default null			|BV
|VI	|decimal(3,2), default null			|VI

hip2loc
-------
### Instructions
To reproduce query, see beginning of q_hip2_gal.tsv for query parameters and
go to http://vizier.u-strasbg.fr/viz-bin/VizieR

* From Tulonsae:

        curl -O https://tulonsae.org/stars/hipparcos/q_hip2_gal.tsv.gz
        gunzip q_hip2_gal.tsv.gz
        tail -n +49 q_hip2_gal.tsv | awk -f hip2loc-sql.awk > hip2loc-input.sql

    Or

        curl -O https://tulonsae.org/stars/coords/hip2loc-input.sql.gz
        gunzip hip2loc-input.sql.gz

### Data Fields
Data retrieved 20-Aug-2016, using VizieR query from catalog hip2 (I/311).

|Field	|Columns|Description
|-------|-------|-----------
|Glon	|1-8	|galactic longitude, decimal degrees
|Glat	|10-17	|galactic latitude, decimal degrees
|RAJ2000|19-28	|right ascension, epoch J2000, decimal degrees
|DEJ2000|30-39	|declination, epoch J2000, decimal degrees
|HIP	|41-46	|HIP number (range: 1-120404)
|Plx	|48-54	|parallax, milli-second of arc

### Schema
|Column	|Data Type					|From Data Field
|-------|-----------------------------------------------|---------------
|HIP	|unsigned mediumint, not null, primary key	|HIP
|Plx	|decimal(5,2), not null				|Plx
|GLon	|decimal(7,4), not null				|Glon
|GLat	|decimal(6,4), not null				|Glat
|RA	|decimal(9,6), not null				|RAJ2000
|DE	|decimal(8,6), not null				|DEJ2000
