--remove use of app_type_ref_id column
  update project
  set class = 'WaterfallProject';

--add reference for project group and reference values
INSERT INTO reference_group (reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  VALUES (10272,'Project','Project','Project',326,343,1,0,'2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10257,'Project',0,'WATERFALL',1,'Waterfall','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10258,'Project',0,'AGILE',3,'Agile','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);

--add example agile projects
INSERT INTO project (project_id,project_code,project_name,project_start_date,project_end_date,class,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) 
VALUES  (10000,'AGILE1','Agile Project 1','2010-12-31 22:28','2011-12-31 22:28','AgileProject','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);
INSERT INTO project (project_id,project_code,project_name,project_start_date,project_end_date,class,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) 
VALUES  (10001,'AGILE2','Agile Project 2','2010-12-31 22:28','2011-12-31 22:28','AgileProject','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);


--add reference for sprint status group and reference values
INSERT INTO reference_group (reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  VALUES (10273,'SprintStatus','Sprint Status','Sprint Status',326,343,1,0,'2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10259,'SprintStatus',0,'- SELECT -',0,'- Select -','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10260,'SprintStatus',0,'NOTSTARTED',1,'Not Started','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10261,'SprintStatus',0,'INPROGRESS',2,'In Progress','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10262,'SprintStatus',0,'COMPLETE',3,'Complete','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);

--add example agile sprints
INSERT INTO sprint (sprint_id,project_id,sprint_number,sprint_name,sprint_start_date,sprint_end_date,sprint_status_ref_id,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) 
VALUES  (10000,10000,'1','Sprint 1','2011-05-01 22:28','2011-05-31 22:28',10259,'2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);
INSERT INTO sprint (sprint_id,project_id,sprint_number,sprint_name,sprint_start_date,sprint_end_date,sprint_status_ref_id,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) 
VALUES  (10001,10000,'2','Sprint 2','2011-06-01 22:28','2011-06-30 22:28',10259,'2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);


--insert reference groups for product backlog artifact specific types like priority, etc
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10274, 'ProductBacklogPriority', 'Product Backlog Priority', 'Product Backlog Priority', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10275, 'ProductBacklogStatus', 'Product Backlog Status', 'Product Backlog Status', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10276, 'ProductBacklogVersion', 'Product Backlog Version', 'Product Backlog Version', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);

--insert reference values for product backlog artifact
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10263,'ProductBacklogStatus',0,'- SELECT -',0,'- Select -','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10264,'ProductBacklogStatus',0,'NOTSTARTED',1,'Not Started','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10265,'ProductBacklogStatus',0,'INPROGRESS',2,'In Progress','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10266,'ProductBacklogStatus',0,'COMPLETE',3,'Complete','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);

INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10267,'Artifact',0,'PRODUCTBACKLOG',0,'Product Backlog','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);

INSERT INTO reference (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr) VALUES (10268,'ProductBacklogVersion', '- SELECT -', 0, '- Select -', '- Select -', 1);
INSERT INTO reference (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr) VALUES (10269,'ProductBacklogPriority', '- SELECT -', 0, '- Select -', '- Select -', 1);

--add example product backlog items
INSERT INTO artifact (artifact_id,product_ref_id,version_ref_id,artifact_ref_id,artifact_nbr,artifact_seq,artifact_level_ref_id,component_type_ref_id,last_updated_baseline_id,artifact_name,description,status_ref_id,priority_ref_id,complexity_ref_id,author_ref_id,assigned_ref_id,category_ref_id,assigned_user_id,assigned_user_group_id,effort,rationale,origin,goal,context,precondition,postcondition,summary,external_references,planned_version_ref_id,last_modified_version_ref_id,removed_ind,module_ref_id,origin_category_ref_id,change_reason,change_made,report_sequence,report_outline,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id,custom_text1,custom_text2,custom_text3,custom_text4,custom1_ref_id,custom2_ref_id,custom3_ref_id,custom4_ref_id,custom_date1,custom_date2,custom_memo1,custom_memo2,custom_int1,custom_int2,custom_double1,class,sprint_id)
VALUES (10000, 10000, 10268, 0, 'Client LOB 1 8899', 0, 10017, 10001, 10025, 'Agile PB 1', '', 10263, 10269, 10000, 0, 0, 10018, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10268, 0, 0, 10019, 10020, NULL, NULL, 0, NULL, '2011-05-01 19:51:19', 1, '2011-05-01 19:51:19', 1, 0, 1, 0, 321, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 'ProductBacklogArtifact', NULL);
INSERT INTO artifact (artifact_id,product_ref_id,version_ref_id,artifact_ref_id,artifact_nbr,artifact_seq,artifact_level_ref_id,component_type_ref_id,last_updated_baseline_id,artifact_name,description,status_ref_id,priority_ref_id,complexity_ref_id,author_ref_id,assigned_ref_id,category_ref_id,assigned_user_id,assigned_user_group_id,effort,rationale,origin,goal,context,precondition,postcondition,summary,external_references,planned_version_ref_id,last_modified_version_ref_id,removed_ind,module_ref_id,origin_category_ref_id,change_reason,change_made,report_sequence,report_outline,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id,custom_text1,custom_text2,custom_text3,custom_text4,custom1_ref_id,custom2_ref_id,custom3_ref_id,custom4_ref_id,custom_date1,custom_date2,custom_memo1,custom_memo2,custom_int1,custom_int2,custom_double1,class,sprint_id)
VALUES (10001, 10000, 10268, 0, 'Client LOB 2 8899', 0, 10017, 10001, 10025, 'Agile PB 2', '', 10263, 10269, 10000, 0, 0, 10018, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10268, 0, 0, 10019, 10020, NULL, NULL, 0, NULL, '2011-05-01 19:51:19', 1, '2011-05-01 19:51:19', 1, 0, 1, 0, 321, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 'ProductBacklogArtifact', NULL);


--insert all the application control records
--initial active product backlog controls
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height)
VALUES (10277,1,'Artifact Name','Artifact Name', 1, 'ProductBacklogArtifact.artifact_name', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10278, 2,'Artifact Number','Artifact Number', 1, 'ProductBacklogArtifact.artifact_nbr', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10279, 3,'Status','Status', 1, 'ProductBacklogArtifact.status_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10365, 4,'Sprint','Sprint', 1, 'ProductBacklogArtifact.sprint', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10280, 5,'Estimated Effort','Estimated Effort', 1, 'ProductBacklogArtifact.effort', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10281, 6,'Priority','Priority', 1, 'ProductBacklogArtifact.priority_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10282, 7,'Sequence','Sequence', 1, 'ProductBacklogArtifact.artifact_seq', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10283, 8,'Description','Description', 1, 'ProductBacklogArtifact.description', 30);


--initial inactive design controls
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10284, 5,'Category','Category', 0, 'ProductBacklogArtifact.category_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10285, 6,'Version','Version', 0, 'ProductBacklogArtifact.version_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10286, 6,'Author','Author', 0, 'ProductBacklogArtifact.author_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10287, 7,'Planned Version','Planned Version', 0, 'ProductBacklogArtifact.planned_version_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10288, 11,'Module','Module', 0, 'ProductBacklogArtifact.module_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10289, 12,'Complexity','Complexity', 0, 'ProductBacklogArtifact.complexity_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10290, 13,'Assigned User','Assigned User', 0, 'ProductBacklogArtifact.assigned_user', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10291, 15,'Origin','Origin', 0, 'ProductBacklogArtifact.origin', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10292, 16,'Change Made','Change Made', 0, 'ProductBacklogArtifact.change_made', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10293, 17,'Change Reason','Change Reason', 0, 'ProductBacklogArtifact.change_reason', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10294, 18,'Component Type','Component Type', 0, 'ProductBacklogArtifact.component_type_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10295, 19,'Summary','Summary', 0, 'ProductBacklogArtifact.summary', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10296, 21,'Origin Category','Origin Category', 0, 'ProductBacklogArtifact.origin_category_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10297, 22,'Removed','Removed', 0, 'ProductBacklogArtifact.removed_ind', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10298, 23,'Rationale','Rationale', 0, 'ProductBacklogArtifact.rationale', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10299, 24,'Goal','Goal', 0, 'ProductBacklogArtifact.goal', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10300, 25,'Context','Context', 0, 'ProductBacklogArtifact.context', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10301, 26,'Pre-Condition','Pre-Condition', 0, 'ProductBacklogArtifact.precondition', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10302, 27,'Post-Condition','Post-Condition', 0, 'ProductBacklogArtifact.postcondition', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10303, 28,'Artifact Level','Artifact Level', 0, 'ProductBacklogArtifact.artifact_level_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10304, 29,'External References','External References', 0, 'ProductBacklogArtifact.external_references', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10305, 30,'Custom Integer 1','Custom Integer 1', 0, 'ProductBacklogArtifact.custom_int1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10306, 31,'Custom Integer 2','Custom Integer 2', 0, 'ProductBacklogArtifact.custom_int2', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10307, 32,'Custom Memo 1','Custom Memo 1', 0, 'ProductBacklogArtifact.custom_memo1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10308, 33,'Custom Memo 2','Custom Memo 2', 0, 'ProductBacklogArtifact.custom_memo2', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10309, 34,'Custom Text 1','Custom Text 1', 0, 'ProductBacklogArtifact.custom_text1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10310, 35,'Custom Text 2','Custom Text 2', 0, 'ProductBacklogArtifact.custom_text2', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10311, 36,'Custom Text 3','Custom Text 3', 0, 'ProductBacklogArtifact.custom_text3', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10312, 37,'Custom Text 4','Custom Text 4', 0, 'ProductBacklogArtifact.custom_text4', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10313, 38,'Custom Reference 1','Custom Reference 1', 0, 'ProductBacklogArtifact.custom1_ref_id', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10314, 39,'Custom Reference 2','Custom Reference 2', 0, 'ProductBacklogArtifact.custom2_ref_id', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10315, 40,'Custom Reference 3','Custom Reference 3', 0, 'ProductBacklogArtifact.custom3_ref_id', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10316, 41,'Custom Reference 4','Custom Reference 4', 0, 'ProductBacklogArtifact.custom4_ref_id', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10317, 42,'Custom Double 1','Custom Double 1', 0, 'ProductBacklogArtifact.custom_double1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10318, 43,'Custom Date 1','Custom Date 1', 0, 'ProductBacklogArtifact.custom_date1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10319, 44,'Custom Date 2','Custom Date 2', 0, 'ProductBacklogArtifact.custom_date2', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10320, 14,'Assigned User Group','Assigned User Group', 0, 'ProductBacklogArtifact.assigned_user_group', 30);


update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='PRODUCTBACKLOG')
WHERE init_script like 'ProductBacklog%';



--insert reference groups for task artifact specific types like priority, etc
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10321, 'TaskPriority', 'Task Priority', 'Task Priority', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10322, 'TaskStatus', 'Task Status', 'Task Status', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);
INSERT INTO reference_group
(reference_group_id,reference_group,display,description,modification_ref_id,category_ref_id,unique_display_code_ind,framework_ind,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)
 VALUES (10323, 'TaskVersion', 'Task Version', 'Task Version', 326, 0, 0, 0, '2005-11-08 20:24:20.00',0,'2005-11-08 20:24:20.00',0,0,1,1,320);

--insert reference values for product backlog artifact
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10324,'TaskStatus',0,'- SELECT -',0,'- Select -','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10325,'TaskStatus',0,'NOTSTARTED',1,'Not Started','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10326,'TaskStatus',0,'INPROGRESS',2,'In Progress','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);
INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10327,'TaskStatus',0,'COMPLETE',3,'Complete','','2007-12-31 22:28',0,'2007-12-31 1:34',1,1,1,1,322);

INSERT INTO reference (ref_id,reference_group,app_type_ref_id,display_code,display_sequence,display,description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id) VALUES  (10328,'Artifact',0,'TASK',0,'Task','','2007-12-31 22:28',0,'2007-12-31 1:33',1,1,1,1,322);

INSERT INTO reference (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr) VALUES (10329,'TaskVersion', '- SELECT -', 0, '- Select -', '- Select -', 1);
INSERT INTO reference (ref_id, reference_group,display_code,display_sequence,display,description,system_assigned_version_nbr) VALUES (10330,'TaskPriority', '- SELECT -', 0, '- Select -', '- Select -', 1);

--insert all the task control records
--initial active task controls
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text, control_description, visible_ind,init_script,unit_height)
VALUES (10321,1,'Artifact Name','Artifact Name', 1, 'TaskArtifact.artifact_name', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10322, 2,'Artifact Number','Artifact Number', 1, 'TaskArtifact.artifact_nbr', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10323, 3,'Status','Status', 1, 'TaskArtifact.status_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10324, 4,'Effort Remaining','Effort Remaining', 1, 'TaskArtifact.effort', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10325, 5,'Sequence','Sequence', 1, 'TaskArtifact.artifact_seq', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10326, 6,'Assigned User','Assigned User', 1, 'TaskArtifact.assigned_user', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10327, 7,'Description','Description', 1, 'TaskArtifact.description', 30);



--initial inactive task controls
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10328, 5,'Priority','Priority', 0, 'TaskArtifact.priority_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10329, 5,'Category','Category', 0, 'TaskArtifact.category_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10330, 6,'Version','Version', 0, 'TaskArtifact.version_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10331, 6,'Author','Author', 0, 'TaskArtifact.author_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10332, 7,'Planned Version','Planned Version', 0, 'TaskArtifact.planned_version_ref', 30);
  INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10333, 11,'Module','Module', 0, 'TaskArtifact.module_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10334, 12,'Complexity','Complexity', 0, 'TaskArtifact.complexity_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10335, 15,'Origin','Origin', 0, 'TaskArtifact.origin', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10336, 16,'Change Made','Change Made', 0, 'TaskArtifact.change_made', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10337, 17,'Change Reason','Change Reason', 0, 'TaskArtifact.change_reason', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10338, 18,'Component Type','Component Type', 0, 'TaskArtifact.component_type_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10339, 19,'Summary','Summary', 0, 'TaskArtifact.summary', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10340, 21,'Origin Category','Origin Category', 0, 'TaskArtifact.origin_category_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10341, 22,'Removed','Removed', 0, 'TaskArtifact.removed_ind', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10342, 23,'Rationale','Rationale', 0, 'TaskArtifact.rationale', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10343, 24,'Goal','Goal', 0, 'TaskArtifact.goal', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10344, 25,'Context','Context', 0, 'TaskArtifact.context', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10345, 26,'Pre-Condition','Pre-Condition', 0, 'TaskArtifact.precondition', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10346, 27,'Post-Condition','Post-Condition', 0, 'TaskArtifact.postcondition', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10347, 28,'Artifact Level','Artifact Level', 0, 'TaskArtifact.artifact_level_ref', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10348, 29,'External References','External References', 0, 'TaskArtifact.external_references', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10349, 30,'Custom Integer 1','Custom Integer 1', 0, 'TaskArtifact.custom_int1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10350, 31,'Custom Integer 2','Custom Integer 2', 0, 'TaskArtifact.custom_int2', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10351, 32,'Custom Memo 1','Custom Memo 1', 0, 'TaskArtifact.custom_memo1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10352, 33,'Custom Memo 2','Custom Memo 2', 0, 'TaskArtifact.custom_memo2', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10353, 34,'Custom Text 1','Custom Text 1', 0, 'TaskArtifact.custom_text1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10354, 35,'Custom Text 2','Custom Text 2', 0, 'TaskArtifact.custom_text2', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10355, 36,'Custom Text 3','Custom Text 3', 0, 'TaskArtifact.custom_text3', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10356, 37,'Custom Text 4','Custom Text 4', 0, 'TaskArtifact.custom_text4', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10357, 38,'Custom Reference 1','Custom Reference 1', 0, 'TaskArtifact.custom1_ref_id', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10358, 39,'Custom Reference 2','Custom Reference 2', 0, 'TaskArtifact.custom2_ref_id', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10359, 40,'Custom Reference 3','Custom Reference 3', 0, 'TaskArtifact.custom3_ref_id', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10360, 41,'Custom Reference 4','Custom Reference 4', 0, 'TaskArtifact.custom4_ref_id', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10361, 42,'Custom Double 1','Custom Double 1', 0, 'TaskArtifact.custom_double1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10362, 43,'Custom Date 1','Custom Date 1', 0, 'TaskArtifact.custom_date1', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10363, 44,'Custom Date 2','Custom Date 2', 0, 'TaskArtifact.custom_date2', 30);
