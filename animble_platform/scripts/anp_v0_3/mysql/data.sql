# add new default reference data for 0 valued customref columns and update artifacts to use new default
INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10331,'CustomRef1', '- SELECT -', 0, '- Select -', '- Select -', 1);
INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10332,'CustomRef2', '- SELECT -', 0, '- Select -', '- Select -', 1);
INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10333,'CustomRef3', '- SELECT -', 0, '- Select -', '- Select -', 1);
INSERT INTO reference
   (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr)
VALUES (10334,'CustomRef4', '- SELECT -', 0, '- Select -', '- Select -', 1);

update artifact
set custom1_ref_id = 10331
where custom1_ref_id = 0;

update artifact
set custom2_ref_id = 10332
where custom2_ref_id = 0;

update artifact
set custom3_ref_id = 10333
where custom3_ref_id = 0;

update artifact
set custom4_ref_id = 10334
where custom4_ref_id = 0;

# update view controls to use custom ref lists
update application_control
set init_script = 'TestCaseArtifact.custom1_ref'
where init_script = 'TestCaseArtifact.custom1_ref_id';
update application_control
set init_script = 'TestCaseArtifact.custom2_ref'
where init_script = 'TestCaseArtifact.custom2_ref_id';
update application_control
set init_script = 'TestCaseArtifact.custom3_ref'
where init_script = 'TestCaseArtifact.custom3_ref_id';
update application_control
set init_script = 'TestCaseArtifact.custom4_ref'
where init_script = 'TestCaseArtifact.custom4_ref_id';

update application_control
set init_script = 'TaskArtifact.custom1_ref'
where init_script = 'TaskArtifact.custom1_ref_id';
update application_control
set init_script = 'TaskArtifact.custom2_ref'
where init_script = 'TaskArtifact.custom2_ref_id';
update application_control
set init_script = 'TaskArtifact.custom3_ref'
where init_script = 'TaskArtifact.custom3_ref_id';
update application_control
set init_script = 'TaskArtifact.custom4_ref'
where init_script = 'TaskArtifact.custom4_ref_id';

update application_control
set init_script = 'RequirementArtifact.custom1_ref'
where init_script = 'RequirementArtifact.custom1_ref_id';
update application_control
set init_script = 'RequirementArtifact.custom2_ref'
where init_script = 'RequirementArtifact.custom2_ref_id';
update application_control
set init_script = 'RequirementArtifact.custom3_ref'
where init_script = 'RequirementArtifact.custom3_ref_id';
update application_control
set init_script = 'RequirementArtifact.custom4_ref'
where init_script = 'RequirementArtifact.custom4_ref_id';

update application_control
set init_script = 'ProductBacklogArtifact.custom1_ref'
where init_script = 'ProductBacklogArtifact.custom1_ref_id';
update application_control
set init_script = 'ProductBacklogArtifact.custom2_ref'
where init_script = 'ProductBacklogArtifact.custom2_ref_id';
update application_control
set init_script = 'ProductBacklogArtifact.custom3_ref'
where init_script = 'ProductBacklogArtifact.custom3_ref_id';
update application_control
set init_script = 'ProductBacklogArtifact.custom4_ref'
where init_script = 'ProductBacklogArtifact.custom4_ref_id';

update application_control
set init_script = 'ImplementationArtifact.custom1_ref'
where init_script = 'ImplementationArtifact.custom1_ref_id';
update application_control
set init_script = 'ImplementationArtifact.custom2_ref'
where init_script = 'ImplementationArtifact.custom2_ref_id';
update application_control
set init_script = 'ImplementationArtifact.custom3_ref'
where init_script = 'ImplementationArtifact.custom3_ref_id';
update application_control
set init_script = 'ImplementationArtifact.custom4_ref'
where init_script = 'ImplementationArtifact.custom4_ref_id';

update application_control
set init_script = 'FeatureArtifact.custom1_ref'
where init_script = 'FeatureArtifact.custom1_ref_id';
update application_control
set init_script = 'FeatureArtifact.custom2_ref'
where init_script = 'FeatureArtifact.custom2_ref_id';
update application_control
set init_script = 'FeatureArtifact.custom3_ref'
where init_script = 'FeatureArtifact.custom3_ref_id';
update application_control
set init_script = 'FeatureArtifact.custom4_ref'
where init_script = 'FeatureArtifact.custom4_ref_id';

