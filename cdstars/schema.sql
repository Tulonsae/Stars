CREATE TABLE `cdstars` (
  `Name` varchar(32) NOT NULL,
  `Meaning` varchar(65) DEFAULT NULL,
  `AltNames` varchar(128) DEFAULT NULL,
  `Desg` varchar(32) NOT NULL,
  `HR` int(10) unsigned NOT NULL,
  `HD` int(10) unsigned NOT NULL,
  `RA` varchar(10) NOT NULL,
  `Decl` varchar(9) NOT NULL,
  `V` float NOT NULL,
  `BV` float DEFAULT NULL,
  `Spectrum` varchar(24) NOT NULL,
  `Comments` varchar(720) DEFAULT NULL,
  PRIMARY KEY (`HR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