INSERT INTO application_control
   (application_control_id,display_sequence,control_text,control_description, visible_ind,init_script,unit_height)
VALUES (10364, 14,'Assigned User Group','Assigned User Group', 0, 'TaskArtifact.assigned_user_group', 30);

update application_control
SET control_ref_id=(SELECT ref_id FROM reference where reference_group = 'artifact' and display_code ='TASK')
WHERE init_script like 'Task%';

--insert security values
--admin
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10020,'/**','ROLE_ADMIN','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
--anonymous
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10021,'/login/**','IS_AUTHENTICATED_ANONYMOUSLY','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10022,'/css/**','IS_AUTHENTICATED_ANONYMOUSLY','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10023,'/dojoroot/**','IS_AUTHENTICATED_ANONYMOUSLY','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10024,'/images/**','IS_AUTHENTICATED_ANONYMOUSLY','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10025,'/js/**','IS_AUTHENTICATED_ANONYMOUSLY','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10026,'/jasper/**','IS_AUTHENTICATED_ANONYMOUSLY','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
--user
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10027,'/agileProject/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10028,'/artifact/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10029,'/designArtifact/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10030,'/featureArtifact/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10031,'/implementationArtifact/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10032,'/productBacklogArtifact/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10033,'/project/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10034,'/reports/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10035,'/requirementArtifact/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10036,'/sprint/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10037,'/taskArtifact/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10038,'/testArtifact/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10039,'/waterfallProject/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10040,'/','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);
INSERT INTO application_privilege (privilege_id,url,config_attribute,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10041,'/logout/**','ROLE_USER,IS_AUTHENTICATED_REMEMBERED','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);


update application_user
SET display_name='Administrator, Demo'
WHERE user_login = 'DEMO';

update application_user
SET display_name='User, Demo', user_login='USER', last_name='User'
WHERE user_login = 'MARKETING';

update application_user
SET password='66c57271cf76f7169cd39eb129434cfca4a460b4e976defd24d49bfb01166f59';

INSERT INTO application_role (role_id,authority, description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10040,'ROLE_ADMIN', 'System Administrator','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

INSERT INTO application_role (role_id,authority, description,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10041,'ROLE_USER', 'Standard User','2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

INSERT INTO app_user_app_role (user_role_id,user_id,role_id,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10030,
(SELECT user_id FROM application_user where user_login='DEMO'),
(SELECT role_id FROM application_role where authority='ROLE_ADMIN'),
'2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

INSERT INTO app_user_app_role (user_role_id,user_id,role_id,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10031,
(SELECT user_id FROM application_user where user_login='USER'),
(SELECT role_id FROM application_role where authority='ROLE_USER'),
'2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

INSERT INTO app_user_app_role (user_role_id,user_id,role_id,create_dt,create_user_id,update_dt,update_user_id,update_count,active_ind,system_assigned_version_nbr,record_type_ref_id)  
VALUES (10032,
(SELECT user_id FROM application_user where user_login='DEMO'),
(SELECT role_id FROM application_role where authority='ROLE_USER'),
'2007-12-31 22:28:13',0,'2007-12-31 14:54:36',0,14,1,1,320);

delete from reference_group where reference_group='Role';
delete from reference where reference_group='Role';

--correct bad data on view controls
update application_control
set create_dt='2007-12-31 22:28:13' where create_dt is null;
