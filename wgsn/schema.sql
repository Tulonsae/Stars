CREATE TABLE `wgsn` (
  `Name` varchar(16) NOT NULL,
  `Desg` varchar(13) NOT NULL,
  `RA` decimal(9,6) NOT NULL,
  `Decl` decimal(8,6) NOT NULL,
  `Vmag` decimal(3,2) DEFAULT NULL,
  `ID` varchar(5) DEFAULT NULL,
  `Con` char(3) DEFAULT NULL,
  `HIP` mediumint unsigned DEFAULT NULL,
  `HD` mediumint unsigned DEFAULT NULL,
  `HR` smallint unsigned DEFAULT NULL,
  `Approved` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
