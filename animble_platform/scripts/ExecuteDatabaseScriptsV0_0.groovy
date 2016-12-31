/*

aNimble Platform: Application Lifecycle Management Tool
Copyright (C) 2010-2012 ideaStub, LLC

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

*/

includeTargets << grailsScript("_GrailsBootstrap")

target ('main_anp_v0_0': "Load the Grails interactive shell") {
	depends( configureProxy, packageApp, classpath, loadApp, configureApp )

	println 'Called ExecuteDatabaseScriptsV0_0.groovy'
	
	def data_files = ['application_security.sql', 'application_setting.sql',
		'application_user.sql', 'application_user_group.sql', 'artifact.sql',
		'issue.sql', 'record_file.sql', 'record_parameter.sql', 'reference.sql',
		'reference_group.sql', 'reference_tree.sql','requirement_tree.sql']
	
	def schema_files= ['schema.sql']

	def database_type
	
	if (org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.driverClassName.equals('com.mysql.jdbc.Driver')){
		 database_type = 'mysql'
	} else {
		 database_type = 'sqlserver'
	}
	
	def version_folder = 'anp_v0_0'
	
	String sqlFilePath = System.properties['base.dir'] + '/scripts/' 

    def sql = groovy.sql.Sql.newInstance(
	   org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.url,
	    org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.username,
	     org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.password,
	      org.codehaus.groovy.grails.commons.ConfigurationHolder.config.dataSource.driverClassName)

	schema_files.each {
	   	String sqlString = new File(sqlFilePath + '/' + version_folder + '/' + database_type + '/' + it).text 
	    //println sqlString
	    sql.execute(sqlString)	   
	}

	data_files.each {
	   	String sqlString = new File(sqlFilePath + '/' + version_folder + '/' + database_type + '/' + it).text 
	    //println sqlString
	    sql.execute(sqlString)	   
	}	   

}


setDefaultTarget(main_anp_v0_0)