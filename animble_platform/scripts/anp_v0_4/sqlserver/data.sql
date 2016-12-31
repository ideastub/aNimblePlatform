--Remove unnecessary system info groups and values
DELETE FROM reference_group where reference_group='SystemInfo';
DELETE FROM reference where reference_group='SystemInfo';

--THE BELOW STATEMENTS WERE OFFERED AS A BUG FIX FOR V_03 SO THEY MAY FAIL IF INSERTED PREVIOUSLY. JUST COMMENT THEM OUT OR DELETE THEM.
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10042,'/release/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10043,'/artifactHistory/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10044,'/artifactTree/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10045,'/reportQuery/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

--add reference for project status group and reference values, and synce complete vs completed reference values
INSERT INTO reference_group (reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10326,'ProjectStatus','Project Status','Project Status',326,343,1,0,'2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES  (10356,'ProjectStatus',0,'- SELECT -',0,'- Select -','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES  (10357,'ProjectStatus',0,'NOTSTARTED',1,'Not Started','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES  (10358,'ProjectStatus',0,'INPROGRESS',2,'In Progress','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES  (10359,'ProjectStatus',0,'COMPLETE',3,'Complete','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);

update reference set display='Complete',description='Complete' where display='Completed';

-- set projects project_status to default value
update project set project_status_ref_id=10356;

-- align artifact status values
--SELECT * FROM reference where reference_group = 'DesignStatus' or reference_group = 'FeatureStatus' or reference_group = 'ImplementationStatus' or reference_group = 'ProductBacklogStatus' or reference_group = 'RequirementStatus' or reference_group = 'TaskStatus' or reference_group = 'TestCaseStatus' order by reference_group;

UPDATE reference SET DISPLAY_CODE = 'ASSIGNED' where reference_group = 'DesignStatus' and display_code = 'DESIGNASSIGNED';
UPDATE reference SET DISPLAY_CODE = 'COMPLETE' where reference_group = 'DesignStatus' and display_code = 'DESIGNCOMPLETED';
UPDATE reference SET DISPLAY_CODE = 'UNASSIGNED' where reference_group = 'DesignStatus' and display_code = 'DESIGNUNASSIGNED';

UPDATE reference SET DISPLAY_CODE = 'APPROVED' where reference_group = 'FeatureStatus' and display_code = 'FEATUREAPPROVED';
UPDATE reference SET DISPLAY_CODE = 'COMPLETE' where reference_group = 'FeatureStatus' and display_code = 'FEATURECOMPLETED';
UPDATE reference SET DISPLAY_CODE = 'SUBMITTED' where reference_group = 'FeatureStatus' and display_code = 'FEATURESUBMITTED';

UPDATE reference SET DISPLAY_CODE = 'ASSIGNED' where reference_group = 'ImplementationStatus' and display_code = 'IMPLEMENTATIONASSIGNED';
UPDATE reference SET DISPLAY_CODE = 'COMPLETE' where reference_group = 'ImplementationStatus' and display_code = 'IMPLEMENTATIONCOMPLETED';
UPDATE reference SET DISPLAY_CODE = 'UNASSIGNED' where reference_group = 'ImplementationStatus' and display_code = 'IMPLEMENTATIONUNASSIGNED';
UPDATE reference SET DISPLAY_CODE = 'UNITTESTED' where reference_group = 'ImplementationStatus' and display_code = 'IMPLEMENTATIONUNITTESTED';

UPDATE reference SET DISPLAY_CODE = 'APPROVED' where reference_group = 'RequirementStatus' and display_code = 'REQUIREMENTAPPROVED';
UPDATE reference SET DISPLAY_CODE = 'COMPLETE' where reference_group = 'RequirementStatus' and display_code = 'REQUIREMENTCOMPLETED';
UPDATE reference SET DISPLAY_CODE = 'SUBMITTED' where reference_group = 'RequirementStatus' and display_code = 'REQUIREMENTSUBMITTED';

UPDATE reference SET DISPLAY_CODE = 'ASSIGNED' where reference_group = 'TestCaseStatus' and display_code = 'TESTCASEASSIGNED';
UPDATE reference SET DISPLAY_CODE = 'UNASSIGNED' where reference_group = 'TestCaseStatus' and display_code = 'TESTCASEUNASSIGNED';

-- insert privilege for user to access search and dashboard
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10046,'/search/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10047,'/dashboard/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);