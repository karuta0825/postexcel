ALTER TABLE `customer`.`mobiles`
ADD COLUMN `disk_name` VARCHAR(10) NULL AFTER `office_cd`,
ADD COLUMN `disk_size` INT(10) NULL AFTER `disk_name`;