update application_control
set init_script = 'DesignArtifact.custom1_ref'
where init_script = 'DesignArtifact.custom1_ref_id';
update application_control
set init_script = 'DesignArtifact.custom2_ref'
where init_script = 'DesignArtifact.custom2_ref_id';
update application_control
set init_script = 'DesignArtifact.custom3_ref'
where init_script = 'DesignArtifact.custom3_ref_id';
update application_control
set init_script = 'DesignArtifact.custom4_ref'
where init_script = 'DesignArtifact.custom4_ref_id';

# set discriminator for all current sprints in release table
update `project_release` set class='Sprint';

#add reference for release status group and reference values
INSERT INTO reference_group (reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  VALUES (10324,'ReleaseStatus','Release Status','Release Status',326,343,1,0,'2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10335,'ReleaseStatus',0,'- SELECT -',0,'- Select -','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10336,'ReleaseStatus',0,'NOTSTARTED',1,'Not Started','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10337,'ReleaseStatus',0,'INPROGRESS',2,'In Progress','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10338,'ReleaseStatus',0,'COMPLETE',3,'Complete','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);

#add release to field controls and adjust order of any necessary controls
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height,create_dt)
VALUES (10366, 8,'Release','Release', 1, 'ProductBacklogArtifact.release', 30,'2007-12-31 22:28:13');
update application_control set display_sequence=9 where init_script='ProductBacklogArtifact.description';

INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height,create_dt)
VALUES (10367, 5,'Release','Release', 1, 'RequirementArtifact.release', 30,'2007-12-31 22:28:13');

INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height,create_dt)
VALUES (10368, 6,'Release','Release', 1, 'FeatureArtifact.release', 30,'2007-12-31 22:28:13');
update application_control set display_sequence=7 where init_script='FeatureArtifact.description';

#release not visible on the following
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height,create_dt)
VALUES (10369, 4,'Release','Release', 0, 'DesignArtifact.release', 30,'2007-12-31 22:28:13');
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height,create_dt)
VALUES (10370, 4,'Release','Release', 0, 'TestCaseArtifact.release', 30,'2007-12-31 22:28:13');
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height,create_dt)
VALUES (10371, 4,'Release','Release', 0, 'ImplementationArtifact.release', 30,'2007-12-31 22:28:13');
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height,create_dt)
VALUES (10372, 4,'Release','Release', 0, 'TaskArtifact.release', 30,'2007-12-31 22:28:13');

update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='PRODUCTBACKLOG')
WHERE init_script like 'ProductBacklog%';
update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='TASK')
WHERE init_script like 'Task%';
update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='FEATURE')
WHERE init_script like 'Feature%';
update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='DESIGN')
WHERE init_script like 'Design%';
update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='REQUIREMENT')
WHERE init_script like 'Requirement%';
update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='IMPLEMENTATION')
WHERE init_script like 'Implementation%';
update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='TESTCASE')
WHERE init_script like 'TestCase%';

