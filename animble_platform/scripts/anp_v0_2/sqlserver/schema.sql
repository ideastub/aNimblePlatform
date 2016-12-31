--adjust project table
ALTER TABLE project
ADD class varchar(255);

--add sprint table creation script here
create table sprint (
   sprint_id                     int default 0 not null,
   project_id                    int default 0 not null,
   sprint_number                 varchar(255),
   sprint_name                   varchar(255),
   sprint_start_date             datetime,
   sprint_end_date               datetime,    
   sprint_status_ref_id          int default 0 not null,
   create_dt                     datetime,
   create_user_id                int default 0 not null,
   update_dt                     datetime,
   update_user_id                int default 0 not null,
   update_count                  int default 0 not null,
   active_ind                    int default 1 not null,
   system_assigned_version_nbr   int default 5 not null,
   record_type_ref_id            int default 321 not null
);
create unique index sprint_uk0 on sprint (sprint_id);
create unique index sprint_uk1 on sprint (project_id, sprint_number);

--add sprint to artifact
ALTER TABLE artifact
ADD sprint_id INT NULL;

--add new columns and tables for security
ALTER TABLE application_user
ADD account_expired int default 0 not null;

ALTER TABLE application_user
ADD account_locked int default 0 not null;

ALTER TABLE application_user
ADD password_expired int default 0 not null;

create table application_privilege (
   privilege_id                  int default 0 not null,
   url                           varchar(255),
   config_attribute              varchar(255),
   create_dt                     datetime,
   create_user_id                int not null default 0,
   update_dt                     datetime,
   update_user_id                int not null default 0,
   update_count                  int not null default 0,
   active_ind                    int not null default 1,
   system_assigned_version_nbr   int not null default 5,
   record_type_ref_id            int not null default 321
);
create unique index app_priv_pk on application_privilege (privilege_id);
create unique index reference_uk1 on application_privilege (url, config_attribute);

create table application_role (
   role_id                       int not null default 0,
   authority                     varchar(255),
   description                   varchar(255),
   create_dt                     datetime,
   create_user_id                int not null default 0,
   update_dt                     datetime,
   update_user_id                int not null default 0,
   update_count                  int not null default 0,
   active_ind                    int not null default 1,
   system_assigned_version_nbr   int not null default 5,
   record_type_ref_id            int not null default 321
);
create unique index app_role_pk on application_role (role_id);
create unique index user_role_uk1 on application_role (authority);

create table app_user_app_role (
   user_role_id                  int not null default 0,
   user_id                       int not null default 0,
   role_id                       int not null default 0,
   create_dt                     datetime,
   create_user_id                int not null default 0,
   update_dt                     datetime,
   update_user_id                int not null default 0,
   update_count                  int not null default 0,
   active_ind                    int not null default 1,
   system_assigned_version_nbr   int not null default 5,
   record_type_ref_id            int not null default 321
);
create unique index user_role_pk on app_user_app_role (user_role_id);
create unique index user_role_uk1 on app_user_app_role (user_id, role_id);

alter table application_user
alter column password varchar(255);

--add missing indices and constraints
create unique index project_uk1 on project (project_code);
drop index reference_uk1 on reference;
create unique index reference_uk1 on reference (reference_group, display_code);
create unique index report_param_uk1 on report_parameter (report_id,x_display_sequence,y_display_sequence);
--FIXME create unique index application_control_uk1 on application_control (control_text);

--next statements require sysadmin privileges
drop index artifact.artifact_uk1;

Declare @v_constraintname varchar(max);

set @v_constraintname ='ALTER TABLE artifact DROP CONSTRAINT ';

set @v_constraintname = @v_constraintname + (select c_obj.name as CONSTRAINT_NAME
from sysobjects c_obj
join syscomments com on c_obj.id = com.id
join sysobjects t_obj on c_obj.parent_obj = t_obj.id 
join sysconstraints con on c_obj.id = con.constid
join syscolumns col on t_obj.id = col.id
and con.colid = col.colid
where
c_obj.uid = user_id()
and c_obj.xtype = 'D'
and t_obj.name='artifact' and col.name='artifact_nbr');

exec(@v_constraintname);

alter table artifact
alter column artifact_nbr varchar(50);
create unique index artifact_uk1 on artifact (artifact_nbr, artifact_ref_id, product_ref_id);
