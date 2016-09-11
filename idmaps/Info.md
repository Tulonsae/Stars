Info on ID Mapping Tables
=========================

Description
-----------
This file describes various ID mapping tables. Each table contains a cross
reference from its catalog ID to a different catalog ID. (Both IDs come from
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

External Files
--------------
|Name			|Description
|-----------------------|-----------
|hip_main.dat		|Hipparcos catalog main data file
|hipTOhd-input.sql	|hipTOhd input sql - contains HIP and HD data fields

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
