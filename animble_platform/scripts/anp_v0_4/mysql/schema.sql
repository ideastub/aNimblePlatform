#add status to project
ALTER TABLE project
ADD COLUMN project_status_ref_id int default 0 not null;