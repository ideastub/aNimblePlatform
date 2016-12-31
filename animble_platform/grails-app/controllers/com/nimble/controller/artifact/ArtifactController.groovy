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
import com.nimble.service.artifact.*
import com.nimble.domain.reference.*
import com.nimble.utils.NimbleHelper
import com.nimble.utils.view.ViewHelper
import com.nimble.controller.NimbleController

class ArtifactController extends NimbleController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    public getNewInstance(){return new Artifact();}
    public getNewInstanceWithParams(){return new Artifact(params);}
    public getArtifactClass(){return Artifact;}

    ViewHelper viewHelper = new ViewHelper()

    def artifactService
    def artifactTreeService
    
    def index = {
        //redirect(action: "list", params: params)
        landing()
    }

    def menu_tree = {
    	ArrayList menuTree
    	//println "request.getRequestURI()=" + request.getRequestURI()
    	//println "request.getQueryString()=" + request.getQueryString() 
    	//println "params=" + params
    	//println "viewHelper=" + viewHelper.isAgileProject(params.artifactType)
    	viewHelper.projectType=params.projectType
    	viewHelper.includeParams=params
    	//println "viewHelper=" + viewHelper.isAgileProject()
    	//println request.viewHelper
    	
    	if (!viewHelper.isAgileProject()){
	    	if (params.artifactType == null){
	            menuTree = ArtifactQuery.getArtifactCategoriesForMenuTree()
	            
	        } else {
	          	if (params.currentArtifactId == null || params.currentArtifactId == ''){
		          	menuTree = ArtifactQuery.getTopLevelArtifactsForMenuTree(Long.parseLong(params.id),params.artifactType)
	
	            } else {
	                menuTree = ArtifactQuery.getArtifactChildrenForMenuTree(Long.parseLong(params.id),Long.parseLong(params.currentArtifactId),params.artifactType)
				}            	
	        }
        } else {
   	          	if (params.currentArtifactId == null || params.currentArtifactId == ''){
		          	menuTree = ArtifactQuery.getTopLevelArtifactsForMenuTree(Long.parseLong(params.id),'productBacklogArtifact')
	
	            } else {
	                menuTree = ArtifactQuery.getArtifactChildrenForMenuTree(Long.parseLong(params.id),Long.parseLong(params.currentArtifactId),'taskArtifact')
				}            	
        }
	        
        [artifactInstanceList: menuTree]
    }

    def navigation = {
        render(view: "navigation")
    }

    def work_landing = {
        render(view: "work_landing")
    }

    def landing = {
        //render(view: "landing")
        show()
    }

    def menu = {
        render(view: "menu")
    }

    def menu_viewonly = {
        render(view: "menu_viewonly")
    }    
    
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        //[artifactInstanceList: getArtifactClass().list(params), artifactInstanceTotal: getArtifactClass().count()]
        [artifactInstanceList: getArtifactClass().list(params)]
    }

    //def create_index = {
        //render(view: "create_index", model: create())
    //}

    def create = {
        def artifactInstance = getNewInstance()
        artifactInstance.properties = params

        Long artifactParentId
        if (params.parent_id != null){artifactParentId = Long.parseLong(params.parent_id)}        
		sh.pushCurArtifactParent(artifactParentId)		
   				
        return [artifactInstance: artifactInstance]
    }

    def save = {
        def artifactInstance = getNewInstanceWithParams()
        viewHelper.includeParams = params
        
        Long artifactParentId = sh?.session?.curArtifact?.parent_id
        String treeRole = sh?.session?.curArtifact?.tree_role
        artifactInstance = artifactService.prepArtifactForSave(artifactInstance)

        def artTree = artifactTreeService.prepRelatedArtifactTreeForSave(artifactInstance, artifactParentId)
        
        if (!artifactInstance.hasErrors() && saveArtifactAndArtifactTree(artifactInstance, artTree)) {
        //println getArtifactClass()
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'designArtifact.label', default: nh.getControllerName(artifactInstance)), artifactInstance.id])}"
            //println '******************************* save transition to show' + flash.message
            redirect(action: "index", id: artifactInstance.id)
        }
        else {
            render(view: "create", model: [artifactInstance: artifactInstance, project_id:artifactInstance?.project?.id,artifactParentId:artifactParentId])
        }
    }
    
    private boolean saveArtifactAndArtifactTree(Artifact artifactInstance, ArtifactTree artTree){
    	boolean saveResults = false
    	if (artTree != null) {
    		saveResults = artifactInstance.save() && artTree.save(flush: true)
    	} else {
    		saveResults = artifactInstance.save(flush: true)
    	}
    	return saveResults
    }

    def show = {
        def viewOnly = false
        if (params.viewOnly != null) {viewOnly = params.viewOnly}
        
        //Long artifactParentId
        //if (params.parent_id != null && !''.equals(params.parent_id)){artifactParentId = Long.parseLong(params.parent_id)}
        
        String treeRole
        if (params.tree_role != null && !''.equals(params.tree_role)){treeRole = params.tree_role}
        
        def artifactInstance = getArtifactClass().get(params.id)

        if (!artifactInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), params.id])}"

            redirect(action: "list")
        }
        else {
	    	sh.pushCurArtifact(artifactInstance, treeRole)
	    	[artifactInstance: artifactInstance, viewOnly: viewOnly]
        }
    }

	def show_inc = {
		show()
	}

	def show_viewonly = {
		show()
	}

    def edit = {
        def artifactInstance = getArtifactClass().get(params.id)
        if (!artifactInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [artifactInstance: artifactInstance]
        }
    }

    def update = {
        def artifactInstance = getArtifactClass().get(params.id)
        if (artifactInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (artifactInstance.version > version) {
                    
                    artifactInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'designArtifact.label', default: 'Artifact')] as Object[], "Another user has updated this Artifact while you were editing")
                    render(view: "edit", model: [artifactInstance: artifactInstance])
                    return
                }
            }
            def artHistory = artifactService.prepArtifactHistoryForUpdate(artifactInstance)
            
            artifactInstance.properties = params

            artifactInstance = artifactService.prepArtifactForUpdate(artifactInstance)
            
            if (!artifactInstance.hasErrors() && saveArtifactAndArtifactHistory(artifactInstance, artHistory)) {
            	flash.message = "${message(code: 'default.updated.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), artifactInstance.id])}"
                redirect(action: "index", id: artifactInstance.id)
            }
            else {

                render(view: "edit", model: [artifactInstance: artifactInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), params.id])}"
            redirect(action: "list")
        }
    }

    def rollback = {
    		def artifactHistoryRollbackInstance = ArtifactHistory.get(new Long(params?.id))
    		def artifactInstance = artifactHistoryRollbackInstance?.artifact;
    		
            if (artifactInstance) {

            	def artifactHistory = artifactService.prepArtifactHistoryForUpdate(artifactInstance)            	
            	
    	        artifactInstance.properties = artifactHistoryRollbackInstance.properties
                
                artifactInstance = artifactService.prepArtifactForUpdate(artifactInstance)
                
                if (!artifactInstance.hasErrors() && saveArtifactAndArtifactHistory(artifactInstance, artifactHistory)) {
                	flash.message = "${message(code: 'default.updated.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), artifactInstance.id])}"
                    redirect(action: "index", id: artifactInstance.id)
                }
                else {

                	redirect(action: "index", id: artifactInstance.id)
                }
            }
            else {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), params.id])}"
                redirect(controller:nh.getControllerName(sh.getProject()), action: "index", id:sh.getProjectId())
            }
        }    
    
    private boolean saveArtifactAndArtifactHistory(Artifact artifactInstance, ArtifactHistory artHistory){
    	boolean saveResults = false
    	if (artHistory != null) {
    		saveResults = artifactInstance.save() && artHistory.save(flush: true)
    	} else {
    		saveResults = artifactInstance.save(flush: true)
    	}
    	return saveResults
    }    
    
    def delete = {
        def artifactInstance = getArtifactClass().get(params.id)
        if (artifactInstance) {
            try {
                artifactInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), params.id])}"
            redirect(action: "list")
        }
    }
}
