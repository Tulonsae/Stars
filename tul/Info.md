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
|tulstars-1.sql		|input sql - initial stars, computes distance and xyz
|tulstars-2.sql		|update sql - adds wgsn star names
|tulstars-3.sql		|update sql - adds HD ids

tulstars
--------
### Instructions
Requires the following tables (with their data).
* hip1loc
* wgsn
* hipTOhd

Run the sql scripts in the following order.
* tulstars.schema
* tulstars-1.sql - adds initial set of stars with distance and xyz coordinates
* tulstars-2.sql - adds official (wgsn) names
* tulstars-3.sql - adds HD catalog ids

### Important Notes
* Unless otherwise noted, all data is epoch J2000.
* The Plx values are based from earth, but the Galactic Coordinates are based
from the sun (Sol) so cartesian coordinates are not entirely precise.
* The data for Sol determined manually
    * Galactic coordinates: 0, 0 (by definition)
    * Distance: 0 (by rounding, definition)
    * Plx: 206264822.2 mas (computed parallax of the distance 1 AU)
    * RA (of North pole): 286.13 degrees or 19h 4m 30s (from Wikipedia)
    * DE (of North pole): +63.87 degrees (from Wikipedia)
    * SpType: G2V (from Wikipedia)
    * Vmag: -26.74 (from Wikipedia)
    * Absolute magnitude: 4.83 (from Wikipedia)
* The data for Sgr A* (Sagittarius A*) determined manually
    * Galactic coordiantes: 359.9442, -00.0462 (from Simbad)
    * ICRS coordinates: 17 45 40.03599, -29 00 28.1699
    * RA: 266.416817 (converted from ICRS hms to decimal degrees)
    * DE: -28.992175 (converted from ICRS degrees to decimal degrees)
    * Distance: 7860, estimated (from Wikipedia with cited source)
      and 7874.01575 from computed Plx
    * Plx: .127 mas (computed from Distance)
    * SpType: Blackhole (not actually a spectral type)
    * H: -6.34915 (computed)
    * D: 5471.30774 (computed)
    * V: 4.56598 (computed)
* Stars with values of Plx that are zero, negative, or null (in Hipparcos) were
not included.
* Cartesian coordinates are rounded to 5 decimal points.
* XYZ coordinates: xy is galatic plane, +x towards galatic center, +y is +90deg,
+z is above galatic plane

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
|X	|calculated (3)	|axis from sol to galactic center, +x towards center
|Y	|calculated (4)	|axis perpendicular to x, +y is +90deg (from x)
|Z	|calculated (5)	|axis perpendicular to galatic plane, +z is above
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
 3. X = Dist cos(GLon) cos(GLat)
 4. Y = Dist sin(GLon) cos(GLat)
 5. Z = Dist sin(GLat)
 6. Code for source of Data
    * M - manually determined, see Important Notes
    * H1 - Hipparcos 1
    * H2 - Hipparcos 2
    * WG - WGSN

### Schema
|Column	|Data Type
|-------|---------
|Tul	|mediumint unsigned, not null auto_increment, primary key
|RA	|decimal(9,6), not null
|DE	|decimal(8,6), not null
|GLon	|decimal(7,4), not null
|GLat	|decimal(6,4), not null
|SpType	|varchar(12), default null
|Plx	|decimal(12,3), not null
|Dist	|decimal(11,5), not null
|H	|decimal(11,5), not null
|D	|decimal(11,5), not null
|V	|decimal(11,5), not null
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
