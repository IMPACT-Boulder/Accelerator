CREATE DEFINER= CURRENT_USER TRIGGER `ccldas_test`.`syncid`
BEFORE INSERT ON `dust_event`
FOR EACH ROW
BEGIN
		SELECT NEW.integer_timestamp INTO @dusttime;
		SELECT MAX(id_experiment_settings) INTO @expid FROM experiment_settings WHERE experiment_settings.integer_timestamp <= @dusttime;
		SET NEW.id_experiment_settings = @expid;
        
		SELECT MAX(id_pelletron_data) INTO @pelid FROM pelletron_data;
        SET NEW.id_pelletron_data = @pelid;

        SELECT MAX(id_dust_info) INTO @dustid FROM dust_info;
        SET NEW.id_dust_info = @dustid;

    END