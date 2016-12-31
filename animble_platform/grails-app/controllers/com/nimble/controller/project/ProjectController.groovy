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

package com.nimble.controller.project

import com.nimble.domain.project.Project
import com.nimble.service.project.ProjectService
import com.nimble.controller.NimbleController

class ProjectController extends NimbleController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    public getNewInstance(){return new Project();}
    public getNewInstanceWithParams(){return new Project(params);}
    public getDomainClass(){return Project;}

    def projectService
    
    def index = {
        //redirect(action: "list", params: params)
        landing()
    }

    def menu_tree = {
        String rootQuery = "select new map(p.id,p.projectName,p.class) from Project p order by p.projectName"
        ArrayList menuTree = Project.executeQuery(rootQuery)
	        
        [projectInstanceList: menuTree]        
        
    }

    def landing = {
        //render(view: "landing")
        show()
    }

    def menu = {
        render(view: "menu")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 100, 100)
        [projectInstanceList: getDomainClass().list(params), projectInstanceTotal: getDomainClass().count()]
    }

    def create = {
        def projectInstance = getNewInstance()
        projectInstance.properties = params
        return [projectInstance: projectInstance]
    }

    def save = {
        def projectInstance = getNewInstanceWithParams()

        projectInstance = projectService.prepProjectForSave(projectInstance)

        if (!projectInstance.hasErrors() && projectInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])}"
            redirect(action: "index", id: projectInstance.id)
        }
        else {
            render(view: "create", model: [projectInstance: projectInstance])
        }
    }

    def show = {
        def projectInstance = getDomainClass().get(params.id)
        def viewOnly = false
        if (params.viewOnly != null) {viewOnly = params.viewOnly}
        if (!projectInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
        else {
	    	sh.pushCurProject(projectInstance)
            [projectInstance: projectInstance, viewOnly: viewOnly]
        }
    }

	def show_inc = {
		show()
	}

	def show_viewonly = {
		show()
	}

    def edit = {
        def projectInstance = getDomainClass().get(params.id)
        if (!projectInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [projectInstance: projectInstance]
        }
    }

    def update = {
        def projectInstance = getDomainClass().get(params.id)
        if (projectInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (projectInstance.version > version) {
                    
                    projectInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'project.label', default: 'Project')] as Object[], "Another user has updated this Project while you were editing")
                    render(view: "edit", model: [projectInstance: projectInstance])
                    return
                }
            }
            projectInstance.properties = params

            projectInstance = projectService.prepProjectForUpdate(projectInstance)
            
            if (!projectInstance.hasErrors() && projectInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])}"
                redirect(action: "index", id: projectInstance.id)
            }
            else {
                render(view: "edit", model: [projectInstance: projectInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def projectInstance = getDomainClass().get(params.id)
        if (projectInstance) {
            try {
                projectInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
    }
}
