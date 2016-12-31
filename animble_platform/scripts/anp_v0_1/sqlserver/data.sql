-- due to bug in grails v1.2.2, copy discriminator in artifact_ref_id to class column
update artifact set class = artifact_ref_id

-- cleanup any bad artifacts
delete from artifact where product_ref_id=0


--remove use of app_type_ref_id column
  update reference
  set reference_group = 'FeaturePriority'
  where reference_group = 'Priority' and app_type_ref_id = '129'
  
  update reference
  set reference_group = 'DesignPriority'
  where reference_group = 'Priority' and app_type_ref_id = '130'
  
  update reference
  set reference_group = 'RequirementPriority'
  where reference_group = 'Priority' and app_type_ref_id = '131'
  
  update reference
  set reference_group = 'ImplementationPriority'
  where reference_group = 'Priority' and app_type_ref_id = '132'
  
  update reference
  set reference_group = 'TestCasePriority'
  where reference_group = 'Priority' and app_type_ref_id = '133'

  update reference
  set reference_group = 'FeatureStatus'
  where reference_group = 'Status' and app_type_ref_id = '129'
  
  update reference
  set reference_group = 'DesignStatus'
  where reference_group = 'Status' and app_type_ref_id = '130'
  
  update reference
  set reference_group = 'RequirementStatus'
  where reference_group = 'Status' and app_type_ref_id = '131'
  
  update reference
  set reference_group = 'ImplementationStatus'
  where reference_group = 'Status' and app_type_ref_id = '132'
  
  update reference
  set reference_group = 'TestCaseStatus'
  where reference_group = 'Status' and app_type_ref_id = '133'

  update reference
  set reference_group = 'FeatureVersion'
  where reference_group = 'Version' and app_type_ref_id = '129'
  
  update reference
  set reference_group = 'DesignVersion'
  where reference_group = 'Version' and app_type_ref_id = '130'
  
  update reference
  set reference_group = 'RequirementVersion'
  where reference_group = 'Version' and app_type_ref_id = '131'
  
  update reference
  set reference_group = 'ImplementationVersion'
  where reference_group = 'Version' and app_type_ref_id = '132'
  
  update reference
  set reference_group = 'TestCaseVersion'
  where reference_group = 'Version' and app_type_ref_id = '133'

-- add new default reference data for 0 valued artifact columns and update artifacts to use new default
INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10000,'Complexity', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set complexity_ref_id = 10000
where complexity_ref_id = 0

update artifact_history
set complexity_ref_id = 10000
where complexity_ref_id = 0

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10001,'ComponentType', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set component_type_ref_id = 10001
where component_type_ref_id = 0

update artifact_history
set component_type_ref_id = 10001
where component_type_ref_id = 0

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10002,'FeatureVersion', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set version_ref_id = 10002
where version_ref_id = 0 and class = '129'

update artifact_history
set version_ref_id = 10002
where version_ref_id = 0 and artifact_ref_id = '129'

update artifact
set planned_version_ref_id = 10002
where planned_version_ref_id = 0 and class = '129'

update artifact_history
set planned_version_ref_id = 10002
where planned_version_ref_id = 0 and artifact_ref_id = '129'


INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10003,'RequirementVersion', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set version_ref_id = 10003
where version_ref_id = 0 and class = '131'

update artifact_history
set version_ref_id = 10003
where version_ref_id = 0 and artifact_ref_id = '131'

update artifact
set planned_version_ref_id = 10003
where planned_version_ref_id = 0 and class = '131'

update artifact_history
set planned_version_ref_id = 10003
where planned_version_ref_id = 0 and artifact_ref_id = '131'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10004,'DesignVersion', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set version_ref_id = 10004
where version_ref_id = 0 and class = '130'

update artifact_history
set version_ref_id = 10004
where version_ref_id = 0 and artifact_ref_id = '130'

update artifact
set planned_version_ref_id = 10004
where planned_version_ref_id = 0 and class = '130'

update artifact_history
set planned_version_ref_id = 10004
where planned_version_ref_id = 0 and artifact_ref_id = '130'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10005,'ImplementationVersion', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set version_ref_id = 10005
where version_ref_id = 0 and class = '132'

update artifact_history
set version_ref_id = 10005
where version_ref_id = 0 and artifact_ref_id = '132'

update artifact
set planned_version_ref_id = 10005
where planned_version_ref_id = 0 and class = '132'

update artifact_history
set planned_version_ref_id = 10005
where planned_version_ref_id = 0 and artifact_ref_id = '132'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10006,'TestCaseVersion', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set version_ref_id = 10006
where version_ref_id = 0 and class = '133'

update artifact_history
set version_ref_id = 10006
where version_ref_id = 0 and artifact_ref_id = '133'

update artifact
set planned_version_ref_id = 10006
where planned_version_ref_id = 0 and class = '133'

update artifact_history
set planned_version_ref_id = 10006
where planned_version_ref_id = 0 and artifact_ref_id = '133'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10007,'DesignPriority', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set priority_ref_id = 10007
where priority_ref_id = 0 and class = '130'

update artifact_history
set priority_ref_id = 10007
where priority_ref_id = 0 and artifact_ref_id = '130'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10008,'ImplementationPriority', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set priority_ref_id = 10008
where priority_ref_id = 0 and class = '132'

