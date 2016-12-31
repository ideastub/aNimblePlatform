<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>
<%

	def database_type
	
	if (org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.driverClassName.equals('com.mysql.jdbc.Driver')){
		 database_type = 'mysql'
	} else {
		 database_type = 'sqlserver'
	}
	
    def sql = groovy.sql.Sql.newInstance(
	   org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.url,
	    org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.username,
	     org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.password,
	      org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.driverClassName)

		sql.execute("delete FROM project_release where create_dt > '2010-12-16';")
		sql.execute("delete FROM artifact where create_dt > '2010-12-16';")
		sql.execute("delete FROM artifact_history where create_dt > '2010-12-16';")
		sql.execute("delete FROM requirement_tree where create_dt > '2010-12-16';")		
		sql.execute("delete FROM project where create_dt > '2010-12-16';")
		sql.execute("delete FROM project_release where create_dt > '2010-12-16';")
		sql.execute("delete FROM reference where display_code = 'DESIGNSTATUSFOO';")
		sql.execute("delete FROM report_parameter where create_dt > '2010-12-16';")
		sql.execute("delete FROM report where create_dt > '2010-12-16';")
		sql.execute("delete FROM application_user where create_dt > '2010-12-16';")
		sql.execute("update application_control set control_text='Artifact Name' where application_control_id=10026;")

/*
drop table app_control_template;
drop table app_user_app_role;
drop table application_control;
drop table application_custom_control;
drop table application_privilege;
drop table application_role;
drop table application_security;
drop table application_setting;
drop table application_user;
drop table application_user_group;
drop table application_view;
drop table artifact;
drop table artifact_document;
drop table artifact_history;
drop table artifact_identity;
drop table baseline;
drop table hi_value;
drop table issue;
drop table issue_log;
drop table project;
drop table project_release;
drop table record_file;
drop table record_file_history;
drop table record_parameter;
drop table record_parameter_value;
drop table reference;
drop table reference_group;
drop table reference_history;
drop table reference_tree;
drop table report;
drop table report_parameter;
drop table requirement_tree;
drop table requirement_tree_history;
*/

%>

<g:set var="viewHelper" value="${new ViewHelper(artifactInstance)}" scope="request"/>

<%
	println(g.include(view:'/'))
%>