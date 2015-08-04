SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`experiment_settings` (
  `id_experiment_settings` INT(11) NOT NULL AUTO_INCREMENT ,
  `integer_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `id_groups` INT(11) NULL DEFAULT NULL ,
  `tag` TEXT NULL DEFAULT NULL ,
  `description` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id_experiment_settings`) ,
  INDEX `integer_timestamp` (`integer_timestamp` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`groups` (
  `group_names` VARCHAR(45) NULL DEFAULT NULL ,
  `id_groups` INT(11) NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id_groups`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`pelletron_data` (
  `id_pelletron_data` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT ,
  `integer_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `high_voltage` FLOAT(11) NULL DEFAULT NULL ,
  `positive_high_voltage_supply` DOUBLE NULL DEFAULT NULL ,
  `negative_high_voltage_supply` DOUBLE NULL DEFAULT NULL ,
  `hv_control_difference` DOUBLE NULL DEFAULT NULL ,
  `vacuum_pressure` FLOAT(11) NULL DEFAULT NULL ,
  `radiation` DOUBLE NULL DEFAULT NULL ,
  `column_current` FLOAT(11) NULL DEFAULT NULL ,
  `lost_charge` DOUBLE NULL DEFAULT NULL ,
  `chain_current` FLOAT(11) NULL DEFAULT NULL ,
  `control_high_voltage` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`id_pelletron_data`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1719119
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`psu` (
  `integer_timestamp` BIGINT(20) NOT NULL ,
  `velocity_max` FLOAT(11) NULL DEFAULT NULL ,
  `velocity_min` FLOAT(11) NULL DEFAULT NULL ,
  `charge_max` FLOAT(11) NULL DEFAULT NULL ,
  `charge_min` FLOAT(11) NULL DEFAULT NULL ,
  `mass_max` FLOAT(11) NULL DEFAULT NULL ,
  `mass_min` FLOAT(11) NULL DEFAULT NULL ,
  `var1` TINYINT(4) NULL DEFAULT NULL ,
  `var2` TINYINT(4) NULL DEFAULT NULL ,
  PRIMARY KEY (`integer_timestamp`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`source_settings` (
  `integer_timestamp` BIGINT(20) NOT NULL ,
  `einzel_voltage` FLOAT(11) NULL DEFAULT NULL ,
  `needle_voltage` FLOAT(11) NULL DEFAULT NULL ,
  `frequency` FLOAT(11) NULL DEFAULT NULL ,
  `width` FLOAT(11) NULL DEFAULT NULL ,
  `amplitude` FLOAT(11) NULL DEFAULT NULL ,
  `x_voltage` FLOAT(11) NULL DEFAULT NULL ,
  `y_voltage` FLOAT(11) NULL DEFAULT NULL ,
  `settings_id` TEXT NULL DEFAULT NULL ,
  `id_source_settings` INT(11) NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`integer_timestamp`) ,
  INDEX `id_source_settings` (`id_source_settings` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`dust_info` (
  `id_dust_info` INT(11) NOT NULL AUTO_INCREMENT ,
  `integer_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `dust_type` INT(11) NULL DEFAULT NULL ,
  `source_builder` INT(11) NULL DEFAULT NULL ,
  `dust_source_notes` TEXT NULL DEFAULT NULL ,
  `initial_dust_mass` FLOAT(11) NULL DEFAULT NULL ,
  `final_dust_mass` FLOAT(11) NULL DEFAULT NULL ,
  `shot_count` BIGINT(20) NULL DEFAULT NULL ,
  `run_time` FLOAT(11) NULL DEFAULT NULL ,
  `transfer_from_small` TINYINT(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_dust_info`) )
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`dust_type` (
  `id_dust_type` INT(11) NOT NULL AUTO_INCREMENT ,
  `dust_name` TEXT NULL DEFAULT NULL ,
  `dust_type` SMALLINT(6) NULL DEFAULT NULL ,
  `batch_no` SMALLINT(6) NULL DEFAULT NULL ,
  `dust_density` FLOAT(11) NULL DEFAULT NULL ,
  `source_weight` FLOAT(11) NULL DEFAULT NULL ,
  `size` TEXT NULL DEFAULT NULL ,
  `bottle_weight` FLOAT(11) NULL DEFAULT NULL ,
  `dust_weight` FLOAT(11) NULL DEFAULT NULL ,
  `comments` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id_dust_type`) )
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`counter` (
  `id_counter` INT(11) NOT NULL AUTO_INCREMENT ,
  `integer_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `first_counter` INT(11) NULL DEFAULT NULL ,
  `second_counter` INT(11) NULL DEFAULT NULL ,
  `psu_counter` INT(11) NULL DEFAULT NULL ,
  `third_counter` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_counter`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`operator` (
  `integer_timestamp` BIGINT(20) NOT NULL ,
  `operator_id` INT(11) NOT NULL ,
  PRIMARY KEY (`integer_timestamp`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`run_times` (
  `start_timestamp` BIGINT(20) NOT NULL ,
  `stop_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `id_experiment_settings` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`start_timestamp`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`dust_info_small` (
  `id_dust_info` INT(11) NOT NULL AUTO_INCREMENT ,
  `integer_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `dust_type` INT(11) NULL DEFAULT NULL ,
  `source_builder` INT(11) NULL DEFAULT NULL ,
  `dust_source_notes` TEXT NULL DEFAULT NULL ,
  `initial_dust_mass` FLOAT(11) NULL DEFAULT NULL ,
  `final_dust_mass` FLOAT(11) NULL DEFAULT NULL ,
  `shot_count` BIGINT(20) NULL DEFAULT NULL ,
  `run_time` FLOAT(11) NULL DEFAULT NULL ,
  `transfer_to_big` TINYINT(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_dust_info`) )
ENGINE = MyISAM
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
COMMENT = 'Dust info table for small accelerator';

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`source_settings_small` (
  `integer_timestamp` BIGINT(20) NOT NULL ,
  `einzel_voltage` FLOAT(11) NULL DEFAULT NULL ,
  `needle_voltage` FLOAT(11) NULL DEFAULT NULL ,
  `frequency` FLOAT(11) NULL DEFAULT NULL ,
  `width` FLOAT(11) NULL DEFAULT NULL ,
  `amplitude` FLOAT(11) NULL DEFAULT NULL ,
  `settings_id` TEXT NULL DEFAULT NULL ,
  `id_source_settings` INT(11) NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`integer_timestamp`) ,
  INDEX `id_source_settings` (`id_source_settings` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`experiment_settings_small` (
  `id_experiment_settings` INT(11) NOT NULL AUTO_INCREMENT ,
  `integer_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `id_groups` INT(11) NULL DEFAULT NULL ,
  `tag` TEXT NULL DEFAULT NULL ,
  `description` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id_experiment_settings`) ,
  INDEX `integer_timestamp` (`integer_timestamp` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`run_times_small` (
  `start_timestamp` BIGINT(20) NOT NULL ,
  `stop_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `id_experiment_settings` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`start_timestamp`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`dust_event_small` (
  `id_dust_event` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `integer_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `velocity` FLOAT(11) NOT NULL ,
  `mass` FLOAT(11) NOT NULL ,
  `charge` FLOAT(11) NOT NULL ,
  `radius` FLOAT(11) NULL DEFAULT NULL ,
  `passed` INT(11) NULL DEFAULT NULL ,
  `id_experiment_settings` INT(11) NULL DEFAULT NULL ,
  `estimate_source` TINYINT(4) NULL DEFAULT NULL ,
  `estimate_quality` TINYINT(4) NULL DEFAULT NULL ,
  `file_location` TINYINT(4) NULL DEFAULT NULL ,
  `id_dust_info` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_dust_event`) ,
  INDEX `timestamp` (`integer_timestamp` ASC) ,
  INDEX `mass` (`mass` ASC) ,
  INDEX `velocity` (`velocity` ASC) ,
  INDEX `charge` (`charge` ASC) ,
  INDEX `file_location` (`file_location` ASC) ,
  INDEX `id_dust_info_idx` (`id_dust_info` ASC) ,
  INDEX `fk_id_experiment_setting_idx` (`id_experiment_settings` ASC) ,
  CONSTRAINT `fk_id_dust_info_small`
    FOREIGN KEY (`id_dust_info` )
    REFERENCES `CCLDAS_PRODUCTION`.`dust_info_small` (`id_dust_info` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_experiment_settings_small`
    FOREIGN KEY (`id_experiment_settings` )
    REFERENCES `CCLDAS_PRODUCTION`.`experiment_settings_small` (`id_experiment_settings` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`operator_small` (
  `integer_timestamp` BIGINT(20) NOT NULL ,
  `operator_id` INT(11) NOT NULL ,
  PRIMARY KEY (`integer_timestamp`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `CCLDAS_PRODUCTION`.`counter_small` (
  `id_counter` INT(11) NOT NULL AUTO_INCREMENT ,
  `integer_timestamp` BIGINT(20) NULL DEFAULT NULL ,
  `first_counter` INT(11) NULL DEFAULT NULL ,
  `second_counter` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_counter`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


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
