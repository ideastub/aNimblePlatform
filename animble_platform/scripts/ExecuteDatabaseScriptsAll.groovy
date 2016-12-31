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
includeTargets << new File(System.properties['base.dir'] + '/scripts/ExecuteDatabaseScriptsV0_0.groovy')
includeTargets << new File(System.properties['base.dir'] + '/scripts/ExecuteDatabaseScriptsV0_1.groovy')
includeTargets << new File(System.properties['base.dir'] + '/scripts/ExecuteDatabaseScriptsV0_2.groovy')
includeTargets << new File(System.properties['base.dir'] + '/scripts/ExecuteDatabaseScriptsV0_3.groovy')
includeTargets << new File(System.properties['base.dir'] + '/scripts/ExecuteDatabaseScriptsV0_4.groovy')

target ('main': "Load the Grails interactive shell") {
	depends( configureProxy, packageApp, classpath, loadApp, configureApp, main_anp_v0_0, main_anp_v0_1, main_anp_v0_2, main_anp_v0_3, main_anp_v0_4  )

}


setDefaultTarget(main)