update artifact_history
set priority_ref_id = 10008
where priority_ref_id = 0 and artifact_ref_id = '132'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10009,'RequirementPriority', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set priority_ref_id = 10009
where priority_ref_id = 0 and class = '131'

update artifact_history
set priority_ref_id = 10009
where priority_ref_id = 0 and artifact_ref_id = '131'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10010,'TestCasePriority', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set priority_ref_id = 10010
where priority_ref_id = 0 and class = '133'

update artifact_history
set priority_ref_id = 10010
where priority_ref_id = 0 and artifact_ref_id = '133'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10011,'FeaturePriority', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set priority_ref_id = 10011
where priority_ref_id = 0 and class = '129'

update artifact_history
set priority_ref_id = 10011
where priority_ref_id = 0 and artifact_ref_id = '129'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10012,'DesignStatus', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set status_ref_id = 10012
where status_ref_id = 0 and class = '130'

update artifact_history
set status_ref_id = 10012
where status_ref_id = 0 and artifact_ref_id = '130'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10013,'ImplementationStatus', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set status_ref_id = 10013
where status_ref_id = 0 and class = '132'

update artifact_history
set status_ref_id = 10013
where status_ref_id = 0 and artifact_ref_id = '132'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10014,'RequirementStatus', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set status_ref_id = 10014
where status_ref_id = 0 and class = '131'

update artifact_history
set status_ref_id = 10014
where status_ref_id = 0 and artifact_ref_id = '131'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10015,'TestCaseStatus', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set status_ref_id = 10015
where status_ref_id = 0 and class = '133'

update artifact_history
set status_ref_id = 10015
where status_ref_id = 0 and artifact_ref_id = '133'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10016,'FeatureStatus', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set status_ref_id = 10016
where status_ref_id = 0 and class = '129'

update artifact_history
set status_ref_id = 10016
where status_ref_id = 0 and artifact_ref_id = '129'

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10017,'ArtifactLevel', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set artifact_level_ref_id = 10017
where artifact_level_ref_id = 0

update artifact_history
set artifact_level_ref_id = 10017
where artifact_level_ref_id = 0

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10018,'Category', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set category_ref_id = 10018
where category_ref_id = 0

update artifact_history
set category_ref_id = 10018
where category_ref_id = 0

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10019,'Module', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set module_ref_id = 10019
where module_ref_id = 0

update artifact_history
set module_ref_id = 10019
where module_ref_id = 0

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10020,'OriginCategory', '- SELECT -', 0, '- Select -', '- Select -', 1)

update artifact
set origin_category_ref_id = 10020
where origin_category_ref_id = 0

update artifact_history
set origin_category_ref_id = 10020
where origin_category_ref_id = 0

INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10021,'UserGroup', '- SELECT -', 0, '- Select -', '- Select -', 1)

INSERT INTO application_user
   (user_id, first_name,last_name,display_name,user_login, password, email)
VALUES (10022,'N/A', 'N/A','- Select -', '- SELECT -', NULL, null)

INSERT INTO application_user_group
   (application_user_group_id, user_id,user_group_ref_id,email)
VALUES (10023,10022, 10021,null)

update artifact
set assigned_user_group_id = 10023
where assigned_user_group_id = 0

update artifact_history
set assigned_user_group_id = 10023
where assigned_user_group_id = 0


--INSERT INTO project
  -- (project_id, project_name)
--VALUES (10024,'- Select -')


INSERT INTO baseline
   (baseline_id, product_ref_id, baseline_name)
VALUES (10025,10024,'- Select -')

update artifact
set last_updated_baseline_id = 10025
where last_updated_baseline_id = 0

update artifact_history
set last_updated_baseline_id = 10025
where last_updated_baseline_id = 0

update artifact_history
set baseline_id = 10025
where baseline_id = 0

delete from application_setting where application_setting_id=0

-- DesignStatus=10012, class = '130'
-- ImplementationStatus = 10013, class = '132'
-- RequirementStatus= 10014, class = '131'
-- TestCaseStatus= 10015, class = '133'
-- FeatureStatus, = 10016, class = '129'

--FIXME: IS THERE A NEED TO UPDATE STATUS VALUES ON ARTIFACT?

-- copy product_ref_id from reference table to new project table


--missing create_user_id, update_user_id,update_count,active_ind,version
INSERT INTO project (project_id,project_name,project_code,project_start_date, create_dt,update_dt,system_assigned_version_nbr)
select ref_id,display, display_code,create_dt,create_dt,update_dt, system_assigned_version_nbr
from reference where reference_group = 'Product'

--insert all the application control records
-- initial active design controls
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height)
VALUES (10026,1,'Artifact Name','Artifact Name', 1, 'DesignArtifact.artifact_name', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10027, 2,'Artifact Number','Artifact Number', 1, 'DesignArtifact.artifact_nbr', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10034, 3,'Priority','Priority', 1, 'DesignArtifact.priority_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10028, 4,'Status','Status', 1, 'DesignArtifact.status_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10045, 5,'Category','Category', 1, 'DesignArtifact.category_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10033, 6,'Version','Version', 1, 'DesignArtifact.version_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10029, 7,'Description','Description', 1, 'DesignArtifact.description', 30)

