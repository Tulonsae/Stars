CREATE TABLE `wgsn` (
  `Name` varchar(16) NOT NULL,
  `Desg` varchar(16) NOT NULL,
  `RA` float NOT NULL,
  `Decl` float NOT NULL,
  `Approved` date NOT NULL,
  `Vmag` float DEFAULT NULL,
  `ID` varchar(8) DEFAULT NULL,
  `Con` varchar(8) DEFAULT NULL,
  `HIP` int(10) unsigned DEFAULT NULL,
  `HD` int(10) unsigned DEFAULT NULL,
  `HR` int(10) unsigned DEFAULT NULL
);
