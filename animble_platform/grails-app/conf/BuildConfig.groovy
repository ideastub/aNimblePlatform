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

grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir	= "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits( "global" ) {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {        
        grailsPlugins()
        grailsHome()

        // uncomment the below to enable remote dependency resolution
        // from public Maven repositories
        mavenLocal()
        mavenCentral()
        mavenRepo "http://plugins.grails.org" 
        mavenRepo "http://repo.grails.org/grails/plugins/" 
        mavenRepo "http://repo.grails.org/grails/core/" 
        mavenRepo "http://svn.codehaus.org/grails/trunk/grails-plugins" 
        mavenRepo "http://repo1.maven.org/maven2/"
        mavenRepo "http://snapshots.repository.codehaus.org"
        mavenRepo "http://repository.codehaus.org"
        mavenRepo "http://download.java.net/maven/2"
        mavenRepo "http://repository.jboss.com/maven2"
        mavenRepo "http://svn.codehaus.org/grails-plugins"
        mavenRepo "https://github.com"
        mavenRepo "http://grails.org/plugins"
        mavenRepo "http://repo1.maven.org/maven2"
        mavenRepo "https://repository.jboss.org/nexus"
    
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

    	compile "org.grails.plugins:hibernate:2.1.1"
    	compile "org.grails.plugins:jasper:1.1.3"
    	compile "org.grails.plugins:searchable:0.6.4"
    	compile "org.grails.plugins:spring-security-core:1.2.7.1"
    	build "org.grails.plugins:tomcat:2.1.1"
    }

}

grails.tomcat.jvmArgs = ["-Xms2048m", "-Xmx2048m", "-XX:PermSize=1024m", "-XX:MaxPermSize=1024m", "-XX:+CMSClassUnloadingEnabled"]

//if encountering memory limitation issues, the following was used on a older WinXP machine
//grails.tomcat.jvmArgs = ["-Xms256m", "-Xmx768m", "-XX:PermSize=512m", "-XX:MaxPermSize=768m", "-XX:+CMSClassUnloadingEnabled"]
                         
grails.urlcreator.cache.maxsize = 0
