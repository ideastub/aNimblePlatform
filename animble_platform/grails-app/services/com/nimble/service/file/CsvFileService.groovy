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

package com.nimble.service.file

import javax.servlet.ServletContext
import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
import com.nimble.domain.artifact.*
import com.nimble.utils.file.CsvFileReader
import com.nimble.domain.reference.RelationReference
import com.nimble.domain.security.ApplicationUser
import com.nimble.service.file.FileService

class CsvFileService extends FileService{

    boolean transactional = true

    def performImport() {
    	rootDir = servletContext.getRealPath('/') + importFolder
        currentFile = rootDir + 'artifactTree.csv'
        reader = new CsvFileReader(currentFile)
        reader.forEachRow () {
	    
		    def at = prepArtifactTree(it)
   		    println 'at = ' + at
   		    attemptSave(at)

        }
    }

	def prepArtifactTree = { Map it ->
		    def at = new ArtifactTree(it)

   		    def childId = Long.parseLong(it['child_id'])
   		    def child = Artifact.find("from Artifact as art where art.id=:id",[id:childId])
		    at.child = child

   		    def parentId = Long.parseLong(it['parent_id'])
   		    def parent = Artifact.find("from Artifact as art where art.id=:id",[id:parentId])
		    at.parent = parent

   		    def relation_ref_id = Long.parseLong(it['relation_ref_id'])
   		    def relationRef = RelationReference.find("from RelationReference as rr where rr.id=:id",[id:relation_ref_id])
		    at.relation_ref = relationRef

   		    def create_user_id = Long.parseLong(it['create_user_id'])
   		    def create_user = ApplicationUser.find("from ApplicationUser as au where au.id=:id",[id:create_user_id])
		    at.create_user = create_user            
		                
   		    def update_user_id = Long.parseLong(it['update_user_id'])
   		    def update_user = ApplicationUser.find("from ApplicationUser as au where au.id=:id",[id:update_user_id])
		    at.update_user = update_user            

   		    return at
	}

}
