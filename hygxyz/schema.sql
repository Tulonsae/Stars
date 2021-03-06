CREATE TABLE `hygxyz` (
  `ID` int(10) unsigned NOT NULL,
  `HIP` int(10) unsigned DEFAULT NULL,
  `HD` int(10) unsigned DEFAULT NULL,
  `HR` int(10) unsigned DEFAULT NULL,
  `Gliese` varchar(16) DEFAULT NULL,
  `BF` varchar(16) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `RA` float DEFAULT NULL,
  `Decl` float DEFAULT NULL,
  `Distance` float DEFAULT NULL,
  `PMRA` float DEFAULT NULL,
  `PMDec` float DEFAULT NULL,
  `RV` float DEFAULT NULL,
  `Mag` float DEFAULT NULL,
  `AbsMag` float DEFAULT NULL,
  `Spectrum` varchar(16) DEFAULT NULL,
  `BV` float DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `Z` float DEFAULT NULL,
  `VX` float DEFAULT NULL,
  `VY` float DEFAULT NULL,
  `VZ` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
);