-- initial inactive design controls
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10030, 5,'Sequence','Sequence', 0, 'DesignArtifact.artifact_seq', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10031, 6,'Author','Author', 0, 'DesignArtifact.author_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10032, 7,'Planned Version','Planned Version', 0, 'DesignArtifact.planned_version_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10035, 10,'Effort','Effort', 0, 'DesignArtifact.effort', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10036, 11,'Module','Module', 0, 'DesignArtifact.module_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10037, 12,'Complexity','Complexity', 0, 'DesignArtifact.complexity_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10038, 13,'Assigned User','Assigned User', 0, 'DesignArtifact.assigned_user', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10039, 14,'Assigned User Group','Assigned User Group', 0, 'DesignArtifact.assigned_user_group', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10040, 15,'Origin','Origin', 0, 'DesignArtifact.origin', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10041, 16,'Change Made','Change Made', 0, 'DesignArtifact.change_made', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10042, 17,'Change Reason','Change Reason', 0, 'DesignArtifact.change_reason', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10043, 18,'Component Type','Component Type', 0, 'DesignArtifact.component_type_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10044, 19,'Summary','Summary', 0, 'DesignArtifact.summary', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10046, 21,'Origin Category','Origin Category', 0, 'DesignArtifact.origin_category_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10047, 22,'Removed','Removed', 0, 'DesignArtifact.removed_ind', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10048, 23,'Rationale','Rationale', 0, 'DesignArtifact.rationale', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10049, 24,'Goal','Goal', 0, 'DesignArtifact.goal', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10050, 25,'Context','Context', 0, 'DesignArtifact.context', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10051, 26,'Pre-Condition','Pre-Condition', 0, 'DesignArtifact.precondition', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10052, 27,'Post-Condition','Post-Condition', 0, 'DesignArtifact.postcondition', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10053, 28,'Artifact Level','Artifact Level', 0, 'DesignArtifact.artifact_level_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10054, 29,'External References','External References', 0, 'DesignArtifact.external_references', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10055, 30,'Custom Integer 1','Custom Integer 1', 0, 'DesignArtifact.custom_int1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10056, 31,'Custom Integer 2','Custom Integer 2', 0, 'DesignArtifact.custom_int2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10057, 32,'Custom Memo 1','Custom Memo 1', 0, 'DesignArtifact.custom_memo1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10058, 33,'Custom Memo 2','Custom Memo 2', 0, 'DesignArtifact.custom_memo2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10059, 34,'Custom Text 1','Custom Text 1', 0, 'DesignArtifact.custom_text1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10060, 35,'Custom Text 2','Custom Text 2', 0, 'DesignArtifact.custom_text2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10061, 36,'Custom Text 3','Custom Text 3', 0, 'DesignArtifact.custom_text3', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10062, 37,'Custom Text 4','Custom Text 4', 0, 'DesignArtifact.custom_text4', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10063, 38,'Custom Reference 1','Custom Reference 1', 0, 'DesignArtifact.custom1_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10064, 39,'Custom Reference 2','Custom Reference 2', 0, 'DesignArtifact.custom2_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10065, 40,'Custom Reference 3','Custom Reference 3', 0, 'DesignArtifact.custom3_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10066, 41,'Custom Reference 4','Custom Reference 4', 0, 'DesignArtifact.custom4_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10067, 42,'Custom Double 1','Custom Double 1', 0, 'DesignArtifact.custom_double1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10068, 43,'Custom Date 1','Custom Date 1', 0, 'DesignArtifact.custom_date1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10069, 44,'Custom Date 2','Custom Date 2', 0, 'DesignArtifact.custom_date2', 30)

update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='DESIGN')
WHERE init_script like 'DesignArtifact%'

--active testcase controls
INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height)
VALUES (10071,1,'Artifact Name','Artifact Name', 1, 'TestCaseArtifact.artifact_name', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10072, 2,'Artifact Number','Artifact Number', 1, 'TestCaseArtifact.artifact_nbr', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10073, 3,'Status','Status', 1, 'TestCaseArtifact.status_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10074, 4,'Purpose','Purpose', 1, 'TestCaseArtifact.goal', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10075, 5,'Prerequisite','Prerequisite', 1, 'TestCaseArtifact.precondition', 30)
--************************** FIXME STEPS REQUIRES UPDATE
--steps
--INSERT INTO application_control
--   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
--VALUES (10076, 6,'Steps','Step', 1, '', 30)
--************************** STEPS REQUIRES UPDATE
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10077, 7,'Expected Results','Expected Results', 1, 'TestCaseArtifact.postcondition', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10078, 8,'Test Data','Test Data', 1, 'TestCaseArtifact.context', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10079, 9,'Notes','Notes', 1, 'TestCaseArtifact.description', 30)



