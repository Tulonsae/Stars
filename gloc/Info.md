Info on Galactic Coordinate Tables
==================================

Description
-----------
This file describes various galactic coordinate tables. Each table contains the
galactic longitude/latitude, right ascension/declination and other primary
information (if available) such as parallax, spectral type, and other catalog
ids. Note that the galactic coordinates and right ascension/declination are
epoch J2000 and calculated (by VizieR).

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
|hipxloc.schema		|hipxloc schema file (mySQL), see hipxloc below
|hipxloc-sql.awk	|hipxloc awk script - creates input sql from data file
|bmkloc.schema		|bmkloc schema file (mySQL), see hipxloc below
|bmkloc-sql.awk		|bmkloc awk script - creates input sql from data file

External Files
--------------
|Name			|Description
|-----------------------|-----------
|q_hip1_gal.tsv		|VizieR query on I/239/hip_main
|hip1loc-input.sql	|hip1loc input sql - contains data from q_hip1_gal.tsv
|q_hip2_gal.tsv		|VizieR query on I/311/hip2
|hip2loc-input.sql	|hip2loc input sql - contains data from q_hip2_gal.tsv
|q_hipx_gal.tsv		|VizieR query on V/137D/XHIP
|hipxloc-input.sql	|hipxloc input sql - contains data from q_hipx_gal.tsv
|q_bmk_gal.tsv		|VizieR query on B/mk/mktypes
|bmkoc-input.sql	|bmkloc input sql - contains data from q_bmk_gal.tsv

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

        curl -O https://tulonsae.org/stars/gloc/hip1loc-input.sql.gz
        gunzip hip1loc-input.sql.gz

### Data Fields
Data retrieved 24-Aug-2016, using VizieR query from catalog I/239/hip_main.

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

        curl -O https://tulonsae.org/stars/gloc/hip2loc-input.sql.gz
        gunzip hip2loc-input.sql.gz

### Data Fields
Data retrieved 20-Aug-2016, using VizieR query from catalog I/311/hip2.

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

hipxloc
-------
### Notes
The Dist value for #15863 (aka Mirfak) is incorrect. It contains the distance
calculated from the Plx value in the Hipparcos 1 data set rather than the Plx
value in this data set.

### Instructions
To reproduce query, see beginning of q_hipx_gal.tsv for query parameters and
go to http://vizier.u-strasbg.fr/viz-bin/VizieR

* From Tulonsae:

        curl -O https://tulonsae.org/stars/hipparcos/q_hipx_gal.tsv.gz
        gunzip q_hipx_gal.tsv.gz
        tail -n +81 q_hipx_gal.tsv | awk -f hipxloc-sql.awk > hipxloc-input.sql

    Or

        curl -O https://tulonsae.org/stars/gloc/hipxloc-input.sql.gz
        gunzip hipxloc-input.sql.gz

### Data Fields
Data retrieved 3-Sep-2016, using VizieR query from catalog V/137D/XHIP.

|Field	|Columns|Description
|-------|-------|-----------
|Glon	|1-8	|galactic longitude, decimal degrees
|Glat	|10-17	|galactic latitude, decimal degrees
|RAJ2000|19-28	|right ascension, epoch J2000, decimal degrees
|DEJ2000|30-39	|declination, epoch J2000, decimal degrees
|HIP	|41-46	|HIP number (range: 1-120404)
|Plx	|48-53	|parallax, milli-second of arc
|Dist	|65-61	|distance, parsecs
|X	|63-68	|heliocentric distance towards galactic center, parsecs
|Y	|70-76	|heliocentric distance towards galactic rotation, parsecs
|Z	|78-83	|heliocentric distance towards north galactic pole, parsecs
|SpType	|85-110	|Spectral Type
|Umag	|112-117|apparent magnitude in Johnson U
|Bmag	|119-124|apparent magnitude in Johnson B
|Vmag	|126-130|apparent magnitude in Johnson V
|B-V	|132-137|Johnson B-V color index
|V-I	|139-143|Color index in Cousins' system
|UMag	|145-150|absolute magnitude in Johnson U
|BMag	|152-156|absolute magnitude in Johnson B
|VMag	|158-162|absolute magnitude in Johnson V
|HD	|164-169|Henry Draper catalog id
|Cst	|171-173|Constellation membership
|Name	|175-222|Star name(s), also includes various cat ids
|GrpName|224-329|Cluster or Association name(s)

### Schema
|Column	|Data Type					|From Data Field
|-------|-----------------------------------------------|---------------
|HIP	|unsigned mediumint, not null, primary key	|HIP
|GLon	|decimal(7,4), default null			|Glon
|GLat	|decimal(6,4), default null			|Glat
|RA	|decimal(9,6), default null			|RAJ2000
|DE	|decimal(8,6), default null			|DEJ2000
|Plx	|decimal(5,2), default null			|Plx
|Dist	|decimal(6,2), default null			|Dist
|X	|decimal(5,1), default null			|X
|Y	|decimal(5,1), default null			|Y
|Z	|decimal(4,1), default null			|Z
|SpType	|varchar(26), default null			|SpType
|Umag	|decimal(5,3), default null			|Umag
|Bmag	|decimal(5,3), default null			|Bmag
|Vmag	|decimal(4,2), default null			|Vmag
|BV	|decimal(4,3), default null			|BV
|VI	|decimal(3,2), default null			|VI
|UmagAbs|decimal(5,3), default null			|UMag
|BmagAbs|decimal(4,2), default null			|BMag
|VmagAbs|decimal(4,2), default null			|VMag
|HD	|mediumint unsigned, default null		|HD
|Con	|char(3), default null				|Cst
|Name	|varchar(48), default null			|Name
|GName	|varchar(106), default null			|GrpName

bmkloc
------
### Instructions
To reproduce query, see beginning of q_bmk_gal.tsv for query parameters and
go to http://vizier.u-strasbg.fr/viz-bin/VizieR

* From Tulonsae:

        curl -O https://tulonsae.org/stars/gloc/q_bmk_gal.tsv.gz
        gunzip q_bmk_gal.tsv.gz
        tail -n +49 q_bmk_gal.tsv | awk -f bmkloc-sql.awk > bmkloc-input.sql

    Or

        curl -O https://tulonsae.org/stars/gloc/bmkloc-input.sql.gz
        gunzip bmkloc-input.sql.gz

### Data Fields
Data retrieved 11-Sep-2016, using VizieR query from catalog B/mk/mktypes.

|Field		|Columns|Description
|---------------|-------|-----------
|Glon		|1-8	|galactic longitude, decimal degrees
|Glat		|10-17	|galactic latitude, decimal degrees
|RAJ2000	|19-27	|right ascension, epoch J2000, decimal degrees
|DEJ2000	|29-37	|declination, epoch J2000, decimal degrees
|Name		|38-65	|star name as published or valid Simbad name
|n_SpType	|67	|+ if spectral type is an MK standard
|SpType		|69-94	|spectral type - MK, HD or other

### Schema
|Column	|Data Type					|From Data Field
|-------|-----------------------------------------------|---------------
|ID	|unsigned mediumint, not null, primary key	|auto-generated
|GLon	|decimal(7,4), default null			|Glon
|GLat	|decimal(6,4), default null			|Glat
|RA	|decimal(8,5), default null			|RAJ2000
|DE	|decimal(7,5), default null			|DEJ2000
|Name	|varchar(26), default null			|Name
|MKflag	|char(1), default null				|n_SpType
|SpType	|varchar(26), default null			|SpType
