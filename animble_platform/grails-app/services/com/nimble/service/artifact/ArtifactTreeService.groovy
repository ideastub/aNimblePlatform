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

package com.nimble.service.artifact

import com.nimble.domain.artifact.*
import com.nimble.domain.security.ApplicationUser
import com.nimble.service.NimbleService
import com.nimble.domain.project.Baseline
import com.nimble.domain.reference.*

class ArtifactTreeService extends NimbleService{

    boolean transactional = true
    

	def prepRelatedArtifactTreeForSave(Artifact artifact, Long artifactParentId) {
        ArtifactTree artTree
	    if (artifactParentId != null){
	        artTree = new ArtifactTree()
	        artTree.parent=Artifact.get(artifactParentId)
	        artTree.child=artifact
	        artTree.relation_ref = RelationReference.find("from RelationReference as rr where rr.display_code=?",['RELATED'])
	        artTree = prepDomainObjectForSave(artTree)
        }
        return artTree
    }

	def prepRelatedArtifactTreeForUpdate(ArtifactTree artTree) {
	    if (artTree != null){
	        artTree = prepDomainObjectForUpdate(artTree)
        }
        return artTree
    }
    
	def prepDependentArtifactTreeForSave(Artifact artifact, def artifactChildId) {
        ArtifactTree  artTree = new ArtifactTree()
        Long artChildId

        if (artifactChildId == null || artifactChildId.equals('')){
        	artTree.errors.reject('default.invalid.relationship', ['Artifact Tree',artTree.classToString()].toArray() as Object[], '')
        } else {
        	artChildId = Long.parseLong(artifactChildId)
        }
        if (!artTree.hasErrors() && (artifact.id).equals(artChildId)){
        	artTree.errors.reject('default.invalid.relationship.itself', ['Artifact Tree',artTree.classToString()].toArray() as Object[], '')
        } 
        if (!artTree.hasErrors() && ArtifactTree.find("from ArtifactTree as at where at.parent.id=:parentId and at.child.id=:childId and at.relation_ref.display_code='DEPENDENT'",[parentId:artifact.id,childId:artChildId])){
        	artTree.errors.reject('default.invalid.relationship.exists', ['Artifact Tree',artTree.classToString()].toArray() as Object[], '')
        } 
        
        if (!artTree.hasErrors()){
	        artTree.parent=artifact
	        artTree.child=Artifact.get(artChildId)
	        artTree.relation_ref = RelationReference.find("from RelationReference as rr where rr.display_code=?",['DEPENDENT'])
	        artTree = prepDomainObjectForSave(artTree)
        }
        
        return artTree
	}
	
}