-- initial inactive testcase controls
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10080, 3,'Priority','Priority', 0, 'TestCaseArtifact.priority_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10081, 5,'Category','Category', 0, 'TestCaseArtifact.category_ref', 30)
   INSERT INTO application_control
    (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
 VALUES (10082, 6,'Version','Version', 0, 'TestCaseArtifact.version_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10083, 5,'Sequence','Sequence', 0, 'TestCaseArtifact.artifact_seq', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10084, 6,'Author','Author', 0, 'TestCaseArtifact.author_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10085, 7,'Planned Version','Planned Version', 0, 'TestCaseArtifact.planned_version_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10086, 10,'Effort','Effort', 0, 'TestCaseArtifact.effort', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10087, 11,'Module','Module', 0, 'TestCaseArtifact.module_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10088, 12,'Complexity','Complexity', 0, 'TestCaseArtifact.complexity_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10089, 13,'Assigned User','Assigned User', 0, 'TestCaseArtifact.assigned_user', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10090, 14,'Assigned User Group','Assigned User Group', 0, 'TestCaseArtifact.assigned_user_group', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10091, 15,'Origin','Origin', 0, 'TestCaseArtifact.origin', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10092, 16,'Change Made','Change Made', 0, 'TestCaseArtifact.change_made', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10093, 17,'Change Reason','Change Reason', 0, 'TestCaseArtifact.change_reason', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10094, 18,'Component Type','Component Type', 0, 'TestCaseArtifact.component_type_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10095, 19,'Summary','Summary', 0, 'TestCaseArtifact.summary', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10096, 21,'Origin Category','Origin Category', 0, 'TestCaseArtifact.origin_category_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10097, 22,'Removed','Removed', 0, 'TestCaseArtifact.removed_ind', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10098, 23,'Rationale','Rationale', 0, 'TestCaseArtifact.rationale', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10099, 28,'Artifact Level','Artifact Level', 0, 'TestCaseArtifact.artifact_level_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10100, 29,'External References','External References', 0, 'TestCaseArtifact.external_references', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10101, 30,'Custom Integer 1','Custom Integer 1', 0, 'TestCaseArtifact.custom_int1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10102, 31,'Custom Integer 2','Custom Integer 2', 0, 'TestCaseArtifact.custom_int2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10103, 32,'Custom Memo 1','Custom Memo 1', 0, 'TestCaseArtifact.custom_memo1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10104, 33,'Custom Memo 2','Custom Memo 2', 0, 'TestCaseArtifact.custom_memo2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10105, 34,'Custom Text 1','Custom Text 1', 0, 'TestCaseArtifact.custom_text1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10106, 35,'Custom Text 2','Custom Text 2', 0, 'TestCaseArtifact.custom_text2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10107, 36,'Custom Text 3','Custom Text 3', 0, 'TestCaseArtifact.custom_text3', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10108, 37,'Custom Text 4','Custom Text 4', 0, 'TestCaseArtifact.custom_text4', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10109, 38,'Custom Reference 1','Custom Reference 1', 0, 'TestCaseArtifact.custom1_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10110, 39,'Custom Reference 2','Custom Reference 2', 0, 'TestCaseArtifact.custom2_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10111, 40,'Custom Reference 3','Custom Reference 3', 0, 'TestCaseArtifact.custom3_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10112, 41,'Custom Reference 4','Custom Reference 4', 0, 'TestCaseArtifact.custom4_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10113, 42,'Custom Double 1','Custom Double 1', 0, 'TestCaseArtifact.custom_double1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10114, 43,'Custom Date 1','Custom Date 1', 0, 'TestCaseArtifact.custom_date1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10115, 44,'Custom Date 2','Custom Date 2', 0, 'TestCaseArtifact.custom_date2', 30)

update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='TESTCASE')
WHERE init_script like 'TestCaseArtifact%'

--UPDATE ARTIFACT DISCRIMINATOR CLASS FIELD FROM MEANINGLESS INT TO MORE USEFUL STRING
update artifact set class = 'FeatureArtifact' where class = '129'
update artifact set class = 'DesignArtifact' where class = '130'
update artifact set class = 'RequirementArtifact' where class = '131'
update artifact set class = 'ImplementationArtifact' where class = '132'
update artifact set class = 'TestCaseArtifact' where class = '133'

