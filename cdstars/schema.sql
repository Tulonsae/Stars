CREATE TABLE `cdstars` (
  `Name` varchar(26) NOT NULL,
  `Meaning` varchar(65) DEFAULT NULL,
  `AltNames` varchar(121) DEFAULT NULL,
  `Desg` varchar(25) NOT NULL,
  `HR` int(10) unsigned NOT NULL,
  `HD` int(10) unsigned NOT NULL,
  `RA` char(10) NOT NULL,
  `Decl` char(9) NOT NULL,
  `V` float NOT NULL,
  `BV` float DEFAULT NULL,
  `Spectrum` varchar(17) NOT NULL,
  `Comments` varchar(705) DEFAULT NULL,
  PRIMARY KEY (`HR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
