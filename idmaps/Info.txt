Information for ID mapping tables
=================================

Description
-----------
This file describes various ID mapping tables. Each table contains ID data from
the specified catalog's data file. This consists of the catalog's ID and its
reference to another catalog ID. For example, the hip-hd table contains the
Hipparcos ID (columns 9-14) and the HD ID (columns 391-396) from the Hipparcos
hip_main.dat data file.

Files
-----
Info.txt		this file
hip-hd.schema		hip-hd schema file
hip-hd-sql.awk		hip-hd awk script to convert data into input sql

External Files
--------------
hip_main.dat		Hipparcos catalog main data file
hip-hd-input.sql	hip-hd sql script to input data

hip-hd
------
Instructions
  From original source:
    To get the hip_main.dat file
       curl -O ftp://cdsarc.u-strasbg.fr/pub/cats/I/239/hip_main.dat.gz
       gunzip hip_main.dat.gz
    To create the input sql
       awk -f hip-hd-sql.awk < hip_main.dat > hip-hd-input.sql
  From Tulonsae:
    To get the input sql
       curl -O https://tulonsae.org/idmaps/hip-hd-input.sql.gz
       gunzip hip-hd-input.sql.gz

Data Fields
  HIP, columns 9-14, HIP number (1/118322, I/239)
  HD, columns 391-396, HD number (1/359083, III/135)

Schema, table name: hip-hd
  HIP	unsigned mediumint, NOT NULL	from HIP field, primary key
  HD	unsigned mediumint		from HD field

Sources
-------
hip_main.dat (Hipparcos)
  From: The VizieR archives, hosted by CDS - Strasbourg
  Location: ftp://cdsarc.u-strasbg.fr/pub/cats/I/239/
  Date Retrieved: 16-Jul-2016
