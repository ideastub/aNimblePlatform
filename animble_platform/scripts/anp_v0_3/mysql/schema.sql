#alter sprint table to be release
ALTER TABLE `sprint` RENAME TO `project_release`;
ALTER TABLE `project_release` ADD class varchar(255) NULL DEFAULT NULL;
ALTER TABLE `project_release` CHANGE COLUMN `sprint_id` `release_id` INT(11) NOT NULL DEFAULT '0', DROP PRIMARY KEY, ADD PRIMARY KEY (`release_id`), DROP INDEX `sprint_uk0`, ADD UNIQUE INDEX `sprint_uk0` (`release_id` ASC);
ALTER TABLE `project_release` CHANGE COLUMN `sprint_number` `release_number` VARCHAR(255) NULL DEFAULT NULL, DROP INDEX `sprint_uk1`, ADD UNIQUE INDEX `sprint_uk1` (`project_id` ASC, `release_number` ASC, `class` ASC);
ALTER TABLE `project_release` CHANGE COLUMN `sprint_status_ref_id` `release_status_ref_id` INT(11) NOT NULL DEFAULT '0'  ;
ALTER TABLE `project_release` CHANGE COLUMN `sprint_name` `release_name` VARCHAR(255) NULL DEFAULT NULL  ;
ALTER TABLE `project_release` CHANGE COLUMN `sprint_start_date` `start_date` DATETIME NULL DEFAULT NULL  ;
ALTER TABLE `project_release` CHANGE COLUMN `sprint_end_date` `end_date` DATETIME NULL DEFAULT NULL  ;

#add release to artifact
ALTER TABLE artifact
ADD COLUMN release_id INT NULL;

#correct missing primary keys
alter table project add constraint project_pk primary key (project_id);
alter table hi_value add constraint hi_value_pk primary key (next_value);
alter table report_parameter add constraint report_parameter_pk primary key (report_param_id);

#switch artifact history number to string
alter table artifact_history
change artifact_nbr artifact_nbr varchar(50);

#add name to report parameter
ALTER TABLE report_parameter
ADD COLUMN report_param_name varchar(255) NULL;

#add report location to report
ALTER TABLE report
ADD COLUMN report_location_ref_id int default 0 not null;