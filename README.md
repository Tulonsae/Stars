# Stars
Stars Database

This database is a collection of data from, or based on, various star catalogs
and other sources of information about stars.

Note: due to the size of the catalog data, this repository does not contain
the external data files or the generated input sql scripts. These are available
on the Internet and the instructions/locations are noted within the Info.txt
file for each table.

hygxyz Table
------------
This table uses the hygxyz.csv data file of the HYG Database from David Nash
(astronexus). The data is a compilation of stellar data (almost 120k stars)
from a variety of catalogs. In particular, it has a computed set of Cartesian
coordinates for each star, along with other useful data. See the Info.txt file
within the folder for more information.

wgsn Table
----------
This table uses the text data file, containing approved standardized proper
names for stars, from the IAU WGSN. This Working Group was organized in 2016.
As of July 20, 2016, the list contains 125 stars.

hip2dat Table
-------------
This table uses the hip2.dat data file of the Hipparcos-2 catalog from the
VizieR archives. The data is a new reduction, published in 2007, of the
astrometric data produced by the Hipparcos mission.

cdstars Table
-------------
This table uses information from Chris Dolan's list of stars in Bright Star
Catlog order. (The data his website has been put into a tsv file.) This list
is mostly included in the Stars Project for the star names.

bsc5dat Table
-------------
This table uses the catalog data file of the Yale Bright Star Catalog (aka
Harvard Revised) from the VizieR archives. The data is from the 5th Revised Ed,
published in 1991.

IP Notes
--------
This project contains mixed content from a variety of sources.

Data and content from other sources is listed in the Info.txt file in each
main folder and includes the source and location from where the content was
retrieved. You can check that location for copyright and license.

Data and content contributed by me is copyrighted by me (for those types of
content that are automatically copyrighted) and licensed under the
[MIT license](http://opensource.org/licenses/mit-license.php).
