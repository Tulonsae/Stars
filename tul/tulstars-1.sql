-- Manually add 2 major reference points (that are not in Hipparcos catalog)
INSERT INTO `tulstars` (`RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx`, `Dist`,
                        `H`, `D`, `V`, `HIP`, `sLoc`, `sType`, `Name`, `sName`)
                VALUES (286.13, 63.87, 0, 0, "G2V", 206264822.2, 0,
                        0, 0, 0, null, 'M', 'M', "Sol", 'M');
INSERT INTO `tulstars` (`RA`, `DE`, `GLon`, `GLat`, `SpType`,
                        `Plx`, `Dist`, `H`, `D`, `V`,
                        `HIP`, `sLoc`, `sType`, `Name`, `sName`)
                VALUES (266.416817, -28.992175, 359.9442, -00.0462, "Blackhole",
                        0.127, 7874.01575, -6.34915, 5471.30774, 4.56598,
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
  `H` decimal(11,5) DEFAULT NULL,
  `D` decimal(11,5) DEFAULT NULL,
  `V` decimal(11,5) DEFAULT NULL
);
INSERT INTO `tt` (`HIP`, `RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx`)
  SELECT `HIP`, `RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx` FROM `hip1loc`;

-- Cleanup data
SELECT "INFO - deleting null Plx values", count(*) from tt where Plx is null;
delete from tt where Plx is null;
SELECT "INFO - deleting zero Plx values", count(*) from tt where Plx = 0;
delete from tt where Plx = 0;
SELECT "INFO - deleting negative Plx values", count(*) from tt where Plx < 0;
delete from tt where Plx < 0;

-- Calculate the distance and cartesian coords
-- Note: h = horizontal, v = vertical, d = depth
DROP PROCEDURE IF EXISTS tproc;
DELIMITER ;;
CREATE PROCEDURE tproc()
BEGIN
  DECLARE n int DEFAULT 0;
  DECLARE i int DEFAULT 0;
  SELECT COUNT(*) FROM `tt` INTO n;
  SET i = 0;
  WHILE i < n DO
    SELECT `HIP`, `GLon`, `GLat`, `Plx` FROM `tt` LIMIT i,1
      INTO @hip, @glon, @glat, @plx;
    SET @dist = 1000 / @plx;
    SET @h = @dist * COS(RADIANS(@glon)) * SIN(RADIANS(@glat));
    SET @v = @dist * SIN(RADIANS(@glon)) * SIN(RADIANS(@glat));
    SET @d = @dist * COS(RADIANS(@glat));
    UPDATE `tt` SET `Dist` = @dist, `H` = @h, `D` = @d, `V` = @v
           WHERE `HIP` = @hip;
    SET i = i + 1;
  END WHILE;
END;
;;
DELIMITER ;
CALL tproc();

-- Add the data to the real table
INSERT INTO `tulstars` (`RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx`, `Dist`,
                        `H`, `D`, `V`, `HIP`, `sLoc`)
                 SELECT `RA`, `DE`, `GLon`, `GLat`, `SpType`, `Plx`, `Dist`,
                        `H`, `D`, `V`, `HIP`, "H1" FROM `tt`;
