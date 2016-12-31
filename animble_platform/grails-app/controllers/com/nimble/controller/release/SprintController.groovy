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

package com.nimble.controller.release

import com.nimble.controller.NimbleController
import com.nimble.domain.release.Sprint
import com.nimble.service.release.SprintService
import com.nimble.controller.project.AgileProjectController


class SprintController extends NimbleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def sprintService
    
    def index = {
        render(view: "index")
    }

    def menu_tree = {
        ArrayList menuTree = Sprint.executeQuery("select new map(p.id,p.sprintName) from Sprint p where p.agileProject.id = :agileProjectId order by p.sprintStartDate,p.sprintEndDate", [agileProjectId:Long.parseLong(params.id)] )
	        
        [sprintInstanceList: menuTree]        
        
    }

    def landing = {
        render(view: "landing")
    }

    def menu = {
        render(view: "menu")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 100, 100)
        [sprintInstanceList: Sprint.list(params), sprintInstanceTotal: Sprint.count()]
    }

    def create = {
        def sprintInstance = new Sprint()
        sprintInstance.properties = params
        return [sprintInstance: sprintInstance]
    }

    def save = {
        def sprintInstance = new Sprint(params)

        sprintInstance = sprintService.prepSprintForSave(sprintInstance)

        if (!sprintInstance.hasErrors() && sprintInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'sprint.label', default: 'Sprint'), sprintInstance.id])}"
            redirect(controller:"agileProject", action: "index", params:[id: sprintInstance.agileProject.id,tab: viewTabs.PROJECT_SPRINTS])
        }
        else {
            render(view: "create", model: [sprintInstance: sprintInstance, project_id:sprintInstance?.agileProject?.id])
        }
    }

    def show = {
        def sprintInstance = Sprint.get(params.id)
        def viewOnly = false
        if (params.viewOnly != null) {viewOnly = params.viewOnly}
        if (!sprintInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sprintInstance: sprintInstance, viewOnly: viewOnly]
        }
    }

	def show_inc = {
		show()
	}

	def show_viewonly = {
		show()
	}

    def edit = {
        def sprintInstance = Sprint.get(params.id)
        if (!sprintInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sprintInstance: sprintInstance]
        }
    }

    def update = {
        def sprintInstance = Sprint.get(params.id)
        if (sprintInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sprintInstance.version > version) {
                    
                    sprintInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sprint.label', default: 'Sprint')] as Object[], "Another user has updated this Sprint while you were editing")
                    render(view: "edit", model: [sprintInstance: sprintInstance])
                    return
                }
            }
            sprintInstance.properties = params

            sprintInstance = sprintService.prepSprintForUpdate(sprintInstance)
            
            if (!sprintInstance.hasErrors() && sprintInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sprint.label', default: 'Sprint'), sprintInstance.id])}"
                redirect(controller:"agileProject", action: "index", params:[id: sprintInstance.agileProject.id,tab: viewTabs.PROJECT_SPRINTS])
            }
            else {
                render(view: "edit", model: [sprintInstance: sprintInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sprintInstance = Sprint.get(params.id)
        if (sprintInstance) {
            try {
                sprintInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])}"
            redirect(action: "list")
        }
    }
}
