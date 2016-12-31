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

//includeTargets << grailsScript("_GrailsBootstrap")

//target ('main': "Load the Grails interactive shell") {
	//depends( configureProxy, packageApp, classpath, loadApp, configureApp )

//	println 'Called GenerateReleasePackage.groovy'
	
	String releaseName = "animble_platform_v0_4"
	String sourceDir = "..\\"
	String destinationDir = "..\\..\\animble platform releases\\" + releaseName
	String releaseNameZip = destinationDir + "\\" + releaseName + ".zip"
	
	def ant = new AntBuilder()
	ant.delete(dir: destinationDir)
	
	ant.mkdir(dir: destinationDir)
		
	ant.copy(todir: destinationDir) {
	        fileset(dir : sourceDir) {
	        	exclude(name:"**\\*.project")
	        	exclude(name:"**\\*.log")
	        	exclude(name:"**\\*.war")
	        	exclude(name:"**\\tomcat-*.txt")
	        	exclude(name:"**\\target\\classes\\**")
	        	exclude(name:"**\\search-index\\development\\**")
	        	exclude(name:"**\\search-index\\production\\**")
	        	exclude(name:"**\\.metadata\\**")
	        	exclude(name:"**\\anp_v0_5\\**")
	   }
	}

	ant.zip(baseDir:destinationDir, destFile:releaseNameZip, update:true)
	
	//}


//setDefaultTarget(main)


