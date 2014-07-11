SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


ALTER TABLE `CCLDAS_PRODUCTION`.`dust_event` DROP FOREIGN KEY `fk_id_pelletron` ;

ALTER TABLE `CCLDAS_PRODUCTION`.`dust_event` 
  ADD CONSTRAINT `fk_id_pelletron`
  FOREIGN KEY (`id_pelletron_data` )
  REFERENCES `CCLDAS_PRODUCTION`.`pelletron_data` (`id_pelletron_data` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_id_experiment_settings_idx` (`id_experiment_settings` ASC) 
, DROP INDEX `id_experiment_settings` ;

ALTER TABLE `CCLDAS_PRODUCTION`.`run_times` ENGINE = InnoDB ;

ALTER TABLE `CCLDAS_PRODUCTION`.`dust_info_small` ENGINE = InnoDB ;

ALTER TABLE `CCLDAS_PRODUCTION`.`run_times_small` ENGINE = InnoDB ;


DELIMITER $$

USE `CCLDAS_PRODUCTION`$$


CREATE
DEFINER=`spenser`@`%`
TRIGGER `CCLDAS_PRODUCTION`.`syncid`
BEFORE INSERT ON `CCLDAS_PRODUCTION`.`dust_event`
FOR EACH ROW
BEGIN
		SELECT NEW.integer_timestamp INTO @dusttime;
		SELECT MAX(id_experiment_settings) INTO @expid FROM experiment_settings WHERE experiment_settings.integer_timestamp <= @dusttime;
		SET NEW.id_experiment_settings = @expid;
        
		SELECT MAX(id_pelletron_data) INTO @pelid FROM pelletron_data;
        SET NEW.id_pelletron_data = @pelid;

        SELECT MAX(id_dust_info) INTO @dustid FROM dust_info;
        SET NEW.id_dust_info = @dustid;

    END$$


DELIMITER ;


DELIMITER $$

USE `CCLDAS_PRODUCTION`$$


CREATE
DEFINER=`spenser`@`%`
TRIGGER `CCLDAS_PRODUCTION`.`syncdcs`
BEFORE INSERT ON `CCLDAS_PRODUCTION`.`dcs_points`
FOR EACH ROW
BEGIN
		SELECT NEW.integer_timestamp INTO @dcstime;
		SELECT MAX(id_dcs_spot) INTO @spotid FROM dcs_spot WHERE dcs_spot.integer_timestamp <= @dcstime;
        SET NEW.id_dcs_spot = @spotid + 1;

    END$$


DELIMITER ;


DELIMITER $$

USE `CCLDAS_PRODUCTION`$$


CREATE
DEFINER=`spenser`@`%`
TRIGGER `CCLDAS_PRODUCTION`.`syncspot`
BEFORE INSERT ON `CCLDAS_PRODUCTION`.`dcs_spot`
FOR EACH ROW
BEGIN
		SELECT NEW.integer_timestamp INTO @spottime;
		SELECT MAX(id_experiment_settings) INTO @spotexpid FROM experiment_settings WHERE experiment_settings.integer_timestamp <= @spottime;
        SET NEW.id_experiment_settings = @spotexpid;

    END$$


DELIMITER ;


DELIMITER $$

USE `CCLDAS_PRODUCTION`$$


CREATE
DEFINER=`spenser`@`%`
TRIGGER `CCLDAS_PRODUCTION`.`syncid_small`
BEFORE INSERT ON `CCLDAS_PRODUCTION`.`dust_event_small`
FOR EACH ROW
BEGIN
		SELECT NEW.integer_timestamp INTO @dusttime;
		SELECT MAX(id_experiment_settings) INTO @expid FROM experiment_settings_small WHERE experiment_settings_small.integer_timestamp <= @dusttime;
        SET NEW.id_experiment_settings = @expid;
        SELECT MAX(id_dust_info) INTO @dustid FROM dust_info_small;
        SET NEW.id_dust_info = @dustid;

    END$$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
