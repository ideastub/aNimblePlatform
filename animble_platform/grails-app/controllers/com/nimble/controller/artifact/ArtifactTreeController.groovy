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

package com.nimble.controller.artifact

import com.nimble.domain.artifact.*
import com.nimble.controller.NimbleController
import com.nimble.service.artifact.*
import com.nimble.domain.view.*

class ArtifactTreeController extends NimbleController{

    static allowedMethods = [save: "POST"]
	
    def artifactTreeService

    def list = {
    		//params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def results = ArtifactTree.findAll("from ArtifactTree as at where at.parent.id=? and at.relation_ref.display_code='DEPENDENT' order by at.lastUpdate desc",[new Long(params?.artifact_id)],params)

            //[artTreeInstanceList: results, artifactTreeInstanceTotal: results?.count()]
            [artTreeInstanceList: results]
        }

    def create = {
        def artifactTreeInstance = new ArtifactTree()
        artifactTreeInstance.properties = params
        def artifactView = false
        return [artifactTreeInstance: artifactTreeInstance, artifactView:artifactView]
    }

    def dragAndDrop = {
        def artifactTreeInstance
    	def artifactId = Long.parseLong(params.artifact_id)
        def artifact
    	def artifactNewParentId = Long.parseLong(params.new_parent_id)
        def artifactNewParentTreeRole = params.new_parent_tree_role 
        def artifactNewParent
        def artifactRelationRef = params.artifact_relation_ref
    	def artifactOldParentId
    	def artifactOldParentTreeRole = params.old_parent_tree_role

    	if (artifactNewParentTreeRole == null ||
    			artifactNewParentTreeRole.equals("")){
            flash.message = "${message(code: 'default.invalid.relationship', args: [message(code: 'artifactTree.label', default: 'ArtifactTree'), artifactTreeInstance.id])}"
           	render(contentType:"text/json"){
            	viewMessage(messageClass:ViewMessage.VIEW_CLASS_ERROR,message:flash.message)}
    		
    	} else {
    		
    		if (artifactNewParentTreeRole.equals(Artifact.TREE_ROOT)){
	    		artifactOldParentId	= Long.parseLong(params.old_parent_id)    		
	    		artifactTreeInstance = ArtifactTree.find(
	        		"from ArtifactTree as at where at.parent.id=:old_parent_id " +
	        		"and at.child.id=:artifact_id and " +
	        		"at.relation_ref.display_code=:artifact_relation_ref",
	        		[old_parent_id:artifactOldParentId,
	        		 artifact_id:artifactId,
	        		 artifact_relation_ref:artifactRelationRef])
	        	
	        	try {
	            	artifactTreeInstance.delete(flush: true)
	                flash.message = "${message(code: 'default.relationship.change.successful', args: [message(code: 'artifactTree.label', default: 'ArtifactTree'), artifactTreeInstance.id])}"
	                render(contentType:"text/json"){
	            		viewMessage(messageClass:ViewMessage.VIEW_CLASS_MESSAGE,message:flash.message)}

	        	}
	            catch (org.springframework.dao.DataIntegrityViolationException e) {
	                flash.message = "${message(code: 'default.relationship.change.not.successful', args: [message(code: 'artifactTree.label', default: 'ArtifactTree'), artifactTreeInstance.id])}"
	               	render(contentType:"text/json"){
	                	viewMessage(messageClass:ViewMessage.VIEW_CLASS_ERROR,message:flash.message)}

	            }        		 

    		} else {
	 	    	if (!artifactOldParentTreeRole.equals(Artifact.TREE_ROOT)){
	 	    		artifactOldParentId	= Long.parseLong(params.old_parent_id)    		
		    		artifactTreeInstance = ArtifactTree.find(
		        		"from ArtifactTree as at where at.parent.id=:old_parent_id " +
		        		"and at.child.id=:artifact_id and " + "at.relation_ref.display_code=:artifact_relation_ref",
		        		[old_parent_id:artifactOldParentId, artifact_id:artifactId, artifact_relation_ref:artifactRelationRef])
		        	artifactNewParent = Artifact.get(artifactNewParentId)
		        	artifactTreeInstance.parent = artifactNewParent		
		   	        artifactTreeInstance = artifactTreeService.prepRelatedArtifactTreeForUpdate(artifactTreeInstance)
		
		    	} else {
		    		artifact = Artifact.get(artifactId)
		    		artifactTreeInstance = artifactTreeService.prepRelatedArtifactTreeForSave(artifact, artifactNewParentId)
		
		    	}
        
		        if (!artifactTreeInstance.hasErrors() && artifactTreeInstance.save(flush: true)) {
		            flash.message = "${message(code: 'default.relationship.change.successful', args: [message(code: 'artifactTreeInstance.label', default: 'ArtifactTree'), artifactTreeInstance.id])}"
		           	render(contentType:"text/json"){
		            	viewMessage(messageClass:ViewMessage.VIEW_CLASS_MESSAGE,message:flash.message)}
		        }
		        else {
		            render(contentType:"text/json"){
		            	viewMessage(messageClass:ViewMessage.VIEW_CLASS_ERROR,message:flash.message)}
		        }
    		}
    	}
    }    
    
    def save = {
            def artifactParentInstanceId = sh?.session?.curArtifact?.id
            def artifactParentInstance = Artifact.get(artifactParentInstanceId)
            def artifactChildId = params.child_id
            def artifactView = false
            
            def artifactTreeInstance = artifactTreeService.prepDependentArtifactTreeForSave(artifactParentInstance, artifactChildId)
            
            if (!artifactTreeInstance.hasErrors() && artifactTreeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.created.message', args: [message(code: 'artifactTreeInstance.label', default: 'ArtifactTree'), artifactTreeInstance.id])}"
               	redirect(controller:nh.getControllerName(artifactParentInstance), action: "index",  params:[id: artifactParentInstanceId, tab: viewTabs.ARTIFACT_DEPENDENCIES])
            }
            else {
                render(controller:'artifactTree', view: "create",  model: [artifactTreeInstance: artifactTreeInstance, artifactView: artifactView])
            }
    }

    def delete = {
        def artifactTreeInstance = ArtifactTree.get(params.id)
        def artifactParentInstance = Artifact.get(artifactTreeInstance?.parent?.id)
        
        if (artifactTreeInstance && artifactParentInstance) {
            try {
            	artifactTreeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'artifactTree.label', default: 'ArtifactTree'), params.id])}"
                redirect(controller:nh.getControllerName(artifactParentInstance), action: "index", params:[id: artifactParentInstance.id, tab: viewTabs.ARTIFACT_DEPENDENCIES])
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'artifactTree.label', default: 'ArtifactTree'), params.id])}"
                redirect(controller:nh.getControllerName(artifactParentInstance), action: "index", id: artifactParentInstance.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifactTree.label', default: 'ArtifactTree'), params.id])}"
            redirect(controller:nh.getControllerName(artifactParentInstance), action: "index", id: artifactParentInstance.id)
        }
    }
}
