Info on ID Mapping Tables
=========================

Description
-----------
This file describes various ID mapping tables. Each table contains a cross
reference from its catalog ID to a different catalog's ID. (Both IDs come from
the same data file so the cross reference is only as good as the original data
file.) For example, the hipTOhd table contains the Hipparcos ID (columns 9-14)
and the Henry Draper ID (columns 391-396) with both values coming from the
Hipparcos hip_main.dat data file.

Files
-----
|Name			|Description
|-----------------------|-----------
|Info.md		|this file
|chkdata		|directory containing useful awk scripts
|hipTOhd.schema		|hipTOhd schema file (mySQL), see hipTOhd below
|hipTOhd-sql.awk	|hipTOhd awk script - creates input sql from data file
|hipxids.schema		|hipxids schema file (mySQL), see hipxids below
|hipxids-sql.awk	|hipxids awk script - creates input sql from data file

External Files
--------------
|Name			|Description
|-----------------------|-----------
|hip_main.dat		|Hipparcos catalog main data file
|hipTOhd-input.sql	|hipTOhd input sql - contains HIP and HD data fields
|q_hipx_gal_ids.tsv	|VizieR query on main.dat (V/137D)
|hipxids-input.sql	|hipxids input sql - contains data from q_hipx_gal_ids.tsv

hipTOhd
-------
### Instructions
* From original source:

        curl -O ftp://cdsarc.u-strasbg.fr/pub/cats/I/239/hip_main.dat.gz
        gunzip hip_main.dat.gz
        awk -f hipTOhd-sql.awk < hip_main.dat > hipTOhd-input.sql

* From Tulonsae:

        curl -O https://tulonsae.org/stars/hipparcos/hip_main.dat.gz
        gunzip hip_main.dat.gz
        awk -f hipTOhd-sql.awk < hip_main.dat > hipTOhd-input.sql

    Or

        curl -O https://tulonsae.org/stars/idmaps/hipTOhd-input.sql.gz
        gunzip hipTOhd-input.sql.gz

### Data Fields
The catalog value below is the catalog that the Id references.

|Field	|Columns	|Description	|Range		|Catalog
|-------|---------------|---------------|---------------|-------
|HIP	|9-14		|HIP number	|1-118322	|I/239
|HD	|391-396	|HD number	|1-359083	|III/135

### Schema
|Column	|Data Type					|From Data Field
|-------|-----------------------------------------------|---------------
| HIP	|unsigned mediumint, not null, primary key	|HIP
| HD	|unsigned mediumint				|HD

Sources
-------
* hip_main.dat (Hipparcos)
    * From: The VizieR archives, hosted by CDS - Strasbourg
    * Location: ftp://cdsarc.u-strasbg.fr/pub/cats/I/239/
    * Date Retrieved: 16-Jul-2016

hipxids
-------
### Instructions
To reproduce query, see beginning of q_hipx_gal_ids.tsv for query parameters
and go to http://vizier.u-strasbg.fr/viz-bin/VizieR

* From Tulonsae:

        curl -O https://tulonsae.org/stars/hipparcos/q_hipx_gal_ids.tsv.gz
        gunzip q_hipx_gal_ids.tsv.gz
        tail -n +49 q_hipx_gal_ids.tsv | awk -f hipxids-sql.awk > hipxids-input.sql

    Or

        curl -O https://tulonsae.org/stars/idmaps/hipxids-input.sql.gz
        gunzip hipxids-input.sql.gz

### Data Fields
Data retrieved 3-Sep-2016, using VizieR query from catalog XHIP (V/137D).

|Field  |Columns|Description
|-------|-------|-----------
|Glon   |1-8    |galactic longitude, decimal degrees
|Glat   |10-17  |galactic latitude, decimal degrees
|HIP    |19-24  |HIP number (range: 1-120404)
|SpType	|26-51	|Spectral type (MK, HD or other)
|HD	|53-58	|HD (Henry Draper) number
|Cst	|60-62	|Constellation membership (standard IAU abriev.)

### Schema
|Column |Data Type                                      |From Data Field
|-------|-----------------------------------------------|---------------
|HIP    |unsigned mediumint, not null, primary key      |HIP
|GLon   |decimal(7,4), not null                         |Glon
|GLat   |decimal(6,4), not null                         |Glat
|Con	|varchar(3), not null				|Cst
|SpType	|varchar(26), default null			|SpType
|HD	|mediumint unsigned, default null		|HD
