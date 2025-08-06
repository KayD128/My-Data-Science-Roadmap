ALTER TABLE `bikesales`.`staffs` 
ADD CONSTRAINT `manager_id`
FOREIGN KEY (`manager_id`)
REFERENCES `bikesales`.`staffs` (`manager_id`)
ON DELETE CASCADE
ON UPDATE CASCADE;