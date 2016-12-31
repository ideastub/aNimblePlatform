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

package com.nimble.controller.security

import com.nimble.domain.security.ApplicationUserGroup
import com.nimble.service.security.ApplicationUserGroupService

class ApplicationUserGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        render(view: "index")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [applicationUserGroupInstanceList: ApplicationUserGroup.list(params), applicationUserGroupInstanceTotal: ApplicationUserGroup.count()]
    }

	def create_inc = {
		create()
	}

    def create = {
        def applicationUserGroupInstance = new ApplicationUserGroup()
        applicationUserGroupInstance.properties = params
        return [applicationUserGroupInstance: applicationUserGroupInstance]
    }

    def save = {
        def applicationUserGroupInstance = new ApplicationUserGroup(params)

        def applicationUserGroupService = new ApplicationUserGroupService()
        applicationUserGroupInstance = applicationUserGroupService.prepApplicationUserGroupForSave(applicationUserGroupInstance)

        if (applicationUserGroupInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup'), applicationUserGroupInstance.id])}"
            redirect(action: "show", id: applicationUserGroupInstance.id)
        }
        else {
            render(view: "create", model: [applicationUserGroupInstance: applicationUserGroupInstance])
        }
    }

	def show_inc = {
		show()
	}

    def show = {
        def applicationUserGroupInstance = ApplicationUserGroup.get(params.id)
        if (!applicationUserGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            [applicationUserGroupInstance: applicationUserGroupInstance]
        }
    }

	def edit_inc = {
		edit()
	}

    def edit = {
        def applicationUserGroupInstance = ApplicationUserGroup.get(params.id)
        if (!applicationUserGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [applicationUserGroupInstance: applicationUserGroupInstance]
        }
    }

    def update = {
        def applicationUserGroupInstance = ApplicationUserGroup.get(params.id)
        if (applicationUserGroupInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (applicationUserGroupInstance.version > version) {
                    
                    applicationUserGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup')] as Object[], "Another user has updated this ApplicationUserGroup while you were editing")
                    render(view: "edit", model: [applicationUserGroupInstance: applicationUserGroupInstance])
                    return
                }
            }
            applicationUserGroupInstance.properties = params
            def applicationUserGroupService = new ApplicationUserGroupService()
            applicationUserGroupInstance = applicationUserGroupService.prepApplicationUserGroupForUpdate(applicationUserGroupInstance)                        
            
            if (!applicationUserGroupInstance.hasErrors() && applicationUserGroupInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup'), applicationUserGroupInstance.id])}"
                redirect(action: "show", id: applicationUserGroupInstance.id)
            }
            else {
                render(view: "edit", model: [applicationUserGroupInstance: applicationUserGroupInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def applicationUserGroupInstance = ApplicationUserGroup.get(params.id)
        if (applicationUserGroupInstance) {
            try {
                applicationUserGroupInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup'), params.id])}"
            redirect(action: "list")
        }
    }
}
