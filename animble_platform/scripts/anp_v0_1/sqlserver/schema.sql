--add project table creation script here
create table project (
   project_id                    int default 0
   CONSTRAINT project_pk PRIMARY KEY ,
   project_code                  varchar(255),
   project_name                  varchar(255),
   project_start_date            datetime default current_timestamp,
   project_end_date              datetime default current_timestamp,    
   create_dt                     datetime default current_timestamp,
   create_user_id                int default 0 not null,
   update_dt                     datetime default current_timestamp,
   update_user_id                int default 0 not null,
   update_count                  int default 0 not null,
   active_ind                    int default 1 not null,
   system_assigned_version_nbr   int default 5 not null,
   record_type_ref_id            int default 321 not null
);
create unique index project_uk0 on project (project_id
);

-- adjust report table
ALTER TABLE report
ADD display varchar(255)

ALTER TABLE report
ADD description varchar(255)

ALTER TABLE report
ADD report_language_ref_id int default 0 not null

ALTER TABLE report
ADD query_name varchar(255)

ALTER TABLE report
ADD file_name varchar(255)

--add report parameter table creation script here
create table report_parameter (
   report_param_id                    int default 0
   CONSTRAINT report_param_pk PRIMARY KEY ,
   report_id                int default 0 not null,
   display                  varchar(255),
   description                  varchar(255),
   param_type_ref_id             int default 0 not null,
   x_display_sequence            int default 0 not null,
   y_display_sequence            int default 0 not null,
   create_dt                     datetime default current_timestamp,
   create_user_id                int default 0 not null,
   update_dt                     datetime default current_timestamp,
   update_user_id                int default 0 not null,
   update_count                  int default 0 not null,
   active_ind                    int default 1 not null,
   system_assigned_version_nbr   int default 5 not null,
   record_type_ref_id            int default 321 not null
);
create unique index report_param_uk0 on report_parameter (report_param_id
);

DROP INDEX report_uk1 ON report
DROP INDEX report_parameter_view_ref_id ON report

-- adjust artifact table
ALTER TABLE artifact
ADD class varchar(255)

--primary key table
CREATE TABLE hi_value(
	next_value int default 20000 not NULL 
);