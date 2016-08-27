# Stars
Stars Database

This database is a collection of data from, or based on, various star catalogs
and other sources of information about stars.

Note: due to the size of the catalog data, this repository does not contain
the external data files or the generated input sql scripts. These are available
on the Internet and the instructions/locations are noted within the Info.md
file for each table.

coords
------
This directory contains information for various coordinates tables (hip1loc,
hip2loc). See its Info.md file for details.

idmaps
------
This directory contains information for various ID mapping tables (hip-hd).
See its Info.md file for details.

bsc5dat
-------
This directory contains the information for the bsc5dat table. The bsc5dat table
uses the catalog data file of the Yale Bright Star Catalog (aka Harvard Revised)
from the VizieR archives. The data is from the 5th Revised Ed, published in
1991.

cdstars
-------
This directory contains the information for the cdstars table. The cdstars table
uses information from Chris Dolan's list of stars in Bright Star Catlog order.
(The data his website has been put into a tsv file.) This list is mostly
included in the Stars Project for the star names.

hip2
-------
This directory contains the information for the hip2 table. The hip2 table uses
the hip2.dat data file of the Hipparcos-2 catalog from the VizieR archives. The
data is a new reduction, published in 2007, of the astrometric data produced by
the Hipparcos mission.

hygxyz
------
This directory contains the information for the hygxyz table. The hygxyz table
uses the hygxyz.csv data file of the HYG Database from David Nash (astronexus).
The data is a compilation of stellar data (almost 120k stars) from a variety of
catalogs. In particular, it has a computed set of Cartesian coordinates for each
star, along with other useful data. See the Info.txt file within the folder for
more information.

wgsn
----
This directory contains the information for the wgsn table. The wgsn table uses
the text data file, containing approved standardized proper names for stars,
from the IAU WGSN. This Working Group was organized in 2016. As of August 21,
2016, the list contains 186 stars.

Intellectual Property Notes
---------------------------
This project contains mixed content from a variety of sources.

Data and content from other sources is listed in the Info.txt file in each
main folder and includes the source and location from where the content was
retrieved. You can check that location for copyright and license.

Data and content contributed by me is copyrighted by me (for those types of
content that are automatically copyrighted) and licensed under the
[MIT license](http://opensource.org/licenses/mit-license.php).
