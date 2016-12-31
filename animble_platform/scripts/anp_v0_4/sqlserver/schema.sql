--add status to project
ALTER TABLE project
ADD project_status_ref_id int default 0 not null;