#clean up settings table and add persist tree setting and reference data
delete FROM application_setting where application_setting_id=0;
update application_setting set value_date = null where value_date = '0000-00-00 00:00:00';
INSERT INTO application_setting (application_setting_id,table_key_id,table_ref_id,application_view_id,setting_ref_id,data_type_ref_id,value_int,value_double,value_string,value_date,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES(10000,0,21,0,10339,118,0,null,null,null,'2007-12-13 16:53:06',0,'2007-12-13 13:48:59',1,3,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) 
VALUES  (10339,'ApplicationSetting',0,'ARTIFACTTREEPERSIST',0,'Keep Artifact Tree expanded','','2007-12-31 16:53',0,'2007-12-31 16:53',0,0,1,1,320);

#add help key setting and reference data
INSERT INTO application_setting (application_setting_id,table_key_id,table_ref_id,application_view_id,setting_ref_id,data_type_ref_id,value_int,value_double,value_string,value_date,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES(10001,0,21,0,10340,120,null,null,'Replace this text with Help Key',null,'2007-12-13 16:53:06',0,'2007-12-13 13:48:59',1,3,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) 
VALUES  (10340,'ApplicationSetting',0,'HELPKEY',0,'Help Key','','2007-12-31 16:53',0,'2007-12-31 16:53',0,0,1,1,320);

#insert section titles for Product Backlog and Task
SET @ref_id = 0;
SELECT ref_id into @ref_id FROM reference where reference_group = 'artifact' and display_code ='PRODUCTBACKLOG' limit 1;

INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height,control_ref_id,create_dt)
VALUES (10373,0,'Product Backlog Artifact','Product Backlog Artifact', 1, 'ProductBacklogArtifact.section_title', 30, @ref_id,'2007-12-31 22:28:13');

SELECT ref_id into @ref_id FROM reference where reference_group = 'artifact' and display_code ='TASK' limit 1;

INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height,control_ref_id,create_dt)
VALUES (10374,0,'Task Artifact','Task Artifact', 1, 'TaskArtifact.section_title', 30, @ref_id,'2007-12-31 22:28:13');

#update report parameter and reference data for new report approach
UPDATE report_parameter SET report_param_name = 'project_id' where display='Project';
UPDATE report_parameter SET report_param_name = 'start_date' where display='Start Date';
UPDATE report_parameter SET report_param_name = 'end_date' where display='End Date';

UPDATE reference SET display_code = 'DATE', display='Date',description='Date for Date Range as Report Parameter' where display_code='ENDDATE';
UPDATE reference SET display_code = 'SELECT_PROJECT', display='Select Project' where display_code='PROJECT';
UPDATE reference SET display_code = 'TEXT', display='Text',description='Text as Report Parameter' where display_code='STARTDATE';

UPDATE report_parameter SET param_type_ref_id = 10253 where param_type_ref_id=10252;

INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10341,'ReportParamType',0,'SELECT_AGILEPROJECT',0,'Select Agile Project','List of Agile Projects as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10342,'ReportParamType',0,'SELECT_WATERFALLPROJECT',0,'Select Waterfall Project','List of Waterfall Projects as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10343,'ReportParamType',0,'SELECT_ARTIFACT',0,'Select Artifact','List of Artifacts as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10344,'ReportParamType',0,'SELECT_DESIGNARTIFACT',0,'Select Design Artifact','List of Design Artifacts as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10345,'ReportParamType',0,'SELECT_FEATUREARTIFACT',0,'Select Feature Artifact','List of Feature Artifacts as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10346,'ReportParamType',0,'SELECT_IMPLEMENTATIONARTIFACT',0,'Select Implementation Artifact','List of Implementation Artifacts as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10347,'ReportParamType',0,'SELECT_PRODUCTBACKLOGARTIFACT',0,'Select Product Backlog Artifact','List of Product Backlog Artifacts as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10348,'ReportParamType',0,'SELECT_REQUIREMENTARTIFACT',0,'Select Requirement Artifact','List of Requirement Artifacts as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10349,'ReportParamType',0,'SELECT_TASKARTIFACT',0,'Select Task Artifact','List of Task Artifacts as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10350,'ReportParamType',0,'SELECT_TESTCASEARTIFACT',0,'Select Test Case Artifact','List of Test Case Artifacts as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10351,'ReportParamType',0,'SELECT_RELEASE',0,'Select Release','List of Releases as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
VALUES (10352,'ReportParamType',0,'SELECT_SPRINT',0,'Select Sprint','List of Sprints as Report Parameter','2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);

#add reference for report locatiion group and reference values, and update pre-existing reports with proper value
INSERT INTO reference_group (reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  VALUES (10325,'ReportLocation','Report Location','Report Location',326,343,1,0,'2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10353,'ReportLocation',0,'REPORTS',1,'Available in main reporting section','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10354,'ReportLocation',0,'PROJECTS',2,'Available in project section','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10355,'ReportLocation',0,'ARTIFACTS',3,'Available in artifact section','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);

UPDATE report SET report_location_ref_id = 10353;