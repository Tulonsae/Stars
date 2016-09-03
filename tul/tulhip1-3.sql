-- Add HD ids

-- Create temp table for ids
DROP TABLE IF EXISTS `tt`;
CREATE TABLE `tt` (
  `HIP` mediumint(8) unsigned DEFAULT NULL,
  `HD` mediumint(8) unsigned DEFAULT NULL,
  `ID` mediumint(8) unsigned DEFAULT NULL
);
INSERT INTO `tt` (`ID`, `HIP`, `HD`)
  SELECT `tulhip1`.`ID`, `tulhip1`.`HIP`, `hipTOhd`.`HD`
    FROM `tulhip1` LEFT JOIN `hipTOhd`
    ON `tulhip1`.`HIP` = `hipTOhd`.`HIP`;

-- Clean up data
SELECT "INFO - deleting null HD values", count(*) from tt where `HD` is null;
delete from tt where `HD` is null;
SELECT "INFO - deleting null HIP values", count(*) from tt where `HIP` is null;
delete from tt where `HIP` is null;

-- Check amount of data
SELECT count(*) from tt;

-- Add autoindex to temp table
ALTER TABLE tt ADD `TC` mediumint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Add HD ids to the real table
DROP PROCEDURE IF EXISTS tproc;
DELIMITER ;;
CREATE PROCEDURE tproc()
BEGIN
  DECLARE n int DEFAULT 0;
  DECLARE i int DEFAULT 0;
  SELECT COUNT(*) FROM `tt` INTO n;
  SET i = 1;
  WHILE i <= n DO
    SELECT `ID`, `HD` FROM `tt` WHERE `TC` = i
      INTO @id, @hd;
    UPDATE `tulhip1` SET `HD` = @hd WHERE `ID` = @id;
    SET i = i + 1;
  END WHILE;
END;
;;
DELIMITER ;
CALL tproc();
show warnings;
