-- Add initial set of stars

-- Manually add 2 major reference points (that are not in Hipparcos catalog)
INSERT INTO `tulstars` (`RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx`, `Dist`,
                        `X`, `Y`, `Z`, `HIP`, `sLoc`, `sType`, `Name`, `sName`)
                VALUES (286.13, 63.87, 0, 0, "G2V", 206264822.2, 0,
                        0, 0, 0, null, 'M', 'M', "Sol", 'M');
INSERT INTO `tulstars` (`RA`, `DE`, `GLon`, `GLat`, `SpType`,
                        `Plx`, `Dist`, `X`, `Y`, `Z`,
                        `HIP`, `sLoc`, `sType`, `Name`, `sName`)
                VALUES (266.416817, -28.992175, 359.9442, -00.0462, "Blackhole",
                        0.127, 7874.01575, 7874.00946, -7.66845, -6.34914,
                        null, 'M', 'M', "Sgr A*", 'M');

-- Create temp table for cleaning up data and calculations
DROP TABLE IF EXISTS `tt`;
CREATE TABLE `tt` (
  `HIP` mediumint unsigned NOT NULL,
  `RA` decimal(9,6) DEFAULT NULL,
  `DE` decimal(8,6) DEFAULT NULL,
  `GLon` decimal(7,4) DEFAULT NULL,
  `GLat` decimal(6,4) DEFAULT NULL,
  `SpType` varchar(12) DEFAULT NULL,
  `Plx` decimal(5,2) DEFAULT NULL,
  `Dist` decimal(11,5) DEFAULT NULL,
  `X` decimal(11,5) DEFAULT NULL,
  `Y` decimal(11,5) DEFAULT NULL,
  `Z` decimal(11,5) DEFAULT NULL
);
INSERT INTO `tt` (`HIP`, `RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx`)
  SELECT `HIP`, `RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx` FROM `hip1loc`;

-- Cleanup data
SELECT "INFO - deleting null Plx values", count(*) from tt where Plx is null;
delete from tt where `Plx` is null;
SELECT "INFO - deleting zero Plx values", count(*) from tt where Plx = 0;
delete from tt where `Plx` = 0;
SELECT "INFO - deleting negative Plx values", count(*) from tt where Plx < 0;
delete from tt where `Plx` < 0;

-- Check amount of data
SELECT count(*) from tt;

-- Add autoindex to temp table
ALTER TABLE tt ADD `TC` mediumint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Calculate the distance and cartesian coords
DROP PROCEDURE IF EXISTS tproc;
DELIMITER ;;
CREATE PROCEDURE tproc()
BEGIN
  DECLARE n int DEFAULT 0;
  DECLARE i int DEFAULT 0;
  SELECT COUNT(*) FROM `tt` INTO n;
  SET i = 1;
  WHILE i <= n DO
    SELECT `GLon`, `GLat`, `Plx` FROM `tt` WHERE `TC` = i
      INTO @glon, @glat, @plx;
    SET @dist = 1000 / @plx;
    SET @x = @dist * COS(RADIANS(@glon)) * COS(RADIANS(@glat));
    SET @y = @dist * SIN(RADIANS(@glon)) * COS(RADIANS(@glat));
    SET @z = @dist * SIN(RADIANS(@glat));
    UPDATE `tt` SET `Dist` = @dist, `X` = @x, `Y` = @y, `Z` = @z
           WHERE `TC` = i;
    SET i = i + 1;
  END WHILE;
END;
;;
DELIMITER ;
CALL tproc();

-- Add the data to the real table
INSERT INTO `tulstars` (`RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx`, `Dist`,
                        `X`, `Y`, `Z`, `HIP`, `sLoc`)
                 SELECT `RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx`, `Dist`,
                        `X`, `Y`, `Z`, `HIP`, "H1" FROM `tt`;
