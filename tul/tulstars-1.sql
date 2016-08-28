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
  `Dist` float DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `Z` float DEFAULT NULL
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

-- Calculate the distance and xyz coords
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
    SET @x = @dist * COS(RADIANS(@glon)) * SIN(RADIANS(@glat));
    SET @y = @dist * SIN(RADIANS(@glon)) * SIN(RADIANS(@glat));
    SET @z = @dist * COS(RADIANS(@glat));
    UPDATE `tt` SET `Dist` = @dist, `X` = @x, `Y` = @y, `Z` = @z
           WHERE `HIP` = @hip;
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
