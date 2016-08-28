-- Add WGSN names
DROP PROCEDURE IF EXISTS tproc;
DELIMITER ;;
CREATE PROCEDURE tproc()
BEGIN
  DECLARE n int DEFAULT 0;
  DECLARE i int DEFAULT 0;
  SELECT COUNT(*) FROM `wgsn` INTO n;
  SET i = 0;
  WHILE i < n DO
    SELECT `HIP`, `Name` FROM `wgsn` LIMIT i,1 INTO @hip, @name;
    IF @hip is NOT NULL THEN
        SET @tul = NULL;
        SELECT `Tul` FROM `tulstars` WHERE `HIP` = @hip INTO @tul;
        IF @tul is NOT NULL THEN
           UPDATE `tulstars` SET `Name` = @name, `sName` = "WG"
            WHERE `Tul` = @tul;
        ELSE
           SELECT "Missing", @hip, @name;
        END IF;
    END IF;
    SET i = i + 1;
  END WHILE;
END;
;;
DELIMITER ;
CALL tproc();

-- Add HD ids
DROP PROCEDURE IF EXISTS tproc;
DELIMITER ;;
CREATE PROCEDURE tproc()
BEGIN
  DECLARE n int DEFAULT 0;
  DECLARE i int DEFAULT 0;
  SELECT COUNT(*) FROM `tulstars` INTO n;
  SET i = 0;
  WHILE i < n DO
    SELECT `HIP` FROM `tulstars` LIMIT i,1 INTO @hip;
    IF @hip is NOT NULL THEN
       SELECT `HD` FROM `hipTOhd` WHERE `HIP` = @hip INTO @hd;
       IF @hd is NOT NULL THEN
          UPDATE `tulstars` SET `HD` = @hd WHERE `HIP` = @hip;
       ENDIF; 
    ENDIF;
    SET i = i + 1;
  END WHILE;
END;
;;
DELIMITER ;
CALL tproc();
