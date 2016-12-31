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
import com.nimble.domain.release.Release
import com.nimble.service.release.ReleaseService
//import com.nimble.controller.project.AgileProjectController


class ReleaseController extends NimbleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def releaseService
    
    def index = {
        render(view: "index")
    }

    def menu_tree = {
        ArrayList menuTree = Release.executeQuery("select new map(r.id,r.releaseName) from Release r where r.project.id = :projectId order by r.releaseDate", [projectId:sh.getProjectId()] )
	        
        [releaseInstanceList: menuTree]        
        
    }

    def landing = {
        render(view: "landing")
    }

    def menu = {
        render(view: "menu")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 100, 100)
        [releaseInstanceList: Release.list(params), releaseInstanceTotal: Release.count()]
    }

    def create = {
        def releaseInstance = new Release()
        releaseInstance.properties = params
        return [releaseInstance: releaseInstance]
    }

    def save = {
        def releaseInstance = new Release(params)

        releaseInstance = releaseService.prepReleaseForSave(releaseInstance)

        if (!releaseInstance.hasErrors() && releaseInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'release.label', default: 'Release'), releaseInstance.id])}"
            redirect(controller:sh.getProject()?.projectType, action: "index", params:[id: releaseInstance.project.id,tab: viewTabs.PROJECT_RELEASES])
        }
        else {
            render(view: "create", model: [releaseInstance: releaseInstance, project_id:releaseInstance?.project?.id])
        }
    }

    def show = {
        def releaseInstance = Release.get(params.id)
        def viewOnly = false
        if (params.viewOnly != null) {viewOnly = params.viewOnly}
        if (!releaseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'release.label', default: 'Release'), params.id])}"
            redirect(action: "list")
        }
        else {
            [releaseInstance: releaseInstance, viewOnly: viewOnly]
        }
    }

	def show_inc = {
		show()
	}

	def show_viewonly = {
		show()
	}

    def edit = {
        def releaseInstance = Release.get(params.id)
        if (!releaseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'release.label', default: 'Release'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [releaseInstance: releaseInstance]
        }
    }

    def update = {
        def releaseInstance = Release.get(params.id)
        if (releaseInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (releaseInstance.version > version) {
                    
                    releaseInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'release.label', default: 'Release')] as Object[], "Another user has updated this Release while you were editing")
                    render(view: "edit", model: [releaseInstance: releaseInstance])
                    return
                }
            }
            releaseInstance.properties = params

            releaseInstance = releaseService.prepReleaseForUpdate(releaseInstance)
            
            if (!releaseInstance.hasErrors() && releaseInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'release.label', default: 'Release'), releaseInstance.id])}"
                redirect(controller:sh.getProject()?.projectType, action: "index", params:[id: releaseInstance.project.id,tab: viewTabs.PROJECT_RELEASES])
            }
            else {
                render(view: "edit", model: [releaseInstance: releaseInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'release.label', default: 'Release'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def releaseInstance = Release.get(params.id)
        if (releaseInstance) {
            try {
                releaseInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'release.label', default: 'Release'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'release.label', default: 'Release'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'release.label', default: 'Release'), params.id])}"
            redirect(action: "list")
        }
    }
}
