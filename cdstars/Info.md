Information for stars.cdstars
=============================

Description
-----------
This database table uses information from Chris Dolan's star list.

The csv file for this database table was created by copying and pasting the
information for each from Chris Dolan's list of stars in Bright Star Catalog
order.

Files
-----
Info.txt		this file
schema.sql		schema file for table, see Schema below
create-input-sql.awk	awk script - converts data into input sql

External Files
--------------
cdstars.tsv		tsv data file, see Data below
input.sql		input sql containing all data in cdstars.csv

Instructions
------------
From Source:
  Note: There does not appear to be a downloadable data file for this.
From Tulonsae:
  To get the External Files
     curl -O https://tulonsae.org/cdstars/cdstars.tsv.gz \
          -O https://tulonsae.org/cdstars/input.sql.gz
     gunzip cdstars.tsv.gz input.sql.gz
  To create the input.sql from cdstars.tsv
     tail -n +2 cdstars.tsv | awk -f create-input-sql.awk > input.sql

Source
------
From: Chris Dolan
Location: http://www.astro.wisc.edu/~dolan/constellations/star_list.html
Date Retrieved: 3-Aug-2016
Files Retrieved: information was copied/pasted into data file
Other Links:
  Chris Dolan's Constellations webpage
    http://www.astro.wisc.edu/~dolan/constellations/

Data:
-----
  Name - main name of the star (some names are used by more than one star) [1]
  Meaning - meaning(s) of the star's name(s)
  OtherNames - additional comma separated names
  Designation - constellation designation
  HR - Harvard Revised Catalog ID (same as in Yale Bright Star Catalog)
  HD - Henry Draper Catalog ID
  RA - right ascension, unknown epoch, in degrees
  Dec - declination, unknown epoch, in degrees
  V - apparent visual magnitude
  B-V - color index, magnitude
  SpectralType - spectral type
  Comments - comments on the star, if any
Notes:
  [1] Some names are in all caps.

Schema:
-------
Table name: cdstars
  Name		varchar(26)*	from Name field
  Meaning	varchar(65)	from Meaning field
  AltNames	varchar(121)	from OtherNames field
  Desg		varchar(25)*	from Designation field
  HR		unsigned int*	from HR field, primary key
  HD		unsigned int*	from HD field
  RA		char(10)*	from RA field (format: nn nn nn.n)
  Decl		char(9)*	from Dec field (format: snn nn nn)
  V		float*		from V field
  BV		float		from B-V field
  Spectrum	varchar(17)*	from Spectrum field
  Comments	varchar(705)	from Comments field
Note: * Indicates NOT NULL, otherwise DEFAULT NULL.