--active requirement controls
INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height)
VALUES (10116,1,'Artifact Name','Artifact Name', 1, 'RequirementArtifact.artifact_name', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10117, 2,'Artifact Number','Artifact Number', 1, 'RequirementArtifact.artifact_nbr', 30)
INSERT INTO application_control
    (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
 VALUES (10127, 3,'Version','Version', 1, 'RequirementArtifact.version_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10125, 4,'Priority','Priority', 1, 'RequirementArtifact.priority_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10118, 5,'Status','Status', 1, 'RequirementArtifact.status_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10133, 6,'Complexity','Complexity', 1, 'RequirementArtifact.complexity_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10134, 7,'Assigned User','Assigned User', 1, 'RequirementArtifact.assigned_user', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10131, 8,'Effort','Effort', 1, 'RequirementArtifact.effort', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10126, 9,'Category','Category', 1, 'RequirementArtifact.category_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10124, 10,'Description','Description', 1, 'RequirementArtifact.description', 260)
--************************** FIXME DETAILS REQUIRES UPDATE
--details
--INSERT INTO application_control
--   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
--VALUES (10121, 11,'Details','Details', 1, '', 30)
--************************** DETAILS REQUIRES UPDATE
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10129, 12,'Author','Author', 1, 'RequirementArtifact.author_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10136, 13,'Origin','Origin', 1, 'RequirementArtifact.origin', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10143, 14,'Rationale','Rationale', 1, 'RequirementArtifact.rationale', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10119, 15,'Goal','Goal', 1, 'RequirementArtifact.goal', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10123, 16,'Context','Context', 1, 'RequirementArtifact.context', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10120, 17,'Precondition','Precondition', 1, 'RequirementArtifact.precondition', 30)
--********************* FIXME main flow?
--********************* FIXME alt flow?
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10122, 20,'Postcondition','PostCondition', 1, 'RequirementArtifact.postcondition', 30)



-- initial inactive requirement controls
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10128, 5,'Sequence','Sequence', 0, 'RequirementArtifact.artifact_seq', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10130, 7,'Planned Version','Planned Version', 0, 'RequirementArtifact.planned_version_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10132, 11,'Module','Module', 0, 'RequirementArtifact.module_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10135, 14,'Assigned User Group','Assigned User Group', 0, 'RequirementArtifact.assigned_user_group', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10137, 16,'Change Made','Change Made', 0, 'RequirementArtifact.change_made', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10138, 17,'Change Reason','Change Reason', 0, 'RequirementArtifact.change_reason', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10139, 18,'Component Type','Component Type', 0, 'RequirementArtifact.component_type_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10140, 19,'Summary','Summary', 0, 'RequirementArtifact.summary', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10141, 21,'Origin Category','Origin Category', 0, 'RequirementArtifact.origin_category_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10142, 22,'Removed','Removed', 0, 'RequirementArtifact.removed_ind', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10144, 28,'Artifact Level','Artifact Level', 0, 'RequirementArtifact.artifact_level_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10145, 29,'External References','External References', 0, 'RequirementArtifact.external_references', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10146, 30,'Custom Integer 1','Custom Integer 1', 0, 'RequirementArtifact.custom_int1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10147, 31,'Custom Integer 2','Custom Integer 2', 0, 'RequirementArtifact.custom_int2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10148, 32,'Custom Memo 1','Custom Memo 1', 0, 'RequirementArtifact.custom_memo1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10149, 33,'Custom Memo 2','Custom Memo 2', 0, 'RequirementArtifact.custom_memo2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10150, 34,'Custom Text 1','Custom Text 1', 0, 'RequirementArtifact.custom_text1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10151, 35,'Custom Text 2','Custom Text 2', 0, 'RequirementArtifact.custom_text2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10152, 36,'Custom Text 3','Custom Text 3', 0, 'RequirementArtifact.custom_text3', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10153, 37,'Custom Text 4','Custom Text 4', 0, 'RequirementArtifact.custom_text4', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10154, 38,'Custom Reference 1','Custom Reference 1', 0, 'RequirementArtifact.custom1_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10155, 39,'Custom Reference 2','Custom Reference 2', 0, 'RequirementArtifact.custom2_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10156, 40,'Custom Reference 3','Custom Reference 3', 0, 'RequirementArtifact.custom3_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10157, 41,'Custom Reference 4','Custom Reference 4', 0, 'RequirementArtifact.custom4_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10158, 42,'Custom Double 1','Custom Double 1', 0, 'RequirementArtifact.custom_double1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10159, 43,'Custom Date 1','Custom Date 1', 0, 'RequirementArtifact.custom_date1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10160, 44,'Custom Date 2','Custom Date 2', 0, 'RequirementArtifact.custom_date2', 30)

update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='REQUIREMENT')
WHERE init_script like 'RequirementArtifact%'

