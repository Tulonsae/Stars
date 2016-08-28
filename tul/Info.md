Info on Tulonsae's Tables
=========================

Description
-----------
This file describes various tables created by putting together information from
the other tables and calculating some values. A work in progress.

Files
-----
|Name			|Description
|-----------------------|-----------
|Info.md		|this file
|tulstars.schema	|tulstars schema file (mySQL), see tulstars below
|tulstars-1.sql		|input sql - data from Hip1, calculates Distance, XYZ
|tulstars-2.sql		|update sql - adds HD ids

tulstars
--------
### Instructions
Run the sql scripts in the following order.
* tulstars.schema
* tulstars-1.sql - this one can take hours
* tulstars-2.sql

### Data Description
|Column	|From		|Description
|-------|---------------|-----------
|Tul	|generated (1)	|Tul Id
|RA	|hip1loc, RA	|right ascension, epoch J2000, decimal degrees
|DE	|hip1loc, DE	|declination, epoch J2000, decimal degrees
|GLon	|hip1loc, GLon	|galactic longitude, decimal degrees
|GLat	|hip1loc, GLat	|galactic latitude, decimal degrees
|SpType	|hip1loc, SpType|spectral type
|Plx	|hip1loc, Plx	|parallax, milli-second of arc
|Dist	|calculated (2)	|distance in parsecs
|X	|calculated (3)	|x coordinate
|Y	|calculated (4)	|y coordinate
|Z	|calculated (5)	|z coordinate
|Vmag	|hip1loc, Vmag	|
|BTmag	|hip1loc, BTmag	|
|VTmag	|hip1loc, VTmag	|
|BV	|hip1loc, BV	|
|VI	|hip1loc, VI	|
|HIP	|hip1loc, HIP	|HIP id (range: 1-120404)
|HR	|		|Harvard Revised aka Yale Bright Star Catalog id
|HD	|hipTOhd, HD	|Henry Draper id
|Name	|see sName	|Official or common name
|sLoc	|code (6)	|code for source of location data
|sType	|code (6)	|code for source of spectral type data
|sMag	|code (6)	|code for source of magnitude data
|sName	|code (6)	|code for source of name

Notes:
 1. Generated with auto_increment.
 2. Dist = 1000 / Plx
 3. X = Dist cos(GLon) sin(Glat)
 4. Y = Dist sin(GLon) sin(GLat)
 5. Z = Dist cos(GLat)
 6. Code for source of Data
    * H1 - Hipparcos 1
    * H2 - Hipparcos 2
    * W - WGSN

### Schema
|Column	|Data Type
|-------|---------
|Tul	|mediumint unsigned, not null auto_increment, primary key
|RA	|decimal(9,6), not null
|DE	|decimal(8,6), not null
|GLon	|decimal(7,4), not null
|GLat	|decimal(6,4), not null
|SpType	|varchar(12), default null
|Plx	|decimal(5,2), not null
|Dist	|float, not null			change this to decimal
|X	|float, not null			change this to decimal
|Y	|float, not null			change this to decimal
|Z	|float, not null			change this to decimal
|Vmag	|decimal(4,2), default null
|BTmag	|decimal(5,3), default null
|VTmag	|decimal(5,3), default null
|BV	|decimal(4,3), default null
|VI	|decimal(3,2), default null
|HIP	|mediumint unsigned, default null
|HR	|smallint unsigned, default null
|HD	|mediumint unsigned, default null
|sLoc	|char(2), not null
|sType	|char(2), default null
|sMag	|char(2), default null
|sName	|char(2), default null
