-- Add names from wgsn table

-- Create temp table of name data
DROP TABLE IF EXISTS `tt`;
CREATE TABLE `tt` (
  `HIP` mediumint unsigned DEFAULT NULL,
  `Name` varchar(16) NOT NULL
);
INSERT INTO `tt` (`HIP`, `Name`)
  SELECT `HIP`, `Name` FROM `wgsn`;

-- Cleanup data
SELECT "INFO - deleting null HIP values", count(*) from tt where `HIP` is null;
delete from tt where `HIP` is null;

-- Check amount of data
SELECT count(*) from tt;

-- Add autoindex to temp table
ALTER TABLE tt ADD `TC` mediumint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add WGSN names to the real table
DROP PROCEDURE IF EXISTS tproc;
DELIMITER ;;
CREATE PROCEDURE tproc()
BEGIN
  DECLARE n int DEFAULT 0;
  DECLARE i int DEFAULT 0;
  SELECT COUNT(*) FROM `tt` INTO n;
  SET i = 1;
  WHILE i <= n DO
    SELECT `HIP`, `Name` FROM `tt` WHERE `TC` = i
      INTO @hip, @name;
      SET @tul = NULL;
      SELECT `Tul` FROM `tulstars` WHERE `HIP` = @hip INTO @tul;
      IF @tul is NOT NULL THEN
         UPDATE `tulstars` SET `Name` = @name, `sName` = "WG" WHERE `Tul` = @tul;
      ELSE
         SELECT "INFO - not in tulstars", @hip, @name;
      END IF;
    SET i = i + 1;
  END WHILE;
END;
;;
DELIMITER ;
CALL tproc();