--active feature controls
INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height)
VALUES (10161,1,'Artifact Name','Artifact Name', 1, 'FeatureArtifact.artifact_name', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10162, 2,'Artifact Number','Artifact Number', 1, 'FeatureArtifact.artifact_nbr', 30)
INSERT INTO application_control
    (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
 VALUES (10163, 3,'Version','Version', 1, 'FeatureArtifact.version_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10164, 4,'Priority','Priority', 1, 'FeatureArtifact.priority_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10165, 5,'Status','Status', 1, 'FeatureArtifact.status_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10170, 6,'Description','Description', 1, 'FeatureArtifact.description', 30)


-- initial inactive feature controls
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10166, 6,'Complexity','Complexity', 0, 'FeatureArtifact.complexity_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10167, 7,'Assigned User','Assigned User', 0, 'FeatureArtifact.assigned_user', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10168, 8,'Effort','Effort', 0, 'FeatureArtifact.effort', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10169, 9,'Category','Category', 0, 'FeatureArtifact.category_ref', 30)
--************************** FIXME DETAILS REQUIRES UPDATE
--details
--INSERT INTO application_control
--   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
--VALUES (10171, 11,'Details','Details', 0, '', 30)
--************************** DETAILS REQUIRES UPDATE
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10172, 12,'Author','Author', 0, 'FeatureArtifact.author_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10173, 13,'Origin','Origin', 0, 'FeatureArtifact.origin', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10174, 14,'Rationale','Rationale', 0, 'FeatureArtifact.rationale', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10175, 15,'Goal','Goal', 0, 'FeatureArtifact.goal', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10176, 16,'Context','Context', 0, 'FeatureArtifact.context', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10177, 17,'Precondition','Precondition', 0, 'FeatureArtifact.precondition', 30)
--********************* FIXME main flow?
--********************* FIXME alt flow?
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10178, 20,'Postcondition','PostCondition', 0, 'FeatureArtifact.postcondition', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10179, 5,'Sequence','Sequence', 0, 'FeatureArtifact.artifact_seq', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10180, 7,'Planned Version','Planned Version', 0, 'FeatureArtifact.planned_version_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10181, 11,'Module','Module', 0, 'FeatureArtifact.module_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10182, 14,'Assigned User Group','Assigned User Group', 0, 'FeatureArtifact.assigned_user_group', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10183, 16,'Change Made','Change Made', 0, 'FeatureArtifact.change_made', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10184, 17,'Change Reason','Change Reason', 0, 'FeatureArtifact.change_reason', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10185, 18,'Component Type','Component Type', 0, 'FeatureArtifact.component_type_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10186, 19,'Summary','Summary', 0, 'FeatureArtifact.summary', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10187, 21,'Origin Category','Origin Category', 0, 'FeatureArtifact.origin_category_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10188, 22,'Removed','Removed', 0, 'FeatureArtifact.removed_ind', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10189, 28,'Artifact Level','Artifact Level', 0, 'FeatureArtifact.artifact_level_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10190, 29,'External References','External References', 0, 'FeatureArtifact.external_references', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10191, 30,'Custom Integer 1','Custom Integer 1', 0, 'FeatureArtifact.custom_int1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10192, 31,'Custom Integer 2','Custom Integer 2', 0, 'FeatureArtifact.custom_int2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10193, 32,'Custom Memo 1','Custom Memo 1', 0, 'FeatureArtifact.custom_memo1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10194, 33,'Custom Memo 2','Custom Memo 2', 0, 'FeatureArtifact.custom_memo2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10195, 34,'Custom Text 1','Custom Text 1', 0, 'FeatureArtifact.custom_text1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10196, 35,'Custom Text 2','Custom Text 2', 0, 'FeatureArtifact.custom_text2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10197, 36,'Custom Text 3','Custom Text 3', 0, 'FeatureArtifact.custom_text3', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10198, 37,'Custom Text 4','Custom Text 4', 0, 'FeatureArtifact.custom_text4', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10199, 38,'Custom Reference 1','Custom Reference 1', 0, 'FeatureArtifact.custom1_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10200, 39,'Custom Reference 2','Custom Reference 2', 0, 'FeatureArtifact.custom2_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10201, 40,'Custom Reference 3','Custom Reference 3', 0, 'FeatureArtifact.custom3_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10202, 41,'Custom Reference 4','Custom Reference 4', 0, 'FeatureArtifact.custom4_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10203, 42,'Custom Double 1','Custom Double 1', 0, 'FeatureArtifact.custom_double1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10204, 43,'Custom Date 1','Custom Date 1', 0, 'FeatureArtifact.custom_date1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10205, 44,'Custom Date 2','Custom Date 2', 0, 'FeatureArtifact.custom_date2', 30)

update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='FEATURE')
WHERE init_script like 'FeatureArtifact%'

--active implementation controls
INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height)
VALUES (10206, 1,'Artifact Name','Artifact Name', 1, 'ImplementationArtifact.artifact_name', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10207, 2,'Artifact Number','Artifact Number', 1, 'ImplementationArtifact.artifact_nbr', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10215, 3,'Category','Category', 1, 'ImplementationArtifact.category_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10210, 4,'Status','Status', 1, 'ImplementationArtifact.status_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10211, 5,'Description','Description', 1, 'ImplementationArtifact.description', 30)


-- initial inactive implementation controls
INSERT INTO application_control
    (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
 VALUES (10208, 3,'Version','Version', 0, 'ImplementationArtifact.version_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10209, 4,'Priority','Priority', 0, 'ImplementationArtifact.priority_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10212, 6,'Complexity','Complexity', 0, 'ImplementationArtifact.complexity_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10213, 7,'Assigned User','Assigned User', 0, 'ImplementationArtifact.assigned_user', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10214, 8,'Effort','Effort', 0, 'ImplementationArtifact.effort', 30)
--************************** FIXME DETAILS REQUIRES UPDATE
--details
--INSERT INTO application_control
--   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
--VALUES (10216, 11,'Details','Details', 0, '', 30)
--************************** DETAILS REQUIRES UPDATE
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10217, 12,'Author','Author', 0, 'ImplementationArtifact.author_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10218, 13,'Origin','Origin', 0, 'ImplementationArtifact.origin', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10219, 14,'Rationale','Rationale', 0, 'ImplementationArtifact.rationale', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10220, 15,'Goal','Goal', 0, 'ImplementationArtifact.goal', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10221, 16,'Context','Context', 0, 'ImplementationArtifact.context', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10222, 17,'Precondition','Precondition', 0, 'ImplementationArtifact.precondition', 30)
--********************* FIXME main flow?
--********************* FIXME alt flow?
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10223, 20,'Postcondition','PostCondition', 0, 'ImplementationArtifact.postcondition', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10224, 5,'Sequence','Sequence', 0, 'ImplementationArtifact.artifact_seq', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10225, 7,'Planned Version','Planned Version', 0, 'ImplementationArtifact.planned_version_ref', 30)
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10226, 11,'Module','Module', 0, 'ImplementationArtifact.module_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10227, 14,'Assigned User Group','Assigned User Group', 0, 'ImplementationArtifact.assigned_user_group', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10228, 16,'Change Made','Change Made', 0, 'ImplementationArtifact.change_made', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10229, 17,'Change Reason','Change Reason', 0, 'ImplementationArtifact.change_reason', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10230, 18,'Component Type','Component Type', 0, 'ImplementationArtifact.component_type_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10231, 19,'Summary','Summary', 0, 'ImplementationArtifact.summary', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10232, 21,'Origin Category','Origin Category', 0, 'ImplementationArtifact.origin_category_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10233, 22,'Removed','Removed', 0, 'ImplementationArtifact.removed_ind', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10234, 28,'Artifact Level','Artifact Level', 0, 'ImplementationArtifact.artifact_level_ref', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10235, 29,'External References','External References', 0, 'ImplementationArtifact.external_references', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10236, 30,'Custom Integer 1','Custom Integer 1', 0, 'ImplementationArtifact.custom_int1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10237, 31,'Custom Integer 2','Custom Integer 2', 0, 'ImplementationArtifact.custom_int2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10238, 32,'Custom Memo 1','Custom Memo 1', 0, 'ImplementationArtifact.custom_memo1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10239, 33,'Custom Memo 2','Custom Memo 2', 0, 'ImplementationArtifact.custom_memo2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10240, 34,'Custom Text 1','Custom Text 1', 0, 'ImplementationArtifact.custom_text1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10241, 35,'Custom Text 2','Custom Text 2', 0, 'ImplementationArtifact.custom_text2', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10242, 36,'Custom Text 3','Custom Text 3', 0, 'ImplementationArtifact.custom_text3', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10243, 37,'Custom Text 4','Custom Text 4', 0, 'ImplementationArtifact.custom_text4', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10244, 38,'Custom Reference 1','Custom Reference 1', 0, 'ImplementationArtifact.custom1_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10245, 39,'Custom Reference 2','Custom Reference 2', 0, 'ImplementationArtifact.custom2_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10246, 40,'Custom Reference 3','Custom Reference 3', 0, 'ImplementationArtifact.custom3_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10247, 41,'Custom Reference 4','Custom Reference 4', 0, 'ImplementationArtifact.custom4_ref_id', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10248, 42,'Custom Double 1','Custom Double 1', 0, 'ImplementationArtifact.custom_double1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10249, 43,'Custom Date 1','Custom Date 1', 0, 'ImplementationArtifact.custom_date1', 30)
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10250, 44,'Custom Date 2','Custom Date 2', 0, 'ImplementationArtifact.custom_date2', 30)

