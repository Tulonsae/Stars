Info on wgsn
============

Description
-----------
This database table uses the IAU-CSN.txt data file from the IAU WGSN. In 2016,
the International Astronomical Union (IAU) organized the Working Group on Star
Names (WGSN), consisting of an international group of astronomers, to catalog
and standardize proper names for stars for the international astronomical
community. Please see their Terms of Reference webpage (see Other Links below,
under Source) for more info. As of July 20, 2016, the list contains 125 stars.

Files
-----
|Name			|Description
|-----------------------|-----------
|Info.txt		|this file
|wgsn-schema.sql	|schema sql (mySQL), see Schema below
|wgsn-input-sql.awk	|awk script - converts data into input sql

External Files
--------------
|Name			|Description
|-----------------------|-----------
|IAU-CSN.txt		|IAU-CSN.txt data file, see Data below
|input.sql		|input sql - contains all data in IAU-CSN.txt

Instructions
------------
* From Source:

     curl -O http://www.pas.rochester.edu/~emamajek/WGSN/IAU-CSN.txt
     tail -n +16 IAU-CSN.txt | awk -f wgsn-input-sql.awk > wgsn-input.sql

* From Tulonsae:

     curl -O https://tulonsae.org/stars/wgsn/IAU-CSN.txt \
          -O https://tulonsae.org/stars/wgsn/wgsn-input.sql

Source
------
* From: IAU Catalog of Star Names (IAU-CSN), IAU Division C Working Group on
Star Names (WGSN)
* Location: http://www.pas.rochester.edu/~emamajek/WGSN/IAU-CSN.txt
* Date Retrieved: 13-Aug-2016
* Files Retrieved: IAU-CSN.txt
* Other Links:
** The WGN webpage on the IAU site:
   http://www.iau.org/science/scientific_bodies/working_groups/280/
** The WGSN webpage:
   http://www.pas.rochester.edu/~emamajek/WGSN/
** The WGSN Terms of Reference webpage:
   http://www.pas.rochester.edu/~emamajek/WGSN/termsref.html

Data:
-----
* Name - official name
* Designation - cat code + its cat ID, usually HR (Harvard Revised)
* RA(J2000) - Right Ascension, J2000, in degrees (converted to decimal)
* Dec(J2000) - Declination, J2000, in degrees (converted to decimal)
* Vmag - apparent visual magnitude
* ID - ??, 3-letter Greek and/or 2-digit number, if known
* Con - constellation
* HIP# - Hipparcos Catalog ID
* HD# - Henry Draper Catalog ID
* Approved - date (yyyy-mm-dd), Note 1

Notes:
 1. Names marked approved 2015-12-15 are expolanet host star names.

Schema:
-------
|Column		|Data Type		|From Data Field
|---------------|-----------------------|---------------
| Name		|varchar(16) not null	|Name
| Desg		|varchar(13) not null	|Designation
| RA		|decimal(9,6) not null	|RA(J2000)
| DE		|decimal(8,6) not null	|Dec(J2000)
| VMag		|decimal(3,2)		|Vmag
| Id		|varchar(5)		|ID
| Con		|char(3)		|Con
| HIP		|mediumint unsigned	|HIP#
| HD		|mediumint unsigned	|HD#
| HR		|smallint unsigned	|Designation, if cat code HR
| Approved	|date not null		|Approved
