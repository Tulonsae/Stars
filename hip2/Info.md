Info on hip2
============

Description
-----------
This database table uses the hipmain.dat data file from the Hipparcos-2 catalog
and puts it into a table named "hip2".

The Hipparcos-2 catalog, a new reduction of the astrometric data as produced by
the Hipparcos mission, was published in 2007. It claims accuracies for nearly
all stars brighter than magnitude Hp = 8 to be better, by up to a factor 4,
than in the original Hipparcos catalogue.

Files
-----
|Name                   |Description
|-----------------------|-----------
|Info.md		|this file
|HIP2-ReadMe		|renamed copy of Hipparcos-2 ReadMe from Source
|hip2.schema		|schema sql (mySQL), see Schema below
|hip2-sql.awk		|awk script - creates input sql from data file

External Files
--------------
|Name                   |Description
|-----------------------|-----------
|hip2.dat		|Hipparcos-2 catalog main data file, see Data below
|hip2-input.sql		|input sql - contains data for all stars in hip2.dat

Instructions
------------
* From Source:

        curl -O ftp://cdsarc.u-strasbg.fr/pub/cats/I/311/hip2.dat.gz
        gunzip hip2.dat.gz
        awk -f hip2-sql.awk < hip2.dat > hip2-input.sql

* From Tulonsae:

        curl -O https://tulonsae.org/stars/hip2/hip2.dat.gz \
             -O https://tulonsae.org/stars/hip2/input.sql.gz
        gunzip hip2.dat.gz input.sql.gz

Source
------
* From: The VizieR archives, hosted by CDS - Strasbourg
* Location: ftp://cdsarc.u-strasbg.fr/pub/cats/I/311/
* Date Retrieved: 25-Aug-2016
* Files Retrieved: ReadMe, hip2.dat.gz
* Other Links:
    * Hipparcos-2 page on the ESA website:
      http://www.cosmos.esa.int/web/hipparcos/hipparcos-2

Data:
-----
* HIP - Hipparcos identifier
* Sn - Solution type new reduction, 0-159, see HIP2_ReadMe, Note (1)
* So - Solution type old reduction, 0-5, see HIP2_ReadMe, Note (2)
* Nc - Number of components
* RArad - right ascension in IRCS, epoch 1991.25, in radians
* DErad - declination in IRCS, epoch 1991.25, in radians
* Plx - parallax, in millisecond of arc
* pmRA - proper motion in right ascension, millisecond of arc per year
* pmDE - proper motion in declination, millisecond of arc per year
* e_RArad - formal error on RArad, in millisecond of arc
* e_DErad - formal error on DErad, in millisecond of arc
* e_Plx - formal error on Plx, in millisecond of arc
* e_pmRA - formal error on pmRA, in millisecond of arc per year
* e_pmDE - formal error on pmDE, in millisecond of arc per year
* Ntr - number of field transits used
* F2 - goodness of fit
* F1 - percentage of rejected data, in percent
* var - cosmic dispersion added (stochastic solution)
* ic - entry in one of the suppl. cataglogs
* Hpmag - Hipparcos magnitude, mag
* e_Hpmap - error on mean Hpmag, mag
* sHp - scatter of Hpmag, mag
* VA - reference to variability annex, 0-2
* B-V - color index, mag
* e_B-V - formal error on color index, mag
* V-I - V-I color index, mag
* UW - upper-triangular weight matrics, 15 values

Schema:
-------
|Column         |Data Type              |From Data Field
|---------------|-----------------------|---------------
| HIP		|mediumint unsigned	|HIP
| Snew		|tinyint unsigned	|Sn
| Sold		|tinyint unsigned 	|So
| nComp		|tinyint unsigned 	|Nc
| RA		|decimal(11,10)		|RArad
| DE		|decimal(11,10)		|DErad
| Plx		|decimal(5,2)		|Plx
| PMRA		|decimal(6,2)		|pmRA
| PMDE		|decimal(7,2)		|pmDE
| eRA		|decimal(5,2)		|eRA
| eDE		|decimal(4,2)		|eDecl
| ePlx		|decimal(5,2)		|ePlx
| ePMRA		|decimal(5,2)		|ePMRA
| ePMDE		|decimal(5,2)		|ePMDec
| nFT		|smallint unsigned	|Ntr
| F2		|decimal(4,2)		|F2
| F1		|tinyint unsigned	|F1
| cda		|decimal(4,1)		|var
| catId		|smallint unsigned	|ic
| HPmag		|decimal(6,4)		|Hpmag
| eMag		|decimal(5,4)		|e_Hpmag
| sMag		|decimal(4,3)		|sHp
| VA		|tinyint unsigned	|VA
| BV		|decimal(4,3)		|B-V
| eBV		|decimal(4,3)		|e_B-V
| VI		|decimal(3,2)		|V-I
| UW1		|decimal(3,2)		|UW, value 1
| UW2		|decimal(3,2)		|UW, value 2
| UW3		|decimal(3,2)		|UW, value 3
| UW4		|decimal(3,2)		|UW, value 4
| UW5		|decimal(3,2)		|UW, value 5
| UW6		|decimal(3,2)		|UW, value 6
| UW7		|decimal(4,2)		|UW, value 7
| UW8		|decimal(3,2)		|UW, value 8
| UW9		|decimal(3,2)		|UW, value 9
| UW10		|decimal(3,2)		|UW, value 10
| UW11		|decimal(3,2)		|UW, value 11
| UW12		|decimal(3,2)		|UW, value 12
| UW13		|decimal(3,2)		|UW, value 13
| UW14		|decimal(3,2)		|UW, value 14
| UW15		|decimal(3,2)		|UW, value 15
Note: All fields are NOT NULL. HIP is primary key.
Also: UW7 is the only UW field that needs decimal(4,2).