update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='IMPLEMENTATION')
WHERE init_script like 'ImplementationArtifact%'

-- need to delete null row as it does not below to any true reference group and causes error condition for ref controller
delete from reference where reference_group='Null'

-- switch values to make more sense (values appear to be reversed in terms of group name)
update reference
SET reference_group ='Role2'
WHERE reference_group = 'Role'

update reference
SET reference_group ='Role'
WHERE reference_group = 'Position'

update reference
SET reference_group ='Position'
WHERE reference_group = 'Role2'

-- delete these reference values as not needed and cause error condition for ref controller
-- may come back later but not until all Form Titles, Field Labels, etc are database-driven
delete from reference where reference_group='FormTitle'
delete from reference where reference_group='Application'
delete from reference where reference_group='Workflow'
delete from reference where reference_group='Action'
delete from reference where reference_group='CustomControl'
delete from reference where reference_group='TableName'
delete from reference where reference_group='ControlType'
delete from reference where reference_group='Controls'
delete from reference where reference_group='View'
delete from reference where reference_group='UserDefinedControl'
delete from reference where reference_group='ReferenceCategory'
delete from reference where reference_group='ModelColumn'
delete from reference where reference_group='FormButtonText'
delete from reference where reference_group='ReferenceRelationship'
delete from reference where reference_group='Product'
delete from reference where reference_group='Style'
-- delete related reference_groups as well
delete from reference_group where reference_group='FormTitle'
delete from reference_group where reference_group='Application'
delete from reference_group where reference_group='Workflow'
delete from reference_group where reference_group='Action'
delete from reference_group where reference_group='CustomControl'
delete from reference_group where reference_group='TableName'
delete from reference_group where reference_group='ControlType'
delete from reference_group where reference_group='Controls'
delete from reference_group where reference_group='View'
delete from reference_group where reference_group='UserDefinedControl'
delete from reference_group where reference_group='ReferenceCategory'
delete from reference_group where reference_group='ModelColumn'
delete from reference_group where reference_group='FormButtonText'
delete from reference_group where reference_group='ReferenceRelationship'
delete from reference_group where reference_group='Product'
delete from reference_group where reference_group='Style'
delete from reference_group where reference_group='Author'


