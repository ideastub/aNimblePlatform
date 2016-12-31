--alter sprint table to be release
EXEC sp_rename sprint, project_release;
EXEC sp_rename 'project_release.sprint_id', 'release_id';
EXEC sp_rename 'project_release.sprint_number', 'release_number';
EXEC sp_rename 'project_release.sprint_status_ref_id', 'release_status_ref_id';
EXEC sp_rename 'project_release.sprint_name', 'release_name';
EXEC sp_rename 'project_release.sprint_start_date', 'start_date';
EXEC sp_rename 'project_release.sprint_end_date', 'end_date';
ALTER TABLE project_release ADD class varchar(255) NULL DEFAULT NULL;
DROP INDEX sprint_uk1 on project_release;
create UNIQUE INDEX sprint_uk1 on project_release (project_id, release_number, class);

--add release to artifact
ALTER TABLE artifact
ADD release_id INT NULL;

--correct missing primary keys
alter table hi_value add constraint hi_value_pk primary key (next_value);

--switch artifact history number to string
--next statements require sysadmin privileges
Declare @v_constraintname varchar(max);

set @v_constraintname ='ALTER TABLE artifact_history DROP CONSTRAINT ';

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
and t_obj.name='artifact_history' and col.name='artifact_nbr');

exec(@v_constraintname);

alter table artifact_history
alter column artifact_nbr varchar(50);

--add name to report parameter
ALTER TABLE report_parameter
ADD report_param_name varchar(255) NULL;

--add report location to report
ALTER TABLE report
ADD report_location_ref_id int default 0 not null;