-- add sample reports
INSERT INTO report (report_id,report_ref_id,report_sql,parameter_view_ref_id,sql_parameter_script,xml_report_ind,xml_select_script,xml_sort_script,xml_field_script,xml_image_qual,xml_xpath,report_outline_script,report_outline_sql,outline_last_run_dt,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id,display,description,file_name,report_language_ref_id,query_name) VALUES  (10404,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-11-08 20:24:20.00',0,'2010-11-08 20:24:20.00',0,0,0,10,321,'List Projects','Complete listing of projects','test2',10255,'test2')
INSERT INTO report (report_id,report_ref_id,report_sql,parameter_view_ref_id,sql_parameter_script,xml_report_ind,xml_select_script,xml_sort_script,xml_field_script,xml_image_qual,xml_xpath,report_outline_script,report_outline_sql,outline_last_run_dt,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id,display,description,file_name,report_language_ref_id,query_name) VALUES  (10606,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2010-11-08 20:24:20.00',0,'2010-11-08 20:24:20.00',0,0,0,7,321,'Artifact Summary','Artifact Summary','artifact_summary',10256,'artifact_summary')

--change Report to ReportParamType
  update reference_group
  set reference_group = 'ReportParamType', display='Report Parameter Type',description='Report Parameter Type'
  where reference_group = 'Report'
  
delete from reference where reference_group='Report'

INSERT INTO reference
(ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10251,'ReportParamType',0,'PROJECT',0,'Project','List of Projects as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference
(ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10252,'ReportParamType',0,'STARTDATE',0,'Start Date','State Date for Date Range as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference
(ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10253,'ReportParamType',0,'ENDDATE',0,'End Date','End Date for Date Range as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)

-- add jasper report languages
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10254, 'ReportLanguage', 'Report Language', 'Report Language', 324, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
 
 INSERT INTO reference
 (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10255,'ReportLanguage',0,'SQL',0,'SQL','SQL','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
 INSERT INTO reference
 (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10256,'ReportLanguage',0,'Groovy',0,'Groovy','Groovy','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
 
 --insert reference groups for artifact specific types like priority, etc
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10257, 'DesignPriority', 'Design Priority', 'Design Priority', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10258, 'DesignStatus', 'Design Status', 'Design Status', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10259, 'DesignVersion', 'Design Version', 'Design Version', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
 
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10260, 'FeaturePriority', 'Feature Priority', 'Feature Priority', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10261, 'FeatureStatus', 'Feature Status', 'Feature Status', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10262, 'FeatureVersion', 'Feature Version', 'Feature Version', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)

INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10263, 'ImplementationPriority', 'Implementation Priority', 'Implementation Priority', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10264, 'ImplementationStatus', 'Implementation Status', 'Implementation Status', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10265, 'ImplementationVersion', 'Implementation Version', 'Implementation Version', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)

INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10266, 'RequirementPriority', 'Requirement Priority', 'Requirement Priority', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10267, 'RequirementStatus', 'Requirement Status', 'Requirement Status', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10268, 'RequirementVersion', 'Requirement Version', 'Requirement Version', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
 
 INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10269, 'TestCasePriority', 'TestCase Priority', 'TestCase Priority', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10270, 'TestCaseStatus', 'TestCase Status', 'TestCase Status', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10271, 'TestCaseVersion', 'TestCase Version', 'TestCase Version', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320)
 
 --insert section titles
DECLARE @ref_id INT
SELECT @ref_id=ref_id FROM reference where reference_group = 'artifact' and display_code ='DESIGN'

INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height,control_ref_id)
VALUES (10272,0,'Design Artifact','Design Artifact', 1, 'DesignArtifact.section_title', 30,@ref_id)

SELECT @ref_id=ref_id FROM reference where reference_group = 'artifact' and display_code ='FEATURE'

INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height,control_ref_id)
VALUES (10273,0,'Feature Artifact','Feature Artifact', 1, 'FeatureArtifact.section_title', 30,@ref_id)

SELECT @ref_id=ref_id FROM reference where reference_group = 'artifact' and display_code ='IMPLEMENTATION'

INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height,control_ref_id)
VALUES (10274,0,'Implementation Artifact','Implementation Artifact', 1, 'ImplementationArtifact.section_title', 30,@ref_id)

SELECT @ref_id=ref_id FROM reference where reference_group = 'artifact' and display_code ='REQUIREMENT'

INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height,control_ref_id)
VALUES (10275,0,'Requirement Artifact','Requirement Artifact', 1, 'RequirementArtifact.section_title', 30,@ref_id)

SELECT @ref_id=ref_id FROM reference where reference_group = 'artifact' and display_code ='TESTCASE'

INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height,control_ref_id)
VALUES (10276,0,'Test Case Artifact','Test Case Artifact', 1, 'TestCaseArtifact.section_title', 30,@ref_id)

-- insert report parameters
INSERT INTO report_parameter (report_param_id,report_id,display,description,param_type_ref_id,x_display_sequence,y_display_sequence,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  VALUES(10277,10606,'Project','Project',10251,1,1,'2010-11-08 20:24:20.00',0,'2010-11-08 20:24:20',0,0,0,6,321)
INSERT INTO report_parameter (report_param_id,report_id,display,description,param_type_ref_id,x_display_sequence,y_display_sequence,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  VALUES(10278,10404,'Start Date','Start Date',10252,1,2,'2010-11-08 20:24:20',0,'2010-11-08 20:24:20',0,0,0,3,321)
INSERT INTO report_parameter (report_param_id,report_id,display,description,param_type_ref_id,x_display_sequence,y_display_sequence,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  VALUES(10279,10404,'End Date','End Date',10253,1,3,'2010-11-08 20:24:20',0,'2010-11-08 20:24:20',0,0,0,3,321)
INSERT INTO report_parameter (report_param_id,report_id,display,description,param_type_ref_id,x_display_sequence,y_display_sequence,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  VALUES(10280,10404,'Project','Project',10251,1,1,'2010-11-08 20:24:20',0,'2010-11-08 20:24:20',0,0,0,1,321)

--resolve artifact errors: Null value was assigned to a property of primitive type setter of 
update artifact
SET custom1_ref_id = 0
WHERE custom1_ref_id is null

update artifact
SET custom2_ref_id = 0
WHERE custom2_ref_id is null

update artifact
SET custom3_ref_id = 0
WHERE custom3_ref_id is null

update artifact
SET custom4_ref_id = 0
WHERE custom4_ref_id is null

update artifact
SET custom_double1 = 0
WHERE custom_double1 is null

update artifact
SET custom_int1 = 0
WHERE custom_int1 is null

update artifact
SET custom_int2 = 0
WHERE custom_int2 is null

-- row for pks
  INSERT INTO hi_value
   (next_value)
VALUES (20000)
